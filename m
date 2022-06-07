Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A353F5FF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:20:19 +0200 (CEST)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nySZd-00034p-Jp
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySSU-0000tv-85
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nySSN-0006Wl-R9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654582366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugtiasjCbhru0oJvuXCs265qNOcupVP0FTA/M6hxAr4=;
 b=hzSlk2/mHvQh0UKGyW+kCnVWbKHRxbRjPwVc6Vi1nHa5mzCllLW3dkbTRAkiCesWrxVKm8
 btKIfgSc2pFU6L9DGjC8SXhIe3nUxnzuRW2KfU6faap9CPL8J2fOg5dleChsxzQinG8P4R
 yXFStG7+Kb70lr2NKzLwS+pTGFgM9Ig=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-MRq4r50uPUi7mnnBE3ZrvQ-1; Tue, 07 Jun 2022 02:12:43 -0400
X-MC-Unique: MRq4r50uPUi7mnnBE3ZrvQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 t14-20020a65608e000000b003fa321e8ea3so8097641pgu.18
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 23:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ugtiasjCbhru0oJvuXCs265qNOcupVP0FTA/M6hxAr4=;
 b=AgpNGIGdqSXUM3o3vZhqjxb3R44dwmKhceqjXXQVXjjhn4jr0JuLNcCDw1/oflSC9s
 stQ3hxEMRQHoMc1H/eNY9PWwv3yTNS5WZ0XCYa+kP19KoKTtJ2IB7G1FKjSpiCnNWQBm
 lLHWScWRL/0g48qTciXgIpo5pVeqp4HuqLlzBpOjPZEUmV9psEG4dL5N+8o+PXxW27Z4
 HKCClS2aVnr3mLrRz6OBkAa0hBgPCAvjgoYtwG0+0hR3tx2BQxmKG2Q+Ef+/JcAh9wAU
 O6erC0ZUaQkyspqtyj+p7MdjbGJ1jgGgaC95OGjIFNLzgl/Eg8EuTia/du69Pg+MIB5R
 0aGw==
X-Gm-Message-State: AOAM533S0T2uFT0ah/FcI707c6XpQpguLnrHMAUW35MUqgwLVGPzQH28
 ZHYxKPQyz7eUDTWaBHdO19l3zZ+9vnSY+V5Tb04206Y5hUHSsENkVZkNFYOWe+1plF7M7kNRsiz
 AQ4B/LBXP0cs31ow=
X-Received: by 2002:a05:6a00:4504:b0:51b:f04e:a130 with SMTP id
 cw4-20020a056a00450400b0051bf04ea130mr17533318pfb.52.1654582361935; 
 Mon, 06 Jun 2022 23:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTNyisy+qS4A2Tcf8pfeDHmgBJbIR0Z1zzBcnezlCiUIiIyp3bMfVhIQTgEu96JTubO8jjIA==
X-Received: by 2002:a05:6a00:4504:b0:51b:f04e:a130 with SMTP id
 cw4-20020a056a00450400b0051bf04ea130mr17533286pfb.52.1654582361628; 
 Mon, 06 Jun 2022 23:12:41 -0700 (PDT)
Received: from [10.72.13.149] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a170903011100b00163ef7be14csm11395414plc.89.2022.06.06.23.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 23:12:40 -0700 (PDT)
Message-ID: <73865506-4df0-f9ed-d30c-718d352f700c@redhat.com>
Date: Tue, 7 Jun 2022 14:12:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 02/21] vhost: Add custom used buffer callback
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-3-eperezma@redhat.com>
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> The callback allows SVQ users to know the VirtQueue requests and
> responses. QEMU can use this to synchronize virtio device model state,
> allowing to migrate it with minimum changes to the migration code.
>
> In the case of networking, this will be used to inspect control
> virtqueue messages.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h | 16 +++++++++++++++-
>   include/hw/virtio/vhost-vdpa.h     |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c |  9 ++++++++-
>   hw/virtio/vhost-vdpa.c             |  3 ++-
>   4 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index c132c994e9..6593f07db3 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -15,6 +15,13 @@
>   #include "standard-headers/linux/vhost_types.h"
>   #include "hw/virtio/vhost-iova-tree.h"
>   
> +typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> +                                         const VirtQueueElement *elem);


Nit: I wonder if something like "VirtQueueCallback" is sufficient (e.g 
kernel use "callback" directly)


> +
> +typedef struct VhostShadowVirtqueueOps {
> +    VirtQueueElementCallback used_elem_handler;
> +} VhostShadowVirtqueueOps;
> +
>   /* Shadow virtqueue to relay notifications */
>   typedef struct VhostShadowVirtqueue {
>       /* Shadow vring */
> @@ -59,6 +66,12 @@ typedef struct VhostShadowVirtqueue {
>        */
>       uint16_t *desc_next;
>   
> +    /* Optional callbacks */
> +    const VhostShadowVirtqueueOps *ops;


Can we merge map_ops to ops?


> +
> +    /* Optional custom used virtqueue element handler */
> +    VirtQueueElementCallback used_elem_cb;


This seems not used in this series.

Thanks


> +
>       /* Next head to expose to the device */
>       uint16_t shadow_avail_idx;
>   
> @@ -85,7 +98,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>                        VirtQueue *vq);
>   void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
> -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> +                                    const VhostShadowVirtqueueOps *ops);
>   
>   void vhost_svq_free(gpointer vq);
>   G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index a29dbb3f53..f1ba46a860 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -17,6 +17,7 @@
>   #include "hw/virtio/vhost-iova-tree.h"
>   #include "hw/virtio/virtio.h"
>   #include "standard-headers/linux/vhost_types.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>   
>   typedef struct VhostVDPAHostNotifier {
>       MemoryRegion mr;
> @@ -35,6 +36,7 @@ typedef struct vhost_vdpa {
>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
>       GPtrArray *shadow_vqs;
> +    const VhostShadowVirtqueueOps *shadow_vq_ops;
>       struct vhost_dev *dev;
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 56c96ebd13..167db8be45 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -410,6 +410,10 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                   break;
>               }
>   
> +            if (svq->ops && svq->ops->used_elem_handler) {
> +                svq->ops->used_elem_handler(svq->vdev, elem);
> +            }
> +
>               if (unlikely(i >= svq->vring.num)) {
>                   qemu_log_mask(LOG_GUEST_ERROR,
>                            "More than %u used buffers obtained in a %u size SVQ",
> @@ -607,12 +611,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>    * shadow methods and file descriptors.
>    *
>    * @iova_tree: Tree to perform descriptors translations
> + * @ops: SVQ operations hooks
>    *
>    * Returns the new virtqueue or NULL.
>    *
>    * In case of error, reason is reported through error_report.
>    */
> -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> +                                    const VhostShadowVirtqueueOps *ops)
>   {
>       g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>       int r;
> @@ -634,6 +640,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
>       event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
>       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>       svq->iova_tree = iova_tree;
> +    svq->ops = ops;
>       return g_steal_pointer(&svq);
>   
>   err_init_hdev_call:
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 66f054a12c..7677b337e6 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -418,7 +418,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>   
>       shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
> -        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree);
> +        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree,
> +                                                            v->shadow_vq_ops);
>   
>           if (unlikely(!svq)) {
>               error_setg(errp, "Cannot create svq %u", n);


