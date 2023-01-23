Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B876773CB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 02:30:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJldg-0004QX-Hf; Sun, 22 Jan 2023 20:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJldf-0004QN-1y
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:28:47 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJldd-0000cg-2G
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:28:46 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id t10so11410152vsr.3
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PGiiII0BwXKJJUbUDbnGGWphR2i92OUGXU+xy/ax9fw=;
 b=BtaocSjzuTDFG0iB8559iQOAUxSQ0CT5MfywOBMKVMfvP/Utt6kKRRDNAX+eIrLY1S
 hCNdSBk8ttpW/0TNFWTxHYbWgHXCPBHCbQ+IxmL8WCvIDRQNoihFTWUVfysrMQjW7+ji
 +c4aYJxQHS545yGeiBMbJVQOmKrnh0NhKNDjHMI3bGttoZTllUtMnkaq6JR0wNUo3UqQ
 K2fQGZB02HseFGopg0aJPpnuVklwdp05claSDmnLZqwSefmwttMYTjs3/grFTWQQvj0m
 wM3VJTaKxCtkoBka9zIUPJK4AQEcfNKlTfQraGSe6YMwdKWAZmeVrVl6nxG19sEHq/FY
 vgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGiiII0BwXKJJUbUDbnGGWphR2i92OUGXU+xy/ax9fw=;
 b=DeNp62t6w7ZYXdAPhnnlQetfusRggG373AtxjRQZJQO+o4R3YD+NlYl3DJha+rxIET
 PeR1NrERYquuyzfMT579drIUW+CGgOrATkpYLyZ/jJYtlf2UpLM4pH9Re881L6o3xyug
 DZTRVIVNlERZJpdmSz/7R9VUwzsNY/txEeeOlc3OaMOeXrZMk/tDhbHGsv0FDWRdLncZ
 3xiM7rFNZBHc1RmB5no8xZFyUh+Hv6VwE4AW3kfDtVQQLYwa3ZToNfdj7LXdgOUKVKP5
 xX5oYqb64lUYCdXS8RR1cp8U0KMTHmQ4UPhqRZePeKbLCb4QAL2/U2CkQv6vMQUThBW5
 d03Q==
X-Gm-Message-State: AFqh2kpum6ZJmxa8EPnNybcI9EeYXHrZaiDcXEG5EChdvZGQNt/DQrqP
 CSuxC6+I9hwuvrbhr/PdbmRV2OJfdaPszCUoweU=
X-Google-Smtp-Source: AMrXdXvwIYdJ0CRJ1Z0ut8PcvSk5oGhkBo5CempYeKvxmTFxohL0DShraXVHaDEiCXwdBHjhZ/pSj2F/vPX/13Bov3o=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr2622511vsn.64.1674437322886; Sun, 22
 Jan 2023 17:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 11:28:16 +1000
Message-ID: <CAKmqyKPeH54jj1kV6EHmeeU8yQ0B3b0r7nDPXf-qAjD6dnXSWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: add Zicond as an experimental
 extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Jan 21, 2023 at 12:36 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> This implements the Zicond (conditional integer operations) extension,
> as of version 1.0-draft-20230120 as an experimental extension in QEMU
> ("x-zicond").
>
> The Zicond extension acts as a building block for branchless sequences
> including conditional-{arithmetic,logic,select,move}.  Refer to the
> specification for usage scenarios and application guidance.
>
> The following instructions constitute Zicond:
>   - czero.eqz rd, rs1, rs2  =>  rd = (rs2 == 0) ? 0 : rs1
>   - czero.nez rd, rs1, rs2  =>  rd = (rs2 != 0) ? 0 : rs1
>
> See
>   https://github.com/riscv/riscv-zicond/releases/download/v1.0-draft-20230120/riscv-zicond_1.0-draft-20230120.pdf
> for the (current version of the) Zicond specification and usage details.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>
> Changes in v2:
> - gates availability of the instructions through a REQUIRE_ZICOND
>   macro (these were previously always enabled)
>
>  MAINTAINERS                                  |  7 +++
>  target/riscv/cpu.c                           |  4 ++
>  target/riscv/cpu.h                           |  1 +
>  target/riscv/insn32.decode                   |  4 ++
>  target/riscv/insn_trans/trans_rvzicond.c.inc | 54 ++++++++++++++++++++
>  target/riscv/translate.c                     |  1 +
>  6 files changed, 71 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08ad1e5341..ca914c42fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -295,6 +295,13 @@ F: include/hw/riscv/
>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
>
> +RISC-V Zicond extension
> +M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> +M: Christoph Muellner <christoph.muellner@vrull.eu>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/insn_trans/trans_zicond.c.inc

I don't think we need a maintainers entry for official extensions,
that seems like it's going to get out of hand very quickly.

Alistair

> +
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
>  L: qemu-riscv@nongnu.org
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..f214b03e95 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,7 @@ struct isa_ext_data {
>  static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
> @@ -1080,6 +1081,9 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>
> +    /* Zicond 1.0-draft-20230120 */
> +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5609b62a2..4b6ff800d3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -446,6 +446,7 @@ struct RISCVCPUConfig {
>      bool ext_zkt;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zicond;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b7e7613ea2..ca812c2f7a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
>  # *** RV32 Zksed Standard Extension ***
>  sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
>  sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> +
> +# *** Zicond Standard Extension ***
> +czero_eqz   0000111 ..... ..... 101 ..... 0110011 @r
> +czero_nez   0000111 ..... ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
> new file mode 100644
> index 0000000000..20e9694a2c
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> @@ -0,0 +1,54 @@
> +/*
> + * RISC-V translation routines for the XVentanaCondOps extension.
> + *
> + * Copyright (c) 2022 VRULL GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZICOND(ctx) do {                 \
> +    if (!ctx->cfg_ptr->ext_zicond) {             \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +/* Emits "$rd = ($rs2 <cond> $zero) ? $zero : $rs1" */
> +static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond cond)
> +{
> +    TCGv zero = tcg_constant_tl(0);
> +    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
> +}
> +
> +static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_EQ);
> +}
> +
> +static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_NE);
> +}
> +
> +static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    return gen_logic(ctx, a, gen_czero_eqz);
> +}
> +
> +static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    return gen_logic(ctx, a, gen_czero_nez);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..1468748835 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1061,6 +1061,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
> +#include "insn_trans/trans_rvzicond.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> --
> 2.34.1
>
>

