Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951843DCE9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:25:06 +0200 (CEST)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0if-0001w8-8Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mg0gE-0008TC-Hr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:22:35 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mg0gC-0006eK-2S
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:22:33 -0400
Received: by mail-il1-x129.google.com with SMTP id j10so5937069ilu.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 01:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WLdM16XNjaYWzffnmp+W+0Wszz4KeUw8cmKVa1pQncs=;
 b=R+HXuaCOtOXPBURsMMqNVUeHV6oEZq08mJ0ccYdBCgUDI9sFY1wOFMx5Lj62GhMHnM
 Ir8hVFVXLO/ba9ipXKOYXIrxvf9WTWknaxPX7kw6IeYpynOsWPxx872hYN+n9Q2JK+Yr
 8UjWnaVeaaiKezuOEHhhG/aA+bSlg+6x7xnboYXx65yieowK4xmNCB8JhLbelwH2FrPd
 pmJ9s6UuiSFX3sENGVUXkzL0/bFruAPXO+UZeVa5Ps2242Mi5xvc/yr3kr2jrnXqtuGj
 v1y25X0cdO5uU6XprySdmYqjxG0QBP8ercDCXSHQMyQtYIfPJDOn50lDa8GpoFZAHnv7
 re7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLdM16XNjaYWzffnmp+W+0Wszz4KeUw8cmKVa1pQncs=;
 b=0Q1QUK9Rv5LYnCHdJPNm1VLWWXyfMbPTb2TrCQwJKHENVwkC9spd+B3QROxIlvJWnm
 K+nloNZqCpbtz7BqVnECLRhCFEJwSqSNqPxLb3mMJ8YyQYo02a3PFjppDpSvTfETOGts
 1DxEr5EKGwYwKwMcbhYInCw3If73cB73hcbhjdhQj/KbktLXSvFCi9onEWGt4CHfr4Ju
 cVaX+Rm/ZMbvVivEVdtlgiyZmQo2L4RUZrFxVeckFf1kuAv7afAXgb7XEhUrOd5F9jcu
 71fQfroLKyx9kbAgoAZCiRuvgeeGLwmraFepqAidE4It927Q7D3tb3+ncwaWy/3fMCZu
 /gfA==
X-Gm-Message-State: AOAM5326PPRIMfuG9F8zPh1USVbqbRoQ/DrLt+RdwVQ3c5JL5gBI2P7q
 anm9Xen/sw8sZ/ceNfTVjj/gQOlk6v15h0s7jP9gJQ==
X-Google-Smtp-Source: ABdhPJwJrBsSd0SP2oNy/Fa385Fep1fHgLzAATJbK/YZyPw+XpLPxgftsR2/EFI0+OwiGWDSR/1bBKiTwxIuMPNxx84=
X-Received: by 2002:a05:6e02:b2a:: with SMTP id
 e10mr2099434ilu.53.1635409348466; 
 Thu, 28 Oct 2021 01:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
 <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 28 Oct 2021 16:22:17 +0800
Message-ID: <CAE_xrPgiy+OrehPrzt0OZq97jkxGgnBSkEQWbKhROU+v65ac2A@mail.gmail.com>
Subject: Re: [PULL 16/18] target/riscv: change the api for RVF/RVD fmin/fmax
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: multipart/alternative; boundary="00000000000047329705cf656978"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x129.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000047329705cf656978
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 12:45 PM Alistair Francis <
alistair.francis@opensource.wdc.com> wrote:

> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> The sNaN propagation behavior has been changed since
> cd20cee7 in https://github.com/riscv/riscv-isa-manual.
>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Message-id: 20211016085428.3001501-3-frank.chang@sifive.com
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/fpu_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 8700516a14..d62f470900 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t
> rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_minnum(frs1, frs2, &env->fp_status) :
> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t
> frs1, uint64_t frs2)
>
>  uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_minnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_minnum(frs1, frs2, &env->fp_status) :
> +            float64_minimum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_maxnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_maxnum(frs1, frs2, &env->fp_status) :
> +            float64_maximum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> --
> 2.31.1
>
>
Hi Alistair,

Did you pull the latest v5 patchset?
https://lists.nongnu.org/archive/html/qemu-riscv/2021-10/msg00557.html

I added more texts in the commit message to describe why we tie RVF version
with Priv version.
I think it's still okay to pull this one as I don't think there's any
functional changes, IIRC.

Regards,
Frank Chang

--00000000000047329705cf656978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 28, 2021 at 12:45 PM Alistair=
 Francis &lt;<a href=3D"mailto:alistair.francis@opensource.wdc.com">alistai=
r.francis@opensource.wdc.com</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Chih-Min Chao =
&lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.ch=
ao@sifive.com</a>&gt;<br>
<br>
The sNaN propagation behavior has been changed since<br>
cd20cee7 in <a href=3D"https://github.com/riscv/riscv-isa-manual" rel=3D"no=
referrer" target=3D"_blank">https://github.com/riscv/riscv-isa-manual</a>.<=
br>
<br>
Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com"=
 target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" =
target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Message-id: <a href=3D"mailto:20211016085428.3001501-3-frank.chang@sifive.c=
om" target=3D"_blank">20211016085428.3001501-3-frank.chang@sifive.com</a><b=
r>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/fpu_helper.c | 16 ++++++++++++----<br>
=C2=A01 file changed, 12 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
index 8700516a14..d62f470900 100644<br>
--- a/target/riscv/fpu_helper.c<br>
+++ b/target/riscv/fpu_helper.c<br>
@@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t r=
s1, uint64_t rs2)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_minnum(frs1, frs2, &amp;env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_minimum_number(frs1, frs2, &amp;env-&gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
-=C2=A0 =C2=A0 return nanbox_s(float32_maxnum(frs1, frs2, &amp;env-&gt;fp_s=
tatus));<br>
+=C2=A0 =C2=A0 return nanbox_s(env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_maxnum(frs1, frs2, &amp;env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 floa=
t32_maximum_number(frs1, frs2, &amp;env-&gt;fp_status));<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)<br>
@@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t f=
rs1, uint64_t frs2)<br>
<br>
=C2=A0uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_minnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_minnum(frs1, frs2, &amp;=
env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_minimum_number(frs1, frs=
2, &amp;env-&gt;fp_status);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float64_maxnum(frs1, frs2, &amp;env-&gt;fp_status);<b=
r>
+=C2=A0 =C2=A0 return env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_maxnum(frs1, frs2, &amp;=
env-&gt;fp_status) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64_maximum_number(frs1, frs=
2, &amp;env-&gt;fp_status);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Hi Alistair,</div><div><br></div><div>=
Did you pull the latest v5 patchset?<br><a href=3D"https://lists.nongnu.org=
/archive/html/qemu-riscv/2021-10/msg00557.html">https://lists.nongnu.org/ar=
chive/html/qemu-riscv/2021-10/msg00557.html</a>=C2=A0</div><div><br></div><=
div>I added more texts in the commit message to describe why we tie RVF ver=
sion with Priv version.</div><div>I think it&#39;s still okay to pull this =
one as I don&#39;t think there&#39;s any functional changes, IIRC.</div><di=
v><br></div><div>Regards,</div><div>Frank Chang</div></div></div>

--00000000000047329705cf656978--

