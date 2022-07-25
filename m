Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C1257FC97
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:38:23 +0200 (CEST)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFuXe-0001KL-2s
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFuW9-0008N2-1C
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFuW4-0004PX-El
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658741800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOYFRhGkb10OAe8LzC2iXHQJ5iqncr95aKZsdocQoTE=;
 b=F7KMhgLO9ZUn/ehncm8tO6pkH0inKJh8ia7xXQOeiylyCH+kWnwPIUlFXwfsnpTmKM7HaX
 P4ojBo11kzARMyUC51Q2odNMLzVdL60ZHBfSkcNgJvxFERI97MnORBgC07Emnc26S5uquE
 caIqXgevsezTaFT+Df/Euec4sPCrvjw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-TJEinlHzOveMvzAbSE7mMA-1; Mon, 25 Jul 2022 05:36:38 -0400
X-MC-Unique: TJEinlHzOveMvzAbSE7mMA-1
Received: by mail-pg1-f198.google.com with SMTP id
 196-20020a6301cd000000b0041b0f053fd1so235811pgb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 02:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AOYFRhGkb10OAe8LzC2iXHQJ5iqncr95aKZsdocQoTE=;
 b=fl08DeXEvF0f0xqNwiI6bQxDrLshnRH4URPhwxuUdAcREHCWg5cOZ3kEDv6o6jXZnp
 swo2aJvaQ+vR4kFvpvMI3ir5Ts8d3tWbYBrMIwwprpo8GVQWLWchmNgUfGBvmCaScb3s
 OXzK5Vv/T+fIvCzBUPcdVcI+wrTWaKAfCdEs35JiCfLNbHUjazDXhRf1AVHBgleBxFoa
 V8TJj+lO79mit75rnAqWkvB1Lx1xzHkyo1IgkWiUMcFQuXEtNsXZmx10ju7goPyfNBSX
 t7cH1yvv+aDPVd5Rm0uEmUWyDKLNp0Cjcv96lST3iS0QDHhMmWkme3qHBwYgcONR+BJv
 WEFQ==
X-Gm-Message-State: AJIora+NiD1rvLn0KKk/E3CGfeRhTLPW/JUZ/lHCa21BAAJOisqgzMEx
 xjaxnLgfhsoUdbquuwV2sSQcQDlHoTMMtBKk9tSYynj2aVlr3khXZHBRd6ITMkWkUVwxwJEeVCE
 T76M/eWsPR2hvpy8=
X-Received: by 2002:a62:3884:0:b0:52b:ead1:7bc8 with SMTP id
 f126-20020a623884000000b0052bead17bc8mr9166313pfa.78.1658741797524; 
 Mon, 25 Jul 2022 02:36:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAJPwLww74z3mRYesDxBU6PPDsp78NaoLITE97YOswfQ8HkwxKokcN0osi5NGWFDnkVbKTzg==
X-Received: by 2002:a62:3884:0:b0:52b:ead1:7bc8 with SMTP id
 f126-20020a623884000000b0052bead17bc8mr9166277pfa.78.1658741797065; 
 Mon, 25 Jul 2022 02:36:37 -0700 (PDT)
Received: from [10.72.13.203] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a170902a50600b0016a0ac06424sm8739568plq.51.2022.07.25.02.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 02:36:36 -0700 (PDT)
Message-ID: <22b35cff-bcd5-78b8-cab4-43d2e65dccbe@redhat.com>
Date: Mon, 25 Jul 2022 17:36:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/7] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 Parav Pandit <parav@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan
 <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20220722134318.3430667-1-eperezma@redhat.com>
 <20220722134318.3430667-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220722134318.3430667-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/22 21:43, Eugenio Pérez 写道:
> So the caller can choose which ASID is destined.
>
> No need to update the batch functions as they will always be called from
> memory listener updates at the moment. Memory listener updates will
> always update ASID 0, as it's the passthrough ASID.
>
> All vhost devices's ASID are 0 at this moment.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h |  8 +++++---
>   hw/virtio/vhost-vdpa.c         | 26 ++++++++++++++++----------
>   net/vhost-vdpa.c               |  6 +++---
>   hw/virtio/trace-events         |  4 ++--
>   4 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 1111d85643..6560bb9d78 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
>       int index;
>       uint32_t msg_type;
>       bool iotlb_batch_begin_sent;
> +    uint32_t address_space_id;
>       MemoryListener listener;
>       struct vhost_vdpa_iova_range iova_range;
>       uint64_t acked_features;
> @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> -                       void *vaddr, bool readonly);
> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                       hwaddr size, void *vaddr, bool readonly);
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                         hwaddr size);
>   
>   #endif
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index e1ed56b26d..79623badf2 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>       return false;
>   }
>   
> -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> -                       void *vaddr, bool readonly)
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                       hwaddr size, void *vaddr, bool readonly)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
>       int ret = 0;
>   
>       msg.type = v->msg_type;
> +    msg.asid = asid;
>       msg.iotlb.iova = iova;
>       msg.iotlb.size = size;
>       msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
>       msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
>       msg.iotlb.type = VHOST_IOTLB_UPDATE;
>   
> -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
> -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
> +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
> +                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.perm,
> +                             msg.iotlb.type);
>   
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
> @@ -98,18 +100,20 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>       return ret;
>   }
>   
> -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size)
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> +                         hwaddr size)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
>       int ret = 0;
>   
>       msg.type = v->msg_type;
> +    msg.asid = asid;
>       msg.iotlb.iova = iova;
>       msg.iotlb.size = size;
>       msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
>   
> -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova,
>                                  msg.iotlb.size, msg.iotlb.type);
>   
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
> @@ -228,7 +232,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>       }
>   
>       vhost_vdpa_iotlb_batch_begin_once(v);
> -    ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> +    ret = vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
>                                vaddr, section->readonly);
>       if (ret) {
>           error_report("vhost vdpa map fail!");
> @@ -293,7 +297,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>           vhost_iova_tree_remove(v->iova_tree, result);
>       }
>       vhost_vdpa_iotlb_batch_begin_once(v);
> -    ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> +    ret = vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
>       if (ret) {
>           error_report("vhost_vdpa dma unmap error!");
>       }
> @@ -884,7 +888,7 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>       }
>   
>       size = ROUND_UP(result->size, qemu_real_host_page_size());
> -    r = vhost_vdpa_dma_unmap(v, result->iova, size);
> +    r = vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova, size);
>       return r == 0;
>   }
>   
> @@ -926,7 +930,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
>           return false;
>       }
>   
> -    r = vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> +    r = vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> +                           needle->size + 1,
>                              (void *)(uintptr_t)needle->translated_addr,
>                              needle->perm == IOMMU_RO);
>       if (unlikely(r != 0)) {
> @@ -1092,6 +1097,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   
>       if (started) {
>           vhost_vdpa_host_notifiers_init(dev);
> +


Unnecessary changes.

Other looks good.

Thanks


>           ok = vhost_vdpa_svqs_start(dev);
>           if (unlikely(!ok)) {
>               return -1;
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 75143ded8b..8203200c2a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -229,7 +229,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>           return;
>       }
>   
> -    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> +    r = vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, map->size + 1);
>       if (unlikely(r != 0)) {
>           error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
>       }
> @@ -278,8 +278,8 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
>           return false;
>       }
>   
> -    r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
> -                           !write);
> +    r = vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !write);
>       if (unlikely(r < 0)) {
>           goto dma_map_err;
>       }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 20af2e7ebd..36e5ae75f6 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -26,8 +26,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
>   vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
>   
>   # vhost-vdpa.c
> -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
>   vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"


