Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3C4405D7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:43:07 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbWc-0000Fc-0G
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbQ3-0006uj-Sz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:36:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbQ1-0002Ii-7M
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:36:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CD2A7475FA;
 Sat, 30 Oct 2021 01:36:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F37FC746333; Sat, 30 Oct 2021 01:36:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EF72B7462D3;
 Sat, 30 Oct 2021 01:36:14 +0200 (CEST)
Date: Sat, 30 Oct 2021 01:36:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 29/30] hw/timer/sh_timer: Fix timer memory region size
In-Reply-To: <abe8c599-11b7-ea53-a22c-44846d6ffa2a@amsat.org>
Message-ID: <851b67-fd93-ec4a-cb80-3fd83a9a374@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
 <abe8c599-11b7-ea53-a22c-44846d6ffa2a@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1581180928-1635550574=:5796"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1581180928-1635550574=:5796
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
>> The timer memory region is only accessed via aliases that are 0x1000
>> bytes long, no need to have the timer region larger than that.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/timer/sh_timer.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
>> index 250ad41b48..a6445092e4 100644
>> --- a/hw/timer/sh_timer.c
>> +++ b/hw/timer/sh_timer.c
>> @@ -350,8 +350,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
>>                                      ch2_irq0); /* ch2_irq1 not supported */
>>      }
>>
>> -    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
>> -                          "timer", 0x100000000ULL);
>> +    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x1000);
>
> Per the manual (R01UH0457EJ0401 Rev. 4.01 [*]) Page 317/1128, Table
> 12.2 "TMU Registers" the first 3 timers (implemented by the tmu012_state
> structure) fit in a region of 0x30 bytes.

Sent a v7 of this patch only changing it to 0x30 with which the Linux 
image I've tested still boots but don't know if it uses a timer at all.

> Looking at hw/timer/sh_timer.c I only see a maximum access of 0x40,

Where do you see 0x40?

> where 0x1000 comes from? The P4/A7 aliases?

Yes, as the commit message said. Since this was a last minute change I 
tried to be safe and not change anything guest visible at this point.

> If you have a way to test and ack, I can replace by 0x40 when applying.

If you think 0x40 is better then I'm fine with that but I don't see a 
register after 0x2c which is 32 bits so 0x30 length should be enough 
according to that.

Regards.
BALATON Zoltan

> [*]
> https://www.renesas.com/us/en/document/mah/sh7751-group-sh7751r-group-users-manual-hardware?language=en&r=1055171
>
>
--3866299591-1581180928-1635550574=:5796--

