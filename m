Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5E3FCDAF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:24:08 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9Md-0005Zt-F2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL9Kg-0004Zm-2o
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mL9Ka-00069w-Pe
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630437719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+qx9YjAbq9FTehpYBdDoW7AnFfQ6PWZUFgUsV2CO1Jw=;
 b=dHbk3QzPhiWh4noDyGj5atWP+VFakxxwNOLE5z+FU9LVgddFpbeVSbI67n19aEkPdkuRQm
 lGJHGPiJUEUods0Bh4iQjvLormHBLUDZ1A3v70b2s6cERwwtV9HM1Holn76hxAIdDzI8Qd
 9ZhYh1IFCv31NNGvlRmdgQv3bJ9+emg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-gUGrWcaUN4WG0I3X6q4dsg-1; Tue, 31 Aug 2021 15:21:55 -0400
X-MC-Unique: gUGrWcaUN4WG0I3X6q4dsg-1
Received: by mail-pj1-f69.google.com with SMTP id
 m9-20020a17090ade09b029017903cc8d6cso1899260pjv.4
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qx9YjAbq9FTehpYBdDoW7AnFfQ6PWZUFgUsV2CO1Jw=;
 b=mdVe5zEYzDmQs5ihfCe88mKHCduAw8WRjLOAUygbG8SFTeDrAOCrW67t2+0tW8hAhy
 fa1aNgWtc9nCIMY145CcEq5mLg7WrGoc1mIHkX0MOPFMKJ6bMU1FTPZIXg4ieWZ4di5P
 g/+9+K7e03XPTD/0n/FffT6eDrlQQxtXpbSAhyXMTQsPQK/g3XxeAoccze5+noDYJmB7
 u56lBdWmBO0YPoVbrMMUP0ruze4AvDqtYztWCTHZ5oWIP+896yhWte9ZrBWcycYMRS5i
 1RqMhoYYWXhIiuT/DAXnn+bB9E2moB70D/oPJ7CswvrayHlqHHhIIqriJUSi5vYUX7ri
 hjnw==
X-Gm-Message-State: AOAM531nhYN2Vw/PSOOfUMaW6RY5b+X4VFk/pM4rB+6n9zb/C7U6jUUz
 0DgELyEqZg4ezOQw+NtRgPkaQRsKk+UXZqkMXMW69WNBAo8u4z4rnDThbpyPvJjoil9SekoPlUL
 CH27tgkMLkzqLMqrOvGHYc/EeV735Apw=
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id
 k6-20020a170902c40600b00138c28fa779mr6158604plk.1.1630437714528; 
 Tue, 31 Aug 2021 12:21:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuWXl/SLMlpqDpZMw8nWSEyxA404jGNk6nnFMeS46yuM2zaKyYx+laNKoiokax52f4snfif+pwGXDBO3sZOLI=
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id
 k6-20020a170902c40600b00138c28fa779mr6158586plk.1.1630437714234; Tue, 31 Aug
 2021 12:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 31 Aug 2021 23:21:43 +0400
Message-ID: <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c929e205cadfdc77"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c929e205cadfdc77
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Aug 31, 2021 at 10:26 PM Michael Tokarev <mjt@tls.msk.ru> wrote:

> We test whenever the path of unix-domain socket
> address is non-empty and strictly-less than
> the length of the path buffer. Both these
> conditions are wrong: the socket can be unnamed,
> with empty path, or socket can have pathname
> null-terminated _after_ the sun_path buffer,
> since we provided more room when asking kernel.
>
> So on one side, allow empty, unnamed sockets
> (and adjust the test for abstract socket too -
> only do that if the socket is not unnamed),
> and on another side, allow path length to be
> up to our own maximum, - we have up to size
> of sockaddr_storage there.
>
> While at it, fix the duplication of regular
> pathname socket to not require trailing \0
> (since it can be missing for unnamed sockets).
>
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: qemu-stable@nongnu.org
> --
> Two questions.
> 1. Why do we store the name of the socket to start with?
> 2. The code in the abstract socket case should not use
>    g_strndup but g_memdup instead, since the whole thing
>    is a blob of the given length, not a \0-terminated string.
> ---
>  util/qemu-sockets.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..7c83d81792 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,20 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su = (struct sockaddr_un *)sa;
>
> -    assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> +    /* there's a corner case when trailing \0 does not fit into
> +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
> +     * not with sizeof(sockaddr_un), since this is what we actually
> +     * provide, to ensure we had no truncation and a room for
> +     * the trailing \0 which we add below.
> +     * When salen == sizeof(sun_family) it is unnamed socket,
> +     * and when first byte of sun_path is \0, it is abstract. */
> +    assert(salen >= sizeof(su->sun_family) &&
> +           salen <= sizeof(struct sockaddr_storage));
>

Seems right to me, however there are some notes in libc bits/socket.h
/* Structure large enough to hold any socket address (with the historical
   exception of AF_UNIX).  */

And also this
https://idea.popcount.org/2019-12-06-addressing/#fn:sockaddr_storage

I must say I feel confused by those comments :) Is it large enough or not??


>      addr = g_new0(SocketAddress, 1);
>      addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>  #ifdef CONFIG_LINUX
> -    if (!su->sun_path[0]) {
> +    if (salen > sizeof(su->sun_family) && !su->sun_path[0]) {
>          /* Linux abstract socket */
>          addr->u.q_unix.path = g_strndup(su->sun_path + 1,
>                                          salen - sizeof(su->sun_family) -
> 1);
> @@ -1363,7 +1370,7 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
>      }
>  #endif
>
> -    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
> +    addr->u.q_unix.path = g_strndup(su->sun_path, salen -
> sizeof(su->sun_family));
>

looks good to me otherwise

     return addr;
>  }
>  #endif /* WIN32 */
> --
> 2.30.2
>
>

--000000000000c929e205cadfdc77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 31, 2021 at 10:26 PM Mi=
chael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We test w=
henever the path of unix-domain socket<br>
address is non-empty and strictly-less than<br>
the length of the path buffer. Both these<br>
conditions are wrong: the socket can be unnamed,<br>
with empty path, or socket can have pathname<br>
null-terminated _after_ the sun_path buffer,<br>
since we provided more room when asking kernel.<br>
<br>
So on one side, allow empty, unnamed sockets<br>
(and adjust the test for abstract socket too -<br>
only do that if the socket is not unnamed),<br>
and on another side, allow path length to be<br>
up to our own maximum, - we have up to size<br>
of sockaddr_storage there.<br>
<br>
While at it, fix the duplication of regular<br>
pathname socket to not require trailing \0<br>
(since it can be missing for unnamed sockets).<br>
<br>
Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)<br>
Fixes: <a href=3D"http://bugs.debian.org/993145" rel=3D"noreferrer" target=
=3D"_blank">http://bugs.debian.org/993145</a><br>
Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=
=3D"_blank">mjt@tls.msk.ru</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a><br>
--<br>
Two questions.<br>
1. Why do we store the name of the socket to start with?<br>
2. The code in the abstract socket case should not use<br>
=C2=A0 =C2=A0g_strndup but g_memdup instead, since the whole thing<br>
=C2=A0 =C2=A0is a blob of the given length, not a \0-terminated string.<br>
---<br>
=C2=A0util/qemu-sockets.c | 15 +++++++++++----<br>
=C2=A01 file changed, 11 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index f2f3676d1f..7c83d81792 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -1345,13 +1345,20 @@ socket_sockaddr_to_address_unix(struct sockaddr_sto=
rage *sa,<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_un *su =3D (struct sockaddr_un *)sa;<br=
>
<br>
-=C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt;sun_family) + 1 &amp;&amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct socka=
ddr_un));<br>
+=C2=A0 =C2=A0 /* there&#39;s a corner case when trailing \0 does not fit i=
nto<br>
+=C2=A0 =C2=A0 =C2=A0* sockaddr_un. Compare length with sizeof(sockaddr_sto=
rage),<br>
+=C2=A0 =C2=A0 =C2=A0* not with sizeof(sockaddr_un), since this is what we =
actually<br>
+=C2=A0 =C2=A0 =C2=A0* provide, to ensure we had no truncation and a room f=
or<br>
+=C2=A0 =C2=A0 =C2=A0* the trailing \0 which we add below.<br>
+=C2=A0 =C2=A0 =C2=A0* When salen =3D=3D sizeof(sun_family) it is unnamed s=
ocket,<br>
+=C2=A0 =C2=A0 =C2=A0* and when first byte of sun_path is \0, it is abstrac=
t. */<br>
+=C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt;sun_family) &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct socka=
ddr_storage));<br></blockquote><div><br></div><div>Seems right to me, howev=
er there are some notes in libc bits/socket.h<br></div><div>/* Structure la=
rge enough to hold any socket address (with the historical<br>=C2=A0 =C2=A0=
exception of AF_UNIX). =C2=A0*/</div><div><br></div><div>And also this<br><=
/div><div><a href=3D"https://idea.popcount.org/2019-12-06-addressing/#fn:so=
ckaddr_storage">https://idea.popcount.org/2019-12-06-addressing/#fn:sockadd=
r_storage</a></div><div><br> </div><div>I must say I feel confused by those=
 comments :) Is it large enough or not??<br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddress, 1);<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<br>
=C2=A0#ifdef CONFIG_LINUX<br>
-=C2=A0 =C2=A0 if (!su-&gt;sun_path[0]) {<br>
+=C2=A0 =C2=A0 if (salen &gt; sizeof(su-&gt;sun_family) &amp;&amp; !su-&gt;=
sun_path[0]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux abstract socket */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path =3D g_strndup(su-&=
gt;sun_path + 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sa=
len - sizeof(su-&gt;sun_family) - 1);<br>
@@ -1363,7 +1370,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_stora=
ge *sa,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, sizeof=
(su-&gt;sun_path));<br>
+=C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup(su-&gt;sun_path, salen =
- sizeof(su-&gt;sun_family));<br></blockquote><div><br></div><div>looks goo=
d to me otherwise</div><div> <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
=C2=A0#endif /* WIN32 */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000c929e205cadfdc77--


