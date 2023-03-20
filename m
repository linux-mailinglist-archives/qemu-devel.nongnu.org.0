Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541816C0FD7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:56:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDBI-0002XH-12; Mon, 20 Mar 2023 06:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1peDBG-0002Wx-1I
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1peDBE-00050b-FA
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679309755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z+w10vrBtb84Qosn/1CJ2YUsBaoGx1zipv0CLVshCPM=;
 b=K3BjCbRmaPgSjLRS2ic9WbLuT1cE/02LJb6MEUU2m9nAYuTXb+FCnZnoFymNmFnWTofXj7
 EJF76mGagsL5Sjyh+5ydwTb8T10KYRtMos5CAKXveHxm8hZ9CXzQqDc9GMR19eWtupW1CC
 pm8uwGbHcBpIM9kYGX8rDE+Wlyt8uIo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-bGa0RiErOWqebcNWp1p00w-1; Mon, 20 Mar 2023 06:55:53 -0400
X-MC-Unique: bGa0RiErOWqebcNWp1p00w-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso16845536edb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679309752;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+w10vrBtb84Qosn/1CJ2YUsBaoGx1zipv0CLVshCPM=;
 b=xcSnoZe44orNpvKLTYQ5wffUSgy+QONs6xzP221rCJ4kUppx/J1zmyeU+CGfZOY8/b
 unyzOOSwsfHpCEOE/KZSc22pljmXJf6hbF4LNMmusX/y0BbWA4J/yLrzMF3aHzPHs/w7
 9/E7EBUrSAL6QWVt4xm3qlXPJz72plgE2ra/inAd5j/nQ+E+uYKFYfojSUJXTfZMxqnA
 8UEmxPMppgURlT1vedo2NZthv/h5NzZE6umr4M3/BD1q4Zl7SynKXglkzO1pSezhw3Iv
 MiX/k5Hn7JyMvf1at2g5zu3XvzXLKp0VlxhBkDv6x9YKv/rRqPU1eegK7y2WBej4LC9H
 UE5g==
X-Gm-Message-State: AO0yUKWtq0KePr80geWrVzDSkElLw1BMCcZxeuyZJwnqihQNGf3LJO4G
 +ObPUjRk2koQvjE9VrbCu57BW1ZbM58D6GYTzKQ2PEWpfbD3cTBXE2mdoAYNRiePOfpRYjE8+pu
 8SYWh2xGJsLAwWURAIhGdUbC7OVpxUUc=
X-Received: by 2002:a17:906:cf8d:b0:930:310:abef with SMTP id
 um13-20020a170906cf8d00b009300310abefmr3899713ejb.3.1679309752597; 
 Mon, 20 Mar 2023 03:55:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set+DC5+XkOg0T3KsO21zjGlJtAeABqk2d4/SVIMNjvX8fftrqTNpZjYznaH5HI76vRvqZyod6S6uHYHtcKNw1fc=
X-Received: by 2002:a17:906:cf8d:b0:930:310:abef with SMTP id
 um13-20020a170906cf8d00b009300310abefmr3899705ejb.3.1679309752373; Mon, 20
 Mar 2023 03:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230320105404.637661-1-berrange@redhat.com>
In-Reply-To: <20230320105404.637661-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Mar 2023 14:55:41 +0400
Message-ID: <CAMxuvazMJ6fUdwaU6yftc8EdBAtkf1NFk9KN41pSJNF7y=AZTg@mail.gmail.com>
Subject: Re: [PATCH] python: honour message limit when using pre-opened socket
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000042222b05f752c5f1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--00000000000042222b05f752c5f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 2:54=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> The default message recv limit in asyncio is smaller than our needs, so
> when opening connections we override it. This was done when opening a
> connection using a socket address, but was missed when using a
> pre-opened socket file descriptor.
>
> This latent bug was exposed when the QEMUMachine class was enhanced to
> use socketpair() when no socket address was passed by:
>
>   commit bd4c0ef409140bd1be393407c04005ac077d4574
>   Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>   Date:   Wed Jan 11 12:01:01 2023 +0400
>
>     python/qemu/machine: use socketpair() for QMP by default
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>


thanks
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  python/qemu/qmp/protocol.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
> index 22e60298d2..2bd341a93e 100644
> --- a/python/qemu/qmp/protocol.py
> +++ b/python/qemu/qmp/protocol.py
> @@ -307,7 +307,10 @@ async def open_with_socket(self, sock: socket.socket=
)
> -> None:
>
>          :raise StateError: When the `Runstate` is not `IDLE`.
>          """
> -        self._reader, self._writer =3D await
> asyncio.open_connection(sock=3Dsock)
> +        self._reader, self._writer =3D await asyncio.open_connection(
> +            sock=3Dsock,
> +            limit=3Dself._limit,
> +        )
>          self._set_state(Runstate.CONNECTING)
>
>      @upper_half
> --
> 2.39.2
>
>

--00000000000042222b05f752c5f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 20, 2023 at 2:54=E2=80=AF=
PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berra=
nge@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The default message recv limit in asyncio is smaller than our=
 needs, so<br>
when opening connections we override it. This was done when opening a<br>
connection using a socket address, but was missed when using a<br>
pre-opened socket file descriptor.<br>
<br>
This latent bug was exposed when the QEMUMachine class was enhanced to<br>
use socketpair() when no socket address was passed by:<br>
<br>
=C2=A0 commit bd4c0ef409140bd1be393407c04005ac077d4574<br>
=C2=A0 Author: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Wed Jan 11 12:01:01 2023 +0400<br>
<br>
=C2=A0 =C2=A0 python/qemu/machine: use socketpair() for QMP by default<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div><br></div><div>thanks<br></div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0python/qemu/qmp/protocol.py | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py<br>
index 22e60298d2..2bd341a93e 100644<br>
--- a/python/qemu/qmp/protocol.py<br>
+++ b/python/qemu/qmp/protocol.py<br>
@@ -307,7 +307,10 @@ async def open_with_socket(self, sock: socket.socket) =
-&gt; None:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:raise StateError: When the `Runstate` is=
 not `IDLE`.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._reader, self._writer =3D await asyncio.o=
pen_connection(sock=3Dsock)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._reader, self._writer =3D await asyncio.o=
pen_connection(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock=3Dsock,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit=3Dself._limit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._set_state(Runstate.CONNECTING)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@upper_half<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--00000000000042222b05f752c5f1--


