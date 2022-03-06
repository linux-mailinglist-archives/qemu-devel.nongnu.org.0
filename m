Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387664CEBE9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 15:26:09 +0100 (CET)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQrpo-0002Eh-Bu
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 09:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQrnY-0007tO-1j
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:23:48 -0500
Received: from [2001:738:2001:2001::2001] (port=48516 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQrnU-0004Y7-TY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:23:47 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DAF03745958;
 Sun,  6 Mar 2022 15:23:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB79F745708; Sun,  6 Mar 2022 15:23:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A93217456FE;
 Sun,  6 Mar 2022 15:23:40 +0100 (CET)
Date: Sun, 6 Mar 2022 15:23:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 1/2] ui/cocoa: capture all keys and combos when mouse
 is grabbed
In-Reply-To: <20220306121119.45631-2-akihiko.odaki@gmail.com>
Message-ID: <c5b9e02e-531f-df74-bd35-daf9d5e4cbd@eik.bme.hu>
References: <20220306121119.45631-1-akihiko.odaki@gmail.com>
 <20220306121119.45631-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022, Akihiko Odaki wrote:
> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>
> Applications such as Gnome may use Alt-Tab and Super-Tab for different
> purposes, some use Ctrl-arrows so we want to allow qemu to handle
> everything when it captures the mouse/keyboard.
>
> However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> at an earlier part of the event handling chain, not letting qemu see it.
>
> We add a global Event Tap that allows qemu to see all events when the
> mouse is grabbed. Note that this requires additional permissions.
>
> See:
>
> https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
> Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> qapi/ui.json    | 16 ++++++++++++
> qemu-options.hx |  3 +++
> ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
> 3 files changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 4a13f883a30..ff0a04da792 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1260,6 +1260,21 @@
> { 'struct'  : 'DisplayCurses',
>   'data'    : { '*charset'       : 'str' } }
>
> +##
> +# @DisplayCocoa:
> +#
> +# Cocoa display options.
> +#
> +# @full-grab: Capture all key presses, including system combos. This
> +#             requires accessibility permissions, since it performs
> +#             a global grab on key events. (default: off)
> +#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> +#
> +# Since: 7.0
> +##
> +{ 'struct'  : 'DisplayCocoa',
> +  'data'    : { '*full-grab'     : 'bool' } }
> +
> ##
> # @DisplayType:
> #
> @@ -1338,6 +1353,7 @@
>   'discriminator' : 'type',
>   'data'    : {
>       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>       'egl-headless': { 'type': 'DisplayEGLHeadless',
>                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 094a6c1d7c2..4df9ccc3446 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1916,6 +1916,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
> #if defined(CONFIG_CURSES)
>     "-display curses[,charset=<encoding>]\n"
> #endif
> +#if defined(CONFIG_COCOA)
> +    "-display cocoa[,full_grab=on|off]\n"
> +#endif
> #if defined(CONFIG_OPENGL)
>     "-display egl-headless[,rendernode=<file>]\n"
> #endif
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 8ab9ab5e84d..bfd602a96b9 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -308,11 +308,13 @@ @interface QemuCocoaView : NSView
>     BOOL isMouseGrabbed;
>     BOOL isFullscreen;
>     BOOL isAbsoluteEnabled;
> +    CFMachPortRef eventsTap;
> }
> - (void) switchSurface:(pixman_image_t *)image;
> - (void) grabMouse;
> - (void) ungrabMouse;
> - (void) toggleFullScreen:(id)sender;
> +- (void) setFullGrab:(id)sender;
> - (void) handleMonitorInput:(NSEvent *)event;
> - (bool) handleEvent:(NSEvent *)event;
> - (bool) handleEventLocked:(NSEvent *)event;
> @@ -335,6 +337,19 @@ - (void) raiseAllKeys;
>
> QemuCocoaView *cocoaView;
>
> +static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef cgEvent, void *userInfo)
> +{
> +    QemuCocoaView *cocoaView = userInfo;
> +    NSEvent* event = [NSEvent eventWithCGEvent:cgEvent];

Sorry, I've missed this before but the space in NSEvent* event is also on 
the wrong side of the * it should be NSEvent *event. Does checkpatch miss 
these or it can't handle Objective-C? Another one below...

> +    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
> +        COCOA_DEBUG("Global events tap: qemu handled the event, capturing!\n");
> +        return NULL;
> +    }
> +    COCOA_DEBUG("Global events tap: qemu did not handle the event, letting it through...\n");
> +
> +    return cgEvent;
> +}
> +
> @implementation QemuCocoaView
> - (id)initWithFrame:(NSRect)frameRect
> {
> @@ -360,6 +375,11 @@ - (void) dealloc
>     }
>
>     qkbd_state_free(kbd);
> +
> +    if (eventsTap) {
> +        CFRelease(eventsTap);
> +    }
> +
>     [super dealloc];
> }
>
> @@ -654,6 +674,36 @@ - (void) toggleFullScreen:(id)sender
>     }
> }
>
> +- (void) setFullGrab:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
> +
> +    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) | CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
> +    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
> +                                 mask, handleTapEvent, self);
> +    if (!eventsTap) {
> +        warn_report("Could not create event tap, system key combos will not be captured.\n");
> +        return;
> +    } else {
> +        COCOA_DEBUG("Global events tap created! Will capture system key combos.\n");
> +    }
> +
> +    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
> +    if (!runLoop) {
> +        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
> +        return;
> +    }
> +
> +    CFRunLoopSourceRef tapEventsSrc = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
> +    if (!tapEventsSrc ) {
> +        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
> +        return;
> +    }
> +
> +    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
> +    CFRelease(tapEventsSrc);
> +}
> +
> - (void) toggleKey: (int)keycode {
>     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
> }
> @@ -1281,6 +1331,13 @@ - (void)toggleFullScreen:(id)sender
>     [cocoaView toggleFullScreen:sender];
> }
>
> +- (void) setFullGrab:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaAppController: setFullGrab\n");
> +
> +    [cocoaView setFullGrab:sender];
> +}
> +
> /* Tries to find then open the specified filename */
> - (void) openDocumentation: (NSString *) filename
> {
> @@ -2057,11 +2114,17 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>     qemu_sem_wait(&app_started_sem);
>     COCOA_DEBUG("cocoa_display_init: app start completed\n");
>
> +    QemuCocoaAppController* controller = (QemuCocoaAppController*)[[NSApplication sharedApplication] delegate];

Both in the type declaration and in the cast on the right hand side space 
is missing between type and *.

Otherwise I'd give an R-b but it does not worth much as I've never used 
CGEventTap and have not checked the docs so maybe someone else who 
actually knows this could better review it.

Regards,
BALATON Zoltan

>     /* if fullscreen mode is to be used */
>     if (opts->has_full_screen && opts->full_screen) {
>         dispatch_async(dispatch_get_main_queue(), ^{
>             [NSApp activateIgnoringOtherApps: YES];
> -            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
> +            [controller toggleFullScreen: nil];
> +        });
> +    }
> +    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [controller setFullGrab: nil];
>         });
>     }
>     if (opts->has_show_cursor && opts->show_cursor) {
>

