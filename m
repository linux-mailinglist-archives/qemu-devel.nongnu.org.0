Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2351E7AF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 16:11:02 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnL9B-0002mk-5S
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 10:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nnL7W-0001Fc-7N; Sat, 07 May 2022 10:09:18 -0400
Received: from mail1.sfc.wide.ad.jp ([2001:200:0:8803:203:178:142:133]:60924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nnL7S-0002zg-10; Sat, 07 May 2022 10:09:16 -0400
Received: from [10.0.1.12] (h219-110-166-078.catv02.itscom.jp [219.110.166.78])
 (Authenticated sender: mkei)
 by mail1.sfc.wide.ad.jp (Postfix) with ESMTPSA id 41DED119F6;
 Sat,  7 May 2022 23:09:03 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sfc.wide.ad.jp;
 s=mail1; t=1651932543;
 bh=ufGruaehO3lNVmQdRgD7l1kEibVecZJBsK+Z/0Uc86k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=abUiyVBHvxkVaKWt8sLdKqIURDs7TnPsUFEZRgPWhwerjkiftYfm4JbOqrpEp8CcK
 NB/uBxc7vZu3jLIeB/gW2SA80xAkh5pyXzfFLyVwHeqgaTzWmoyrzs1ODFsdQvuwDb
 Fb59PSnHUalVY3Ay4z3uU+dePfYC3tPaFlxTlAUOi/Qe1VBe7PnWIe7bdEHKW6Nbi/
 2MjjTswFjFh3KaLGDGaTldZLCkEtqrLaH6vsE3HZKZwLkg1TflKks8CNejU11bFcKn
 OzS+WjBEeZ45R1QoEYKRRzvqlGxYbllfS6sVNKaHyXQeVcDmJMOqtdP8q7fd4i7FbX
 Aj+TaUr6BcrUQ==
Message-ID: <abf37429-df24-4e68-b1d8-be54d3c0f732@sfc.wide.ad.jp>
Date: Sat, 7 May 2022 23:09:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] target/arm: fix s2mmu input size check
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220505031234.20349-1-mkei@sfc.wide.ad.jp>
 <bc338b3d-06dd-6658-5601-0cc30d6689e2@linaro.org>
From: Keisuke Iida <mkei@sfc.wide.ad.jp>
In-Reply-To: <bc338b3d-06dd-6658-5601-0cc30d6689e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:200:0:8803:203:178:142:133;
 envelope-from=mkei@sfc.wide.ad.jp; helo=mail1.sfc.wide.ad.jp
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2022/05/06 1:13, Richard Henderson wrote:
> On 5/4/22 22:12, mkei@sfc.wide.ad.jp wrote:
>> From: Keisuke Iida <mkei@sfc.wide.ad.jp>
>>
>> The maximum IPA size('inputsize') is constrained by the implemented 
>> PA size that is
>> specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm 
>> Architecture Reference
>> Manual for A-profile architecture "Supported IPA size" on page D5-4788.
>>
>> Signed-off-by: Keisuke Iida <mkei@sfc.wide.ad.jp>
>> ---
>>   target/arm/helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5a244c3ed9..868e7a2c0b 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, 
>> bool is_aa64, int level,
>>           }
>>             /* Inputsize checks.  */
>> -        if (inputsize > outputsize &&
>> +        if (inputsize > arm_pamax(cpu) &&
>
>
> This is incorrect -- arm_pamax has already been taken into account in 
> computing outputsize.  There are many more constraints than just this.
>
> You need to have a look at the computation of ps and tsz in 
> aa64_va_parameters, and then the computation of outputsize near the 
> beginning of get_phys_addr_lpae, which takes arm_pamax into account by 
> bounding ps against ID_AA64MMFR0.PARANGE, and pamax_map.
>
> What problem are you encountering?
>
Address Translation Fault is triggered when PA size set by VTCR_EL2.PS 
is less than IPA size set by VTCR_EL2.T0SZ on the guest. (e.g. 
vtcr_el2.PS = 1 && vtcr_el2.T0SZ = 25. PA size is 36bit, and IPA size is 
39bit.)

In this case, inputsize = 39 and outputsize = 36, so inputsize > 
outputsize is true and a fault is triggered.

This behavior means that the effective minimum VTCR_EL2.T0SZ value 
depends on VTCR_EL2.PS set by guest.

Is this the expected behavior for qemu?

As a side note, this does not happen before qemu 6.2.

>
> r~

--

Keisuke Iida <mkei@sfc.wide.ad.jp>


