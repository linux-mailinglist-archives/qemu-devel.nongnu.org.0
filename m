Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F440AA8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:17:20 +0200 (CEST)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4Z5-0005um-Q8
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mQ4Xi-0005Ef-K7
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:15:54 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mQ4Xf-00020v-Kr
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:15:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08975057|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0192529-0.00166075-0.979086;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.LKDXTMj_1631610942; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LKDXTMj_1631610942)
 by smtp.aliyun-inc.com(10.147.40.200);
 Tue, 14 Sep 2021 17:15:42 +0800
Subject: Re: [PATCH v11 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-4-philipp.tomsich@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <913941ad-2a84-f4a8-0a5a-c64bef026a6f@c-sky.com>
Date: Tue, 14 Sep 2021 17:15:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911140016.834071-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/11 下午10:00, Philipp Tomsich wrote:
> Assume clzw being executed on a register that is not sign-extended, such
> as for the following sequence that uses (1ULL << 63) | 392 as the operand
> to clzw:
> 	bseti	a2, zero, 63
> 	addi	a2, a2, 392
> 	clzw    a3, a2
> The correct result of clzw would be 23, but the current implementation
> returns -32 (as it performs a 64bit clz, which results in 0 leading zero
> bits, and then subtracts 32).

As the MSB word of  a3 has been cleaned,  the result of current 
implementation will be 23. So there is no
error here.

Thanks,
Zhiwei

> Fix this by changing the implementation to:
>   1. shift the original register up by 32
>   2. performs a target-length (64bit) clz
>   3. return 32 if no bits are set
>
> Marking this instruction as 'w-form' (i.e., setting ctx->w) would not
> correctly model the behaviour, as the instruction should not perform
> a zero-extensions on the input (after all, it is not a .uw instruction)
> and the result is always in the range 0..32 (so neither a sign-extension
> nor a zero-extension on the result will ever be needed).  Consequently,
> we do not set ctx->w and mark the instruction as EXT_NONE.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>
> Changes in v11:
> - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.
>
> Changes in v10:
> - New patch, fixing correctnes for clzw called on a register with undefined
>    (as in: not properly sign-extended) upper bits.
>
>   target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 6c85c89f6d..73d1e45026 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)
>   
>   static void gen_clzw(TCGv ret, TCGv arg1)
>   {
> -    tcg_gen_clzi_tl(ret, arg1, 64);
> -    tcg_gen_subi_tl(ret, ret, 32);
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_shli_tl(t, arg1, 32);
> +    tcg_gen_clzi_tl(ret, t, 32);
> +    tcg_temp_free(t);
>   }
>   
>   static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>   {
>       REQUIRE_64BIT(ctx);
>       REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
> +    return gen_unary(ctx, a, EXT_NONE, gen_clzw);
>   }
>   
>   static void gen_ctzw(TCGv ret, TCGv arg1)

