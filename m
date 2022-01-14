Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10348EB18
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:51:18 +0100 (CET)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Mz7-0000Dt-If
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8Mp5-0005Hh-43
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:40:56 -0500
Received: from [2a00:1450:4864:20::433] (port=34406
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8Mp3-0005yS-0U
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:40:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id h10so15703000wrb.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4URcOAUG7Dp4R7B1X8bEuJSufIESSC/SSaU8cMqUsw=;
 b=qkZKd4gL8rx/mztxIFX5nnkLRo3VXFs+VgH0Vohta2JoIWl9MjPlMVTlwQE1WJ8J9A
 MqMvImEk9mAHm7OixPWyo4/CZufgY8zdQi9HnjumAJpSipcUb3Q9FXjobuAplZbHf72C
 7fn2BpFAxibVTZBVz5LvWjvofrdrhPRZKo93KfVvx10guHZgsxbzRThcgrFtJuxEK6/6
 /UrrBYdbuP2Ua2SU6GqvRx5ETPloZRSb7IbK8ASKqkaZ1pgGiQ+b/oqO4j/HRRIT1rlK
 Sie2hNe/iu1HHO7c0XNejR7HxrOCscEKpEEcAsC3pi6lKa5Ns31lOInmWbaP4b1NU1NE
 bLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4URcOAUG7Dp4R7B1X8bEuJSufIESSC/SSaU8cMqUsw=;
 b=XLJSO4NNtky9tyJFYF9IU0R2adGBh76EBmO94O6YRQp0w1hK9BD/FaGDCyihGpt8Of
 5B0B/ohlHfrSJzyFMpxawnqsBAUyTGAmoGz6nfFJ30q9YmeA2HJ893D/CHcmb/inTtqv
 TMWdJLUKhwi76W+RwJIqDAa5GmoI4XOphfd/+CgnodOOe44UENp5hwXG682f2SHXYwED
 GzhluInezXG49wnSit0jYhcGHVdn2rk03OcgixpsNFYstdGIXd64h9H21lHrd5ilN7i7
 2ZxaV7D9NXHkvDX7TbgcPJlRU7992elqq8Eox7faqVhUjjkIHoDNG3Z8BCV1hJTh5/g5
 t+tw==
X-Gm-Message-State: AOAM5316OcsRndxKE3ODIUNmHbOz7i7okzxqTdW+H05P1Jpj/UAyTIde
 K1dHOeMoimQMwYhFQY6LXHNjfDCEXRldJRBBEqvTQg==
X-Google-Smtp-Source: ABdhPJyZZQYuOpJIOxFoPPSUp76+q1SljVz3C3mT23FnZetlJMT/7OTKXb4bVCthnfhARAic87yCxk2uUA5fxH8YYLk=
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr8368101wrx.346.1642167651436; 
 Fri, 14 Jan 2022 05:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220114014059.23300-3-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jan 2022 19:10:39 +0530
Message-ID: <CAAhSdy0KEm=CeG4TCLdyf1i_aO-pKG9N5yYQU6_OLPE44fQi-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: add support for svinval extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                          |  1 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  7 ++
>  target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 85 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ff6c86c85b..45ac98e06b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -668,6 +668,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d3d17cde82..c3d1845ca1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -327,6 +327,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svinval;
>          bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..7a0351fde2 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
> +
> +# *** Svinval Standard Extension ***
> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma

s/0011011/0010011/

> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma

s/0111011/0110011/

> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
> new file mode 100644
> index 0000000000..1dde665661
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -0,0 +1,75 @@
> +/*
> + * RISC-V translation routines for the Svinval Standard Instruction Set.
> + *
> + * Copyright (c) 2020-2021 PLCT lab
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
> +#define REQUIRE_SVINVAL(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
> +        return false;                                \
> +    }                                                \
> +} while (0)
> +
> +static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as sfence.vma currently */
> +    REQUIRE_EXT(ctx, RVS);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.vvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.gvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_gvma_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..4e5a9660a4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -838,6 +838,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> +#include "insn_trans/trans_svinval.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> --
> 2.17.1
>
>

Apart from the minor mistake above, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

