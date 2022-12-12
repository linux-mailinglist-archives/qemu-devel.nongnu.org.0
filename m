Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F4649F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:08:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iXS-0007mA-Fz; Mon, 12 Dec 2022 08:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p4iXP-0007jT-KC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p4iXN-0003gn-Dg
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670850484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Mhx7Awm1BMqJGE63n7utR1Q/D9C47ehWXGl9X3Gc+E=;
 b=DCHKvz6IXkVM5lx7Qimeg20OA8ZqaUWmqI5ZqpcO4HtXSAa939x8OyjBrH15ZPa7UHnePS
 M7HVdM9nquLFzZNEPupBViAwYWRE8mTfJ56hKWJ4Jof8j5NWAgXrXyXfKZHTuJpirWGw+c
 bg/PiVNWMH8BKnnCM5VufI+ay+h82XY=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-Y8CPt6Z7Mi6ERQ3KzJW9lg-1; Mon, 12 Dec 2022 08:08:02 -0500
X-MC-Unique: Y8CPt6Z7Mi6ERQ3KzJW9lg-1
Received: by mail-vs1-f72.google.com with SMTP id
 a186-20020a6766c3000000b003b141732496so2961763vsc.14
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Mhx7Awm1BMqJGE63n7utR1Q/D9C47ehWXGl9X3Gc+E=;
 b=rawy/T3kjxuUkFvbiN4hLwhDP1ZQPVgwcsQv48V/lCPaly5YlXzIB4LLy8/A/Yxf5/
 uz1mZj+J/AaZia7TduWwUP4Eq15xQavTk4cugfMv8uYkfYTodcXPGOi1MUAVNPQThFtc
 UulG/wRZtCsYTX+N7V2NozTbVw+9f6ws39vqsy1O+1cToYpk/stwQ3wKMOI4aKuNItoL
 GPq9jRm9J1qKWuonSghkSJ1FE8YN0w0yWtS+8Vbpw3PKS/KLluUbPA0DOEy81mFWVyzI
 QYuPSJu38YFqg1STSNDl+LYNdN/yxfAG9veLJblWlod1GlZQdsvx9N/+dNqD7vpp1NrB
 eCpA==
X-Gm-Message-State: ANoB5pnlDt9lOqT3+Xxlvvcjj4x5G9DDZ9P+EZmhJ90mdO/z/L+/UId3
 BLFsIradynuET9Cmv5A//bt8bPfTIuzrYzn8Ks/xGuc+yae8xanDcYxb/E129uK1HnyFE5oi042
 UJoUAik+GGUzBP7L/QZ9S2AMff3QZSsw=
X-Received: by 2002:a67:42c2:0:b0:3aa:31b2:ff09 with SMTP id
 p185-20020a6742c2000000b003aa31b2ff09mr45958520vsa.66.1670850482388; 
 Mon, 12 Dec 2022 05:08:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ITTsvsaT395qa4UQ3p1njLYP1Tp+lOUHQgSuyKe3m1e1D8GeLQr2wHX5sl63sWhRMYfaH85IEqEongGGKfd8=
X-Received: by 2002:a67:42c2:0:b0:3aa:31b2:ff09 with SMTP id
 p185-20020a6742c2000000b003aa31b2ff09mr45958514vsa.66.1670850482155; Mon, 12
 Dec 2022 05:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
 <4b6c5e90-4240-95c3-c27c-47fd81d24ae2@virtuozzo.com>
In-Reply-To: <4b6c5e90-4240-95c3-c27c-47fd81d24ae2@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 12 Dec 2022 15:07:51 +0200
Message-ID: <CAPMcbCrKQDJ0e=rsiXrQ_zeSQ0njH=ufaWPeijB8jhNc2pKefQ@mail.gmail.com>
Subject: Re: [PATCH] qga-win: replace libpcre with libpcre2 in MSI package
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-trivial@nongnu.org, den@virtuozzo.com, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007643de05efa1313c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--0000000000007643de05efa1313c
Content-Type: text/plain; charset="UTF-8"

Hi Andrey,

Unfortunately, I can't merge your patch as is.
There are several OS officially supported by QEMU that have GLib2 < 2.73.2
For example, we support Fedora 35 (GLib2 = 2.69.2) for cross-compilation and
we run CI tests on Fedora 35.

Also, currently, QEMU support GLib2 2.56 (
https://github.com/qemu/qemu/blob/ea3a008d2d9ced9c4f93871c823baee237047f93/configure#L1466
)
So, the build process should check the GLib2 version and select libpcre2 or
libpcre.

Best Regards,
Konstantin Kostiuk.


On Mon, Dec 12, 2022 at 2:23 PM Andrey Drobyshev <
andrey.drobyshev@virtuozzo.com> wrote:

> On 11/28/22 15:02, Andrey Drobyshev wrote:
> > According to GLib changelog [1], since version 2.73.2 GLib is using
> > libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
> > fails due to missing DLL.
> >
> > This commit makes wixl to put libpcre2-8-0.dll into the MSI bundle.
> >
> > [1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2
> >
> > Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
> > ---
> >  qga/installer/qemu-ga.wxs | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > [...]
>
> Ping
>
>

--0000000000007643de05efa1313c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andrey,</div><div><br></div><div>Unfortunately, I =
can&#39;t merge your patch as is.</div><div>There are several OS officially=
 supported by QEMU that have GLib2 &lt; 2.73.2</div><div>For example, we su=
pport Fedora 35 (GLib2 =3D 2.69.2) for cross-compilation and</div><div>we r=
un CI tests on Fedora 35.</div><div><br></div><div>Also, currently, QEMU su=
pport GLib2 2.56 (<a href=3D"https://github.com/qemu/qemu/blob/ea3a008d2d9c=
ed9c4f93871c823baee237047f93/configure#L1466">https://github.com/qemu/qemu/=
blob/ea3a008d2d9ced9c4f93871c823baee237047f93/configure#L1466</a>)</div><di=
v>So, the build process should check the GLib2 version and select libpcre2 =
or libpcre.</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Reg=
ards,</div><div>Konstantin Kostiuk.</div></div></div></div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Dec 12, 2022 at 2:23 PM Andrey Drobyshev &lt;<a href=3D"mailto:andrey.dro=
byshev@virtuozzo.com">andrey.drobyshev@virtuozzo.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/28/22 15:02, Andr=
ey Drobyshev wrote:<br>
&gt; According to GLib changelog [1], since version 2.73.2 GLib is using<br=
>
&gt; libpcre2 instead of libpcre.=C2=A0 As a result, qemu-ga MSI installati=
on<br>
&gt; fails due to missing DLL.<br>
&gt; <br>
&gt; This commit makes wixl to put libpcre2-8-0.dll into the MSI bundle.<br=
>
&gt; <br>
&gt; [1] <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/=
releases#2.73.2</a><br>
&gt; <br>
&gt; Signed-off-by: Andrey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev=
@virtuozzo.com" target=3D"_blank">andrey.drobyshev@virtuozzo.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qga/installer/qemu-ga.wxs | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; [...]<br>
<br>
Ping<br>
<br>
</blockquote></div>

--0000000000007643de05efa1313c--


