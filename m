Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2DD2804F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:56:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTp9D-00053x-Hm
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 10:56:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gert.wollny@collabora.com>) id 1hTp7G-0004BF-4B
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gert.wollny@collabora.com>) id 1hTp7E-0008N8-Ib
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:54:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gert.wollny@collabora.com>)
	id 1hTp7E-0008Lv-Ad
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:54:44 -0400
Received: from Isengard (unknown [IPv6:2a02:810a:940:4421:55f7:11f5:99cb:72c6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: gerddie)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 414FD261176;
	Thu, 23 May 2019 15:54:42 +0100 (BST)
Message-ID: <40e8ac9325e9c0d4326cfef841b6be1ca65e6040.camel@collabora.com>
From: Gert Wollny <gert.wollny@collabora.com>
To: =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Date: Thu, 23 May 2019 16:54:39 +0200
In-Reply-To: <CAJ+F1C+vjg47SyBdb7EtvM3JFPpddkko=gXGbsGNqbn0M1u1-Q@mail.gmail.com>
References: <20190523110434.23830-1-gert.wollny@collabora.com>
	<CAJ+F1C+=89nSeEyiBowdOsqr5HBtvvNnXp3ZWHBGV_WYYH9kgA@mail.gmail.com>
	<721f520106a799afe003b3b8d3ce4de12daf04f5.camel@collabora.com>
	<CAJ+F1C+vjg47SyBdb7EtvM3JFPpddkko=gXGbsGNqbn0M1u1-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.235.227.227
Subject: Re: [Qemu-devel] [PATCH] virtio_gpu_3d: make it possible to
 configure the fence poll time
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Donnerstag, den 23.05.2019, 16:37 +0200 schrieb Marc-Andr=C3=A9 Lureau=
:
> Hi
>=20
> On Thu, May 23, 2019 at 4:17 PM Gert Wollny <
> gert.wollny@collabora.com> wrote:
> > Am Donnerstag, den 23.05.2019, 16:01 +0200 schrieb Marc-Andr=C3=A9
> > Lureau:
> > > Hi
> > >=20
> > > On Thu, May 23, 2019 at 3:27 PM Gert Wollny <
> > > gert.wollny@collabora.com> wrote:
> > > > The default fence poll time of 10ms (100 Hz) is sufficent for
> > > > normal
> > > > work loads, but if one wants to play games within the virtual
> > > > machine
> > > > this value might be too high, so make it possible to configure
> > > > this
> > > > value by using the environment variable QEMU_VIRGL_POLL_FREQ
> > > > where
> > > > the
> > > > poll is given in Hz. To acommodate higher poll frequencies also
> > > > change
> > > > the timer to use micro seconds as base instead of milliseconds.
> > > >=20
> > > >=20
> > >=20
> > > This is what VIRGL_RENDERER_THREAD_SYNC helps with. You don't
> > > need to
> > > do regular polling, but I think it is currently limited to
> > > Linux/eventfd only.
> >=20
> > As far as I can see only vtest uses this, not qemu.
>=20
> I don't think there is anything preventing qemu from using it, except
> the portability which should be taken care more carefully.

But to actually use it would need quite some work, wouldn't it? (I'm
thinking of your series: =20
http://qemu.11.n7.nabble.com/PATCH-00-18-virgl-use-a-seperate-rendering-t=
hread-tt429557.html
)


That's why I though that being able to configure the polling frequency
might be an easy way to give some performance boost.=20


>=20
> > > fwiw, vhost-user-gpu uses it.
> >=20
> > Yeah, I tested it on Intel, but AFAICS this hasn't landed yet, no?
> > OTOH
> > the drm calls were only implemented for Intel, and I have no idea
> > how
> > to implement this for other hardware, like e.g. radeonsi, or even
> > the
> > Nvidia blob ...
>=20
> I just sent v8 for review today:
> https://patchew.org/QEMU/20190523132035.20559-1-marcandre.lureau@redhat=
.com/
>=20
> The DRM bits were replaced by GBM usage, which will give some
> portability.
That's great, I'll give it a spin in the next view days.=20

Best,=20
Gert=20

> > >=20
> > > > Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> > > > ---
> > > >  hw/display/virtio-gpu-3d.c     | 18 ++++++++++++++++--
> > > >  include/hw/virtio/virtio-gpu.h |  1 +
> > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-
> > > > gpu-
> > > > 3d.c
> > > > index 5ee3566ae0..120e593e76 100644
> > > > --- a/hw/display/virtio-gpu-3d.c
> > > > +++ b/hw/display/virtio-gpu-3d.c
> > > > @@ -17,6 +17,7 @@
> > > >  #include "trace.h"
> > > >  #include "hw/virtio/virtio.h"
> > > >  #include "hw/virtio/virtio-gpu.h"
> > > > +#include "qemu/cutils.h"
> > > >=20
> > > >  #ifdef CONFIG_VIRGL
> > > >=20
> > > > @@ -580,7 +581,8 @@ static void virtio_gpu_fence_poll(void
> > > > *opaque)
> > > >      virgl_renderer_poll();
> > > >      virtio_gpu_process_cmdq(g);
> > > >      if (!QTAILQ_EMPTY(&g->cmdq) || !QTAILQ_EMPTY(&g->fenceq))
> > > > {
> > > > -        timer_mod(g->fence_poll,
> > > > qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1);
> > > > +        timer_mod(g->fence_poll,
> > > > qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) +
> > > > +                                 g->fence_poll_timeout);
> > > >      }
> > > >  }
> > > >=20
> > > > @@ -605,13 +607,25 @@ void virtio_gpu_virgl_reset(VirtIOGPU *g)
> > > >  int virtio_gpu_virgl_init(VirtIOGPU *g)
> > > >  {
> > > >      int ret;
> > > > +    const char *val;
> > > >=20
> > > >      ret =3D virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> > > >      if (ret !=3D 0) {
> > > >          return ret;
> > > >      }
> > > >=20
> > > > -    g->fence_poll =3D timer_new_ms(QEMU_CLOCK_VIRTUAL,
> > > > +    g->fence_poll_timeout =3D 10000; /* default 10 ms */
> > > > +    val =3D getenv("QEMU_VIRGL_POLL_FREQ");
> > > > +    if (val) {
> > > > +        unsigned long long poll_freq;
> > > > +        if (parse_uint_full(val, &poll_freq, 10) || poll_freq
> > > > >
> > > > UINT32_MAX) {
> > > > +            fprintf(stderr, "VIRGL_POLL_FREQ: Invalid integer
> > > > `%s'\n", val);
> > > > +            exit(1);
> > > > +        }
> > > > +        g->fence_poll_timeout =3D 1000000 / (uint32_t)poll_freq;
> > > > +    }
> > > > +
> > > > +    g->fence_poll =3D timer_new_us(QEMU_CLOCK_VIRTUAL,
> > > >                                   virtio_gpu_fence_poll, g);
> > > >=20
> > > >      if (virtio_gpu_stats_enabled(g->conf)) {
> > > > diff --git a/include/hw/virtio/virtio-gpu.h
> > > > b/include/hw/virtio/virtio-gpu.h
> > > > index 60425c5d58..a9e03b25aa 100644
> > > > --- a/include/hw/virtio/virtio-gpu.h
> > > > +++ b/include/hw/virtio/virtio-gpu.h
> > > > @@ -116,6 +116,7 @@ typedef struct VirtIOGPU {
> > > >      bool renderer_reset;
> > > >      QEMUTimer *fence_poll;
> > > >      QEMUTimer *print_stats;
> > > > +    uint32_t fence_poll_timeout;
> > > >=20
> > > >      uint32_t inflight;
> > > >      struct {
> > > > --
> > > > 2.20.1
> > > >=20
> > > >=20
>=20
>=20



