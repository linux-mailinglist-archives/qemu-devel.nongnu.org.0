Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFA606515
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:51:25 +0200 (CEST)
Received: from localhost ([::1]:44056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXpK-0006QK-By
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:51:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXoo-0000wm-96
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olUrI-00005J-DP; Thu, 20 Oct 2022 08:41:39 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:60030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olUrE-0001lK-Dx; Thu, 20 Oct 2022 08:41:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VSfCapS_1666269594; 
Received: from 30.221.96.197(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSfCapS_1666269594) by smtp.aliyun-inc.com;
 Thu, 20 Oct 2022 20:39:55 +0800
Message-ID: <b8817fbe-0851-0de0-f2c9-216f06c8fe7d@linux.alibaba.com>
Date: Thu, 20 Oct 2022 20:39:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-4-zhiwei_liu@linux.alibaba.com>
 <3390d4b8-ce83-ef7a-5384-302109915eb8@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <3390d4b8-ce83-ef7a-5384-302109915eb8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2022/10/20 19:31, Richard Henderson wrote:
> On 10/20/22 20:41, LIU Zhiwei wrote:
>> It's not clear what it is doing here. And it's wrong because bl and
>> al are both register, so we can't add them by an ADDI instruction.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index bfdf2bea69..a07fd0864f 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -705,9 +705,6 @@ static void tcg_out_addsub2(TCGContext *s,
>>                   tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
>>                                   rl, al);
>>               }
>> -        } else if (rl == al && rl == bl) {
>> -            tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
>> -            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
>>           } else {
>
> Removing this is incorrect; it's a simple typo for opc_add.
>
> The case being required for rl == al == bl, which the following else 
> will treat incorrectly.

Thanks. Get it.

Zhiwei

>
>
> r~

