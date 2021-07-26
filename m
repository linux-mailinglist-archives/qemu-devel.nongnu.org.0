Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B573D58EB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:57:43 +0200 (CEST)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zEr-0007rP-VB
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7zDz-0006pa-0I
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:56:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43842 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7zDw-00080L-3D
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:56:46 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0Pyov5g0RAkAA--.23475S3; 
 Mon, 26 Jul 2021 19:56:36 +0800 (CST)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
 <ad086e2a-3bfc-aa4b-d873-68d159ea2cbe@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <95b0ee7b-ca4d-2ee1-85cf-2c49160d3a5d@loongson.cn>
Date: Mon, 26 Jul 2021 19:56:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ad086e2a-3bfc-aa4b-d873-68d159ea2cbe@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0Pyov5g0RAkAA--.23475S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyxCFykWFyxZw1UGrWUCFg_yoW7CF47pF
 1kJrW8WFyUJrn3Jw1UJr45WFyayr18t3WDtwnYqa15tr47Ar10gr1jgrs09r15Ar4fWr4Y
 yw15ursrZ3W7J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
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

On 07/23/2021 08:46 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +/* Fixed point arithmetic operation instruction translation */
>> +static bool trans_add_w(DisasContext *ctx, arg_add_w *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv Rj = cpu_gpr[a->rj];
>> +    TCGv Rk = cpu_gpr[a->rk];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    if (a->rj != 0 && a->rk != 0) {
>> +        tcg_gen_add_tl(Rd, Rj, Rk);
>> +        tcg_gen_ext32s_tl(Rd, Rd);
>> +    } else if (a->rj == 0 && a->rk != 0) {
>> +        tcg_gen_mov_tl(Rd, Rk);
>> +    } else if (a->rj != 0 && a->rk == 0) {
>> +        tcg_gen_mov_tl(Rd, Rj);
>> +    } else {
>> +        tcg_gen_movi_tl(Rd, 0);
>> +    }
>> +
>> +    return true;
>> +}
> 
> Do not do all of this "if reg(n) zero" testing.
> 
> Use a common function to perform the gpr lookup, and a small callback function for the operation.  Often, the callback function already exists within include/tcg/tcg-op.h.
> 
> Please see my riscv cleanup patch set I referenced vs patch 6.

I am not sure  that 'riscv cleanup' patchs at:
  
   https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org 

It seems that  gpr_dst/gpr_src are common function to perform the gpr lookup. is that right? 


> 
>> +static bool trans_orn(DisasContext *ctx, arg_orn *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv Rj = cpu_gpr[a->rj];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    TCGv t0 = tcg_temp_new();
>> +    gen_load_gpr(t0, a->rk);
>> +
>> +    tcg_gen_not_tl(t0, t0);
>> +    tcg_gen_or_tl(Rd, Rj, t0);
> 
> tcg_gen_orc_tl.
> 
OK.
>> +static bool trans_andn(DisasContext *ctx, arg_andn *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv Rj = cpu_gpr[a->rj];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    TCGv t0 = tcg_temp_new();
>> +    gen_load_gpr(t0, a->rk);
>> +
>> +    tcg_gen_not_tl(t0, t0);
>> +    tcg_gen_and_tl(Rd, Rj, t0);
> 
> tcg_gen_andc_tl.
> 
OK.

>> +static bool trans_mul_d(DisasContext *ctx, arg_mul_d *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = get_gpr(a->rj);
>> +    t1 = get_gpr(a->rk);
>> +
>> +    check_loongarch_64(ctx);
> 
> Architecture checks go first, before you've decided the operation is a nop.
> 
OK.

>> +static bool trans_mulh_d(DisasContext *ctx, arg_mulh_d *a)
>> +{
>> +    TCGv t0, t1, t2;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = get_gpr(a->rj);
>> +    t1 = get_gpr(a->rk);
>> +    t2 = tcg_temp_new();
>> +
>> +    check_loongarch_64(ctx);
>> +    tcg_gen_muls2_i64(t2, Rd, t0, t1);
> 
> If you actually supported LA32, you'd notice this doesn't compile.  Are you planning to support LA32 in the future?
> 
No. 
>> +static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
>> +{
>> +    TCGv_i64 t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new_i64();
>> +    t1 = tcg_temp_new_i64();
>> +
>> +    tcg_gen_movi_tl(t0, a->si20);
>> +    tcg_gen_concat_tl_i64(t1, Rd, t0);
>> +    tcg_gen_mov_tl(Rd, t1);
> 
> Hmm.  Better as
> 
>   tcg_gen_deposit_tl(Rd, Rd, tcg_constant_tl(a->si20), 32, 32);
>
OK.>> +static bool trans_lu52i_d(DisasContext *ctx, arg_lu52i_d *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    t1 = tcg_temp_new();
>> +
>> +    gen_load_gpr(t1, a->rj);
>> +
>> +    tcg_gen_movi_tl(t0, a->si12);
>> +    tcg_gen_shli_tl(t0, t0, 52);
>> +    tcg_gen_andi_tl(t1, t1, 0xfffffffffffffU);
>> +    tcg_gen_or_tl(Rd, t0, t1);
> 
> Definitely better as
> 
>   tcg_gen_deposit_tl(Rd, Rd, tcg_constant_tl(a->si12), 52, 12);
> 
OK.
>> +static bool trans_addi_w(DisasContext *ctx, arg_addi_w *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv Rj = cpu_gpr[a->rj];
>> +    target_ulong uimm = (target_long)(a->si12);
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    if (a->rj != 0) {
>> +        tcg_gen_addi_tl(Rd, Rj, uimm);
>> +        tcg_gen_ext32s_tl(Rd, Rd);
>> +    } else {
>> +        tcg_gen_movi_tl(Rd, uimm);
>> +    }
>> +
>> +    return true;
>> +}
> 
> Again, there should be a common function for all of the two-register-immediate operations.  The callback here is exactly the same as for trans_add_w.
> 
OK.
>> +static bool trans_xori(DisasContext *ctx, arg_xori *a)
>> +{
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv Rj = cpu_gpr[a->rj];
>> +
>> +    target_ulong uimm = (uint16_t)(a->ui12);
> 
> You shouldn't need these sorts of casts.
> 
OK. 

Thank you kindly help.

Thanks
Song Gao


