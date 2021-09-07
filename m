Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95365402982
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:14:41 +0200 (CEST)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNavw-00086r-Kb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mNaLk-0005l1-Ph
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:37:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39076 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mNaLh-0004Fi-I4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:37:16 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxdeXDXDdhzeUAAA--.4668S3;
 Tue, 07 Sep 2021 20:36:22 +0800 (CST)
Subject: Re: [PATCH v4 04/21] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-5-git-send-email-gaosong@loongson.cn>
 <0180cf32-a93c-191d-2e8e-2da9e27431eb@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <4a748799-a83b-a05a-6d48-ded4e69d1b42@loongson.cn>
Date: Tue, 7 Sep 2021 20:36:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0180cf32-a93c-191d-2e8e-2da9e27431eb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxdeXDXDdhzeUAAA--.4668S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1UZFWDGw13Zw15JF4UCFg_yoWfGF4UpF
 1ktr4UJry8Xr93JrWDAr1UZFy7Ar1kKw4UGryIvF4YkF47Aryjqr47WwnIgr1Yyws5Xr4r
 Arn8W3sruF13Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard,  

Thank you for your comments!

On 09/04/2021 07:04 PM, Richard Henderson wrote:
> On 9/2/21 2:40 PM, Song Gao wrote:
>> +static bool gen_r2_si12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
>> +                        DisasExtend src_ext, DisasExtend dst_ext,
>> +                        void (*func)(TCGv, TCGv, TCGv))
>> +{
>> +    ctx->dst_ext = dst_ext;
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>> +    TCGv src2 = tcg_constant_tl(a->si12);
> 
> Prefer to put declarations before statements, as per old C90 still.
> 
OK.
>> +    func(dest, src1, src2);
>> +
>> +    if (ctx->dst_ext) {
> 
> Given that func does not receive ctx, why store dst_ext into ctx and then read it back? It seems like you should just use the parameter directly.
> 
OK， ctx->dst_ext will be deleted.
>> +static bool gen_pc(DisasContext *ctx, arg_fmt_rdsi20 *a,
>> +                   void (*func)(DisasContext *ctx, TCGv, target_long))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +
>> +    func(ctx, dest, a->si20);
>> +    return true;
>> +}
> 
> Perhaps clearer with:
> 
>   target_long (*func)(target_long pc, target_long si20)
> 
>   target_long addr = func(ctx->base.pc_next, a->si20);> OK， ctx->dst_ext will be deleted.
>   TCGv dest = gpr_dst(ctx, a->rd);
> 
>   tcg_gen_movi_tl(dest, addr);
>   return true;
> 
> 
Surely.
> 
> 
>> +static bool gen_mulh(DisasContext *ctx, arg_add_w *a,
>> +                     void(*func)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
>> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
>> +    TCGv_i32 discard = tcg_temp_new_i32();
>> +    TCGv_i32 t0 = tcg_temp_new_i32();
>> +    TCGv_i32 t1 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_trunc_tl_i32(t0, src1);
>> +    tcg_gen_trunc_tl_i32(t1, src2);
>> +    func(discard, t0, t0, t1);
>> +    tcg_gen_ext_i32_tl(dest, t0);
>> +
>> +    tcg_temp_free_i32(discard);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(t1);
>> +    return true;
>> +}
> 
> You should be able to use gen_r3 for these.
> 
> static void gen_mulh_w(TCGv dest, TCGv src1, TCGv src2)
> {
>     tcg_gen_mul_i64(dest, src1, src2);
>     tcg_gen_sari_i64(dest, dest, 32);
> }
> 
> static void gen_mulh_wu(TCGv dest, TCGv src1, TCGv src2)
> {
>     tcg_gen_mul_i64(dest, src1, src2);
>     tcg_gen_sari_i64(dest, dest, 32);
> }
> 
> static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
> {
>     TCGv discard = tcg_temp_new();
>     tcg_gen_muls2_tl(discard, dest, src1, src2);
>     tcg_temp_free(discard);
> }
> 
> static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
> {
>     TCGv discard = tcg_temp_new();
>     tcg_gen_mulu2_tl(discard, dest, src1, src2);
>     tcg_temp_free(discard);
> }
> 
> TRANS(mulh_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, gen_mulh_w)
> TRANS(mulh_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, gen_mulh_wu)
> TRANS(mulh_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_d)
> TRANS(mulh_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_du)
> 
>> +static bool gen_mulw_d(DisasContext *ctx, arg_add_w *a,
>> +                     void(*func)(TCGv_i64, TCGv))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
>> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
>> +
>> +    func(src1, src1);
>> +    func(src2, src2);
>> +    tcg_gen_mul_i64(dest, src1, src2);
>> +    return true;
>> +}
> 
> The func parameter here serves the same purpose as DisasExtend, so again you can use gen_r3:
> 
> TRANS(mulw_d_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, tcg_gen_mul_tl)
> TRANS(mulw_d_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, tcg_gen_mul_tl)
> 
> 
OK. 
> 
>> +
>> +static bool gen_div_w(DisasContext *ctx, arg_fmt_rdrjrk *a,
>> +                      DisasExtend src_ext, DisasExtend dst_ext,
>> +                      void(*func)(TCGv, TCGv, TCGv))
>> +{
>> +    ctx->dst_ext = dst_ext;
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>> +    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
>> +    TCGv t2 = tcg_temp_new();
>> +    TCGv t3 = tcg_temp_new();
>> +
>> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src1, INT_MIN);
>> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, -1);
>> +    tcg_gen_and_tl(t2, t2, t3);
>> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, 0);
>> +    tcg_gen_or_tl(t2, t2, t3);
>> +    tcg_gen_movi_tl(t3, 0);
>> +    tcg_gen_movcond_tl(TCG_COND_NE, src2, t2, t3, t2, src2);
> 
> Bug, writing back to src2.
> OK.
>> +    func(dest, src1, src2);
> 
> You can split this out differently so that you can use gen_r3.
> 
> static TCGv prep_divisor_d(TCGv src1, TCGv src2)
> {
>     TCGv t0 = temp_new();
>     TCGv t1 = tcg_temp_new();
>     TCGv t2 = tcg_temp_new();
>     TCGv zero = tcg_constant_tl(0);
> 
>     /*
>      * If min / -1, set the divisor to 1.
>      * This avoids potential host overflow trap and produces min.
>      * If x / 0, set the divisor to 1.
>      * This avoids potential host overflow trap;
>      * the required result is undefined.
>      */
>     tcg_gen_setcondi_tl(TCG_COND_EQ, t0, src1, INT64_MIN);
>     tcg_gen_setcondi_tl(TCG_COND_EQ, t1, src2, -1);
>     tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src2, 0);
>     tcg_gen_and_tl(t0, t0, t1);
>     tcg_gen_or_tl(t0, t0, t2);
>     tcg_gen_movcond_tl(TCG_COND_NE, t0, t0, zero, t0, src2);
> 
>     tcg_temp_free(t1);
>     tcg_temp_free(t2);
>     return t0;
> }
> 
> static TCGv prep_divisor_du(TCGv src2)
> {
>     TCGv t0 = temp_new();
>     TCGv zero = tcg_constant_tl(0);
>     TCGv one = tcg_constant_tl(1);
> 
>     /*
>      * If x / 0, set the divisor to 1.
>      * This avoids potential host overflow trap;
>      * the required result is undefined.
>      */
>     tcg_gen_movcond_tl(TCG_COND_EQ, t0, src2, zero, one, src2);
>     return t0;
> }
> 
> static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
> {
>     src2 = prep_divisor_d(src1, src2);
>     tcg_gen_div_tl(dest, src1, src2);
> }
> 
> static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
> {
>     src2 = prep_divisor_d(src1, src2);
>     tcg_gen_rem_tl(dest, src1, src2);
> }
> 
> static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
> {
>     src2 = prep_divisor_du(src2);
>     tcg_gen_divu_tl(dest, src1, src2);
> }
> 
> static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
> {
>     src2 = prep_divisor_du(src2);
>     tcg_gen_remu_tl(dest, src1, src2);
> }
> 
> static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
> {
>     /* We need not check for integer overflow for div_w. */
>     src2 = prep_divisor_du(src2);
>     tcg_gen_div_tl(dest, src1, src2);
> }
> 
> static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
> {
>     /* We need not check for integer overflow for rem_w. */
>     src2 = prep_divisor_du(src2);
>     tcg_gen_rem_tl(dest, src1, src2);
> }
> 
> TRANS(div_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_div_w)
> TRANS(mod_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_rem_w)
> TRANS(div_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
> TRANS(mod_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
> TRANS(div_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_d)
> TRANS(mod_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_d)
> TRANS(div_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_du)
> TRANS(mod_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_du)
> 

Nice.

>> --- a/target/loongarch/internals.h
>> +++ b/target/loongarch/internals.h
>> @@ -9,7 +9,6 @@
>>   #ifndef LOONGARCH_INTERNALS_H
>>   #define LOONGARCH_INTERNALS_H
>>   -
>>   void loongarch_translate_init(void);
>>     void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> 
> Fold this back to a previous patch.
>
OK
>> -static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>> -{
>> -    return true;
>> -}
> 
> Yes indeed, fold this patch to a previous patch.
> 
OK.

Song Gao
Thanks.
> 
> r~


