Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD16031DA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:59:13 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqrw-0002Cx-52
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1okqif-0005XQ-V9
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1okqiY-0005yS-7k
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666115365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xWnVFIgbeEugTo1A8TgQsdBXRJ+oLpA8nC4OC5+UCos=;
 b=SEXtF2I40oRS90ZDXQXanSJpxjoeygO2oPZ1UMu+wQAtAoODoBxCjtp4HxKhyLnvuJOggo
 BZWpi/D8m76+qAEjdgM+yWOLH/D4pLk4V0FgEKzTmmYyw+h79rDEZRHE1OeCq2rUSmv83w
 RJOEW7k6mx+CQYjbsQIhX4TIiR6/GxE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-igcQS94QN-etrMzMHNuArA-1; Tue, 18 Oct 2022 13:49:24 -0400
X-MC-Unique: igcQS94QN-etrMzMHNuArA-1
Received: by mail-lj1-f199.google.com with SMTP id
 h21-20020a2ea495000000b0026dffd0733aso6343458lji.7
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 10:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWnVFIgbeEugTo1A8TgQsdBXRJ+oLpA8nC4OC5+UCos=;
 b=pSKqT3aj4n89kx+nTJJNF3OPdZprDFAlTOacFQJ8fetVlviU0i5mzaJyU6ihRLB7D8
 XFObOFBj/EME2txspAw+WwVwI53c3XyORd+NOE7rBmCwWYN8Ov10GTYIny62cb/jrKYs
 3lDoqcjqkup5IlkEs8RjQ/AcrzfklhOARd3ZRVEfLHqQ6zqHo2nQVeevfso1YDBP36QM
 h38CGkgHqikn7ddwev7sasBLJlp2dVkPEhw432pptKZer/1pfsfDeGcuCLqTzlzYUOaN
 fV0lmEBYsb2iTyuq99wwbNl3dQdy10sU21CwGIq4CJrJ0Cd4bxyoKTgGKM0fQ2mK93Vd
 P5xg==
X-Gm-Message-State: ACrzQf1ho0DIDe7pE7MZt/kBTElHTbW4o/1vNufTcr7Cs0ucq3JtrFLG
 8/UBqnqWSujuH4eDIVsLnTwgrRXK1rd2TG9Mq1u2BBYktP6BT2EOpZWkAcCC1b3NDVx6hF0KgWD
 dgbbrONpXLJ7kIiHHCDagJklrWfs+J0g=
X-Received: by 2002:a05:651c:1617:b0:26d:fbc6:edf with SMTP id
 f23-20020a05651c161700b0026dfbc60edfmr1596577ljq.453.1666115362247; 
 Tue, 18 Oct 2022 10:49:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7L8nuHpN0un9TV/MqxAxTcB/bc6RxWWHmsJWExAE40Z0vY6AOmB03MDrDdqzHOPAKVeaM1J16XgJB4FvUuZl4=
X-Received: by 2002:a05:651c:1617:b0:26d:fbc6:edf with SMTP id
 f23-20020a05651c161700b0026dfbc60edfmr1596562ljq.453.1666115361879; Tue, 18
 Oct 2022 10:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <CAMRbyytLUsHYxB6AHscz-e7T6vV76g=Oau-wGEaGa8kwekAshw@mail.gmail.com>
In-Reply-To: <CAMRbyytLUsHYxB6AHscz-e7T6vV76g=Oau-wGEaGa8kwekAshw@mail.gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 18 Oct 2022 20:49:05 +0300
Message-ID: <CAMRbyyugGBWcQgpwTgARcf9YPgrKAXj=6K+h4ZkpZeA1CTwBpQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add qemu-img checksum command using blkhash
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004cd65405eb52b657"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004cd65405eb52b657
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 12:35 PM Nir Soffer <nsoffer@redhat.com> wrote:

> ping
>
> Kevin, Hanna, I hope you have time to take a look.
>
> https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00021.html


Ping again, hopefully someone has time to look at this :-)


>
>
>
> On Thu, Sep 1, 2022 at 5:32 PM Nir Soffer <nsoffer@redhat.com> wrote:
> >
> > Since blkhash is available only via copr now, the new command is added as
> > optional feature, built only if blkhash-devel package is installed.
> >
> > Nir Soffer (3):
> >   qemu-img: Add checksum command
> >   iotests: Test qemu-img checksum
> >   qemu-img: Speed up checksum
> >
> >  docs/tools/qemu-img.rst                       |  22 +
> >  meson.build                                   |  10 +-
> >  meson_options.txt                             |   2 +
> >  qemu-img-cmds.hx                              |   8 +
> >  qemu-img.c                                    | 388 ++++++++++++++++++
> >  tests/qemu-iotests/tests/qemu-img-checksum    | 149 +++++++
> >  .../qemu-iotests/tests/qemu-img-checksum.out  |  74 ++++
> >  7 files changed, 652 insertions(+), 1 deletion(-)
> >  create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
> >  create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out
> >
> > --
> > 2.37.2
> >
>

--0000000000004cd65405eb52b657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Sep 18, 2022 at 12:35 PM Nir Soff=
er &lt;<a href=3D"mailto:nsoffer@redhat.com">nsoffer@redhat.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">ping<br>
<br>
Kevin, Hanna, I hope you have time to take a look.<br>
<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg0002=
1.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-block/2022-09/msg00021.html</a></blockquote><div><br></div><di=
v>Ping again, hopefully someone=C2=A0has time to look at this :-)</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
<br>
On Thu, Sep 1, 2022 at 5:32 PM Nir Soffer &lt;<a href=3D"mailto:nsoffer@red=
hat.com" target=3D"_blank">nsoffer@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Since blkhash is available only via copr now, the new command is added=
 as<br>
&gt; optional feature, built only if blkhash-devel package is installed.<br=
>
&gt;<br>
&gt; Nir Soffer (3):<br>
&gt;=C2=A0 =C2=A0qemu-img: Add checksum command<br>
&gt;=C2=A0 =C2=A0iotests: Test qemu-img checksum<br>
&gt;=C2=A0 =C2=A0qemu-img: Speed up checksum<br>
&gt;<br>
&gt;=C2=A0 docs/tools/qemu-img.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
&gt;=C2=A0 qemu-img-cmds.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<=
br>
&gt;=C2=A0 qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 388 ++++++++++++++++++<br>
&gt;=C2=A0 tests/qemu-iotests/tests/qemu-img-checksum=C2=A0 =C2=A0 | 149 ++=
+++++<br>
&gt;=C2=A0 .../qemu-iotests/tests/qemu-img-checksum.out=C2=A0 |=C2=A0 74 ++=
++<br>
&gt;=C2=A0 7 files changed, 652 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum<br=
>
&gt;=C2=A0 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.ou=
t<br>
&gt;<br>
&gt; --<br>
&gt; 2.37.2<br>
&gt;<br>
</blockquote></div></div>

--0000000000004cd65405eb52b657--


