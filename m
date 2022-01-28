Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33A49F35D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:14:32 +0100 (CET)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDKWl-0005BW-S6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKME-00012g-IE
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKMC-0003au-UD
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 01:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643349816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soSLJWO6vndlkhR0jm5HSAwOMNmL3Y01pSFdyGEqqPw=;
 b=We3z5e+jU/nuVA1WYAwjQAO1FbLshv9EkQYRlpluMFfQpThvVwS7ttgUEeYO8eLzjNUOlc
 bPaExpTbGgJuuCE+kvdBCo/t3JY4NJT9SMlRzj10JeIDSA/UOibdkhkXiPjEvxdE3qdRk5
 kdLH+8h2e1UxStpsRLzMwmpsER3j3cc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-CbCDsy19OpOEVAgLxyPBQA-1; Fri, 28 Jan 2022 01:03:34 -0500
X-MC-Unique: CbCDsy19OpOEVAgLxyPBQA-1
Received: by mail-pg1-f197.google.com with SMTP id
 p29-20020a634f5d000000b003624b087f05so2817068pgl.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 22:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=soSLJWO6vndlkhR0jm5HSAwOMNmL3Y01pSFdyGEqqPw=;
 b=QYaqBydMV9bpu16/5EGxSl4JsmzLOnoVIS4/368IM+u+O87wMQKjYZkNMn0ZPDn0v/
 /2zp3lUHkXz9GqfNnsqvVtHabYLfBS5h7MbL1dXzAlkEEpJ+RJppDD0jitRMc+ok1Knq
 6+IxcYlIbMqi6NP4SAKMK2wisTDiDms++GZAsHszREyVBUUT/8v7o3HYMMfvFlQ8UURJ
 XrxzErKQxriI57yHYM2slE16U9abUZNuoAXs3ng2qiTDyJ2EGv2309fGAPxASusLlq4U
 dexJ+SLQiFbBkk1iaR5BiUYXQYr1p6WTTLL29xA4BXc8/Z5NqUbyp9o7lHx4Hx2y7c04
 88YA==
X-Gm-Message-State: AOAM531V47YVfcTBbpWmWeEfVSgKDP4rSWCG91FKcKfWMuGbMZkwUAB7
 SdTf+fcwFcFPoniCxZjv205O1hSERDqB8oVodE4tuqYeJHMcYSgUKdv5bWULCnkoNg7MW++jU2P
 eYliEE2BC9J70sxA=
X-Received: by 2002:a17:902:db01:: with SMTP id
 m1mr7300101plx.126.1643349813643; 
 Thu, 27 Jan 2022 22:03:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA1dUSImHs3lAOPGZJjDkRKagDs4evWu1ON5ahDUAOzITQVNjeNMcxn5loZjwB6gfNiFOJKQ==
X-Received: by 2002:a17:902:db01:: with SMTP id
 m1mr7300083plx.126.1643349813416; 
 Thu, 27 Jan 2022 22:03:33 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t14sm1131657pjd.6.2022.01.27.22.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:03:32 -0800 (PST)
Message-ID: <d97a4fce-b94b-9503-e1bb-1599b73475dd@redhat.com>
Date: Fri, 28 Jan 2022 14:03:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 03/31] vdpa: Add vhost_svq_get_dev_kick_notifier
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-4-eperezma@redhat.com>
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
> Is needed so vhost-vdpa knows the device's kick event fd.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  4 ++++
>   hw/virtio/vhost-shadow-virtqueue.c | 10 +++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 61ea112002..400effd9f2 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -11,9 +11,13 @@
>   #define VHOST_SHADOW_VIRTQUEUE_H
>   
>   #include "hw/virtio/vhost.h"
> +#include "qemu/event_notifier.h"


Let's move this part to patch 2.

Thanks


>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
> +const EventNotifier *vhost_svq_get_dev_kick_notifier(
> +                                              const VhostShadowVirtqueue *svq);
> +
>   VhostShadowVirtqueue *vhost_svq_new(void);
>   
>   void vhost_svq_free(VhostShadowVirtqueue *vq);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 5ee7b401cb..bd87110073 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -11,7 +11,6 @@
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   
>   #include "qemu/error-report.h"
> -#include "qemu/event_notifier.h"
>   
>   /* Shadow virtqueue to relay notifications */
>   typedef struct VhostShadowVirtqueue {
> @@ -21,6 +20,15 @@ typedef struct VhostShadowVirtqueue {
>       EventNotifier hdev_call;
>   } VhostShadowVirtqueue;
>   
> +/**
> + * The notifier that SVQ will use to notify the device.
> + */
> +const EventNotifier *vhost_svq_get_dev_kick_notifier(
> +                                               const VhostShadowVirtqueue *svq)
> +{
> +    return &svq->hdev_kick;
> +}
> +
>   /**
>    * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>    * methods and file descriptors.


