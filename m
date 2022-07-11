Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6E56F98B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:03:45 +0200 (CEST)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApKS-0002ef-E7
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApHm-0001EV-61
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApHi-0002yI-J8
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657530053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sLSIgEjGaNl8BDWolcQOUle3XH7sAPJdjnYxDIO6O8=;
 b=eVpXN43yVER0c8su3bVnY/yEjsR+RSDTCuHnFXgfBpLMls+3U0zdJINswEwvHCFUBSYr65
 IYs3XAohWxpNj8GvzajQfO70lz8jXZLH+EvIAeirmmiIOCStM6nDJWPSNiC2/K7BIclVHD
 VaYVy62ufnHyJd7Z/uCmwZulOTXWo3A=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-7GQpyhLBNX6HRgjfw4ybgw-1; Mon, 11 Jul 2022 05:00:51 -0400
X-MC-Unique: 7GQpyhLBNX6HRgjfw4ybgw-1
Received: by mail-pl1-f198.google.com with SMTP id
 h11-20020a170902f54b00b0016bfdca124fso3596820plf.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8sLSIgEjGaNl8BDWolcQOUle3XH7sAPJdjnYxDIO6O8=;
 b=QuQzj2yOVhk6tgUjjgY07h4PDinw5nt53Ezh0R2OurDcjMToCPtswu5xA4SUgrElMq
 GUON23HDhdEF7YJA01O3S6gyVtXPXWlQ8SlqFuT1Vly6gRGuRybdgwH615ZsbRMWEGes
 Emrpg965DqeQDo9K9/c+si47U3f9Ij7VFrraJfps7yTvA5qKxANueIubJiXDwoPBJptj
 AcONK2eohYdfU8kyilhDGLNB0/NOQUFI3SSPQL/6RXETxhriGFHKNP2lwHBvxygO5thR
 TOmUdaN1ZCX6TtJJ4kJYd27wT4ve3BR/kFG20J9D/Lpf2Iwx+o6QsiljnsuNggdXpFq8
 BGZQ==
X-Gm-Message-State: AJIora+Aus+yugnzVNa0gGATX42BjDV+g4jzBgIfiMY9BAu1CIloWD+j
 z5/buwzQpCCPZOGs6MBwOmz9+RoY825sPceGvAk+7mpaIcf6I3akNjX8PIU2oGjAnjKNuPzVLmp
 PkI7kXGxODXCtxrM=
X-Received: by 2002:a17:902:ce8c:b0:16c:4be6:254d with SMTP id
 f12-20020a170902ce8c00b0016c4be6254dmr3836809plg.51.1657530050631; 
 Mon, 11 Jul 2022 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9EOnJO+VyxQC+paTG2dOq1h1GlkFhnNbfD70jRK2/cgRX0IgSf3U1vVQFX3mbtz1mOj2ZFQ==
X-Received: by 2002:a17:902:ce8c:b0:16c:4be6:254d with SMTP id
 f12-20020a170902ce8c00b0016c4be6254dmr3836760plg.51.1657530050143; 
 Mon, 11 Jul 2022 02:00:50 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79e48000000b0051bc5f4df1csm4247976pfq.154.2022.07.11.02.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:00:49 -0700 (PDT)
Message-ID: <ece7b78f-9920-be6f-cea4-b9069035a6b0@redhat.com>
Date: Mon, 11 Jul 2022 17:00:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 09/23] vhost: Add SVQElement
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-10-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/7 02:39, Eugenio Pérez 写道:
> This will allow SVQ to add metadata to the different queue elements. To
> simplify changes, only store actual element at this patch.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  8 ++++--
>   hw/virtio/vhost-shadow-virtqueue.c | 41 ++++++++++++++++++++----------
>   2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 0fbdd69153..e434dc63b0 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -15,6 +15,10 @@
>   #include "standard-headers/linux/vhost_types.h"
>   #include "hw/virtio/vhost-iova-tree.h"
>   
> +typedef struct SVQElement {
> +    VirtQueueElement *elem;
> +} SVQElement;
> +
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
>                                       void *opaque);
> @@ -55,8 +59,8 @@ typedef struct VhostShadowVirtqueue {
>       /* IOVA mapping */
>       VhostIOVATree *iova_tree;
>   
> -    /* Map for use the guest's descriptors */
> -    VirtQueueElement **ring_id_maps;
> +    /* Each element context */
> +    SVQElement *ring_id_maps;
>   
>       /* Next VirtQueue element that guest made available */
>       VirtQueueElement *next_guest_avail_elem;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 46d3c1d74f..913bca8769 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -237,7 +237,7 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>           return false;
>       }
>   
> -    svq->ring_id_maps[qemu_head] = elem;
> +    svq->ring_id_maps[qemu_head].elem = elem;
>       return true;
>   }
>   
> @@ -385,15 +385,25 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
>       return i;
>   }
>   
> -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
> -                                           uint32_t *len)
> +static bool vhost_svq_is_empty_elem(SVQElement elem)
> +{
> +    return elem.elem == NULL;
> +}
> +
> +static SVQElement vhost_svq_empty_elem(void)
> +{
> +    return (SVQElement){};
> +}


I wonder what's the benefit of using this instead of passing pointer to 
SVQElement and using memset().


> +
> +static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
>   {
>       const vring_used_t *used = svq->vring.used;
>       vring_used_elem_t used_elem;
> +    SVQElement svq_elem = vhost_svq_empty_elem();
>       uint16_t last_used, last_used_chain, num;
>   
>       if (!vhost_svq_more_used(svq)) {
> -        return NULL;
> +        return svq_elem;
>       }
>   
>       /* Only get used array entries after they have been exposed by dev */
> @@ -406,24 +416,25 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>       if (unlikely(used_elem.id >= svq->vring.num)) {
>           qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is used",
>                         svq->vdev->name, used_elem.id);
> -        return NULL;
> +        return svq_elem;
>       }
>   
> -    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> +    svq_elem = svq->ring_id_maps[used_elem.id];
> +    svq->ring_id_maps[used_elem.id] = vhost_svq_empty_elem();
> +    if (unlikely(vhost_svq_is_empty_elem(svq_elem))) {


Any reason we can't simply assign NULL to ring_id_maps[used_elem.id]?

Thanks


>           qemu_log_mask(LOG_GUEST_ERROR,
>               "Device %s says index %u is used, but it was not available",
>               svq->vdev->name, used_elem.id);
> -        return NULL;
> +        return svq_elem;
>       }
>   
> -    num = svq->ring_id_maps[used_elem.id]->in_num +
> -          svq->ring_id_maps[used_elem.id]->out_num;
> +    num = svq_elem.elem->in_num + svq_elem.elem->out_num;
>       last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
>       svq->desc_next[last_used_chain] = svq->free_head;
>       svq->free_head = used_elem.id;
>   
>       *len = used_elem.len;
> -    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> +    return svq_elem;
>   }
>   
>   /**
> @@ -454,6 +465,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>           vhost_svq_disable_notification(svq);
>           while (true) {
>               uint32_t len;
> +            SVQElement svq_elem;
>               g_autofree VirtQueueElement *elem = NULL;
>   
>               if (unlikely(i >= svq->vring.num)) {
> @@ -464,11 +476,12 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                   return;
>               }
>   
> -            elem = vhost_svq_get_buf(svq, &len);
> -            if (!elem) {
> +            svq_elem = vhost_svq_get_buf(svq, &len);
> +            if (vhost_svq_is_empty_elem(svq_elem)) {
>                   break;
>               }
>   
> +            elem = g_steal_pointer(&svq_elem.elem);
>               virtqueue_fill(vq, elem, len, i++);
>           }
>   
> @@ -611,7 +624,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>       memset(svq->vring.desc, 0, driver_size);
>       svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
>       memset(svq->vring.used, 0, device_size);
> -    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
> +    svq->ring_id_maps = g_new0(SVQElement, svq->vring.num);
>       svq->desc_next = g_new0(uint16_t, svq->vring.num);
>       for (unsigned i = 0; i < svq->vring.num - 1; i++) {
>           svq->desc_next[i] = cpu_to_le16(i + 1);
> @@ -636,7 +649,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   
>       for (unsigned i = 0; i < svq->vring.num; ++i) {
>           g_autofree VirtQueueElement *elem = NULL;
> -        elem = g_steal_pointer(&svq->ring_id_maps[i]);
> +        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
>           if (elem) {
>               virtqueue_detach_element(svq->vq, elem, 0);
>           }


