//
//  PXAlertView+Customization.m
//  PXAlertViewDemo
//
//  Created by Michal Zygar on 21.10.2013.
//  Copyright (c) 2013 panaxiom. All rights reserved.
//

#import "PXAlertView+Customization.h"
#import <objc/runtime.h>

static NSString * const kCancelBGKey = @"cancelBGKey";
static NSString * const kOtherBGKey = @"otherBGKey";

@interface PXAlertView ()

@property (nonatomic) UIView *backgroundView;
@property (nonatomic) UIView *alertView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) UIButton *cancelButton;
@property (nonatomic) UIButton *otherButton;

@end

@implementation PXAlertView (Customization)

- (void)setWindowTintColor:(UIColor *)color
{
    self.backgroundView.backgroundColor = color;
}

- (void)setBackgroundColor:(UIColor *)color
{
    self.alertView.backgroundColor = color;
}

- (void)setTitleColor:(UIColor *)color
{
    self.titleLabel.textColor = color;
}

- (void)setTitleFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

- (void)setMessageColor:(UIColor *)color
{
    self.messageLabel.textColor = color;
}

- (void)setMessageFont:(UIFont *)font
{
    self.messageLabel.font = font;
}

#pragma mark -
#pragma mark Buttons Customization
- (void)setBackgroundColorForButton:(id)sender
{
    if (sender == self.cancelButton && self.cancelButtonBackgroundColor) {
        self.cancelButton.backgroundColor = self.cancelButtonBackgroundColor;
    } else if (sender == self.otherButton && self.otherButtonBackgroundColor) {
        self.otherButton.backgroundColor = self.otherButtonBackgroundColor;
    } else {
        [sender setBackgroundColor:[UIColor colorWithRed:94/255.0 green:196/255.0 blue:221/255.0 alpha:1]];
    }
}

- (void)setCancelButtonBackgroundColor:(UIColor *)color
{
    objc_setAssociatedObject(self, (__bridge const void *)(kCancelBGKey), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)cancelButtonBackgroundColor
{
    return objc_getAssociatedObject( self, (__bridge const void *)(kCancelBGKey) );
}

- (void)setOtherButtonBackgroundColor:(UIColor *)color
{
    objc_setAssociatedObject(self, (__bridge const void *)(kOtherBGKey), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)otherButtonBackgroundColor
{
    return objc_getAssociatedObject( self, (__bridge const void *)(kOtherBGKey) );
}

@end