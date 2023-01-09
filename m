Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C04B662491
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqdA-0001Ds-1V; Mon, 09 Jan 2023 06:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pEqd1-0001Cc-2r
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pEqcw-0004Dz-Fw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673264861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H5kpYdG7v3oUc5+pTCU+b3zSzgeBwsSMKnGnE2c/6lE=;
 b=V68PVpUaN673ttgJqHz90XlYM2OdwYvTSWprP0Se0Q0GBoT/g+RvLeisyh3YeCQxlWX1j7
 mcTf0mEIb0I8ITdFtEmHZguPaiJYWRgICbo1TvXxs3II5wc1q5+rTItemrnRbidLjq5PCV
 y/ZnWBsymYTLYYEN+wpUBb05zy5ZHGE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-wnVFJkUNOva-LvwMusLRLQ-1; Mon, 09 Jan 2023 06:47:39 -0500
X-MC-Unique: wnVFJkUNOva-LvwMusLRLQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso5270442ejb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5kpYdG7v3oUc5+pTCU+b3zSzgeBwsSMKnGnE2c/6lE=;
 b=AFMGu/4cIQQldmeUKUN+JVfE9UyyM2BWjco959lH7ght5zRArWMp75ACB2JWuRp8zf
 Y6I56FHR+FBRZwqvEDqEECdO/Q5/tiGcb5nDq0f9H1hRirDKMrU2ltqvA2Zs5DoBI0s2
 QxcoGhmknYW87sYgyaVPHUppTi7/OG4f7UN6T0wbGSSzweZtIAPIdAkZW+fA2o/TwCC2
 Nu8+q6bRzRlLUCYGXU8/iVtMIJDqpYgddo+i2f8ZXEo7GWrOTgOIy4ciVNYlZSd9eGzk
 /wb3+nj8oZccESM6QuyyCWUsvZ5g2+u1Y2DQjlnKX1Z0gjEYdLdFZopGpdgUZ6VJ1tzG
 jhNw==
X-Gm-Message-State: AFqh2kpzOMeqGucEs9oFErBq4EYSro51QKKlzHhCBcP+vop2MKeXYvt8
 LtJnK1BbRhU4YAndYa2c57tnyQkxLcjYhVxU6Qr0cAHEMWkFTkG0PhPRzCiMw9rukkzlhArZEwn
 y8bRFoL/caMaaxE/H8SnYJft8Qob5jW4=
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id
 y21-20020a170906525500b007c16b1fe131mr4001092ejm.557.1673264858321; 
 Mon, 09 Jan 2023 03:47:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaS9uPOoOi7tAmRPJentoqtB+50R0so+dyupFKGoA6IrYidYcA9XGE1FI+uGckNvwDoWci3nROyLsKsvlzAIU=
X-Received: by 2002:a17:906:5255:b0:7c1:6b1f:e131 with SMTP id
 y21-20020a170906525500b007c16b1fe131mr4001075ejm.557.1673264858079; Mon, 09
 Jan 2023 03:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-2-marcandre.lureau@redhat.com>
 <0b04303a-20a6-d4fe-d9bc-0940e475d24b@redhat.com>
In-Reply-To: <0b04303a-20a6-d4fe-d9bc-0940e475d24b@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 9 Jan 2023 15:47:26 +0400
Message-ID: <CAMxuvazQMf==JGTMMSEMZP30DNTTpZ3bVYB8EiKf1mSaJaM_vA@mail.gmail.com>
Subject: Re: [PATCH 1/2] build-sys: fix crlf-ending C code
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, pbonzini@redhat.com, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007b347a05f1d355f1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000007b347a05f1d355f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jan 9, 2023 at 3:41 PM Thomas Huth <thuth@redhat.com> wrote:

> On 09/01/2023 12.21, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > On msys2, the shader-to-C script produces bad C:
> > ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating "
> character [-Werror]
> >
> > Fix it by changing the line ending from crlf to lf, and convert the
> > script to Python (qemu build seems perl-free after that).
>
> If the build process does not depend on Perl anymore, would it make sense
> to
> also add a patch that removes perl from most of the containers (the ones
> that don't use check_patch.pl etc.)? ... that way we would make sure that
> the dependency does not creep in again later...
>

Let's try that. A quick check reveals that configure already still has perl
usage. I will take a look.


>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   meson.build              |  2 +-
> >   scripts/shaderinclude.pl | 16 ----------------
> >   scripts/shaderinclude.py | 22 ++++++++++++++++++++++
> >   3 files changed, 23 insertions(+), 17 deletions(-)
> >   delete mode 100644 scripts/shaderinclude.pl
> >   create mode 100755 scripts/shaderinclude.py
>
> Acked-by: Thomas Huth <thuth@redhat.com>
>
>

--0000000000007b347a05f1d355f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 9, 2023 at 3:41 PM Thom=
as Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 09/01/20=
23 12.21, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">=
marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; On msys2, the shader-to-C script produces bad C:<br>
&gt; ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating &quot;=
 character [-Werror]<br>
&gt; <br>
&gt; Fix it by changing the line ending from crlf to lf, and convert the<br=
>
&gt; script to Python (qemu build seems perl-free after that).<br>
<br>
If the build process does not depend on Perl anymore, would it make sense t=
o <br>
also add a patch that removes perl from most of the containers (the ones <b=
r>
that don&#39;t use <a href=3D"http://check_patch.pl" rel=3D"noreferrer" tar=
get=3D"_blank">check_patch.pl</a> etc.)? ... that way we would make sure th=
at <br>
the dependency does not creep in again later...<br></blockquote><div><br></=
div><div>Let&#39;s try that. A quick check reveals that configure already s=
till has perl usage. I will take a look.</div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0scripts/<a href=3D"http://shaderinclude.pl" rel=3D"norefer=
rer" target=3D"_blank">shaderinclude.pl</a> | 16 ----------------<br>
&gt;=C2=A0 =C2=A0scripts/shaderinclude.py | 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 23 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 scripts/<a href=3D"http://shaderinclude=
.pl" rel=3D"noreferrer" target=3D"_blank">shaderinclude.pl</a><br>
&gt;=C2=A0 =C2=A0create mode 100755 scripts/shaderinclude.py<br>
<br>
Acked-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_bl=
ank">thuth@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--0000000000007b347a05f1d355f1--


