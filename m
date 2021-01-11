Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531182F1096
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:54:13 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyupv-0005GQ-Uh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuor-0004oU-Ol
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:53:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:11153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuoo-0005d5-PM
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:53:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 68FD1746552;
 Mon, 11 Jan 2021 11:52:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35B0874645F; Mon, 11 Jan 2021 11:52:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 33EAB74645B;
 Mon, 11 Jan 2021 11:52:57 +0100 (CET)
Date: Mon, 11 Jan 2021 11:52:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
In-Reply-To: <CAFEAcA8trw0PNeDaQq3dZa0q4qYoXF35ROLMHDw3qnJ=wX+vvw@mail.gmail.com>
Message-ID: <511824ac-965b-2846-c57b-c3afa5bb85d8@eik.bme.hu>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
 <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
 <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
 <29acb49a-4d1-ae6b-328d-6e3081e2ab2f@eik.bme.hu>
 <CAFEAcA8trw0PNeDaQq3dZa0q4qYoXF35ROLMHDw3qnJ=wX+vvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021, Peter Maydell wrote:
> On Mon, 11 Jan 2021 at 10:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Mon, 11 Jan 2021, Jiaxun Yang wrote:
>>> On Mon, Jan 11, 2021, at 8:36 AM, Huacai Chen wrote:
>>>> I think R_END should be 0x60, Jiaxun, what do you think?
>>>
>>> U r right.
>>> The manual is misleading.
>>
>> The R_END constant is also used in loongson_liointc_init() for the length
>> of the memory region so you might want to revise that. If this is a 32 bit
>> register then you should decide what R_END means? Is it the end of the
>> memory region in which case the reg starts at R_END - 4 or is it the
>> address of the last reg in which case the memory region ends at R_END + 4.
>> From the above I think it's the address of the last reg so you'll probably
>> need to add 4 in loongson_liointc_init() when creating the memory region.
>
> Mmm, or check
>  (addr >= R_START && addr < (R_START + R_ISR_SIZE * NUM_CORES))

That was basically the original version just hiding the calculation in a 
macro so we could also just drop this part of the patch and be happy with 
it :-) "If it ain't broke, don't fix it"

> Side note: R_ISR_SIZE is 8, but the code makes both the
> 32-bit addresses you can read/write in that 8-byte range
> behave the same way. Is that really what the hardware does ?
> Or does it actually have 1 32-bit register per core, spaced
> 8 bytes apart ?

This might turn into a bike shed thread but I just thought: would 
range_covers_byte() or ranges_overlap() be useful here to test if addr is 
within the regs area? I've used that in vt82c686.c::pm_write_config(). 
That might actually be simpler if that worked.

Regards,
BALATON Zoltan

