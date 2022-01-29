Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6B4A2D08
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 09:21:01 +0100 (CET)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDiyh-0006oO-BD
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 03:20:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDit3-0004Sn-1I
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDisz-0005Tg-Qc
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643444104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AmWnbDa3ZHDENpvKpm30KocL/1g4LiipQ8O0X+mswk=;
 b=LU1wdSgPXUxCJpO2GctWTKImNUiJxK0fOuanOyXPyzxHr10HNJHe7Pds1odhCqzvkWoRuv
 DgmTxGXwtj6NHolZNxUrzXBkJg30i1p/AOqcJTFevcvFq1tC0UdDHiWoGoynahbmn9PSG8
 35Y0tHbqgBk8FDUOBLfP3id+pdN7n0U=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-vSqxX48uNsWtbFoZHlpSDw-1; Sat, 29 Jan 2022 03:15:02 -0500
X-MC-Unique: vSqxX48uNsWtbFoZHlpSDw-1
Received: by mail-pj1-f69.google.com with SMTP id
 y14-20020a17090ad70e00b001b4fc2943b3so7601125pju.8
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 00:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/AmWnbDa3ZHDENpvKpm30KocL/1g4LiipQ8O0X+mswk=;
 b=HSZRwB6ATXSBGZbStptgsEZCJB6EHrOX461h54Mu5ixUuKcXuwewEDH+gIYMxlcnP8
 ur3zBxcE4SQy5N9fQnYBURvhjp9nLO9Y1zCh1rk4bCNLXmGQBjSmvpwDixXqKMdgsAtj
 Gg2KN3MQloRr+6C+nHzQTtIDp3i2GCgOlHhnZPV1ctqWl7KOJiuW8RDeGHmUNNvZApUc
 SescXJQ2LsdctdMxgWdxso3CH9tZKd2iGhUsGy0+31HVHsV9Q6m5O7KBOsq68tDeJiRn
 pAUAb+DKCXihtMqhLX3qbMyqrRa4iNWUTSZbcbY/zx/5wLxrEBxMZEU0XH2qe1gbj+wQ
 zLMQ==
X-Gm-Message-State: AOAM533PLABF8x/dWAvv9e1p/hEARhXqSaTVYQQ4WHZIH6nEW0S8ZEuN
 //FKpbodtHnHYZOKkjD20NBBSER1mtMGiWgORdKAhAJ2k86uPIel7NqH+HK6WDR5nKVju2xp6iY
 KMcnec9fLlVWZCXQ=
X-Received: by 2002:a17:902:d4ca:: with SMTP id
 o10mr11954571plg.29.1643444101680; 
 Sat, 29 Jan 2022 00:15:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6ES+YqoIkoHiAEL1QcXo8Ga7bsBHgrlf+9UmNR1khbkLHGyZMAdZoUw3GeYJWT4U3EpW78g==
X-Received: by 2002:a17:902:d4ca:: with SMTP id
 o10mr11954539plg.29.1643444101414; 
 Sat, 29 Jan 2022 00:15:01 -0800 (PST)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c17sm12617308pfv.68.2022.01.29.00.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:15:00 -0800 (PST)
Message-ID: <04720687-f6b9-1ed9-c4da-30a965743065@redhat.com>
Date: Sat, 29 Jan 2022 16:14:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 15/31] vdpa: Add vhost_svq_get_num
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-16-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-16-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> This reports the guest's visible SVQ effective length, not the device's
> one.


I think we need to explain if there could be a case that the SVQ size is 
not equal to the device queue size.

Thanks


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h | 1 +
>   hw/virtio/vhost-shadow-virtqueue.c | 5 +++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 3521e8094d..035207a469 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -29,6 +29,7 @@ const EventNotifier *vhost_svq_get_svq_call_notifier(
>                                                 const VhostShadowVirtqueue *svq);
>   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
>                                 struct vhost_vring_addr *addr);
> +uint16_t vhost_svq_get_num(const VhostShadowVirtqueue *svq);
>   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
>   size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 0f2c2403ff..f129ec8395 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -212,6 +212,11 @@ void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
>       addr->used_user_addr = (uint64_t)svq->vring.used;
>   }
>   
> +uint16_t vhost_svq_get_num(const VhostShadowVirtqueue *svq)
> +{
> +    return svq->vring.num;
> +}
> +
>   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
>   {
>       size_t desc_size = sizeof(vring_desc_t) * svq->vring.num;


