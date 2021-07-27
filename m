Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3973D70B2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:57:53 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8HyK-0004f2-31
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8HxO-0003qE-Km
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:56:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54248 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8HxJ-0003Ri-Gp
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:56:54 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0E2vP9grHMkAA--.23678S3; 
 Tue, 27 Jul 2021 15:56:40 +0800 (CST)
Subject: Re: [PATCH v2 14/22] target/loongarch: Add floating point comparison
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-15-git-send-email-gaosong@loongson.cn>
 <e0a368a3-3f43-f5b9-b36b-7f9919148b77@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <228df9da-22ef-267d-121e-b05b506879e1@loongson.cn>
Date: Tue, 27 Jul 2021 15:56:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e0a368a3-3f43-f5b9-b36b-7f9919148b77@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0E2vP9grHMkAA--.23678S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUZFyDuw4fAry7Ww43trb_yoW8KF48pr
 ykJr47JryUJF4rJr1UJwnYqa4UAr18tan8Cr1kXas8Ar4UZr1I9rWjqrs09F1UJrW8Wr15
 Aa1jqFZxZ3ZrXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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

On 07/23/2021 02:11 PM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +void helper_movreg2cf_i32(CPULoongArchState *env, uint32_t cd, uint32_t src)
>> +{
>> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
>> +}
>> +
>> +void helper_movreg2cf_i64(CPULoongArchState *env, uint32_t cd, uint64_t src)
>> +{
>> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
>> +}
>> +
>> +/* fcmp.cond.s */
>> +uint32_t helper_fp_cmp_caf_s(CPULoongArchState *env, uint32_t fp,
>> +                             uint32_t fp1)
>> +{
>> +    uint64_t ret;
>> +    ret = (float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status), 0);
>> +    update_fcsr0(env, GETPC());
>> +    if (ret) {
>> +        return -1;
>> +    } else {
>> +        return 0;
>> +    }
>> +}
> 
> I don't understand why you have split the compare from the store to cf?
> 
> I don't understand why you're returning -1 instead of 1, when the result is supposed to be a boolean.
> 
> Alternately, I don't understand why you want a helper function to perform a simple byte store operation.  You could easily store a byte with tcg_gen_st8_{i32,i64}.
>

Hmm, this part is seem too bad. 
 
>> +uint32_t helper_fp_cmp_cueq_s(CPULoongArchState *env, uint32_t fp,
>> +                              uint32_t fp1)
>> +{
>> +    uint64_t ret;
>> +    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
>> +          float32_eq_quiet(fp, fp1, &env->active_fpu.fp_status);
> 
> You're better off using
> 
>     FloatRelation cmp = float32_compare_quiet(fp0, fp1, status);
>     update_fcsr0(env, GETPC();
>     return cmp == float_relation_unordered ||
>            cmp == float_relation_equal;
> 
> Similarly with every other place you use two comparisons.
> 
> Indeed, one could conceivably condense everything into exactly four helper functions: two using float{32,64}_compare_quiet and two using float{32,64}_compare (signalling).  A 4th argument would be a bitmask of the different true conditions, exactly as listed in Table 9.
> 
> Since FloatRelation is in {-1, 0, 1, 2}, one could write
> 
>   return (mask >> (cmp + 1)) & 1;
>
This is a good idea!
 
Thanks
Song Gao.


