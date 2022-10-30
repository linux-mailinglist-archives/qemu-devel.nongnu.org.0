Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D976128AF
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 08:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op2lR-0001PR-C8; Sun, 30 Oct 2022 03:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1op2lK-0001P9-HZ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 03:29:42 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1op2lH-0007Wr-Kw
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 03:29:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b29so8169524pfp.13
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eAKySHl7eaQkQF5uyIHVj2agn4wCCjCVBi8xVUl9GpM=;
 b=oWA1rVw+Uwi4dHOb9S1JpADAmELl0qjzQywI9kmS5+nuwI++rF8aAbDfR/5DHKWqNU
 TrJ4UzvPzM7uew6Iv40PlBIuMj5bq/RBah2Xmicjm3eQqJEakoD+aWux8uLj0Ox0cpXV
 c4i10AKLcGBUVl+4cg0apESkTsaiyd4joH6uusuwI9oluVuVgY+0mXIDZBPoN/NQ8bQZ
 8KDW0md2sq5LCIJnp8QfaudODM0GFJgBcXVkoOmgU9KzVW9A7fTyQ+wLWjGESVXRsWXU
 P5V4G1pi+6zcjrWEheCKonMde+13ILf/kVagiMppYJAA19mWQKreE5Dd1b27drg/wlow
 i00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eAKySHl7eaQkQF5uyIHVj2agn4wCCjCVBi8xVUl9GpM=;
 b=Dk25eeBZltt+zgLPzwKNAKPjCjhH+R3xq51yYDUNXI/ZfapC3+e7LWitVBvsHR+pQc
 fg2R7+3BCqS3WkOeLMIACQ9YNbsNa1m+u14IebE6qAy+p/pdqr6/IsQLXbJTi9ECIoZA
 o+hfpflGzBBEW/sbRey1YZ0FHJNZowz89G3s+cD/L3+6fjHcnjaa/Y3v18in7ECL0RNl
 /Y2dG9vVrSulBbRWVWqV/Rx9FvQ4Ropg43Ul5Mh8L3kJoVuiD1D0jwIhCPX5La3MQ0zJ
 4vqlm7i3Dss0sSZPN2vQlCtgwcEA2FW9kKezz046SP2XVbWmnLS8SjqW/3WGJcVsdmDh
 CIvw==
X-Gm-Message-State: ACrzQf045snHHqYAyvqaH5dDlpv5lLGaMgxz/SorGaW07VyckkR1IPXQ
 wqRWy3uiTU6fUeypr7TOgYs=
X-Google-Smtp-Source: AMsMyM5WlTvKxRtZVULV+Z3VTHVZP6WOgmDAsfXWBRd77BqH55+ILkHqe80f3TG50+dL+kiBW6dgrg==
X-Received: by 2002:a05:6a00:1905:b0:566:2a02:e1a1 with SMTP id
 y5-20020a056a00190500b005662a02e1a1mr8092810pfi.1.1667114976764; 
 Sun, 30 Oct 2022 00:29:36 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a1709026b0800b00172ea8ff334sm2276899plk.7.2022.10.30.00.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 00:29:36 -0700 (PDT)
Message-ID: <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
Date: Sun, 30 Oct 2022 16:29:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
To: Elliot Nunn <elliot@nunn.io>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
 <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 2022/10/30 14:20, Elliot Nunn wrote:
> Akihiko,
> 
> Thanks very much for reviewing my patch.
> 
> I think that you were right to use the sprite-within-a-window approach,
> and avoid warping the OS cursor. I tried to compensate for the error
> that cursor warping causes in the subsequent mouse event, but there is
> still some error getting through that makes the cursor feel "janky".
> 
> But in absolute pointing mode, will it be possible to remove the guest's
> code path from visual updates of the cursor? I find that under Mac OS 9,
> this provides better responsiveness. I can think of two methods:
> 
> 1. In absolute pointing mode, re-enable Cocoa's cursor and let the host
> OS move it according to user input.
> 
> 2. Keep the cursor sprite, but move it according to Cocoa's mouse
> movement events instead of dpy_mouse_set events.
> 
> I prefer option 2. What do you think?

My patch has been only tested with recent Linux, but it certainly should 
be ensured that it works well for old systems when upstreaming.

First I'd like to know what display device you use. It looks like 
dpy_mouse_set is used only by ati-vga, vhost-user-gpu, virtio-gpu, and 
vmware.

Also, can you give reasoning while 2 is preferred? 1 would allow to 
exploit the hardware's feature for cursor composition, resulting in 
smoother experience and a bit less power consumption. But there may be 
complications it can cause so I have not decided which one is the better 
yet.

> 
> And I didn't realise that you had added VirGL support to cocoa.m. Well
> done! Is it on track for release?
> 
> My patch should be withdrawn from consideration, in favour of a future
> solution that does not use cursor warping.

I'm not really pushing my changes hard so it's kind of stale. Perhaps it 
is better to rewrite the cursor composition patch in a way that does not 
depend on the Virgl patch. I'm also aware that the cursor composition 
using Core Graphics is somewhat laggy so it may be better to rewrite it 
using subview, Core Animation, Metal, or something else. But I have not 
done that yet.

Regards,
Akihiko Odaki

> 
> Many thanks,
> 
> Elliot
> 
>> On 6 Oct 2022, at 8:15 pm, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Thanks Peter and Elliot,
>>
>> Unfortunately Patchew seems to have failed to apply the patch to the
>> current master. It would be nice if you rebase it to the current
>> master.
>>
>> Actually I have a patch to add hardware support to ui/cocoa, but I
>> have not submitted to the mailing list because it depends on a number
>> of other patches:
>> https://github.com/akihikodaki/qemu/commit/34199fcd4080ce8c705b46df26fdf02966b1610c
>>
>> My patch avoided using CGWarpMouseCursorPosition because of its
>> quirks. I'd like to test your patch by myself to see if it avoids them
>> properly for my own workloads.
>>
>> I have also added some comments to the patch. Please see the below.
>>
>> Regards,
>> Akihiko Odaki
>>
>> On Wed, Oct 5, 2022 at 12:39 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> Ccing Akihiko to see if he wants to review this cocoa ui frontend
>>> patch.
>>>
>>> also available at:
>>> https://lore.kernel.org/qemu-devel/54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com/
>>>
>>> I can confirm that the patch does build, but I don't have any
>>> interesting graphics-using test images to hand to test with.
>>>
>>> thanks
>>> -- PMM
>>>
>>> On Thu, 4 Aug 2022 at 07:28, Elliot Nunn <elliot@nunn.io> wrote:
>>>>
>>>> Implement dpy_cursor_define() and dpy_mouse_set() on macOS.
>>>>
>>>> The main benefit is from dpy_cursor_define: in absolute pointing mode, the
>>>> host can redraw the cursor on the guest's behalf much faster than the guest
>>>> can itself.
>>>>
>>>> To provide the programmatic movement expected from a hardware cursor,
>>>> dpy_mouse_set is also implemented.
>>>>
>>>> Tricky cases are handled:
>>>> - dpy_mouse_set() avoids rounded window corners.
>>>> - The sometimes-delay between warping the cursor and an affected mouse-move
>>>>   event is accounted for.
>>>> - Cursor bitmaps are nearest-neighbor scaled to Retina size.
>>>>
>>>> Signed-off-by: Elliot Nunn <elliot@nunn.io>
>>>> ---
>>>> ui/cocoa.m | 263 ++++++++++++++++++++++++++++++++++++++++++++++++-----
>>>> 1 file changed, 240 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>>>> index 5a8bd5dd84..f9d54448e4 100644
>>>> --- a/ui/cocoa.m
>>>> +++ b/ui/cocoa.m
>>>> @@ -85,12 +85,20 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>>>>
>>>> static void cocoa_refresh(DisplayChangeListener *dcl);
>>>>
>>>> +static void cocoa_mouse_set(DisplayChangeListener *dcl,
>>>> +                            int x, int y, int on);
>>>> +
>>>> +static void cocoa_cursor_define(DisplayChangeListener *dcl,
>>>> +                                QEMUCursor *c);
>>>> +
>>>> static NSWindow *normalWindow;
>>>> static const DisplayChangeListenerOps dcl_ops = {
>>>>      .dpy_name          = "cocoa",
>>>>      .dpy_gfx_update = cocoa_update,
>>>>      .dpy_gfx_switch = cocoa_switch,
>>>>      .dpy_refresh = cocoa_refresh,
>>>> +    .dpy_mouse_set = cocoa_mouse_set,
>>>> +    .dpy_cursor_define = cocoa_cursor_define,
>>>> };
>>>> static DisplayChangeListener dcl = {
>>>>      .ops = &dcl_ops,
>>>> @@ -313,6 +321,13 @@ @interface QemuCocoaView : NSView
>>>>      BOOL isFullscreen;
>>>>      BOOL isAbsoluteEnabled;
>>>>      CFMachPortRef eventsTap;
>>>> +    NSCursor *guestCursor;
>>>> +    BOOL cursorHiddenByMe;
>>
>> Who is "Me" here?
>>
>>>> +    BOOL guestCursorVis;
>>>> +    int guestCursorX, guestCursorY;
>>>> +    int lastWarpX, lastWarpY;
>>>> +    int warpDeltaX, warpDeltaY;
>>>> +    BOOL ignoreNextMouseMove;
>>>> }
>>>> - (void) switchSurface:(pixman_image_t *)image;
>>>> - (void) grabMouse;
>>>> @@ -323,6 +338,10 @@ - (void) handleMonitorInput:(NSEvent *)event;
>>>> - (bool) handleEvent:(NSEvent *)event;
>>>> - (bool) handleEventLocked:(NSEvent *)event;
>>>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
>>>> +- (void) cursorDefine:(NSCursor *)cursor;
>>>> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on;
>>>> +- (void) setCursorAppearance;
>>>> +- (void) setCursorPosition;
>>>> /* The state surrounding mouse grabbing is potentially confusing.
>>>>   * isAbsoluteEnabled tracks qemu_input_is_absolute() [ie "is the emulated
>>>>   *   pointing device an absolute-position one?"], but is only updated on
>>>> @@ -432,22 +451,6 @@ - (CGPoint) screenLocationOfEvent:(NSEvent *)ev
>>>>      }
>>>> }
>>>>
>>>> -- (void) hideCursor
>>>> -{
>>>> -    if (!cursor_hide) {
>>>> -        return;
>>>> -    }
>>>> -    [NSCursor hide];
>>>> -}
>>>> -
>>>> -- (void) unhideCursor
>>>> -{
>>>> -    if (!cursor_hide) {
>>>> -        return;
>>>> -    }
>>>> -    [NSCursor unhide];
>>>> -}
>>>> -
>>>> - (void) drawRect:(NSRect) rect
>>>> {
>>>>      COCOA_DEBUG("QemuCocoaView: drawRect\n");
>>>> @@ -635,6 +638,8 @@ - (void) switchSurface:(pixman_image_t *)image
>>>>          screen.height = h;
>>>>          [self setContentDimensions];
>>>>          [self setFrame:NSMakeRect(cx, cy, cw, ch)];
>>>> +        [self setCursorAppearance];
>>
>> Why do you need to set cursor appearance when resizing the screen?
>>
>>>> +        [self setCursorPosition];
>>>>      }
>>>>
>>>>      // update screenBuffer
>>>> @@ -681,6 +686,7 @@ - (void) toggleFullScreen:(id)sender
>>>>              styleMask:NSWindowStyleMaskBorderless
>>>>              backing:NSBackingStoreBuffered
>>>>              defer:NO];
>>>> +        [fullScreenWindow disableCursorRects];
>>>>          [fullScreenWindow setAcceptsMouseMovedEvents: YES];
>>>>          [fullScreenWindow setHasShadow:NO];
>>>>          [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
>>>> @@ -812,6 +818,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>      int buttons = 0;
>>>>      int keycode = 0;
>>>>      bool mouse_event = false;
>>>> +    bool mousemoved_event = false;
>>>>      // Location of event in virtual screen coordinates
>>>>      NSPoint p = [self screenLocationOfEvent:event];
>>>>      NSUInteger modifiers = [event modifierFlags];
>>>> @@ -1023,6 +1030,7 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>                  }
>>>>              }
>>>>              mouse_event = true;
>>>> +            mousemoved_event = true;
>>>>              break;
>>>>          case NSEventTypeLeftMouseDown:
>>>>              buttons |= MOUSE_EVENT_LBUTTON;
>>>> @@ -1039,14 +1047,17 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>          case NSEventTypeLeftMouseDragged:
>>>>              buttons |= MOUSE_EVENT_LBUTTON;
>>>>              mouse_event = true;
>>>> +            mousemoved_event = true;
>>>>              break;
>>>>          case NSEventTypeRightMouseDragged:
>>>>              buttons |= MOUSE_EVENT_RBUTTON;
>>>>              mouse_event = true;
>>>> +            mousemoved_event = true;
>>>>              break;
>>>>          case NSEventTypeOtherMouseDragged:
>>>>              buttons |= MOUSE_EVENT_MBUTTON;
>>>>              mouse_event = true;
>>>> +            mousemoved_event = true;
>>>>              break;
>>>>          case NSEventTypeLeftMouseUp:
>>>>              mouse_event = true;
>>>> @@ -1121,7 +1132,12 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>              qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
>>>>              last_buttons = buttons;
>>>>          }
>>>> -        if (isMouseGrabbed) {
>>>> +
>>>> +        if (!isMouseGrabbed) {
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (mousemoved_event) {
>>>>              if (isAbsoluteEnabled) {
>>>>                  /* Note that the origin for Cocoa mouse coords is bottom left, not top left.
>>>>                   * The check on screenContainsPoint is to avoid sending out of range values for
>>>> @@ -1132,11 +1148,38 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>                      qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
>>>>                  }
>>>>              } else {
>>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
>>>> -                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
>>>> +                if (ignoreNextMouseMove) {
>>>> +                    // Discard the first mouse-move event after a grab, because
>>>> +                    // it includes the warp delta from an unknown initial position.
>>>> +                    ignoreNextMouseMove = NO;
>>>> +                    warpDeltaX = warpDeltaY = 0;
>>>> +                } else {
>>>> +                    // Correct subsequent events to remove the known warp delta.
>>>> +                    // The warp delta is sometimes late to be reported, so never
>>>> +                    // allow the delta compensation to alter the direction.
>>>> +                    int dX = (int)[event deltaX];
>>>> +                    int dY = (int)[event deltaY];
>>>> +
>>>> +                    if (dX == 0 || (dX ^ (dX - warpDeltaX)) < 0) { // Flipped sign?
>>
>> Instead, do: (dx < 0) == (dx - warpDeltaX < 0). The original flipped
>> sign check is dependent on an implementation-defined behavior, and a
>> bit difficult to understand. A decent compiler should be able to
>> optimize it to the bitwise operation.
>>
>>>> +                        warpDeltaX -= dX; // Save excess correction for later
>>>> +                        dX = 0;
>>>> +                    } else {
>>>> +                        dX -= warpDeltaX; // Apply entire correction
>>>> +                        warpDeltaX = 0;
>>>> +                    }
>>>> +
>>>> +                    if (dY == 0 || (dY ^ (dY - warpDeltaY)) < 0) {
>>>> +                        warpDeltaY -= dY;
>>>> +                        dY = 0;
>>>> +                    } else {
>>>> +                        dY -= warpDeltaY;
>>>> +                        warpDeltaY = 0;
>>>> +                    }
>>>> +
>>>> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, dX);
>>>> +                    qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, dY);
>>>> +                }
>>>>              }
>>>> -        } else {
>>>> -            return false;
>>>>          }
>>>>          qemu_input_event_sync();
>>>>      }
>>>> @@ -1153,9 +1196,15 @@ - (void) grabMouse
>>>>          else
>>>>              [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
>>>>      }
>>>> -    [self hideCursor];
>>>>      CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>>>>      isMouseGrabbed = TRUE; // while isMouseGrabbed = TRUE, QemuCocoaApp sends all events to [cocoaView handleEvent:]
>>>> +    [self setCursorAppearance];
>>>> +    [self setCursorPosition];
>>>> +
>>>> +    // We took over and warped the mouse, so ignore the next mouse-move
>>>> +    if (!isAbsoluteEnabled) {
>>>> +        ignoreNextMouseMove = YES;
>>>> +    }
>>
>> It shouldn't warp the mouse when the pointing device is absolute. An
>> absolute pointing device, especially vdagent, is often used to
>> seamlessly integrate the guest and host cursors.
>>
>>>> }
>>>>
>>>> - (void) ungrabMouse
>>>> @@ -1168,9 +1217,14 @@ - (void) ungrabMouse
>>>>          else
>>>>              [normalWindow setTitle:@"QEMU"];
>>>>      }
>>>> -    [self unhideCursor];
>>>>      CGAssociateMouseAndMouseCursorPosition(TRUE);
>>>>      isMouseGrabbed = FALSE;
>>>> +    [self setCursorAppearance];
>>>> +
>>>> +    if (!isAbsoluteEnabled) {
>>>> +        ignoreNextMouseMove = NO;
>>>> +        warpDeltaX = warpDeltaY = 0;
>>>> +    }
>>>> }
>>>>
>>>> - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>>> @@ -1179,6 +1233,116 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
>>>>          CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
>>>>      }
>>>> }
>>>> +
>>>> +// Indirectly called by dpy_cursor_define() in the virtual GPU
>>>> +- (void) cursorDefine:(NSCursor *)cursor {
>>>> +    guestCursor = cursor;
>>
>> The old cursor is leaked here. Note that ARC is not enabled on QEMU,
>> unfortunately.
>>
>>>> +    [self setCursorAppearance];
>>>> +}
>>>> +
>>>> +// Indirectly called by dpy_mouse_set() in the virtual GPU
>>>> +- (void) mouseSetX:(int)x Y:(int)y on:(int)on {
>>>> +    if (!on != !guestCursorVis) {
>>>> +        guestCursorVis = on;
>>>> +        [self setCursorAppearance];
>>>> +    }
>>>> +
>>>> +    if (on && (x != guestCursorX || y != guestCursorY)) {
>>>> +        guestCursorX = x;
>>>> +        guestCursorY = y;
>>>> +        [self setCursorPosition];
>>>> +    }
>>>> +}
>>>> +
>>>> +// Change the cursor image to the default, the guest cursor bitmap or hidden.
>>>> +// Said to be an expensive operation on macOS Monterey, so use sparingly.
>>>> +- (void) setCursorAppearance {
>>>> +    NSCursor *cursor = NULL; // NULL means hidden
>>>> +
>>>> +    if (!isMouseGrabbed) {
>>>> +        cursor = [NSCursor arrowCursor];
>>>> +    } else if (!guestCursor && !cursor_hide) {
>>>> +        cursor = [NSCursor arrowCursor];
>>>> +    } else if (guestCursorVis && guestCursor) {
>>>> +        cursor = guestCursor;
>>>> +    } else {
>>>> +        cursor = NULL;
>>>> +    }
>>>> +
>>>> +    if (cursor != NULL) {
>>>> +        [cursor set];
>>>> +
>>>> +        if (cursorHiddenByMe) {
>>>> +            [NSCursor unhide];
>>>> +            cursorHiddenByMe = NO;
>>>> +        }
>>>> +    } else {
>>>> +        if (!cursorHiddenByMe) {
>>>> +            [NSCursor hide];
>>>> +            cursorHiddenByMe = YES;
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +// Move the cursor within the virtual screen
>>>> +- (void) setCursorPosition {
>>>> +    // Ignore the guest's request if the cursor belongs to Cocoa
>>>> +    if (!isMouseGrabbed || isAbsoluteEnabled) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    // Get guest screen rect in Cocoa coordinates (bottom-left origin).
>>>> +    NSRect virtualScreen = [[self window] convertRectToScreen:[self frame]];
>>>> +
>>>> +    // Convert to top-left origin.
>>>> +    NSInteger hostScreenH = [NSScreen screens][0].frame.size.height;
>>>> +    int scrX = virtualScreen.origin.x;
>>>> +    int scrY = hostScreenH - virtualScreen.origin.y - virtualScreen.size.height;
>>>> +    int scrW = virtualScreen.size.width;
>>>> +    int scrH = virtualScreen.size.height;
>>>> +
>>>> +    int cursX = scrX + guestCursorX;
>>>> +    int cursY = scrY + guestCursorY;
>>>> +
>>>> +    // Clip to edges
>>>> +    cursX = MIN(MAX(scrX, cursX), scrX + scrW - 1);
>>>> +    cursY = MIN(MAX(scrY, cursY), scrY + scrH - 1);
>>>> +
>>>> +    // Move diagonally towards the center to avoid rounded window corners.
>>>> +    // Limit the number of hit-tests and discard failed attempts.
>>>> +    int betterX = cursX, betterY = cursY;
>>>> +    for (int i=0; i<16; i++) {
>>>> +        if ([NSWindow windowNumberAtPoint:NSMakePoint(betterX, hostScreenH - betterY)
>>>> +            belowWindowWithWindowNumber:0] == self.window.windowNumber) {
>>>> +            cursX = betterX;
>>>> +            cursY = betterY;
>>>> +            break;
>>>> +        };
>>>> +
>>>> +        if (betterX < scrX + scrW/2) {
>>>> +            betterX++;
>>>> +        } else {
>>>> +            betterX--;
>>>> +        }
>>>> +
>>>> +        if (betterY < scrY + scrH/2) {
>>>> +            betterY++;
>>>> +        } else {
>>>> +            betterY--;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    // Subtract this warp delta from the next NSEventTypeMouseMoved.
>>>> +    // These are in down-is-positive coords, same as NSEvent deltaX/deltaY.
>>>> +    warpDeltaX += cursX - lastWarpX;
>>>> +    warpDeltaY += cursY - lastWarpY;
>>>> +
>>>> +    CGWarpMouseCursorPosition(NSMakePoint(cursX, cursY));
>>>> +
>>>> +    lastWarpX = cursX;
>>>> +    lastWarpY = cursY;
>>>> +}
>>>> +
>>>> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
>>>> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
>>>> - (float) cdx {return cdx;}
>>>> @@ -1251,6 +1415,7 @@ - (id) init
>>>>              error_report("(cocoa) can't create window");
>>>>              exit(1);
>>>>          }
>>>> +        [normalWindow disableCursorRects];
>>>>          [normalWindow setAcceptsMouseMovedEvents:YES];
>>>>          [normalWindow setTitle:@"QEMU"];
>>>>          [normalWindow setContentView:cocoaView];
>>>> @@ -2123,6 +2288,58 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>>>>      qemu_clipboard_peer_register(&cbpeer);
>>>> }
>>>>
>>>> +static void cocoa_mouse_set(DisplayChangeListener *dcl, int x, int y, int on) {
>>
>> Put { for a function in a new line. See docs/devel/style.rst.
>>
>>>> +    dispatch_async(dispatch_get_main_queue(), ^{
>>>> +        [cocoaView mouseSetX:x Y:y on:on];
>>>> +    });
>>>> +}
>>>> +
>>>> +// Convert QEMUCursor to NSCursor, then call cursorDefine
>>>> +static void cocoa_cursor_define(DisplayChangeListener *dcl, QEMUCursor *cursor) {
>>>> +    CFDataRef cfdata = CFDataCreate(
>>>> +        /*allocator*/ NULL,
>>>> +        /*bytes*/ (void *)cursor->data,
>>>> +        /*length*/ sizeof(uint32_t) * cursor->width * cursor->height);
>>>> +
>>>> +    CGDataProviderRef dataprovider = CGDataProviderCreateWithCFData(cfdata);
>>>> +
>>>> +    CGImageRef cgimage = CGImageCreate(
>>>> +        cursor->width, cursor->height,
>>>> +        /*bitsPerComponent*/ 8,
>>>> +        /*bitsPerPixel*/ 32,
>>>> +        /*bytesPerRow*/ sizeof(uint32_t) * cursor->width,
>>>> +        /*colorspace*/ CGColorSpaceCreateWithName(kCGColorSpaceSRGB),
>>>> +        /*bitmapInfo*/ kCGBitmapByteOrder32Host | kCGImageAlphaLast,
>>>> +        /*provider*/ dataprovider,
>>>> +        /*decode*/ NULL,
>>>> +        /*shouldInterpolate*/ FALSE,
>>>> +        /*intent*/ kCGRenderingIntentDefault);
>>>> +
>>>> +    NSImage *unscaled = [[NSImage alloc] initWithCGImage:cgimage size:NSZeroSize];
>>>> +
>>>> +    CFRelease(cfdata);
>>>> +    CGDataProviderRelease(dataprovider);
>>>> +    CGImageRelease(cgimage);
>>>> +
>>>> +    // Nearest-neighbor scale to the possibly "Retina" cursor size
>>>> +    NSImage *scaled = [NSImage
>>>> +        imageWithSize:NSMakeSize(cursor->width, cursor->height)
>>>> +        flipped:NO
>>>> +        drawingHandler:^BOOL(NSRect dest) {
>>>> +            [NSGraphicsContext currentContext].imageInterpolation = NSImageInterpolationNone;
>>>> +            [unscaled drawInRect:dest];
>>>> +            return YES;
>>>> +        }];
>>
>> unscaled and scaled are leaked.
>>
>>>> +
>>>> +    NSCursor *nscursor = [[NSCursor alloc]
>>>> +        initWithImage:scaled
>>>> +        hotSpot:NSMakePoint(cursor->hot_x, cursor->hot_y)];
>>>> +
>>>> +    dispatch_async(dispatch_get_main_queue(), ^{
>>>> +        [cocoaView cursorDefine:nscursor];
>>>> +    });
>>>> +}
>>>> +
>>>> static QemuDisplay qemu_display_cocoa = {
>>>>      .type       = DISPLAY_TYPE_COCOA,
>>>>      .init       = cocoa_display_init,
> 

