Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E463A644
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:39:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbWc-0008JE-I9; Mon, 28 Nov 2022 05:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozbWN-0008Iz-CQ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozbWK-0008Mm-KZ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669631871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9uJEEyr4qkVAwDIht/AUzSSJcUtgl5Gfz56x4plXhQ=;
 b=XA2jIqQHnhqPY/cnI25LzGKxFy3EfrEJPEy78Nc1fEMSnjyGbu5jxR1s/270wkqpL6gPHW
 EHwToKWZYZxe0HLaCgcPKuaoVrleXO+nk74cSRGM7I4wcP2SxiET500B8c0152oA9REf9A
 wBrEX9LQVlG8QJn/qJR0k9OdPkyWcdQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-vgWd3CJIOa2s_CacTwqJ5g-1; Mon, 28 Nov 2022 05:37:48 -0500
X-MC-Unique: vgWd3CJIOa2s_CacTwqJ5g-1
Received: by mail-il1-f198.google.com with SMTP id
 n8-20020a056e021ba800b00302c73f42d9so8380511ili.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9uJEEyr4qkVAwDIht/AUzSSJcUtgl5Gfz56x4plXhQ=;
 b=Mv7+IS8hsCT0frYvJkD59HFGEIR1HVPKgl3TC+n8HfCGyaWRsrcUCxdVc7pfH1lOnv
 BYrNSxgv2B9ELV7sL4ruT1y//d198fxmoU/OTzHN4Ae6LF9Wg8Nhp+mjLuu3nT+FDZdS
 a3/jJEl/fABCEisziLAEWR9rVEJhPJ/Vy29wr/LoMqLkoAN55bQ5167/XxdXBLoeqq4M
 M8au3o8r0VENJN2rfCVfK9h5s1Auq7M6UrDbxZF+I2RXcz87YVoCJ7DcHxyOR8oYQm1W
 QGmduocubxzaidCf/z61/FNU0cXXan0l+SzIAgNdjcKho4ZVhIaO1T+IhutBOMMnDXaY
 FTcQ==
X-Gm-Message-State: ANoB5pmVm4PSAlODOC4sdfOxjA8Hec2Q1THG52sFVK6/a7ZU1MfdTjzr
 qJIkUyTgtdpa6UQ5IGuFuimyUnMslDqM2jsvmvBiAHwaIVq5kgAEpMEVFPgEyyhji+dXLSqklHN
 d67ofMQVfTotaBhLE0Kld1B7L8WIGX+k=
X-Received: by 2002:a02:6a1d:0:b0:363:c65d:dd06 with SMTP id
 l29-20020a026a1d000000b00363c65ddd06mr14865475jac.22.1669631867997; 
 Mon, 28 Nov 2022 02:37:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4BmcqZSyLvoaBmBclB8ZDTNvhqkJyIHR92f+lMLT3MLy3MO0hZFdJ+OGTxt1MEi4rdnu/EfsAw7oAFUla0Qwg=
X-Received: by 2002:a02:6a1d:0:b0:363:c65d:dd06 with SMTP id
 l29-20020a026a1d000000b00363c65ddd06mr14865464jac.22.1669631867680; Mon, 28
 Nov 2022 02:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-2-nsoffer@redhat.com>
 <6f9ad126-eb51-25d5-d7d2-bb478c3ecc19@redhat.com>
 <CAMRbyyt5KvHd-e5ujF+9QQZYe+QsFNmfVYuk7+fGFcU7cBFSvg@mail.gmail.com>
 <090561ea-9836-bece-3e73-a044f45c703d@redhat.com>
In-Reply-To: <090561ea-9836-bece-3e73-a044f45c703d@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 28 Nov 2022 12:37:31 +0200
Message-ID: <CAMRbyyuF6YRQh2=778-+vqFW4D2-nV99D_m9678Tan-fLiU9Nw@mail.gmail.com>
Subject: Re: [PATCH 1/3] qemu-img: Add checksum command
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006113cd05ee8576a1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000006113cd05ee8576a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2022 at 12:20 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 30.10.22 18:37, Nir Soffer wrote:
> > On Wed, Oct 26, 2022 at 4:00 PM Hanna Reitz <hreitz@redhat.com> wrote:
> >
> >     On 01.09.22 16:32, Nir Soffer wrote:
> [...]
> >     > ---
> >     >   docs/tools/qemu-img.rst |  22 +++++
> >     >   meson.build             |  10 ++-
> >     >   meson_options.txt       |   2 +
> >     >   qemu-img-cmds.hx        |   8 ++
> >     >   qemu-img.c              | 191
> >     ++++++++++++++++++++++++++++++++++++++++
> >     >   5 files changed, 232 insertions(+), 1 deletion(-)
> >     >
> >     > diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> >     > index 85a6e05b35..8be9c45cbf 100644
> >     > --- a/docs/tools/qemu-img.rst
> >     > +++ b/docs/tools/qemu-img.rst
> >     > @@ -347,20 +347,42 @@ Command description:
> >     >       Check completed, image is corrupted
> >     >     3
> >     >       Check completed, image has leaked clusters, but is not
> >     corrupted
> >     >     63
> >     >       Checks are not supported by the image format
> >     >
> >     >     If ``-r`` is specified, exit codes representing the image
> >     state refer to the
> >     >     state after (the attempt at) repairing it. That is, a
> >     successful ``-r all``
> >     >     will yield the exit code 0, independently of the image state
> >     before.
> >     >
> >     > +.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f
> >     FMT] [-T SRC_CACHE] [-p] FILENAME
> >     > +
> >     > +  Print a checksum for image *FILENAME* guest visible content.
> >
> >     Why not say which kind of checksum it is?
> >
> >
> > Do you mean the algorithm used? This may be confusing, for example we
> > write
> >
> >    Print a sha256 checksum ...
> >
> > User will expect to get the same result from "sha256sum disk.img". How
> > about
> >
> >    Print a blkhash checksum ...
> >
> > And add a link to the blkhash project?
>
> I did mean sha256, but if it isn=E2=80=99t pure sha256, then a link to an=
y
> description how it is computed would be good, I think.
>

Ok, will link to https://gitlab.com/nirs/blkhash

[...]

>
> >     > +  The checksum is not compatible with other tools such as
> >     *sha256sum*.
> >
> >     Why not?  I can see it differs even for raw images, but why?  I wou=
ld
> >     have very much assumed that this gives me exactly what sha256sum
> >     in the
> >     guest on the guest device would yield.
> >
> >
> > The blkhash is a construction based on other cryptographic hash
> > functions (e.g. sha256).
> > The way the hash is constructed is explained here:
> > https://gitlab.com/nirs/blkhash/-/blob/master/blkhash.py#L52
> >
> > We can provide a very slow version using a single thread and no zero
> > optimization
> > that will create the same hash as sha256sum for raw image.
>
> Ah, right.  Yes, especially zero optimization is likely to make a huge
> difference.  Thanks for the explanation!
>
> Maybe that could be mentioned here as a side note, though?  E.g. =E2=80=
=9CThe
> checksum is not compatible with other tools such as *sha256sum* for
> optimization purposes (to allow multithreading and optimized handling of
> zero areas).=E2=80=9D?
>

Ok, I will improve the text in the next version.

[...]

> > In blksum I do not allow changing the block size.
> >
> > I'll add an assert in the next version to keeps this default optimal.
>
> Thanks!  (Static assert should work, right?)
>

I think it should

Nir

--0000000000006113cd05ee8576a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 7, 2022 at 12:20 PM Hanna Rei=
tz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 30.10.22 18:37, Nir Soffer wrote:<br>
&gt; On Wed, Oct 26, 2022 at 4:00 PM Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 01.09.22 16:32, Nir Soffer wrote:<br>[...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0docs/tools/qemu-img.rst |=C2=A0 22=
 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0qemu-img-cmds.hx=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A08 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 191<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A05 files changed, 232 insertions(+)=
, 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/docs/tools/qemu-img.rst b/docs/to=
ols/qemu-img.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 85a6e05b35..8be9c45cbf 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/docs/tools/qemu-img.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/docs/tools/qemu-img.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -347,20 +347,42 @@ Command description:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Check completed, ima=
ge is corrupted<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A03<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Check completed, ima=
ge has leaked clusters, but is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0corrupted<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A063<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Checks are not suppo=
rted by the image format<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0If ``-r`` is specified, exi=
t codes representing the image<br>
&gt;=C2=A0 =C2=A0 =C2=A0state refer to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0state after (the attempt at=
) repairing it. That is, a<br>
&gt;=C2=A0 =C2=A0 =C2=A0successful ``-r all``<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0will yield the exit code 0,=
 independently of the image state<br>
&gt;=C2=A0 =C2=A0 =C2=A0before.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +.. option:: checksum [--object OBJECTDEF] [--=
image-opts] [-f<br>
&gt;=C2=A0 =C2=A0 =C2=A0FMT] [-T SRC_CACHE] [-p] FILENAME<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 Print a checksum for image *FILENAME* =
guest visible content.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Why not say which kind of checksum it is?<br>
&gt;<br>
&gt;<br>
&gt; Do you mean the algorithm used? This may be confusing, for example we =
<br>
&gt; write<br>
&gt;<br>
&gt; =C2=A0 =C2=A0Print a sha256 checksum ...<br>
&gt;<br>
&gt; User will expect to get the same result from &quot;sha256sum disk.img&=
quot;. How <br>
&gt; about<br>
&gt;<br>
&gt; =C2=A0 =C2=A0Print a blkhash checksum ...<br>
&gt;<br>
&gt; And add a link to the blkhash project?<br>
<br>
I did mean sha256, but if it isn=E2=80=99t pure sha256, then a link to any =
<br>
description how it is computed would be good, I think.<br></blockquote><div=
><br></div><div>Ok, will link to=C2=A0<a href=3D"https://gitlab.com/nirs/bl=
khash">https://gitlab.com/nirs/blkhash</a></div><div>=C2=A0<br></div><div>[=
...]</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 The checksum is not compatible with ot=
her tools such as<br>
&gt;=C2=A0 =C2=A0 =C2=A0*sha256sum*.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Why not?=C2=A0 I can see it differs even for raw im=
ages, but why?=C2=A0 I would<br>
&gt;=C2=A0 =C2=A0 =C2=A0have very much assumed that this gives me exactly w=
hat sha256sum<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0guest on the guest device would yield.<br>
&gt;<br>
&gt;<br>
&gt; The blkhash is a construction based on other cryptographic hash <br>
&gt; functions (e.g. sha256).<br>
&gt; The way the hash is constructed is explained here:<br>
&gt; <a href=3D"https://gitlab.com/nirs/blkhash/-/blob/master/blkhash.py#L5=
2" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/nirs/blkhash/-/b=
lob/master/blkhash.py#L52</a><br>
&gt;<br>
&gt; We can provide a very slow version using a single thread and no zero <=
br>
&gt; optimization<br>
&gt; that will create the same hash as sha256sum for raw image.<br>
<br>
Ah, right.=C2=A0 Yes, especially zero optimization is likely to make a huge=
 <br>
difference.=C2=A0 Thanks for the explanation!<br>
<br>
Maybe that could be mentioned here as a side note, though?=C2=A0 E.g. =E2=
=80=9CThe <br>
checksum is not compatible with other tools such as *sha256sum* for <br>
optimization purposes (to allow multithreading and optimized handling of <b=
r>
zero areas).=E2=80=9D?<br></blockquote><div><br></div><div>Ok, I will impro=
ve the text in the next version.</div><div>=C2=A0</div><div>[...]</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; In blksum I do not allow changing the block size.<br>
&gt;<br>
&gt; I&#39;ll add an assert in the next version to keeps this default optim=
al.<br>
<br>
Thanks!=C2=A0 (Static assert should work, right?)<br></blockquote><div><br>=
</div><div>I think it should</div><div>=C2=A0</div><div>Nir</div></div></di=
v>

--0000000000006113cd05ee8576a1--


