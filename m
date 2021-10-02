Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8641FCC6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 17:43:21 +0200 (CEST)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWhAV-0003C2-Ub
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 11:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWh9X-0002WM-9L
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 11:42:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWh9U-0004HP-Bk
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 11:42:18 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 104F37462D3;
 Sat,  2 Oct 2021 17:42:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E0518745953; Sat,  2 Oct 2021 17:42:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE9C57457EE;
 Sat,  2 Oct 2021 17:42:12 +0200 (CEST)
Date: Sat, 2 Oct 2021 17:42:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
Message-ID: <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Oct 2021, Howard Spoelstra wrote:
> Both have issues communicating with endpoint 4 (the hid controls volume
> up/down and mute).
> Endpoint 1 should receive the isochronous audio stream, but never does.
>
> After some experimentation with unplugging/plugging the headset and probing
> the usb stack (using the usb prober from the mac usb ddk for Mac OS 9.2) at
> some point endpoint 4 communication works for both guests tested. Only once
> was I able to get sound out and in working in Mac OS 9.2. For OSX I could
> only once get audio in working.

The async packets are on endpoint 0. I'm not sure the HID endpoint 4 is 
normally involved at all unless you push some buttons but it should work 
without that so maybe look at the 0 and the audio endpoints instead of 
HID that should have no traffic unless you press buttons.

> Pcap and text logs for both MacOS 9.2 and OSX 10.4 tests included...

These are way too big to be possible to find anything in them. Maybe you 
should do something simpler like boot the guest without the device 
attached and discard all logs up to that point. Then start collecting logs 
and attach device and play a short sound. Stop collecting log and try to 
make sense of where that fails. That's still a lot of traces but should 
only contain the relevant info of detecing the device and playing a sound 
not a lot of others that makes it difficult to find what's relevant.

I'm also not sure where's the problem (maybe we have multiple problems). 
It also does not work with an emulated usb-audio device but that also 
doesn't work with EHCI so it may have a problem by itself (UHCI also seems 
to be broken on its own so it does not even work as much as OHCI and 
EHCI). You've also said it worked with pass through with a different 
device so maybe this only happens with some devices or some sequence of 
things these devices are doing. Only allowing one async packet in OHCI 
instead of allowing one per endpoint is just a guess that could cause 
delays in processing other packets but eventually it should go through 
unless one async packet never completes and blocks all later ones or the 
delays introduced by this limitaion causes things to go in a way that 
guests don't expect and thus fail.

Regards,
BALATON Zoltan

