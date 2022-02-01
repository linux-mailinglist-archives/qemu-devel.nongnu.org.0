Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE5B4A557D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:09:40 +0100 (CET)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjY3-0003oM-E3
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjXF-00039c-Nb
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:08:49 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37553
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjXE-0005EV-4T
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:08:49 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n17so19534707iod.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 19:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUNrmq2wtTuMLTfFQtQf4hCAmhIrp9mxBqlBDzWPD/o=;
 b=j6wN+h5gVwsexa/rsh97FM8/jyMo0RARG6YYJO8sUKmKCa9lZRJPZeENBZNf2c/xWZ
 Crmlm3szWK8wvgqc2OkkR7T2++lXkfm80MA4T6LX1No887SCmtIQ5prvo+STDYJ9/mWn
 J/ME7x1j1KgdQcJXLHOV+ABFRoG+1dW1FGwTpa0K/8SoWErXT31ijLT3lWVUnRqTmH19
 Rq2Wzm0zQkww8FA7Qc/jh/g56M+luPG/ktrUzkmjCMDKrbLumJEJkUIQT91rTmVlRYSz
 NKQqoj2KwtNTIpwuEOPrgippe7CmhN7ka6WkaGsYzBSjvqmD7lsgRgjpPeA1ofhljMjA
 AA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUNrmq2wtTuMLTfFQtQf4hCAmhIrp9mxBqlBDzWPD/o=;
 b=bRPuEdxt/XzPGRYhKRKzCRbJ1KjHjD42wPKjAZ/rr7KTYRX1voNSqcnZBi0x0jg2AY
 VwmaqUu9HxpNHqtn+E0UM1acP08Q0FjQAr31AU+pVhdWOO4ibGUlXYMANXY5+f0PWcJJ
 pguFwG1SA/gcm0GgqvSndJXZn4voZn9VDYoo9CNWC+80T+qhmo/4ONsbFt3Tr1ZbRx6l
 gkGUV359RvS5vQ/Hq4bXB0YqZuN0NLODcEwBBY3QKvJzf3nm3486cya4Qs3KQbxYlnRE
 s91WYQRTexhKtRq2dfmeGA23Y0k18re0W3VecJsSuC035+f0vCRJ9WfUOv3dqMb7Tyhx
 ea6A==
X-Gm-Message-State: AOAM533XvEEsXvvvE7qFGh84IRf0t8Vo5I+6fM6k8gcH9j7whYuZF7L1
 wPSwP6W99xSIYFG2pbEMvHvMBK545kehsot60zI=
X-Google-Smtp-Source: ABdhPJziqn383OfkvX5BIu06NjVV1QT2+hKQNhyoUSM9ZxvhUpkbOMLxHPgamoFXX98FN4YNNWJcLH0uGdp64BAFiEo=
X-Received: by 2002:a05:6638:1028:: with SMTP id
 n8mr12407399jan.318.1643684926202; 
 Mon, 31 Jan 2022 19:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-5-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-5-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:08:20 +1000
Message-ID: <CAKmqyKNEQwvesduJHFoadC3x7RDdw08ntinmvQwZptqwS=M-SQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] target/riscv: access cfg structure through
 DisasContext
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:05 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The Zb[abcs] support code still uses the RISCV_CPU macros to access
> the configuration information (i.e., check whether an extension is
> available/enabled).  Now that we provide this information directly
> from DisasContext, we can access this directly via the cfg_ptr field.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
>   into DisasContext) instead of going throuhg RISCV_CPU
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 810431a1d6..f9bd3b7ec4 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -19,25 +19,25 @@
>   */
>
>  #define REQUIRE_ZBA(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
> +    if (ctx->cfg_ptr->ext_zba) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBB(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
> +    if (ctx->cfg_ptr->ext_zbb) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBC(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
> +    if (ctx->cfg_ptr->ext_zbc) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBS(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
> +    if (ctx->cfg_ptr->ext_zbs) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
> --
> 2.33.1
>
>

