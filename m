Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361AE3D0525
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:24:51 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5z6X-0001pz-QL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5z59-0000IQ-Re
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:23:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:45144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5z56-000300-Oe
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:23:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190927076"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190927076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:23:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="511165168"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.47.107])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:23:18 -0700
Date: Tue, 20 Jul 2021 16:23:16 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20210720232306.GA4543@dongwonk-MOBL.amr.corp.intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <a9fa7822fab743d3b391e8b928639f3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9fa7822fab743d3b391e8b928639f3c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dongwon.kim@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Jul 18, 2021 at 11:17:00PM -0700, Kasireddy, Vivek wrote:
> Hi DW,
> 
> > When guest is running Linux/X11 with extended multiple displays mode enabled,
> > the guest shares one scanout resource each time containing whole surface
> > rather than sharing individual display output separately. This extended frame
> > is properly splited and rendered on the corresponding scanout surfaces but
> > not in case of blob-resource (zero copy).
> > 
> > This code change lets the qemu split this one large surface data into multiple
> > in case of blob-resource as well so that each sub frame then can be blitted
> > properly to each scanout.
> > 
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  hw/display/virtio-gpu-udmabuf.c | 19 +++++++++++--------
> >  hw/display/virtio-gpu.c         |  5 +++--
> >  include/hw/virtio/virtio-gpu.h  |  5 +++--
> >  include/ui/console.h            |  4 ++++
> >  stubs/virtio-gpu-udmabuf.c      |  3 ++-
> >  5 files changed, 23 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
> > index 3c01a415e7..a64194c6de 100644
> > --- a/hw/display/virtio-gpu-udmabuf.c
> > +++ b/hw/display/virtio-gpu-udmabuf.c
> > @@ -171,7 +171,8 @@ static VGPUDMABuf
> >  *virtio_gpu_create_dmabuf(VirtIOGPU *g,
> >                            uint32_t scanout_id,
> >                            struct virtio_gpu_simple_resource *res,
> > -                          struct virtio_gpu_framebuffer *fb)
> > +                          struct virtio_gpu_framebuffer *fb,
> > +                          struct virtio_gpu_rect *r)
> >  {
> >      VGPUDMABuf *dmabuf;
> > 
> > @@ -183,6 +184,10 @@ static VGPUDMABuf
> >      dmabuf->buf.width = fb->width;
> >      dmabuf->buf.height = fb->height;
> >      dmabuf->buf.stride = fb->stride;
> > +    dmabuf->buf.x = r->x;
> > +    dmabuf->buf.y = r->y;
> > +    dmabuf->buf.scanout_width;
> > +    dmabuf->buf.scanout_height;
> [Kasireddy, Vivek] Would you not be able to use buf.width and buf.height?
> What is the difference between these and scanout_width/height?
[DW] buf.width and buf.height is the combined width/height. For example,
if guest has two 1920x1080 w/ extended display setup, buf.width = 3840
and buf.height = 1080. buf.scanout_width and buf.scanout_height are
individual display's, so they are 1920 and 1080 respectively.

> 
> >      dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
> >      dmabuf->buf.fd = res->dmabuf_fd;
> > 
> > @@ -195,24 +200,22 @@ static VGPUDMABuf
> >  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> >                               uint32_t scanout_id,
> >                               struct virtio_gpu_simple_resource *res,
> > -                             struct virtio_gpu_framebuffer *fb)
> > +                             struct virtio_gpu_framebuffer *fb,
> > +                             struct virtio_gpu_rect *r)
> >  {
> >      struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
> >      VGPUDMABuf *new_primary, *old_primary = NULL;
> > 
> > -    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
> > +    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb, r);
> >      if (!new_primary) {
> >          return -EINVAL;
> >      }
> > 
> >      if (g->dmabuf.primary) {
> > -        old_primary = g->dmabuf.primary;
> > +        old_primary = g->dmabuf.primary[scanout_id];
> >      }
> > 
> > -    g->dmabuf.primary = new_primary;
> > -    qemu_console_resize(scanout->con,
> > -                        new_primary->buf.width,
> > -                        new_primary->buf.height);
> > +    g->dmabuf.primary[scanout_id] = new_primary;
> >      dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
> > 
> >      if (old_primary) {
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index e183f4ecda..11a87dad79 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -523,9 +523,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
> >                  console_has_gl(scanout->con)) {
> >                  dpy_gl_update(scanout->con, 0, 0, scanout->width,
> [Kasireddy, Vivek] Unrelated to your change but shouldn't 0,0 be replaced with 
> scanout->x and scanout->y?
[DW] Each scanout's x and y are all 0. Actual offsets are r->s and r->y.

> 
> >                                scanout->height);
> > -                return;
> >              }
> >          }
> > +        return;
> >      }
> > 
> >      if (!res->blob &&
> > @@ -598,6 +598,7 @@ static void virtio_gpu_update_scanout(VirtIOGPU *g,
> >      scanout->y = r->y;
> >      scanout->width = r->width;
> >      scanout->height = r->height;
> > +    qemu_console_resize(scanout->con, scanout->width, scanout->height);
> [Kasireddy, Vivek] IIRC, there was no qemu_console_resize for the non-blob resources case.
> Moving this call to update_scanout means that it will also be called for non-blob resources
> Path; not sure if this is OK but you might want restrict this call to only blob.
> 

[DW] This may not be needed for default case but I don't think it will
break anything as I see it won't do anything if the size matches. We can
limit this to blob case anyway. I will make the corresponding change in
v2.

> >  }
> > 
> >  static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
> > @@ -633,7 +634,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
> > 
> >      if (res->blob) {
> >          if (console_has_gl(scanout->con)) {
> > -            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
> > +            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
> [Kasireddy, Vivek] Instead of passing the rectangle "r", you might want to consider using
> the scanout object which is specific to each scanout and can be easily retried by:
> scanout = &g->parent_obj.scanout[scanout_id];

[DW] Again, scanout's x and y are all 0.

> 
> Thanks,
> Vivek
> >                  virtio_gpu_update_scanout(g, scanout_id, res, r);
> >                  return;
> >              }
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index bcf54d970f..6372f4bbb5 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -187,7 +187,7 @@ struct VirtIOGPU {
> > 
> >      struct {
> >          QTAILQ_HEAD(, VGPUDMABuf) bufs;
> > -        VGPUDMABuf *primary;
> > +        VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
> >      } dmabuf;
> >  };
> > 
> > @@ -273,7 +273,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource
> > *res);
> >  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> >                               uint32_t scanout_id,
> >                               struct virtio_gpu_simple_resource *res,
> > -                             struct virtio_gpu_framebuffer *fb);
> > +                             struct virtio_gpu_framebuffer *fb,
> > +                             struct virtio_gpu_rect *r);
> > 
> >  /* virtio-gpu-3d.c */
> >  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> > diff --git a/include/ui/console.h b/include/ui/console.h
> > index b30b63976a..87316aef83 100644
> > --- a/include/ui/console.h
> > +++ b/include/ui/console.h
> > @@ -167,6 +167,10 @@ typedef struct QemuDmaBuf {
> >      uint32_t  fourcc;
> >      uint64_t  modifier;
> >      uint32_t  texture;
> > +    uint32_t  x;
> > +    uint32_t  y;
> > +    uint32_t  scanout_width;
> > +    uint32_t  scanout_height;
> >      bool      y0_top;
> >  } QemuDmaBuf;
> > 
> > diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
> > index 81f661441a..f692e13510 100644
> > --- a/stubs/virtio-gpu-udmabuf.c
> > +++ b/stubs/virtio-gpu-udmabuf.c
> > @@ -20,7 +20,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource
> > *res)
> >  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
> >                               uint32_t scanout_id,
> >                               struct virtio_gpu_simple_resource *res,
> > -                             struct virtio_gpu_framebuffer *fb)
> > +                             struct virtio_gpu_framebuffer *fb,
> > +                             struct virtio_gpu_rect *r)
> >  {
> >      /* nothing (stub) */
> >      return 0;
> > --
> > 2.17.1
> > 
> 

