Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1848403B6B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:22:50 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyTR-0007NA-MF
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNySY-0006hM-7Z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNySS-0008SX-QH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631110906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqnWKhL37ynM342n1c8TERAH3K5dJPT9T+HXwsR5JeE=;
 b=Y9dt4D97VY+RwaVJLhXr1vuD08em3Y8mMu1212en+xpfcugtCdW3JOUZj0lbsTrzc71Iqy
 pGdO2AbH7PqINHVMOfi9nFM5Zcm87hy78i6Irc/LcUegNwOeSDUj7U/8VOyjfT6tfkefIk
 l7UZU5PmP6HTyV2NCO2uZB0JMfzRYp4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-0sLU6LkGNUCBQplB1Z0-hA-1; Wed, 08 Sep 2021 10:21:43 -0400
X-MC-Unique: 0sLU6LkGNUCBQplB1Z0-hA-1
Received: by mail-pg1-f198.google.com with SMTP id
 h10-20020a65404a000000b00253122e62a0so1795301pgp.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 07:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqnWKhL37ynM342n1c8TERAH3K5dJPT9T+HXwsR5JeE=;
 b=CGodDAZjVquYMxy0aGxYnumNFgVjE00Emhxr1kdMYr7OUtLn6kHQn7B/KygzAoOtah
 bKWbBviGbxiDPIUP68lWHA8+HmTLMUbboX+cicoUzuEfhtreHDTmchem/pmcBzKE4U1p
 Eb8bZfbebvSSKgudWyj8h/DC65YVToMjcX9eOQ6INt/J1Yr5FD2YhJqarKqPT3w9s6XC
 kKabThlKW+EYwNWF7fo3t/fY++1d+2L1SGRnbtoSeZm/C4t3hL6HfxRLyhhpKfwJUwzK
 KKSVJgRFtOeJwe9qEVG52LgWQVE1HSGlroEbr45IszW4u9AtgXHhHj75U26cY/5n+vpD
 bhYA==
X-Gm-Message-State: AOAM5318h9CUydt2BUl4KPEj70V/jBpufacyOtZgxcKcNnAX9xf1ys2c
 Fl5hp6nM8AutqUdHLdUVNYdeAl1HRs9UO8nVSqHHEWroN71Dt3D9mHr466ZMC/OrpOyW6UEO4Nu
 Uvs8Yc5rFIB7GC5mZRmnNWI1nvZioxFY=
X-Received: by 2002:aa7:9ae9:0:b0:3f5:e1a7:db23 with SMTP id
 y9-20020aa79ae9000000b003f5e1a7db23mr4075130pfp.42.1631110902804; 
 Wed, 08 Sep 2021 07:21:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+A9EA8WIPMpxwpSBJs2XDj/3LO4pyl5O2ZVD+5kPqz+QVtztWTL4nfvCvn1Zi21XJx/RzeKRrRJm74Z2ea0I=
X-Received: by 2002:aa7:9ae9:0:b0:3f5:e1a7:db23 with SMTP id
 y9-20020aa79ae9000000b003f5e1a7db23mr4075102pfp.42.1631110902492; Wed, 08 Sep
 2021 07:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-11-marcandre.lureau@redhat.com>
 <CAFEAcA8qFB_+N5pMWn2KpXzXQHY8KYfXdByZ29gJh-oMvE8f7A@mail.gmail.com>
In-Reply-To: <CAFEAcA8qFB_+N5pMWn2KpXzXQHY8KYfXdByZ29gJh-oMvE8f7A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Sep 2021 18:21:31 +0400
Message-ID: <CAMxuvaz5Y2CM+08mWjA_2uAVxWdH5XTXx0SeeAHuU1kaWqOmqw@mail.gmail.com>
Subject: Re: [RFC v3 10/32] build-sys: add --with-rust{-target} & basic build
 infrastructure
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eec65c05cb7c99e8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eec65c05cb7c99e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 6:01 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 7 Sept 2021 at 13:41, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Add the build-sys infrastructure to optionally build Rust code.
> > Introduce a top-level workspace, so various sub-projects (libraries,
> > executables etc) can be developed together, sharing the dependencies an=
d
> > output directory.
> >
> > If not Tier 1 (aarch64 and x86), all of the host architecture QEMU
> > supports should be Tier 2:
> > https://doc.rust-lang.org/nightly/rustc/platform-support.html
>
> I don't think this is quite true -- for instance the riscv
> TCG backend supports 32-bit, but the riscv 32 bit linux rust
> port is down in Tier 3. But the major stuff seems to be in Tier
> 1 or 2.
>

That's why the first patch would clarify the situation a bit :)


>
> > +if with_rust
> > +  rust_target_triple =3D get_option('with_rust_target')
> > +  if meson.is_cross_build()
> > +    # more default target mappings may be added over time
> > +    if rust_target_triple =3D=3D '' and targetos =3D=3D 'windows'
> > +      rust_target_triple =3D host_machine.cpu() + '-pc-windows-gnu'
> > +    endif
> > +    if rust_target_triple =3D=3D ''
> > +      error('cross-compiling, but no Rust target-triple defined.')
> > +    endif
> > +  endif
> > +endif
>
> Not a huge fan of this... I think we would be better to always
> require the user to specify the rust target triple explicitly.
>
>
In this case, no need to handle the i686 case. Fine with me, I was trying
to guess from the meson config and existing --cross-prefix to make things
simpler.


>
> > diff --git a/.gitignore b/.gitignore
> > index eb2553026c..78715bc7c4 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -1,5 +1,6 @@
> >  /GNUmakefile
> >  /build/
> > +/target/
>
> What's this for ?
>

Oops, that's wrong and unfortunate. It's the default target dir of Cargo.
But it's set to $builddir/rs-target in the scripts/cargo_wrapper.py.

It is convenient to run cargo commands manually, and dirty stuff end up in
target/.. I will configure .cargo/config.toml and try to prevent cargo
usage from top-level source directory.



> >  *.pyc
> >  .sdk
> >  .stgit-*
>
> thanks
> -- PMM
>
>

--000000000000eec65c05cb7c99e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 6:01 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 7 Sept 2021 at 13:41, &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Add the build-sys infrastructure to optionally build Rust code.<br>
&gt; Introduce a top-level workspace, so various sub-projects (libraries,<b=
r>
&gt; executables etc) can be developed together, sharing the dependencies a=
nd<br>
&gt; output directory.<br>
&gt;<br>
&gt; If not Tier 1 (aarch64 and x86), all of the host architecture QEMU<br>
&gt; supports should be Tier 2:<br>
&gt; <a href=3D"https://doc.rust-lang.org/nightly/rustc/platform-support.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://doc.rust-lang.org/nightly/=
rustc/platform-support.html</a><br>
<br>
I don&#39;t think this is quite true -- for instance the riscv<br>
TCG backend supports 32-bit, but the riscv 32 bit linux rust<br>
port is down in Tier 3. But the major stuff seems to be in Tier<br>
1 or 2.<br></blockquote><div><br></div><div>That&#39;s why the first patch =
would clarify the situation a bit :)</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +if with_rust<br>
&gt; +=C2=A0 rust_target_triple =3D get_option(&#39;with_rust_target&#39;)<=
br>
&gt; +=C2=A0 if meson.is_cross_build()<br>
&gt; +=C2=A0 =C2=A0 # more default target mappings may be added over time<b=
r>
&gt; +=C2=A0 =C2=A0 if rust_target_triple =3D=3D &#39;&#39; and targetos =
=3D=3D &#39;windows&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 rust_target_triple =3D host_machine.cpu() + &#39=
;-pc-windows-gnu&#39;<br>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt; +=C2=A0 =C2=A0 if rust_target_triple =3D=3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;cross-compiling, but no Rust target-t=
riple defined.&#39;)<br>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt; +=C2=A0 endif<br>
&gt; +endif<br>
<br>
Not a huge fan of this... I think we would be better to always<br>
require the user to specify the rust target triple explicitly.<br>
<br></blockquote><div><br></div><div>In this case, no need to handle the i6=
86 case. Fine with me, I was trying to guess from the meson config and exis=
ting --cross-prefix to make things simpler.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/.gitignore b/.gitignore<br>
&gt; index eb2553026c..78715bc7c4 100644<br>
&gt; --- a/.gitignore<br>
&gt; +++ b/.gitignore<br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 /GNUmakefile<br>
&gt;=C2=A0 /build/<br>
&gt; +/target/<br>
<br>
What&#39;s this for ?<br></blockquote><div><br></div><div>Oops, that&#39;s =
wrong and unfortunate. It&#39;s the default target dir of Cargo. But it&#39=
;s set to $builddir/rs-target in the scripts/cargo_wrapper.py.</div><div><b=
r></div><div>It is convenient to run cargo commands manually, and dirty stu=
ff end up in=C2=A0 target/.. I will configure .cargo/config.toml and try to=
 prevent cargo usage from top-level source directory.<br></div><div><br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 *.pyc<br>
&gt;=C2=A0 .sdk<br>
&gt;=C2=A0 .stgit-*<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div>

--000000000000eec65c05cb7c99e8--


