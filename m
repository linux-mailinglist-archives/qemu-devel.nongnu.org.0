Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB742E978
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:56:56 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbH9E-0007iy-3D
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH55-0003un-Ex
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:52:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH51-0005Pp-VL
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:52:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 21so5779853plo.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=te+KsrU6z1Ro5eOpP/ZudwrF98tMWqd2KAqL6HhzukQ=;
 b=fafAmoqnSffDFiwm6nrNOfU/C7Y4AkgKx5mCXh02F9JL2Jth0TZrEVpfToykneRgZV
 zoujnz6BudrcEsk7S/2cO70Rjd1V3kZl4gj5FgeOU9mgyrfopIkh5sMmP2mDDWJVOo/3
 4naaMj4khiD7uFZCPEOtCMTvB6EyKYUhlBLtW/SIvEPHwTOxFZFEtnHyzeC2RZ9BpO0y
 Mmog4C+cvnUTQ3skpjwH+XaAyHikEcvpdPndBs72ghKr/gI38iHievyX70vkcFOWipIM
 L+cG885vofmD+JgUMPAKWCf/2/WjNArZP8vdMLaLyw2G7wFyxKKqpC7T26mal03+9HfT
 129g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=te+KsrU6z1Ro5eOpP/ZudwrF98tMWqd2KAqL6HhzukQ=;
 b=x2yyTWmjR5ghE9KYGgDPjKqI7drDxPWLEfyCEw/H04IUqx5JA3TRIyGlALmag9Y7lh
 iZioU60M4yDkU7tJvSsuyilqJ/31dSjDs1E1XYlQjs8GuJZWnw6h8NAjNUqVEraHO900
 J/fJcZPFVfgHYzYabNY6PMmlhwpCAkseSkmdK78HEad1Yb/W/ow86UuIxIOhjHF/x2lr
 /w1WgclIg/7TufdifExXgfW556yQVK3+Vp4FHubXxPXzc628IuCwtW9FYU8nSKZNQuMX
 3RXv+T4tmEJsb2oaumJBzCiViqRyKOiHnfnoO9dow3b6eWSZy7ZFMolyV/Nn8RN3AJC9
 /9yg==
X-Gm-Message-State: AOAM5331HSQtERPZXjGCnvTLoIQefFsRiiV+N6wPv465xxmT3dVM0ZAl
 qkiJsKUir5nZDLetgZy1U3hPdUINtq7bGg==
X-Google-Smtp-Source: ABdhPJxIM+l27DcOaZT34L9Y5L4rRvStVlc2oECoWCYFVm42AtZcvEDNPVhS/RKrzOw9vwuxAmdCvA==
X-Received: by 2002:a17:90b:368a:: with SMTP id
 mj10mr11876272pjb.201.1634280753793; 
 Thu, 14 Oct 2021 23:52:33 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com.
 [209.85.210.173])
 by smtp.gmail.com with ESMTPSA id c13sm4226676pfj.78.2021.10.14.23.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 23:52:33 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id t184so6725870pfd.0;
 Thu, 14 Oct 2021 23:52:33 -0700 (PDT)
X-Received: by 2002:aa7:8b49:0:b0:44d:65a9:fb9d with SMTP id
 i9-20020aa78b49000000b0044d65a9fb9dmr9993761pfd.24.1634280752812; Thu, 14 Oct
 2021 23:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211015061138.3766862-1-frank.chang@sifive.com>
 <20211015061138.3766862-2-frank.chang@sifive.com>
In-Reply-To: <20211015061138.3766862-2-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 15 Oct 2021 14:52:21 +0800
X-Gmail-Original-Message-ID: <CANzO1D35TYsUDS5Wp8AM4uoKW--t0c8+z=qRJN19ZnfKaezhKQ@mail.gmail.com>
Message-ID: <CANzO1D35TYsUDS5Wp8AM4uoKW--t0c8+z=qRJN19ZnfKaezhKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Frank Chang <frank.chang@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000bc173405ce5ea315"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc173405ce5ea315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8815=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:12=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> The sNaN propagation behavior has been changed since
> cd20cee7 in https://github.com/riscv/riscv-isa-manual
>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> ---
>  target/riscv/fpu_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 8700516a14c..1472ead2528 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t
> rs1, uint64_t rs2)
>  {
>      float32 frs1 =3D check_nanbox_s(rs1);
>      float32 frs2 =3D check_nanbox_s(rs2);
> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 =3D check_nanbox_s(rs1);
>      float32 frs2 =3D check_nanbox_s(rs2);
> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(float32_maxnum_noprop(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> @@ -283,12 +283,12 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t
> frs1, uint64_t frs2)
>
>  uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_minnum(frs1, frs2, &env->fp_status);
> +    return float64_minnum_noprop(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_maxnum(frs1, frs2, &env->fp_status);
> +    return float64_maxnum_noprop(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> --
> 2.25.1
>
>
>
I should add the cover letter for this series of patchset, will resend it.
Sorry for the confusion.

Regards,
Frank Chang

--000000000000bc173405ce5ea315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B410=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:12=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.c=
om" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
<br>
The sNaN propagation behavior has been changed since<br>
cd20cee7 in <a href=3D"https://github.com/riscv/riscv-isa-manual" rel=3D"no=
referrer" target=3D"_blank">https://github.com/riscv/riscv-isa-manual</a><b=
r>
<br>
Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com"=
 target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/fpu_helper.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
index 8700516a14c..1472ead2528 100644<br>
--- a/target/riscv/fpu_helper.c<br>
+++ b/target/riscv/fpu_helper.c<br>
@@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t r=
s1, uint64_t rs2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(float32_minnum_noprop(frs1, frs2, &amp;env-&=
gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_maxnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(float32_maxnum_noprop(frs1, frs2, &amp;env-&=
gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)<br>
@@ -283,12 +283,12 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t f=
rs1, uint64_t frs2)<br>
<br>
=C2=A0uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_minnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return float64_minnum_noprop(frs1, frs2, &amp;env-&gt;fp_sta=
tus);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_maxnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return float64_maxnum_noprop(frs1, frs2, &amp;env-&gt;fp_sta=
tus);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>I should add the cover letter for this=
 series of patchset, will resend it.</div><div>Sorry for the confusion.</di=
v><div><br></div><div>Regards,</div><div>Frank Chang=C2=A0</div></div></div=
>

--000000000000bc173405ce5ea315--

