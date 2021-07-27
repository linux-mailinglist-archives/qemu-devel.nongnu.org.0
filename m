Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D183D6BA3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 03:53:06 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8CHJ-0004L1-FY
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 21:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8CGL-0003CF-UM
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 21:52:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38876 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8CGJ-0001lZ-AW
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 21:52:05 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0O7Zv9gCk0kAA--.23826S3; 
 Tue, 27 Jul 2021 09:51:57 +0800 (CST)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
 <ad086e2a-3bfc-aa4b-d873-68d159ea2cbe@linaro.org>
 <95b0ee7b-ca4d-2ee1-85cf-2c49160d3a5d@loongson.cn>
 <dce97537-8e36-4bab-7c89-4c2f7aa6f814@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <54d4b762-5d77-7968-2beb-7afa24fdfdc9@loongson.cn>
Date: Tue, 27 Jul 2021 09:51:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <dce97537-8e36-4bab-7c89-4c2f7aa6f814@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0O7Zv9gCk0kAA--.23826S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCry5CFW3Gr48trW5Jr15CFg_yoW5Gr4rpF
 n5JF48ZrWUtFn3Jw4UKw47WF9FyFWrtw1UJw1vga4YyF4fAr12gr4jqr4q9r1Fyr4fWr4U
 Zw4j9r9xZF13J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
 vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
 xVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
 AKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0S
 jxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7
 Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
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

On 07/26/2021 11:53 PM, Richard Henderson wrote:
> On 7/26/21 1:56 AM, Song Gao wrote:
>> Hi, Richard.
>>
>> On 07/23/2021 08:46 AM, Richard Henderson wrote:
>>> On 7/20/21 11:53 PM, Song Gao wrote:
>>>> +/* Fixed point arithmetic operation instruction translation */
>>>> +static bool trans_add_w(DisasContext *ctx, arg_add_w *a)
>>>> +{
>>>> +    TCGv Rd = cpu_gpr[a->rd];
>>>> +    TCGv Rj = cpu_gpr[a->rj];
>>>> +    TCGv Rk = cpu_gpr[a->rk];
>>>> +
>>>> +    if (a->rd == 0) {
>>>> +        /* Nop */
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    if (a->rj != 0 && a->rk != 0) {
>>>> +        tcg_gen_add_tl(Rd, Rj, Rk);
>>>> +        tcg_gen_ext32s_tl(Rd, Rd);
>>>> +    } else if (a->rj == 0 && a->rk != 0) {
>>>> +        tcg_gen_mov_tl(Rd, Rk);
>>>> +    } else if (a->rj != 0 && a->rk == 0) {
>>>> +        tcg_gen_mov_tl(Rd, Rj);
>>>> +    } else {
>>>> +        tcg_gen_movi_tl(Rd, 0);
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>
>>> Do not do all of this "if reg(n) zero" testing.
>>>
>>> Use a common function to perform the gpr lookup, and a small callback function for the operation.  Often, the callback function already exists within include/tcg/tcg-op.h.
>>>
>>> Please see my riscv cleanup patch set I referenced vs patch 6.
>>
>> I am not sure  that 'riscv cleanup' patchs at:
>>        https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org
>>
>> It seems that  gpr_dst/gpr_src are common function to perform the gpr lookup. is that right?
> 
> More than that.  The gen_arith() function, for example, performs all of the bookkeeping for a binary operation.
> 
> For example,
> 
> static bool gen_arith(DisasContext *ctx, arg_fmt_rdrjrk *a,
>                       void (*func)(TCGv, TCGv, TCGv))
> {
>    TCGv dest = gpr_dst(ctx, a->rd);
>    TCGv src1 = gpr_src(ctx, a->rj);
>    TCGv src2 = gpr_src(ctx, a->rk);
> 
>     func(dest, src1, src2);
>     return true;
> }
> 
> #define TRANS(NAME, FUNC, ...) \
>     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
>     { return FUNC(ctx, a, __VA_ARGS__); }
> 
> static void gen_add_w(TCGv dest, TCGv src1, TCGv src2)
> {
>     tcg_gen_add_tl(dest, src1, src2);
>     tcg_gen_ext32s_tl(dest, dest);
> }
> 
> TRANS(add_w, gen_arith, gen_add_w)
> TRANS(add_d, gen_arith, tcg_gen_add_tl)
> 
> 
OK

Again, thank you kindly help.

Thanks
Song Gao.


