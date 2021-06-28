Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4483B578D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 04:56:44 +0200 (CEST)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxhRy-0008HI-Sv
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 22:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxhR1-00074z-PE
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 22:55:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxhQy-0000QS-6z
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 22:55:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u19so2388000plc.3
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1WB6vHlwIRt/icDOSnqfETo7YEk0oU2G55sykH+wJc=;
 b=YokL2MDIut33N99ike79Ehx7A84n+QpH/H5nl1ccT869KIWg22uKqsXZdYU75bRhPC
 ubTseQFNshTEP0C9Cez1IByhHZPdyGH5g7RCK8Y84iMC0Bb2fTyJbq3kzdNAiZkiZInG
 kVtRHCmkRizlcXICz1MqQI+TYP7dJCK3rLZ1oeeEM6Ao92z8KuidcL13d7/DNU50wfvW
 y1wkQY5DCWieVnZP9PrY+t9sWnQor+8D+4+vQCXm+PUhkOmoVJt2xAIc3vGBRk2vE9CC
 ncm3Ol/u7brEa+9TPDxZf3ugURXzLeekk3IomDdYc/JorbUl5xigfkwNCcTbGwcRjaoI
 ECbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1WB6vHlwIRt/icDOSnqfETo7YEk0oU2G55sykH+wJc=;
 b=uDntw+KH5P4IaFAXsQWjYrSE4m0Rf0ZrctErys77d9Q/f6w09cqVn8ES7i4QJ1PgNd
 K4hcPPI0SrVBm0sMOb8uZ4bkBukr10MdfTlDFNK0KS2/KFupyg6ZKS9BjsvmyNkLuK3+
 OgCagYiU8UGP6VLMbsZkPOFaabC+yuRwPdGZQuKIy0NnM/P8ovZIuGFK3F7dlU5EhOIQ
 YWj3SyRrkq+zl6FvrGrafMhfZ6E7R7fz214goAnE4jhYFaKbxG4amg4465MVq4aQR++4
 syYdhZiBJ1bCrtb+ofIY19aAqlMJ2rk5LCCSBy1OeOVsJw1nf5+6hcnQgTsIkUQTwBvQ
 X4WA==
X-Gm-Message-State: AOAM530lQm0/U/cvfD81G3gQNJWPFXj0PeJ4NbY5lOt4hAJIHQyluXMf
 ayCHB9uqWF0CRRqDL4skXySd4tbPKaXZMA==
X-Google-Smtp-Source: ABdhPJw3EJl40UvaaAZI4PNy7W3QXU2UVAb2KGp4wDtj4vkdOqftNJwne+NdA1qUSoJO9QupLfJ6Iw==
X-Received: by 2002:a17:90a:1641:: with SMTP id
 x1mr25355483pje.160.1624848937865; 
 Sun, 27 Jun 2021 19:55:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:196f:aeac:cb2e:6936])
 by smtp.gmail.com with ESMTPSA id a25sm12105074pff.54.2021.06.27.19.55.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Jun 2021 19:55:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Use NSWindow's ability to resize
Date: Mon, 28 Jun 2021 11:55:24 +0900
Message-Id: <20210628025524.30600-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change brings two new features:
- The window will be resizable if "Zoom To Fit" is eanbled
- The window can be made full screen by clicking full screen button
  provided by the platform. (The left-top green button.)

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 542 ++++++++++++++++++++++++-----------------------------
 1 file changed, 249 insertions(+), 293 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6cc1d15baba..e54c69e69f1 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -94,12 +94,10 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static DisplayChangeListener dcl = {
     .ops = &dcl_ops,
 };
-static int last_buttons;
 static int cursor_hide = 1;
 
 static int gArgc;
 static char **gArgv;
-static bool stretch_video;
 static NSTextField *pauseLabel;
 static NSArray * supportedImageFileTypes;
 
@@ -302,20 +300,17 @@ static void handleAnyDeviceErrors(Error * err)
 */
 @interface QemuCocoaView : NSView
 {
+    NSTrackingArea *trackingArea;
     QEMUScreen screen;
-    NSWindow *fullScreenWindow;
-    float cx,cy,cw,ch,cdx,cdy;
     pixman_image_t *pixman_image;
     QKbdState *kbd;
     BOOL isMouseGrabbed;
-    BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
     CFMachPortRef eventsTap;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
 - (void) ungrabMouse;
-- (void) toggleFullScreen:(id)sender;
 - (void) setFullGrab:(id)sender;
 - (void) handleMonitorInput:(NSEvent *)event;
 - (bool) handleEvent:(NSEvent *)event;
@@ -332,8 +327,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
 - (BOOL) isSwapOptionCommandEnabled;
-- (float) cdx;
-- (float) cdy;
 - (QEMUScreen) gscreen;
 - (void) raiseAllKeys;
 @end
@@ -391,46 +384,43 @@ - (BOOL) isOpaque
     return YES;
 }
 
-- (BOOL) screenContainsPoint:(NSPoint) p
+- (void) removeTrackingRect
 {
-    return (p.x > -1 && p.x < screen.width && p.y > -1 && p.y < screen.height);
+    if (trackingArea) {
+        [self removeTrackingArea:trackingArea];
+        [trackingArea release];
+        trackingArea = nil;
+    }
 }
 
-/* Get location of event and convert to virtual screen coordinate */
-- (CGPoint) screenLocationOfEvent:(NSEvent *)ev
+- (void) frameUpdated
 {
-    NSWindow *eventWindow = [ev window];
-    // XXX: Use CGRect and -convertRectFromScreen: to support macOS 10.10
-    CGRect r = CGRectZero;
-    r.origin = [ev locationInWindow];
-    if (!eventWindow) {
-        if (!isFullscreen) {
-            return [[self window] convertRectFromScreen:r].origin;
-        } else {
-            CGPoint locationInSelfWindow = [[self window] convertRectFromScreen:r].origin;
-            CGPoint loc = [self convertPoint:locationInSelfWindow fromView:nil];
-            if (stretch_video) {
-                loc.x /= cdx;
-                loc.y /= cdy;
-            }
-            return loc;
-        }
-    } else if ([[self window] isEqual:eventWindow]) {
-        if (!isFullscreen) {
-            return r.origin;
-        } else {
-            CGPoint loc = [self convertPoint:r.origin fromView:nil];
-            if (stretch_video) {
-                loc.x /= cdx;
-                loc.y /= cdy;
-            }
-            return loc;
-        }
-    } else {
-        return [[self window] convertRectFromScreen:[eventWindow convertRectToScreen:r]].origin;
+    [self removeTrackingRect];
+
+    if ([self window]) {
+        NSTrackingAreaOptions options = NSTrackingActiveInKeyWindow |
+                                        NSTrackingMouseEnteredAndExited |
+                                        NSTrackingMouseMoved;
+        trackingArea = [[NSTrackingArea alloc] initWithRect:[self frame]
+                                                    options:options
+                                                      owner:self
+                                                   userInfo:nil];
+        [self addTrackingArea:trackingArea];
+        [self updateUIInfo];
     }
 }
 
+- (void) viewDidMoveToWindow
+{
+    [self resizeWindow];
+    [self frameUpdated];
+}
+
+- (void) viewWillMoveToWindow:(NSWindow *)newWindow
+{
+    [self removeTrackingRect];
+}
+
 - (void) hideCursor
 {
     if (!cursor_hide) {
@@ -493,13 +483,14 @@ - (void) drawRect:(NSRect) rect
         int i;
         CGImageRef clipImageRef;
         CGRect clipRect;
+        CGFloat d = (CGFloat)h / [self frame].size.height;
 
         [self getRectsBeingDrawn:&rectList count:&rectCount];
         for (i = 0; i < rectCount; i++) {
-            clipRect.origin.x = rectList[i].origin.x / cdx;
-            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) / cdy;
-            clipRect.size.width = rectList[i].size.width / cdx;
-            clipRect.size.height = rectList[i].size.height / cdy;
+            clipRect.origin.x = rectList[i].origin.x * d;
+            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) * d;
+            clipRect.size.width = rectList[i].size.width * d;
+            clipRect.size.height = rectList[i].size.height * d;
             clipImageRef = CGImageCreateWithImageInRect(
                                                         imageRef,
                                                         clipRect
@@ -512,36 +503,34 @@ - (void) drawRect:(NSRect) rect
     }
 }
 
-- (void) setContentDimensions
+- (NSSize) fixZoomedFullScreenSize:(NSSize)proposedSize
 {
-    COCOA_DEBUG("QemuCocoaView: setContentDimensions\n");
+    NSSize size;
 
-    if (isFullscreen) {
-        cdx = [[NSScreen mainScreen] frame].size.width / (float)screen.width;
-        cdy = [[NSScreen mainScreen] frame].size.height / (float)screen.height;
+    size.width = (CGFloat)screen.width * proposedSize.height;
+    size.height = (CGFloat)screen.height * proposedSize.width;
 
-        /* stretches video, but keeps same aspect ratio */
-        if (stretch_video == true) {
-            /* use smallest stretch value - prevents clipping on sides */
-            if (MIN(cdx, cdy) == cdx) {
-                cdy = cdx;
-            } else {
-                cdx = cdy;
-            }
-        } else {  /* No stretching */
-            cdx = cdy = 1;
-        }
-        cw = screen.width * cdx;
-        ch = screen.height * cdy;
-        cx = ([[NSScreen mainScreen] frame].size.width - cw) / 2.0;
-        cy = ([[NSScreen mainScreen] frame].size.height - ch) / 2.0;
+    if (size.width < size.height) {
+        size.width /= screen.height;
+        size.height = proposedSize.height;
     } else {
-        cx = 0;
-        cy = 0;
-        cw = screen.width;
-        ch = screen.height;
-        cdx = 1.0;
-        cdy = 1.0;
+        size.width = proposedSize.width;
+        size.height /= screen.width;
+    }
+
+    return size;
+}
+
+- (void) resizeWindow
+{
+    [[self window] setContentAspectRatio:NSMakeSize(screen.width, screen.height)];
+
+    if (([[self window] styleMask] & NSWindowStyleMaskResizable) == 0) {
+        [[self window] setContentSize:NSMakeSize(screen.width, screen.height)];
+        [[self window] center];
+    } else if (([[self window] styleMask] & NSWindowStyleMaskFullScreen) != 0) {
+        [[self window] setContentSize:[self fixZoomedFullScreenSize:[[[self window] screen] frame].size]];
+        [[self window] center];
     }
 }
 
@@ -560,7 +549,12 @@ - (void) updateUIInfo
         NSSize screenSize = [[[self window] screen] frame].size;
         CGSize screenPhysicalSize = CGDisplayScreenSize(display);
 
-        frameSize = isFullscreen ? screenSize : [self frame].size;
+        if (([[self window] styleMask] & NSWindowStyleMaskFullScreen) == 0) {
+            frameSize = [self frame].size;
+        } else {
+            frameSize = screenSize;
+        }
+
         info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
         info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
     } else {
@@ -577,31 +571,19 @@ - (void) updateUIInfo
     dpy_set_ui_info(dcl.con, &info);
 }
 
-- (void)viewDidMoveToWindow
-{
-    [self updateUIInfo];
-}
-
 - (void) switchSurface:(pixman_image_t *)image
 {
     COCOA_DEBUG("QemuCocoaView: switchSurface\n");
 
     int w = pixman_image_get_width(image);
     int h = pixman_image_get_height(image);
-    /* cdx == 0 means this is our very first surface, in which case we need
-     * to recalculate the content dimensions even if it happens to be the size
-     * of the initial empty window.
-     */
-    bool isResize = (w != screen.width || h != screen.height || cdx == 0.0);
 
-    int oldh = screen.height;
-    if (isResize) {
+    if (w != screen.width || h != screen.height) {
         // Resize before we trigger the redraw, or we'll redraw at the wrong size
         COCOA_DEBUG("switchSurface: new size %d x %d\n", w, h);
         screen.width = w;
         screen.height = h;
-        [self setContentDimensions];
-        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
+        [self resizeWindow];
     }
 
     // update screenBuffer
@@ -610,51 +592,6 @@ - (void) switchSurface:(pixman_image_t *)image
     }
 
     pixman_image = image;
-
-    // update windows
-    if (isFullscreen) {
-        [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen] frame]];
-        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:NO animate:NO];
-    } else {
-        if (qemu_name)
-            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
-        [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:YES animate:NO];
-    }
-
-    if (isResize) {
-        [normalWindow center];
-    }
-}
-
-- (void) toggleFullScreen:(id)sender
-{
-    COCOA_DEBUG("QemuCocoaView: toggleFullScreen\n");
-
-    if (isFullscreen) { // switch from fullscreen to desktop
-        isFullscreen = FALSE;
-        [self ungrabMouse];
-        [self setContentDimensions];
-        [fullScreenWindow close];
-        [normalWindow setContentView: self];
-        [normalWindow makeKeyAndOrderFront: self];
-        [NSMenu setMenuBarVisible:YES];
-    } else { // switch from desktop to fullscreen
-        isFullscreen = TRUE;
-        [normalWindow orderOut: nil]; /* Hide the window */
-        [self grabMouse];
-        [self setContentDimensions];
-        [NSMenu setMenuBarVisible:NO];
-        fullScreenWindow = [[NSWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame]
-            styleMask:NSWindowStyleMaskBorderless
-            backing:NSBackingStoreBuffered
-            defer:NO];
-        [fullScreenWindow setAcceptsMouseMovedEvents: YES];
-        [fullScreenWindow setHasShadow:NO];
-        [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
-        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
-        [[fullScreenWindow contentView] addSubview: self];
-        [fullScreenWindow makeKeyAndOrderFront:self];
-    }
 }
 
 - (void) setFullGrab:(id)sender
@@ -783,12 +720,7 @@ - (bool) handleEventLocked:(NSEvent *)event
 {
     /* Return true if we handled the event, false if it should be given to OSX */
     COCOA_DEBUG("QemuCocoaView: handleEvent\n");
-    int buttons = 0;
     int keycode = 0;
-    bool mouse_event = false;
-    static bool switched_to_fullscreen = false;
-    // Location of event in virtual screen coordinates
-    NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
 
     /*
@@ -868,25 +800,25 @@ - (bool) handleEventLocked:(NSEvent *)event
                     if (!!(modifiers & NSEventModifierFlagShift)) {
                         [self toggleKey:Q_KEY_CODE_SHIFT];
                     }
-                    break;
+                    return true;
 
                 case kVK_RightShift:
                     if (!!(modifiers & NSEventModifierFlagShift)) {
                         [self toggleKey:Q_KEY_CODE_SHIFT_R];
                     }
-                    break;
+                    return true;
 
                 case kVK_Control:
                     if (!!(modifiers & NSEventModifierFlagControl)) {
                         [self toggleKey:Q_KEY_CODE_CTRL];
                     }
-                    break;
+                    return true;
 
                 case kVK_RightControl:
                     if (!!(modifiers & NSEventModifierFlagControl)) {
                         [self toggleKey:Q_KEY_CODE_CTRL_R];
                     }
-                    break;
+                    return true;
 
                 case kVK_Option:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
@@ -896,7 +828,7 @@ - (bool) handleEventLocked:(NSEvent *)event
                             [self toggleKey:Q_KEY_CODE_ALT];
                         }
                     }
-                    break;
+                    return true;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
@@ -906,7 +838,7 @@ - (bool) handleEventLocked:(NSEvent *)event
                             [self toggleKey:Q_KEY_CODE_ALT_R];
                         }
                     }
-                    break;
+                    return true;
 
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
@@ -918,7 +850,7 @@ - (bool) handleEventLocked:(NSEvent *)event
                             [self toggleKey:Q_KEY_CODE_META_L];
                         }
                     }
-                    break;
+                    return true;
 
                 case kVK_RightCommand:
                     if (isMouseGrabbed &&
@@ -929,21 +861,16 @@ - (bool) handleEventLocked:(NSEvent *)event
                             [self toggleKey:Q_KEY_CODE_META_R];
                         }
                     }
-                    break;
+                    return true;
+
+                default:
+                    return true;
             }
-            break;
         case NSEventTypeKeyDown:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
 
             // forward command key combos to the host UI unless the mouse is grabbed
             if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
-                /*
-                 * Prevent the command key from being stuck down in the guest
-                 * when using Command-F to switch to full screen mode.
-                 */
-                if (keycode == Q_KEY_CODE_F) {
-                    switched_to_fullscreen = true;
-                }
                 return false;
             }
 
@@ -974,7 +901,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             } else {
                 [self handleMonitorInput: event];
             }
-            break;
+            return true;
         case NSEventTypeKeyUp:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
 
@@ -987,67 +914,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             if (qemu_console_is_graphic(NULL)) {
                 qkbd_state_key_event(kbd, keycode, false);
             }
-            break;
-        case NSEventTypeMouseMoved:
-            if (isAbsoluteEnabled) {
-                // Cursor re-entered into a window might generate events bound to screen coordinates
-                // and `nil` window property, and in full screen mode, current window might not be
-                // key window, where event location alone should suffice.
-                if (![self screenContainsPoint:p] || !([[self window] isKeyWindow] || isFullscreen)) {
-                    if (isMouseGrabbed) {
-                        [self ungrabMouse];
-                    }
-                } else {
-                    if (!isMouseGrabbed) {
-                        [self grabMouse];
-                    }
-                }
-            }
-            mouse_event = true;
-            break;
-        case NSEventTypeLeftMouseDown:
-            buttons |= MOUSE_EVENT_LBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeRightMouseDown:
-            buttons |= MOUSE_EVENT_RBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeOtherMouseDown:
-            buttons |= MOUSE_EVENT_MBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeLeftMouseDragged:
-            buttons |= MOUSE_EVENT_LBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeRightMouseDragged:
-            buttons |= MOUSE_EVENT_RBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeOtherMouseDragged:
-            buttons |= MOUSE_EVENT_MBUTTON;
-            mouse_event = true;
-            break;
-        case NSEventTypeLeftMouseUp:
-            mouse_event = true;
-            if (!isMouseGrabbed && [self screenContainsPoint:p]) {
-                /*
-                 * In fullscreen mode, the window of cocoaView may not be the
-                 * key window, therefore the position relative to the virtual
-                 * screen alone will be sufficient.
-                 */
-                if(isFullscreen || [[self window] isKeyWindow]) {
-                    [self grabMouse];
-                }
-            }
-            break;
-        case NSEventTypeRightMouseUp:
-            mouse_event = true;
-            break;
-        case NSEventTypeOtherMouseUp:
-            mouse_event = true;
-            break;
+            return true;
         case NSEventTypeScrollWheel:
             /*
              * Send wheel events to the guest regardless of window focus.
@@ -1061,7 +928,7 @@ - (bool) handleEventLocked:(NSEvent *)event
              */
             if ([event deltaY] != 0) {
             /* Determine if this is a scroll up or scroll down event */
-                buttons = ([event deltaY] > 0) ?
+                int buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
                 qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
@@ -1072,62 +939,124 @@ - (bool) handleEventLocked:(NSEvent *)event
              * Since deltaY also reports scroll wheel events we prevent mouse
              * movement code from executing.
              */
-            mouse_event = false;
-            break;
+            return true;
         default:
             return false;
     }
+}
 
-    if (mouse_event) {
-        /* Don't send button events to the guest unless we've got a
-         * mouse grab or window focus. If we have neither then this event
-         * is the user clicking on the background window to activate and
-         * bring us to the front, which will be done by the sendEvent
-         * call below. We definitely don't want to pass that click through
-         * to the guest.
-         */
-        if ((isMouseGrabbed || [[self window] isKeyWindow]) &&
-            (last_buttons != buttons)) {
-            static uint32_t bmap[INPUT_BUTTON__MAX] = {
-                [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
-                [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
-                [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON
-            };
-            qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
-            last_buttons = buttons;
-        }
-        if (isMouseGrabbed) {
-            if (isAbsoluteEnabled) {
-                /* Note that the origin for Cocoa mouse coords is bottom left, not top left.
-                 * The check on screenContainsPoint is to avoid sending out of range values for
-                 * clicks in the titlebar.
-                 */
-                if ([self screenContainsPoint:p]) {
-                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x, 0, screen.width);
-                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
-                }
-            } else {
-                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
-                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
-            }
+- (void) handleMouseEvent:(NSEvent *)event
+{
+    if (!isMouseGrabbed) {
+        return;
+    }
+
+    with_iothread_lock(^{
+        if (isAbsoluteEnabled) {
+            CGFloat d = (CGFloat)screen.height / [self frame].size.height;
+            NSPoint p = [event locationInWindow];
+            // Note that the origin for Cocoa mouse coords is bottom left, not top left.
+            qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x * d, 0, screen.width);
+            qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y * d, 0, screen.height);
         } else {
-            return false;
+            CGFloat d = (CGFloat)screen.height / [self convertSizeToBacking:[self frame].size].height;
+            qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, [event deltaX] * d);
+            qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, [event deltaY] * d);
         }
+
         qemu_input_event_sync();
+    });
+}
+
+- (void) handleMouseEvent:(NSEvent *)event button:(InputButton)button down:(bool)down
+{
+    if (!isMouseGrabbed) {
+        return;
     }
-    return true;
+
+    with_iothread_lock(^{
+        qemu_input_queue_btn(dcl.con, button, down);
+    });
+
+    [self handleMouseEvent:event];
+}
+
+- (void) mouseExited:(NSEvent *)event
+{
+    if (isAbsoluteEnabled && isMouseGrabbed) {
+        [self ungrabMouse];
+    }
+}
+
+- (void) mouseEntered:(NSEvent *)event
+{
+    if (isAbsoluteEnabled && !isMouseGrabbed) {
+        [self grabMouse];
+    }
+}
+
+- (void) mouseMoved:(NSEvent *)event
+{
+    [self handleMouseEvent:event];
+}
+
+- (void) mouseDown:(NSEvent *)event
+{
+    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:true];
+}
+
+- (void) rightMouseDown:(NSEvent *)event
+{
+    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:true];
+}
+
+- (void) otherMouseDown:(NSEvent *)event
+{
+    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:true];
+}
+
+- (void) mouseDragged:(NSEvent *)event
+{
+    [self handleMouseEvent:event];
+}
+
+- (void) rightMouseDragged:(NSEvent *)event
+{
+    [self handleMouseEvent:event];
+}
+
+- (void) otherMouseDragged:(NSEvent *)event
+{
+    [self handleMouseEvent:event];
+}
+
+- (void) mouseUp:(NSEvent *)event
+{
+    if (!isMouseGrabbed) {
+        [self grabMouse];
+    }
+
+    [self handleMouseEvent:event button:INPUT_BUTTON_LEFT down:false];
+}
+
+- (void) rightMouseUp:(NSEvent *)event
+{
+    [self handleMouseEvent:event button:INPUT_BUTTON_RIGHT down:false];
+}
+
+- (void) otherMouseUp:(NSEvent *)event
+{
+    [self handleMouseEvent:event button:INPUT_BUTTON_MIDDLE down:false];
 }
 
 - (void) grabMouse
 {
     COCOA_DEBUG("QemuCocoaView: grabMouse\n");
 
-    if (!isFullscreen) {
-        if (qemu_name)
-            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
-        else
-            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
-    }
+    if (qemu_name)
+        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
+    else
+        [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
     [self hideCursor];
     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
     isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
@@ -1137,15 +1066,14 @@ - (void) ungrabMouse
 {
     COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
 
-    if (!isFullscreen) {
-        if (qemu_name)
-            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
-        else
-            [normalWindow setTitle:@"QEMU"];
-    }
+    if (qemu_name)
+        [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
+    else
+        [normalWindow setTitle:@"QEMU"];
     [self unhideCursor];
     CGAssociateMouseAndMouseCursorPosition(TRUE);
     isMouseGrabbed = FALSE;
+    [self raiseAllButtons];
 }
 
 - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
@@ -1157,8 +1085,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
 - (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
-- (float) cdx {return cdx;}
-- (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
 
 /*
@@ -1172,6 +1098,15 @@ - (void) raiseAllKeys
         qkbd_state_lift_all_keys(kbd);
     });
 }
+
+- (void) raiseAllButtons
+{
+    with_iothread_lock(^{
+        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_LEFT, false);
+        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_RIGHT, false);
+        qemu_input_queue_btn(dcl.con, INPUT_BUTTON_MIDDLE, false);
+    });
+}
 @end
 
 
@@ -1186,7 +1121,6 @@ @interface QemuCocoaAppController : NSObject
 {
 }
 - (void)doToggleFullScreen:(id)sender;
-- (void)toggleFullScreen:(id)sender;
 - (void)showQEMUDoc:(id)sender;
 - (void)zoomToFit:(id) sender;
 - (void)displayConsole:(id)sender;
@@ -1229,12 +1163,12 @@ - (id) init
             exit(1);
         }
         [normalWindow setAcceptsMouseMovedEvents:YES];
-        [normalWindow setTitle:@"QEMU"];
+        [normalWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
+        [normalWindow setTitle:qemu_name ? [NSString stringWithFormat:@"QEMU %s", qemu_name] : @"QEMU"];
         [normalWindow setContentView:cocoaView];
         [normalWindow makeKeyAndOrderFront:self];
         [normalWindow center];
         [normalWindow setDelegate: self];
-        stretch_video = false;
 
         /* Used for displaying pause on the screen */
         pauseLabel = [NSTextField new];
@@ -1305,9 +1239,20 @@ - (void)windowDidChangeScreen:(NSNotification *)notification
     [cocoaView updateUIInfo];
 }
 
+- (void)windowDidEnterFullScreen:(NSNotification *)notification
+{
+    [cocoaView grabMouse];
+}
+
+- (void)windowDidExitFullScreen:(NSNotification *)notification
+{
+    [cocoaView resizeWindow];
+    [cocoaView ungrabMouse];
+}
+
 - (void)windowDidResize:(NSNotification *)notification
 {
-    [cocoaView updateUIInfo];
+    [cocoaView frameUpdated];
 }
 
 /* Called when the user clicks on a window's close button */
@@ -1323,6 +1268,23 @@ - (BOOL)windowShouldClose:(id)sender
     return NO;
 }
 
+- (NSSize) window:(NSWindow *)window willUseFullScreenContentSize:(NSSize)proposedSize
+{
+    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) == 0) {
+        return NSMakeSize([cocoaView gscreen].width, [cocoaView gscreen].height);
+    }
+
+    return [cocoaView fixZoomedFullScreenSize:proposedSize];
+}
+
+- (NSApplicationPresentationOptions) window:(NSWindow *)window
+                                     willUseFullScreenPresentationOptions:(NSApplicationPresentationOptions)proposedOptions;
+
+{
+    return (proposedOptions & ~(NSApplicationPresentationAutoHideDock | NSApplicationPresentationAutoHideMenuBar)) |
+           NSApplicationPresentationHideDock | NSApplicationPresentationHideMenuBar;
+}
+
 /* Called when QEMU goes into the background */
 - (void) applicationWillResignActive: (NSNotification *)aNotification
 {
@@ -1336,14 +1298,7 @@ - (void) applicationWillResignActive: (NSNotification *)aNotification
  */
 - (void) doToggleFullScreen:(id)sender
 {
-    [self toggleFullScreen:(id)sender];
-}
-
-- (void)toggleFullScreen:(id)sender
-{
-    COCOA_DEBUG("QemuCocoaAppController: toggleFullScreen\n");
-
-    [cocoaView toggleFullScreen:sender];
+    [normalWindow toggleFullScreen:sender];
 }
 
 - (void) setFullGrab:(id)sender
@@ -1394,13 +1349,15 @@ - (void)showQEMUDoc:(id)sender
     [self openDocumentation: @"index.html"];
 }
 
-/* Stretches video to fit host monitor size */
+/* Toggles the flag which stretches video to fit host window size */
 - (void)zoomToFit:(id) sender
 {
-    stretch_video = !stretch_video;
-    if (stretch_video == true) {
+    if (([normalWindow styleMask] & NSWindowStyleMaskResizable) == 0) {
+        [normalWindow setStyleMask:[normalWindow styleMask] | NSWindowStyleMaskResizable];
         [sender setState: NSControlStateValueOn];
     } else {
+        [normalWindow setStyleMask:[normalWindow styleMask] & ~NSWindowStyleMaskResizable];
+        [cocoaView resizeWindow];
         [sender setState: NSControlStateValueOff];
     }
 }
@@ -1408,7 +1365,9 @@ - (void)zoomToFit:(id) sender
 /* Displays the console on the screen */
 - (void)displayConsole:(id)sender
 {
-    console_select([sender tag]);
+    with_iothread_lock(^{
+        console_select([sender tag]);
+    });
 }
 
 /* Pause the guest */
@@ -2052,16 +2011,14 @@ static void cocoa_update(DisplayChangeListener *dcl,
     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
 
     dispatch_async(dispatch_get_main_queue(), ^{
-        NSRect rect;
-        if ([cocoaView cdx] == 1.0) {
-            rect = NSMakeRect(x, [cocoaView gscreen].height - y - h, w, h);
-        } else {
-            rect = NSMakeRect(
-                x * [cocoaView cdx],
-                ([cocoaView gscreen].height - y - h) * [cocoaView cdy],
-                w * [cocoaView cdx],
-                h * [cocoaView cdy]);
-        }
+        CGFloat d = [cocoaView frame].size.height / (CGFloat)[cocoaView gscreen].height;
+
+        NSRect rect = NSMakeRect(
+                x * d,
+                ([cocoaView gscreen].height - y - h) * d,
+                w * d,
+                h * d);
+
         [cocoaView setNeedsDisplayInRect:rect];
     });
 
@@ -2135,8 +2092,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
-            [NSApp activateIgnoringOtherApps: YES];
-            [[controller delegate] toggleFullScreen: nil];
+            [normalWindow toggleFullScreen: nil];
         });
     }
     if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
-- 
2.30.1 (Apple Git-130)


