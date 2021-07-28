Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAF3D853F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 03:20:10 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8YEy-0001mp-S4
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 21:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8YDb-000150-36
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 21:18:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40710 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8YDY-0001j6-6Z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 21:18:42 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0JisABhX+MkAA--.24151S3; 
 Wed, 28 Jul 2021 09:18:28 +0800 (CST)
Subject: Re: [PATCH v2 13/22] target/loongarch: Add floating point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
 <1729aea1-a773-ad78-59d3-294eb968a7ba@linaro.org>
 <8e5f166a-ed88-af3c-9aae-63c9977446ec@loongson.cn>
 <179b2d4e-7b0d-43ba-9f35-84ac728029f1@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <8a5ea059-6ed2-8303-2fa0-a056241edf80@loongson.cn>
Date: Wed, 28 Jul 2021 09:18:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <179b2d4e-7b0d-43ba-9f35-84ac728029f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0JisABhX+MkAA--.24151S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy5urW7ArW8tw1fWF45Wrg_yoW5Xw1rpr
 95tFW7Jry5KF95Jr1qgw1UJFyjyr4UJw15Xrn8JFyrCr48Jr1qvr47Xw4j9r15Aw4xXr1U
 XrnrtrsrZF17XF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
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

On 07/28/2021 12:12 AM, Richard Henderson wrote:
> On 7/26/21 9:17 PM, Song Gao wrote:
>>> I think this should be as simple as
>>>
>>>    gen_helper_fp_add_s(cpu_fpu[a->fd], cpu_env,
>>>                        cpu_fpu[a->fj], cpu_fpu[a->fk]);
>>>
>>> I also think that loongarch should learn from risc-v and change the architecture to "nan-box" single-precision results -- fill the high 32-bits with 1s.  This is an SNaN representation for double-precision and will immediately fail when incorrectly using a single-precision value as a double-precision input.
>>>
>>> Thankfully the current architecture is backward compatible with nan-boxing.
>>>
>>
>> by this method,  the trans_fadd_s is
>>
>> static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
>> {
>>      TCGv_i64 fp0, fp1;
>>
>>      fp0 = tcg_temp_new_i64();
>>      fp1 = tcg_temp_new_i64();
>>
>>      check_fpu_enabled(ctx);
>>      gen_load_fpr64(fp0, a->fj);
>>      gen_load_fpr64(fp1, a->fk);
>>      gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
>>
>>      gen_check_nanbox_s(fp0, fp0); /* from riscv */
>>
>>      gen_store_fpr64(fp0, a->fd);
>>
>>      tcg_temp_free_i64(fp0);
>>      tcg_temp_free_i64(fp1);
>>
>>      return true;
>> }
> 
> A few points here:
> 
> (1) You do not need gen_load_fpr64 and gen_store_fpr64 at all.
>     These were from mips to deal with the varying fpu sizes.
> 
> (2) If we need to call a helper, then the helper as much of
>     the work a possible.  Therefore the nanboxing should be
>     done there.  See riscv/fpu_helper.c, and the use of
>     nanbox_s within that file.
> 
> (3) Again, use a helper function:
> 
> static bool gen_binary_fp(DisasContext *ctx, arg_fmt_fdfjfk *a,
>                           void (*func)(TCGv_i64, TCGv_env,
>                                        TCGv_i64, TCGv_i64))
> {
>     if (check_fpu_enabled(ctx)) {
>         func(cpu_fpr[a->fd], cpu_env,
>              cpu_fpr[a->fj], cpu_fpr[a->fk]);
>     }
>     return true;
> }
> 
> TRANS(fadd_s, gen_binary_fp, gen_helper_fp_add_s)
> TRANS(fadd_d, gen_binary_fp, gen_helper_fp_add_d)
> 
>> uint64_t helper_fp_add_s(CPULoongArchState *env, uint64_t fp, uint64_t fp1)
>> {
>>      uint32_t fp2;
>>
>>      fp2 = float32_add((uint32_t)fp, (uint32_t)fp1, &env->active_fpu.fp_status);
>>      update_fcsr0(env, GETPC());
>>      return (uint64_t)fp2;
>> }
> 
> with return nanbox_s(fp2);
>
OK.

Again, thank you kindly help.

Thanks
Song Gao.
> 
> r~


