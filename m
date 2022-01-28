Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98849F3B9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:36:12 +0100 (CET)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDKrj-0003qI-7r
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKm3-0002A1-MS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKlO-0007Fw-NQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643351378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzASgu/9tVvpAjpB/sAVevHkStxn/AU6SXOCX+rhuXs=;
 b=iMohL/1FJYYnDVwpit2M1KmddEBNwgw3Dc7X4R1rJNoiUaE6NZWi9cE37GlMvlB623Qh23
 QDsMnkf++lL2lP1sSnvDOZ0wGHBg91FgMbdkRZoZqsF24nSGWSIlvksVE1lYqim6Goivw1
 NmDnq9XjiE3dFQuEjneVhYBWEyUHFBA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-f_PBb1GEOfuNVhUoQhSSQQ-1; Fri, 28 Jan 2022 01:29:36 -0500
X-MC-Unique: f_PBb1GEOfuNVhUoQhSSQQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 c2-20020a056a000ac200b004cc359dbb4eso2681251pfl.10
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 22:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QzASgu/9tVvpAjpB/sAVevHkStxn/AU6SXOCX+rhuXs=;
 b=LqxtmjYyenhuU/OSYcODELrgZZ20bJfzYTHyvFQ2lACNFf5m2K/KUWstqBiG2ewt8D
 tZ+PVx9k8pxSJsOUIt/K3fiid7zS8IB8rfVEJP6GNzbocV2tX3qcrRTZH/j3mehAaVVX
 M4WoT+bF3E7tL9WlXyHiaSCuWM3fhf45+18S1ZIocShenUJl4O/nnyuLQnZETttvPT5H
 t57XD1EE+kWozc+r4w+xaJH7+FDWEKVcrKt0vWzrdmwC50pQvG4UaWvlRw9oB0SPGfqD
 WVAsZSAhr+Xt/VOdwlNgCLnKe8AjCY4TJMy7cXrNeXuvQXmfskSYE+ORuaOO/OqvBc+6
 4jmQ==
X-Gm-Message-State: AOAM532f8w3Fos0YOQmGqZSx+zC+ybZCEXYjz3odIwCpQG8Rt33675kG
 Nl3s/yaVLbcLcKB5HRs1Um37b2U0w7E7P1wvoCA6l9A3ucY0fCXCp+T78gLLleCIbKUc3AhD6IN
 C8YDRViS1LvGoKSU=
X-Received: by 2002:a63:5157:: with SMTP id r23mr5544402pgl.196.1643351375530; 
 Thu, 27 Jan 2022 22:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg8cMNPN1yIay8L94kdky5sBwl7+uDaHIfgrajAejrf6mAoVPm6yiDA4LOajE4NRCrF3SWmQ==
X-Received: by 2002:a63:5157:: with SMTP id r23mr5544369pgl.196.1643351375233; 
 Thu, 27 Jan 2022 22:29:35 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j18sm8153040pfj.13.2022.01.27.22.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:29:34 -0800 (PST)
Message-ID: <e10a7631-f1f9-5597-dd74-0f5301a68e27@redhat.com>
Date: Fri, 28 Jan 2022 14:29:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 04/31] vdpa: Add vhost_svq_set_svq_kick_fd
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-5-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> This function allows the vhost-vdpa backend to override kick_fd.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  1 +
>   hw/virtio/vhost-shadow-virtqueue.c | 45 ++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 400effd9f2..a56ecfc09d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -15,6 +15,7 @@
>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   const EventNotifier *vhost_svq_get_dev_kick_notifier(
>                                                 const VhostShadowVirtqueue *svq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index bd87110073..21534bc94d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -11,6 +11,7 @@
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   
>   #include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
>   
>   /* Shadow virtqueue to relay notifications */
>   typedef struct VhostShadowVirtqueue {
> @@ -18,8 +19,20 @@ typedef struct VhostShadowVirtqueue {
>       EventNotifier hdev_kick;
>       /* Shadow call notifier, sent to vhost */
>       EventNotifier hdev_call;
> +
> +    /*
> +     * Borrowed virtqueue's guest to host notifier.
> +     * To borrow it in this event notifier allows to register on the event
> +     * loop and access the associated shadow virtqueue easily. If we use the
> +     * VirtQueue, we don't have an easy way to retrieve it.
> +     *
> +     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
> +     */
> +    EventNotifier svq_kick;
>   } VhostShadowVirtqueue;
>   
> +#define INVALID_SVQ_KICK_FD -1
> +
>   /**
>    * The notifier that SVQ will use to notify the device.
>    */
> @@ -29,6 +42,35 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>       return &svq->hdev_kick;
>   }
>   
> +/**
> + * Set a new file descriptor for the guest to kick SVQ and notify for avail
> + *
> + * @svq          The svq
> + * @svq_kick_fd  The new svq kick fd
> + */
> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
> +{
> +    EventNotifier tmp;
> +    bool check_old = INVALID_SVQ_KICK_FD !=
> +                     event_notifier_get_fd(&svq->svq_kick);
> +
> +    if (check_old) {
> +        event_notifier_set_handler(&svq->svq_kick, NULL);
> +        event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
> +    }


It looks to me we don't do similar things in vhost-net. Any reason for 
caring about the old svq_kick?


> +
> +    /*
> +     * event_notifier_set_handler already checks for guest's notifications if
> +     * they arrive to the new file descriptor in the switch, so there is no
> +     * need to explicitely check for them.
> +     */
> +    event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> +
> +    if (!check_old || event_notifier_test_and_clear(&tmp)) {
> +        event_notifier_set(&svq->hdev_kick);


Any reason we need to kick the device directly here?

Thanks


> +    }
> +}
> +
>   /**
>    * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>    * methods and file descriptors.
> @@ -52,6 +94,9 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>           goto err_init_hdev_call;
>       }
>   
> +    /* Placeholder descriptor, it should be deleted at set_kick_fd */
> +    event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
> +
>       return g_steal_pointer(&svq);
>   
>   err_init_hdev_call:


