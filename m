Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646CA67738D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 00:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJk2t-0004rX-If; Sun, 22 Jan 2023 18:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJk2r-0004rE-RZ
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 18:46:41 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJk2q-00034c-7f
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 18:46:41 -0500
Received: by mail-vs1-xe30.google.com with SMTP id 187so11224164vsv.10
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 15:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bseTvmDmAMletSpPo3uLt+RhBswVPUGhELDR5UAfHKk=;
 b=GveH9GooBQy4SIEhaQ5dwUC/xZD72yNgiFnMqnygtqwduGcP02AJo03X3TSJf1p6oo
 H8s7bcU5BPho8vMEib3VzS73EJ0DrsleibjMR8VI5CoxVXtYHpsRxzGnWsCRJf/OPD2H
 ILMiAmrZUQ9WpnvtbDsMwE0SPKGbqZsUg5XMjfLzBi343Q5OCZDj/ibRyuPkEvutluYy
 xQrAy62LtkBN+lBqJ3cQAYnmt+5kYhN0a7/C5524JDfnkwb4p4gD49y0UFXKHMYy2fJw
 oQYHce97/xbC5WVHmYqyaeobcMTQ9fc92CBHZ5z15khaN6q7Uw4Oa3h0Bl52EWUwDTlg
 KDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bseTvmDmAMletSpPo3uLt+RhBswVPUGhELDR5UAfHKk=;
 b=AmJFKrekyor84qG+Fxe3GPJwGRwI9MNdiXr21G4LlXST4uRxdsKfr5smzu0aS4sLt5
 TlAkqbKIHSO2RVZL5qrchSlQ4kxYFDT1MMa7THG4Vgxp7HmNU3u7mMp3YNqxqZX/7fYC
 DBl1XF3DYX6StRnV+3Qc4TN4RdpOixy09mxF3tcxaP6VxekJvjo6BlBt2+IQECzb+EgN
 tg3Vzhwb6kEDov3UudYotXx9wBFEED23spPpvUftWKc6k2n+kmyCarUWzhjrk5u2fhfR
 2xTyUYMqxZvywcNDjdcXv0eJdImsWgElx23T+osdBvyMu4J5uGo+ZprenBEiGm8R5Ibk
 zkSQ==
X-Gm-Message-State: AFqh2kr+zwWrI5E7OSE4Gex1OIBML96EMRHqZEwBnuqHXtd0YSnXBhxC
 zSQPjXtR41FR9ttVp3S9rSpzDNai2lZX49TKiFk=
X-Google-Smtp-Source: AMrXdXtzE2ebOtVAGWOjpOeCrDfzgY8q1/LnDQfbDZJq1l7gHa2k4Gqo5NWOlCOuw8wBgqU7+/ZuhjtlgXlTY0MeFjI=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr2844828vst.54.1674431199118; Sun, 22
 Jan 2023 15:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:46:13 +1000
Message-ID: <CAKmqyKNGsEHxyJqAjuLvP+OLfKchzGhG8nJO4F_uNsrEXGwGTA@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: update disas.c for xnor/orn/andn and
 slli.uw
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Sat, Jan 21, 2023 at 1:16 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The decoding of the following instructions from Zb[abcs] currently
> contains decoding/printing errors:
>  * xnor,orn,andn: the rs2 operand is not being printed
>  * slli.uw: decodes and prints the immediate shift-amount as a
>             register (e.g. 'shift-by-2' becomes 'sp') instead of
>             interpreting this as an immediate
>
> This commit updates the instruction descriptions to use the
> appropriate decoding/printing formats.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  disas/riscv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d216b9c39b..ddda687c13 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1626,9 +1626,9 @@ const rv_opcode_data opcode_data[] = {
>      { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "xnor", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "orn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "andn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> @@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] = {
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>      { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> --
> 2.34.1
>
>

