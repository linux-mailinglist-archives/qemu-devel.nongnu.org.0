Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48A57357F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 13:33:49 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBacm-0004AA-DZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 07:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBaaT-00028D-Jt
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBaaQ-0005VP-QZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657711881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=84M1uG4K/nZEqr0klewbCwUmX5aBKNOXjKtFf5lN80Y=;
 b=CJ/YFfOJUh87F8KyZD0VaAhcqFy3u8DwaHrYQJy0i1b7ogQdmoTk9WlYbFKhXMaFEZF0Sy
 uq/2p7ACGQHYdSztcYaNe2BEd6DbIUM8aLqW1Wl0dNSbXDNhwU2Q1f8em6rTOlGbqGZJuC
 keUpQREoFZN+dWIkSx/yFKlyYu9hfPM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-1fD-_1tcMLqpLBwwkqaHng-1; Wed, 13 Jul 2022 07:31:20 -0400
X-MC-Unique: 1fD-_1tcMLqpLBwwkqaHng-1
Received: by mail-yb1-f200.google.com with SMTP id
 w15-20020a25ac0f000000b0066e50e4a553so8227547ybi.16
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 04:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84M1uG4K/nZEqr0klewbCwUmX5aBKNOXjKtFf5lN80Y=;
 b=Bu1Knotat+f/jHh7nDBif8RqzJ1v+VJjv9Oj338LohCYcfc0iHNX+FOFMTijjegsjb
 Wz61VFZCecTtztKse46Dxcct+UGNz0d8LyRljnb7XVpVhT+fmQK9MFdGsZh1Ctrucdoq
 EVtlPUn5a7OnDfbAqHjg7uSPSpwVGuRueoHaT7IIxMPaxCDd59kaNG8KCBPA+Hw1CQg8
 eR7NaRT7FGU5XXro9Cx9GVAARlG5/0rW2qBLpCspRZ/TBMKdv/E8EhGd9yZQirbrTYYo
 +62vFqEXpMHf3fhogWRgYrb+3mOEBjexK5ilrjOgfjXvMo/6jUVN4/b//SmNlEREI3RV
 +W2g==
X-Gm-Message-State: AJIora8B8pnptDXwMolXU1ngTzp2v6IDBb4qcTx9q3aZ6+KQolNH9d7n
 QAWEiEqo12GCE4yejQDbEzXtcW2G1vonV1H1fdqIpP98pelNmiV56G2jHa6eQ9DOBu9kf+L9mEm
 oGpVRO/zmQhTp78SA+nTONB8mmNVASEA=
X-Received: by 2002:a25:bacf:0:b0:66f:4c39:5c34 with SMTP id
 a15-20020a25bacf000000b0066f4c395c34mr3225645ybk.74.1657711879488; 
 Wed, 13 Jul 2022 04:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uI0Np+EG0TS7hLN12V3oC5EcX4Bo0iJ72fmMYfgNvO3Ia+q+4RcpTwI5CgwZs04kmK2Jn9aA1kSVrg0CtAD3M=
X-Received: by 2002:a25:bacf:0:b0:66f:4c39:5c34 with SMTP id
 a15-20020a25bacf000000b0066f4c395c34mr3225626ybk.74.1657711879236; Wed, 13
 Jul 2022 04:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
 <20220713101908.2212307-2-kkostiuk@redhat.com>
 <Ys6gl74SLea6dsfU@redhat.com>
In-Reply-To: <Ys6gl74SLea6dsfU@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 13 Jul 2022 14:31:08 +0300
Message-ID: <CAPMcbCretrK9i5tA7joRXaKa0f7HruO=SNa18sZqZPmCZK9ypA@mail.gmail.com>
Subject: Re: [PULL 1/3] MAINTAINERS: Add myself as Guest Agent reviewer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>
Cc: QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b3bfd005e3ae1f32"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000b3bfd005e3ae1f32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 1:38 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrote:
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > Message-Id: <20220712092715.2136898-1-kkostiuk@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 450abd0252..b1e73d99f3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git
> qapi-next
> >
> >  QEMU Guest Agent
> >  M: Michael Roth <michael.roth@amd.com>
> > +R: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> This pull request contains functional changes under qga/, which
> suggests you're acting as a (co-)maintainer for QGA, not merely
> a reviewer. I wouldn't normally expect reviewers to send pull
> requests for a subsystem. As such should this be "M:", to
> indicate co-maintainership and have an explicit ACK from
> Michael Roth.
>

As the maintainer of the Windows part of the Guest Agent, I have added
myself
as a reviewer so I don't miss out on general patches for the Guest Agent.
Some time ago, I asked Michael Roth if I could submit PRs for all guest
agent components and he allow me to do this.
If need I can add myself as a co-maintainer to Guest Agent not only
Guest Agent Windows.


>
> >  S: Maintained
> >  F: qga/
> >  F: docs/interop/qemu-ga.rst
>
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
>

--000000000000b3bfd005e3ae1f32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 1:38 PM Daniel P.=
 Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrote:<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20220712092715.2136898-1-kkostiuk@re=
dhat.com" target=3D"_blank">20220712092715.2136898-1-kkostiuk@redhat.com</a=
>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@a=
msat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 450abd0252..b1e73d99f3 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -2880,6 +2880,7 @@ T: git <a href=3D"https://repo.or.cz/qemu/armbru=
.git" rel=3D"noreferrer" target=3D"_blank">https://repo.or.cz/qemu/armbru.g=
it</a> qapi-next<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QEMU Guest Agent<br>
&gt;=C2=A0 M: Michael Roth &lt;<a href=3D"mailto:michael.roth@amd.com" targ=
et=3D"_blank">michael.roth@amd.com</a>&gt;<br>
&gt; +R: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" targ=
et=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
<br>
This pull request contains functional changes under qga/, which<br>
suggests you&#39;re acting as a (co-)maintainer for QGA, not merely<br>
a reviewer. I wouldn&#39;t normally expect reviewers to send pull<br>
requests for a subsystem. As such should this be &quot;M:&quot;, to<br>
indicate co-maintainership and have an explicit ACK from<br>
Michael Roth.<br></blockquote><div><br></div><div>As the maintainer of the =
Windows part of the Guest Agent, I have added myself <br></div><div>as a re=
viewer so I don&#39;t miss out on general patches for the Guest Agent.<br>S=
ome time ago, I asked Michael Roth if I could submit PRs for all guest <br>=
</div><div>agent components and he allow me to do this.<br>If need I can ad=
d myself as a co-maintainer to Guest Agent not only <br></div><div>Guest Ag=
ent Windows.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;=C2=A0 S: Maintained<br>
&gt;=C2=A0 F: qga/<br>
&gt;=C2=A0 F: docs/interop/qemu-ga.rst<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--000000000000b3bfd005e3ae1f32--


