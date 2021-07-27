Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966743D70DB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:08:49 +0200 (CEST)
Received: from localhost ([::1]:52420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8I8u-0004NE-LS
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8I6a-0002iq-NE
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:06:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56684 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8I6X-0001Y0-Gb
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:06:24 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx70Byvv9g3XQkAA--.45413S3; 
 Tue, 27 Jul 2021 16:06:12 +0800 (CST)
Subject: Re: [PATCH v2 16/22] target/loongarch: Add floating point move
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-17-git-send-email-gaosong@loongson.cn>
 <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <2c3e340c-73f4-408d-4ece-a857a699da22@loongson.cn>
Date: Tue, 27 Jul 2021 16:06:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx70Byvv9g3XQkAA--.45413S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCryxWr4kZry7KFy8AF1DKFg_yoW5trW3pr
 97ArW5JrWUJFs3Jr13Ja45XFy5Ar18K3WUJF1xX3W5AF4UAr1Iqr1UXr1qgFyUJw48Jr1U
 Aw1UZr4UuFyUXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUp6wZUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 07/23/2021 02:29 PM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> This patch implement floationg point move instruction translation.
>>
>> This includes:
>> - FMOV.{S/D}
>> - FSEL
>> - MOVGR2FR.{W/D}, MOVGR2FRH.W
>> - MOVFR2GR.{S/D}, MOVFRH2GR.S
>> - MOVGR2FCSR, MOVFCSR2GR
>> - MOVFR2CF, MOVCF2FR
>> - MOVGR2CF, MOVCF2GR
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/fpu_helper.c |  80 +++++++++++++
>>   target/loongarch/helper.h     |   6 +
>>   target/loongarch/insns.decode |  41 +++++++
>>   target/loongarch/trans.inc.c  | 270 ++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 397 insertions(+)
>>
>> diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
>> index 162085a..7662715 100644
>> --- a/target/loongarch/fpu_helper.c
>> +++ b/target/loongarch/fpu_helper.c
>> @@ -379,6 +379,11 @@ uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
>>       return fp1;
>>   }
>>   +void helper_movreg2cf(CPULoongArchState *env, uint32_t cd, target_ulong src)
>> +{
>> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
>> +}
> 
> tcg_gen_andi_tl + tcg_gen_st8_tl.
> 
OK.
>> +target_ulong helper_fsel(CPULoongArchState *env, target_ulong fj,
>> +                         target_ulong fk, uint32_t ca)
>> +{
>> +    if (env->active_fpu.cf[ca & 0x7]) {
>> +        return fk;
>> +    } else {
>> +        return fj;
>> +    }
>> +}
> 
> tcg_gen_movcond_i64.
> 
OK.
>> +void helper_movgr2fcsr(CPULoongArchState *env, target_ulong arg1,
>> +                       uint32_t fcsr)
>> +{
>> +    switch (fcsr) {
>> +    case 0:
>> +        env->active_fpu.fcsr0 = arg1;
>> +        break;
>> +    case 1:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M1) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M1);
>> +        break;
>> +    case 2:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M2) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M2);
>> +        break;
>> +    case 3:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M3) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M3);
>> +        break;
> 
> This is easily implemented inline, followed by a single helper call to re-load the rounding mode (if required by the mask).
> 
OK.
>> +    case 16:
>> +        env->active_fpu.vcsr16 = arg1;
>> +        break;
> 
> The documentation I have does not describe the vector stuff?
> 

Yes, It is described in Volume II, but now  I need remove it .

>> +    default:
>> +        printf("%s: warning, fcsr '%d' not supported\n", __func__, fcsr);
>> +        assert(0);
>> +        break;
> 
> No printfs, no assert.  This should have been caught by
> 
>> +target_ulong helper_movcf2reg(CPULoongArchState *env, uint32_t cj)
>> +{
>> +    return (target_ulong)env->active_fpu.cf[cj & 0x7];
>> +}
> 
> tcg_gen_ld8u_tl.
>
OK.> 
> r~

Again. Thank you kindly help.

Thanks
Song Gao.


