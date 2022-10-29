Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A375C6122F8
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 14:38:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ool4V-00025i-9x; Sat, 29 Oct 2022 08:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ool4J-00025M-Sl; Sat, 29 Oct 2022 08:36:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ool4D-00039T-6E; Sat, 29 Oct 2022 08:36:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 83E6D74633D;
 Sat, 29 Oct 2022 14:35:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3829574632B; Sat, 29 Oct 2022 14:35:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 363C5746307;
 Sat, 29 Oct 2022 14:35:54 +0200 (CEST)
Date: Sat, 29 Oct 2022 14:35:54 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v4 16/19] mac_newworld: Add machine types for different
 mac99 configs
In-Reply-To: <d9cc2bd3-729a-82c8-eaf1-645e9af0d563@ilande.co.uk>
Message-ID: <95a63671-c520-2b7f-2541-f2325e21d386@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <7114fc8a10d7359f354a7dbee364a520dcf362df.1666715145.git.balaton@eik.bme.hu>
 <948ef9f2-452f-9c0a-11e1-4dcee3bac3ff@ilande.co.uk>
 <3f919172-4259-31a4-28ef-f87812238a21@eik.bme.hu>
 <d9cc2bd3-729a-82c8-eaf1-645e9af0d563@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 29 Oct 2022, Mark Cave-Ayland wrote:
> On 28/10/2022 13:18, BALATON Zoltan wrote:
>> On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
>>> On 25/10/2022 17:44, BALATON Zoltan wrote:
>>>> The mac99 machine emulates different machines depending on machine
>>>> properties or even if it is run as qemu-system-ppc64 or
>>>> qemu-system-ppc. This is very confusing for users and many hours were
>>>> lost trying to explain it or finding out why commands users came up
>>>> with are not working as expected. (E.g. Windows users might think
>>>> qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
>>>> then fail to boot a 32 bit OS with -M mac99 trying to follow an
>>>> example that had qemu-system-ppc.) To avoid such confusion, add
>>>> explicit machine types for the different configs which will work the
>>>> same with both qemu-system-ppc and qemu-system-ppc64 and also make the
>>>> command line clearer for new users.
>>> 
>>> What was the outcome of the discussion re: having separate machines for 
>>> 32-bit and 64-bit PPC targets? My understanding is the issue here was 
>>> deciding what to do, rather than actually making the code changes.
>> 
>> Who do you think will or should decide about this? There are about 3 people 
>> who care about Mac emulation on this list: you, Howard and me. You already 
>> have my and Howard's vote to introduce these machines types. Who else 
>> should vote or decide on this? Please apply this patch now and if it causes 
>> problem it can still be dropped duting the freeze but if you don't apply it 
>> now it can't get into before next spring.
>
> This is not restricted to qemu-system-ppc though: there was a discussion 
> (which was still ongoing) as to how all of QEMU should handle 32-bit and 
> 64-bit machines i.e. should qemu-system-ppc64 only contain 64-bit machines 
> and qemu-system-ppc only contain 32-bit machines? If we wish to make a change 
> here, we should wait for the outcome of this to ensure consistency here.

That's unrelated to mac99 then so we can sort that out independently now 
as this will be needed anyway to remove the confusing behaviour of mac99 
emulating different machines depending if it's part of qemu-system-ppc or 
qemu-system-ppc64. Whatever the decision with 32 vs 64 bit will be this 
will have to go so better deprecate it now so we can more easily adapt 
whatever that decision will be (if it will have a decision in the near 
fututre at all). I don't think that's a good reason to ditch this patch as 
I don't see this is getting to a decision soon which would need doing else 
than deprecating mac99.

>>> Also what was your motivation for choosing the machine names? I see you've 
>>> used powerbook for via=pmu-adb, but I think quite a few people use pmu-adb 
>>> for older OS X server hardware. At the very least some pointers to 
>>> reference device trees and some rationale behind the decision is needed 
>>> for review.
>> 
>> See my reply to Howard's message with some more info and links. My 
>> immediate motivation was that we've lost about two days when somobody 
>> contacted me about VGA pass through sending logs about all kinds of 
>> failures he got. After many logs I've noticed that he was using 
>> qemu-system-ppc64 -M mac99,via=pmu thinking that on 64bit host that's the 
>> executable he should use. Unfortunately the commands were not shared just 
>> the logs so this took a while to notice. Also if you look at the forum 
>> Howard runs you can see this problem is coming up frequently and I think 
>> the've also lost countless hours due to this. It's about time to put an end 
>> on it and stop wasting othet's time. As for The machines, the powermac ones 
>> are straight forward as those are closest to what we emulate for G4 and G5 
>> Mac. I've chosen the powerbook becuase that's the only machine I know that 
>> had PMU and ADB but If someone knows a better machine we can change this 
>> (even as bug fix during the freeze). Here's some info on this powerbook: 
>> https://ppc.0penbsd.narkive.com/s49Kcx1u/x-on-powerbook-g4
>
> In all my time working on QEMU this has happened to me once: yes, I agree it 
> can be annoying but given how rare it happens I don't see a need to make a 
> rushed decision now.

Maybe because you don't work with users like Howard or don't work with 
ati-vga like me. But we got this problem many times, I've got bitten by 
forgetting the vga-ndrv? option several times and had to remember this is 
breaking stuff so that this works for you is no reason to believe it's not 
causing problems for anybody. A better approach may be if a proposed 
solution is not breaking anything for you then accept it rather than 
having the basic view of resisting any change from anywhere. As a private 
developer you can so that but as a maintainer you should not lock out 
others from contributing and be more accepting or other solutions.

> In terms of choosing the machines for QEMU we will need a full copy of the DT 
> from real hardware for comparison with OpenBIOS, and ideally a Linux dmesg.

I don't use that pmu-adb config and I think maybe we don't even need it 
once USB emulation is fixed on powermac3_1 as those OSes should support 
powermac3_1 or g3beige so I'm OK with dropping this powerbook machine for 
now and only merging the powermac3_1 and powermac7_3 machines which I care 
more about. Can you change the patches accordingly before merge or you 
want me to submit another version with this chnage? You could also take 
the first 14 patches if you're OK with them now so I have to resend less.

Regards,
BALATON Zoltan

