Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3C7431308
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:14:55 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOjO-0008K9-Tb
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcOhL-0006fd-C4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:12:47 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcOhH-0005DV-Ti
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:12:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id g5so10786225plg.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P9LJDAFmVZGMGxfSy576sKDJv0cqORIhPARy30OZ6Ek=;
 b=l5tNpI047Nvw498WT1ZtADxzlQat+ZfhC/rRWJ+b8x7TEnO2b9tPvFQzzcWvwBgl7j
 +gbqeWiVaagmbC5/J8zABWtZqWOz4/dszvGb4QkH4Tli8mXwVCWQouCZ5M4ZdQm66+6N
 YXqWcpA/wqt5YBHrH7/RXIzulazSu+faEZoXOqF/LQRCPYI5JTkEu4etIQIDfKqEiM7V
 zL7yourW2oTalDG1DQ1tyzLt1lUS4dMVxEXP0PWaVR4p7LQg4I5/wYLvOl6rJyi831Cq
 t+LXzKFXqB/Sf9dpLFZ+OKCszeu2HVnqIUwTAN9NSm69vw2Sh6cZ1eGuLT5HG8rwgchk
 0jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9LJDAFmVZGMGxfSy576sKDJv0cqORIhPARy30OZ6Ek=;
 b=ymJaMGNWewi8CjP00eQCrXSLOBtjOnhHHnRsup1M+qZWhqJxJC8n8YF1C+8tLC/UYy
 b6u38KQ+OaavhapaYK0pMfVaR/kXROjQiZRFWoyU9+rDdLH28HwZ8h6QbKhhT64g1mu0
 d5WjWfcQ4pxkqWRePJEN20lpBydAfT/X15hhE4xDf9JsOvVsrGQB2Gm1kZ1kHkMFVxai
 /KtYTLpn7wOxvXtT1Dya0AQfj6Z0RddV2KFcn7OJZyvxyFbgSAbb2SRF649erl0g3Au0
 k8KHd+nlzn0O9gOUI/lm4y0YXJ5E62BCIHjMU/EMKssK/3lK4vaZU2xvjrw1eMJIgTJq
 QesA==
X-Gm-Message-State: AOAM531JELxjIvNaYBIOpuLKUHPrnUcMdrucj2l0dz5IktpFaXgBBsI5
 f+nsu+hXWfPl4je7B9qWubh3pH4Y5UAmrPgC
X-Google-Smtp-Source: ABdhPJzsxYlMc9nkKq7EHlKUDmk2x/CnUe3fH17YYiNnh11FMGN8k3y4TU/rCnOH3RZfbe5wwGCuQw==
X-Received: by 2002:a17:902:8ec5:b0:13a:2789:cbb0 with SMTP id
 x5-20020a1709028ec500b0013a2789cbb0mr26406258plo.60.1634548362038; 
 Mon, 18 Oct 2021 02:12:42 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51])
 by smtp.gmail.com with ESMTPSA id t13sm12261284pjg.25.2021.10.18.02.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:12:41 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so12042803pjb.3; 
 Mon, 18 Oct 2021 02:12:41 -0700 (PDT)
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr47707218pjr.83.1634548361490; 
 Mon, 18 Oct 2021 02:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
 <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
In-Reply-To: <b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alistair.francis@wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 17:12:30 +0800
X-Gmail-Original-Message-ID: <CANzO1D1NWKdwcN7fNLTufDnD2svEg53nSF1EOWhkEFVbQ8zqBg@mail.gmail.com>
Message-ID: <CANzO1D1NWKdwcN7fNLTufDnD2svEg53nSF1EOWhkEFVbQ8zqBg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/riscv: Organise the CPU properties
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: multipart/alternative; boundary="00000000000074752e05ce9cf2af"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074752e05ce9cf2af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair.francis@opensource.wdc.com> =E6=96=BC 2021=E5=B9=
=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8812:38=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e..837bea3272 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -581,6 +581,7 @@ static void riscv_cpu_init(Object *obj)
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> +    /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
> @@ -591,22 +592,24 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> -    /* This is experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> +    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +
> +    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +
> +    /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
>      DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
>      DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
>      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> -    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> -    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>
> --
> 2.31.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--00000000000074752e05ce9cf2af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Alistair Francis &lt;<a href=3D"mailto:al=
istair.francis@opensource.wdc.com">alistair.francis@opensource.wdc.com</a>&=
gt; =E6=96=BC 2021=E5=B9=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=
=8B=E5=8D=8812:38=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alistair Fran=
cis &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alist=
air.francis@wdc.com</a>&gt;<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 17 ++++++++++-------<br>
=C2=A01 file changed, 10 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 1d69d1887e..837bea3272 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -581,6 +581,7 @@ static void riscv_cpu_init(Object *obj)<br>
=C2=A0}<br>
<br>
=C2=A0static Property riscv_cpu_properties[] =3D {<br>
+=C2=A0 =C2=A0 /* Defaults for standard extensions */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;i&quot;, RISCVCPU, cfg.ext_i, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;e&quot;, RISCVCPU, cfg.ext_e, fa=
lse),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;g&quot;, RISCVCPU, cfg.ext_g, tr=
ue),<br>
@@ -591,22 +592,24 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;c&quot;, RISCVCPU, cfg.ext_c, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;s&quot;, RISCVCPU, cfg.ext_s, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;u&quot;, RISCVCPU, cfg.ext_u, tr=
ue),<br>
-=C2=A0 =C2=A0 /* This is experimental so mark with &#39;x-&#39; */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, cfg.ext_cou=
nters, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ext_ife=
ncei, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_icsr, =
true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmu&quot;, RISCVCPU, cfg.mmu, true),<=
br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;pmp&quot;, RISCVCPU, cfg.pmp, true),<=
br>
+<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;priv_spec&quot;, RISCVCPU, cfg.priv=
_spec),<br>
+<br>
+=C2=A0 =C2=A0 /* These are experimental so mark with &#39;x-&#39; */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zba&quot;, RISCVCPU, cfg.ext_z=
ba, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zbb&quot;, RISCVCPU, cfg.ext_z=
bb, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zbc&quot;, RISCVCPU, cfg.ext_z=
bc, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-zbs&quot;, RISCVCPU, cfg.ext_z=
bs, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-h&quot;, RISCVCPU, cfg.ext_h, =
false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-v&quot;, RISCVCPU, cfg.ext_v, =
false),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, cfg.ext_cou=
nters, true),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ext_ife=
ncei, true),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_icsr, =
true),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;priv_spec&quot;, RISCVCPU, cfg.priv=
_spec),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;vext_spec&quot;, RISCVCPU, cfg=
.vext_spec),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT16(&quot;vlen&quot;, RISCVCPU, cfg.vlen=
, 128),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT16(&quot;elen&quot;, RISCVCPU, cfg.elen=
, 64),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmu&quot;, RISCVCPU, cfg.mmu, true),<=
br>
-=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;pmp&quot;, RISCVCPU, cfg.pmp, true),<=
br>
=C2=A0 =C2=A0 =C2=A0/* ePMP 0.9.3 */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-epmp&quot;, RISCVCPU, cfg.epmp=
, false),<br>
<br>
-- <br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--00000000000074752e05ce9cf2af--

