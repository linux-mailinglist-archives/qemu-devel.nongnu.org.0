Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65CE6E965A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:53:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUhK-0007zK-DS; Thu, 20 Apr 2023 09:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUgs-0007kF-Ko
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:51:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUgo-0002yo-Oa
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:51:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso395312f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998669; x=1684590669;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Evzts5ZonpaPNTIA9iL2Y101SL8VZFLC27cYG9G3MHE=;
 b=RbMP7hI3nXJXGgvUt4sSbTvktCyyiRzNObLyIRddhpTty2Sc2NEAORo3ZiyRwsHRjq
 BQkxkfoifgDvLr3nMmhUqxh5KS8PHaHdD1Aads/ixhLw/UGw+HaVf329IgoSSsbz7X0R
 viICaUDP8sJo0uz/UmucfXzpPDF8bOpj3LUgblpB9yFiOXnGlhLnPH1iYZQ9MajYuNpo
 uuC4yqI7J4na0EqXA8rKvD7plucBs4UDbSlsz0ELuzZuGj8ZCRHQRttzcOcvNwgs7NiV
 CYBQYuHdU9dL6Zoob5KbgTilyUzi+E7CGPggFAvABtXaVNs6qa2teVPyTxivdbIj+KZU
 w17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998669; x=1684590669;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Evzts5ZonpaPNTIA9iL2Y101SL8VZFLC27cYG9G3MHE=;
 b=imzQnEWgCFJ4y+v67132oHvsO2Cnw4Uq59xRM+whrUGvCFPYhRudgGFjV6SmRENwc3
 2O0tNz8tD+WUBkkGD2aoDF2l3ktnZMZJ9vvLtlqh3AzdOqkdg8mvIhgD7eiAC1IYHMh+
 Ock2Xpg+MPdDFRyo11F5LsVK7GqYL0PO6uHu0dVweKG/PAlPHMyTV1O7lz4evEE1Mh9I
 oY4QUcyBGIQeWHlc6ckjCUmIHZkB7vfTl1NItLk0Sv1Igi9IlghO2oKz5xyahnT47/8J
 sHAgOctce+UGL7hzxLwR9pu2XRsPEq9MY9hZcC7/O3bOXtWKwYGgxbCmJSwRNBXV8STh
 Tadg==
X-Gm-Message-State: AAQBX9dlNILl/URWqKCXg6bcnEHKc5QivHza/7BY9IlyZ8P4fOQOsy/b
 bmzYG3bktEEyUFL3ASldXkvR9A==
X-Google-Smtp-Source: AKy350Zibz9pT4+ktd8450odIrCffvQeaRRjTdXTa6UOPLo7najm422YnAzlaYRfskdSiVjJpIg5PA==
X-Received: by 2002:a05:6000:118e:b0:2ff:4b8a:6453 with SMTP id
 g14-20020a056000118e00b002ff4b8a6453mr1326611wrx.5.1681998668949; 
 Thu, 20 Apr 2023 06:51:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6204000000b002f900cfc262sm1990515wru.66.2023.04.20.06.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:51:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CA2F1FFB7;
 Thu, 20 Apr 2023 14:51:08 +0100 (BST)
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, Philippe =?utf-8?Q?Mathie?=
 =?utf-8?Q?u-Daud=C3=A9?=
 <philmd@linaro.org>, Eduardo  Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 RESEND 3/7] gdbstub: add support for the
 qRegisterInfo query
Date: Thu, 20 Apr 2023 14:49:58 +0100
In-reply-to: <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
Message-ID: <87o7nid5mb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> From: Brian Cain <bcain@quicinc.com>
>
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  include/hw/core/cpu.h |  4 ++++
>  gdbstub/gdbstub.c     | 27 +++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 397fd3ac68..cfdf5514d9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -124,6 +124,8 @@ struct SysemuCPUOps;
>   *       its Harvard architecture split code and data.
>   * @gdb_num_core_regs: Number of core registers accessible to GDB.
>   * @gdb_core_xml_file: File name for core registers GDB XML description.
> + * @gdb_qreg_info_lines: Array of lines of registers qRegisterInfo descr=
iption.
> + * @gdb_qreg_info_line_count: Count of lines for @gdb_qreg_info_lines.
>   * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to=
 stop
>   *           before the insn which triggers a watchpoint rather than aft=
er it.
>   * @gdb_arch_name: Optional callback that returns the architecture name =
known
> @@ -159,6 +161,8 @@ struct CPUClass {
>      vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>=20=20
>      const char *gdb_core_xml_file;
> +    const char **gdb_qreg_info_lines;
> +    int gdb_qreg_info_line_count;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlna=
me);
>=20=20
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index be18568d0a..f19f8c58c3 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1409,6 +1409,27 @@ static void handle_query_curr_tid(GArray *params, =
void *user_ctx)
>      gdb_put_strbuf();
>  }
>=20=20
> +static void handle_query_regs(GArray *params, void *user_ctx)
> +{
> +    if (!params->len) {
> +        return;
> +    }
> +
> +    CPUClass *cc =3D CPU_GET_CLASS(gdbserver_state.g_cpu);
> +    if (!cc->gdb_qreg_info_lines) {
> +        gdb_put_packet("");
> +        return;
> +    }
> +
> +    int reg_num =3D get_param(params, 0)->val_ul;
> +    if (reg_num >=3D cc->gdb_qreg_info_line_count) {
> +        gdb_put_packet("");
> +        return;
> +    }
> +
> +    gdb_put_packet(cc->gdb_qreg_info_lines[reg_num]);
> +}
> +
>  static void handle_query_threads(GArray *params, void *user_ctx)
>  {
>      if (!gdbserver_state.query_cpu) {
> @@ -1578,6 +1599,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[=
] =3D {
>          .handler =3D handle_query_curr_tid,
>          .cmd =3D "C",
>      },
> +    {
> +        .handler =3D handle_query_regs,
> +        .cmd =3D "RegisterInfo",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "l0"
> +    },

Where is this defined in the protocol spec, I can't see it in:

  https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#Gene=
ral-Query-Packets

and it seems to be information that is handled by the xml register
description. Is there a reason that isn't used for Hexagon?

>      {
>          .handler =3D handle_query_threads,
>          .cmd =3D "sThreadInfo",


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

