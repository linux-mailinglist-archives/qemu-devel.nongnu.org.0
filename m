Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DBF338632
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:50:05 +0100 (CET)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbca-0003SH-Dl
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKbb6-0002rl-P0
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:48:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKbb4-0000jc-AS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:48:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id o19so6427918edc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 22:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpFCWofgGx9/DSDelW0JQkTR8DCiW3TRB7Zob7d62ZY=;
 b=OTaNPi3MywTAq1kwaGDhe04siARgQwSPcbWXkjmYsWd+opWl/b3j3LQe9+TfSvFL15
 tZWNZ9Pto8wUQCuMU4rQWbhDBmTFRd+IczLbsbW1p4KPoFbIX0bfGyfdoNwTo3aj23Cm
 p+nnOdGvwHXBUKXxlt+XcennFTxHzl+6hghVtVLALinMctLqbHs9aaYs4N5VuchyIXlu
 VDbXMI05fB89gPNhatAwJiq3b+taR5sM6pR2E8eulb3uvo0Ere5huzk6W38RJz2vvYgI
 9KVHjzsLyClBPEylOKBvxpwAupYgS0ob+nZcU3QiWNwTnUtEA0U08rs/SQmsCIWkzyXm
 7Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpFCWofgGx9/DSDelW0JQkTR8DCiW3TRB7Zob7d62ZY=;
 b=YS4b9k941jaj7izQceobm/Q6D63bXW2nd//9IMqGJ3R/vlE/+cUVswNQSVjtm27j8s
 LQP9ZClbDmPax/KKdDmNEJ+ErQoWvctji1vNQpOSYExX4gPOTRtKMwpj8Y2X1fxXiWAZ
 gKi9e/K4gUhYHB//c3QzbLct5chFNNwq60xHNkh7F4ZsJFcmT8NL1/4CqW8zzwZTZmPq
 tV1pTEQKHUhPylZc5ps6YTa1z9hhj9bMu7mH91umSuGMPD9qa4LxVYmQwgqEPN7Fqi/9
 Xw3O38f4Sipmk9/ZXRWU3acf7DNq6ryHxOIPOltnAtGrWlWcw8sw9Ze8AkiOXB7Nf/9e
 OkWQ==
X-Gm-Message-State: AOAM532qKGXlAUTHTBOtebaB4JSiDFViVHMC3PhTGBeh8+Ns1V7b9rAO
 fpAb6+h4Ny095jIf9clp3CU26shhX+gvZCk7Rrc=
X-Google-Smtp-Source: ABdhPJzqvm3qR2sZG9LV+MhRnPxnJRCsXbS5FE/rTErcqphY6jZJaC4w7CNgY30XJVguN6uWvxdXPxxz39C1vunjX0w=
X-Received: by 2002:a50:ee05:: with SMTP id g5mr12418892eds.164.1615531708357; 
 Thu, 11 Mar 2021 22:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210311182957.486939-1-berrange@redhat.com>
 <20210311182957.486939-5-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-5-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 10:48:15 +0400
Message-ID: <CAJ+F1C+UD=HMzUTydt47=6a0MD2YF93kR6qnRgyVHjKZDyJwWQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] ui: honour the actual guest display dimensions
 without rounding
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000999ee405bd514954"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
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

--000000000000999ee405bd514954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:38 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> A long time ago the VNC server code had some memory corruption
> fixes done in:
>
>   commit bea60dd7679364493a0d7f5b54316c767cf894ef
>   Author: Peter Lieven <pl@kamp.de>
>   Date:   Mon Jun 30 10:57:51 2014 +0200
>
>     ui/vnc: fix potential memory corruption issues
>
> One of the implications of the fix was that the VNC server would have a
> thin black bad down the right hand side if the guest desktop width was
> not a multiple of 16. In practice this was a non-issue since the VNC
> server was always honouring a guest specified resolution and guests
> essentially always pick from a small set of sane resolutions likely in
> real world hardware.
>
> We recently introduced support for the extended desktop resize extension
> and as a result the VNC client has ability to specify an arbitrary
> desktop size and the guest OS may well honour it exactly. As a result we
> no longer have any guarantee that the width will be a multiple of 16,
> and so when resizing the desktop we have a 93% chance of getting the
> black bar on the right hand size.
>
> The VNC server maintains three different desktop dimensions
>
>  1. The guest surface
>  2. The server surface
>  3. The client desktop
>
> The requirement for the width to be a multiple of 16 only applies to
> item 2, the server surface, for the purpose of doing dirty bitmap
> tracking.
>
> Normally we will set the client desktop size to always match the server
> surface size, but that's not a strict requirement. In order to cope with
> clients that don't support the desktop size encoding, we already allow
> for the client desktop to be a different size that the server surface.
>
> Thus we can trivially eliminate the black bar, but setting the client
> desktop size to be the un-rounded server surface size - the so called
> "true width".
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  ui/trace-events |  2 ++
>  ui/vnc.c        | 23 +++++++++++++++++++----
>  ui/vnc.h        |  1 +
>  3 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/ui/trace-events b/ui/trace-events
> index 3838ae2d84..5d1da6f236 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -59,6 +59,8 @@ vnc_client_throttle_audio(void *state, void *ioc, size_=
t
> offset) "VNC client thr
>  vnc_client_unthrottle_forced(void *state, void *ioc) "VNC client
> unthrottle forced offset state=3D%p ioc=3D%p"
>  vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offset)
> "VNC client unthrottle incremental state=3D%p ioc=3D%p offset=3D%zu"
>  vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t
> threshold) "VNC client output limit state=3D%p ioc=3D%p offset=3D%zu
> threshold=3D%zu"
> +vnc_server_dpy_pageflip(void *dpy, int w, int h, int fmt) "VNC server dp=
y
> pageflip dpy=3D%p size=3D%dx%d fmt=3D%d"
> +vnc_server_dpy_recreate(void *dpy, int w, int h, int fmt) "VNC server dp=
y
> recreate dpy=3D%p size=3D%dx%d fmt=3D%d"
>  vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) "VN=
C
> add rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
>  vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int h)
> "VNC job discard rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
>  vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h)
> "VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d"
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 8c9890b3cd..9c004a11f4 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -608,6 +608,11 @@ static int vnc_width(VncDisplay *vd)
>                                         VNC_DIRTY_PIXELS_PER_BIT));
>  }
>
> +static int vnc_true_width(VncDisplay *vd)
> +{
> +    return MIN(VNC_MAX_WIDTH, surface_width(vd->ds));
> +}
> +
>  static int vnc_height(VncDisplay *vd)
>  {
>      return MIN(VNC_MAX_HEIGHT, surface_height(vd->ds));
> @@ -691,16 +696,16 @@ static void vnc_desktop_resize(VncState *vs)
>                              !vnc_has_feature(vs,
> VNC_FEATURE_RESIZE_EXT))) {
>          return;
>      }
> -    if (vs->client_width =3D=3D pixman_image_get_width(vs->vd->server) &=
&
> +    if (vs->client_width =3D=3D vs->vd->true_width &&
>          vs->client_height =3D=3D pixman_image_get_height(vs->vd->server)=
) {
>          return;
>      }
>
> -    assert(pixman_image_get_width(vs->vd->server) < 65536 &&
> -           pixman_image_get_width(vs->vd->server) >=3D 0);
> +    assert(vs->vd->true_width < 65536 &&
> +           vs->vd->true_width >=3D 0);
>      assert(pixman_image_get_height(vs->vd->server) < 65536 &&
>             pixman_image_get_height(vs->vd->server) >=3D 0);
> -    vs->client_width =3D pixman_image_get_width(vs->vd->server);
> +    vs->client_width =3D vs->vd->true_width;
>      vs->client_height =3D pixman_image_get_height(vs->vd->server);
>
>      if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
> @@ -774,6 +779,7 @@ static void vnc_update_server_surface(VncDisplay *vd)
>
>      width =3D vnc_width(vd);
>      height =3D vnc_height(vd);
> +    vd->true_width =3D vnc_true_width(vd);
>      vd->server =3D pixman_image_create_bits(VNC_SERVER_FB_FORMAT,
>                                            width, height,
>                                            NULL, 0);
> @@ -809,13 +815,22 @@ static void vnc_dpy_switch(DisplayChangeListener
> *dcl,
>      vd->guest.fb =3D pixman_image_ref(surface->image);
>      vd->guest.format =3D surface->format;
>
> +
>      if (pageflip) {
> +        trace_vnc_server_dpy_pageflip(vd,
> +                                      surface_width(surface),
> +                                      surface_height(surface),
> +                                      surface_format(surface));
>          vnc_set_area_dirty(vd->guest.dirty, vd, 0, 0,
>                             surface_width(surface),
>                             surface_height(surface));
>          return;
>      }
>
> +    trace_vnc_server_dpy_recreate(vd,
> +                                  surface_width(surface),
> +                                  surface_height(surface),
> +                                  surface_format(surface));
>      /* server surface */
>      vnc_update_server_surface(vd);
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 116463d5f0..d4f3e15558 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -164,6 +164,7 @@ struct VncDisplay
>
>      struct VncSurface guest;   /* guest visible surface (aka ds->surface=
)
> */
>      pixman_image_t *server;    /* vnc server surface */
> +    int true_width; /* server surface width before rounding up */
>
>      const char *id;
>      QTAILQ_ENTRY(VncDisplay) next;
> --
> 2.29.2
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000999ee405bd514954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 10:38 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">A long time ago the VNC server code had some memory corruption<br>
fixes done in:<br>
<br>
=C2=A0 commit bea60dd7679364493a0d7f5b54316c767cf894ef<br>
=C2=A0 Author: Peter Lieven &lt;<a href=3D"mailto:pl@kamp.de" target=3D"_bl=
ank">pl@kamp.de</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Mon Jun 30 10:57:51 2014 +0200<br>
<br>
=C2=A0 =C2=A0 ui/vnc: fix potential memory corruption issues<br>
<br>
One of the implications of the fix was that the VNC server would have a<br>
thin black bad down the right hand side if the guest desktop width was<br>
not a multiple of 16. In practice this was a non-issue since the VNC<br>
server was always honouring a guest specified resolution and guests<br>
essentially always pick from a small set of sane resolutions likely in<br>
real world hardware.<br>
<br>
We recently introduced support for the extended desktop resize extension<br=
>
and as a result the VNC client has ability to specify an arbitrary<br>
desktop size and the guest OS may well honour it exactly. As a result we<br=
>
no longer have any guarantee that the width will be a multiple of 16,<br>
and so when resizing the desktop we have a 93% chance of getting the<br>
black bar on the right hand size.<br>
<br>
The VNC server maintains three different desktop dimensions<br>
<br>
=C2=A01. The guest surface<br>
=C2=A02. The server surface<br>
=C2=A03. The client desktop<br>
<br>
The requirement for the width to be a multiple of 16 only applies to<br>
item 2, the server surface, for the purpose of doing dirty bitmap<br>
tracking.<br>
<br>
Normally we will set the client desktop size to always match the server<br>
surface size, but that&#39;s not a strict requirement. In order to cope wit=
h<br>
clients that don&#39;t support the desktop size encoding, we already allow<=
br>
for the client desktop to be a different size that the server surface.<br>
<br>
Thus we can trivially eliminate the black bar, but setting the client<br>
desktop size to be the un-rounded server surface size - the so called<br>
&quot;true width&quot;.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/trace-events |=C2=A0 2 ++<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++++++++++++----<br>
=C2=A0ui/vnc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A03 files changed, 22 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index 3838ae2d84..5d1da6f236 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -59,6 +59,8 @@ vnc_client_throttle_audio(void *state, void *ioc, size_t =
offset) &quot;VNC client thr<br>
=C2=A0vnc_client_unthrottle_forced(void *state, void *ioc) &quot;VNC client=
 unthrottle forced offset state=3D%p ioc=3D%p&quot;<br>
=C2=A0vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offs=
et) &quot;VNC client unthrottle incremental state=3D%p ioc=3D%p offset=3D%z=
u&quot;<br>
=C2=A0vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t=
 threshold) &quot;VNC client output limit state=3D%p ioc=3D%p offset=3D%zu =
threshold=3D%zu&quot;<br>
+vnc_server_dpy_pageflip(void *dpy, int w, int h, int fmt) &quot;VNC server=
 dpy pageflip dpy=3D%p size=3D%dx%d fmt=3D%d&quot;<br>
+vnc_server_dpy_recreate(void *dpy, int w, int h, int fmt) &quot;VNC server=
 dpy recreate dpy=3D%p size=3D%dx%d fmt=3D%d&quot;<br>
=C2=A0vnc_job_add_rect(void *state, void *job, int x, int y, int w, int h) =
&quot;VNC add rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&quot;<br=
>
=C2=A0vnc_job_discard_rect(void *state, void *job, int x, int y, int w, int=
 h) &quot;VNC job discard rect state=3D%p job=3D%p offset=3D%d,%d size=3D%d=
x%d&quot;<br>
=C2=A0vnc_job_clamp_rect(void *state, void *job, int x, int y, int w, int h=
) &quot;VNC job clamp rect state=3D%p job=3D%p offset=3D%d,%d size=3D%dx%d&=
quot;<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 8c9890b3cd..9c004a11f4 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -608,6 +608,11 @@ static int vnc_width(VncDisplay *vd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VNC_DIRT=
Y_PIXELS_PER_BIT));<br>
=C2=A0}<br>
<br>
+static int vnc_true_width(VncDisplay *vd)<br>
+{<br>
+=C2=A0 =C2=A0 return MIN(VNC_MAX_WIDTH, surface_width(vd-&gt;ds));<br>
+}<br>
+<br>
=C2=A0static int vnc_height(VncDisplay *vd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return MIN(VNC_MAX_HEIGHT, surface_height(vd-&gt;ds));<=
br>
@@ -691,16 +696,16 @@ static void vnc_desktop_resize(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)=
)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (vs-&gt;client_width =3D=3D pixman_image_get_width(vs-&gt=
;vd-&gt;server) &amp;&amp;<br>
+=C2=A0 =C2=A0 if (vs-&gt;client_width =3D=3D vs-&gt;vd-&gt;true_width &amp=
;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;client_height =3D=3D pixman_image_=
get_height(vs-&gt;vd-&gt;server)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert(pixman_image_get_width(vs-&gt;vd-&gt;server) &lt; 655=
36 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pixman_image_get_width(vs-&gt;vd-=
&gt;server) &gt;=3D 0);<br>
+=C2=A0 =C2=A0 assert(vs-&gt;vd-&gt;true_width &lt; 65536 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;vd-&gt;true_width &gt;=3D =
0);<br>
=C2=A0 =C2=A0 =C2=A0assert(pixman_image_get_height(vs-&gt;vd-&gt;server) &l=
t; 65536 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pixman_image_get_height(vs-&gt;vd=
-&gt;server) &gt;=3D 0);<br>
-=C2=A0 =C2=A0 vs-&gt;client_width =3D pixman_image_get_width(vs-&gt;vd-&gt=
;server);<br>
+=C2=A0 =C2=A0 vs-&gt;client_width =3D vs-&gt;vd-&gt;true_width;<br>
=C2=A0 =C2=A0 =C2=A0vs-&gt;client_height =3D pixman_image_get_height(vs-&gt=
;vd-&gt;server);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {<br>
@@ -774,6 +779,7 @@ static void vnc_update_server_surface(VncDisplay *vd)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0width =3D vnc_width(vd);<br>
=C2=A0 =C2=A0 =C2=A0height =3D vnc_height(vd);<br>
+=C2=A0 =C2=A0 vd-&gt;true_width =3D vnc_true_width(vd);<br>
=C2=A0 =C2=A0 =C2=A0vd-&gt;server =3D pixman_image_create_bits(VNC_SERVER_F=
B_FORMAT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0width, height,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0NULL, 0);<br>
@@ -809,13 +815,22 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl=
,<br>
=C2=A0 =C2=A0 =C2=A0vd-&gt;guest.fb =3D pixman_image_ref(surface-&gt;image)=
;<br>
=C2=A0 =C2=A0 =C2=A0vd-&gt;guest.format =3D surface-&gt;format;<br>
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (pageflip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_server_dpy_pageflip(vd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(s=
urface),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(=
surface),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_format(=
surface));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_set_area_dirty(vd-&gt;guest.dirty, vd=
, 0, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(surface),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(surface));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 trace_vnc_server_dpy_recreate(vd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(surface),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_height(surface),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_format(surface));<br>
=C2=A0 =C2=A0 =C2=A0/* server surface */<br>
=C2=A0 =C2=A0 =C2=A0vnc_update_server_surface(vd);<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index 116463d5f0..d4f3e15558 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -164,6 +164,7 @@ struct VncDisplay<br>
<br>
=C2=A0 =C2=A0 =C2=A0struct VncSurface guest;=C2=A0 =C2=A0/* guest visible s=
urface (aka ds-&gt;surface) */<br>
=C2=A0 =C2=A0 =C2=A0pixman_image_t *server;=C2=A0 =C2=A0 /* vnc server surf=
ace */<br>
+=C2=A0 =C2=A0 int true_width; /* server surface width before rounding up *=
/<br>
<br>
=C2=A0 =C2=A0 =C2=A0const char *id;<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(VncDisplay) next;<br>
-- <br>
2.29.2<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt;=C2=A0 <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000999ee405bd514954--

