Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F36B3607
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 06:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paV93-00032t-5h; Fri, 10 Mar 2023 00:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1paV8u-00032e-EY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 00:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1paV8r-0000WB-4o
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 00:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678425485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BLBJoT1noapG8yOELZNTsxQhu3FFpOXFleAPDybYtA=;
 b=aG+XhzNacWT0xnLgAvXqi2xIGFUzytGpLsk65v4bN9kpw18BwklGCsSxG9DJze1Hi10zHw
 Z+nRkVphvT/VSaPBy4UTDy0jfsMeEBmTNXLrHvze/oGN3Tx0pO3WbVYhHpZqHIjzKHMZ8j
 3WOvQ5y0BJ+I8LrkA7/kZ0IXs009k0Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-1k9huV9mMrO0azy05km5hg-1; Fri, 10 Mar 2023 00:18:03 -0500
X-MC-Unique: 1k9huV9mMrO0azy05km5hg-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn8-20020a05640222e800b004bd35dd76a9so6033794edb.13
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 21:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678425482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BLBJoT1noapG8yOELZNTsxQhu3FFpOXFleAPDybYtA=;
 b=J0zyUVD7+oZ+HbfQkJyBz7YF+yqh7jaO5MfYgehWHa1ziyNi+0+/TFWFGijjdKFtyB
 JOgY+5SknAs5nP/5Y/IMARtxUCE3zOukbpzgY3vOYiAlZ8t7biJqfVrunc26198tjAXn
 obAMUUbSbq1vhrBniUBep8Ikz1m5ekX0QQ/rTfplpmP07DcOjpHdCv78Z2g+iWu8TlPP
 azZbEsGgS/XUtuGvKqz756F/LvfBzimzFDxOb00RLMoyHX14HYCNfhw50+jdjycMIHFE
 2ntF74PtS9a4pEvclf87OPG54aGYXw74pH00oZJ8k2swktKBkZU53jqCQK8bteL+HCtA
 HGVA==
X-Gm-Message-State: AO0yUKUptqjnUBWy9wQs01wXxfq5FGPhJPfZI0PHWLyzch7JI2p0xpOO
 wew3OOEKn8YjIwrMnk3v9F1yFunKJnp5i0hJ3yiDC8XuuMd/LrmklyLLgzx3PRRrCfG3vBkuqUV
 +f7a60+kq0HaMsmRgqPyLfoA86s06nNM=
X-Received: by 2002:a17:906:a05a:b0:8b2:23fb:dfd1 with SMTP id
 bg26-20020a170906a05a00b008b223fbdfd1mr12766220ejb.2.1678425482429; 
 Thu, 09 Mar 2023 21:18:02 -0800 (PST)
X-Google-Smtp-Source: AK7set86mZaOBxv5/SSQIACI3uB65C2W/2IOmK6tchoB2cvYKxtAigeff1HJJa5BxUVBQpdE1V7yVyZWbMBox9pEuqA=
X-Received: by 2002:a17:906:a05a:b0:8b2:23fb:dfd1 with SMTP id
 bg26-20020a170906a05a00b008b223fbdfd1mr12766208ejb.2.1678425482131; Thu, 09
 Mar 2023 21:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-15-marcandre.lureau@redhat.com>
 <7dee3544-2f80-3e44-c73d-1ddd507f00df@linaro.org>
In-Reply-To: <7dee3544-2f80-3e44-c73d-1ddd507f00df@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 10 Mar 2023 09:17:50 +0400
Message-ID: <CAMxuvawJ7WJxH1vnLLswmPdQw7wcYAxhjHjUn5ved1NOMGxQgw@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] ui/sdl: add optional logging when _SDL_DEBUG is
 set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 slouken@libsdl.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a50a1405f684e277"
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

--000000000000a50a1405f684e277
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

(adding Sam Lantinga, SDL maintainer, in CC. I noticed he worked on QEMU
SDL backend yesterday! ;)

On Thu, Mar 9, 2023 at 8:40=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Apparently, there is no environment variable you can set for libsdl to
> > enable logging.
>
> Why not use getenv() in QEMU then?
>

QEMU has few environment variables. We generally prefer qmp/cmd arguments.
And that change does not fit with QEMU tracing etc.



> > (similar to _VNC_DEBUG)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   include/ui/sdl2.h | 2 ++
> >   ui/sdl2.c         | 4 ++++
> >   2 files changed, 6 insertions(+)
> >
> > diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
> > index 8fb7e08262..6fea36db82 100644
> > --- a/include/ui/sdl2.h
> > +++ b/include/ui/sdl2.h
> > @@ -6,6 +6,8 @@
> >
> >   #include <SDL.h>
> >
> > +/* #define _SDL_DEBUG 1 */
> > +
> >   /* with Alpine / muslc SDL headers pull in directfb headers
> >    * which in turn trigger warning about redundant decls for
> >    * direct_waitqueue_deinit.
> > diff --git a/ui/sdl2.c b/ui/sdl2.c
> > index f259e4c4d1..592eca3e1c 100644
> > --- a/ui/sdl2.c
> > +++ b/ui/sdl2.c
> > @@ -841,6 +841,10 @@ static void sdl2_display_init(DisplayState *ds,
> DisplayOptions *o)
> >       }
> >   #endif
> >
> > +#ifdef _SDL_DEBUG
> > +    SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
> > +#endif
>

Sam, do you suggest a better way to enable SDL debugging when starting
QEMU? Is there a way to enable it with existing SDL environment variables?

thanks

> +
> >       if (SDL_Init(SDL_INIT_VIDEO)) {
> >           fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
> >                   SDL_GetError());
>
>

--000000000000a50a1405f684e277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><div><br></div><div>(adding S=
am Lantinga, SDL maintainer, in CC. I noticed he worked on QEMU SDL backend=
 yesterday! ;)</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Mar 9, 2023 at 8:40=E2=80=AFPM Philippe Ma=
thieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 7/3/23 12:56, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_=
blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Apparently, there is no environment variable you can set for libsdl to=
<br>
&gt; enable logging.<br>
<br>
Why not use getenv() in QEMU then?<br></blockquote><div><br></div><div>QEMU=
 has few environment variables. We generally prefer qmp/cmd arguments. And =
that change does not fit with QEMU tracing etc.</div><div><br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; (similar to _VNC_DEBUG)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/ui/sdl2.h | 2 ++<br>
&gt;=C2=A0 =C2=A0ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h<br>
&gt; index 8fb7e08262..6fea36db82 100644<br>
&gt; --- a/include/ui/sdl2.h<br>
&gt; +++ b/include/ui/sdl2.h<br>
&gt; @@ -6,6 +6,8 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;SDL.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* #define _SDL_DEBUG 1 */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* with Alpine / muslc SDL headers pull in directfb header=
s<br>
&gt;=C2=A0 =C2=A0 * which in turn trigger warning about redundant decls for=
<br>
&gt;=C2=A0 =C2=A0 * direct_waitqueue_deinit.<br>
&gt; diff --git a/ui/sdl2.c b/ui/sdl2.c<br>
&gt; index f259e4c4d1..592eca3e1c 100644<br>
&gt; --- a/ui/sdl2.c<br>
&gt; +++ b/ui/sdl2.c<br>
&gt; @@ -841,6 +841,10 @@ static void sdl2_display_init(DisplayState *ds, D=
isplayOptions *o)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#ifdef _SDL_DEBUG<br>
&gt; +=C2=A0 =C2=A0 SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);<br>
&gt; +#endif<br></blockquote><div><br></div><div>Sam, do you suggest a bett=
er way to enable SDL debugging when starting QEMU? Is there a way to enable=
 it with existing SDL environment variables?<br></div><div>=C2=A0</div><div=
>thanks</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (SDL_Init(SDL_INIT_VIDEO)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Could no=
t initialize SDL(%s) - exiting\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SD=
L_GetError());<br>
<br>
</blockquote></div></div>

--000000000000a50a1405f684e277--


