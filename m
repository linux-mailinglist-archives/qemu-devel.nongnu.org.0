Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E493DFD1D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:42:59 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCUM-0000Co-JX
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCSk-0007G2-7p
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCSh-000131-15
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628066474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PSo4xgBrc+RwHnAJWSaPcBpX+4VK2kWMi+17THvzlIg=;
 b=fMdYZuXWpWXTh5JPuEKoPaIV3wO7HzuHNeFT5aVYJExv0CHD85OFJ0lCj/Wvotv1UX6cBc
 5DpmNmO8LSglkvVgHcZZhM9mh6UNP8ln0dz5OU9mMOStOkPuTjh41TQKZGKMHE5r8mXLlg
 f3j/o8AkocgR8cMlm/6Ykqi6RIjdM+w=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-32jOwA78PrGqwRCoYPUEBg-1; Wed, 04 Aug 2021 04:41:12 -0400
X-MC-Unique: 32jOwA78PrGqwRCoYPUEBg-1
Received: by mail-pj1-f72.google.com with SMTP id
 s2-20020a17090a0742b0290177b02e795eso1460596pje.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSo4xgBrc+RwHnAJWSaPcBpX+4VK2kWMi+17THvzlIg=;
 b=UbNHVOyu7Zd9pWlQvV3ZP00O5QlpTtabeVzRmwNM+FpJgCf7+tUbDzIExGxSzBN2MT
 P/8a7Dh0jFW2nXpUJJ+RAucyYH/qRgOboXoeHrU+H6YwiIDVTx40WG9/slEvcJvhw6hK
 8eQz2aVmAt2fOlNqd/RdzDZjmpNlgYyaKg3RmeYc8oM4CzEdPfTqgW4nchFJ+AYvaVt6
 o2Hn67ujJw/W8+Rox7panypVq4bjU7Lti3cMns3ckKglHjCdKMJ/RSH4jSTuAp6nk1dw
 ltWirN3SN1bw9SEhNdjnZt5tkLjntuBd9N1DlqV03OidyP+YVQTejhg9ucDxEzkR6V2E
 g+SQ==
X-Gm-Message-State: AOAM5336DDO9rNd8ji3uksuDIlLbdw/bfx0tt58qYz5yH1p8rm8At6LQ
 u53MuZuYX4iqOc5eaVEKWC+1innyj1F9Wsuf0QghsR9LxFtPC3PhkbvLp+Rzme5dI7/XkDc0LMF
 NyatdvvVsmDdR7FGyfVsfURWZI1dtqJY=
X-Received: by 2002:aa7:96cd:0:b029:3b7:53e2:9e6b with SMTP id
 h13-20020aa796cd0000b02903b753e29e6bmr19325684pfq.19.1628066471546; 
 Wed, 04 Aug 2021 01:41:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAG48Daa4mJDsTYTdZaBRrhLCtOsJ/qTtdhGaNTGrqLcbYs+ppNWmX8wrRxEOPdtp7Dwoh1OoTR/blNhGh2jg=
X-Received: by 2002:aa7:96cd:0:b029:3b7:53e2:9e6b with SMTP id
 h13-20020aa796cd0000b02903b753e29e6bmr19325660pfq.19.1628066471319; Wed, 04
 Aug 2021 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <87pmutioy9.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmutioy9.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:41:00 +0400
Message-ID: <CAMxuvawzHNG6QemX613TLnx2t9ZnHGCa9JzWya9D_G9f1GY8uQ@mail.gmail.com>
Subject: Re: [PATCH] util: fix abstract socket path copy
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b1b65205c8b7c3ed"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: zxq_yx_007@163.com, "P. Berrange, Daniel" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b1b65205c8b7c3ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 4, 2021 at 12:39 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
> > support" neglected to update socket_sockaddr_to_address_unix() and
> > copied the whole sun_path without taking "salen" into account.
> >
> > Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix(=
)
> > for abstract sockets" handled the abstract UNIX path, by stripping the
> > leading \0 character and fixing address details, but didn't use salen
> > either.
> >
> > Not taking "salen" into account may result in incorrect "path" being
> > returned in monitors commands, as we read past the address which is not
> > necessarily \0-terminated.
> >
> > Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
> > Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  util/qemu-sockets.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 080a240b74..f2f3676d1f 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
> >      SocketAddress *addr;
> >      struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
> >
> > +    assert(salen >=3D sizeof(su->sun_family) + 1 &&
> > +           salen <=3D sizeof(struct sockaddr_un));
> > +
> >      addr =3D g_new0(SocketAddress, 1);
> >      addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
> >  #ifdef CONFIG_LINUX
> >      if (!su->sun_path[0]) {
> >          /* Linux abstract socket */
> >          addr->u.q_unix.path =3D g_strndup(su->sun_path + 1,
> > -                                        sizeof(su->sun_path) - 1);
> > +                                        salen - sizeof(su->sun_family)
> - 1);
> >          addr->u.q_unix.has_abstract =3D true;
> >          addr->u.q_unix.abstract =3D true;
> >          addr->u.q_unix.has_tight =3D true;
>
> Is this for 6.1?
>

That would make sense, along with a few chardev fixes. Either Daniel (or
someone else) queue this, or I will eventually prepare a PR.

thanks

--000000000000b1b65205c8b7c3ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 12:39 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Commit 776b97d360 &quot;qemu-sockets: add abstract UNIX domain socket<=
br>
&gt; support&quot; neglected to update socket_sockaddr_to_address_unix() an=
d<br>
&gt; copied the whole sun_path without taking &quot;salen&quot; into accoun=
t.<br>
&gt;<br>
&gt; Later, commit 3b14b4ec49 &quot;sockets: Fix socket_sockaddr_to_address=
_unix()<br>
&gt; for abstract sockets&quot; handled the abstract UNIX path, by strippin=
g the<br>
&gt; leading \0 character and fixing address details, but didn&#39;t use sa=
len<br>
&gt; either.<br>
&gt;<br>
&gt; Not taking &quot;salen&quot; into account may result in incorrect &quo=
t;path&quot; being<br>
&gt; returned in monitors commands, as we read past the address which is no=
t<br>
&gt; necessarily \0-terminated.<br>
&gt;<br>
&gt; Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9<br>
&gt; Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 util/qemu-sockets.c | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; index 080a240b74..f2f3676d1f 100644<br>
&gt; --- a/util/qemu-sockets.c<br>
&gt; +++ b/util/qemu-sockets.c<br>
&gt; @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockadd=
r_storage *sa,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SocketAddress *addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un *su =3D (struct sockaddr_un *)s=
a;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt;sun_family) + 1 &amp=
;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct =
sockaddr_un));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addr =3D g_new0(SocketAddress, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<br>
&gt;=C2=A0 #ifdef CONFIG_LINUX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!su-&gt;sun_path[0]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Linux abstract socket */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup=
(su-&gt;sun_path + 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
of(su-&gt;sun_path) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sale=
n - sizeof(su-&gt;sun_family) - 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.has_abstract =3D t=
rue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.abstract =3D true;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.has_tight =3D true=
;<br>
<br>
Is this for 6.1?<br></blockquote><div><br></div><div>That would make sense,=
 along with a few chardev fixes. Either Daniel (or someone else) queue this=
, or I will eventually prepare a PR.</div><div><br></div><div>thanks<br></d=
iv></div></div>

--000000000000b1b65205c8b7c3ed--


