Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDE3CCDD1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:18:04 +0200 (CEST)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MbL-0001Ti-6T
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m5MaW-0000nu-R0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:17:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:3255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m5MaU-0001W2-1o
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:17:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="274825687"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="274825687"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 23:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="656733935"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2021 23:17:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 18 Jul 2021 23:17:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 18 Jul 2021 23:17:00 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Sun, 18 Jul 2021 23:17:00 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] virtio-gpu: splitting one extended mode guest fb into
 n-scanouts
Thread-Topic: [PATCH 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Thread-Index: AQHXcsVyjbKQcaOlEE6sppN8ejABwatJ4uyQ
Date: Mon, 19 Jul 2021 06:17:00 +0000
Message-ID: <a9fa7822fab743d3b391e8b928639f3c@intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
In-Reply-To: <20210706235255.7575-1-dongwon.kim@intel.com>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=vivek.kasireddy@intel.com; helo=mga07.intel.com
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi DW,

> When guest is running Linux/X11 with extended multiple displays mode enab=
led,
> the guest shares one scanout resource each time containing whole surface
> rather than sharing individual display output separately. This extended f=
rame
> is properly splited and rendered on the corresponding scanout surfaces bu=
t
> not in case of blob-resource (zero copy).
>=20
> This code change lets the qemu split this one large surface data into mul=
tiple
> in case of blob-resource as well so that each sub frame then can be blitt=
ed
> properly to each scanout.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  hw/display/virtio-gpu-udmabuf.c | 19 +++++++++++--------
>  hw/display/virtio-gpu.c         |  5 +++--
>  include/hw/virtio/virtio-gpu.h  |  5 +++--
>  include/ui/console.h            |  4 ++++
>  stubs/virtio-gpu-udmabuf.c      |  3 ++-
>  5 files changed, 23 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udma=
buf.c
> index 3c01a415e7..a64194c6de 100644
> --- a/hw/display/virtio-gpu-udmabuf.c
> +++ b/hw/display/virtio-gpu-udmabuf.c
> @@ -171,7 +171,8 @@ static VGPUDMABuf
>  *virtio_gpu_create_dmabuf(VirtIOGPU *g,
>                            uint32_t scanout_id,
>                            struct virtio_gpu_simple_resource *res,
> -                          struct virtio_gpu_framebuffer *fb)
> +                          struct virtio_gpu_framebuffer *fb,
> +                          struct virtio_gpu_rect *r)
>  {
>      VGPUDMABuf *dmabuf;
>=20
> @@ -183,6 +184,10 @@ static VGPUDMABuf
>      dmabuf->buf.width =3D fb->width;
>      dmabuf->buf.height =3D fb->height;
>      dmabuf->buf.stride =3D fb->stride;
> +    dmabuf->buf.x =3D r->x;
> +    dmabuf->buf.y =3D r->y;
> +    dmabuf->buf.scanout_width;
> +    dmabuf->buf.scanout_height;
[Kasireddy, Vivek] Would you not be able to use buf.width and buf.height?
What is the difference between these and scanout_width/height?

>      dmabuf->buf.fourcc =3D qemu_pixman_to_drm_format(fb->format);
>      dmabuf->buf.fd =3D res->dmabuf_fd;
>=20
> @@ -195,24 +200,22 @@ static VGPUDMABuf
>  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
>                               uint32_t scanout_id,
>                               struct virtio_gpu_simple_resource *res,
> -                             struct virtio_gpu_framebuffer *fb)
> +                             struct virtio_gpu_framebuffer *fb,
> +                             struct virtio_gpu_rect *r)
>  {
>      struct virtio_gpu_scanout *scanout =3D &g->parent_obj.scanout[scanou=
t_id];
>      VGPUDMABuf *new_primary, *old_primary =3D NULL;
>=20
> -    new_primary =3D virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
> +    new_primary =3D virtio_gpu_create_dmabuf(g, scanout_id, res, fb, r);
>      if (!new_primary) {
>          return -EINVAL;
>      }
>=20
>      if (g->dmabuf.primary) {
> -        old_primary =3D g->dmabuf.primary;
> +        old_primary =3D g->dmabuf.primary[scanout_id];
>      }
>=20
> -    g->dmabuf.primary =3D new_primary;
> -    qemu_console_resize(scanout->con,
> -                        new_primary->buf.width,
> -                        new_primary->buf.height);
> +    g->dmabuf.primary[scanout_id] =3D new_primary;
>      dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
>=20
>      if (old_primary) {
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index e183f4ecda..11a87dad79 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -523,9 +523,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>                  console_has_gl(scanout->con)) {
>                  dpy_gl_update(scanout->con, 0, 0, scanout->width,
[Kasireddy, Vivek] Unrelated to your change but shouldn't 0,0 be replaced w=
ith=20
scanout->x and scanout->y?

>                                scanout->height);
> -                return;
>              }
>          }
> +        return;
>      }
>=20
>      if (!res->blob &&
> @@ -598,6 +598,7 @@ static void virtio_gpu_update_scanout(VirtIOGPU *g,
>      scanout->y =3D r->y;
>      scanout->width =3D r->width;
>      scanout->height =3D r->height;
> +    qemu_console_resize(scanout->con, scanout->width, scanout->height);
[Kasireddy, Vivek] IIRC, there was no qemu_console_resize for the non-blob =
resources case.
Moving this call to update_scanout means that it will also be called for no=
n-blob resources
Path; not sure if this is OK but you might want restrict this call to only =
blob.

>  }
>=20
>  static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
> @@ -633,7 +634,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
>=20
>      if (res->blob) {
>          if (console_has_gl(scanout->con)) {
> -            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
> +            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
[Kasireddy, Vivek] Instead of passing the rectangle "r", you might want to =
consider using
the scanout object which is specific to each scanout and can be easily retr=
ied by:
scanout =3D &g->parent_obj.scanout[scanout_id];

Thanks,
Vivek
>                  virtio_gpu_update_scanout(g, scanout_id, res, r);
>                  return;
>              }
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
> index bcf54d970f..6372f4bbb5 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -187,7 +187,7 @@ struct VirtIOGPU {
>=20
>      struct {
>          QTAILQ_HEAD(, VGPUDMABuf) bufs;
> -        VGPUDMABuf *primary;
> +        VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
>      } dmabuf;
>  };
>=20
> @@ -273,7 +273,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple=
_resource
> *res);
>  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
>                               uint32_t scanout_id,
>                               struct virtio_gpu_simple_resource *res,
> -                             struct virtio_gpu_framebuffer *fb);
> +                             struct virtio_gpu_framebuffer *fb,
> +                             struct virtio_gpu_rect *r);
>=20
>  /* virtio-gpu-3d.c */
>  void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> diff --git a/include/ui/console.h b/include/ui/console.h
> index b30b63976a..87316aef83 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -167,6 +167,10 @@ typedef struct QemuDmaBuf {
>      uint32_t  fourcc;
>      uint64_t  modifier;
>      uint32_t  texture;
> +    uint32_t  x;
> +    uint32_t  y;
> +    uint32_t  scanout_width;
> +    uint32_t  scanout_height;
>      bool      y0_top;
>  } QemuDmaBuf;
>=20
> diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
> index 81f661441a..f692e13510 100644
> --- a/stubs/virtio-gpu-udmabuf.c
> +++ b/stubs/virtio-gpu-udmabuf.c
> @@ -20,7 +20,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_r=
esource
> *res)
>  int virtio_gpu_update_dmabuf(VirtIOGPU *g,
>                               uint32_t scanout_id,
>                               struct virtio_gpu_simple_resource *res,
> -                             struct virtio_gpu_framebuffer *fb)
> +                             struct virtio_gpu_framebuffer *fb,
> +                             struct virtio_gpu_rect *r)
>  {
>      /* nothing (stub) */
>      return 0;
> --
> 2.17.1
>=20


