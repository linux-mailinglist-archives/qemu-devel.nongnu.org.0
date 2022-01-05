Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A34858B3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:54:19 +0100 (CET)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BQP-0008Fg-L6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BJs-0005fk-Qo
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:47:32 -0500
Received: from [2a00:1450:4864:20::52d] (port=38639
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BJq-0004S4-IX
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:47:31 -0500
Received: by mail-ed1-x52d.google.com with SMTP id bm14so164946edb.5
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=o09pkn08ZL1i7wzAD/DipOPmSqldC/4ZdRmQEyf9tdI=;
 b=BmKidgrWpZHIGpjpFtHryV5Oiqu/52v6bFTQvZcAaOHZzhspTbf5XWCDVBTsll4fiR
 r/Dzxa/GbQlLCrXGMLojdC462yim2RH7iWBYNGfmMyy1CfwG1v61Y+TrbnK8aGyWGGmx
 xhmGUbYlDEUQ8CYug8rWA/ioWJKQQbBWXADZmu+YysaIfr5z64jcR9qcIcnWKn1i9Jgc
 S9hMhtTFf8yhB16+iQ5BI6yup+PuACOZM6G3xT3sjaR3vFEGVqYRoTxKJ80tUBYUt1+Q
 Gvpfhb8kfCTMTA3sIygYp+7yrHEP0Cl2uVFVbrbEfHJ2yUhFRbEsBy43iT2vNYR1Xz3o
 kCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=o09pkn08ZL1i7wzAD/DipOPmSqldC/4ZdRmQEyf9tdI=;
 b=oDW9bsX+eowVHRDXU2ibZ0A3x1REfgZeUfaPsK0N0id0X+OLmhnzUiZye/18WyF3c5
 LScFF7E3vlWYlqrHDAcQabxY3RkCcT2DuRlNx8CBNHXMp603nsOKf0reFgUR1ykPU24T
 QF643bgfwOoXIZpMzO8W+IXpWIkKOdPTIXjahEHXpCuzNdURoZAv1eRmZzyYxdzW3mCU
 h/9gWm0xV3NokuYwh2lyACm7XB27JdLE+09SvcriwwZd7dQwk0wWnLSivoFqoSsepy3f
 CYRBCiIQW3XbuFPkFThenkx4Ea1H5VT2Nz3IYOknOB9aKOXeu7mfnVbv5hZ0ZqjAWyZC
 5BiQ==
X-Gm-Message-State: AOAM533suYnKGzaimA1lhEBSOe7nk5PdjzBd4A7RCXtkWsWJZLStb3cV
 xvvnz3dU0UINYlAR8vDwWmiVQA==
X-Google-Smtp-Source: ABdhPJztQeogoMofK65ldvmk98ywdnGwrxiOq5imPOoiSXkLQs6W/sx3F06nj/BKQtGLOj24/irPPQ==
X-Received: by 2002:a17:906:d553:: with SMTP id
 cr19mr41883526ejc.400.1641408448958; 
 Wed, 05 Jan 2022 10:47:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id sd5sm12502472ejc.37.2022.01.05.10.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:47:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E3F11FFB7;
 Wed,  5 Jan 2022 18:47:27 +0000 (GMT)
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Konrad Schwarz <konrad.schwarz@siemens.com>
Subject: Re: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Date: Wed, 05 Jan 2022 18:43:32 +0000
In-reply-to: <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
Message-ID: <874k6ij9z4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Konrad Schwarz <konrad.schwarz@siemens.com> writes:

> GDB target descriptions support typed registers;
> such that `info register X' displays not only the hex value of
> register `X', but also the individual bitfields the register
> comprises (if any), using textual labels if possible.
>
> This patch includes type information for GDB for
> a large subset of the RISC-V Control and Status Registers (CSRs).
>
> Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
<snip>

Not withstanding my general comments (wish) to eventually get rid of
per-arch XML generation:

>  static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> @@ -163,21 +167,33 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, =
int base_reg)
>      riscv_csr_predicate_fn predicate;
>      int bitsize =3D 16 << env->misa_mxl_max;
>      int i;
> +    riscv_csr_operations *csr_op;
> +    struct riscv_gdb_csr_tg const *csr_tg;
>=20=20
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd=
\">");
>      g_string_append_printf(s, "<feature>      name=3D\"org.gnu.gdb.riscv=
.csr\">");

With these changes does it still match the org.gnu.gdb.riscv.csr
register description in gdb? Previously for custom XML I've used the
org.qemu.ARCH.REGS form to distinguish between something GDB expects and
something we invented (changed since 797920b952ea).

>=20=20
> -    for (i =3D 0; i < CSR_TABLE_SIZE; i++) {
> -        predicate =3D csr_ops[i].predicate;
> +    g_string_append(s, riscv_gdb_csr_types);
> +
> +    for (i =3D 0, csr_op =3D csr_ops, csr_tg =3D riscv_gdb_csr_type_grou=
p;
> +            i < CSR_TABLE_SIZE; ++csr_op, ++csr_tg, ++i) {
> +        predicate =3D csr_op->predicate;
>          if (predicate && (predicate(env, i) =3D=3D RISCV_EXCP_NONE)) {
> -            if (csr_ops[i].name) {
> -                g_string_append_printf(s, "<reg name=3D\"%s\"", csr_ops[=
i].name);
> +            if (csr_op->name) {
> +                g_string_append_printf(s, "<reg name=3D\"%s\"", csr_op->=
name);
>              } else {
>                  g_string_append_printf(s, "<reg name=3D\"csr%03x\"", i);
>              }
>              g_string_append_printf(s, " bitsize=3D\"%d\"", bitsize);
> -            g_string_append_printf(s, " regnum=3D\"%d\"/>", base_reg + i=
);
> +            g_string_append_printf(s, " regnum=3D\"%d\"", base_reg + i);
> +            if (csr_tg->gdb_type) {
> +                g_string_append_printf(s, " type=3D\"%s\"", csr_tg->gdb_=
type);
> +            }
> +            if (csr_tg->gdb_group) {
> +                g_string_append_printf(s, " group=3D\"%s\"", csr_tg->gdb=
_group);
> +            }
> +            g_string_append(s, " />\n");
>          }
>      }
<snip>

--=20
Alex Benn=C3=A9e

