Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F85825FB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:59:14 +0200 (CEST)
Received: from localhost ([::1]:46858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfh3-0002Yh-5Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oGfdX-000826-5v; Wed, 27 Jul 2022 07:55:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:10780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oGfdT-0002tr-Uh; Wed, 27 Jul 2022 07:55:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB59D7462D3;
 Wed, 27 Jul 2022 13:55:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A910B7461AE; Wed, 27 Jul 2022 13:55:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A6374745702;
 Wed, 27 Jul 2022 13:55:26 +0200 (CEST)
Date: Wed, 27 Jul 2022 13:55:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
In-Reply-To: <a7f02b8a-a132-5b8f-6ceb-0d6920ce2a22@kaod.org>
Message-ID: <77d060c0-6b8a-5c20-58c0-ed6f0d45e99@eik.bme.hu>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <a7f02b8a-a132-5b8f-6ceb-0d6920ce2a22@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-283347017-1658922926=:85747"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-283347017-1658922926=:85747
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Jul 2022, Cédric Le Goater wrote:
> On 7/26/22 20:23, Peter Maydell wrote:
>> This patchset is mainly trying to fix a problem that Coverity spotted
>> in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the code
>> is not correctly using the cpu_physical_memory_map() function.

Likely I did not know how this function works when implementing it and may 
have used it wrong but none of the reviews spotted it either. (I may have 
used some other DMA device model as an inspiration but don't remember 
which.)

>> While I was fixing that I noticed a second problem in this code,
>> where it doesn't have a fallback for when cpu_physical_memory_map()
>> says "I couldn't map that for you".

When can that happen? If only in cases when guest gives invalid parameters 
then maybe we don't have to bother with that and can let it fail but 
having a fallback does not hurt.

>> I've marked these patches as RFC, partly because I don't have any
>> guest that would exercise the code changes[*], 
>
> I build these :
>
>  https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot/qemu_ppc_sam460ex-2022.02-4-geae5011c83-20220309
>
> but none of the DCR DMA registers are used.

To my knowledge only AmigaOS needs it but that does use it and it boots 
and runs so this is not completely broken but maybe mapping random length 
memory areas could cause some problems if the length mapped is less than 
needed. I've seen random crashes with AmigaOS before that I could not 
explain but that seems to be related to processor speed (happens more on 
slower host) so it seems more like a race condition not wrong DMA and 
haven't seen it recently.

> There are images for the sam460ex images here :
>
>  http://www.aros.org/nightly1.php
>
> But AFAICT, it does not go beyond the bootloader.

Those did boot before (may take a while due to bitbanging i2c driver in 
guest taking time to read RTC) but haven't checked for a while. It could 
be some changes in AROS broke it or some recent change in QEMU. I'll test 
these later when I'll have some time.

>> and partly because
>> I don't have any documentation of the hardware to tell me how it
>> should behave, so patch 2 in particular has some FIXMEs. I also

I remember I've found some info on this in some similar SoC that had docs 
on-line but don't remember which. Maybe 440EPx/GPx or something like that. 
It may not be the same but seems similar enough for AmigaOS to work. I 
think the two main sources were PPC440EPx/GRx Embedded Processor User's 
Manual and NXP/Freescale Application Note AN2661 Software Migration from 
the IBM (AMCC) 440GP to the MPC8540 which seem to be similar to 460EX and 
have some info on the DMA controller registers.

>> notice that the code doesn't update any of the registers like the
>> count or source/base addresses when the DMA transfer happens, which
>> seems odd, but perhaps the real hardware does work like that.

The emulation is only partial, I were only concerned about the parts 
AmigaOS uses so it may be some things are off. The docs above talk about 
some increment bits so this may be settable but I did not read the whole 
docs again and don't remember anything about it now. Probably AmigaOS does 
not use it so I did not implement that.

I was going to test the first rc with all OSes I have on sam460ex and 
pegasos2 but maybe I'll try to do it this week then.

Regards,
BALATON Zoltan

>> I think we should probably take patch 1 (which is a fairly minimal
>> fix of the use-of-uninitialized-data problem),
>
> LGTM,
>
> Thanks,
>
> C.
>
>
>
>
>> but patch 2 is a bit more unfinished.
>> 
>> [*] The commit 3c409c1927efde2fc that added this code says it's used
>> by AmigaOS.)
>> 
>> thanks
>> -- PMM
>> 
>> Peter Maydell (2):
>>    hw/ppc/ppc440_uc: Initialize length passed to
>>      cpu_physical_memory_map()
>>    hw/ppc/ppc440_uc: Handle mapping failure in DMA engine
>>
>>   hw/ppc/ppc440_uc.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>> 
>
>
--3866299591-283347017-1658922926=:85747--

