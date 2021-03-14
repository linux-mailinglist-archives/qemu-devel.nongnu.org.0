Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAE33A4E6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:56:15 +0100 (CET)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLQI2-00087c-Fx
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lLQHH-0007dE-Sa
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:55:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:10753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lLQHF-0006SS-8t
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:55:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BCE6474581E;
 Sun, 14 Mar 2021 13:55:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9A1157456E3; Sun, 14 Mar 2021 13:55:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9899B7456B7;
 Sun, 14 Mar 2021 13:55:22 +0100 (CET)
Date: Sun, 14 Mar 2021 13:55:22 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not raise keys before QEMU resigns active
In-Reply-To: <20210314070147.34731-1-akihiko.odaki@gmail.com>
Message-ID: <924e0f6-1981-8c7f-4568-a03c2b17d02c@eik.bme.hu>
References: <20210314070147.34731-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021, Akihiko Odaki wrote:
> ui/cocoa used to raise all keys before it resigns active to prevent a
> stuck key problem caused by key up events it does not see while it is
> inactive. The problem is solved by checking -[NSEvent modifierFlags] in
> commit 6d73bb643aa725348aabe6a885ac5fb0b7f70252, which is better
> because it handles the case that key *down* events are missed while it
> is inactive.

Does that commit also handle other keys than modifier keys? It's unlikely 
those get stuck but is that possible? The most likely case to happen is 
pressing Cmd+Tab to switch away and Cmd may get stuck. Can Tab get also 
stuck? Or what if you hold down space or some other key while switching 
away either with Cmd+Tab or with the mouse? That may not be a common case 
but is this here to handle that or they are already handled elsewhere so 
this is really not necessary to prevent stuck keys?

Regards,
BALATON Zoltan

> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> ui/cocoa.m | 20 --------------------
> 1 file changed, 20 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index a7848ae0a30..ac8989947f5 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -326,7 +326,6 @@ - (BOOL) isAbsoluteEnabled;
> - (float) cdx;
> - (float) cdy;
> - (QEMUScreen) gscreen;
> -- (void) raiseAllKeys;
> @end
>
> QemuCocoaView *cocoaView;
> @@ -996,18 +995,6 @@ - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> - (float) cdx {return cdx;}
> - (float) cdy {return cdy;}
> - (QEMUScreen) gscreen {return screen;}
> -
> -/*
> - * Makes the target think all down keys are being released.
> - * This prevents a stuck key problem, since we will not see
> - * key up events for those keys after we have lost focus.
> - */
> -- (void) raiseAllKeys
> -{
> -    with_iothread_lock(^{
> -        qkbd_state_lift_all_keys(kbd);
> -    });
> -}
> @end
>
>
> @@ -1143,13 +1130,6 @@ - (BOOL)windowShouldClose:(id)sender
>     return NO;
> }
>
> -/* Called when QEMU goes into the background */
> -- (void) applicationWillResignActive: (NSNotification *)aNotification
> -{
> -    COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
> -    [cocoaView raiseAllKeys];
> -}
> -
> /* We abstract the method called by the Enter Fullscreen menu item
>  * because Mac OS 10.7 and higher disables it. This is because of the
>  * menu item's old selector's name toggleFullScreen:
>

