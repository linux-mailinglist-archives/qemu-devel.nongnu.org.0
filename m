Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A286519D79
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:56:45 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCgW-0003RQ-9B
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nmBhm-00008W-Ly
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:53:59 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:46977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nmBhk-0004P6-K5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:53:58 -0400
Received: by mail-ua1-x929.google.com with SMTP id x21so310400uan.13
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5UoUIVlpLpU7BDc9tti8/maQbpzOCC6LFBU1GDpGFhU=;
 b=iK7hWx4th84nPvQMomeSyfzG7ZIc+cmlOurmCOX1zOSiyoNAqMwBIRLprbVrQ5Ya4B
 T0IBXZBHmWVKkpcUrVogLK5hxEReF7IIYaSaHHrCYrDL35XTGCss6eNovlBZqE3eU1aL
 vEFEvN4hLzjMsykbesJ/rW1HyfokJ+fAniwlRnLRkREO8GiJqackpq81kBZrXYFA3JEk
 +st6ZDH+QsSqquECwfoYZRwL1hRHlKqiZimWzFX3/bdBBvoqQ/TfuEo8XbPgNXItdpKP
 XOCkBjIvpXWtv3qzk5tWPVq6jdRT3BViQZZ+JsCLQQCgMU7IMHZqrcfbeH7qoo47GAPS
 z46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5UoUIVlpLpU7BDc9tti8/maQbpzOCC6LFBU1GDpGFhU=;
 b=K+k3GSjx8/PB/rHEdkBnY/5ig3Eb46rhnhCUJq+Nr09B1zbYQgw+SLCAqh2YABV3Hk
 h/hYI2+/bN1R71cDeZt6CMMCgXjbWeATPBoARK7Q6WhXRKpv8EA+craZqRr0NuJWW87e
 f1HyxiK55j4BW6Y7Nv1Ww8Gh7C8zNISSeXpwCQIvozYB6x2CVkVy81lghoP25qoopVk4
 HGfu7RslOrt/LcGYEG0++qrThxRsqGZ5yYtX05VeZSAGCsifa1L7abAR0FcH/NTp/NYQ
 7VEcIlPmmxRF79aYqmTbxUay39BnfQGY7syP4sNwnwbcWx8Xlq1pKDywKv983yKvOM/E
 O7MQ==
X-Gm-Message-State: AOAM532lAKazsOGI/1QQGgJNrqEWltUDryHSCXZDGhiPH2jXGDgdA0wh
 scKpFdpdUlxBY0gK0fIQuAW+Sg==
X-Google-Smtp-Source: ABdhPJzr+Aod2KylNZd73wHCrQnTKs2MpYEzV7sYRUd4zeFPzA2eVPDkO+8ZZEy3xMRYOamJPUjlww==
X-Received: by 2002:a9f:3189:0:b0:35c:c458:ee11 with SMTP id
 v9-20020a9f3189000000b0035cc458ee11mr5899828uad.31.1651658033701; 
 Wed, 04 May 2022 02:53:53 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182]) by smtp.gmail.com with ESMTPSA id
 w6-20020ab067c6000000b0036280b488c7sm4140861uar.16.2022.05.04.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 02:53:52 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id o132so346911vko.11;
 Wed, 04 May 2022 02:53:52 -0700 (PDT)
X-Received: by 2002:a1f:a3d7:0:b0:349:6b56:a90 with SMTP id
 m206-20020a1fa3d7000000b003496b560a90mr6764668vke.12.1651658031779; Wed, 04
 May 2022 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-3-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-3-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 4 May 2022 17:53:41 +0800
X-Gmail-Original-Message-ID: <CANzO1D0DxbM=KAwU1E4ZpMfdBpojqX-5+tYGDmtKoQujScuC6A@mail.gmail.com>
Message-ID: <CANzO1D0DxbM=KAwU1E4ZpMfdBpojqX-5+tYGDmtKoQujScuC6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="000000000000465b2205de2c9ae9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=frank.chang@sifive.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000465b2205de2c9ae9
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

I found that Atish has already submitted a patch to implement the
mcountinhibit CSR:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg879349.html

Regards,
Frank Chang

On Fri, Apr 29, 2022 at 11:44 PM Anup Patel <apatel@ventanamicro.com> wrote:

> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
> implementation that don't want to implement can simply have a dummy
> mcountinhibit which always zero.
>
> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
> the CSR ops.")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu_bits.h | 3 +++
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d06..4a55c6a709 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -159,6 +159,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* Machine Counter Setup */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2bf0a97196..e144ce7135 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie
>          },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,
>  write_mtvec       },
>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
> write_mcounteren  },
> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
> +                                             .min_priv_ver =
> PRIV_VERSION_1_11_0 },
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
> write_mstatush    },
>
> --
> 2.34.1
>
>
>

--000000000000465b2205de2c9ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anup,<div><br></div><div>I found that Atish has already=
 submitted a patch to implement the mcountinhibit CSR:</div><div><a href=3D=
"https://www.mail-archive.com/qemu-devel@nongnu.org/msg879349.html">https:/=
/www.mail-archive.com/qemu-devel@nongnu.org/msg879349.html</a><br></div><di=
v><br></div><div>Regards,</div><div>Frank Chang</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29, 2022=
 at 11:44 PM Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com">apat=
el@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The mcountinhibit CSR is mandatory for priv spec v1.11 o=
r higher. For<br>
implementation that don&#39;t want to implement can simply have a dummy<br>
mcountinhibit which always zero.<br>
<br>
Fixes: a4b2fa433125 (&quot;target/riscv: Introduce privilege version field =
in<br>
the CSR ops.&quot;)<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 3 +++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 4d04b20d06..4a55c6a709 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -159,6 +159,9 @@<br>
=C2=A0#define CSR_MTVEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x305<br>
=C2=A0#define CSR_MCOUNTEREN=C2=A0 =C2=A0 =C2=A0 0x306<br>
<br>
+/* Machine Counter Setup */<br>
+#define CSR_MCOUNTINHIBIT=C2=A0 =C2=A00x320<br>
+<br>
=C2=A0/* 32-bit only */<br>
=C2=A0#define CSR_MSTATUSH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x310<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 2bf0a97196..e144ce7135 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_MIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;=
mie&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 N=
ULL,=C2=A0 =C2=A0 rmw_mie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVEC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mtvec=
&quot;,=C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mtvec,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mtvec=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MCOUNTEREN]=C2=A0 =3D { &quot;mcounteren&quot;, an=
y,=C2=A0 =C2=A0read_mcounteren,=C2=A0 write_mcounteren=C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_MCOUNTINHIBIT] =3D { &quot;mcountinhibit&quot;, any, re=
ad_zero, write_ignore,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.min_priv_ver =3D PRIV_VERSION_1_11_0 },<br>
<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MSTATUSH]=C2=A0 =C2=A0 =3D { &quot;mstatush&quot;,=
=C2=A0 =C2=A0any32, read_mstatush,=C2=A0 =C2=A0 write_mstatush=C2=A0 =C2=A0=
 },<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div>

--000000000000465b2205de2c9ae9--

