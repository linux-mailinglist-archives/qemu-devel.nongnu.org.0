Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657F34220D9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:32:34 +0200 (CEST)
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfsH-0001yf-GI
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfas-0004ap-Pu
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfao-0000qa-Ro
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXZm6oEV+vD/1t1tTcbyQqO0I6oLB2ahx3QouqITYg4=;
 b=Ich2X1XjT0nnRqNKDKM9MRr+z9m9Iz6KkAPoyfaKK955NA5qexqvPWAWvJLXiXd9toLOFD
 eWr+7YyhOF95ggYGza468vM1OSTvhlkBe96rfPbOXqyrKqSaJNury4CoXu/CUu4vr3h22C
 8Nfb1fPUFsByryRp6aQKppY1mReuR9o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-LRqsHt3FOfuwsOnwWxI37g-1; Tue, 05 Oct 2021 04:14:27 -0400
X-MC-Unique: LRqsHt3FOfuwsOnwWxI37g-1
Received: by mail-ed1-f71.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso19857587edw.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 01:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oXZm6oEV+vD/1t1tTcbyQqO0I6oLB2ahx3QouqITYg4=;
 b=AFcnFXV1MNF9JVmwlV3+Rr9Fkng99vMydmDsLEYJu5edg74RPI+L6hE6H3qoxFyucW
 +Z/u7NlLuxnazSbV1LrVwt5CDcbHTpnmBLymRfot9xubna5oW/lhD8jnWk50AtjSO3ge
 SZLW5xIeo3mu5OonKEIjLPmg2h5jKjDzHaw8Lv9lCC8l72e4ChocATUBTSCb88xl9URF
 Pi+MEzWY8ik4BSR+fTuQCgPpz5M80ZDNRJOQvJd4Wp8hV3ntJ9MYWl2t+su4BLwl/u7v
 iLbqv42OzW/t7CIB4LeTa3ux5hO1qfiH6/eJ4yNx0U+Ipc42lFYF7dPUGaT7xvl+aU0+
 gSkQ==
X-Gm-Message-State: AOAM532tao1RqD0AkEiz2FaUBuRIypxF41l+0+hYL8z5shKCvf5pRW1Z
 JYhb/tw3K4Fr7LSqsiK+kEIYYRnOAp0GFJAA70tDzGTYmruKrUhjbZXfCi0kDgM+GGUXHYSQmWd
 C2Ddea7H59YoGjg4=
X-Received: by 2002:aa7:d397:: with SMTP id x23mr10225989edq.377.1633421665868; 
 Tue, 05 Oct 2021 01:14:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOmd0zQJQpUNAdxNT8RCXLA9X4PQWo6j+690bzzm2QgsYONYss08Fgj8S0ePbgpRzHnzw61Q==
X-Received: by 2002:aa7:d397:: with SMTP id x23mr10225961edq.377.1633421665614; 
 Tue, 05 Oct 2021 01:14:25 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id u16sm7352814ejy.14.2021.10.05.01.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 01:14:25 -0700 (PDT)
Date: Tue, 5 Oct 2021 04:14:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 3/3] vdpa: Check for iova range at mappings changes
Message-ID: <20211005040928-mutt-send-email-mst@kernel.org>
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-4-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005080131.408506-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:01:31AM +0200, Eugenio Pérez wrote:
> Check vdpa device range before updating memory regions so we don't add
> any outside of it, and report the invalid change if any.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  2 +
>  hw/virtio/vhost-vdpa.c         | 68 ++++++++++++++++++++++++++--------
>  hw/virtio/trace-events         |  1 +
>  3 files changed, 55 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index a8963da2d9..c288cf7ecb 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -13,6 +13,7 @@
>  #define HW_VIRTIO_VHOST_VDPA_H
>  
>  #include "hw/virtio/virtio.h"
> +#include "standard-headers/linux/vhost_types.h"
>  
>  typedef struct VhostVDPAHostNotifier {
>      MemoryRegion mr;
> @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
>      uint32_t msg_type;
>      bool iotlb_batch_begin_sent;
>      MemoryListener listener;
> +    struct vhost_vdpa_iova_range iova_range;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>  } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index a1de6c7c9c..26d0258723 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -33,20 +33,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
>      return llend;
>  }
>  
> -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
> -{
> -    return (!memory_region_is_ram(section->mr) &&
> -            !memory_region_is_iommu(section->mr)) ||
> -            memory_region_is_protected(section->mr) ||
> -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> -            memory_region_is_ram_device(section->mr) ||
> -           /*
> -            * Sizing an enabled 64-bit BAR can cause spurious mappings to
> -            * addresses in the upper part of the 64-bit address space.  These
> -            * are never accessed by the CPU and beyond the address width of
> -            * some IOMMU hardware.  TODO: VDPA should tell us the IOMMU width.
> -            */
> -           section->offset_within_address_space & (1ULL << 63);
> +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> +                                                uint64_t iova_min,
> +                                                uint64_t iova_max)
> +{
> +    Int128 llend;
> +    bool r = (!memory_region_is_ram(section->mr) &&
> +              !memory_region_is_iommu(section->mr)) ||
> +              memory_region_is_protected(section->mr) ||
> +              /* vhost-vDPA doesn't allow MMIO to be mapped  */
> +              memory_region_is_ram_device(section->mr);
> +    if (r) {
> +        return true;
> +    }
> +
> +    if (section->offset_within_address_space < iova_min) {
> +        error_report("RAM section out of device range (min=%lu, addr=%lu)",
> +                     iova_min, section->offset_within_address_space);
> +        return true;
> +    }
> +
> +    llend = vhost_vdpa_section_end(section);
> +    if (int128_make64(llend) > iova_max) {

I am puzzled by this.
You are taking a Int128, converting to u64, converting
back to Int128, and comparing to u64.
Head spins. What is all this back and forth trying to achieve?

> +        error_report("RAM section out of device range (max=%lu, end addr=%lu)",
> +                     iova_max, (uint64_t)int128_make64(llend));
> +        return true;
> +    }
> +
> +    return false;
>  }
>  
>  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> @@ -158,7 +172,8 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>      void *vaddr;
>      int ret;
>  
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> +                                            v->iova_range.last)) {
>          return;
>      }
>  
> @@ -216,7 +231,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>      Int128 llend, llsize;
>      int ret;
>  
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> +                                            v->iova_range.last)) {
>          return;
>      }
>  
> @@ -284,9 +300,24 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>  }
>  
> +static int vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> +{
> +    int ret;
> +
> +    ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE, &v->iova_range);
> +    if (ret != 0) {
> +        return ret;
> +    }
> +
> +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> +                                    v->iova_range.last);
> +    return ret;
> +}
> +
>  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>  {
>      struct vhost_vdpa *v;
> +    int r;
>      assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>      trace_vhost_vdpa_init(dev, opaque);
>  
> @@ -296,6 +327,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>      v->listener = vhost_vdpa_memory_listener;
>      v->msg_type = VHOST_IOTLB_MSG_V2;
>  
> +    r = vhost_vdpa_get_iova_range(v);
> +    if (unlikely(!r)) {
> +        return r;
> +    }
> +
>      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                 VIRTIO_CONFIG_S_DRIVER);
>  
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8ed19e9d0c..650e521e35 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>  vhost_vdpa_set_owner(void *dev) "dev: %p"
>  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
>  
>  # virtio.c
>  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> -- 
> 2.27.0


