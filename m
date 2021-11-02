Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C384428F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:55:56 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoeB-0002ZV-3I
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhodO-0001sg-Hc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhodK-00069Y-Gg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635839700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dlWu44/wY/7R1GeV/yrdXYNnB699JZ1xCGL0sCgZIY=;
 b=SJE1tjrIS2X9KO1p0J7pWTKWpzfQHKA2PGakdJPdfxGR03C1XCcgqmgusuI7dOs7UEqmcz
 YbXteVP7n6hpx4bROc/o0FOmXmN0iQsS10v5PROcG32a88r20PVGKUK40WO1saISkIcnNy
 kdTFB1uu3PbGrI9fAS5XltNJyjdnFgM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-VY_UCEzMOkC58FN_4qY7ag-1; Tue, 02 Nov 2021 03:54:59 -0400
X-MC-Unique: VY_UCEzMOkC58FN_4qY7ag-1
Received: by mail-pf1-f197.google.com with SMTP id
 j3-20020a628003000000b004811bc66186so2162139pfd.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5dlWu44/wY/7R1GeV/yrdXYNnB699JZ1xCGL0sCgZIY=;
 b=aTIQLWmgWl5wsT5+S6IO6rA/qRDLcYVpiQgAa0abIoQRvnvQbbu9laMWCWG6zJ+3Yl
 gZ+s9ZIfvkaMgGODKAPd4OccG57k+kq7eI0AxzqyelWTF33NJiSu2MyV+CRQGeo9cIKE
 nhcM2QvNtdBwuFcHj03LXDvmBIMKUO76V+NxGqSgi7CEz30qCmbix2iobw5H/oNsfI1C
 SD1xg23UwDAJyr1Tf7XXI3hqL4ldSt6JIQ67TN5+vwRWWhStxJp8Qhu5cg7sVl6Nd1Ti
 bqdBDd3q3/mpVuUert1NSojABc/N8y0ycYb2lDpTHwlXAWrwSLdkPcG+JuqxdKwyPA5s
 bg9g==
X-Gm-Message-State: AOAM531cuBBpHLiRh+/oz1ljkjT/bN1dZ8Cc+TQMFhztKROp5VxMkeZL
 93wSAB4gGe95EidYrPJHTsQjewX9NhSE/fGuclpiGOTFxXdfWDwufnusBZfJ/zCr54UAMeGDfrB
 yHY8o084naA3NST0=
X-Received: by 2002:a17:903:11cc:b0:13f:ecf7:22c7 with SMTP id
 q12-20020a17090311cc00b0013fecf722c7mr29823485plh.5.1635839698807; 
 Tue, 02 Nov 2021 00:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjHFb0sYWJHLAh7vaXNdPQn3vAoW8ioepjvOCX7WyMnSqbu8OV+ZwDymvzWRt6CoM8wdWJLw==
X-Received: by 2002:a17:903:11cc:b0:13f:ecf7:22c7 with SMTP id
 q12-20020a17090311cc00b0013fecf722c7mr29823445plh.5.1635839698454; 
 Tue, 02 Nov 2021 00:54:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o22sm19355137pfu.50.2021.11.02.00.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 00:54:58 -0700 (PDT)
Subject: Re: [RFC PATCH v5 11/26] vhost: Handle host notifiers in SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <74dbf70f-96a7-6fe3-dbc5-28a7b7989109@redhat.com>
Date: Tue, 2 Nov 2021 15:54:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-12-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/30 上午2:35, Eugenio Pérez 写道:
> If device supports host notifiers, this makes one jump less (kernel) to
> deliver SVQ notifications to it.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 23 ++++++++++++++++++++++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 30ab9643b9..eb0a54f954 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   const EventNotifier *vhost_svq_get_dev_kick_notifier(
>                                                 const VhostShadowVirtqueue *svq);
> +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr);
> +
>   void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
>                        VhostShadowVirtqueue *svq, int svq_kick_fd);
>   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index fda60d11db..e3dcc039b6 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -29,6 +29,12 @@ typedef struct VhostShadowVirtqueue {
>        * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
>        */
>       EventNotifier svq_kick;
> +
> +    /* Device's host notifier memory region. NULL means no region */
> +    void *host_notifier_mr;
> +
> +    /* Virtio queue shadowing */
> +    VirtQueue *vq;
>   } VhostShadowVirtqueue;
>   
>   /**
> @@ -50,7 +56,20 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>           return;
>       }
>   
> -    event_notifier_set(&svq->hdev_kick);
> +    if (svq->host_notifier_mr) {
> +        uint16_t *mr = svq->host_notifier_mr;
> +        *mr = virtio_get_queue_index(svq->vq);


Do we need barriers around the possible MMIO here?

To avoid those complicated stuff, I'd rather simply go with eventfd path.

Note mmio and eventfd are not mutually exclusive.

Thanks


> +    } else {
> +        event_notifier_set(&svq->hdev_kick);
> +    }
> +}
> +
> +/*
> + * Set the device's memory region notifier. addr = NULL clear it.
> + */
> +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *addr)
> +{
> +    svq->host_notifier_mr = addr;
>   }
>   
>   /**
> @@ -134,6 +153,7 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
>    */
>   VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>   {
> +    int vq_idx = dev->vq_index + idx;
>       g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>       int r;
>   
> @@ -151,6 +171,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>           goto err_init_hdev_call;
>       }
>   
> +    svq->vq = virtio_get_queue(dev->vdev, vq_idx);
>       return g_steal_pointer(&svq);
>   
>   err_init_hdev_call:


