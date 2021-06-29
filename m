Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C53B7365
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:42:06 +0200 (CEST)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyE03-0006Cu-Vs
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lyDxG-0002vW-Tl
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:10 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lyDxC-0003og-Eb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso2446214pjp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8CacJ9UvODAgvuhJG9r/5+Kc70xPBbN/9UlkNRBov4=;
 b=SQjU1fWPBqmpKHnQWCq6oPAJLEmxmlkNesjH8oxMW/uNSXATjjiqLaOGfASb+ZjOy3
 yCS1Wj+DArfOeI2tzIsfJUvn/eTJ3Q8WHdlE8T+9FlXjGoWrom6FuoRNyiVSJKSkbPZ6
 OEqLGkD8g0BpRwlX4TThOnA43nkoRRS5yAw6S4rUTJX2D042TU1HIPCHtLpLvjnSLWLM
 iG0b+z4fZ6IaBYukr/GKvQOdLyWEQScgPyuyA6l3nSL3ITwEC1A64ZGCRaYjR+zeHM7F
 6lRmjGUGoC/ROTIdSWcDUfcNxnDvBwLmwsjjaywnkRZmhUiWq9OO8HinmouFnJYRLCLf
 sIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8CacJ9UvODAgvuhJG9r/5+Kc70xPBbN/9UlkNRBov4=;
 b=lnxGXVpiVpFa58LrxtqcdB0WvIyvtKkUGbnoAcJ4oGt9dYL9ckJEip9Ikcv6ZVyGuV
 K+16XMK/UBFz6pWd497o1y/AsAUVmeXW6EEorjzCjOUWX6IYLvKXCjkyKCFWwkDkS27N
 zYNP6IvMbEies+3YQ2ci+scxzxQc9uIMrOYw9pQHGIaoMHw/WPkq6DVCY+LdGhJF+m9h
 N5Qt79CGOfMJKZFhfO9sDXcuhG7JxQLWNFsySEgvEh/GHRlsWrHjL/aWN47aV//k5qi3
 C5Dymn+/Qo/MfhvOPnLc7ylOAlKsHdW8/EpZTKe5UbhUom+Ndlz6Uc1d+zfxR4Kp42ce
 ZnNQ==
X-Gm-Message-State: AOAM531LzoFObfELkJlVExV8X1U6x8335LJPDSO+Lk2jZmkN64eHvfJC
 sY3YNZk+Lo0i3hWf9KDZ/Ox56v/7SZWtOQ==
X-Google-Smtp-Source: ABdhPJxkFBUJ13UhCk5LptzpWI1w/nkBX37c+lbaglnaY5uljWdpqYRtlesjnNhiY1IVHZvDI0VQYA==
X-Received: by 2002:a17:90b:1115:: with SMTP id
 gi21mr44061532pjb.116.1624973944510; 
 Tue, 29 Jun 2021 06:39:04 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:f905:f19:e2a8:1bb6])
 by smtp.gmail.com with ESMTPSA id t1sm18067556pjo.33.2021.06.29.06.39.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jun 2021 06:39:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3] ui/cocoa: Use NSWindow's ability to resize
Date: Tue, 29 Jun 2021 22:38:58 +0900
Message-Id: <20210629133858.72852-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change brings two new features:
- The window will be resizable if "Zoom To Fit" is eanbled
- The window can be made full screen by clicking full screen button
  provided by the platform. (The left-top green button.)

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 546 +++++++++++++++++++++++++----------------------------
 1 file changed, 253 insertions(+), 293 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..33b422e08f1 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -93,12 +93,10 @@ static void cocoa_switch(DisplayChangeListener *dcl,
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
 
@@ -301,19 +299,16 @@ static void handleAnyDeviceErrors(Error * err)
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
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
 - (void) ungrabMouse;
-- (void) toggleFullScreen:(id)sender;
 - (void) handleMonitorInput:(NSEvent *)event;
 - (bool) handleEvent:(NSEvent *)event;
 - (bool) handleEventLocked:(NSEvent *)event;
@@ -328,8 +323,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
  */
 - (BOOL) isMouseGrabbed;
 - (BOOL) isAbsoluteEnabled;
-- (float) cdx;
-- (float) cdy;
 - (QEMUScreen) gscreen;
 - (void) raiseAllKeys;
 @end
@@ -369,46 +362,43 @@ - (BOOL) isOpaque
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
@@ -471,13 +461,14 @@ - (void) drawRect:(NSRect) rect
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
@@ -490,36 +481,38 @@ - (void) drawRect:(NSRect) rect
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
+    /*
+     * Scale down the size to correct the aspect ratio according to the guest
+     * screen.
+     */
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
 
@@ -538,7 +531,12 @@ - (void) updateUIInfo
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
@@ -555,31 +553,19 @@ - (void) updateUIInfo
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
@@ -588,51 +574,6 @@ - (void) switchSurface:(pixman_image_t *)image
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
 
 - (void) toggleKey: (int)keycode {
@@ -724,12 +665,7 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -799,37 +735,37 @@ - (bool) handleEventLocked:(NSEvent *)event
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
                         [self toggleKey:Q_KEY_CODE_ALT];
                     }
-                    break;
+                    return true;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
                         [self toggleKey:Q_KEY_CODE_ALT_R];
                     }
-                    break;
+                    return true;
 
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
@@ -837,28 +773,23 @@ - (bool) handleEventLocked:(NSEvent *)event
                         !!(modifiers & NSEventModifierFlagCommand)) {
                         [self toggleKey:Q_KEY_CODE_META_L];
                     }
-                    break;
+                    return true;
 
                 case kVK_RightCommand:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
                         [self toggleKey:Q_KEY_CODE_META_R];
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
 
@@ -889,7 +820,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             } else {
                 [self handleMonitorInput: event];
             }
-            break;
+            return true;
         case NSEventTypeKeyUp:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
 
@@ -902,67 +833,7 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -976,7 +847,7 @@ - (bool) handleEventLocked:(NSEvent *)event
              */
             if ([event deltaY] != 0) {
             /* Determine if this is a scroll up or scroll down event */
-                buttons = ([event deltaY] > 0) ?
+                int buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
                 qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
@@ -987,62 +858,124 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -1052,15 +985,14 @@ - (void) ungrabMouse
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
@@ -1071,8 +1003,6 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
 }
 - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
 - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
-- (float) cdx {return cdx;}
-- (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
 
 /*
@@ -1086,6 +1016,15 @@ - (void) raiseAllKeys
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
 
 
@@ -1100,7 +1039,6 @@ @interface QemuCocoaAppController : NSObject
 {
 }
 - (void)doToggleFullScreen:(id)sender;
-- (void)toggleFullScreen:(id)sender;
 - (void)showQEMUDoc:(id)sender;
 - (void)zoomToFit:(id) sender;
 - (void)displayConsole:(id)sender;
@@ -1143,12 +1081,12 @@ - (id) init
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
@@ -1219,9 +1157,20 @@ - (void)windowDidChangeScreen:(NSNotification *)notification
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
@@ -1237,6 +1186,23 @@ - (BOOL)windowShouldClose:(id)sender
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
@@ -1250,14 +1216,7 @@ - (void) applicationWillResignActive: (NSNotification *)aNotification
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
 
 /* Tries to find then open the specified filename */
@@ -1294,13 +1253,15 @@ - (void)showQEMUDoc:(id)sender
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
@@ -1308,7 +1269,9 @@ - (void)zoomToFit:(id) sender
 /* Displays the console on the screen */
 - (void)displayConsole:(id)sender
 {
-    console_select([sender tag]);
+    with_iothread_lock(^{
+        console_select([sender tag]);
+    });
 }
 
 /* Pause the guest */
@@ -1952,16 +1915,14 @@ static void cocoa_update(DisplayChangeListener *dcl,
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
 
@@ -2034,8 +1995,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
         dispatch_async(dispatch_get_main_queue(), ^{
-            [NSApp activateIgnoringOtherApps: YES];
-            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
+            [normalWindow toggleFullScreen: nil];
         });
     }
     if (opts->has_show_cursor && opts->show_cursor) {
-- 
2.30.1 (Apple Git-130)


