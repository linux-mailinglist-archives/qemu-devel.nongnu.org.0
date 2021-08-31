Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4053FC031
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 02:56:47 +0200 (CEST)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKs50-0001DY-3r
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 20:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1mKs0G-0005qv-C7; Mon, 30 Aug 2021 20:51:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1mKs0E-0000FP-1z; Mon, 30 Aug 2021 20:51:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51BFE60FE6;
 Tue, 31 Aug 2021 00:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630371106;
 bh=5b6KMByTq/cAx5d95U9mOsUwqM/LJsTDakbM6Mc4Zms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSzOJgRPLQSA6KglLfZ15BUNpcQ5UFgobdTPoU3sSgi9MUL0d3hm2b2Wk4WWLFE1j
 9MKpl1JHznFvhSDlF06lu0+RANfULrwdKAe/32/DLBrl7p2cfMRO0RA3/OBqtScl/S
 Ph9AbJizsRKQTs7iwLo1IdHDe/WTRlGhE9iJia/lSELoklWOEqL7Od2JyTf2S48L5V
 sVliygSqXSoBnzOX6XkRJIfIj5QDzq4YFyJ4omrxsZDZpX07Wg3ZdYmDfMrCXBVPXD
 /uZyzPUINtHnGuCNFwEOZsXsmTgLWRoiyQRbvKbtwNT6e9IBkmr6aBJeSyass8QRHz
 gCRuC1+1SVdsQ==
Date: Mon, 30 Aug 2021 17:51:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
Message-ID: <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419202257.161730-18-richard.henderson@linaro.org>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=nathan@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 llvm@lists.linux.dev, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On Mon, Apr 19, 2021 at 01:22:43PM -0700, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 29fbbb84b2..f58ac4f018 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
>          } else {
>              tmp = load_reg(s, i);
>          }
> -        gen_aa32_st32(s, tmp, addr, mem_idx);
> +        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          tcg_temp_free_i32(tmp);
>  
>          /* No need to add after the last transfer.  */
> @@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
>          }
>  
>          tmp = tcg_temp_new_i32();
> -        gen_aa32_ld32u(s, tmp, addr, mem_idx);
> +        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          if (user) {
>              tmp2 = tcg_const_i32(i);
>              gen_helper_set_user_reg(cpu_env, tmp2, tmp);
> -- 
> 2.25.1

I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
do I see a hang with multi_v7_defconfig by itself. Is there something
that LLVM is doing wrong when compiling/assembling/linking the kernel or
is there something wrong/too aggressive with this commit? I can
reproduce this with current QEMU HEAD (ad22d05833).

My QEMU invocation is:

$ qemu-system-arm \
    -append "console=ttyAMA0 earlycon" \
    -display none \
    -initrd rootfs.cpio \
    -kernel zImage \
    -M virt \
    -m 512m \
    -nodefaults \
    -no-reboot \
    -serial mon:stdio

and the rootfs.cpio and zImage files can be found here:

https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a

Cheers,
Nathan

