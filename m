Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5F5BB775
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 11:14:25 +0200 (CEST)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZTu3-00010o-Mv
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 05:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZTsI-00080Q-JR
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 05:12:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36538 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZTsE-0003F2-Hv
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 05:12:33 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72t5jyVjahQcAA--.38290S3; 
 Sat, 17 Sep 2022 17:12:26 +0800 (CST)
Subject: Re: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
To: qemu-devel@nongnu.org
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-6-gaosong@loongson.cn>
 <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <df217ffa-57e1-3e71-f766-fa19770bfe33@loongson.cn>
Date: Sat, 17 Sep 2022 17:12:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cx72t5jyVjahQcAA--.38290S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw15ZFy3CF15AF1kGr1DAwb_yoW5ZF4DpF
 1kKrWaqFW8ZF95Jw42va1UZFy7Jr9Yka1jq34Iq3WUGF43Zr1jgr4xWrnIgry0kayrZw4r
 AFyY9wnruF45JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
 cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
 AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
 6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14
 v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80
 ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjxU2xR6UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.816,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2022/9/17 下午4:59, Qi Hu 写道:
>
> On 2022/9/17 15:59, Song Gao wrote:
>> div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the result 
>> is 0.
>
> The message has a typo: "div,w" => "div.w"
>
> Also I don't know why we need to do this, since the manual say: "When 
> the divisor is 0, the result can be any value".
>
I tested on LoongArch host,   the result is always 0.

>> So we set the divisor to 1 and the dividend to 0.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/insn_trans/trans_arith.c.inc | 34 +++++++++++++++----
>>   1 file changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/loongarch/insn_trans/trans_arith.c.inc 
>> b/target/loongarch/insn_trans/trans_arith.c.inc
>> index 8e45eadbc8..c97afb16f9 100644
>> --- a/target/loongarch/insn_trans/trans_arith.c.inc
>> +++ b/target/loongarch/insn_trans/trans_arith.c.inc
>> @@ -147,12 +147,28 @@ static void prep_divisor_du(TCGv ret, TCGv src2)
>>       tcg_gen_movcond_tl(TCG_COND_EQ, ret, src2, zero, one, src2);
>>   }
>>   +static void prep_div(TCGv divisor, TCGv dividend, TCGv src1, TCGv 
>> src2)
>> +{
>> +    TCGv zero = tcg_constant_tl(0);
>> +    TCGv one = tcg_constant_tl(1);
>> +
>> +    /*
>> +     * If x / 0, set the diviend to 0 set the divisor to 1
>> +     * this is the same with LoongArch host.
>> +     */
>> +    tcg_gen_movcond_tl(TCG_COND_EQ, dividend, src2, zero, zero, src1);
>> +    tcg_gen_movcond_tl(TCG_COND_EQ, divisor, src2, zero, one, src2);
>> +}
>> +
>>   static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
>>   {
>>       TCGv t0 = tcg_temp_new();
>> -    prep_divisor_d(t0, src1, src2);
>> -    tcg_gen_div_tl(dest, src1, t0);
>> +    TCGv t1 = tcg_temp_new();
>> +
>> +    prep_div(t0, t1, src1, src2);
>> +    tcg_gen_div_tl(dest, t1, t0);
>>       tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>>   }
>>     static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
>> @@ -166,9 +182,11 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv 
>> src2)
>>   static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
>>   {
>>       TCGv t0 = tcg_temp_new();
>> -    prep_divisor_du(t0, src2);
>> -    tcg_gen_divu_tl(dest, src1, t0);
>> +    TCGv t1 = tcg_temp_new();
>> +    prep_div(t0, t1, src1, src2);
>> +    tcg_gen_divu_tl(dest, t1, t0);
>>       tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>>   }
>>     static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
>> @@ -182,10 +200,12 @@ static void gen_rem_du(TCGv dest, TCGv src1, 
>> TCGv src2)
>>   static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
>>   {
>>       TCGv t0 = tcg_temp_new();
>> -    /* We need not check for integer overflow for div_w. */
>> -    prep_divisor_du(t0, src2);
>> -    tcg_gen_div_tl(dest, src1, t0);
>> +    TCGv t1 = tcg_temp_new();
>> +
>> +    prep_div(t0, t1, src1, src2);
>> +    tcg_gen_div_tl(dest, t1, t0);
>>       tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>>   }
>>     static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
>


