Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E0B53660C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:37:04 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucxT-000401-HL
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nucVY-00083C-Sv
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nucVV-0007dw-9W
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653667687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CxeDeVE1UqlhXT1jWUlCSfC9pV+Pd1QLuIyuj4SMZiA=;
 b=etKc0YJNL8E3zIiin3lGIj2ziaXEkTs4Fhk3FPOwSv8XNwqg5qu5BVUbFaOx0Zv+k384Mu
 NtuZgW+5/VB3u8Q5LBt7jEhRkr1UEHkGLz+RBv57ngAo+g6arYELdIKywDmjm7AWQyegVA
 UyfONlTepBhjF4hRt2Cop10+GCk+cYA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-5yVVjWJ3M4-I39xGXM1mGA-1; Fri, 27 May 2022 12:08:06 -0400
X-MC-Unique: 5yVVjWJ3M4-I39xGXM1mGA-1
Received: by mail-ua1-f71.google.com with SMTP id
 x5-20020ab06405000000b003687fa76136so2402263uao.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CxeDeVE1UqlhXT1jWUlCSfC9pV+Pd1QLuIyuj4SMZiA=;
 b=t5KVkBTjBRyDA1JPUTyfJzjcMtsuq22rtC689Kg9A8edZdIDQ6qN1eo+hTBDsU193J
 AfGe6+WJQTTZtGCgwOjtAtW81pY0Ohoc9B0qx8hx19eXKkyz/6hvHewwjlFSIzy9hxrr
 LxMcaIwL7odfZ9TjGb06zICcYlObq7Ao2+aKS8/601RvMLjFnkdmbE4fZUFiKaZZFAId
 WqHH6j9wY5sjp0ra8c2Cpo4VroyxNEl4Y3G6+7dAJY/BA3m9GXy47zx+fCTJyXJXN/xN
 l5X6GgCtByetiW6NT4aPr4eM0vR3HNlgTyCpEYsdaqDpMlBxXbVva3it0P1T4I8NVW6P
 1fcg==
X-Gm-Message-State: AOAM532EOFYJ9UY6rsmQsax6s3Y7g4tbFYqRRqBxPj3cHBm/OQQSwJEr
 zR6ORG33+9ZHnk5DvM7l/hkNdQAnyDJmTwmFoTPzUZLknEldBtPtZEwg9OyAS/eBwG0mtVW7Wvw
 +L1GwYNyMV+CDrUBAxyiCjCCvNtqMJLk=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr18234258vsa.38.1653667685826; 
 Fri, 27 May 2022 09:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw98e8V+vJ22btYjexWxHtB++0BfXsiuHB7p3wNHxpeHsJQ69ZmcFNlxImQMc4q13E2gZaAwE3etyO+AWlL4UQ=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr18234236vsa.38.1653667685626; Fri, 27
 May 2022 09:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220527094758.604621-1-berrange@redhat.com>
 <YpCl9/EMwenZUxJs@angien.pipo.sk> <YpC25tpAEdn6BoXl@redhat.com>
In-Reply-To: <YpC25tpAEdn6BoXl@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 27 May 2022 12:07:55 -0400
Message-ID: <CAFn=p-amy1sodeChaQvpVLwe_-L7pDAa4C9-JywdCu37VEWGBw@mail.gmail.com>
Subject: Re: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, libvir-list@redhat.com, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fa8d1d05e0008259"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

--000000000000fa8d1d05e0008259
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2022, 7:32 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, May 27, 2022 at 12:20:39PM +0200, Peter Krempa wrote:
> > On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrang=C3=A9 wrote:
> > > Libvirt provides QMP passthrough APIs for the QEMU driver and these a=
re
> > > exposed in virsh. It is not especially pleasant, however, using the r=
aw
> > > QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> > > exposes a human friendly interactive shell. It is not possible to use
> > > this with libvirt managed guest, however, since only one client can
> > > attach to he QMP socket at any point in time.
> > >
> > > The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> > > socket and listens for incoming client connections, speaking QMP on
> > > the connected socket. It will forward any QMP commands received onto
> > > the running libvirt QEMU guest, and forward any replies back to the
> > > QMP client.
> > >
> > >   $ virsh start demo
> > >   $ virt-qmp-proxy demo demo.qmp &
> > >   $ qmp-shell demo.qmp
> > >   Welcome to the QMP low-level shell!
> > >   Connected to QEMU 6.2.0
> > >
> > >   (QEMU) query-kvm
> > >   {
> > >       "return": {
> > >           "enabled": true,
> > >           "present": true
> > >       }
> > >   }
> > >
> > > Note this tool of course has the same risks as the raw libvirt
> > > QMP passthrough. It is safe to run query commands to fetch informatio=
n
> > > but commands which change the QEMU state risk disrupting libvirt's
> > > management of QEMU, potentially resulting in data loss/corruption in
> > > the worst case.
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> > >
> > > CC'ing QEMU since this is likely of interest to maintainers and users
> > > who work with QEMU and libvirt
> > >
> > > Note this impl is fairly crude in that it assumes it is receiving
> > > the QMP commands linewise one at a time. None the less it is good
> > > enough to work with qmp-shell already, so I figured it was worth
> > > exposing to the world. It also lacks support for forwarding events
> > > back to the QMP client.
> >
> > I originally wanted to teach the qemu tools to work with libvirt
> > directly similarly how 'scripts/render_block_graph.py' from the qemu
> > tree already does but I guess this is also an option.
>
> Yes, I do wonder about whether with John's new QMP python APIs,
> it would be possible to plug in a livirt transport instead of
> the socket transport. I've not spent enough time looking at the
> Python QMP code to know if that's viable or not though.
>

I can look into it. It looks like render_block_graph works by actually
executing a subprocess. Is there a chance of getting anything socket-like
or stream-like out of libvirt to work with instead?

As long as I can get some kind of stream going it should be easily possible
to just replace the fd(s) the qmp lib uses and talk to libvirt instead.

(possibly with changing some details about the handshake, yadda yadda.)


> > This is an option too albeit a bit more complex to set up, but on the
> > other hand a bit more universal.
>
> The two approaches aren't mutually exclusive either. There's no
> reason we can't have both options.


I've in the past thought about implementing MITM directly in the qmp
library. I wrote a QMPServer() class that I did not check in upstream
because it is only prototype quality, but I used it for testing. I still
have plans to upstream it because it is useful for the test suite.

It has the same limitation as a lot of our Python tools have, though; it
requires newlines because it doesn't have a streaming parser ...

It's been something that I want to improve upon, but since libvirt is
well-behaved and sends newlines, I haven't been properly motivated to.

--000000000000fa8d1d05e0008259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 27, 2022, 7:32 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, May 27, 2022 at 12:20:39=
PM +0200, Peter Krempa wrote:<br>
&gt; On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrang=C3=A9 wrote:=
<br>
&gt; &gt; Libvirt provides QMP passthrough APIs for the QEMU driver and the=
se are<br>
&gt; &gt; exposed in virsh. It is not especially pleasant, however, using t=
he raw<br>
&gt; &gt; QMP JSON syntax. QEMU has a tool &#39;qmp-shell&#39; which can sp=
eak QMP and<br>
&gt; &gt; exposes a human friendly interactive shell. It is not possible to=
 use<br>
&gt; &gt; this with libvirt managed guest, however, since only one client c=
an<br>
&gt; &gt; attach to he QMP socket at any point in time.<br>
&gt; &gt; <br>
&gt; &gt; The virt-qmp-proxy tool aims to solve this problem. It opens a UN=
IX<br>
&gt; &gt; socket and listens for incoming client connections, speaking QMP =
on<br>
&gt; &gt; the connected socket. It will forward any QMP commands received o=
nto<br>
&gt; &gt; the running libvirt QEMU guest, and forward any replies back to t=
he<br>
&gt; &gt; QMP client.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0$ virsh start demo<br>
&gt; &gt;=C2=A0 =C2=A0$ virt-qmp-proxy demo demo.qmp &amp;<br>
&gt; &gt;=C2=A0 =C2=A0$ qmp-shell demo.qmp<br>
&gt; &gt;=C2=A0 =C2=A0Welcome to the QMP low-level shell!<br>
&gt; &gt;=C2=A0 =C2=A0Connected to QEMU 6.2.0<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0(QEMU) query-kvm<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;return&quot;: {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;enabled&quot;: true=
,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;present&quot;: true=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt; <br>
&gt; &gt; Note this tool of course has the same risks as the raw libvirt<br=
>
&gt; &gt; QMP passthrough. It is safe to run query commands to fetch inform=
ation<br>
&gt; &gt; but commands which change the QEMU state risk disrupting libvirt&=
#39;s<br>
&gt; &gt; management of QEMU, potentially resulting in data loss/corruption=
 in<br>
&gt; &gt; the worst case.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berr=
ange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</=
a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; CC&#39;ing QEMU since this is likely of interest to maintainers a=
nd users<br>
&gt; &gt; who work with QEMU and libvirt<br>
&gt; &gt; <br>
&gt; &gt; Note this impl is fairly crude in that it assumes it is receiving=
<br>
&gt; &gt; the QMP commands linewise one at a time. None the less it is good=
<br>
&gt; &gt; enough to work with qmp-shell already, so I figured it was worth<=
br>
&gt; &gt; exposing to the world. It also lacks support for forwarding event=
s<br>
&gt; &gt; back to the QMP client.<br>
&gt; <br>
&gt; I originally wanted to teach the qemu tools to work with libvirt<br>
&gt; directly similarly how &#39;scripts/render_block_graph.py&#39; from th=
e qemu<br>
&gt; tree already does but I guess this is also an option.<br>
<br>
Yes, I do wonder about whether with John&#39;s new QMP python APIs,<br>
it would be possible to plug in a livirt transport instead of<br>
the socket transport. I&#39;ve not spent enough time looking at the<br>
Python QMP code to know if that&#39;s viable or not though.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I can look into =
it. It looks like render_block_graph works by actually executing a subproce=
ss. Is there a chance of getting anything socket-like or stream-like out of=
 libvirt to work with instead?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">As long as I can get some kind of stream going it should be easily p=
ossible to just replace the fd(s) the qmp lib uses and talk to libvirt inst=
ead.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(possibly with chan=
ging some details about the handshake, yadda yadda.)</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; This is an option too albeit a bit more complex to set up, but on the<=
br>
&gt; other hand a bit more universal.<br>
<br>
The two approaches aren&#39;t mutually exclusive either. There&#39;s no<br>
reason we can&#39;t have both options.</blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I&#39;ve in the past thought about implem=
enting MITM directly in the qmp library. I wrote a QMPServer() class that I=
 did not check in upstream because it is only prototype quality, but I used=
 it for testing. I still have plans to upstream it because it is useful for=
 the test suite.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It has =
the same limitation as a lot of our Python tools have, though; it requires =
newlines because it doesn&#39;t have a streaming parser ...</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It&#39;s been something that I want t=
o improve upon, but since libvirt is well-behaved and sends newlines, I hav=
en&#39;t been properly motivated to.</div><div dir=3D"auto"><br></div></div=
>

--000000000000fa8d1d05e0008259--


