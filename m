Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149156231F0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ospGR-0000cZ-PZ; Wed, 09 Nov 2022 12:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ospGQ-0000cF-IA
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:53:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ospGO-0006xg-KZ
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668016403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fIFfkmHDS92yHk7le82vM/1Y6Sq+JuMyHUNZVyS4r4E=;
 b=UlThhphUvRZ96DV7CvYRuVW8LK7A5sdhf/Oiw4RvXDc0HSuQFrMPPz5uDiZ4EGyuugtZnj
 4rWC9hSfTmap+ALxhb7/uJ5FPEUMfYu2+P6X+cTMHDMk6bQmVf7xdew9Yeeuk1zU9XanZD
 M68b7H7lAsO27kU6UaXjD2avAZ1t8Uk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-FGBHmlE8Nl-uq7gXiHTvBg-1; Wed, 09 Nov 2022 12:53:22 -0500
X-MC-Unique: FGBHmlE8Nl-uq7gXiHTvBg-1
Received: by mail-lj1-f197.google.com with SMTP id
 f14-20020a2e950e000000b0026fa4066f3cso6557288ljh.21
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fIFfkmHDS92yHk7le82vM/1Y6Sq+JuMyHUNZVyS4r4E=;
 b=Ql5zMzF8r3MfzSDoJ0ieYa4h/oLIFjCCvRCcS77ZLPr8ZUt360ocsVDnhcch5ZmhbB
 2BFxIh1noW+tMalLpPlBgls2OKXgvqeoVzENeUW8ootMj5WewWQHhFsN2eLERRmmoj1A
 NuYnKIHc0JVDsTZ9JACPvPGow9Etyt5qWZtzXY/BSi49oq1PpTnN+Vx3gwAPbgX8pKTH
 DzGt9wI+C48i2K/ZYBsRij0qtUFXhxJQD4wRtKiPFLvUI5t8+6/YbfvGcqyIzJSRmojE
 49lxcLqLh4p1VHyMY2vbQm7KHLMfUmN8jd/Xqvfuw3ozWo0oHJm90DYEqthQOr17J3gB
 i7Pg==
X-Gm-Message-State: ACrzQf2Js34oydjcmReL9kVMBoFiwD46D76t4Egxnql5SgFqtL9YYp5s
 Pa53/nJHL/NEYjAo7GSnta+7JhLrFRSfBtKB+3MQaN466vdenc8DSunwDms1TJB1rdeX4Z6C5pb
 6i9+e4L3EvXU6hhkhFv3Xdxoca2JLaGU=
X-Received: by 2002:a2e:9d94:0:b0:277:50a:bd5c with SMTP id
 c20-20020a2e9d94000000b00277050abd5cmr7960713ljj.6.1668016400037; 
 Wed, 09 Nov 2022 09:53:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5CNWv6qRKUT4zGvHZWpy4cPnjTMrlqtbXPQEAcER6VooEP35Ms+6al4mgBXLTf4wo67EAQTIpxFr4zRaHK/8Q=
X-Received: by 2002:a2e:9d94:0:b0:277:50a:bd5c with SMTP id
 c20-20020a2e9d94000000b00277050abd5cmr7960694ljj.6.1668016399727; Wed, 09 Nov
 2022 09:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-3-davydov-max@yandex-team.ru>
 <CAFn=p-aMT7Z3ybbuLvpZb2dphn5ybhwN=OBnKP23PYWb5KshVg@mail.gmail.com>
 <Y2t1QlBAhqhG9Oaq@redhat.com> <Y2uIL3XkmuiXXSGT@redhat.com>
In-Reply-To: <Y2uIL3XkmuiXXSGT@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 9 Nov 2022 12:53:08 -0500
Message-ID: <CAFn=p-ZE3MrNm7Cg=bNamubZMMi13NJJhPcncP5dLj-UBQNcjA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] python/qmp: increase read buffer size
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Maksim Davydov <davydov-max@yandex-team.ru>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 wangyanan55@huawei.com, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fc594505ed0d547a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--000000000000fc594505ed0d547a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 9, 2022, 6:00 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Wed, Nov 09, 2022 at 09:39:14AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Nov 08, 2022 at 03:38:21PM -0500, John Snow wrote:
> > > On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov
> > > <davydov-max@yandex-team.ru> wrote:
> > > >
> > > > After modification of "query-machines" command the buffer size
> should be
> > > > more than 452kB to contain output with compat-props.
> > > >
> > > > Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> > > > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.r=
u
> >
> > > > ---
> > > >  python/qemu/qmp/qmp_client.py | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/python/qemu/qmp/qmp_client.py
> b/python/qemu/qmp/qmp_client.py
> > > > index 5dcda04a75..659fe4d98c 100644
> > > > --- a/python/qemu/qmp/qmp_client.py
> > > > +++ b/python/qemu/qmp/qmp_client.py
> > > > @@ -197,8 +197,8 @@ async def run(self, address=3D'/tmp/qemu.socket=
'):
> > > >      #: Logger object used for debugging messages.
> > > >      logger =3D logging.getLogger(__name__)
> > > >
> > > > -    # Read buffer limit; large enough to accept query-qmp-schema
> > > > -    _limit =3D (256 * 1024)
> > > > +    # Read buffer limit; large enough to accept query-machines
> > > > +    _limit =3D (512 * 1024)
> > >
> > > wow :)
> >
> > Meanwhile over in python/qemu/qmp/protocol.py the read buffer limit is
> > set to just 64 kb.
>

This one will override the other - the protocol limit is for any arbitrary
full-duplex message-based protocol. It can stay at the lower limit.

(I used protocol.py to implement a qtest client as well, though I didn't
upstream that piece. If there's interest, I will.)

>
> > If the current output of a particular command is known to 450 kb, then
> > setting this limit to 512 kb is waaaaaaay to conservative, and we'll
> > inevitably have to change it again when someone finds the next command
> > that overflows.
> >
> > Recall this thread
> >
> >    https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01060.html
> >
> > In fact, let me be the someone who demonstrates a real case where 512kb
> > is not enough....
>
> Another example...
>
> Create a guest with 255 vCPUs (current RHEL downstream vCPU limit),
> and run
>
>   {"execute":"query-stats","arguments":{"target": "vcpu"}}
>
> it'll get back a 0.38 MB  QMP reply.  RHEL raised the limit to 710
> vCPUs, giving a little over 1 MB QMP reply. There is a strong desire
> to go even higher. With 4096 vCPUs it'd get an ~6 MB QMP reply.
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

You're right, of course. I recalled the thread but I was being lazy about
it. (Sorry.) I thought, naively, that it was better to speed Maksim along
for now.

I recall you (Daniel) stating that libvirt used a default of 10MB (iirc).
I'd be happy to adopt that default as well, if only for parity.

Maksim, can I trouble you to send a revised patch as an MR to
gitlab.com/qemu-project/python-qemu-qmp ? If not, a revised patch to the
mailing list here is fine and with your permission I'll forward-port it
over to the standalone repo myself. (Or I can just handle it entirely
myself, if you'd prefer - just let me know.)

Sorry for the fuss, and thanks for helping to improve QMP testing and
tooling

--js

>

--000000000000fc594505ed0d547a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Nov 9, 2022, 6:00 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, Nov 09, 2022 at 09:39:14A=
M +0000, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Tue, Nov 08, 2022 at 03:38:21PM -0500, John Snow wrote:<br>
&gt; &gt; On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov<br>
&gt; &gt; &lt;<a href=3D"mailto:davydov-max@yandex-team.ru" target=3D"_blan=
k" rel=3D"noreferrer">davydov-max@yandex-team.ru</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; After modification of &quot;query-machines&quot; command the=
 buffer size should be<br>
&gt; &gt; &gt; more than 452kB to contain output with compat-props.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Maksim Davydov &lt;<a href=3D"mailto:davydov-=
max@yandex-team.ru" target=3D"_blank" rel=3D"noreferrer">davydov-max@yandex=
-team.ru</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mai=
lto:vsementsov@yandex-team.ru" target=3D"_blank" rel=3D"noreferrer">vsement=
sov@yandex-team.ru</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 python/qemu/qmp/qmp_client.py | 4 ++--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp=
/qmp_client.py<br>
&gt; &gt; &gt; index 5dcda04a75..659fe4d98c 100644<br>
&gt; &gt; &gt; --- a/python/qemu/qmp/qmp_client.py<br>
&gt; &gt; &gt; +++ b/python/qemu/qmp/qmp_client.py<br>
&gt; &gt; &gt; @@ -197,8 +197,8 @@ async def run(self, address=3D&#39;/tmp/=
qemu.socket&#39;):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 #: Logger object used for debugging mess=
ages.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 logger =3D logging.getLogger(__name__)<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # Read buffer limit; large enough to accept q=
uery-qmp-schema<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 _limit =3D (256 * 1024)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # Read buffer limit; large enough to accept q=
uery-machines<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 _limit =3D (512 * 1024)<br>
&gt; &gt; <br>
&gt; &gt; wow :)<br>
&gt; <br>
&gt; Meanwhile over in python/qemu/qmp/protocol.py the read buffer limit is=
<br>
&gt; set to just 64 kb.<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">This one will override the other - the protocol limi=
t is for any arbitrary full-duplex message-based protocol. It can stay at t=
he lower limit.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I used =
protocol.py to implement a qtest client as well, though I didn&#39;t upstre=
am that piece. If there&#39;s interest, I will.)</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
&gt; <br>
&gt; If the current output of a particular command is known to 450 kb, then=
<br>
&gt; setting this limit to 512 kb is waaaaaaay to conservative, and we&#39;=
ll<br>
&gt; inevitably have to change it again when someone finds the next command=
<br>
&gt; that overflows.<br>
&gt; <br>
&gt; Recall this thread<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/=
2022-09/msg01060.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01060.html</a><br>
&gt; <br>
&gt; In fact, let me be the someone who demonstrates a real case where 512k=
b<br>
&gt; is not enough....<br>
<br>
Another example...<br>
<br>
Create a guest with 255 vCPUs (current RHEL downstream vCPU limit),<br>
and run<br>
<br>
=C2=A0 {&quot;execute&quot;:&quot;query-stats&quot;,&quot;arguments&quot;:{=
&quot;target&quot;: &quot;vcpu&quot;}}<br>
<br>
it&#39;ll get back a 0.38 MB=C2=A0 QMP reply.=C2=A0 RHEL raised the limit t=
o 710<br>
vCPUs, giving a little over 1 MB QMP reply. There is a strong desire<br>
to go even higher. With 4096 vCPUs it&#39;d get an ~6 MB QMP reply.<br>
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
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">You&#39;re =
right, of course. I recalled the thread but I was being lazy about it. (Sor=
ry.) I thought, naively, that it was better to speed Maksim along for now.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I recall you (Daniel) st=
ating that libvirt used a default of 10MB (iirc). I&#39;d be happy to adopt=
 that default as well, if only for parity.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Maksim, can I trouble you to send a revised patch as an =
MR to <a href=3D"http://gitlab.com/qemu-project/python-qemu-qmp">gitlab.com=
/qemu-project/python-qemu-qmp</a> ? If not, a revised patch to the mailing =
list here is fine and with your permission I&#39;ll forward-port it over to=
 the standalone repo myself. (Or I can just handle it entirely myself, if y=
ou&#39;d prefer - just let me know.)</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Sorry for the fuss, and thanks for helping to improve QMP test=
ing and tooling</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"></blockquote></div></div></div>

--000000000000fc594505ed0d547a--


