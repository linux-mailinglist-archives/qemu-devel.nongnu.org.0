Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3A4AD160
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 07:13:34 +0100 (CET)
Received: from localhost ([::1]:58582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHJkr-00058L-8u
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 01:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHJfj-0003n9-47
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:08:15 -0500
Received: from [2607:f8b0:4864:20::d32] (port=43666
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHJfh-0007s4-22
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 01:08:14 -0500
Received: by mail-io1-xd32.google.com with SMTP id m185so11609427iof.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 22:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8cpGGjdnGuu5TCvh/wGkM+Fu5hu3+myEGOOjacv6AY=;
 b=JW68MSm7lzkbTV+fw0UlOnG33g6sS7/f0FeLjOBBRDBpd1USMfpKqlUkpkBAOIIYwK
 a40V2eHX1g6p637qUCK6o+JdKiHTaDb79/XUA2WMsL6fod3p434UfCHgLOM+HErogE2R
 qyaLbGAr3X1T8iEdtL2l7DeLz7XVkSLlSni024mhz1b94hxcFe/lmrz+QjoF31v2P4Wy
 wgwv5UMvyOOBeLe9OOu/9TcxHIE90T3SeomghUZfvtmIg4ujMsa6mz1JaNqFW4C6ymzh
 S1R+Fc/Sw0gkjVfNj5itDcbyIUMVCDA+RbHBHY97gjSC3ys6BKpRkR+GLpgD2OR2mvvn
 KFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8cpGGjdnGuu5TCvh/wGkM+Fu5hu3+myEGOOjacv6AY=;
 b=vIdNvQDOqhzEz3xHvUCgnP7YVxXFcON1NV+ZMnppw+iaCAIBCUtCkCTv3w+NwEBvik
 HD3Dd2JoBalvQ+UX9RFBGmkhTAEHpl3Ond6v+O7si8AGQs4uiuF7wrcOyKgMKBOeqgX0
 YGyzp6frRbQqukO+nN3aCwjeEsXGGstz4aD281btPcD2YZAINfXUAxn87LwG7FvqJss2
 WDiTRWJZIfsqGcFRpDHbTInh0xbVL0DUsyi6fuOILm8PlsHsXRPmaXSnlY8XNA6LLs1w
 5TmzqwMLwv4VsqWII0yJSQkaR0EjYfirFa/zJJ63si61IzFTBerFj5j81nwgSZygE0CD
 4ijA==
X-Gm-Message-State: AOAM531LJxjD6fLaxz6MScQ6IAj2RvkWhkoCB+T8z9AgJi81kHCB69+m
 UjYD6aL4cLMmdcPqC9/8R2FsbP/oKPTt1yuNimI=
X-Google-Smtp-Source: ABdhPJxwImt58qwzpzAmqW617ps7bCvxx3wVwzJETP89gvvz3zrf7JLOFWSZbLu2PLggys/YnFpyRK7Y0kXoeqZENRQ=
X-Received: by 2002:a05:6602:727:: with SMTP id
 g7mr1453153iox.90.1644300491826; 
 Mon, 07 Feb 2022 22:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
 <20220202005249.3566542-4-philipp.tomsich@vrull.eu>
In-Reply-To: <20220202005249.3566542-4-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Feb 2022 16:07:44 +1000
Message-ID: <CAKmqyKNoHBFQaB9k3+cs2n0n8zFhg1Kv3uQuxhr-6R-pP8UasA@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] target/riscv: access configuration through cfg_ptr
 in DisasContext
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 2, 2022 at 11:26 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
> copies (in DisasContext) of some of the elements available in the
> RISCVCPUConfig structure.  This commit redirects accesses to use the
> cfg_ptr copied into DisasContext and removes the shallow copies.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - (new patch) test extension-availability through cfg_ptr in
>   DisasContext, removing the fields that have been copied into
>   DisasContext directly
>
>  target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc   | 104 +++++++++++-----------
>  target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
>  target/riscv/translate.c                  |  14 ---
>  4 files changed, 55 insertions(+), 69 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 3cd1b3f877..f1342f30f8 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -806,7 +806,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
>
>  static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>  {
> -    if (!ctx->ext_ifencei) {
> +    if (!ctx->cfg_ptr->ext_ifencei) {
>          return false;
>      }
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f85a9e83b4..ff09e345ad 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -74,7 +74,7 @@ static bool require_zve32f(DisasContext *s)
>      }
>
>      /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve32f ? s->sew <= MO_32 : true;
> +    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
>  }
>
>  static bool require_scale_zve32f(DisasContext *s)
> @@ -85,7 +85,7 @@ static bool require_scale_zve32f(DisasContext *s)
>      }
>
>      /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
>  }
>
>  static bool require_zve64f(DisasContext *s)
> @@ -96,7 +96,7 @@ static bool require_zve64f(DisasContext *s)
>      }
>
>      /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_32 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
>  }
>
>  static bool require_scale_zve64f(DisasContext *s)
> @@ -107,7 +107,7 @@ static bool require_scale_zve64f(DisasContext *s)
>      }
>
>      /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->ext_zve64f ? s->sew <= MO_16 : true;
> +    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
>  }
>
>  /* Destination vector register group cannot overlap source mask register. */
> @@ -174,7 +174,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>      TCGv s1, dst;
>
>      if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
> +        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {

This fails checkpatch as the line is too long

Can you run checkpatch on the series and re-send it?

Alistair

