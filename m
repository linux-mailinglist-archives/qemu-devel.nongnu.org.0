Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025534405E6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:51:44 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbex-0001Mb-3v
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbbT-0006R4-6y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:48:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbbQ-0007TC-EF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:48:05 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F28E8748F4B;
 Sat, 30 Oct 2021 01:48:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CDFE2746333; Sat, 30 Oct 2021 01:48:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CC1547462D3;
 Sat, 30 Oct 2021 01:48:02 +0200 (CEST)
Date: Sat, 30 Oct 2021 01:48:02 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 22/30] hw/intc/sh_intc: Inline and drop sh_intc_source()
 function
In-Reply-To: <8ca6ad2d-c04c-b299-437c-1724c79c8551@amsat.org>
Message-ID: <f43fa362-83f5-c62f-eb4d-9be130cf2827@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <a98d1f7f94e91a42796b7d91e9153a7eaa3d1c44.1635541329.git.balaton@eik.bme.hu>
 <8ca6ad2d-c04c-b299-437c-1724c79c8551@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1470193298-1635551282=:5796"
X-Spam-Probability: 9%
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1470193298-1635551282=:5796
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
>> This function is very simple and provides no advantage. Call sites
>> become simpler without it so just write it in line and drop the
>> separate function.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/intc/sh_intc.c        | 54 ++++++++++++++++------------------------
>>  hw/sh4/sh7750.c          |  4 +--
>>  include/hw/sh4/sh_intc.h |  2 +-
>>  3 files changed, 25 insertions(+), 35 deletions(-)
>
>>  static void sh_intc_register_source(struct intc_desc *desc,
>>                                      intc_enum source,
>>                                      struct intc_group *groups,
>>                                      int nr_groups)
>>  {
>>      unsigned int i, k;
>> -    struct intc_source *s;
>> +    intc_enum id;
>>
>
> Maybe:
>
>       assert(source != UNUSED);
>
>>      if (desc->mask_regs) {
>>          for (i = 0; i < desc->nr_mask_regs; i++) {
>>              struct intc_mask_reg *mr = &desc->mask_regs[i];
>>
>>              for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
>> -                if (mr->enum_ids[k] != source) {
>> -                    continue;
>> -                }
>> -                s = sh_intc_source(desc, mr->enum_ids[k]);
>> -                if (s) {
>> -                    s->enable_max++;
>> +                id = mr->enum_ids[k];
>> +                if (id && id == source) {
>
> Then you can drop the 'id' checks.

I've tried to preserve the original brhaviour in this patch and not change 
it for now. This will need to be rewritten anyway beause it does not 
handle priorities and hard to QOM-ify as it is so I'll come back to this 
where these will probably change, so for now just leave it to keep the 
existing behaviour. Then we can revise it later in separate patch.

Thanks for taking the time to review my patches, much appreciated.

Regards,
BALATON Zoltan

>> +                    desc->sources[id].enable_max++;
>>                  }
>>              }
>>          }
>
>
--3866299591-1470193298-1635551282=:5796--

