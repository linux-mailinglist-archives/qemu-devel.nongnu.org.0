Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA86DB557
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:34:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkslX-0002jC-1H; Fri, 07 Apr 2023 16:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkslU-0002ie-PW
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkslS-0000nv-Pg
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680899552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nml+RkSex9jbxqTPeJnidWVlyQGPFrtUIoygodQ3VeI=;
 b=BheL4WU0A7ecB+Y0QrLM3MqKHjjtMQ1mRGgxU90atNJ1+HQ+Ou0sVmPlvQ4d921g8QrGG8
 Xdx0tBYHsm7qTnH01fNZqAPjr5yloOrY0CnCNtbHe+O2vdCfgthJGd3cIx6lUb/P9EV3f7
 etC8KDO9cdTfoqpfOAb4E9y/kQXq6LY=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-XlowrT0sM2CkDaUSfrTUoQ-1; Fri, 07 Apr 2023 16:32:31 -0400
X-MC-Unique: XlowrT0sM2CkDaUSfrTUoQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 z23-20020a67ca17000000b004262b09b60aso14973569vsk.12
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 13:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680899550; x=1683491550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nml+RkSex9jbxqTPeJnidWVlyQGPFrtUIoygodQ3VeI=;
 b=VoA0p4v/89bHSxan0xdHdp8GWmGAsWszZExUvwAdrQKHWUHJRUJjqCxVZnpOMn2aDp
 bJAMmzbgmCAcbbcrtjDuQEgbgZkP67eNyQbfh+ti6mApBWPJjP8EmbkqS+Ix+ajhf3Gw
 cu9WbmBEs4wJtEkBh5fElynbsB+2tooJ+Pz22bZllS9Y22GmLKtVe8HEKdfxuPBigXtN
 upCvcBFUkcrmDpc6EAqXSdxwTggBNgqYglvqorh+DWMWFO6umMqtt4UsXeBIby6U7cna
 mOB+b+4e4dHHEi1bLuqUoLJAbd8vcJuhK8thrCVPoBErHgs3Ndp9zUZHQqYk60Ktnrsx
 amxw==
X-Gm-Message-State: AAQBX9cTsQZXPF/kzzsSCQxucnPNGro2NPV+Yywonp/FK0n4IEbBewF+
 nhWHJLr5l3mc41bexzWpEkh/9Zcoqy+uwpDl5c3VfTuPnhUf8af7wM+IfUYizI0c8hR9HKlTjGy
 CK6C4HsFmSM4LdYPdj33UHCUBKxfUdM8QphNgyZw=
X-Received: by 2002:a67:b74c:0:b0:425:d255:dd38 with SMTP id
 l12-20020a67b74c000000b00425d255dd38mr1749459vsh.1.1680899550626; 
 Fri, 07 Apr 2023 13:32:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350af/a+m54JGXTlg0sVzCqFzJdbUPssxJ20hRFMd620pTTcolM+7ddRC7Snme9xxmGMA1Pbm3rUPNprtrs1BEvU=
X-Received: by 2002:a67:b74c:0:b0:425:d255:dd38 with SMTP id
 l12-20020a67b74c000000b00425d255dd38mr1749446vsh.1.1680899550294; Fri, 07 Apr
 2023 13:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-9-pbonzini@redhat.com>
 <efzg2o4orxbbtaxxw2wqxao3jfqh7bgomd2wni63ck4zxhzrbz@ma6uxp4msloy>
In-Reply-To: <efzg2o4orxbbtaxxw2wqxao3jfqh7bgomd2wni63ck4zxhzrbz@ma6uxp4msloy>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Apr 2023 22:32:19 +0200
Message-ID: <CABgObfb3yZkFJFxZ6H9ZomQqm=ifXOzbLWbOrN2cKrjy59HiYw@mail.gmail.com>
Subject: Re: [PATCH 8/8] block, block-backend: write some hot coroutine
 wrappers by hand
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>, "Wolf, Kevin" <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Hanna Czenczek <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000099492105f8c4ec04"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--00000000000099492105f8c4ec04
Content-Type: text/plain; charset="UTF-8"

Il ven 7 apr 2023, 22:04 Eric Blake <eblake@redhat.com> ha scritto:

> On Fri, Apr 07, 2023 at 05:33:03PM +0200, Paolo Bonzini wrote:
> > The introduction of the graph lock is causing blk_get_geometry, a hot
> function
> > used in the I/O path, to create a coroutine.  However, the only part
> that really
> > needs to run in coroutine context is the call to
> bdrv_co_refresh_total_sectors,
> > which in turn only happens in the rare case of host CD-ROM devices.
> >
> > So, write by hand the three wrappers on the path from
> blk_co_get_geometry to
> > bdrv_co_refresh_total_sectors, so that the coroutine wrapper is only
> created
> > if bdrv_nb_sectors actually calls bdrv_refresh_total_sectors.
> >
> > Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  block.c                           | 22 ++++++++++++++++++++++
> >  block/block-backend.c             | 27 +++++++++++++++++++++++++++
> >
> >  include/sysemu/block-backend-io.h |  5 ++---
> >  4 files changed, 52 insertions(+), 4 deletions(-)
> >
> > diff --git a/block.c b/block.c
> > index dbbc8de30c24..3390efd18cf6 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -5859,6 +5859,28 @@ int64_t coroutine_fn
> bdrv_co_nb_sectors(BlockDriverState *bs)
> >      return bs->total_sectors;
> >  }
> >
> > +/*
> > + * This wrapper is written by hand because this function is in the hot
> I/O path,
> > + * via blk_get_geometry.
> > + */
> > +int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs)
> > +{
> > +    BlockDriver *drv = bs->drv;
> > +    IO_CODE();
> > +
> > +    if (!drv)
> > +        return -ENOMEDIUM;
> > +
> > +    if (!bs->bl.has_variable_length) {
> > +        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
>
> Is this logic backwards?  Why are we only refreshing the total sectors
> when we don't have variable length?
>

Yes, it is backwards.

Paolo


> > +        if (ret < 0) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return bs->total_sectors;
> > +}
> > +
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--00000000000099492105f8c4ec04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 7 apr 2023, 22:04 Eric Blake &lt;<a href=3D"mai=
lto:eblake@redhat.com">eblake@redhat.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Fri, Apr 07, 2023 at 05:33:03PM +0200, Paolo B=
onzini wrote:<br>
&gt; The introduction of the graph lock is causing blk_get_geometry, a hot =
function<br>
&gt; used in the I/O path, to create a coroutine.=C2=A0 However, the only p=
art that really<br>
&gt; needs to run in coroutine context is the call to bdrv_co_refresh_total=
_sectors,<br>
&gt; which in turn only happens in the rare case of host CD-ROM devices.<br=
>
&gt; <br>
&gt; So, write by hand the three wrappers on the path from blk_co_get_geome=
try to<br>
&gt; bdrv_co_refresh_total_sectors, so that the coroutine wrapper is only c=
reated<br>
&gt; if bdrv_nb_sectors actually calls bdrv_refresh_total_sectors.<br>
&gt; <br>
&gt; Reported-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 block/block-backend.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 27 +++++++++++++++++++++++++++<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 include/sysemu/block-backend-io.h |=C2=A0 5 ++---<br>
&gt;=C2=A0 4 files changed, 52 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block.c b/block.c<br>
&gt; index dbbc8de30c24..3390efd18cf6 100644<br>
&gt; --- a/block.c<br>
&gt; +++ b/block.c<br>
&gt; @@ -5859,6 +5859,28 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDr=
iverState *bs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return bs-&gt;total_sectors;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * This wrapper is written by hand because this function is in the ho=
t I/O path,<br>
&gt; + * via blk_get_geometry.<br>
&gt; + */<br>
&gt; +int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 BlockDriver *drv =3D bs-&gt;drv;<br>
&gt; +=C2=A0 =C2=A0 IO_CODE();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!drv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEDIUM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!bs-&gt;bl.has_variable_length) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D bdrv_refresh_total_sectors(bs=
, bs-&gt;total_sectors);<br>
<br>
Is this logic backwards?=C2=A0 Why are we only refreshing the total sectors=
<br>
when we don&#39;t have variable length?<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yes, it is backwards.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return bs-&gt;total_sectors;<br>
&gt; +}<br>
&gt; +<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div>

--00000000000099492105f8c4ec04--


