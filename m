Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93221676B99
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVfU-0000OK-U6; Sun, 22 Jan 2023 03:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfP-0000N1-DN
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:31 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfL-0004Ft-50
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674375918; bh=IqXTTwHghrzpZoGUBAYC70AZnkiTt2smPdzU9/pjSu0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wO/dlI0ujRqUMX848RSc16KvNhzkyjaah9EBQzGks4t4Lj0oHUALhkgTBY02hfAbz
 7Q2Lc6wQWHfkHUka7UPRKNVF3eJTtmGSX9wCPHHq0aDQ8wWgDzml4mrzEYCgD5u/DG
 ZY62h5EetNL6ghoybYVPSCdeC9uUswMGpFe9o91k=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 731EB6019E;
 Sun, 22 Jan 2023 16:25:18 +0800 (CST)
Message-ID: <c87e5b2d-3923-d7af-7e5e-ec994bd93cec@xen0n.name>
Date: Sun, 22 Jan 2023 16:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 02/10] target/loongarch: Disassemble jirl properly
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-3-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/18/23 09:11, Richard Henderson wrote:
> While jirl shares the same instruction format as bne etc,
> it is not assembled the same.  In particular, rd is printed
> first not second and the immediate is not pc-relative.
>
> Decode into the arg_rr_i structure, which prints correctly.
> This changes the "offs" member to "imm", to update translate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/disas.c                       | 2 +-
>   target/loongarch/insn_trans/trans_branch.c.inc | 2 +-
>   target/loongarch/insns.decode                  | 3 ++-
>   3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
> index 858dfcc53a..7cffd853ec 100644
> --- a/target/loongarch/disas.c
> +++ b/target/loongarch/disas.c
> @@ -628,7 +628,7 @@ INSN(beqz,         r_offs)
>   INSN(bnez,         r_offs)
>   INSN(bceqz,        c_offs)
>   INSN(bcnez,        c_offs)
> -INSN(jirl,         rr_offs)
> +INSN(jirl,         rr_i)
>   INSN(b,            offs)
>   INSN(bl,           offs)
>   INSN(beq,          rr_offs)
> diff --git a/target/loongarch/insn_trans/trans_branch.c.inc b/target/loongarch/insn_trans/trans_branch.c.inc
> index 65dbdff41e..a860f7e733 100644
> --- a/target/loongarch/insn_trans/trans_branch.c.inc
> +++ b/target/loongarch/insn_trans/trans_branch.c.inc
> @@ -23,7 +23,7 @@ static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
>       TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>       TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
>   
> -    tcg_gen_addi_tl(cpu_pc, src1, a->offs);
> +    tcg_gen_addi_tl(cpu_pc, src1, a->imm);
>       tcg_gen_movi_tl(dest, ctx->base.pc_next + 4);
>       gen_set_gpr(a->rd, dest, EXT_NONE);
>       tcg_gen_lookup_and_goto_ptr();
> diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
> index 3fdc6e148c..de7b8f0f3c 100644
> --- a/target/loongarch/insns.decode
> +++ b/target/loongarch/insns.decode
> @@ -67,6 +67,7 @@
>   @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
>   @rr_i14s2         .... ....  .............. rj:5 rd:5    &rr_i imm=%i14s2
>   @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
> +@rr_i16s2         .... ..  ................ rj:5 rd:5    &rr_i imm=%offs16
>   @hint_r_i12           .... ...... imm:s12 rj:5 hint:5    &hint_r_i
>   @rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
>   @rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5    &rrr_sa
> @@ -444,7 +445,7 @@ beqz            0100 00 ................ ..... .....     @r_offs21
>   bnez            0100 01 ................ ..... .....     @r_offs21
>   bceqz           0100 10 ................ 00 ... .....    @c_offs21
>   bcnez           0100 10 ................ 01 ... .....    @c_offs21
> -jirl            0100 11 ................ ..... .....     @rr_offs16
> +jirl            0100 11 ................ ..... .....     @rr_i16s2
>   b               0101 00 ..........................       @offs26
>   bl              0101 01 ..........................       @offs26
>   beq             0101 10 ................ ..... .....     @rr_offs16

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks for the catch!


