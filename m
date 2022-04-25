Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A750E7FD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 20:20:50 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj3KL-0006SU-5p
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 14:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3JG-0005mx-Ea
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nj3JE-0000b6-LD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650910780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/XdIolFD30HiPEY9avtvDDWHtP2LDICaMaAapBJUg0s=;
 b=N8Pvwou93T+laE+EwX9sE+SFRwXaxplUUgT3fwq+jbfnx5ge1ufI0eYmZsqpgs59Imq7yp
 rSPDuf7xPna/NbFxl2qzuwpU2MweTYwAmnGwSKbKnd1JpfGX8mGTplL5yDXROgB8ZXYFWt
 2Qw4ahXajGYTW7Dunt3rGdozw0M1pkM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-iL4W7KxxMCiNrD4cfQbfzA-1; Mon, 25 Apr 2022 14:19:38 -0400
X-MC-Unique: iL4W7KxxMCiNrD4cfQbfzA-1
Received: by mail-ua1-f69.google.com with SMTP id
 s14-20020ab02bce000000b0035d45862725so6675336uar.22
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 11:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XdIolFD30HiPEY9avtvDDWHtP2LDICaMaAapBJUg0s=;
 b=egMnNmrQOgGWV5MWMOsb5rV6fCVOv8IUKuhLTdZx0knda/GaET6IsOdtQpR7wYJ/oD
 fGY/IiQmp+rcSmtdGckcum0WGk19DOGQFr0vn8FyH599XNvK0VPMDlDrFmvOHo/Xzmaf
 xdOrcFENpaVsAT13ibHEU2T+UHkcfa8z7oUsDphKmnYCIQSiQpdlYN1MC6w5N5ZyQzka
 JgpbvbMfZtTTnToQHLxXFDxtpVmj9UmtJjJyLtLr8STerGXLXAbxx6T/8NwCTOI7QUJX
 MDELds0T2HN5YilABjXdomgoMOi65aogOy3Z9ToictLaPJ/1Pv/xJ47r3zh3maynPx3R
 7GLA==
X-Gm-Message-State: AOAM530WEFlzuWUXVw72pFGCGGohy0gDd54lFNo+c71m6gf0hjZbi8Fz
 MN9WmKXvru9GzI56pg7IwbbcQKl0IRT3HLqwzLtjnxd/uFrpJfilpIBIky0BcC8VxGUrvvUVDtU
 Ae70p/oNtp3Z1IQhMCjsZEvQmV6O4MtY=
X-Received: by 2002:a67:c19e:0:b0:32a:4bc5:6e46 with SMTP id
 h30-20020a67c19e000000b0032a4bc56e46mr5469976vsj.35.1650910777715; 
 Mon, 25 Apr 2022 11:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbPZGgzO8vUlALf9KQxv8iqlbjQC1VJ7lq+4O6NzGPkRXT+Sa68Eb4niJqo/Bk6zO5Ni/hNdURv15FPB0rPWI=
X-Received: by 2002:a67:c19e:0:b0:32a:4bc5:6e46 with SMTP id
 h30-20020a67c19e000000b0032a4bc56e46mr5469971vsj.35.1650910777521; Mon, 25
 Apr 2022 11:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
 <YmZ+X0XK3kcCHtMm@redhat.com>
In-Reply-To: <YmZ+X0XK3kcCHtMm@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Apr 2022 14:19:27 -0400
Message-ID: <CAFn=p-YAGKUscrVNWpVT6=n3Q_Xi4Bvt5YWV4mrAh3Eb4QRkNQ@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000734cad05dd7e9e63"
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

--000000000000734cad05dd7e9e63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022, 6:56 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> > Point to this library's URLs instead of the entire project's.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  setup.cfg | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/setup.cfg b/setup.cfg
> > index c21f2ce..0a1c215 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -5,8 +5,8 @@ author =3D QEMU Project
> >  author_email =3D qemu-devel@nongnu.org
> >  maintainer =3D John Snow
> >  maintainer_email =3D jsnow@redhat.com
> > -url =3D https://www.qemu.org/
> > -download_url =3D https://www.qemu.org/download/
> > +url =3D https://gitlab.com/qemu-project/python-qemu-qmp
> > +download_url =3D
> https://gitlab.com/qemu-project/python-qemu-qmp/-/packages
>
> Auto-generated tarballs are not guaranteed to have fixed content forever
> so I tend to avoid pointing to those. Assuming you're intending to upload
> to pypi, I'd link to that instead as the "official" tarball source.
>

This metadata will also be used for PyPI, so that seemed cyclic.

I linked it to the gitlab package repository, where I *intend* to push
built wheels (and dev interstitial builds) but maybe that's too "inside
baseball" for a pypi link.

Seems weird for a Pypi package to point to itself on pypi, but maybe that's
correct?



> >  description =3D QEMU Monitor Protocol library
> >  long_description =3D file:PACKAGE.rst
> >  long_description_content_type =3D text/x-rst
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000734cad05dd7e9e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 25, 2022, 6:56 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, Apr 22, 2022 at 02:49:32=
PM -0400, John Snow wrote:<br>
&gt; Point to this library&#39;s URLs instead of the entire project&#39;s.<=
br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 setup.cfg | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/setup.cfg b/setup.cfg<br>
&gt; index c21f2ce..0a1c215 100644<br>
&gt; --- a/setup.cfg<br>
&gt; +++ b/setup.cfg<br>
&gt; @@ -5,8 +5,8 @@ author =3D QEMU Project<br>
&gt;=C2=A0 author_email =3D <a href=3D"mailto:qemu-devel@nongnu.org" target=
=3D"_blank" rel=3D"noreferrer">qemu-devel@nongnu.org</a><br>
&gt;=C2=A0 maintainer =3D John Snow<br>
&gt;=C2=A0 maintainer_email =3D <a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a><br>
&gt; -url =3D <a href=3D"https://www.qemu.org/" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.qemu.org/</a><br>
&gt; -download_url =3D <a href=3D"https://www.qemu.org/download/" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://www.qemu.org/download/</a><b=
r>
&gt; +url =3D <a href=3D"https://gitlab.com/qemu-project/python-qemu-qmp" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-proj=
ect/python-qemu-qmp</a><br>
&gt; +download_url =3D <a href=3D"https://gitlab.com/qemu-project/python-qe=
mu-qmp/-/packages" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
gitlab.com/qemu-project/python-qemu-qmp/-/packages</a><br>
<br>
Auto-generated tarballs are not guaranteed to have fixed content forever<br=
>
so I tend to avoid pointing to those. Assuming you&#39;re intending to uplo=
ad<br>
to pypi, I&#39;d link to that instead as the &quot;official&quot; tarball s=
ource.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">This metadata will also be used for PyPI, so that seemed cyclic.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I linked it to the gitlab pa=
ckage repository, where I *intend* to push built wheels (and dev interstiti=
al builds) but maybe that&#39;s too &quot;inside baseball&quot; for a pypi =
link.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Seems weird for a =
Pypi package to point to itself on pypi, but maybe that&#39;s correct?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 description =3D QEMU Monitor Protocol library<br>
&gt;=C2=A0 long_description =3D file:PACKAGE.rst<br>
&gt;=C2=A0 long_description_content_type =3D text/x-rst<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000734cad05dd7e9e63--


