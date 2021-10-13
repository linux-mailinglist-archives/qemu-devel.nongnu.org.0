Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDD42BF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:48:08 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macju-0000jC-QR
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1machg-0007ru-9Y; Wed, 13 Oct 2021 07:45:48 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:44423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1machc-0003LG-1e; Wed, 13 Oct 2021 07:45:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1006539|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.019831-0.000474683-0.979694;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYTcIXU_1634125534; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYTcIXU_1634125534)
 by smtp.aliyun-inc.com(10.147.43.230);
 Wed, 13 Oct 2021 19:45:34 +0800
Subject: Re: [PATCH 11/13] target/riscv: Adjust trans_rev8_32 for riscv64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-12-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <040694ba-dd89-6bff-e78d-c75f42db1a4a@c-sky.com>
Date: Wed, 13 Oct 2021 19:45:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, frederic.petrot@univ-grenoble-alpes.fr,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/10/8 上午1:47, Richard Henderson wrote:

> When target_long is 64-bit, we still want a 32-bit bswap for rev8.
> Since this opcode is specific to RV32, we need not conditionalize.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 66dd51de49..c62eea433a 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
>       return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
>   }
>   
> +static void gen_rev8_32(TCGv ret, TCGv src1)
> +{
> +    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
> +}
> +
>   static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
>   {
>       REQUIRE_32BIT(ctx);
>       REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
> +    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
>   }
>   
>   static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)

