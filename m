Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA5337F87
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:19:04 +0100 (CET)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKShz-0008Nk-7B
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSf7-0006T7-Hu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:16:05 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSey-0007wP-Q8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:16:05 -0500
Received: by mail-ed1-x534.google.com with SMTP id y6so4929329eds.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4d3ZVjFbOneWYmvqMlFQz2+dCDu6maqtHmPdB0Q7+Q=;
 b=aUjt3nqG03pnzAF1/1vllq3JVLBm1VCWtfD+jG/ZS2WhPu4OuexdMx5lTV9+K3cc8W
 LAfE4SU+LgtFAyI+MsvWUe1GAIYbtxGRhbMSydzmZRnp1WyXEFgHhvqZN3PFCl9XG2BJ
 zmeYMR0D28iGzEYupDpSynZui12Qb9KPrRYpY+lx+LdrZ7gL+LGVELwtzdV9m/wOOij7
 k3u+AOK3smYW40o0zr8x4FiIyAlLfrYqXPD3LJJj6zNpNB8hN/UD0s0ebMf/Rzz6qXa2
 q4+uQtYWPBqu7g3z016gcCcwjRI84N0wqnPI0A55jCNfpocoganNKXwlCcSZbX0mZbMy
 JVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4d3ZVjFbOneWYmvqMlFQz2+dCDu6maqtHmPdB0Q7+Q=;
 b=LvQICrLKSUHIs7+YTEdVbqdaKK+/I37/U1ZArngtsKCW5RWiJjXCR9CQ89n7DY5IOI
 AHv/qwPlrz/DFXB33tCKkn8Jlbdt2bpPbPYBiyTBDBC5VmAiP2UrNCmSuM77+qDpdg6T
 HaeEiBFjoH/ZRIsyrdj+du9hhBLVV9TV/sh+lvSwqSkcGaizCv8BlP9iPBicO2Vs54wq
 YJOBPtDuulq0+tLTi4y3SXXSgzhMpQdZfeTV2RHP3DNOrn5bVy4YNAkUtuB5jwVGzblO
 7qk0V5NlS+a+zEfDUj56K+a6w4kZDYMpTyCZT8qGSGrDq3LTqE0tVfbQzL/fv1BoN2Rg
 gU1Q==
X-Gm-Message-State: AOAM531yaM+MKENsNLD8GmHtmGXPCce0JrXnq2yKXgtfhOTrBfJbWoSs
 UCK3le7opkT4Za9Paw3UYQaeKPcmrJ401O6jvDk=
X-Google-Smtp-Source: ABdhPJximu7aI5oV9Ds/07oAcgzLs1sbyr+q/VpQt0H2Meusvjw1IDsXRyv2LwGAU2ivPY75zRX62AGf8mAvHUoTw0M=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr10867843edy.30.1615497355020; 
 Thu, 11 Mar 2021 13:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20210311182957.486939-1-berrange@redhat.com>
 <20210311182957.486939-3-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-3-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 01:15:43 +0400
Message-ID: <CAJ+F1C+qHL8vj+q=Uv=dnR+-9q-OmPuv4-P1FV50EGzX6W3hJA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ui: avoid sending framebuffer updates outside client
 desktop bounds
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fb4c2405bd494922"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fb4c2405bd494922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:37 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> We plan framebuffer update rects based on the VNC server surface. If the
> client doesn't support desktop resize, then the client bounds may differ
> from the server surface bounds. VNC clients may become upset if we then
> send an update message outside the bounds of the client desktop.
>
> This takes the approach of clamping the rectangles from the worker
> thread immediately before sending them. This may sometimes results in
> sending a framebuffer update message with zero rectangles.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/trace-events |  5 +++++
>  ui/vnc-jobs.c   | 44 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/ui/trace-events b/ui/trace-events
> index bd8f8a9d18..3838ae2d84 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -59,6 +59,11 @@ vnc_client_throttle_audio(void *state, void *ioc,
> size_t offset) "VNC client thr
>  vnc_client_unthrottle_forced(void *state, void *ioc) "VNC client
> unthrottle forced offset state=3D%p ioc=3D%p"
>  vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offset)
> "VNC client unthrottle incremental state=3D%p ioc=3D%p offset=3D%zu"
>  vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t
> threshold) "VNC client output limit state=3D%p ioc=3D%p offset=3D%zu
> threshold=3D%zu"
> +vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) "VN=
C
> add rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
> +vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int h)
> "VNC job discard rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
> +vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h)
> "VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
> +vnc_job_clamped_rect(void *state, void *job, int x, int y, int w, int h)
> "VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
> +vnc_job_nrects(void *state, void *job, int nrects) "VNC job state=3D%p
> job=3D%p nrects=3D%d"
>  vnc_auth_init(void *display, int websock, int auth, int subauth) "VNC
> auth init state=3D%p websock=3D%d auth=3D%d subauth=3D%d"
>  vnc_auth_start(void *state, int method) "VNC client auth start state=3D%=
p
> method=3D%d"
>  vnc_auth_pass(void *state, int method) "VNC client auth passed state=3D%=
p
> method=3D%d"
> diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
> index dbbfbefe56..4562bf8928 100644
> --- a/ui/vnc-jobs.c
> +++ b/ui/vnc-jobs.c
> @@ -32,6 +32,7 @@
>  #include "qemu/sockets.h"
>  #include "qemu/main-loop.h"
>  #include "block/aio.h"
> +#include "trace.h"
>
>  /*
>   * Locking:
> @@ -94,6 +95,8 @@ int vnc_job_add_rect(VncJob *job, int x, int y, int w,
> int h)
>  {
>      VncRectEntry *entry =3D g_new0(VncRectEntry, 1);
>
> +    trace_vnc_job_add_rect(job->vs, job, x, y, w, h);
> +
>      entry->rect.x =3D x;
>      entry->rect.y =3D y;
>      entry->rect.w =3D w;
> @@ -190,6 +193,8 @@ static void vnc_async_encoding_start(VncState *orig,
> VncState *local)
>      local->zlib =3D orig->zlib;
>      local->hextile =3D orig->hextile;
>      local->zrle =3D orig->zrle;
> +    local->client_width =3D orig->client_width;
> +    local->client_height =3D orig->client_height;
>  }
>
>  static void vnc_async_encoding_end(VncState *orig, VncState *local)
> @@ -202,6 +207,34 @@ static void vnc_async_encoding_end(VncState *orig,
> VncState *local)
>      orig->lossy_rect =3D local->lossy_rect;
>  }
>
> +static bool vnc_worker_clamp_rect(VncState *vs, VncJob *job, VncRect
> *rect)
> +{
> +    trace_vnc_job_clamp_rect(vs, job, rect->x, rect->y, rect->w, rect->h=
);
> +
> +    if (rect->x >=3D vs->client_width) {
> +        goto discard;
> +    }
> +    rect->w =3D MIN(vs->client_width - rect->x, rect->w);
> +    if (rect->w =3D=3D 0) {
> +        goto discard;
> +    }
> +
> +    if (rect->y >=3D vs->client_height) {
> +        goto discard;
> +    }
> +    rect->h =3D MIN(vs->client_height - rect->y, rect->h);
> +    if (rect->h =3D=3D 0) {
> +        goto discard;
> +    }
> +
> +    trace_vnc_job_clamped_rect(vs, job, rect->x, rect->y, rect->w,
> rect->h);
> +    return true;
> +
> + discard:
> +    trace_vnc_job_discard_rect(vs, job, rect->x, rect->y, rect->w,
> rect->h);
> +    return false;
> +}
> +
>  static int vnc_worker_thread_loop(VncJobQueue *queue)
>  {
>      VncJob *job;
> @@ -260,14 +293,17 @@ static int vnc_worker_thread_loop(VncJobQueue *queu=
e)
>              goto disconnected;
>          }
>
> -        n =3D vnc_send_framebuffer_update(&vs, entry->rect.x, entry->rec=
t.y,
> -                                        entry->rect.w, entry->rect.h);
> +        if (vnc_worker_clamp_rect(&vs, job, &entry->rect)) {
> +            n =3D vnc_send_framebuffer_update(&vs, entry->rect.x,
> entry->rect.y,
> +                                            entry->rect.w, entry->rect.h=
);
>
> -        if (n >=3D 0) {
> -            n_rectangles +=3D n;
> +            if (n >=3D 0) {
> +                n_rectangles +=3D n;
> +            }
>          }
>          g_free(entry);
>      }
> +    trace_vnc_job_nrects(&vs, job, n_rectangles);
>      vnc_unlock_display(job->vs->vd);
>
>      /* Put n_rectangles at the beginning of the message */
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fb4c2405bd494922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 10:37 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">We plan framebuffer update rects based on the VNC server surface. If=
 the<br>
client doesn&#39;t support desktop resize, then the client bounds may diffe=
r<br>
from the server surface bounds. VNC clients may become upset if we then<br>
send an update message outside the bounds of the client desktop.<br>
<br>
This takes the approach of clamping the rectangles from the worker<br>
thread immediately before sending them. This may sometimes results in<br>
sending a framebuffer update message with zero rectangles.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/trace-events |=C2=A0 5 +++++<br>
=C2=A0ui/vnc-jobs.c=C2=A0 =C2=A0| 44 ++++++++++++++++++++++++++++++++++++++=
++----<br>
=C2=A02 files changed, 45 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index bd8f8a9d18..3838ae2d84 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -59,6 +59,11 @@ vnc_client_throttle_audio(void *state, void *ioc, size_t=
 offset) &quot;VNC client thr<br>
=C2=A0vnc_client_unthrottle_forced(void *state, void *ioc) &quot;VNC client=
 unthrottle forced offset state=3D%p ioc=3D%p&quot;<br>
=C2=A0vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offs=
et) &quot;VNC client unthrottle incremental state=3D%p ioc=3D%p offset=3D%z=
u&quot;<br>
=C2=A0vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t=
 threshold) &quot;VNC client output limit state=3D%p ioc=3D%p offset=3D%zu =
threshold=3D%zu&quot;<br>
+vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) &quot=
;VNC add rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&quot;<br>
+vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int h) &=
quot;VNC job discard rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&q=
uot;<br>
+vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h) &qu=
ot;VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&quot;=
<br>
+vnc_job_clamped_rect(void *state, void *job, int x, int y, int w, int h) &=
quot;VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&quo=
t;<br>
+vnc_job_nrects(void *state, void *job, int nrects) &quot;VNC job state=3D%=
p job=3D%p nrects=3D%d&quot;<br>
=C2=A0vnc_auth_init(void *display, int websock, int auth, int subauth) &quo=
t;VNC auth init state=3D%p websock=3D%d auth=3D%d subauth=3D%d&quot;<br>
=C2=A0vnc_auth_start(void *state, int method) &quot;VNC client auth start s=
tate=3D%p method=3D%d&quot;<br>
=C2=A0vnc_auth_pass(void *state, int method) &quot;VNC client auth passed s=
tate=3D%p method=3D%d&quot;<br>
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c<br>
index dbbfbefe56..4562bf8928 100644<br>
--- a/ui/vnc-jobs.c<br>
+++ b/ui/vnc-jobs.c<br>
@@ -32,6 +32,7 @@<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;block/aio.h&quot;<br>
+#include &quot;trace.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Locking:<br>
@@ -94,6 +95,8 @@ int vnc_job_add_rect(VncJob *job, int x, int y, int w, in=
t h)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VncRectEntry *entry =3D g_new0(VncRectEntry, 1);<br>
<br>
+=C2=A0 =C2=A0 trace_vnc_job_add_rect(job-&gt;vs, job, x, y, w, h);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;rect.x =3D x;<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;rect.y =3D y;<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;rect.w =3D w;<br>
@@ -190,6 +193,8 @@ static void vnc_async_encoding_start(VncState *orig, Vn=
cState *local)<br>
=C2=A0 =C2=A0 =C2=A0local-&gt;zlib =3D orig-&gt;zlib;<br>
=C2=A0 =C2=A0 =C2=A0local-&gt;hextile =3D orig-&gt;hextile;<br>
=C2=A0 =C2=A0 =C2=A0local-&gt;zrle =3D orig-&gt;zrle;<br>
+=C2=A0 =C2=A0 local-&gt;client_width =3D orig-&gt;client_width;<br>
+=C2=A0 =C2=A0 local-&gt;client_height =3D orig-&gt;client_height;<br>
=C2=A0}<br>
<br>
=C2=A0static void vnc_async_encoding_end(VncState *orig, VncState *local)<b=
r>
@@ -202,6 +207,34 @@ static void vnc_async_encoding_end(VncState *orig, Vnc=
State *local)<br>
=C2=A0 =C2=A0 =C2=A0orig-&gt;lossy_rect =3D local-&gt;lossy_rect;<br>
=C2=A0}<br>
<br>
+static bool vnc_worker_clamp_rect(VncState *vs, VncJob *job, VncRect *rect=
)<br>
+{<br>
+=C2=A0 =C2=A0 trace_vnc_job_clamp_rect(vs, job, rect-&gt;x, rect-&gt;y, re=
ct-&gt;w, rect-&gt;h);<br>
+<br>
+=C2=A0 =C2=A0 if (rect-&gt;x &gt;=3D vs-&gt;client_width) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto discard;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 rect-&gt;w =3D MIN(vs-&gt;client_width - rect-&gt;x, rect-&g=
t;w);<br>
+=C2=A0 =C2=A0 if (rect-&gt;w =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto discard;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (rect-&gt;y &gt;=3D vs-&gt;client_height) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto discard;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 rect-&gt;h =3D MIN(vs-&gt;client_height - rect-&gt;y, rect-&=
gt;h);<br>
+=C2=A0 =C2=A0 if (rect-&gt;h =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto discard;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_vnc_job_clamped_rect(vs, job, rect-&gt;x, rect-&gt;y, =
rect-&gt;w, rect-&gt;h);<br>
+=C2=A0 =C2=A0 return true;<br>
+<br>
+ discard:<br>
+=C2=A0 =C2=A0 trace_vnc_job_discard_rect(vs, job, rect-&gt;x, rect-&gt;y, =
rect-&gt;w, rect-&gt;h);<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
=C2=A0static int vnc_worker_thread_loop(VncJobQueue *queue)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VncJob *job;<br>
@@ -260,14 +293,17 @@ static int vnc_worker_thread_loop(VncJobQueue *queue)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto disconnected;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D vnc_send_framebuffer_update(&amp;vs, ent=
ry-&gt;rect.x, entry-&gt;rect.y,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&g=
t;rect.w, entry-&gt;rect.h);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vnc_worker_clamp_rect(&amp;vs, job, &amp;e=
ntry-&gt;rect)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D vnc_send_framebuffer_updat=
e(&amp;vs, entry-&gt;rect.x, entry-&gt;rect.y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 entry-&gt;rect.w, entry-&gt;rect.h);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n &gt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_rectangles +=3D n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n &gt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_rectangles +=3D =
n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(entry);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 trace_vnc_job_nrects(&amp;vs, job, n_rectangles);<br>
=C2=A0 =C2=A0 =C2=A0vnc_unlock_display(job-&gt;vs-&gt;vd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Put n_rectangles at the beginning of the message */<=
br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fb4c2405bd494922--

