Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9FB40D833
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 13:14:14 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQpLJ-0003XT-QL
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 07:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mQpJT-0001pi-Bs
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mQpJO-0008UQ-K5
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631790732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3J1ugic6Hem6O5X8OyjFLykx+bJjOgmZF8mTcHIG0Lg=;
 b=Wxp8BPseXL1uHNci2wkkySk4TDlBCfXPi8Hl1oP2cSui7aKxc6pAB2djWGg4LhPKKvAS4K
 iwOtvv02x9nAPUJ7Re+m9LJ8UyN9jLt4IxoVyHhjuM+ITKdUolSyQzXkuhT1b4xF5q0zxk
 HZUxRyKZL1wypr2D79+rfoIZV4qweEc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-TYjgtjJXO6WySK1BOYIwqg-1; Thu, 16 Sep 2021 07:12:08 -0400
X-MC-Unique: TYjgtjJXO6WySK1BOYIwqg-1
Received: by mail-pf1-f198.google.com with SMTP id
 x190-20020a6263c7000000b0044034f4928fso3600277pfb.20
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 04:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3J1ugic6Hem6O5X8OyjFLykx+bJjOgmZF8mTcHIG0Lg=;
 b=eRZc+LuiYqCI/Ipar50Y6qqWNspebHlE8r4CQmdOJ88bJoj3t5zGAX+nHUPEXR+0H2
 TC0dHrhIdN9lAvEn6D34SH7Tj6shoAkpZkv9iOxQ/SOvqPhhd66AnwWD7ZMBakDsiQ2B
 xgzaAmOA3qegY0Fr2MeS/CpklMO6RC0JTDs5l0Aq722f++BN9A42xymIc228waIlM7ys
 vdV0Xj98m6LlqNW7mrZj/lYNE3dmdXoGrMwgYwy/Hdk1Wk1O24ikXepyg5spdvb6kvyI
 PsvVLkqdueN5+/kbNlBVKbhnfOWAdVG3C894mkLB5SSgMY+X7WVWEIwJo7q2/eqz1VaA
 4SGg==
X-Gm-Message-State: AOAM533YNZytlSNnwWcIM4PHAMnSHfakOj3BvE1vsB10WJYPFSouNL2B
 5rZjSEcfyjR0pr61y+2+ieFiUzuQgV47wTXGa0FNhc/3c+epEq3AzgxhrBpmNIk03WTzC7dcXtu
 eYzxS5BaBjlAMSuzwvZAHFqn1eFQrfxU=
X-Received: by 2002:a17:902:e743:b0:13a:eb0:d124 with SMTP id
 p3-20020a170902e74300b0013a0eb0d124mr4249998plf.38.1631790727583; 
 Thu, 16 Sep 2021 04:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv4ttShan4nvbScfaf1GeoTDeLKeisr96hADAHDIWSJtaW0+uqjpH69a1CN5qU/QPdkxdS6iVLjhFkcLL5o5o=
X-Received: by 2002:a17:902:e743:b0:13a:eb0:d124 with SMTP id
 p3-20020a170902e74300b0013a0eb0d124mr4249975plf.38.1631790727269; Thu, 16 Sep
 2021 04:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210902212015.1303865-1-dje@google.com>
 <875yvi2sh2.fsf@dusky.pond.sub.org>
 <CADPb22TrHzujCONPAqdTcOYWNw2YtdKn+vPnitL7eU2hJJNDNg@mail.gmail.com>
 <87lf4crh4s.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf4crh4s.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 16 Sep 2021 15:11:56 +0400
Message-ID: <CAMxuvazQTjhxF3ULDA2X2C5Ub92jxMe2HpqZzGUU7kJEFuS3ng@mail.gmail.com>
Subject: Re: [PATCH] net: Add "info neighbors" command
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a5a8f105cc1ae247"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a5a8f105cc1ae247
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Sep 4, 2021 at 10:26 AM Markus Armbruster <armbru@redhat.com> wrote=
:

> Doug Evans <dje@google.com> writes:
>
> > On Fri, Sep 3, 2021 at 6:08 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Doug Evans <dje@google.com> writes:
> >>
> >> > This command dumps the ARP and NDP tables maintained within slirp.
> >> > One use-case for it is showing the guest's IPv6 address(es).
> >> >
> >> > Signed-off-by: Doug Evans <dje@google.com>
> >> > ---
> >> >  hmp-commands-info.hx               | 15 +++++++
> >> >  include/net/slirp.h                |  1 +
> >> >  net/slirp.c                        | 15 +++++++
> >> >  tests/acceptance/info_neighbors.py | 69
> ++++++++++++++++++++++++++++++
> >> >  4 files changed, 100 insertions(+)
> >> >  create mode 100644 tests/acceptance/info_neighbors.py
> >>
> >> Standard request for new HMP commands without corresponding QMP
> >> commands: please state in the commit message why the QMP command is no=
t
> >> worthwhile.
> >>
> >> HMP commands without a QMP equivalent are okay if their functionality
> >> makes no sense in QMP, or is of use only for human users.
> >>
> >> Example for "makes no sense in QMP": setting the current CPU, because =
a
> >> QMP monitor doesn't have a current CPU.
> >>
> >> Examples for "is of use only for human users": HMP command "help", the
> >> integrated pocket calculator.
> >>
> >> Debugging commands are kind of borderline.  Debugging is commonly a
> >> human activity, where HMP is just fine.  However, humans create tools =
to
> >> assist with their activities, and then QMP is useful.  While I wouldn'=
t
> >> encourage HMP-only for the debugging use case, I wouldn't veto it.
> >>
> >
> >
> > Mostly I was following what I saw for "info usernet".
> > I don't see a difference between "info neighbors" and "info usernet" so=
 I
> > went with that.
> > Both draw their data from libslirp.
>
> I see.
>
> > I'm happy to add QMP support if necessary.
> > Note that there is code that parses "info usernet" output, e.g.,
> > get_info_usernet_hostfwd_port for python.
>
> Demonstrates "is of use only for human users" is wrong.
>
> > Presumably we don't want to print text in slirp only to parse it in qem=
u,
> > right?
>
> Yes, we'd prefer not to parse.
>
> As long as libslirp can only give us text, we need to parse it
> somewhere.
>
> We can parse it right in QEMU, or punt the job to whatever uses QEMU.
> The latter can get away with parsing just the part they need.  But we
> may end up with multiple parsers.
>
>
> > That'll change the qemu/slirp interface.
> > OTOH, to what extent does libslirp want to export a more formal API for
> > this, vs just text?
>
> This is a question for Samuel or Marc-Andr=C3=A9.
>
> If the answer is "no", then HMP only (so we don't have to parse in QEMU)
> is fair, I think.  The commit message should explain this.
>
>
Until now, libslirp (& QEMU HMP) provided inner state details as textual
form. But since there is a need for a programming-friendly API, it could be
added to libslirp and exported as QAPI/QMP by QEMU. Let's try to design the
API in a way that can be easily extended (via getters and/or keys etc).
Alternatively, libslirp could dump its state as JSON, but this wouldn't fit
so nicely with QMP machinery/introspection etc.

--000000000000a5a8f105cc1ae247
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 4, 2021 at 10:26 AM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do=
ug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@google=
.com</a>&gt; writes:<br>
<br>
&gt; On Fri, Sep 3, 2021 at 6:08 AM Markus Armbruster &lt;<a href=3D"mailto=
:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank"=
>dje@google.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; This command dumps the ARP and NDP tables maintained within s=
lirp.<br>
&gt;&gt; &gt; One use-case for it is showing the guest&#39;s IPv6 address(e=
s).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.co=
m" target=3D"_blank">dje@google.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hmp-commands-info.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 15 +++++++<br>
&gt;&gt; &gt;=C2=A0 include/net/slirp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++<br>
&gt;&gt; &gt;=C2=A0 tests/acceptance/info_neighbors.py | 69 +++++++++++++++=
+++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 4 files changed, 100 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 tests/acceptance/info_neighbors.py<b=
r>
&gt;&gt;<br>
&gt;&gt; Standard request for new HMP commands without corresponding QMP<br=
>
&gt;&gt; commands: please state in the commit message why the QMP command i=
s not<br>
&gt;&gt; worthwhile.<br>
&gt;&gt;<br>
&gt;&gt; HMP commands without a QMP equivalent are okay if their functional=
ity<br>
&gt;&gt; makes no sense in QMP, or is of use only for human users.<br>
&gt;&gt;<br>
&gt;&gt; Example for &quot;makes no sense in QMP&quot;: setting the current=
 CPU, because a<br>
&gt;&gt; QMP monitor doesn&#39;t have a current CPU.<br>
&gt;&gt;<br>
&gt;&gt; Examples for &quot;is of use only for human users&quot;: HMP comma=
nd &quot;help&quot;, the<br>
&gt;&gt; integrated pocket calculator.<br>
&gt;&gt;<br>
&gt;&gt; Debugging commands are kind of borderline.=C2=A0 Debugging is comm=
only a<br>
&gt;&gt; human activity, where HMP is just fine.=C2=A0 However, humans crea=
te tools to<br>
&gt;&gt; assist with their activities, and then QMP is useful.=C2=A0 While =
I wouldn&#39;t<br>
&gt;&gt; encourage HMP-only for the debugging use case, I wouldn&#39;t veto=
 it.<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; Mostly I was following what I saw for &quot;info usernet&quot;.<br>
&gt; I don&#39;t see a difference between &quot;info neighbors&quot; and &q=
uot;info usernet&quot; so I<br>
&gt; went with that.<br>
&gt; Both draw their data from libslirp.<br>
<br>
I see.<br>
<br>
&gt; I&#39;m happy to add QMP support if necessary.<br>
&gt; Note that there is code that parses &quot;info usernet&quot; output, e=
.g.,<br>
&gt; get_info_usernet_hostfwd_port for python.<br>
<br>
Demonstrates &quot;is of use only for human users&quot; is wrong.<br>
<br>
&gt; Presumably we don&#39;t want to print text in slirp only to parse it i=
n qemu,<br>
&gt; right?<br>
<br>
Yes, we&#39;d prefer not to parse.<br>
<br>
As long as libslirp can only give us text, we need to parse it<br>
somewhere.<br>
<br>
We can parse it right in QEMU, or punt the job to whatever uses QEMU.<br>
The latter can get away with parsing just the part they need.=C2=A0 But we<=
br>
may end up with multiple parsers.<br>
<br>
<br>
&gt; That&#39;ll change the qemu/slirp interface.<br>
&gt; OTOH, to what extent does libslirp want to export a more formal API fo=
r<br>
&gt; this, vs just text?<br>
<br>
This is a question for Samuel or Marc-Andr=C3=A9.<br>
<br>
If the answer is &quot;no&quot;, then HMP only (so we don&#39;t have to par=
se in QEMU)<br>
is fair, I think.=C2=A0 The commit message should explain this.<br>
<br></blockquote><div><br></div><div>Until now, libslirp (&amp; QEMU HMP) p=
rovided inner state details as textual form. But since there is a need for =
a programming-friendly API, it could be added to libslirp and exported as Q=
API/QMP by QEMU. Let&#39;s try to design the API in a way that can be easil=
y extended (via getters and/or keys etc). Alternatively, libslirp could dum=
p its state as JSON, but this wouldn&#39;t fit so nicely with QMP machinery=
/introspection etc.<br></div><div><br></div><div>=C2=A0</div></div></div>

--000000000000a5a8f105cc1ae247--


