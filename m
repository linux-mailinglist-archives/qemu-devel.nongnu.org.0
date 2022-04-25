Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376550E7EB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 20:17:15 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj3Gr-0004Aq-M3
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 14:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3FR-0003P6-K2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3FN-00009e-M2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650910539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAn8A+BahjSH9jo3djeKCWu8E7qu3fZ4/wfWRgiPVp4=;
 b=A8HnxEK36Ae8Daj/tEJB8U1imFGVNUInuK06MsbTFk+qrCnpDP/MhIZFBj6qUOfj9Y3fSl
 oolSO/kyBKlMUHLTgZ4eZ6Pp1IGlHSpuU4qYSRCJGgfTa0do0c88sRVM8GKnadsD+EjZvd
 hk+g/q18hk6EsDQAQGmnOGwVAVFzgNE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-psm65N0BMhyP3MT40kvTbA-1; Mon, 25 Apr 2022 14:15:37 -0400
X-MC-Unique: psm65N0BMhyP3MT40kvTbA-1
Received: by mail-ua1-f71.google.com with SMTP id
 i4-20020ab04744000000b003520c239119so6681983uac.18
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 11:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eAn8A+BahjSH9jo3djeKCWu8E7qu3fZ4/wfWRgiPVp4=;
 b=a6lC4QEvNj7emU7r7selnv6Mef2wjBkCtd4/FP5QoNYXs6+xAZ7+BvhnWfa+pyV0wz
 dSn0wP+2Jx7f8gFYyMNVEUMYo23wzq3aKQs5LIDwPrz4AC0AwJMqixf/dd1fWbhRaJYH
 k3xxRGsLr6VjQjk+xvV2Gl3kSbqhbKuaAZVbKRo8wW8xoE8kQ+d5rcUBjP9/PChibISh
 YmpyWSa4aXLLJ1AusZPPnK0m7GapTe8zqmFeBwaqhskOdm1J4JdHrhu6O6ph/aidbOoW
 CBa63/R3AbEjIhoMOgJdWlA2EZxyovWs3r8K51/7ZYiO/DVTgMH424gsA6aDkAh2cp50
 H99w==
X-Gm-Message-State: AOAM531aLIj/zy9o1TvkqK4UaVXyaqoNpaWZzOgZUwN8OYF7Eph2vzjM
 FG4/d+beOhaI7iUTpCaPV6g9pwTm9075pmYwj5YBS7SAH1ZMoCyZySj+McE2QrhKl/GQfTLmhaV
 XzQxJkxGCdM6hK9FrRIqk35wG3vfT06o=
X-Received: by 2002:a05:6122:78b:b0:34d:8395:b16c with SMTP id
 k11-20020a056122078b00b0034d8395b16cmr1575226vkr.3.1650910536625; 
 Mon, 25 Apr 2022 11:15:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB0t2mRuPNQCG58feRz39WrpJ9FNaX5Ju/AOnqAknoclkq9mMTUFmWQBuU8m8laJ2rruH8l3FzzzYgLbI/bMo=
X-Received: by 2002:a05:6122:78b:b0:34d:8395:b16c with SMTP id
 k11-20020a056122078b00b0034d8395b16cmr1575219vkr.3.1650910536390; Mon, 25 Apr
 2022 11:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-3-jsnow@redhat.com>
 <YmZ9/qQ/YWU6F3fj@redhat.com>
In-Reply-To: <YmZ9/qQ/YWU6F3fj@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Apr 2022 14:15:26 -0400
Message-ID: <CAFn=p-a9e8R-WKY6WwNQsWYArA4FMnKHgADbp=GACf+q446waA@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 02/12] update maintainer metadata
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000013ed0005dd7e90b8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013ed0005dd7e90b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022, 6:55 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, Apr 22, 2022 at 02:49:30PM -0400, John Snow wrote:
> > Modify "QEMU Developer Team" to "QEMU Project", as this matches the
> > spelling we use for the collective on gitlab.com/qemu-project.
> >
> > Add myself as the principal maintainer contact.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  setup.cfg | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> > diff --git a/setup.cfg b/setup.cfg
> > index 4ffab73..f06f944 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -1,8 +1,10 @@
> >  [metadata]
> >  name =3D qemu.qmp
> >  version =3D file:VERSION
> > -maintainer =3D QEMU Developer Team
> > -maintainer_email =3D qemu-devel@nongnu.org
> > +author =3D QEMU Project
> > +author_email =3D qemu-devel@nongnu.org
> > +maintainer =3D John Snow
> > +maintainer_email =3D jsnow@redhat.com
>
> It is up to you to decide, but beware that listing yourself here will
> result in random people emailing you directly to ask for help, instead
> of emailing the mailing list for help. Personally I always want people
> to use the mailing list and never mail me directly [1].
>

Good point. I guess what I am afraid of is that they mail the list and
don't CC me, and I miss it!

--00000000000013ed0005dd7e90b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 25, 2022, 6:55 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, Apr 22, 2022 at 02:49:30=
PM -0400, John Snow wrote:<br>
&gt; Modify &quot;QEMU Developer Team&quot; to &quot;QEMU Project&quot;, as=
 this matches the<br>
&gt; spelling we use for the collective on <a href=3D"http://gitlab.com/qem=
u-project" rel=3D"noreferrer noreferrer" target=3D"_blank">gitlab.com/qemu-=
project</a>.<br>
&gt; <br>
&gt; Add myself as the principal maintainer contact.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 setup.cfg | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt;<br>
<br>
<br>
&gt; diff --git a/setup.cfg b/setup.cfg<br>
&gt; index 4ffab73..f06f944 100644<br>
&gt; --- a/setup.cfg<br>
&gt; +++ b/setup.cfg<br>
&gt; @@ -1,8 +1,10 @@<br>
&gt;=C2=A0 [metadata]<br>
&gt;=C2=A0 name =3D qemu.qmp<br>
&gt;=C2=A0 version =3D file:VERSION<br>
&gt; -maintainer =3D QEMU Developer Team<br>
&gt; -maintainer_email =3D <a href=3D"mailto:qemu-devel@nongnu.org" target=
=3D"_blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a><br>
&gt; +author =3D QEMU Project<br>
&gt; +author_email =3D <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_=
blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a><br>
&gt; +maintainer =3D John Snow<br>
&gt; +maintainer_email =3D <a href=3D"mailto:jsnow@redhat.com" target=3D"_b=
lank" rel=3D"noreferrer">jsnow@redhat.com</a><br>
<br>
It is up to you to decide, but beware that listing yourself here will<br>
result in random people emailing you directly to ask for help, instead<br>
of emailing the mailing list for help. Personally I always want people<br>
to use the mailing list and never mail me directly [1].<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Good point. I guess =
what I am afraid of is that they mail the list and don&#39;t CC me, and I m=
iss it!</div><div dir=3D"auto"><br></div></div>

--00000000000013ed0005dd7e90b8--


