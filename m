Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909EA54F8E5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:06:54 +0200 (CEST)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Ccf-0007bU-AY
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2CaR-0005St-89
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2CaL-0005rs-7J
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655474668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+oKwpBHbkvPJl8bLEmHLCaiKBq44oSfnGUqvwpvTU8=;
 b=SqmkE6+rgz26VXBFNXw7bxeE3rb2rnW2iZiaLfzXtCUbYUSPn6IJxwDk5uKOWSZUVvH3vQ
 ZQjx+b8bB8jv8bZorz6aXnTkiKn8iM03pOx3hAT/Sz4TihKG+/S6c2wulAloITUBLM2XTU
 kQjwmj2lN/xPRcLaYd9suoQi6LC/9u8=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-bpFoFMcIOxOdYeLR7dxfpw-1; Fri, 17 Jun 2022 10:04:27 -0400
X-MC-Unique: bpFoFMcIOxOdYeLR7dxfpw-1
Received: by mail-vs1-f71.google.com with SMTP id
 s13-20020a056102300d00b0034e12ccb71cso291784vsa.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+oKwpBHbkvPJl8bLEmHLCaiKBq44oSfnGUqvwpvTU8=;
 b=tGVaXfmqOHIXbNCqY4cdSjYvgbpoaJVgZkZ/QCebxRqEN8xGc5XBvNRleFP+CND6rz
 ssaZqIuipdXRrb7LN1JqD42LvBFRKPLkBm91LzMq9b5qemlfNOhHaPs9UDJpWXporyOs
 n3A0iyHsS3ack7v7ZRTpU69SnPjc8cNEReQY/5jawHViz9gy1U9uDDiyT5IJhHgIYizw
 lx3/FWJHbWzXM0VQmEZKHFrnKkfOCGOwRkw69NY5quYJ9vKfigp2aJ7xLquYtY2MK/9E
 bdkAsBIgno7w+HjkcskkNaMgiqBfnLN2WxVlVWnjPQSbjokhc/v2QpODR6EoR/UkiZA9
 FwqQ==
X-Gm-Message-State: AJIora8zgZnt+HdzlHj/cS6c7lOc7l5W97zgOMBOP1t9KccXpGWD6qyh
 7dvSP0gOAkOh4qi7JMRaPI5ZoQBCh+6BNzaKxR5NgOzO486/VFQ46fEWpQTQyvI+kyvsxSWTy/h
 7JCuC7SZOu0odGKPNhTYDh7mA/c2YtpI=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr4234258uae.103.1655474666418; 
 Fri, 17 Jun 2022 07:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTKW6TRSxlTCcayS8ZuQTHt+kUlh9EhtauomiHaGhHr8OgFxJJqB4D4o3w/ZS1mkQ+kA9tVoUgAcEyS+xSwJ8=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr4234239uae.103.1655474666176; Fri, 17
 Jun 2022 07:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-4-jsnow@redhat.com>
 <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
 <YqxOPI4L/oMcgY0y@redhat.com>
In-Reply-To: <YqxOPI4L/oMcgY0y@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Jun 2022 10:04:14 -0400
Message-ID: <CAFn=p-ZcR3SoS9zKHHLfX8=T-1FszAFesD-V9N6_qz_oLmsyUQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006999f705e1a53ba4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--0000000000006999f705e1a53ba4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022, 5:49 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, Jun 16, 2022 at 06:35:44PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jun 16, 2022 at 6:27 PM John Snow <jsnow@redhat.com> wrote:
> >
> > > In some container environments, there may be references to block
> devices
> > > witnessable from a container through /proc/self/mountinfo that
> reference
> > > devices we simply don't have access to in the container, and could no=
t
> > > provide information about.
> > >
> > > Instead of failing the entire fsinfo command, return stub information
> > > for these failed lookups.
> > >
> > > This allows test-qga to pass under docker tests, which are in turn us=
ed
> > > by the CentOS VM tests.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  qga/commands-posix.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > > index 0469dc409d4..5989d4dca9d 100644
> > > --- a/qga/commands-posix.c
> > > +++ b/qga/commands-posix.c
> > > @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char
> > > const *devpath,
> > >
> > >      syspath =3D realpath(devpath, NULL);
> > >      if (!syspath) {
> > > -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
> > > +        if (errno =3D=3D ENOENT) {
> > > +            /* This devpath may not exist because of container confi=
g,
> > > etc. */
> > > +            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n",
> > > devpath);
> > >
> >
> > qga uses g_critical() (except for some win32 code paths atm)
> >
> >
> > > +            fs->name =3D y
> > >
> >
> > Hmm, maybe we should make the field optional instead.
>
> In my own testing, this method is called in various scenarios.
> Some example:
>
>   devpath=3D=3D/sys/dev/block/253:0
>   syspath=3D=3D/sys/devices/virtual/block/dm-0
>
>     =3D> fs->name =3D=3D dm-0
>
>   devpath=3D=3D/sys/devices/virtual/block/dm-0/slaves/nvme0n1p4
>
> syspath=3D=3D/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/nvme0=
/nvme0n1/nvme0n1p4
>
>     =3D> fs->name =3D=3D nvme0n1p4
>
>   devpath=3D=3D/sys/dev/block/259:2
>
> syspath=3D=3D/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/nvme0=
/nvme0n1/nvme0n1p2
>
>     =3D> fs->name =3D=3D nvme0n1p2
>
> We set fs->name from  basename(syspath)
>
> If the realpath call fails, we could use  basename(devpath). That
> would sometimes give the correct answer, and in other types it
> would at least give the major:minor number, which an admin can
> manually correlate if desired via /proc/partitions.
>
> If we want to be really advanced, we could just open /proc/partitions
> and resolve the proper name ourselves, but that's probably overkill
>
>   basename(sysfspath)
>
> is better than g_strdup("??\?-ENOENT")  IMHO
>

Sure! I had something like that initially, but chickened out specifically
because I thought major:minor was a nonsense kind of reply, so I opted for
more egregiously obvious nonsense. I figured I'd find strong opinions that
way ;)

I'm just not sure how this data is used in practice so I had no insight as
to what would be best. I can use the basename, sure.

(Should I also add an optional flag field that indicates the path was not
resolvable, do you think? I guess we can always add it later if needed, but
not sure if i need to head that one off at the pass.)

As for Thomas' comment: I wasn't entirely clear on precisely when we'd run
into this scenario and I didn't know if it was a good idea to skip the
entries entirely. Maybe getting platform mount information even if we can't
access it is still important when working with containers? I don't know one
way or the other TBQH. I'm not very well traveled with devices,
filesystems, and permissions where containers are concerned.

/shrug


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
>

--0000000000006999f705e1a53ba4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Jun 17, 2022, 5:49 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, Jun 16, 2022 at 06:35:44=
PM +0400, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Jun 16, 2022 at 6:27 PM John Snow &lt;<a href=3D"mailto:jsnow@=
redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; w=
rote:<br>
&gt; <br>
&gt; &gt; In some container environments, there may be references to block =
devices<br>
&gt; &gt; witnessable from a container through /proc/self/mountinfo that re=
ference<br>
&gt; &gt; devices we simply don&#39;t have access to in the container, and =
could not<br>
&gt; &gt; provide information about.<br>
&gt; &gt;<br>
&gt; &gt; Instead of failing the entire fsinfo command, return stub informa=
tion<br>
&gt; &gt; for these failed lookups.<br>
&gt; &gt;<br>
&gt; &gt; This allows test-qga to pass under docker tests, which are in tur=
n used<br>
&gt; &gt; by the CentOS VM tests.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 qga/commands-posix.c | 8 +++++++-<br>
&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; &gt; index 0469dc409d4..5989d4dca9d 100644<br>
&gt; &gt; --- a/qga/commands-posix.c<br>
&gt; &gt; +++ b/qga/commands-posix.c<br>
&gt; &gt; @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(=
char<br>
&gt; &gt; const *devpath,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 syspath =3D realpath(devpath, NULL);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!syspath) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;=
realpath(\&quot;%s\&quot;)&quot;, devpath);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D ENOENT) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This devpath may no=
t exist because of container config,<br>
&gt; &gt; etc. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=
realpath(%s) returned NULL/ENOENT\n&quot;,<br>
&gt; &gt; devpath);<br>
&gt; &gt;<br>
&gt; <br>
&gt; qga uses g_critical() (except for some win32 code paths atm)<br>
&gt; <br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs-&gt;name =3D y<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hmm, maybe we should make the field optional instead.<br>
<br>
In my own testing, this method is called in various scenarios.<br>
Some example:<br>
<br>
=C2=A0 devpath=3D=3D/sys/dev/block/253:0<br>
=C2=A0 syspath=3D=3D/sys/devices/virtual/block/dm-0<br>
<br>
=C2=A0 =C2=A0 =3D&gt; fs-&gt;name =3D=3D dm-0<br>
<br>
=C2=A0 devpath=3D=3D/sys/devices/virtual/block/dm-0/slaves/nvme0n1p4<br>
=C2=A0 syspath=3D=3D/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/=
nvme0/nvme0n1/nvme0n1p4<br>
<br>
=C2=A0 =C2=A0 =3D&gt; fs-&gt;name =3D=3D nvme0n1p4<br>
<br>
=C2=A0 devpath=3D=3D/sys/dev/block/259:2<br>
=C2=A0 syspath=3D=3D/sys/devices/pci0000:00/0000:00:1d.0/0000:02:00.0/nvme/=
nvme0/nvme0n1/nvme0n1p2<br>
<br>
=C2=A0 =C2=A0 =3D&gt; fs-&gt;name =3D=3D nvme0n1p2<br>
<br>
We set fs-&gt;name from=C2=A0 basename(syspath)<br>
<br>
If the realpath call fails, we could use=C2=A0 basename(devpath). That<br>
would sometimes give the correct answer, and in other types it<br>
would at least give the major:minor number, which an admin can<br>
manually correlate if desired via /proc/partitions.<br>
<br>
If we want to be really advanced, we could just open /proc/partitions<br>
and resolve the proper name ourselves, but that&#39;s probably overkill<br>
<br>
=C2=A0 basename(sysfspath)<br>
<br>
is better than g_strdup(&quot;??\?-ENOENT&quot;)=C2=A0 IMHO<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure! I had some=
thing like that initially, but chickened out specifically because I thought=
 major:minor was a nonsense kind of reply, so I opted for more egregiously =
obvious nonsense. I figured I&#39;d find strong opinions that way ;)</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m just not sure how this=
 data is used in practice so I had no insight as to what would be best. I c=
an use the basename, sure.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">(Should I also add an optional flag field that indicates the path was no=
t resolvable, do you think? I guess we can always add it later if needed, b=
ut not sure if i need to head that one off at the pass.)</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">As for Thomas&#39; comment: I wasn&#39;t e=
ntirely clear on precisely when we&#39;d run into this scenario and I didn&=
#39;t know if it was a good idea to skip the entries entirely. Maybe gettin=
g platform mount information even if we can&#39;t access it is still import=
ant when working with containers? I don&#39;t know one way or the other TBQ=
H. I&#39;m not very well traveled with devices, filesystems, and permission=
s where containers are concerned.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">/shrug</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000006999f705e1a53ba4--


