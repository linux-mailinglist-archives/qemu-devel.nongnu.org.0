Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0133D702B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:18:34 +0200 (CEST)
Received: from localhost ([::1]:56090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8HMH-00027e-4z
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8HL9-0001TH-UU
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:17:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45470 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8HL6-0001vn-1O
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:17:23 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxiuDvsv9gxW8kAA--.207S3;
 Tue, 27 Jul 2021 15:17:05 +0800 (CST)
Subject: Re: [PATCH v2 13/22] target/loongarch: Add floating point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
 <1729aea1-a773-ad78-59d3-294eb968a7ba@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <8e5f166a-ed88-af3c-9aae-63c9977446ec@loongson.cn>
Date: Tue, 27 Jul 2021 15:17:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1729aea1-a773-ad78-59d3-294eb968a7ba@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxiuDvsv9gxW8kAA--.207S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCry7try5ZFWUKr4rAw4fZrb_yoWrGryfpr
 s5JrW7Xay0gF95X3srXw1UWF98Ar18K3W5WwnYqFsYkF48Ar1v9r1agrsF9r48Aws7Xr15
 AFWqqrsrZ3Z7Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
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
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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

On 07/23/2021 01:44 PM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +uint64_t helper_fp_sqrt_d(CPULoongArchState *env, uint64_t fp)
>> +{
>> +    fp = float64_sqrt(fp, &env->active_fpu.fp_status);
>> +    update_fcsr0(env, GETPC());
>> +    return fp;
>> +}
>> +
>> +uint32_t helper_fp_sqrt_s(CPULoongArchState *env, uint32_t fp)
>> +{
>> +    fp = float32_sqrt(fp, &env->active_fpu.fp_status);
>> +    update_fcsr0(env, GETPC());
>> +    return fp;
>> +}
> 
> I believe you will find it easier to take and return uint64_t, even for 32-bit operations.  The manual says that the high bits may contain any value, so in my opinion you should not work hard to preserve the high bits, as you currently do with
> 
>> +    gen_load_fpr32(fp0, a->fj);
>> +    gen_load_fpr32(fp1, a->fk);
>> +    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
>> +    gen_store_fpr32(fp0, a->fd);
> 
> I think this should be as simple as
> 
>   gen_helper_fp_add_s(cpu_fpu[a->fd], cpu_env,
>                       cpu_fpu[a->fj], cpu_fpu[a->fk]);
>
> I also think that loongarch should learn from risc-v and change the architecture to "nan-box" single-precision results -- fill the high 32-bits with 1s.  This is an SNaN representation for double-precision and will immediately fail when incorrectly using a single-precision value as a double-precision input.
> 
> Thankfully the current architecture is backward compatible with nan-boxing.
>

by this method,  the trans_fadd_s is   

static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
{
    TCGv_i64 fp0, fp1;

    fp0 = tcg_temp_new_i64();
    fp1 = tcg_temp_new_i64();

    check_fpu_enabled(ctx);
    gen_load_fpr64(fp0, a->fj);
    gen_load_fpr64(fp1, a->fk);
    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);

    gen_check_nanbox_s(fp0, fp0); /* from riscv */

    gen_store_fpr64(fp0, a->fd);

    tcg_temp_free_i64(fp0);
    tcg_temp_free_i64(fp1);

    return true;
}

uint64_t helper_fp_add_s(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
{
    uint32_t fp2;

    fp2 = float32_add((uint32_t)fp, (uint32_t)fp1, &env->active_fpu.fp_status);
    update_fcsr0(env, GETPC());
    return (uint64_t)fp2;
}

is this right?

 
>> +/* Floating point arithmetic operation instruction translation */
>> +static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
>> +{
>> +    TCGv_i32 fp0, fp1;
>> +
>> +    fp0 = tcg_temp_new_i32();
>> +    fp1 = tcg_temp_new_i32();
>> +
>> +    check_fpu_enabled(ctx);
>> +    gen_load_fpr32(fp0, a->fj);
>> +    gen_load_fpr32(fp1, a->fk);
>> +    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
>> +    gen_store_fpr32(fp0, a->fd);
>> +
>> +    tcg_temp_free_i32(fp0);
>> +    tcg_temp_free_i32(fp1);
>> +
>> +    return true;
>> +}
> 
> Again, you should use some helper functions to reduce the repetition.
>
OK>> +static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
>> +{
>> +    TCGv_i64 fp0, fp1, fp2, fp3;
>> +
>> +    fp0 = tcg_temp_new_i64();
>> +    fp1 = tcg_temp_new_i64();
>> +    fp2 = tcg_temp_new_i64();
>> +    fp3 = tcg_temp_new_i64();
>> +
>> +    check_fpu_enabled(ctx);
>> +    gen_load_fpr64(fp0, a->fj);
>> +    gen_load_fpr64(fp1, a->fk);
>> +    gen_load_fpr64(fp2, a->fa);
>> +    check_fpu_enabled(ctx);
> 
> Repeating check_fpu_enabled.
> 
OK.
>> +    gen_helper_fp_madd_d(fp3, cpu_env, fp0, fp1, fp2);
>> +    gen_store_fpr64(fp3, a->fd);
> 
> I think you might as well pass in the float_muladd_* constant to a single helper rather than having 4 different helpers.
> 
OK
> 
> r~

Again. thank you kindly help.

Thanks
Song Gao.


