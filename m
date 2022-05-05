Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CD51C053
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:13:44 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbId-00081m-JI
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmbFd-0005lx-1f
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:10:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:52773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmbFb-00078K-CN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651756234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KK4ZgQWi881h7PKcOdKlPtDMl5tWsHYTycfuP2LbfIU=;
 b=C8CVD4K9OrK3ASflZRPXytbC+sh7Ni8CirX42DO5TkWJ4uOIrGW+yjY9Ma3Kaw764/WShb
 FNawBXBqxOZE82Ged5AmlQb1oJdNi0cOSDCRnzCvMrmChGlJvcoy/GlTvIsrHZsCzAHNQC
 5tlgLA+PP3CYjoIzvxURO4QZrWhRckc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-s-P8IzxoPielY1oQ8C93gA-1; Thu, 05 May 2022 09:10:28 -0400
X-MC-Unique: s-P8IzxoPielY1oQ8C93gA-1
Received: by mail-ua1-f69.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so1869691uaa.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KK4ZgQWi881h7PKcOdKlPtDMl5tWsHYTycfuP2LbfIU=;
 b=Atlguq7n2ZbqiIFEbD2BrrwDj5yBKmQ/6slTGSeINOKt0B4LX7MNHPqCms4h8pZr65
 4N4WeeqYXa3+YkqqyzxI0shhtUW/bS/iT8P+nsaafMui+fv1WW0tVI6zqWAGqIdQCS3j
 MoOP6PxtIoSwFp4zvcvwHmJEDPckeQRxccIGlZPscgcW3908X99dlND1WC/SD6Whg+CV
 ua5bOGqmK7EjTdjdYN/rnJTp/+vcwXFc0+AedGY1GqGEMbn0aghVaIlEx8xW3oR0liHm
 DbcZvjZQ4E61jme1nQMiB0qd0oMu0YAMNbTI/59ulSZ7yEM/paKDY45Bq4ICKSR0sc/D
 NckQ==
X-Gm-Message-State: AOAM530rEsZJhw27vp0XqkRcE8OOxt6An+MH2lhveuNhTpxUoyhto7x0
 OfXslTKIaWItwSOs3d6f9Xye7d7PWFiLu/wqVUbgOsQDmSdx9m8aU+mmN5c/RzS33CkUcrNgJhS
 MCHajFf+w+6taoUQJzoBxGIHK0JJpOxA=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr8279286vsr.11.1651756227890; 
 Thu, 05 May 2022 06:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf2Ng21vuiw7p3ufFtvYaH8kGBJH7YjuKu4GPfOfGygxi+DjqjlDiJTI6Tjisx70qHyTiN5FpTZBGl/+ZePg4=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr8279273vsr.11.1651756227619; Thu, 05
 May 2022 06:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
In-Reply-To: <YnPEGrwa9KVyup6T@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 May 2022 09:10:17 -0400
Message-ID: <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
Subject: Re: iotests and python dependencies
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034054c05de4377a8"
Received-SPF: pass client-ip=170.10.129.74; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--00000000000034054c05de4377a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022, 8:33 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Thu, May 05, 2022 at 08:08:42AM -0400, John Snow wrote:
> > On Thu, May 5, 2022, 4:09 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> wrote:
> >
> > > On Wed, May 04, 2022 at 03:38:45PM -0400, John Snow wrote:
> > > > Howdy!
> > > >
> > > > So, I want to finally delete python/qemu/qmp from qemu.git, and thi=
s
> > > > creates a small problem -- namely, iotests needs access to it in
> order
> > > > to run the python-based tests.
> > > >
> > > > What I think needs to happen is that we create a virtual environmen=
t
> > > > that installs python/qemu/. The reason this cannot be done with
> > > > PYTHONPATH alone anymore is because the qmp package itself won't be
> > > > there anymore, we need an installer like `pip` to actually fetch it
> > > > for us and put it somewhere. (i.e., we need to process the
> > > > dependencies of python/qemu now and can't treat it as a pre-install=
ed
> > > > location.)
> > >
> > > Having pip fetch it on the fly creates a problem for RPM builds,
> > > because the koji build env has no network access. We will, however,
> > > have an RPM of python-qemu-qmp installed on the host system though.
> > > IOW we need to be able to run iotests using system python and its
> > > installed libs, not a virtual env.  So if we do anything with a
> > > virtual env, it will need to be optional I believe.
> > >
> >
> > Hm, do we need iotests during an rpm build? Is it because of "make
> check"?
>
> Yes, and this is good, because it prevents us from outputting an
> RPM build that has a broken QEMU in it.


Guess this means I need to make a Fedora package too, though. My hubris.

OK, plenty of work to do.

--00000000000034054c05de4377a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 5, 2022, 8:33 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferr=
er">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Thu, May 05, 2022 at 08:08:42AM -0400, John Snow wrote:<br>
&gt; On Thu, May 5, 2022, 4:09 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"ma=
ilto:berrange@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">b=
errange@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, May 04, 2022 at 03:38:45PM -0400, John Snow wrote:<br>
&gt; &gt; &gt; Howdy!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So, I want to finally delete python/qemu/qmp from qemu.git, =
and this<br>
&gt; &gt; &gt; creates a small problem -- namely, iotests needs access to i=
t in order<br>
&gt; &gt; &gt; to run the python-based tests.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What I think needs to happen is that we create a virtual env=
ironment<br>
&gt; &gt; &gt; that installs python/qemu/. The reason this cannot be done w=
ith<br>
&gt; &gt; &gt; PYTHONPATH alone anymore is because the qmp package itself w=
on&#39;t be<br>
&gt; &gt; &gt; there anymore, we need an installer like `pip` to actually f=
etch it<br>
&gt; &gt; &gt; for us and put it somewhere. (i.e., we need to process the<b=
r>
&gt; &gt; &gt; dependencies of python/qemu now and can&#39;t treat it as a =
pre-installed<br>
&gt; &gt; &gt; location.)<br>
&gt; &gt;<br>
&gt; &gt; Having pip fetch it on the fly creates a problem for RPM builds,<=
br>
&gt; &gt; because the koji build env has no network access. We will, howeve=
r,<br>
&gt; &gt; have an RPM of python-qemu-qmp installed on the host system thoug=
h.<br>
&gt; &gt; IOW we need to be able to run iotests using system python and its=
<br>
&gt; &gt; installed libs, not a virtual env.=C2=A0 So if we do anything wit=
h a<br>
&gt; &gt; virtual env, it will need to be optional I believe.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hm, do we need iotests during an rpm build? Is it because of &quot;mak=
e check&quot;?<br>
<br>
Yes, and this is good, because it prevents us from outputting an<br>
RPM build that has a broken QEMU in it.</blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Guess this means I need to make a Fedora=
 package too, though. My hubris.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">OK, plenty of work to do.</div></div>

--00000000000034054c05de4377a8--


