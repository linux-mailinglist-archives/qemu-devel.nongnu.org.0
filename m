Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A293CCE11
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:45:10 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5N1Z-0001t6-TD
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m5MsS-0005Ev-QT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:35:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m5MsP-0008FD-3j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:35:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="232768997"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="232768997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 23:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="493932619"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jul 2021 23:35:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 18 Jul 2021 23:35:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 18 Jul 2021 23:35:35 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Sun, 18 Jul 2021 23:35:35 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/2] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Thread-Topic: [PATCH 2/2] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Thread-Index: AQHXcsWF8dy4eu9x0UCsFy7HiKvDIatJ5h6A
Date: Mon, 19 Jul 2021 06:35:35 +0000
Message-ID: <deb85d9e91d349548e0457da45c977b8@intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210706235255.7575-2-dongwon.kim@intel.com>
In-Reply-To: <20210706235255.7575-2-dongwon.kim@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi DW,

> eb_fb_blit needs more parameters which describe x and y offsets and width
> and height of the actual scanout to specify the size and cordination of
> partial image to blit in the guest fb in case the guest fb contains multi=
ple
> display outputs.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  hw/display/virtio-gpu-udmabuf.c |  4 ++--
>  include/ui/egl-helpers.h        |  2 +-
>  ui/egl-headless.c               |  2 +-
>  ui/egl-helpers.c                | 10 ++++++----
>  ui/gtk-egl.c                    |  7 ++++---
>  ui/sdl2-gl.c                    |  2 +-
>  6 files changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udma=
buf.c
[Kasireddy, Vivek] You might not want to mix virtio-gpu and UI changes in t=
he same patch.

> index a64194c6de..3ea6e76371 100644
> --- a/hw/display/virtio-gpu-udmabuf.c
> +++ b/hw/display/virtio-gpu-udmabuf.c
> @@ -186,8 +186,8 @@ static VGPUDMABuf
>      dmabuf->buf.stride =3D fb->stride;
>      dmabuf->buf.x =3D r->x;
>      dmabuf->buf.y =3D r->y;
> -    dmabuf->buf.scanout_width;
> -    dmabuf->buf.scanout_height;
> +    dmabuf->buf.scanout_width =3D r->width;
> +    dmabuf->buf.scanout_height =3D r->height;
>      dmabuf->buf.fourcc =3D qemu_pixman_to_drm_format(fb->format);
>      dmabuf->buf.fd =3D res->dmabuf_fd;
>=20
> diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> index f1bf8f97fc..e21118501e 100644
> --- a/include/ui/egl-helpers.h
> +++ b/include/ui/egl-helpers.h
> @@ -26,7 +26,7 @@ void egl_fb_setup_default(egl_fb *fb, int width, int he=
ight);
>  void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
>                            GLuint texture, bool delete);
>  void egl_fb_setup_new_tex(egl_fb *fb, int width, int height);
> -void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip);
> +void egl_fb_blit(egl_fb *dst, egl_fb *src, int x, int y, int w, int h, b=
ool flip);
>  void egl_fb_read(DisplaySurface *dst, egl_fb *src);
>=20
>  void egl_texture_blit(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool =
flip);
> diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> index da377a74af..bdf10fec84 100644
> --- a/ui/egl-headless.c
> +++ b/ui/egl-headless.c
> @@ -144,7 +144,7 @@ static void egl_scanout_flush(DisplayChangeListener *=
dcl,
>                            1.0, 1.0);
>      } else {
>          /* no cursor -> use simple framebuffer blit */
> -        egl_fb_blit(&edpy->blit_fb, &edpy->guest_fb, edpy->y_0_top);
> +        egl_fb_blit(&edpy->blit_fb, &edpy->guest_fb, x, y, w, h, edpy->y=
_0_top);
>      }
>=20
>      egl_fb_read(edpy->ds, &edpy->blit_fb);
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index 6d0cb2b5cb..2af3dcc0a6 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -88,16 +88,18 @@ void egl_fb_setup_new_tex(egl_fb *fb, int width, int =
height)
>      egl_fb_setup_for_tex(fb, width, height, texture, true);
>  }
>=20
> -void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip)
> +void egl_fb_blit(egl_fb *dst, egl_fb *src, int x, int y, int w, int h, b=
ool flip)
[Kasireddy, Vivek] Instead of explicitly passing x, y, w, h to egl_fb_blit,=
 would you be not
be able to use the dmabuf member that would be added to egl_fb that would c=
ontain x, y, w and h:
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06746.html


>  {
>      GLuint y1, y2;
>=20
>      glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
>      glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
>      glViewport(0, 0, dst->width, dst->height);
> -    y1 =3D flip ? src->height : 0;
> -    y2 =3D flip ? 0 : src->height;
> -    glBlitFramebuffer(0, y1, src->width, y2,
> +    w =3D (x + w) > src->width ? src->width - x : w;
> +    h =3D (y + h) > src->height ? src->height - y : h;
> +    y1 =3D flip ? h + y : y;
> +    y2 =3D flip ? y : h + y;
> +    glBlitFramebuffer(x, y1, x + w, y2,
[Kasireddy, Vivek] While you are at it, could you please create new local v=
ariables x1, y1, x2, y2
to store the above values and pass them to glBlitFramebuffer to improve the=
 readability of this code?=20

Thanks,
Vivek
>                        0, 0, dst->width, dst->height,
>                        GL_COLOR_BUFFER_BIT, GL_LINEAR);
>  }
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index 2a2e6d3a17..ceb52b1045 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -73,7 +73,7 @@ void gd_egl_draw(VirtualConsole *vc)
>      wh =3D gdk_window_get_height(window);
>=20
>      if (vc->gfx.scanout_mode) {
> -        gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
> +       gd_egl_scanout_flush(&vc->gfx.dcl, vc->gfx.x, vc->gfx.y, vc->gfx.=
w, vc->gfx.h);
>=20
>          vc->gfx.scale_x =3D (double)ww / vc->gfx.w;
>          vc->gfx.scale_y =3D (double)wh / vc->gfx.h;
> @@ -216,7 +216,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl=
,
>=20
>      gd_egl_scanout_texture(dcl, dmabuf->texture,
>                             false, dmabuf->width, dmabuf->height,
> -                           0, 0, dmabuf->width, dmabuf->height);
> +                           dmabuf->x, dmabuf->y, dmabuf->scanout_width,
> +                           dmabuf->scanout_height);
>  #endif
>  }
>=20
> @@ -286,7 +287,7 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
>                            vc->gfx.cursor_x, vc->gfx.cursor_y,
>                            vc->gfx.scale_x, vc->gfx.scale_y);
>      } else {
> -        egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top)=
;
> +        egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, x, y, w, h, !vc-=
>gfx.y0_top);
>      }
>=20
>      eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
> diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
> index a21d2deed9..67bc8b5f4e 100644
> --- a/ui/sdl2-gl.c
> +++ b/ui/sdl2-gl.c
> @@ -238,7 +238,7 @@ void sdl2_gl_scanout_flush(DisplayChangeListener *dcl=
,
>=20
>      SDL_GetWindowSize(scon->real_window, &ww, &wh);
>      egl_fb_setup_default(&scon->win_fb, ww, wh);
> -    egl_fb_blit(&scon->win_fb, &scon->guest_fb, !scon->y0_top);
> +    egl_fb_blit(&scon->win_fb, &scon->guest_fb, x, y, w, h, !scon->y0_to=
p);
>=20
>      SDL_GL_SwapWindow(scon->real_window);
>      graphic_hw_gl_flushed(dcl->con);
> --
> 2.17.1
>=20


