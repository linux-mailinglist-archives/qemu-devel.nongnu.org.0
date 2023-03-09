Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83586B27B5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHYz-0005g2-La; Thu, 09 Mar 2023 09:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paHYy-0005eI-5B
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paHYw-00014q-J7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678373289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1dRqVVIWA3RceXjrECYZ3KVX0yXWMoY4HMSwnUr6Uo=;
 b=X9pT/qWKqITdWs3IosJz9U243g+sYViGE8VNNO2mEqwpTGcyKjzyUf7PUUElahdgWlDWMy
 VGDmE/oGIjh2KDEw396/YRRK2sn5xV601rHGMi8pWvHtS2fNPx+or0Byg41jVsGmux1i2w
 8mKVlV+0ZvGs/6RxFFN5nGReXkF2pc4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-ead_zCN8MWKLCy_bvNEHfQ-1; Thu, 09 Mar 2023 09:48:08 -0500
X-MC-Unique: ead_zCN8MWKLCy_bvNEHfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g2-20020a056402320200b004e98d45ee7dso3324066eda.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y1dRqVVIWA3RceXjrECYZ3KVX0yXWMoY4HMSwnUr6Uo=;
 b=gW7uxP/rsc2xN3nhohj/kVw30RjbHPjMzDtRCcMAsW+GKNufZeO6+BOugcGc/QZWMN
 4FJgUSp9otOQtNAJCVAZwRtJ0RKD7tx3zYfYpVnQhQ9Y5S0WZulgd4kY6Vu1xGtwZR6N
 rALVOF2MRJlPbwjfMTLwSwm98UvcTlO/upeeUnKuhOFEgfH3W2l9kQwcicTSck50UixM
 6axljNFxEJovGPB5gh7nuT+Hm0hXGdImsx6BRL9FaUtkRZZprTehiyZacZCPye/q+Ibk
 CyC87epJvxmMG7YQyGgFYfMYFG0KnB+ACppdi6snUOhQrouOUwl5B5+CepO5iZgLzDPA
 C7Gw==
X-Gm-Message-State: AO0yUKWTFr+4aCRz87w/NDAxHM2pWxYV7ojZLC0RLUWV2aUEHbIWrtbJ
 Ro3OSeYSiFcymYQfapMau1lQPuX2Iizy5rSH6DhsZGzoT4piCUlSZKOeq5BCDnc5ylMp53CWRMp
 PArM73mk4++q3OO/6/xSc5+VRdI4bJUioFKhTnYmE3g5HjTU0YKsdQjIv1Ehs9WVgVieD
X-Received: by 2002:a17:907:6eab:b0:7c0:efb9:bc0e with SMTP id
 sh43-20020a1709076eab00b007c0efb9bc0emr29312089ejc.62.1678373287131; 
 Thu, 09 Mar 2023 06:48:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+9GpsumAxgKd5GLvET018yLUwCv9K/t10bm6bcKkD9iyVXqGMlIfdB33YSi9O1rG8dV+t9+Q==
X-Received: by 2002:a17:907:6eab:b0:7c0:efb9:bc0e with SMTP id
 sh43-20020a1709076eab00b007c0efb9bc0emr29312048ejc.62.1678373286805; 
 Thu, 09 Mar 2023 06:48:06 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 b18-20020a50b412000000b004af6e957b22sm9764265edh.6.2023.03.09.06.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:48:06 -0800 (PST)
Date: Thu, 9 Mar 2023 09:48:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: Re: [PULL 73/73] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230309094740-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <52062b213c13bd7fff966d36b554c04609c925d6.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52062b213c13bd7fff966d36b554c04609c925d6.1678237635.git.mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 07, 2023 at 08:14:31PM -0500, Michael S. Tsirkin wrote:
> From: Carlos López <clopez@suse.de>
> 
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
>         VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
>         hwaddr pa = offsetof(VRingAvail, ring[i]);
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
> 
> Signed-off-by: Carlos López <clopez@suse.de>
> Message-Id: <20230302101447.4499-1-clopez@suse.de>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


I just dropped this from the pull. No other changes so
not reposting, hope it's not too late.

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
> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
>                  return -EINVAL;
>              }
>              virtio_queue_set_num(vdev, index, num);
> +            virtio_queue_update_rings(vdev, index);
>          } else if (virtio_queue_get_num(vdev, index) > num) {
>              /* Fail if we don't have a big enough queue. */
>              return -EINVAL;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 23ba625eb6..c74822308f 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -350,10 +350,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>      case VIRTIO_MMIO_QUEUE_NUM:
>          trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
>          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> +        virtio_queue_update_rings(vdev, vdev->queue_sel);
>  
> -        if (proxy->legacy) {
> -            virtio_queue_update_rings(vdev, vdev->queue_sel);
> -        } else {
> +        if (!proxy->legacy) {
>              proxy->vqs[vdev->queue_sel].num = value;
>          }
>          break;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..a0a2f2c965 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>          proxy->vqs[vdev->queue_sel].num = val;
>          virtio_queue_set_num(vdev, vdev->queue_sel,
>                               proxy->vqs[vdev->queue_sel].num);
> +        virtio_queue_update_rings(vdev, vdev->queue_sel);
>          break;
>      case VIRTIO_PCI_COMMON_Q_MSIX:
>          vector = virtio_queue_vector(vdev, vdev->queue_sel);
> -- 
> MST
> 


