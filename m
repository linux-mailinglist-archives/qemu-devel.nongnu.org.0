Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662FE2B26A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 12:46:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVD9J-0000qK-8f
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 06:46:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hVD7s-0000T2-GS
	for qemu-devel@nongnu.org; Mon, 27 May 2019 06:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hVD7r-0001BL-3g
	for qemu-devel@nongnu.org; Mon, 27 May 2019 06:45:08 -0400
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:55768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hVD7q-0000tT-UG
	for qemu-devel@nongnu.org; Mon, 27 May 2019 06:45:07 -0400
Received: from player698.ha.ovh.net (unknown [10.109.160.253])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 81AA817B1CE
	for <qemu-devel@nongnu.org>; Mon, 27 May 2019 12:44:55 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id B152062F5F4E;
	Mon, 27 May 2019 10:44:47 +0000 (UTC)
Date: Mon, 27 May 2019 12:44:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Yongji Xie <elohimes@gmail.com>
Message-ID: <20190527124446.6b809c7f@bahia.lan>
In-Reply-To: <CAONzpcbf+AcY4yEO6hBnyp1dBaV4XgUrSTdU55B3S+wcn6gOVA@mail.gmail.com>
References: <20190520231008.20140-1-mst@redhat.com>
	<20190320112646.3712-2-xieyongji@baidu.com>
	<20190524121909.277ae31e@bahia.lan>
	<CAONzpcbf+AcY4yEO6hBnyp1dBaV4XgUrSTdU55B3S+wcn6gOVA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13809725310402992429
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddvvddgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.205
Subject: Re: [Qemu-devel] [PULL v2 04/36] virtio: Introduce started flag to
 VirtioDevice
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Zhang Yu <zhangyu31@baidu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Xie Yongji <xieyongji@baidu.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 May 2019 19:56:06 +0800
Yongji Xie <elohimes@gmail.com> wrote:

> On Fri, 24 May 2019 at 18:20, Greg Kurz <groug@kaod.org> wrote:
> >
> > On Mon, 20 May 2019 19:10:35 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >  
> > > From: Xie Yongji <xieyongji@baidu.com>
> > >
> > > The virtio 1.0 transitional devices support driver uses the device
> > > before setting the DRIVER_OK status bit. So we introduce a started
> > > flag to indicate whether driver has started the device or not.
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@baidu.com>
> > > Signed-off-by: Zhang Yu <zhangyu31@baidu.com>
> > > Message-Id: <20190320112646.3712-2-xieyongji@baidu.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  include/hw/virtio/virtio.h |  2 ++
> > >  hw/virtio/virtio.c         | 52 ++++++++++++++++++++++++++++++++++++--
> > >  2 files changed, 52 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > index 7140381e3a..27c0efc3d0 100644
> > > --- a/include/hw/virtio/virtio.h
> > > +++ b/include/hw/virtio/virtio.h
> > > @@ -105,6 +105,8 @@ struct VirtIODevice
> > >      uint16_t device_id;
> > >      bool vm_running;
> > >      bool broken; /* device in invalid state, needs reset */
> > > +    bool started;
> > > +    bool start_on_kick; /* virtio 1.0 transitional devices support that */
> > >      VMChangeStateEntry *vmstate;
> > >      char *bus_name;
> > >      uint8_t device_endian;
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index 28056a7ef7..5d533ac74e 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -1162,10 +1162,16 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
> > >              }
> > >          }
> > >      }
> > > +    vdev->started = val & VIRTIO_CONFIG_S_DRIVER_OK;
> > > +    if (unlikely(vdev->start_on_kick && vdev->started)) {
> > > +        vdev->start_on_kick = false;
> > > +    }
> > > +
> > >      if (k->set_status) {
> > >          k->set_status(vdev, val);
> > >      }
> > >      vdev->status = val;
> > > +
> > >      return 0;
> > >  }
> > >
> > > @@ -1208,6 +1214,9 @@ void virtio_reset(void *opaque)
> > >          k->reset(vdev);
> > >      }
> > >
> > > +    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
> > > +                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
> > > +    vdev->started = false;
> > >      vdev->broken = false;
> > >      vdev->guest_features = 0;
> > >      vdev->queue_sel = 0;
> > > @@ -1518,14 +1527,21 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
> > >
> > >  static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
> > >  {
> > > +    bool ret = false;
> > > +
> > >      if (vq->vring.desc && vq->handle_aio_output) {
> > >          VirtIODevice *vdev = vq->vdev;
> > >
> > >          trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
> > > -        return vq->handle_aio_output(vdev, vq);
> > > +        ret = vq->handle_aio_output(vdev, vq);
> > > +
> > > +        if (unlikely(vdev->start_on_kick)) {
> > > +            vdev->started = true;
> > > +            vdev->start_on_kick = false;
> > > +        }
> > >      }
> > >
> > > -    return false;
> > > +    return ret;
> > >  }
> > >
> > >  static void virtio_queue_notify_vq(VirtQueue *vq)
> > > @@ -1539,6 +1555,11 @@ static void virtio_queue_notify_vq(VirtQueue *vq)
> > >
> > >          trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
> > >          vq->handle_output(vdev, vq);
> > > +
> > > +        if (unlikely(vdev->start_on_kick)) {
> > > +            vdev->started = true;
> > > +            vdev->start_on_kick = false;
> > > +        }
> > >      }
> > >  }
> > >
> > > @@ -1556,6 +1577,11 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
> > >      } else if (vq->handle_output) {
> > >          vq->handle_output(vdev, vq);
> > >      }
> > > +
> > > +    if (unlikely(vdev->start_on_kick)) {
> > > +        vdev->started = true;
> > > +        vdev->start_on_kick = false;
> > > +    }
> > >  }
> > >
> > >  uint16_t virtio_queue_vector(VirtIODevice *vdev, int n)
> > > @@ -1770,6 +1796,13 @@ static bool virtio_broken_needed(void *opaque)
> > >      return vdev->broken;
> > >  }
> > >
> > > +static bool virtio_started_needed(void *opaque)
> > > +{
> > > +    VirtIODevice *vdev = opaque;
> > > +
> > > +    return vdev->started;  
> >
> > Existing machine types don't know about the "virtio/started" subsection. This
> > breaks migration to older QEMUs if the driver has started the device, ie. most
> > probably always when it comes to live migration.
> >
> > My understanding is that we do try to support backward migration though. It
> > is a regular practice in datacenters to migrate workloads without having to
> > take care of the QEMU version. FWIW I had to fix similar issues downstream
> > many times in the past because customers had filed bugs.
> >  
> 
> If we do need to support backward migration, for this patch, what I
> can think of is to only migrate the flag in the case that guest kicks
> but not set DRIVER_OK. This could fix backward migration in most case.

You mean something like that ?

static bool virtio_started_needed(void *opaque)
{
    VirtIODevice *vdev = opaque;

    return vdev->started && !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK);
}

> Not sure if there is a more general approach...
> 

Another approach would be to only implement the started flag for
machine version > 4.0. This can be achieved by adding a "use-started"
property to the base virtio device, true by default and set to
false by hw_compat_4_0.

> Thanks,
> Yongji


