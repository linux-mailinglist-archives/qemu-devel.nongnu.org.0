Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB843B529F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 11:01:22 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxQfJ-0006ny-Im
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 05:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQdL-0005hk-W0
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 04:59:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQdJ-00049R-M2
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 04:59:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso8321776pjb.4
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZsL6eFScraF4sHUVIf8hDsFwYFEq0V5cBzq+gtn7FE=;
 b=HB/WD/t74PMzod4HiL/m/w7tdNcxyU6oLrvpZBkgtOSv7P6AnB/SG2BIzecbjRWwOj
 4ty9mditdvs6J7ZcZv9eAb6Pb3VHr1oBHXwBr4wzOCuY5eXWo4zFk70xGrNfTEzIHYre
 sT5QocRLn4XkLha+zWvw8DDF4P/qRCI32rWK1dC73js43HwTTq75QuwHQwIfduWceZ5I
 XN8ohi36lrH6uJQ/grRCoAbGLPg2CqxYn56lwncKkKX7wMdYtikdz5bMccvbwYl5SrLo
 Xa4T/BGnhh4QbY2dzgsGGQKRQvxheH9ldkd1nTeUXC4/n7nXSNH8q9a2ZJsTLxdZRmms
 oMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZsL6eFScraF4sHUVIf8hDsFwYFEq0V5cBzq+gtn7FE=;
 b=bMMMJJwJ9ifX7+dwmjTy0QtwWOaUjvmyijlPkWD1ULAlABUahMiAJXTZRp6W35PFQo
 5TysYRTUqBgaSi4WU3oedsRgaW5lgKFxDTvjSJrHicjug7Ch4zVVoHsC/zL1wckvcejc
 WCZvdP31ctm1+XonWNIhkonjrU5tQGT8bWOcEniBzyckpQ6Z4JaWkzqz5yTNCXcgAeBL
 KkLjXJa1ifeKuabRAIYMU+NsE3bgqVduwz/ECLHgKkxZjh3NVbjp6+DRcBsZbPM2kTZJ
 3s+yvEPV78M4QYJPCF32zkmEqtcJEWLtpbqLCKjE//UVoq6jhq8fIJuztKMV3G85VqBQ
 //9g==
X-Gm-Message-State: AOAM530MjDgOyfVx3HZ5+ZEinv9M3jSCR0kNXTHaYIsud2S1AItB2wir
 /6GcsVjOc+177PmSj0prUWiyZ84fymDCw9PM
X-Google-Smtp-Source: ABdhPJyobgdowZJ3mqY+MqlGoyjFgvoZXSyXprxMXWZbkbRfAsbEEQfBiA8v+dKQFQhVfBGzH/HMAg==
X-Received: by 2002:a17:90a:6d89:: with SMTP id
 a9mr31066927pjk.194.1624784356078; 
 Sun, 27 Jun 2021 01:59:16 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id y7sm16456893pja.8.2021.06.27.01.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 01:59:15 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so10792474pjb.0; 
 Sun, 27 Jun 2021 01:59:15 -0700 (PDT)
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr17146415pll.21.1624784355258; Sun, 27
 Jun 2021 01:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-7-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-7-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 16:59:04 +0800
X-Gmail-Original-Message-ID: <CANzO1D3oafewu_dN1cAPH0B61hNiTjfO=EfvT9u0q605qQaQ5Q@mail.gmail.com>
Message-ID: <CANzO1D3oafewu_dN1cAPH0B61hNiTjfO=EfvT9u0q605qQaQ5Q@mail.gmail.com>
Subject: Re: [RFC PATCH 06/11] target/riscv: Update CSR xtvec in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000054f69b05c5bb9637"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000054f69b05c5bb9637
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=EF=BC=9A

> The new CLIC interrupt-handling mode is encoded as a new state in the
> existing WARL xtvec register, where the low two bits of are 11.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f6c84b9fe4..39ff72041a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -637,9 +637,18 @@ static int read_mtvec(CPURISCVState *env, int csrno,
> target_ulong *val)
>
>  static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D rese=
rved */
> +    /*
> +     * bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 3 =3D CLIC,
> +     * others reserved
> +     */
>      if ((val & 3) < 2) {
>          env->mtvec =3D val;
> +    } else if ((val & 1) && env->clic) {
> +        /*
> +         * If only CLIC mode is supported, writes to bit 1 are also
> ignored and
> +         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 t=
o
> zero.
> +         */
> +        env->mtvec =3D ((val & ~0x3f) << 6) | (0b000011);
>

Why do we need to left-shift the value 6 bits here?


>      } else {
>          qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not
> supported\n");
>      }
> @@ -837,9 +846,18 @@ static int read_stvec(CPURISCVState *env, int csrno,
> target_ulong *val)
>
>  static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D rese=
rved */
> +    /*
> +     * bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 3 =3D CLIC,
> +     * others reserved
> +     */
>      if ((val & 3) < 2) {
>          env->stvec =3D val;
> +    } else if ((val & 1) && env->clic) {
> +        /*
> +         * If only CLIC mode is supported, writes to bit 1 are also
> ignored and
> +         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 t=
o
> zero.
> +         */
> +        env->stvec =3D ((val & ~0x3f) << 6) | (0b000011);
>

Same here, why do we need to left-shift the value 6 bits here?

Also, CLIC v0.8 spec[1] doesn't include the change for stvec.
I'm not sure if it's the same as v0.9 to check stvec
when the interrupt is delegated to S-mode in CLIC-mode.

[1] https://github.com/riscv/riscv-fast-interrupt/blob/74f86c3858/clic.adoc

Regards,
Frank Chang

     } else {
>          qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not
> supported\n");
>      }
> --
> 2.25.1
>
>
>

--00000000000054f69b05c5bb9637
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The new CLIC interrupt-handling mode is encoded as a n=
ew state in the<br>
existing WARL xtvec register, where the low two bits of are 11.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 22 ++++++++++++++++++++--<br>
=C2=A01 file changed, 20 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index f6c84b9fe4..39ff72041a 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -637,9 +637,18 @@ static int read_mtvec(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
<br>
=C2=A0static int write_mtvec(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 &=
gt;=3D reserved */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored=
, 3 =3D CLIC,<br>
+=C2=A0 =C2=A0 =C2=A0* others reserved<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if ((val &amp; 3) &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mtvec =3D val;<br>
+=C2=A0 =C2=A0 } else if ((val &amp; 1) &amp;&amp; env-&gt;clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If only CLIC mode is supported, writes=
 to bit 1 are also ignored and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it is always set to one. CLIC mode har=
dwires xtvec bits 2-5 to zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mtvec =3D ((val &amp; ~0x3f) &lt;&lt; =
6) | (0b000011);<br></blockquote><div><br></div><div>Why do we need to left=
-shift the value 6 bits here?</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;CSR_MTVEC:=
 reserved mode not supported\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -837,9 +846,18 @@ static int read_stvec(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
<br>
=C2=A0static int write_stvec(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 &=
gt;=3D reserved */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored=
, 3 =3D CLIC,<br>
+=C2=A0 =C2=A0 =C2=A0* others reserved<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if ((val &amp; 3) &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stvec =3D val;<br>
+=C2=A0 =C2=A0 } else if ((val &amp; 1) &amp;&amp; env-&gt;clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If only CLIC mode is supported, writes=
 to bit 1 are also ignored and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it is always set to one. CLIC mode har=
dwires xtvec bits 2-5 to zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;stvec =3D ((val &amp; ~0x3f) &lt;&lt; =
6) | (0b000011);<br></blockquote><div><br></div><div>Same here, why do we n=
eed to left-shift the value 6 bits here?=C2=A0</div><div><br></div><div>Als=
o, CLIC v0.8 spec[1] doesn&#39;t include the change for stvec.</div><div>I&=
#39;m not sure if it&#39;s the same as v0.9 to check stvec</div><div>when t=
he interrupt is delegated to S-mode in CLIC-mode.</div><div><br></div><div>=
[1]=C2=A0<a href=3D"https://github.com/riscv/riscv-fast-interrupt/blob/74f8=
6c3858/clic.adoc">https://github.com/riscv/riscv-fast-interrupt/blob/74f86c=
3858/clic.adoc</a></div><div><br></div><div>Regards,</div><div>Frank Chang<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;CSR_STVEC:=
 reserved mode not supported\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000054f69b05c5bb9637--

