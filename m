Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514066C4700
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pev9B-0003Ie-4g; Wed, 22 Mar 2023 05:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pev99-0003Hw-02
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pev95-0008N3-H2
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679478758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETf19yg7WSoTOZaKi1kSEiSAcOyO8JidhTVcymIbQ90=;
 b=iJ0MGyineT3ngoXK3KkxUOzlkj/gveoiz14dANq2h6Dyu/SAR6uMNopTT+wopaOaUA+gpR
 lotB9t3Hi84b51WAf0uAy6hI6D5Ho9P334J/EgisOT412rmVLHjFXDnpR7tomBYnEyL0ep
 sbphkpVICpC/HeXnw6CLpy0+ADl2klM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-NPrNOrNVOsavHO8UBuNWRw-1; Wed, 22 Mar 2023 05:52:34 -0400
X-MC-Unique: NPrNOrNVOsavHO8UBuNWRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2BB63814590;
 Wed, 22 Mar 2023 09:52:33 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B3F82166B2C;
 Wed, 22 Mar 2023 09:52:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, qemu-devel@nongnu.org
Cc: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, "Michael S. Tsirkin"
 <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
In-Reply-To: <20230317002749.27379-1-clopez@suse.de>
Organization: Red Hat GmbH
References: <20230317002749.27379-1-clopez@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Mar 2023 10:52:31 +0100
Message-ID: <87y1npglk0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Mar 17 2023, Carlos L=C3=B3pez <clopez@suse.de> wrote:

> When a virtqueue size is changed by the guest via
> virtio_queue_set_num(), its region cache is not automatically updated.
> If the size was increased, this could lead to accessing the cache out
> of bounds. For example, in vring_get_used_event():
>
>     static inline uint16_t vring_get_used_event(VirtQueue *vq)
>     {
>         return vring_avail_ring(vq, vq->vring.num);
>     }
>
>     static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
>     {
>         VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
>         hwaddr pa =3D offsetof(VRingAvail, ring[i]);
>
>         if (!caches) {
>             return 0;
>         }
>
>         return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>     }
>
> vq->vring.num will be greater than caches->avail.len, which will
> trigger a failed assertion down the call path of
> virtio_lduw_phys_cached().
>
> Fix this by calling virtio_init_region_cache() after
> virtio_queue_set_num() if we are not already calling
> virtio_queue_set_rings(). In the legacy path this is already done by
> virtio_queue_update_rings().
>
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>
> ---
> v2: use virtio_init_region_cache() instead of
> virtio_queue_update_rings() in the path for modern devices.
>
>  hw/s390x/virtio-ccw.c      | 1 +
>  hw/virtio/virtio-mmio.c    | 1 +
>  hw/virtio/virtio-pci.c     | 1 +
>  hw/virtio/virtio.c         | 2 +-
>  include/hw/virtio/virtio.h | 1 +
>  5 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index e33e5207ab..f44de1a8c1 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBl=
ock *info,
>                  return -EINVAL;
>              }
>              virtio_queue_set_num(vdev, index, num);
> +            virtio_init_region_cache(vdev, index);

Hmm... this is not wrong, but looking at it again, I see that the guest
has no way to change num after our last call to
virtio_init_region_cache() (while setting up the queue addresses.) IOW,
this introduces an extra round trip that is not really needed.

>          } else if (virtio_queue_get_num(vdev, index) > num) {
>              /* Fail if we don't have a big enough queue. */
>              return -EINVAL;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 23ba625eb6..c2c6d85475 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -354,6 +354,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
>          if (proxy->legacy) {
>              virtio_queue_update_rings(vdev, vdev->queue_sel);
>          } else {
> +            virtio_init_region_cache(vdev, vdev->queue_sel);
>              proxy->vqs[vdev->queue_sel].num =3D value;
>          }
>          break;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..02fb84a8fa 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, h=
waddr addr,
>          proxy->vqs[vdev->queue_sel].num =3D val;
>          virtio_queue_set_num(vdev, vdev->queue_sel,
>                               proxy->vqs[vdev->queue_sel].num);
> +        virtio_init_region_cache(vdev, vdev->queue_sel);
>          break;
>      case VIRTIO_PCI_COMMON_Q_MSIX:
>          vector =3D virtio_queue_vector(vdev, vdev->queue_sel);

OTOH, all other transports need this call, as setting the addresses and
setting num are two distinct operations. So I think we have two options:

- apply your patch, and accept that we have the extra round trip for ccw
  (which should not really be an issue, we're processing a channel
  command anyway)

- leave it out for ccw and add a comment why it isn't needed

(I think I'd prefer to just go ahead with your patch.)

Question (mostly for the other ccw folks): Do you think it is a problem
that ccw sets up queue addresses and size via one command, while pci and
mmio set addresses and size independently? I guess not; if anything, not
setting them in one go may lead to issues like the one this patch is
fixing.


