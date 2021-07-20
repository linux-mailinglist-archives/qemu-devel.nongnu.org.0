Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9B3D0572
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:33:53 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zFI-0008HZ-Ef
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5zBL-00012O-4F
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:29:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:48205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5zBI-0007A8-N7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:29:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="272458533"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="272458533"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:29:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="500999139"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.47.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:29:40 -0700
Date: Tue, 20 Jul 2021 16:29:39 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Message-ID: <20210720232939.GA4599@dongwonk-MOBL.amr.corp.intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210706235255.7575-2-dongwon.kim@intel.com>
 <deb85d9e91d349548e0457da45c977b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deb85d9e91d349548e0457da45c977b8@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dongwon.kim@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 18, 2021 at 11:35:35PM -0700, Kasireddy, Vivek wrote:
> Hi DW,
> 
> > eb_fb_blit needs more parameters which describe x and y offsets and width
> > and height of the actual scanout to specify the size and cordination of
> > partial image to blit in the guest fb in case the guest fb contains multiple
> > display outputs.
> > 
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  hw/display/virtio-gpu-udmabuf.c |  4 ++--
> >  include/ui/egl-helpers.h        |  2 +-
> >  ui/egl-headless.c               |  2 +-
> >  ui/egl-helpers.c                | 10 ++++++----
> >  ui/gtk-egl.c                    |  7 ++++---
> >  ui/sdl2-gl.c                    |  2 +-
> >  6 files changed, 15 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
> [Kasireddy, Vivek] You might not want to mix virtio-gpu and UI changes in the same patch.
[DW] Yeah, I will split it.

> 
> > index a64194c6de..3ea6e76371 100644
> > --- a/hw/display/virtio-gpu-udmabuf.c
> > +++ b/hw/display/virtio-gpu-udmabuf.c
> > @@ -186,8 +186,8 @@ static VGPUDMABuf
> >      dmabuf->buf.stride = fb->stride;
> >      dmabuf->buf.x = r->x;
> >      dmabuf->buf.y = r->y;
> > -    dmabuf->buf.scanout_width;
> > -    dmabuf->buf.scanout_height;
> > +    dmabuf->buf.scanout_width = r->width;
> > +    dmabuf->buf.scanout_height = r->height;
> >      dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
> >      dmabuf->buf.fd = res->dmabuf_fd;
> > 
> > diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> > index f1bf8f97fc..e21118501e 100644
> > --- a/include/ui/egl-helpers.h
> > +++ b/include/ui/egl-helpers.h
> > @@ -26,7 +26,7 @@ void egl_fb_setup_default(egl_fb *fb, int width, int height);
> >  void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
> >                            GLuint texture, bool delete);
> >  void egl_fb_setup_new_tex(egl_fb *fb, int width, int height);
> > -void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip);
> > +void egl_fb_blit(egl_fb *dst, egl_fb *src, int x, int y, int w, int h, bool flip);
> >  void egl_fb_read(DisplaySurface *dst, egl_fb *src);
> > 
> >  void egl_texture_blit(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool flip);
> > diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> > index da377a74af..bdf10fec84 100644
> > --- a/ui/egl-headless.c
> > +++ b/ui/egl-headless.c
> > @@ -144,7 +144,7 @@ static void egl_scanout_flush(DisplayChangeListener *dcl,
> >                            1.0, 1.0);
> >      } else {
> >          /* no cursor -> use simple framebuffer blit */
> > -        egl_fb_blit(&edpy->blit_fb, &edpy->guest_fb, edpy->y_0_top);
> > +        egl_fb_blit(&edpy->blit_fb, &edpy->guest_fb, x, y, w, h, edpy->y_0_top);
> >      }
> > 
> >      egl_fb_read(edpy->ds, &edpy->blit_fb);
> > diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> > index 6d0cb2b5cb..2af3dcc0a6 100644
> > --- a/ui/egl-helpers.c
> > +++ b/ui/egl-helpers.c
> > @@ -88,16 +88,18 @@ void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
> >      egl_fb_setup_for_tex(fb, width, height, texture, true);
> >  }
> > 
> > -void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip)
> > +void egl_fb_blit(egl_fb *dst, egl_fb *src, int x, int y, int w, int h, bool flip)
> [Kasireddy, Vivek] Instead of explicitly passing x, y, w, h to egl_fb_blit, would you be not
> be able to use the dmabuf member that would be added to egl_fb that would contain x, y, w and h:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06746.html

[DW] sounds like a valid idea but wouldn't it be making this function
too specific? I think it is reasonable to specify the offset and the
size of blitted area.. although I agree that having too many parameters
don't look good.

> 
> 
> >  {
> >      GLuint y1, y2;
> > 
> >      glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
> >      glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
> >      glViewport(0, 0, dst->width, dst->height);
> > -    y1 = flip ? src->height : 0;
> > -    y2 = flip ? 0 : src->height;
> > -    glBlitFramebuffer(0, y1, src->width, y2,
> > +    w = (x + w) > src->width ? src->width - x : w;
> > +    h = (y + h) > src->height ? src->height - y : h;
> > +    y1 = flip ? h + y : y;
> > +    y2 = flip ? y : h + y;
> > +    glBlitFramebuffer(x, y1, x + w, y2,
> [Kasireddy, Vivek] While you are at it, could you please create new local variables x1, y1, x2, y2
> to store the above values and pass them to glBlitFramebuffer to improve the readability of this code? 
[DW] I will think about making this look more undertandable.

> 
> Thanks,
> Vivek
> >                        0, 0, dst->width, dst->height,
> >                        GL_COLOR_BUFFER_BIT, GL_LINEAR);
> >  }
> > diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> > index 2a2e6d3a17..ceb52b1045 100644
> > --- a/ui/gtk-egl.c
> > +++ b/ui/gtk-egl.c
> > @@ -73,7 +73,7 @@ void gd_egl_draw(VirtualConsole *vc)
> >      wh = gdk_window_get_height(window);
> > 
> >      if (vc->gfx.scanout_mode) {
> > -        gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
> > +       gd_egl_scanout_flush(&vc->gfx.dcl, vc->gfx.x, vc->gfx.y, vc->gfx.w, vc->gfx.h);
> > 
> >          vc->gfx.scale_x = (double)ww / vc->gfx.w;
> >          vc->gfx.scale_y = (double)wh / vc->gfx.h;
> > @@ -216,7 +216,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
> > 
> >      gd_egl_scanout_texture(dcl, dmabuf->texture,
> >                             false, dmabuf->width, dmabuf->height,
> > -                           0, 0, dmabuf->width, dmabuf->height);
> > +                           dmabuf->x, dmabuf->y, dmabuf->scanout_width,
> > +                           dmabuf->scanout_height);
> >  #endif
> >  }
> > 
> > @@ -286,7 +287,7 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
> >                            vc->gfx.cursor_x, vc->gfx.cursor_y,
> >                            vc->gfx.scale_x, vc->gfx.scale_y);
> >      } else {
> > -        egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top);
> > +        egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, x, y, w, h, !vc->gfx.y0_top);
> >      }
> > 
> >      eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
> > diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
> > index a21d2deed9..67bc8b5f4e 100644
> > --- a/ui/sdl2-gl.c
> > +++ b/ui/sdl2-gl.c
> > @@ -238,7 +238,7 @@ void sdl2_gl_scanout_flush(DisplayChangeListener *dcl,
> > 
> >      SDL_GetWindowSize(scon->real_window, &ww, &wh);
> >      egl_fb_setup_default(&scon->win_fb, ww, wh);
> > -    egl_fb_blit(&scon->win_fb, &scon->guest_fb, !scon->y0_top);
> > +    egl_fb_blit(&scon->win_fb, &scon->guest_fb, x, y, w, h, !scon->y0_top);
> > 
> >      SDL_GL_SwapWindow(scon->real_window);
> >      graphic_hw_gl_flushed(dcl->con);
> > --
> > 2.17.1
> > 
> 

