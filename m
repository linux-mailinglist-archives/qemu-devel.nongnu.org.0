Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42F433231
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:26:41 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclOK-0000Ig-My
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mclMz-0007yO-AJ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mclMq-0001uk-BI
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5zqVoM2agsiU3LOFpeyIpQ48/zut14X/JcwXbTckjc=;
 b=fxnWgjwHLzYFDAXxq0s/NkzSbqnfH/xSaVBukpMHDCOearE3Fc1JNre+u8f+imfomvTEIB
 4jqjrvcJVzryycKHZUwTsO6RUvCtVrwAHtxrKmISzeHtwkIHClDOHgUAxUIv5mzbS8Rqst
 IAIwb25LHZBMOqU3+bb4Helsj4Wu6GM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-KWPiAXpAO76dR9Htg6O2tw-1; Tue, 19 Oct 2021 05:25:06 -0400
X-MC-Unique: KWPiAXpAO76dR9Htg6O2tw-1
Received: by mail-pl1-f199.google.com with SMTP id
 k1-20020a170902c40100b0013f47bac4d8so7798694plk.14
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V5zqVoM2agsiU3LOFpeyIpQ48/zut14X/JcwXbTckjc=;
 b=caTpA/K4hXBzHYO7u077wK5sRVDIlVOLfPCTYReJxXwTh6LCg4i7zpI22b7bXM+nxk
 kDaqG3JGRZDc3g7/f6sHnPeJXazHDcXDK2WNGunWMnyJrVkMZAavRiv/egBHTRpvuNfp
 797Amci6SwAKarnKmk5IBqrYzZlK6M6At1/016jlHOXORbMykQHz7iFq1bckGjbU+7VM
 ofJh1OVWqyFiUfObvnrRSyndCcLW7lHXcNGoYl1r3mHLqwH+bzXm5ZPTSp6cl5K7lr1A
 5WuBr6l/5NQfbclSmOZwV63AauMWagc/UPRUQL9ZDDGg29Zi3VaCtTvCuqSzbkNojkdF
 oPJw==
X-Gm-Message-State: AOAM53272kOyjT82N6kESQZt1cI61RmlN1uc0maFHhwVSwHQO756cf2e
 Buo6bE5fTzCvpEKmB/NGXKmqygaf2KbOOyU/bcnULispauin3sUr4jNNQcY4fSebzLjhQDuzvXc
 A1o36YnOBauBHZlo=
X-Received: by 2002:a17:902:dac2:b0:13e:f73b:6b5d with SMTP id
 q2-20020a170902dac200b0013ef73b6b5dmr888492plx.49.1634635504962; 
 Tue, 19 Oct 2021 02:25:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweSuYSoN2J0RDZPIt+gEbBaVqebIynHGRmcJerbs4rnq2wrusUqRFMXncwoHBz9hPOFc0fzQ==
X-Received: by 2002:a17:902:dac2:b0:13e:f73b:6b5d with SMTP id
 q2-20020a170902dac200b0013ef73b6b5dmr888453plx.49.1634635504546; 
 Tue, 19 Oct 2021 02:25:04 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y8sm15458524pfe.217.2021.10.19.02.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 02:25:04 -0700 (PDT)
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a426c22c-f41a-4e3f-d140-7e7a0defeacb@redhat.com>
Date: Tue, 19 Oct 2021 17:24:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-21-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:06, Eugenio Pérez 写道:
> Use translations added in VhostIOVATree in SVQ.
>
> Now every element needs to store the previous address also, so VirtQueue
> can consume the elements properly. This adds a little overhead per VQ
> element, having to allocate more memory to stash them. As a possible
> optimization, this allocation could be avoided if the descriptor is not
> a chain but a single one, but this is left undone.
>
> TODO: iova range should be queried before, and add logic to fail when
> GPA is outside of its range and memory listener or svq add it.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
>   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++-----
>   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
>   hw/virtio/trace-events             |   1 +
>   4 files changed, 152 insertions(+), 23 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index b7baa424a7..a0e6b5267a 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -11,6 +11,7 @@
>   #define VHOST_SHADOW_VIRTQUEUE_H
>   
>   #include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-iova-tree.h"
>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
> @@ -28,7 +29,8 @@ bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
>   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>                       VhostShadowVirtqueue *svq);
>   
> -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx);
> +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx,
> +                                    VhostIOVATree *iova_map);
>   
>   void vhost_svq_free(VhostShadowVirtqueue *vq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 2fd0bab75d..9db538547e 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -11,12 +11,19 @@
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost.h"
>   #include "hw/virtio/virtio-access.h"
> +#include "hw/virtio/vhost-iova-tree.h"
>   
>   #include "standard-headers/linux/vhost_types.h"
>   
>   #include "qemu/error-report.h"
>   #include "qemu/main-loop.h"
>   
> +typedef struct SVQElement {
> +    VirtQueueElement elem;
> +    void **in_sg_stash;
> +    void **out_sg_stash;
> +} SVQElement;
> +
>   /* Shadow virtqueue to relay notifications */
>   typedef struct VhostShadowVirtqueue {
>       /* Shadow vring */
> @@ -46,8 +53,11 @@ typedef struct VhostShadowVirtqueue {
>       /* Virtio device */
>       VirtIODevice *vdev;
>   
> +    /* IOVA mapping if used */
> +    VhostIOVATree *iova_map;
> +
>       /* Map for returning guest's descriptors */
> -    VirtQueueElement **ring_id_maps;
> +    SVQElement **ring_id_maps;
>   
>       /* Next head to expose to device */
>       uint16_t avail_idx_shadow;
> @@ -79,13 +89,6 @@ bool vhost_svq_valid_device_features(uint64_t *dev_features)
>               continue;
>   
>           case VIRTIO_F_ACCESS_PLATFORM:
> -            /* SVQ needs this feature disabled. Can't continue */
> -            if (*dev_features & BIT_ULL(b)) {
> -                clear_bit(b, dev_features);
> -                r = false;
> -            }
> -            break;
> -
>           case VIRTIO_F_VERSION_1:
>               /* SVQ needs this feature, so can't continue */
>               if (!(*dev_features & BIT_ULL(b))) {
> @@ -126,6 +129,64 @@ static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
>       }
>   }
>   
> +static void vhost_svq_stash_addr(void ***stash, const struct iovec *iov,
> +                                 size_t num)
> +{
> +    size_t i;
> +
> +    if (num == 0) {
> +        return;
> +    }
> +
> +    *stash = g_new(void *, num);
> +    for (i = 0; i < num; ++i) {
> +        (*stash)[i] = iov[i].iov_base;
> +    }
> +}
> +
> +static void vhost_svq_unstash_addr(void **stash, struct iovec *iov, size_t num)
> +{
> +    size_t i;
> +
> +    if (num == 0) {
> +        return;
> +    }
> +
> +    for (i = 0; i < num; ++i) {
> +        iov[i].iov_base = stash[i];
> +    }
> +    g_free(stash);
> +}
> +
> +static void vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
> +                                     struct iovec *iovec, size_t num)
> +{
> +    size_t i;
> +
> +    for (i = 0; i < num; ++i) {
> +        VhostDMAMap needle = {
> +            .translated_addr = iovec[i].iov_base,
> +            .size = iovec[i].iov_len,
> +        };
> +        size_t off;
> +
> +        const VhostDMAMap *map = vhost_iova_tree_find_iova(svq->iova_map,
> +                                                           &needle);


Is it possible that we end up with more than one maps here?


> +        /*
> +         * Map cannot be NULL since iova map contains all guest space and
> +         * qemu already has a physical address mapped
> +         */
> +        assert(map);
> +
> +        /*
> +         * Map->iova chunk size is ignored. What to do if descriptor
> +         * (addr, size) does not fit is delegated to the device.
> +         */
> +        off = needle.translated_addr - map->translated_addr;
> +        iovec[i].iov_base = (void *)(map->iova + off);
> +    }
> +}
> +
>   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>                                       const struct iovec *iovec,
>                                       size_t num, bool more_descs, bool write)
> @@ -156,8 +217,9 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>   }
>   
>   static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> -                                    VirtQueueElement *elem)
> +                                    SVQElement *svq_elem)
>   {
> +    VirtQueueElement *elem = &svq_elem->elem;
>       int head;
>       unsigned avail_idx;
>       vring_avail_t *avail = svq->vring.avail;
> @@ -167,6 +229,12 @@ static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
>       /* We need some descriptors here */
>       assert(elem->out_num || elem->in_num);
>   
> +    vhost_svq_stash_addr(&svq_elem->in_sg_stash, elem->in_sg, elem->in_num);
> +    vhost_svq_stash_addr(&svq_elem->out_sg_stash, elem->out_sg, elem->out_num);


I wonder if we can solve the trick like stash and unstash with a 
dedicated sgs in svq_elem, instead of reusing the elem.

Thanks


> +
> +    vhost_svq_translate_addr(svq, elem->in_sg, elem->in_num);
> +    vhost_svq_translate_addr(svq, elem->out_sg, elem->out_num);
> +
>       vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
>                               elem->in_num > 0, false);
>       vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, true);
> @@ -187,7 +255,7 @@ static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
>   
>   }
>   
> -static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
> +static void vhost_svq_add(VhostShadowVirtqueue *svq, SVQElement *elem)
>   {
>       unsigned qemu_head = vhost_svq_add_split(svq, elem);
>   
> @@ -221,7 +289,7 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>           }
>   
>           while (true) {
> -            VirtQueueElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
> +            SVQElement *elem = virtqueue_pop(svq->vq, sizeof(*elem));
>               if (!elem) {
>                   break;
>               }
> @@ -247,7 +315,7 @@ static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
>       return svq->used_idx != svq->shadow_used_idx;
>   }
>   
> -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> +static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
>   {
>       vring_desc_t *descs = svq->vring.desc;
>       const vring_used_t *used = svq->vring.used;
> @@ -279,7 +347,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
>       descs[used_elem.id].next = svq->free_head;
>       svq->free_head = used_elem.id;
>   
> -    svq->ring_id_maps[used_elem.id]->len = used_elem.len;
> +    svq->ring_id_maps[used_elem.id]->elem.len = used_elem.len;
>       return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>   }
>   
> @@ -296,12 +364,19 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
>   
>           vhost_svq_set_notification(svq, false);
>           while (true) {
> -            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
> -            if (!elem) {
> +            g_autofree SVQElement *svq_elem = vhost_svq_get_buf(svq);
> +            VirtQueueElement *elem;
> +            if (!svq_elem) {
>                   break;
>               }
>   
>               assert(i < svq->vring.num);
> +            elem = &svq_elem->elem;
> +
> +            vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem->in_sg,
> +                                   elem->in_num);
> +            vhost_svq_unstash_addr(svq_elem->out_sg_stash, elem->out_sg,
> +                                   elem->out_num);
>               virtqueue_fill(vq, elem, elem->len, i++);
>           }
>   
> @@ -451,14 +526,24 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>       event_notifier_set_handler(&svq->host_notifier, NULL);
>   
>       for (i = 0; i < svq->vring.num; ++i) {
> -        g_autofree VirtQueueElement *elem = svq->ring_id_maps[i];
> +        g_autofree SVQElement *svq_elem = svq->ring_id_maps[i];
> +        VirtQueueElement *elem;
> +
> +        if (!svq_elem) {
> +            continue;
> +        }
> +
> +        elem = &svq_elem->elem;
> +        vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem->in_sg,
> +                               elem->in_num);
> +        vhost_svq_unstash_addr(svq_elem->out_sg_stash, elem->out_sg,
> +                               elem->out_num);
> +
>           /*
>            * Although the doc says we must unpop in order, it's ok to unpop
>            * everything.
>            */
> -        if (elem) {
> -            virtqueue_unpop(svq->vq, elem, elem->len);
> -        }
> +        virtqueue_unpop(svq->vq, elem, elem->len);
>       }
>   }
>   
> @@ -466,7 +551,8 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>    * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>    * methods and file descriptors.
>    */
> -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
> +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx,
> +                                    VhostIOVATree *iova_map)
>   {
>       int vq_idx = dev->vq_index + idx;
>       unsigned num = virtio_queue_get_num(dev->vdev, vq_idx);
> @@ -500,11 +586,13 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>       memset(svq->vring.desc, 0, driver_size);
>       svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
>       memset(svq->vring.used, 0, device_size);
> +    svq->iova_map = iova_map;
> +
>       for (i = 0; i < num - 1; i++) {
>           svq->vring.desc[i].next = cpu_to_le16(i + 1);
>       }
>   
> -    svq->ring_id_maps = g_new0(VirtQueueElement *, num);
> +    svq->ring_id_maps = g_new0(SVQElement *, num);
>       event_notifier_set_handler(&svq->call_notifier,
>                                  vhost_svq_handle_call);
>       return g_steal_pointer(&svq);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index a9c680b487..f5a12fee9d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -176,6 +176,18 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                            vaddr, section->readonly);
>   
>       llsize = int128_sub(llend, int128_make64(iova));
> +    if (v->shadow_vqs_enabled) {
> +        VhostDMAMap mem_region = {
> +            .translated_addr = vaddr,
> +            .size = int128_get64(llsize) - 1,
> +            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
> +        };
> +
> +        int r = vhost_iova_tree_alloc(v->iova_map, &mem_region);
> +        assert(r == VHOST_DMA_MAP_OK);
> +
> +        iova = mem_region.iova;
> +    }
>   
>       ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>                                vaddr, section->readonly);
> @@ -754,6 +766,23 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>       return true;
>   }
>   
> +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
> +                                     hwaddr *first, hwaddr *last)
> +{
> +    int ret;
> +    struct vhost_vdpa_iova_range range;
> +
> +    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range);
> +    if (ret != 0) {
> +        return ret;
> +    }
> +
> +    *first = range.first;
> +    *last = range.last;
> +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
> +    return ret;
> +}
> +
>   /**
>    * Maps QEMU vaddr memory to device in a suitable way for shadow virtqueue:
>    * - It always reference qemu memory address, not guest's memory.
> @@ -881,6 +910,7 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
>   static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>   {
>       struct vhost_dev *hdev = v->dev;
> +    hwaddr iova_first, iova_last;
>       unsigned n;
>       int r;
>   
> @@ -894,7 +924,7 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>           /* Allocate resources */
>           assert(v->shadow_vqs->len == 0);
>           for (n = 0; n < hdev->nvqs; ++n) {
> -            VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n);
> +            VhostShadowVirtqueue *svq = vhost_svq_new(hdev, n, v->iova_map);
>               if (unlikely(!svq)) {
>                   g_ptr_array_set_size(v->shadow_vqs, 0);
>                   return 0;
> @@ -903,6 +933,8 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>           }
>       }
>   
> +    r = vhost_vdpa_get_iova_range(hdev, &iova_first, &iova_last);
> +    assert(r == 0);
>       r = vhost_vdpa_vring_pause(hdev);
>       assert(r == 0);
>   
> @@ -913,6 +945,12 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>           }
>       }
>   
> +    memory_listener_unregister(&v->listener);
> +    if (vhost_vdpa_dma_unmap(v, iova_first,
> +                             (iova_last - iova_first) & TARGET_PAGE_MASK)) {
> +        error_report("Fail to invalidate device iotlb");
> +    }
> +
>       /* Reset device so it can be configured */
>       r = vhost_vdpa_dev_start(hdev, false);
>       assert(r == 0);
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


