Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E031D693
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 09:29:58 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCIDd-0007nm-AJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 03:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCIBh-0006nj-PR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 03:27:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCIBf-0007mu-Q1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 03:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613550474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/sSB4R2yxQuyVzxDtMW3GmkV46mvkHl3to0/65/cdI=;
 b=HQN4jvXpQ/FDV1tCJOcW4rvXZc3Ol+HBeN6gNmKv7pkLv7vp1WkL7JgQxIWjLcHJjKFIBp
 h4kBB2obiRt0k84BGbiqYnYZ6/NLfw+mdxOImFjUV/3rIcUNM6pjNr5T/y71S5diPd57l8
 dyRPieGL5UQpdVUsmrwUgpLNo3Nt8jI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-myncUeWoOQWA81mxQQd7eQ-1; Wed, 17 Feb 2021 03:27:52 -0500
X-MC-Unique: myncUeWoOQWA81mxQQd7eQ-1
Received: by mail-il1-f197.google.com with SMTP id y12so9831625ilu.14
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 00:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u/sSB4R2yxQuyVzxDtMW3GmkV46mvkHl3to0/65/cdI=;
 b=BizYuDwKZk/yKX0cHQhnsZZ/6xRlHGS8iOxPVqgOVdFMRwSlKTVaT4s69Otgpqu0XY
 F5jmDlhL3nceEbByfP2jcWMVM+noiIOJZCLZVN9PviBsykSL5x+bhmMNTjoLG/uc1Sg9
 3d4E7cPkt+l7F7yw0ID4RNOptpiznIBvCISpZU42y/ZIauhquUZBPGa4ACjaPENCGiao
 bP6jMYMAqygb81YmxXfzDyWZWoFFZ9YFeZOjM3H+Zz26pss+kRwojAvilwRj4GyVaHjt
 mxwOAJB2BbM6SYtHRMLTP99schYc/KJvZhDBH6zlQXldfGf+KpyV8dp2f7mUw/by0TWS
 d4iQ==
X-Gm-Message-State: AOAM533n6ukK1yT66Ca0Gimgwqq50FYdEquV+S1OaHsOXYa/XNBWt1Zb
 sffFee0pszd353O9xkjH055qq2ylyU5jqFe3iTSr6NldG9XmP1JDacYZ94FLer6aE/lGZHh6AFo
 m82R/bnchLLUV5UTInOAElkq3zT8VeRE=
X-Received: by 2002:a02:1ac5:: with SMTP id 188mr14039360jai.71.1613550471658; 
 Wed, 17 Feb 2021 00:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPp2t2AcyLIeQAFWps0UGQDHdJ8ckOdaEB3Turnwm9lHVvpuTcU0O5sD2tkSG1LA8VcPxY6XUvTPquG4KRoqw=
X-Received: by 2002:a02:1ac5:: with SMTP id 188mr14039351jai.71.1613550471445; 
 Wed, 17 Feb 2021 00:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-21-marcandre.lureau@redhat.com>
 <87ft1wt1dv.fsf@linaro.org>
 <20210216174319.GA168121@localhost.localdomain>
In-Reply-To: <20210216174319.GA168121@localhost.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 17 Feb 2021 12:27:40 +0400
Message-ID: <CAMxuvayaijdaS_Ba8N+w02Q3xV5JZJ=hG1TysuPOLtyuZ2Cyrw@mail.gmail.com>
Subject: Re: [PATCH v2 20/20] tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ad994405bb83fe7b"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Hoffmann,
 Gerd" <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad994405bb83fe7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 16, 2021 at 9:43 PM Cleber Rosa <crosa@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 04:34:06PM +0000, Alex Benn=C3=A9e wrote:
> >
> > marcandre.lureau@redhat.com writes:
> >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > This will check virtio/vhost-user-vga & virgl are correctly initializ=
ed
> > > by the Linux kernel on an egl-headless display.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  tests/acceptance/virtio-gpu.py | 161 +++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 161 insertions(+)
> > >  create mode 100644 tests/acceptance/virtio-gpu.py
> >
> > This failed when I got to master:
> >
> >   2021-02-16 14:33:46,266 qmp              L0255 DEBUG| >>> {'execute':
> 'qmp_capabilities'}
> >   2021-02-16 14:33:46,441 machine          L0385 DEBUG| Error launching
> VM
> >   2021-02-16 14:33:46,441 machine          L0387 DEBUG| Command:
> './qemu-system-x86_64 -display none -vga none -chardev
> socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu
> >   -29492-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -chardev
> socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu-29492-con=
sole.sock,server=3Don,wait=3Doff
> -serial chardev:
> >   console -cpu host -m 2G -machine pc,accel=3Dkvm -device
> virtio-vga,virgl=3Don -display egl-headless -kernel
> /home/alex.bennee/avocado/data/cache/by_location/892ae21f3ae7d04994d8
> >   1e1c0bf204ecebe555bb/vmlinuz -initrd
> /home/alex.bennee/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c=
0bf204ecebe555bb/initrd.img
> -append printk.time=3D0 console=3DttyS0
> >    rdinit=3D/bin/bash'
> >   2021-02-16 14:33:46,441 machine          L0389 DEBUG| Output:
> "qemu-system-x86_64: -device virtio-vga,virgl=3Don: Property
> 'virtio-vga.virgl' not found\n"
> >   2021-02-16 14:33:46,441 stacktrace       L0039 ERROR|
> >
> > I'm going to assume this is because the beefy server I was building on
> > didn't have the VirGL headers to enable this feature. In lieu of featur=
e
> > probing you might have to do what I did for the plugins test:
> >
> >         try:
> >             vm.launch()
> >         except:
> >             # TODO: probably fails because plugins not enabled but we
> >             # can't currently probe for the feature.
> >             self.cancel("TCG Plugins not enabled?")
> >
> >
>
> While this pattern is indeed an improvement over test errors, checking
> for "build time features" is far from a new testing requirement, and
> its still not properly solved.  A long time ago I proposed a way to
> look at the Makefile variables during test time, but it had a number
> of shortcomings.  I guess it's now time to revisit this issue.
>
> First, I'm a strong believer in limiting the *probing* that the test itse=
lf
> does with regards to build time features.  The probing and authoritative
> information should already be with the build system.  I'm pretty sure tha=
t
> meson makes it easy to grab that kind of information.
>
> Once it's understood and agreed that the build system will provide
> that information, the question becomes whether tests will get that
> information from the build system (and thus require a build tree) or
> if that information will be persisted in the QEMU binary and be
> available for introspection.
>
> Thoughts? Does this sound like something other people would be
> interested in?
>

It would be more reliable and flexible to do runtime introspection. It
would allow installed tests, and some runtime checks for example.

Given the variability of builds, is there something that does introspection
in avocado-vt already?  I think we could rely on qmp introspection,
qom-list-types etc.

In the meantime Alex, could you send a patch to ignore the test the way you
propose?

--000000000000ad994405bb83fe7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16, 2021 at 9:43 PM Cle=
ber Rosa &lt;<a href=3D"mailto:crosa@redhat.com">crosa@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Fe=
b 16, 2021 at 04:34:06PM +0000, Alex Benn=C3=A9e wrote:<br>
&gt; <br>
&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marca=
ndre.lureau@redhat.com</a> writes:<br>
&gt; <br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This will check virtio/vhost-user-vga &amp; virgl are correctly i=
nitialized<br>
&gt; &gt; by the Linux kernel on an egl-headless display.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/acceptance/virtio-gpu.py | 161 ++++++++++++++++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 161 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 tests/acceptance/virtio-gpu.py<br>
&gt; <br>
&gt; This failed when I got to master:<br>
&gt; <br>
&gt;=C2=A0 =C2=A02021-02-16 14:33:46,266 qmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 L0255 DEBUG| &gt;&gt;&gt; {&#39;execute&#39;: &#39;qmp_ca=
pabilities&#39;}<br>
&gt;=C2=A0 =C2=A02021-02-16 14:33:46,441 machine=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 L0385 DEBUG| Error launching VM<br>
&gt;=C2=A0 =C2=A02021-02-16 14:33:46,441 machine=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 L0387 DEBUG| Command: &#39;./qemu-system-x86_64 -display none -vga =
none -chardev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu<b=
r>
&gt;=C2=A0 =C2=A0-29492-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -cha=
rdev socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu-29492-=
console.sock,server=3Don,wait=3Doff -serial chardev:<br>
&gt;=C2=A0 =C2=A0console -cpu host -m 2G -machine pc,accel=3Dkvm -device vi=
rtio-vga,virgl=3Don -display egl-headless -kernel /home/alex.bennee/avocado=
/data/cache/by_location/892ae21f3ae7d04994d8<br>
&gt;=C2=A0 =C2=A01e1c0bf204ecebe555bb/vmlinuz -initrd /home/alex.bennee/avo=
cado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ecebe555bb/initrd=
.img -append printk.time=3D0 console=3DttyS0<br>
&gt;=C2=A0 =C2=A0 rdinit=3D/bin/bash&#39;<br>
&gt;=C2=A0 =C2=A02021-02-16 14:33:46,441 machine=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 L0389 DEBUG| Output: &quot;qemu-system-x86_64: -device virtio-vga,v=
irgl=3Don: Property &#39;virtio-vga.virgl&#39; not found\n&quot;<br>
&gt;=C2=A0 =C2=A02021-02-16 14:33:46,441 stacktrace=C2=A0 =C2=A0 =C2=A0 =C2=
=A0L0039 ERROR|<br>
&gt; <br>
&gt; I&#39;m going to assume this is because the beefy server I was buildin=
g on<br>
&gt; didn&#39;t have the VirGL headers to enable this feature. In lieu of f=
eature<br>
&gt; probing you might have to do what I did for the plugins test:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO: probably fails =
because plugins not enabled but we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# can&#39;t currently p=
robe for the feature.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cancel(&quot;TCG P=
lugins not enabled?&quot;)<br>
&gt; <br>
&gt;<br>
<br>
While this pattern is indeed an improvement over test errors, checking<br>
for &quot;build time features&quot; is far from a new testing requirement, =
and<br>
its still not properly solved.=C2=A0 A long time ago I proposed a way to<br=
>
look at the Makefile variables during test time, but it had a number<br>
of shortcomings.=C2=A0 I guess it&#39;s now time to revisit this issue.<br>
<br>
First, I&#39;m a strong believer in limiting the *probing* that the test it=
self<br>
does with regards to build time features.=C2=A0 The probing and authoritati=
ve<br>
information should already be with the build system.=C2=A0 I&#39;m pretty s=
ure that<br>
meson makes it easy to grab that kind of information.<br>
<br>
Once it&#39;s understood and agreed that the build system will provide<br>
that information, the question becomes whether tests will get that<br>
information from the build system (and thus require a build tree) or<br>
if that information will be persisted in the QEMU binary and be<br>
available for introspection.<br>
<br>
Thoughts? Does this sound like something other people would be<br>
interested in?<br></blockquote><div><br></div><div>It would be more reliabl=
e and flexible to do runtime introspection. It would allow installed tests,=
 and some runtime checks for example.</div><div><br></div><div>Given the va=
riability of builds, is there something that does introspection in avocado-=
vt already?=C2=A0 I think we could rely on qmp introspection, qom-list-type=
s etc.<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">In the meantime Alex, could you send a patch to ignore the test =
the way you propose?<br></div></div>

--000000000000ad994405bb83fe7b--


