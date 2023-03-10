Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143726B43BA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1padWp-0007k6-Ac; Fri, 10 Mar 2023 09:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slouken@libsdl.org>)
 id 1paVxp-0003gp-LQ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 01:10:51 -0500
Received: from bird.elm.relay.mailchannels.net ([23.83.212.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slouken@libsdl.org>)
 id 1paVxm-00047C-MH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 01:10:49 -0500
X-Sender-Id: dreamhost|x-authsender|admin@libsdl.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 102E8501D2B
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:10:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a215.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id A9A4E501EB7
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:10:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1678428640; a=rsa-sha256;
 cv=none;
 b=BsJGizF/MM+qrKeVDPFvxNfriPXl3zjQsPsRxntgV/9xbKPgij9YMUPCL8cgLIFI+qNA4j
 uVeWTchQvnM+SzZtRy3DmxTjGicFdmt7w+GPGDAFQB5rxUTlG/ZricR0nPh+IFIG/Mp5NI
 w6cEL3FEYz9bWgcz5i/8RZXbYbPXe0JzJAHBKUy1uF4qnnS/SlfuYt1ZWHM45jOvBk4aML
 8hqqJqq4/ZqAyJaQerkAVI3fdaVvdJ9po3joaN5t9DaNRyb9x780qNZ689jA+H9ix02ao2
 Toa8unuuteNwoO1aYZMIMfy1mZp6FWYLaYmL7rWAmRcmcwxdT5s3Eg4N5gto0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1678428640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=BzhyjkwWbwv0Z2AUC3wuq3aqt5fbJdWFOE9QO/bkX+k=;
 b=CVzPAIfobvOKSzelbnKd5y2/DRY9vxmE8ZpkAWJoCUKnzAiKTja/buLmBqkE1FHfAKShQR
 KaZeZf4wgoc2SJxOX9jFEt9EMao5Rlff/C7sgEtiEMzNrBDeXGYY9bfSjb+2iI0ymoZzT7
 oMiDFIJP0bS83fyeFBinUiSGvElO30OZRBMwNCj9l3WMZXeKtugkWv0mPaZ2GufOhNDWWg
 YwG+ZJJLHzfioqMHPsVRUEVNvEmSN4eZOxVqctSAGvgH+4ltPteSyaseQjS2vBK4Sa48mF
 ujfpnFVI+hMFaOtIpfjqcU1g43oFKG7nR193oIFokzFTU1R+eaDPwMBEIxP4TA==
ARC-Authentication-Results: i=1; rspamd-bc7fd96c5-b6khg;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=slouken@libsdl.org
X-Sender-Id: dreamhost|x-authsender|admin@libsdl.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|admin@libsdl.org
X-MailChannels-Auth-Id: dreamhost
X-Attack-Versed: 758541335a6bc719_1678428640905_889118873
X-MC-Loop-Signature: 1678428640905:721958025
X-MC-Ingress-Time: 1678428640905
Received: from pdx1-sub0-mail-a215.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.107.49.211 (trex/6.7.2); Fri, 10 Mar 2023 06:10:40 +0000
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: admin@libsdl.org)
 by pdx1-sub0-mail-a215.dreamhost.com (Postfix) with ESMTPSA id 4PXwdr3VCczxQ
 for <qemu-devel@nongnu.org>; Thu,  9 Mar 2023 22:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libsdl.org;
 s=dreamhost; t=1678428640;
 bh=u6wBOytcUjqFycYoyanyMXPbFYQmQ4YTAO5QNZySepM=;
 h=From:Date:Subject:To:Cc:Content-Type;
 b=uhPnMbWaTxG0ULNUk9RPQToES/1tp5qHPB/f81T8ryFGRxvNo28RHtlc452eJOATy
 9njSofrXuN962MmIWGk+J1AsnFEAZ6YWbR8YRATJU3r8UqRhWa1BDvvKcU64QU5Az9
 pCV6rRY8KQQCcUile7WJBDWVY1pLE32cEgDFkrnaepB8rAYFMHARaB6FNzU6JPLWTW
 c7PQuWBtd8EDq54rE6C/vbcLdzCzP//jrQMVtt+hgJEmGQAweIWVN66FKI4SkUXqpx
 DNgm4/WhU0W7w6fAt31LMwxXoTWUfRhwVzqVeL2NezA+H6QnFvu7HMOA/XoDDh7x6i
 Yvwn6cxG0O9uQ==
Received: by mail-pf1-f174.google.com with SMTP id fd25so2985296pfb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 22:10:40 -0800 (PST)
X-Gm-Message-State: AO0yUKVLB3iS70I4q4HtBnuuvlIqu3KO6nJ0NjtNYsT6s7QejOuwO+pF
 OqG3zzRCDostrpAsvfpL+tjCL58NSjNC/1FVgoE=
X-Google-Smtp-Source: AK7set/1nR5kJkzKkcf3+taFvkThKoulisozOJAYJ668GlDyCRTUJ401bBAbKt+v/Hjr2EqlkYrll7BwwLXa11wARfs=
X-Received: by 2002:a63:7d1b:0:b0:503:77cd:b7b4 with SMTP id
 y27-20020a637d1b000000b0050377cdb7b4mr8672137pgc.12.1678428640063; Thu, 09
 Mar 2023 22:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-15-marcandre.lureau@redhat.com>
 <7dee3544-2f80-3e44-c73d-1ddd507f00df@linaro.org>
 <CAMxuvawJ7WJxH1vnLLswmPdQw7wcYAxhjHjUn5ved1NOMGxQgw@mail.gmail.com>
In-Reply-To: <CAMxuvawJ7WJxH1vnLLswmPdQw7wcYAxhjHjUn5ved1NOMGxQgw@mail.gmail.com>
From: Sam Lantinga <slouken@libsdl.org>
Date: Thu, 9 Mar 2023 22:10:29 -0800
X-Gmail-Original-Message-ID: <CACC3sbEEc2NhL=vuimH0o2_n0YEBh2Pgb3ii0bRnki_iY2pWdw@mail.gmail.com>
Message-ID: <CACC3sbEEc2NhL=vuimH0o2_n0YEBh2Pgb3ii0bRnki_iY2pWdw@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] ui/sdl: add optional logging when _SDL_DEBUG is
 set
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000df3a7205f6859e83"
Received-SPF: pass client-ip=23.83.212.17; envelope-from=slouken@libsdl.org;
 helo=bird.elm.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Mar 2023 09:15:08 -0500
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

--000000000000df3a7205f6859e83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you wanted, you could use the SDL hint system, e.g.

if (SDL_GetHintBoolean("QEMU_ENABLE_SDL_LOGGING", SDL_FALSE)) {
    SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
}

Then someone can set that environment variable and it would be using the
SDL mechanisms rather than intruding on QEMU... or, if you want tighter
integration, you can set an SDL log handler that feeds into the QEMU
tracing system.

On Thu, Mar 9, 2023 at 9:18=E2=80=AFPM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> (adding Sam Lantinga, SDL maintainer, in CC. I noticed he worked on QEMU
> SDL backend yesterday! ;)
>
> On Thu, Mar 9, 2023 at 8:40=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
> wrote:
>
>> On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Apparently, there is no environment variable you can set for libsdl to
>> > enable logging.
>>
>> Why not use getenv() in QEMU then?
>>
>
> QEMU has few environment variables. We generally prefer qmp/cmd arguments=
.
> And that change does not fit with QEMU tracing etc.
>
>
>
>> > (similar to _VNC_DEBUG)
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >   include/ui/sdl2.h | 2 ++
>> >   ui/sdl2.c         | 4 ++++
>> >   2 files changed, 6 insertions(+)
>> >
>> > diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
>> > index 8fb7e08262..6fea36db82 100644
>> > --- a/include/ui/sdl2.h
>> > +++ b/include/ui/sdl2.h
>> > @@ -6,6 +6,8 @@
>> >
>> >   #include <SDL.h>
>> >
>> > +/* #define _SDL_DEBUG 1 */
>> > +
>> >   /* with Alpine / muslc SDL headers pull in directfb headers
>> >    * which in turn trigger warning about redundant decls for
>> >    * direct_waitqueue_deinit.
>> > diff --git a/ui/sdl2.c b/ui/sdl2.c
>> > index f259e4c4d1..592eca3e1c 100644
>> > --- a/ui/sdl2.c
>> > +++ b/ui/sdl2.c
>> > @@ -841,6 +841,10 @@ static void sdl2_display_init(DisplayState *ds,
>> DisplayOptions *o)
>> >       }
>> >   #endif
>> >
>> > +#ifdef _SDL_DEBUG
>> > +    SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
>> > +#endif
>>
>
> Sam, do you suggest a better way to enable SDL debugging when starting
> QEMU? Is there a way to enable it with existing SDL environment variables=
?
>
> thanks
>
> > +
>> >       if (SDL_Init(SDL_INIT_VIDEO)) {
>> >           fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
>> >                   SDL_GetError());
>>
>>

--000000000000df3a7205f6859e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you wanted, you could use the SDL hint system, e.g.<div=
><br></div><div>if (SDL_GetHintBoolean(&quot;QEMU_ENABLE_SDL_LOGGING&quot;,=
 SDL_FALSE)) {</div><div>=C2=A0 =C2=A0 SDL_LogSetAllPriority(SDL_LOG_PRIORI=
TY_VERBOSE);</div><div>}</div><div><br></div><div>Then someone can set that=
 environment variable and it would be using the SDL mechanisms rather than =
intruding on QEMU... or, if you want tighter integration, you can set an SD=
L log handler that feeds into the QEMU tracing system.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 9, =
2023 at 9:18=E2=80=AFPM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr">Hi<br></div><div><br></div><div>(adding Sam Lantinga, SDL maintain=
er, in CC. I noticed he worked on QEMU SDL backend yesterday! ;)</div><div>=
<br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Mar 9, 2023 at 8:40=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/3/=
23 12:56, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">=
marcandre.lureau@redhat.com</a> wrote:<br>
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
</blockquote></div>

--000000000000df3a7205f6859e83--

