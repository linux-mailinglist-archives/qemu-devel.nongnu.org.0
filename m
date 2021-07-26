Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5A3D595F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:24:00 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zeI-0004Qb-Uo
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7zdX-0003iy-8C
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:23:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48126 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7zdU-0004cj-8P
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:23:11 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxauAQqf5gHRMkAA--.23148S3; 
 Mon, 26 Jul 2021 20:22:41 +0800 (CST)
Subject: Re: [PATCH v2 09/22] target/loongarch: Add fixed point bit
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
 <41541363-117c-6428-cc46-2660827cb803@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <302f3f01-79b7-343f-9616-644fed0d146d@loongson.cn>
Date: Mon, 26 Jul 2021 20:22:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <41541363-117c-6428-cc46-2660827cb803@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxauAQqf5gHRMkAA--.23148S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFy3Aw1fJr43Kr18WF15urg_yoWxKw1xpF
 1kJrWUGFWUJr93Jw1UJr4UJFy5Zr18K3WqqFn2qFyrtF47Ar10gr1jgrsIgF1UAr4rWr15
 Cw1UurnrZr17Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
 GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
 x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI
 1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r
 yrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
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

On 07/23/2021 09:29 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> This patch implement fixed point bit instruction translation.
>>
>> This includes:
>> - EXT.W.{B/H}
>> - CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
>> - BYTEPICK.{W/D}
>> - REVB.{2H/4H/2W/D}
>> - REVH.{2W/D}
>> - BITREV.{4B/8B}, BITREV.{W/D}
>> - BSTRINS.{W/D}, BSTRPICK.{W/D}
>> - MASKEQZ, MASKNEZ
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/helper.h     |  10 +
>>   target/loongarch/insns.decode |  45 +++
>>   target/loongarch/op_helper.c  | 119 ++++++++
>>   target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 839 insertions(+)
>>
>> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
>> index 6c7e19b..bbbcc26 100644
>> --- a/target/loongarch/helper.h
>> +++ b/target/loongarch/helper.h
>> @@ -8,3 +8,13 @@
>>     DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
>>   DEF_HELPER_2(raise_exception, noreturn, env, i32)
>> +
>> +DEF_HELPER_2(cto_w, tl, env, tl)
>> +DEF_HELPER_2(ctz_w, tl, env, tl)
>> +DEF_HELPER_2(cto_d, tl, env, tl)
>> +DEF_HELPER_2(ctz_d, tl, env, tl)
> 
> The count leading and trailing zero operations are built into tcg.  Count leading and trailing one simply needs a NOT operation to convert it to zero.
> 

My understanding is this：
   
  cto -> NOT operation (tcg_gen_not_tl)  -> ctz,

  is right?

>> +DEF_HELPER_2(bitrev_w, tl, env, tl)
>> +DEF_HELPER_2(bitrev_d, tl, env, tl)
> 
> These should use TCG_CALL_NO_RWG_SE.
> 
>> +target_ulong helper_bitrev_w(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    int32_t v = (int32_t)rj;
>> +    const int SIZE = 32;
>> +    uint8_t bytes[SIZE];
>> +
>> +    int i;
>> +    for (i = 0; i < SIZE; i++) {
>> +        bytes[i] = v & 0x1;
>> +        v = v >> 1;
>> +    }
>> +    /* v == 0 */
>> +    for (i = 0; i < SIZE; i++) {
>> +        v = v | ((uint32_t)bytes[i] << (SIZE - 1 - i));
>> +    }
>> +
>> +    return (target_ulong)(int32_t)v;
>> +}
> 
>   return (int32_t)revbit32(rj);
> 
> 
OK.

>> +target_ulong helper_bitrev_d(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    uint64_t v = rj;
>> +    const int SIZE = 64;
>> +    uint8_t bytes[SIZE];
>> +
>> +    int i;
>> +    for (i = 0; i < SIZE; i++) {
>> +        bytes[i] = v & 0x1;
>> +        v = v >> 1;
>> +    }
>> +    /* v == 0 */
>> +    for (i = 0; i < SIZE; i++) {
>> +        v = v | ((uint64_t)bytes[i] << (SIZE - 1 - i));
>> +    }
>> +
>> +    return (target_ulong)v;
>> +}
> 
>   return revbit64(rj);
>
OK.
 
>> +static inline target_ulong bitswap(target_ulong v)
>> +{
>> +    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
>> +        ((v & (target_ulong)0x5555555555555555ULL) << 1);
>> +    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
>> +        ((v & (target_ulong)0x3333333333333333ULL) << 2);
>> +    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
>> +        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
>> +    return v;
>> +}
>> +
>> +target_ulong helper_loongarch_dbitswap(target_ulong rj)
>> +{
>> +    return bitswap(rj);
>> +}
>> +
>> +target_ulong helper_loongarch_bitswap(target_ulong rt)
>> +{
>> +    return (int32_t)bitswap(rt);
>> +}
> 
> I assume these are fpr the  bitrev.4b and bitrev.8b insns?
> It would be better to name them correctly.
> 
> 
Yes.

>> +/* Fixed point bit operation instruction translation */
>> +static bool trans_ext_w_h(DisasContext *ctx, arg_ext_w_h *a)
>> +{
>> +    TCGv t0;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = get_gpr(a->rj);
>> +
>> +    tcg_gen_ext16s_tl(Rd, t0);
> 
> Again, you should have a common routine for handling these unary operations.
> 
OK. 

>> +static bool trans_clo_w(DisasContext *ctx, arg_clo_w *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    gen_load_gpr(Rd, a->rj);
>> +
>> +    tcg_gen_not_tl(Rd, Rd);
>> +    tcg_gen_ext32u_tl(Rd, Rd);
>> +    tcg_gen_clzi_tl(Rd, Rd, TARGET_LONG_BITS);
>> +    tcg_gen_subi_tl(Rd, Rd, TARGET_LONG_BITS - 32);
> 
> So, you're actually using the tcg builtins here, and the helper you created isn't used.
> 
Yes.
>> +static bool trans_cto_w(DisasContext *ctx, arg_cto_w *a)
>> +{
>> +    TCGv t0;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    gen_load_gpr(t0, a->rj);
>> +
>> +    gen_helper_cto_w(Rd, cpu_env, t0);
> 
> Here you should have used the tcg builtin.
> 
OK.

>> +static bool trans_ctz_w(DisasContext *ctx, arg_ctz_w *a)
>> +{
>> +    TCGv t0;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    gen_load_gpr(t0, a->rj);
>> +
>> +    gen_helper_ctz_w(Rd, cpu_env, t0);
> 
> Likewise.
> 
>> +static bool trans_revb_2w(DisasContext *ctx, arg_revb_2w *a)
>> +{
>> +    TCGv_i64 t0, t1, t2;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new_i64();
>> +    t1 = tcg_temp_new_i64();
>> +    t2 = get_gpr(a->rj);
>> +
>> +    gen_load_gpr(t0, a->rd);
>> +
>> +    tcg_gen_ext32u_i64(t1, t2);
>> +    tcg_gen_bswap32_i64(t0, t1);
>> +    tcg_gen_shri_i64(t1, t2, 32);
>> +    tcg_gen_bswap32_i64(t1, t1);
>> +    tcg_gen_concat32_i64(Rd, t0, t1);
> 
> tcg_gen_bswap64_i64(Rd, Rj)
> tcg_gen_rotri_i64(Rd, Rd, 32);
> 
OK.
>> +static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
>> +{
>> +    TCGv t0;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +
>> +    check_loongarch_64(ctx);
>> +    if (a->sa3 == 0 || ((a->sa3) * 8) == 64) {
>> +        if (a->sa3 == 0) {
>> +            gen_load_gpr(t0, a->rk);
>> +        } else {
>> +            gen_load_gpr(t0, a->rj);
>> +        }
>> +            tcg_gen_mov_tl(Rd, t0);
>> +    } else {
>> +        TCGv t1 = tcg_temp_new();
>> +
>> +        gen_load_gpr(t0, a->rk);
>> +        gen_load_gpr(t1, a->rj);
>> +
>> +        tcg_gen_shli_tl(t0, t0, ((a->sa3) * 8));
>> +        tcg_gen_shri_tl(t1, t1, 64 - ((a->sa3) * 8));
>> +        tcg_gen_or_tl(Rd, t1, t0);
>> +
>> +        tcg_temp_free(t1);
>> +    }
> 
> tcg_gen_extract2_i64(Rd, Rk, Rj, a->sa3 * 8);
> 
OK

Thank you kindly help.

Thanks
Song Gao.


