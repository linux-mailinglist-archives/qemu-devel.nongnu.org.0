Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85785420122
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 12:03:43 +0200 (CEST)
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWyLN-0002wG-KC
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 06:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWyIf-00028P-BN
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 06:00:53 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:37890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWyIb-0008Bc-Dx
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 06:00:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D4F757462D3;
 Sun,  3 Oct 2021 12:00:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ABD73745953; Sun,  3 Oct 2021 12:00:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A95C37457EE;
 Sun,  3 Oct 2021 12:00:45 +0200 (CEST)
Date: Sun, 3 Oct 2021 12:00:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
Message-ID: <c541324-ed75-e6d2-d9b8-2742baed30da@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
 <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
 <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
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

On Sun, 3 Oct 2021, Howard Spoelstra wrote:
> On Sat, Oct 2, 2021 at 5:42 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I'm also not sure where's the problem (maybe we have multiple problems).
>> It also does not work with an emulated usb-audio device but that also
>> doesn't work with EHCI so it may have a problem by itself (UHCI also seems
>> to be broken on its own so it does not even work as much as OHCI and
>> EHCI). You've also said it worked with pass through with a different
>> device so maybe this only happens with some devices or some sequence of
>> things these devices are doing. Only allowing one async packet in OHCI
>> instead of allowing one per endpoint is just a guess that could cause
>> delays in processing other packets but eventually it should go through
>> unless one async packet never completes and blocks all later ones or the
>> delays introduced by this limitaion causes things to go in a way that
>> guests don't expect and thus fail.
>>
> After some sifting through the logs, I my interpretation of our issue is
> this:
> Too many pending is referring to endpoint 0 when something is not
> completed. Qemu permantly checks endpoint 4 for hid activity, skips when no
> interrupt occurs. You can see both intermittently in the 1st log below.
> Too many pending refers to qemu not being able to fully read/get the device
> descriptors from boot. The too many pending is "solved", with a click on a
> hid button. That leads to async complete, after which the only activity is
> to check for interrupts from the hid devices.

That sounds like an async packet waiting on ep 4 blocks communication on 
ep 0 because we don't allow one active packet per ep in hcd-ohci as the 
comment says so this may be fixed by implementing that. But I'm not sure 
because this log did not include packet status. Maybe also enable 
usb_packet_state traces to confirm this. I may try to fix this, I have an 
idea how do it: I can pass the USBPacket back from the completion callback 
via OHCIState to ohci_service_td() but have to find a way to replace the 
various cancel calls that use the usb_packet from OHCIState now to stop 
relying on that and do it by ep or whatever they have. This needs some 
more thinking and understand the code and OHCI better.

I assume no more than one callback can be running at once so I can't get 
completion for two packets at the same time, therefore one pointer to pass 
back a packet is enough. I'll put an assert there and see what happens but 
if somebody knows please advise.

> However, as the descriptors from endpoint 0 are not fully read from boot,
> endpoint 1 (the actual audio stream) is not available.
> Unplugging/plugging the usb device in combination with some hid interrupts
> (me pushing the volume button) can sometimes reload the configuration
> correctly, so endpoint 1 becomes available and sound can be played through
> it.

Could be if guest driver starts polling ep 4 while still trying to talk to 
ep 0 which then fails due to packet waiting in async on ep 4. The emulated 
usb-audio may be different, that does not have HID endpoint only ep 0 for 
control and two audio ones and it seems to be detected but playing sound 
does not work. Does -device usb-audio instead of passed through device 
makes sound with your guest OSes or that has a separate problem?

Regards,
BALATON Zoltan

