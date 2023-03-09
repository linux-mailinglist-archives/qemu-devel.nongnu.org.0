Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB46B21C4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:45:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paDkb-0008B6-Py; Thu, 09 Mar 2023 05:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1paDka-0008Ao-2V
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1paDkY-0000aV-FG
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678358632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LbPNDz/A2letSB/0ETL2iW7R/GejqNgSANH0zkTZSM=;
 b=I4A2KuKXjuRNyx54sIVutuhJR2U45SQnYPDIiDsrC1bfoF33+dsd0KoRNSaOOLZEje/WrN
 UokFH6yNGaPUtTq9/KjMipJChKuwUbc98l853WWSflszR6Qxh2Faw49ROUKa414ijSAWLr
 P/2NYxIu5dV4BUV8+OStpFlA/V+2yWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-px_opmpON3mpv-Ne5LGNtQ-1; Thu, 09 Mar 2023 05:43:49 -0500
X-MC-Unique: px_opmpON3mpv-Ne5LGNtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E043D8588E0;
 Thu,  9 Mar 2023 10:43:48 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E261121314;
 Thu,  9 Mar 2023 10:43:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, qemu-devel@nongnu.org
Cc: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, Halil Pasic
 <pasic@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH] virtio: refresh vring region cache after updating a
 virtqueue size
In-Reply-To: <20230302101447.4499-1-clopez@suse.de>
Organization: Red Hat GmbH
References: <20230302101447.4499-1-clopez@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 09 Mar 2023 11:43:46 +0100
Message-ID: <875ybajjbx.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Thu, Mar 02 2023, Carlos L=C3=B3pez <clopez@suse.de> wrote:

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
> Fix this by calling virtio_queue_update_rings() after
> virtio_queue_set_num() if we are not already calling
> virtio_queue_set_rings().

Don't we instead need to call virtio_init_region_cache() to update the
caches? virtio_queue_set_rings() will calculate avail and used from
desc, which looks wrong for modern devices.

>
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>
> ---
>  hw/s390x/virtio-ccw.c   | 1 +
>  hw/virtio/virtio-mmio.c | 5 ++---
>  hw/virtio/virtio-pci.c  | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index e33e5207ab..89891ac58a 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBl=
ock *info,
>                  return -EINVAL;
>              }
>              virtio_queue_set_num(vdev, index, num);
> +            virtio_queue_update_rings(vdev, index);

Note that this is the non-legacy path.

>          } else if (virtio_queue_get_num(vdev, index) > num) {
>              /* Fail if we don't have a big enough queue. */
>              return -EINVAL;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 23ba625eb6..c74822308f 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -350,10 +350,9 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
>      case VIRTIO_MMIO_QUEUE_NUM:
>          trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
>          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> +        virtio_queue_update_rings(vdev, vdev->queue_sel);
>=20=20
> -        if (proxy->legacy) {
> -            virtio_queue_update_rings(vdev, vdev->queue_sel);
> -        } else {
> +        if (!proxy->legacy) {
>              proxy->vqs[vdev->queue_sel].num =3D value;
>          }
>          break;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..a0a2f2c965 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, h=
waddr addr,
>          proxy->vqs[vdev->queue_sel].num =3D val;
>          virtio_queue_set_num(vdev, vdev->queue_sel,
>                               proxy->vqs[vdev->queue_sel].num);
> +        virtio_queue_update_rings(vdev, vdev->queue_sel);
>          break;
>      case VIRTIO_PCI_COMMON_Q_MSIX:
>          vector =3D virtio_queue_vector(vdev, vdev->queue_sel);


