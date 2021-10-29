Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA243FBF1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:00:08 +0200 (CEST)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQYJ-0007Ub-Kx
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQXT-0006qO-Ky
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:59:15 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQXQ-0000lJ-KC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:59:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C7147748F4B;
 Fri, 29 Oct 2021 13:59:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9E9E4748F57; Fri, 29 Oct 2021 13:59:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9C8E9748F53;
 Fri, 29 Oct 2021 13:59:09 +0200 (CEST)
Date: Fri, 29 Oct 2021 13:59:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 18/23] hw/intc/sh_intc: Simplify allocating sources
 array
In-Reply-To: <4d81b027-1ef1-ae56-1c77-262f9ac52e8d@amsat.org>
Message-ID: <758e4b7-30c0-8ad3-bc9-4b43dae3e71@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <7257db154178303a7913986e230ec0ce1af387cd.1635449225.git.balaton@eik.bme.hu>
 <4d81b027-1ef1-ae56-1c77-262f9ac52e8d@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-287447376-1635508749=:48739"
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

--3866299591-287447376-1635508749=:48739
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/28/21 21:27, BALATON Zoltan wrote:
>> Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
>> variable assignments.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/intc/sh_intc.c | 13 +++----------
>>  1 file changed, 3 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
>> index eb58707e83..ed0a5f87cc 100644
>> --- a/hw/intc/sh_intc.c
>> +++ b/hw/intc/sh_intc.c
>> @@ -400,21 +400,14 @@ int sh_intc_init(MemoryRegion *sysmem,
>>      /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
>>      desc->iomem_aliases = g_new0(MemoryRegion,
>>                                   (nr_mask_regs + nr_prio_regs) * 4);
>> -
>> -    j = 0;
>> -    i = sizeof(struct intc_source) * nr_sources;
>> -    desc->sources = g_malloc0(i);
>> -
>> +    desc->sources = g_new0(struct intc_source, nr_sources);
>
> g_new() is enough, since all get initialized in the next line.

Only their parent fields get init not the whole struct so I think g_new0 
is still needed.

>>      for (i = 0; i < desc->nr_sources; i++) {
>
> Even clearer as:
>
>       for (i = 0; i < nr_sources; i++) {

This may be a small improvement but not too much, desc->sources is 
assigned a few lines before. I consider this change but not sure about the 
g_new0.

Regards,
BALATON Zoltan

>> -        struct intc_source *source = &desc->sources[i];
>> -
>> -        source->parent = desc;
>> +        desc->sources[i].parent = desc;
>>      }
>> -
>>      desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
>>      memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
>>                            0x100000000ULL);
>> -
>> +    j = 0;
>>      if (desc->mask_regs) {
>>          for (i = 0; i < desc->nr_mask_regs; i++) {
>>              struct intc_mask_reg *mr = &desc->mask_regs[i];
>>
>
>
--3866299591-287447376-1635508749=:48739--

