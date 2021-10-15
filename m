Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69AB42ECFF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:00:31 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJ4o-0001m5-Qc
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbIKz-0008SI-1V
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:13:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbIKw-0003zE-Qp
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634285586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpXqt6yy4VffvCByeQY3zk2PYH1CxDLDUiT+DZV4hbA=;
 b=ShUZ/g4VQzT8zx6c4tGwfFJmsVWoYK6fxaP7qCDjCqR17YbSU3CUCYA5ctK6Lb1CQJz28G
 o7HqCrjfee+Wm4zhnx2oxIhiUN9PP6jhCOaPeNdyESPyFi58WWvv6YgOCgi1xufSus1tgO
 NtPVhs9aoEGd1quxbIj9CgezqnbgmTQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-fRwFE6HNOlaIsG2kPx15dQ-1; Fri, 15 Oct 2021 04:13:05 -0400
X-MC-Unique: fRwFE6HNOlaIsG2kPx15dQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 s34-20020a17090a2f2500b001a0e1134a7aso3691920pjd.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JpXqt6yy4VffvCByeQY3zk2PYH1CxDLDUiT+DZV4hbA=;
 b=pugDZSiTR9/KEEeH3cG2BLxckXsX9Snq+6z3IPcTNHUTybUN8pSL+ybfWCDcLchKYP
 rvPSTJZ8xBDdY6QFtY76sSRKDIe8dt8ZPhuUO6FryYOueFHOXoYVt/z2iMmTCKWlLr0L
 xFJLEQTRL85fXQDLcVkuuOjEDAbeqH5oAkscnwXwRg2om1VCPf7SjL92MV+aqYkMMQpg
 R85jSze+HdvswQeZa6VjXq4jFJCdpN9AScucIkRrBDp0wGGTFSfKsxAVUXSU15yBUf81
 aFuOW/fFVi4ZO8VKxGUvhG70NMInHDoTFvxGU3ppM03OMyfXMNXGbLEZ5gratX5pJ9QJ
 ptHw==
X-Gm-Message-State: AOAM532Knp8Avu88CsSV1coGGD5ngStSes65vTgpKHYA3fTynhLXGR5P
 q9WDioMIEjY4n01yJcsZQJcFYbz0vWms2OTNwNP7ncBeXb7TGqh27ytUGTeUA+gqiaSyp4Y/qdo
 tYydxEV8Za9QG43I=
X-Received: by 2002:a62:7b87:0:b0:44d:3e28:a2ac with SMTP id
 w129-20020a627b87000000b0044d3e28a2acmr10432139pfc.67.1634285583841; 
 Fri, 15 Oct 2021 01:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOFMK1LxFzX8lcegJk+BmktufvTyX00IK89ssLDwRbtNNEUhNeoYGuPRnCQbVQfUOyGi3Sfw==
X-Received: by 2002:a62:7b87:0:b0:44d:3e28:a2ac with SMTP id
 w129-20020a627b87000000b0044d3e28a2acmr10432101pfc.67.1634285583448; 
 Fri, 15 Oct 2021 01:13:03 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id on17sm11425773pjb.47.2021.10.15.01.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:13:03 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] vdpa: Check for iova range at mappings changes
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211014141236.923287-1-eperezma@redhat.com>
 <20211014141236.923287-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <83bb3fe3-10ff-2a8d-3140-e365a44bdac8@redhat.com>
Date: Fri, 15 Oct 2021 16:12:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014141236.923287-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/14 下午10:12, Eugenio Pérez 写道:
> Check vdpa device range before updating memory regions so we don't add
> any outside of it, and report the invalid change if any.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/hw/virtio/vhost-vdpa.h |  2 ++
>   hw/virtio/vhost-vdpa.c         | 62 +++++++++++++++++++++++++---------
>   hw/virtio/trace-events         |  1 +
>   3 files changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index a8963da2d9..c288cf7ecb 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -13,6 +13,7 @@
>   #define HW_VIRTIO_VHOST_VDPA_H
>   
>   #include "hw/virtio/virtio.h"
> +#include "standard-headers/linux/vhost_types.h"
>   
>   typedef struct VhostVDPAHostNotifier {
>       MemoryRegion mr;
> @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
>       uint32_t msg_type;
>       bool iotlb_batch_begin_sent;
>       MemoryListener listener;
> +    struct vhost_vdpa_iova_range iova_range;
>       struct vhost_dev *dev;
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index be7c63b4ba..7691e904ac 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
>       return llend;
>   }
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
> +
> +    if ((!memory_region_is_ram(section->mr) &&
> +         !memory_region_is_iommu(section->mr)) ||
> +        memory_region_is_protected(section->mr) ||
> +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> +        memory_region_is_ram_device(section->mr)) {
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
> +    if (int128_gt(llend, int128_make64(iova_max))) {
> +        error_report("RAM section out of device range (max=%lu, end addr=%lu)",
> +                     iova_max, int128_get64(llend));
> +        return true;
> +    }
> +
> +    return false;
>   }
>   
>   static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>       void *vaddr;
>       int ret;
>   
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> +                                            v->iova_range.last)) {
>           return;
>       }
>   
> @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>       Int128 llend, llsize;
>       int ret;
>   
> -    if (vhost_vdpa_listener_skipped_section(section)) {
> +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> +                                            v->iova_range.last)) {
>           return;
>       }
>   
> @@ -288,6 +304,19 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>       vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
>   }
>   
> +static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> +{
> +    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> +                              &v->iova_range);
> +    if (ret != 0) {
> +        v->iova_range.first = 0;
> +        v->iova_range.last = UINT64_MAX;
> +    }
> +
> +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> +                                    v->iova_range.last);
> +}
> +
>   static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>   {
>       struct vhost_vdpa *v;
> @@ -300,6 +329,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>       v->listener = vhost_vdpa_memory_listener;
>       v->msg_type = VHOST_IOTLB_MSG_V2;
>   
> +    vhost_vdpa_get_iova_range(v);
>       vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                  VIRTIO_CONFIG_S_DRIVER);
>   
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 8ed19e9d0c..650e521e35 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"


