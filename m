Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91499408A4E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:33:57 +0200 (CEST)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkDk-0003T2-6a
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPkCW-0002WQ-TH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPkCS-0004BQ-RF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631532753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gK1VqUjpK+KnEpOu7cDZlXNWVvCJEgCwkcGLhGkezU=;
 b=dpfs+ZKKUqFYm5LxS27gk9pzGGYlt1CClZVB/GihFGTUE4RPJXiPQOlNtnOgzBBRA/WR5y
 5VaJphioAUsMyJGzYijfcXh4jBnC66WbnDr86Uvp9O/8XC2C2OxCqivHggdyIidHqUQk7b
 68uYICCA96drg0B4EBThcCPbmQiBmdU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-rvacRNrVNWCSCLMccj4i_Q-1; Mon, 13 Sep 2021 07:32:30 -0400
X-MC-Unique: rvacRNrVNWCSCLMccj4i_Q-1
Received: by mail-pl1-f198.google.com with SMTP id
 z10-20020a170903018a00b00134def0a883so3122232plg.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gK1VqUjpK+KnEpOu7cDZlXNWVvCJEgCwkcGLhGkezU=;
 b=O5P16EQs0V8dwpNALwr/1dbj9h4zsKhuz1YkSVKruERipiFbV86vlPE2x6KuEsbLgi
 s+Feldt3mR12b92Zi2uq//fH676xbrCKCamMgQOTgJu+CgJGeCbsPbbbRi6nFtH2MWgr
 yAH5KHrAifyzWwnoMbgu7YP6g3M56Phe6+E4Z9O6+b7faQqYrvGrRFNRPcaXfNFWIgEp
 jh6ThvVCAn+zN/q4oVM6UmssyunR+kk2dLqFJgGm03CY8enoYU7yMN2sRIegvKy3NxSK
 Uka8Ujb0VWCEIJAV5Nd+pOCeCOZT/WQ9iv6IIWF9N3dbGZr0dbF1BOyMNchgkgzubuJy
 aUCw==
X-Gm-Message-State: AOAM531Y1V77LruXWvfd//n7dCi/iXlGVpYiAVT5yDMqfk+aCIOf1zuM
 vSkS1MNuOXBayXTWw8ldm0srwvkNiEmUAoBlYzZJdC+8sTMVwvXIOn8pAAp2+uZVn6v7idcyuh2
 myiXzcDO+2IteTjmaVFJFa75cgpjt/eA=
X-Received: by 2002:aa7:9ae9:0:b0:3f5:e1a7:db23 with SMTP id
 y9-20020aa79ae9000000b003f5e1a7db23mr10763291pfp.42.1631532749096; 
 Mon, 13 Sep 2021 04:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpV5ZgvV2xemjv5szxkZ46gDHyH7kyMF47RnbrEAaCmzBgtfdZV1h36tCZbBDJke6F1gkDAGNF9h5OIHNdeag=
X-Received: by 2002:aa7:9ae9:0:b0:3f5:e1a7:db23 with SMTP id
 y9-20020aa79ae9000000b003f5e1a7db23mr10763269pfp.42.1631532748812; Mon, 13
 Sep 2021 04:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-2-marcandre.lureau@redhat.com>
 <CAFEAcA9BzYj5N3P-Cykm7tzbu9xJAnBO8rF=vBZ87DJnk=kKzQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9BzYj5N3P-Cykm7tzbu9xJAnBO8rF=vBZ87DJnk=kKzQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Sep 2021 15:32:17 +0400
Message-ID: <CAMxuvaymO7KUWaQ19r1uL-4bNDnXYP57FHeZfSBTpeh-f0rZbg@mail.gmail.com>
Subject: Re: [RFC v3 01/32] RFC: docs: add supported host CPUs section
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eecf2b05cbded15c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

--000000000000eecf2b05cbded15c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 7, 2021 at 4:34 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 7 Sept 2021 at 13:23, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > I was looking for such documentation, but couldn't find it.
>
> Yes; this is definitely something we should document, and in
> the build-platforms doc is as good a place as any.
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
> >  meson.build                    |  2 +-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/about/build-platforms.rst
> b/docs/about/build-platforms.rst
> > index 692323609e..bfe90e574e 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identif=
y
> >  currently shipped versions of software in various operating systems,
> >  though it does not cover all distros listed below.
> >
> > +Supported host CPUs
> > +-------------------
> > +
> > +Those host CPUs have a native TCG backend and are regularly tested:
>
> This is a list of host architectures, not CPUs.
>

Isn't it CPU architecture we are talking about? (CPU for short in the title=
)


> > +  .. list-table::
> > +   :header-rows: 1
> > +
> > +   * - CPU Family
>

 I'll change this to CPU Architecture

> +     - Accelerators
> > +   * - ARM
>
> The correct capitalization these days is "Arm", by the way :-)
>
>
ok

You also should split 64-bit and 32-bit Arm; we support
> KVM on 64-bit but not 32-bit.
>
>
When such a difference exists, I just added "(64 bit only)", see below for
x86.


> > +     - kvm, xen
> > +   * - MIPS
> > +     - kvm
> > +   * - PPC
> > +     - kvm
> > +   * - RISC-V
> > +     -
> > +   * - s390x
> > +     - kvm
> > +   * - SPARC
> > +     -
> > +   * - x86
> > +     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)
> > +
> > +Other architectures are not actively maintained. They use the slow and
> > +experimental TCG interpreter. They may be removed in future releases.
>
> This seems to be conflating TCG and the TCG interpreter.
> We should just list which architectures we support (proper)
> TCG for, and say that everything else is unsupported
> (not mentioning the TCG interpreter at all; using it is
> pretty much always a mistake IMHO).
>

ok


> The table also seems to me to be a bit confusing, because
> the introductory text suggests it's a list of the TCG
> support for each architecture, but the table itself lists
> only the non-TCG accelerators. I think we should just list
> all the accelerators supported for each host architecture.
>

All the architectures we support (in the list) have proper TCG, right?

>
> Perhaps we should also (eventually) have somewhere some text
> describing each accelerator in more detail, though probably
> not in this file. A docs/system/accels.rst that described all
> the accelerators with a paragraph or so for each, maybe ?
>

That could be really useful, but I am not up to the task at this point.

thanks

--000000000000eecf2b05cbded15c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 4:34 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 7 Sept 2021 at 13:23, &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; I was looking for such documentation, but couldn&#39;t find it.<br>
<br>
Yes; this is definitely something we should document, and in<br>
the build-platforms doc is as good a place as any.<br>
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++=
<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 29 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/docs/about/build-platforms.rst b/docs/about/build-platfor=
ms.rst<br>
&gt; index 692323609e..bfe90e574e 100644<br>
&gt; --- a/docs/about/build-platforms.rst<br>
&gt; +++ b/docs/about/build-platforms.rst<br>
&gt; @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identi=
fy<br>
&gt;=C2=A0 currently shipped versions of software in various operating syst=
ems,<br>
&gt;=C2=A0 though it does not cover all distros listed below.<br>
&gt;<br>
&gt; +Supported host CPUs<br>
&gt; +-------------------<br>
&gt; +<br>
&gt; +Those host CPUs have a native TCG backend and are regularly tested:<b=
r>
<br>
This is a list of host architectures, not CPUs.<br></blockquote><div><br></=
div><div>Isn&#39;t it CPU architecture we are talking about? (CPU for short=
 in the title)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; +=C2=A0 .. list-table::<br>
&gt; +=C2=A0 =C2=A0:header-rows: 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0* - CPU Family<br></blockquote><div><br></div><div>=C2=
=A0I&#39;ll change this to CPU Architecture</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0- Accelerators<br>
&gt; +=C2=A0 =C2=A0* - ARM<br>
<br>
The correct capitalization these days is &quot;Arm&quot;, by the way :-)<br=
>
<br></blockquote><div><br></div><div>ok</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
You also should split 64-bit and 32-bit Arm; we support<br>
KVM on 64-bit but not 32-bit.<br>
<br></blockquote><div><br></div><div>When such a difference exists, I just =
added &quot;(64 bit only)&quot;, see below for x86.<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm, xen<br>
&gt; +=C2=A0 =C2=A0* - MIPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - PPC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - RISC-V<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-<br>
&gt; +=C2=A0 =C2=A0* - s390x<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm<br>
&gt; +=C2=A0 =C2=A0* - SPARC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-<br>
&gt; +=C2=A0 =C2=A0* - x86<br>
&gt; +=C2=A0 =C2=A0 =C2=A0- kvm, xen, hax, hvf (64 bit only), nvmm, whpx (6=
4 bit only)<br>
&gt; +<br>
&gt; +Other architectures are not actively maintained. They use the slow an=
d<br>
&gt; +experimental TCG interpreter. They may be removed in future releases.=
<br>
<br>
This seems to be conflating TCG and the TCG interpreter.<br>
We should just list which architectures we support (proper)<br>
TCG for, and say that everything else is unsupported<br>
(not mentioning the TCG interpreter at all; using it is<br>
pretty much always a mistake IMHO).<br></blockquote><div><br></div><div>ok<=
/div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The table also seems to me to be a bit confusing, because<br>
the introductory text suggests it&#39;s a list of the TCG<br>
support for each architecture, but the table itself lists<br>
only the non-TCG accelerators. I think we should just list<br>
all the accelerators supported for each host architecture.<br></blockquote>=
<div><br></div><div>All the architectures we support (in the list) have pro=
per TCG, right? <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Perhaps we should also (eventually) have somewhere some text<br>
describing each accelerator in more detail, though probably<br>
not in this file. A docs/system/accels.rst that described all<br>
the accelerators with a paragraph or so for each, maybe ?<br></blockquote><=
div>=C2=A0<br></div><div>That could be really useful, but I am not up to th=
e task at this point.</div><div><br></div><div>thanks<br></div><div><br></d=
iv></div></div>

--000000000000eecf2b05cbded15c--


