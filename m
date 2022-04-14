Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38195004F4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 06:13:46 +0200 (CEST)
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqrZ-0006VI-Gt
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 00:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqpx-0005nz-4N
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqpu-0000Kn-OQ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649909521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6knSeqg6pDZB2pLpGnMIt7qScHVGUmCUY0xXYNvPI7c=;
 b=K8DYE0QFMbNALes6YBSRVzVJ/vCi88OQnLws0r6PY714PJHod13xYy5BKDV+xu5RC0Bc0Q
 lBs+GEYu7Hd7AAfzreOXoP+IBgnGEBbSYynLV3mnbU7UOu43Tu4xfsbnJiaUQsVN6CGh68
 NhtgiGY5kRv3jtvftIlQGbPmKExpBYA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-CSio66wPOEmMqckGhq9owA-1; Thu, 14 Apr 2022 00:12:00 -0400
X-MC-Unique: CSio66wPOEmMqckGhq9owA-1
Received: by mail-pf1-f197.google.com with SMTP id
 m8-20020a62a208000000b0050593296139so2466174pff.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 21:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6knSeqg6pDZB2pLpGnMIt7qScHVGUmCUY0xXYNvPI7c=;
 b=oLA8S+PnY7nVlsDSudnjWX98Nqo9LM2TGTRaaXJhTu61VlQFtCn4d662gL1eKJlF+w
 jbEQXCamkYdh+ieosunopBcC8LYSPio+Qy4sUuQTN2f7v5mrHjviIaNECSaH2iwIO45i
 +rq0u/zOqVHRxltsrnYhrZDPobcfWQXypKHKcZTEYJBfFdfbhUJprnjKHSonhdpZxLBU
 TOE5CrLZFkFs8SN93T6t7VcMgyGeDGnKYcWC3uDzsdj4pNz0fD+3MFyj6oRPrNX2KfQk
 elVXeiAw0vmzybahVAZ8nWlpJcV2vBETzFCF2Yug3NMRH22cbrOjvfRBp3u/RG5xqfM7
 XfCQ==
X-Gm-Message-State: AOAM530c0UZlXaYDL5j7YfKjXVyqYIEGRWU/2sPn7LoZgDJ8MXWK7IM+
 l2x5/TmxSTcyCQs5aKCa3KZhM1GidejSKvHbHcN1TyKh2mYAVGkpPSOG6q1OtgBaCNjO8z8excG
 vLWqP6Fnk+sXyVqs=
X-Received: by 2002:a17:90b:3805:b0:1c7:6e7a:3e01 with SMTP id
 mq5-20020a17090b380500b001c76e7a3e01mr1576918pjb.213.1649909519495; 
 Wed, 13 Apr 2022 21:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+7NK+eSXHZZ0TuEOXBSLDtrz51jvb4cJRNj6/+jVT7iX3X43aMq5eQJICXKDj7Qnyy74J4w==
X-Received: by 2002:a17:90b:3805:b0:1c7:6e7a:3e01 with SMTP id
 mq5-20020a17090b380500b001c76e7a3e01mr1576885pjb.213.1649909519100; 
 Wed, 13 Apr 2022 21:11:59 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a17090a441800b001ca9b5724a6sm533430pjg.36.2022.04.13.21.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 21:11:58 -0700 (PDT)
Message-ID: <c615a02d-ea43-77f2-8a2a-b306e2f6a450@redhat.com>
Date: Thu, 14 Apr 2022 12:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 06/25] vdpa: Send all updates in memory listener
 commit
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-7-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> With the introduction of many ASID it can happen that many changes on
> different listeners come before the commit call.


I think we have at most one listener even for the case of MQ/CVQ?


>   Since kernel vhost-vdpa
> still does not support it, send it all in one shot.
>
> This also have one extra advantage: If there is no update to notify, we
> save the iotlb_{begin,end} calls.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h |  2 +-
>   hw/virtio/vhost-vdpa.c         | 69 +++++++++++++++++-----------------
>   2 files changed, 36 insertions(+), 35 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index a29dbb3f53..4961acea8b 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -27,7 +27,7 @@ typedef struct vhost_vdpa {
>       int device_fd;
>       int index;
>       uint32_t msg_type;
> -    bool iotlb_batch_begin_sent;
> +    GArray *iotlb_updates;
>       MemoryListener listener;
>       struct vhost_vdpa_iova_range iova_range;
>       uint64_t acked_features;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 1f229ff4cb..27ee678dc9 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -85,6 +85,11 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>       msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
>       msg.iotlb.type = VHOST_IOTLB_UPDATE;
>   
> +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_BATCH)) {
> +        g_array_append_val(v->iotlb_updates, msg);
> +        return 0;
> +    }


I think it's better to use a consistent way for !batch and batch (E.g we 
can do this even for the backend that doesn't support batching?)

Otherwise the codes are hard to be maintained.


> +
>      trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
>                               msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
>   
> @@ -109,6 +114,11 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
>       msg.iotlb.size = size;
>       msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
>   
> +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_BATCH)) {
> +        g_array_append_val(v->iotlb_updates, msg);
> +        return 0;
> +    }
> +
>       trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
>                                  msg.iotlb.size, msg.iotlb.type);
>   
> @@ -121,56 +131,47 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
>       return ret;
>   }
>   
> -static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> -{
> -    int fd = v->device_fd;
> -    struct vhost_msg_v2 msg = {
> -        .type = v->msg_type,
> -        .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
> -    };
> -
> -    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
> -    if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
> -        error_report("failed to write, fd=%d, errno=%d (%s)",
> -                     fd, errno, strerror(errno));
> -    }
> -}
> -
> -static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> -{
> -    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) &&
> -        !v->iotlb_batch_begin_sent) {
> -        vhost_vdpa_listener_begin_batch(v);
> -    }
> -
> -    v->iotlb_batch_begin_sent = true;
> -}
> -
>   static void vhost_vdpa_listener_commit(MemoryListener *listener)
>   {
>       struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> -    struct vhost_dev *dev = v->dev;
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
> +    size_t num = v->iotlb_updates->len;
>   
> -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
> +    if (!num) {
>           return;
>       }
>   
> -    if (!v->iotlb_batch_begin_sent) {
> -        return;
> +    msg.type = v->msg_type;
> +    msg.iotlb.type = VHOST_IOTLB_BATCH_BEGIN;
> +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
> +    if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {


We need check whehter the vhost-vDPA support batching first?


> +        error_report("failed to write BEGIN_BATCH, fd=%d, errno=%d (%s)",
> +                     fd, errno, strerror(errno));
> +        goto done;
>       }
>   
> -    msg.type = v->msg_type;
> -    msg.iotlb.type = VHOST_IOTLB_BATCH_END;
> +    for (size_t i = 0; i < num; ++i) {
> +        struct vhost_msg_v2 *update = &g_array_index(v->iotlb_updates,
> +                                                     struct vhost_msg_v2, i);
> +        if (write(fd, update, sizeof(*update)) != sizeof(*update)) {
> +            error_report("failed to write dma update, fd=%d, errno=%d (%s)",
> +                         fd, errno, strerror(errno));
> +            goto done;


Maybe it's time to introduce v3 to allow a batch of messaged to be 
passed to vhost-vDPA in a single system call.

Thanks


> +        }
> +    }
>   
> +    msg.iotlb.type = VHOST_IOTLB_BATCH_END;
>       trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
>       }
>   
> -    v->iotlb_batch_begin_sent = false;
> +done:
> +    g_array_set_size(v->iotlb_updates, 0);
> +    return;
> +
>   }
>   
>   static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> @@ -227,7 +228,6 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>           iova = mem_region.iova;
>       }
>   
> -    vhost_vdpa_iotlb_batch_begin_once(v);
>       ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>                                vaddr, section->readonly);
>       if (ret) {
> @@ -292,7 +292,6 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>           iova = result->iova;
>           vhost_iova_tree_remove(v->iova_tree, &mem_region);
>       }
> -    vhost_vdpa_iotlb_batch_begin_once(v);
>       ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>       if (ret) {
>           error_report("vhost_vdpa dma unmap error!");
> @@ -446,6 +445,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>       dev->opaque =  opaque ;
>       v->listener = vhost_vdpa_memory_listener;
>       v->msg_type = VHOST_IOTLB_MSG_V2;
> +    v->iotlb_updates = g_array_new(false, false, sizeof(struct vhost_msg_v2));
>       ret = vhost_vdpa_init_svq(dev, v, errp);
>       if (ret) {
>           goto err;
> @@ -579,6 +579,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       trace_vhost_vdpa_cleanup(dev, v);
>       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       memory_listener_unregister(&v->listener);
> +    g_array_free(v->iotlb_updates, true);
>       vhost_vdpa_svq_cleanup(dev);
>   
>       dev->opaque = NULL;


