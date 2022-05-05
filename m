Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBE51BEE2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:10:22 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmaJJ-0000In-8q
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmaHy-0007vG-R8
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:08:58 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:39251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmaHw-00063C-HT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651752534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YHx1KEjhZ4K9FqQPleuM1J4a/oUo9RcjvZC6RMrsvZE=;
 b=LCMuMXG9F6mWGeJmo1ulz2Q/wBi9penejbNPlOfatLwO1L04zDHejg2kEJfpKKdvhU/GIn
 iVY1KP50fiDUID8m69ds5ygRPSYxueC9jYO4T1YolCoYWJZZYE7VXFkVVxZoGml/71aC9t
 hQchEl2ESQvDL+aZBGJInwK9rfHzjjI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-VAN3_cbIPTmRCnxMNHMuqQ-1; Thu, 05 May 2022 08:08:53 -0400
X-MC-Unique: VAN3_cbIPTmRCnxMNHMuqQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 q34-20020a9f37a5000000b0036283ee1147so1796856uaq.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 05:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHx1KEjhZ4K9FqQPleuM1J4a/oUo9RcjvZC6RMrsvZE=;
 b=vUj2AJMTb9X5FbFiv5CjQAsQLL496lGrI0/fIpmhnvefkVTfBQzD9EE1MxIdd5Ow6b
 go+/SBFvfEULGpGlpEhGcrPBouoLdjvXofGfQJjDJkxjMVpdMvf3EzmC5Te5r553Qi19
 TSWebl7SM/FmRptrxsFkqQoDWjaNJJ1yOPlrbvZ0xyx783emguwkyS5vP6YSO8lsm5OO
 Nfta7qf7x/8u6pY64U+/wd+OwaUEZ443n7oDr0uI5wmgHrRdPzloPxy7J4QaSdRXXNsf
 sX4MYZH7dv3eAriw7Lvxrs3Zje00CH6goyO443w4eV8qJMaqMPZFH0xI8/UT4ku4zuHR
 KJ2g==
X-Gm-Message-State: AOAM5339+wa9oisVmvIaE/EMIOc5PwjQPV09DsPDcoQoj7v7Iq+l/SpE
 wNURuNVOWzWyncgVeX23k+rFzn2gBc6Ll+owGHUzBSPK+C7B9Dpm9ur8faIucmI3tGaS/v3uDL1
 sa7m29DIoidSKoYt483yaWv0x2ssquQc=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr8157946vsr.11.1651752533141; 
 Thu, 05 May 2022 05:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhSvb4Eq5nwNBQqpdvC5wq5VteVtRs0YZOjT8jAfArgQQaejGD6qh37i27qOpVpLJEc6oMWg3QPLKeUmBWbAE=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr8157936vsr.11.1651752532985; Thu, 05
 May 2022 05:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
In-Reply-To: <YnOGJ+rUIn2S8ZOD@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 May 2022 08:08:42 -0400
Message-ID: <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
Subject: Re: iotests and python dependencies
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fc611205de429a8d"
Received-SPF: pass client-ip=170.10.133.74; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fc611205de429a8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022, 4:09 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Wed, May 04, 2022 at 03:38:45PM -0400, John Snow wrote:
> > Howdy!
> >
> > So, I want to finally delete python/qemu/qmp from qemu.git, and this
> > creates a small problem -- namely, iotests needs access to it in order
> > to run the python-based tests.
> >
> > What I think needs to happen is that we create a virtual environment
> > that installs python/qemu/. The reason this cannot be done with
> > PYTHONPATH alone anymore is because the qmp package itself won't be
> > there anymore, we need an installer like `pip` to actually fetch it
> > for us and put it somewhere. (i.e., we need to process the
> > dependencies of python/qemu now and can't treat it as a pre-installed
> > location.)
>
> Having pip fetch it on the fly creates a problem for RPM builds,
> because the koji build env has no network access. We will, however,
> have an RPM of python-qemu-qmp installed on the host system though.
> IOW we need to be able to run iotests using system python and its
> installed libs, not a virtual env.  So if we do anything with a
> virtual env, it will need to be optional I believe.
>

Hm, do we need iotests during an rpm build? Is it because of "make check"?

It's possible to create a venv and run pip in no-network mode, too. If the
package we want is installed on the system or otherwise in pip's cache,
it'll succeed without network. If the dependencies require a qemu.qmp
that's too new, the pip install will just fail instead.

I have to test a way to craft a pip statement that's network *optional*
though. i.e. try to fetch and fall back to local otherwise. I think it's
worth trying to keep the environment setup code unified, and always use a
venv.

I think this is tractable, though.

--000000000000fc611205de429a8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 5, 2022, 4:09 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, May 04, 2022 at 03:38:45P=
M -0400, John Snow wrote:<br>
&gt; Howdy!<br>
&gt; <br>
&gt; So, I want to finally delete python/qemu/qmp from qemu.git, and this<b=
r>
&gt; creates a small problem -- namely, iotests needs access to it in order=
<br>
&gt; to run the python-based tests.<br>
&gt; <br>
&gt; What I think needs to happen is that we create a virtual environment<b=
r>
&gt; that installs python/qemu/. The reason this cannot be done with<br>
&gt; PYTHONPATH alone anymore is because the qmp package itself won&#39;t b=
e<br>
&gt; there anymore, we need an installer like `pip` to actually fetch it<br=
>
&gt; for us and put it somewhere. (i.e., we need to process the<br>
&gt; dependencies of python/qemu now and can&#39;t treat it as a pre-instal=
led<br>
&gt; location.)<br>
<br>
Having pip fetch it on the fly creates a problem for RPM builds,<br>
because the koji build env has no network access. We will, however,<br>
have an RPM of python-qemu-qmp installed on the host system though.<br>
IOW we need to be able to run iotests using system python and its<br>
installed libs, not a virtual env.=C2=A0 So if we do anything with a<br>
virtual env, it will need to be optional I believe.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Hm, do we need iotests d=
uring an rpm build? Is it because of &quot;make check&quot;?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It&#39;s possible to create a venv an=
d run pip in no-network mode, too. If the package we want is installed on t=
he system or otherwise in pip&#39;s cache, it&#39;ll succeed without networ=
k. If the dependencies require a qemu.qmp that&#39;s too new, the pip insta=
ll will just fail instead.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I have to test a way to craft a pip statement that&#39;s network *option=
al* though. i.e. try to fetch and fall back to local otherwise. I think it&=
#39;s worth trying to keep the environment setup code unified, and always u=
se a venv.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think this =
is tractable, though.</div><div dir=3D"auto"><br></div></div>

--000000000000fc611205de429a8d--


