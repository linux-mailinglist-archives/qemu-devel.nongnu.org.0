Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C65A3066
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:21:17 +0200 (CEST)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfpL-0000qL-Vz
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRfkT-0005n6-4Z
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRfkM-0005cR-RA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJ2MA+wmcTmx/Z7tBDr3RdJapWtRsjmxSiIHbHVcPp4=;
 b=hu4lu7RtcW2/z/+Ystpu45aOVp9Oe0gfsK01Mso1BpWPL27/vyw/aGmtLOfeqrK3Deo8LX
 sq6cO3Np0fO6/tWDWEgXtieSqv0rLXifPHTaPKwXRwVfZqr475SqK2T4um2qK9oWYiUJ55
 zo4tZlHa+7MNeFCytCjVFu6MveOq4X0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-lRhBvdpbMfGWl00vAbEn6A-1; Fri, 26 Aug 2022 16:16:04 -0400
X-MC-Unique: lRhBvdpbMfGWl00vAbEn6A-1
Received: by mail-lj1-f199.google.com with SMTP id
 k21-20020a2e2415000000b00261e34257b2so958795ljk.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FJ2MA+wmcTmx/Z7tBDr3RdJapWtRsjmxSiIHbHVcPp4=;
 b=4IL3BrJexI36Bhjd2jao7S7otLSCoegSP2iKo7S04bWqGHAdTWfS0Q8sC8n53Nj24Y
 QpTPC/ZTbKidZQDLkBXaBQw0JQukJa52jaHokKkshevomJyJ2a3xvnmaCWgeWIak5WL1
 td0whI/f+yVcyHekxDgfL0nYH6JXZ8pAAnN0IlCO/k3z9XbbVXRyadaKn+EMYgKnsJmv
 aDNB9X99nBoDA3G0yCKO9W1Lx9ThAm1HvUQh0g6UUjYtTE+X9AiTvlI+VDcTsIJUDf3Q
 gqjVaB690tkVgiO67Pkkq6dbDrMnQMe0M+69DfqJjiF8X0jptYuhmbMQM0SNZlaOUASk
 MpHg==
X-Gm-Message-State: ACgBeo1l1H/v9Jh5BECsc+F0Fxm9Vib9UWKqt2lE7GGQ+vxZLMSOtyrn
 JZ6O+luIMScRW88jc2xatbtzO7mzbuEut+XtR1kMHgMrSaP0DVDkb7jl2gEO1JED9E+Kg2msd7v
 LoBzAq/89goZ2C4IzFs7uFvnE2Ip2glc=
X-Received: by 2002:a2e:888e:0:b0:261:e10f:37fe with SMTP id
 k14-20020a2e888e000000b00261e10f37femr2679738lji.262.1661544963175; 
 Fri, 26 Aug 2022 13:16:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GC4jHInmfXPpNi6gdspS3z/wJM052OTUgdDl1RfeWqBt/BVIGQd0ffA5khdijvt0vsKssqqQGTHoXiwfaPTg=
X-Received: by 2002:a2e:888e:0:b0:261:e10f:37fe with SMTP id
 k14-20020a2e888e000000b00261e10f37femr2679737lji.262.1661544962912; Fri, 26
 Aug 2022 13:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-2-pbonzini@redhat.com>
 <9973a638-35f6-85b3-0511-021a3fb051c3@linaro.org>
In-Reply-To: <9973a638-35f6-85b3-0511-021a3fb051c3@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Aug 2022 22:15:51 +0200
Message-ID: <CABgObfZgSrOmP3Ma6NEZnHdaX+r2Hzajoa9MRThx7odL9ZS9fw@mail.gmail.com>
Subject: Re: [PATCH 01/18] i386: Rework sse_op_table1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@nowt.org>
Content-Type: multipart/alternative; boundary="0000000000004b133105e72a950d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000004b133105e72a950d
Content-Type: text/plain; charset="UTF-8"

Il ven 26 ago 2022, 01:39 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 8/25/22 15:13, Paolo Bonzini wrote:
> > @@ -3112,6 +3165,7 @@ static void gen_sse(CPUX86State *env, DisasContext
> *s, int b,
> >   {
> >       int b1, op1_offset, op2_offset, is_xmm, val;
> >       int modrm, mod, rm, reg;
> > +    struct SSEOpHelper_table1 sse_op;
> >       SSEFunc_0_epp sse_fn_epp;
> >       SSEFunc_0_eppi sse_fn_eppi;
> >       SSEFunc_0_ppi sse_fn_ppi;
> > @@ -3127,8 +3181,10 @@ static void gen_sse(CPUX86State *env,
> DisasContext *s, int b,
> >           b1 = 3;
> >       else
> >           b1 = 0;
> > -    sse_fn_epp = sse_op_table1[b][b1];
> > -    if (!sse_fn_epp) {
> > +    sse_op = sse_op_table1[b];
> > +    sse_fn_epp = sse_op.op[b1];
> > +    if ((sse_op.flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
> > +            && !sse_fn_epp) {
>
> Do we really want a 5 word structure copy into the local stack frame here?
> Surely better as
>
>      const struct SSEOpHelper_table1 *sse_op;
>      ...
>      sse_op = &sse_op_table1[b];


I'll split it to two variables, one for the flags and one for fn[b1]. Op6
and op7 will just be pointers instead. Rebasing the AVX patches (I want to
keep them up to date even if I end up replacing the decoder) was easier
than I thought.

Paolo


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>

--0000000000004b133105e72a950d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 26 ago 2022, 01:39 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 8/25/22 15:13, P=
aolo Bonzini wrote:<br>
&gt; @@ -3112,6 +3165,7 @@ static void gen_sse(CPUX86State *env, DisasConte=
xt *s, int b,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int b1, op1_offset, op2_offset, is_xmm, val;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int modrm, mod, rm, reg;<br>
&gt; +=C2=A0 =C2=A0 struct SSEOpHelper_table1 sse_op;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SSEFunc_0_epp sse_fn_epp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SSEFunc_0_eppi sse_fn_eppi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SSEFunc_0_ppi sse_fn_ppi;<br>
&gt; @@ -3127,8 +3181,10 @@ static void gen_sse(CPUX86State *env, DisasCont=
ext *s, int b,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b1 =3D 3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b1 =3D 0;<br>
&gt; -=C2=A0 =C2=A0 sse_fn_epp =3D sse_op_table1[b][b1];<br>
&gt; -=C2=A0 =C2=A0 if (!sse_fn_epp) {<br>
&gt; +=C2=A0 =C2=A0 sse_op =3D sse_op_table1[b];<br>
&gt; +=C2=A0 =C2=A0 sse_fn_epp =3D sse_op.op[b1];<br>
&gt; +=C2=A0 =C2=A0 if ((sse_op.flags &amp; (SSE_OPF_SPECIAL | SSE_OPF_3DNO=
W)) =3D=3D 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !sse_fn_epp) {<b=
r>
<br>
Do we really want a 5 word structure copy into the local stack frame here?<=
br>
Surely better as<br>
<br>
=C2=A0 =C2=A0 =C2=A0const struct SSEOpHelper_table1 *sse_op;<br>
=C2=A0 =C2=A0 =C2=A0...<br>
=C2=A0 =C2=A0 =C2=A0sse_op =3D &amp;sse_op_table1[b];</blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll split it to two v=
ariables, one for the flags and one for fn[b1]. Op6 and op7 will just be po=
inters instead. Rebasing the AVX patches (I want to keep them up to date ev=
en if I end up replacing the decoder) was easier than I thought.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--0000000000004b133105e72a950d--


