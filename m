Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F82F59F0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:35:28 +0100 (CET)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzuM3-0005LU-Uz
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuKm-0004us-PQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuKk-0006Q3-Gq
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610598844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAYznQtuBb4/3v6AqJ22AtZprreCL8u4OcHblRONt5A=;
 b=WahhOcm79nIJlGprQ52jb48qGT/MoLkE3nclteUrO9hrNBGLmoN8OFW6cmx/BdAS1DiS8b
 WeJP032LlY0OCpFXMCCq7ihWdjW1SYtj09LtlARZ0z+nqx4MMafvM4A0Y+MxG1eNl7bf8a
 osyipMo6klG17ZBbNJo6Hl5vQexMaPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-I7M37dv9NfCLUZ6rubFGng-1; Wed, 13 Jan 2021 23:34:02 -0500
X-MC-Unique: I7M37dv9NfCLUZ6rubFGng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C893210051A7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:34:01 +0000 (UTC)
Received: from [10.72.12.100] (ovpn-12-100.pek2.redhat.com [10.72.12.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADD226F447;
 Thu, 14 Jan 2021 04:33:57 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] virtio:add support in configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210113154540.24981-1-lulu@redhat.com>
 <20210113154540.24981-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f139945e-e81c-3c6d-9f18-8f6f88e16094@redhat.com>
Date: Thu, 14 Jan 2021 12:33:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113154540.24981-2-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/13 下午11:45, Cindy Lu wrote:
> Add configure notifier and virtio_set_config_notifier_fd_handler
> in virtio
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio.c         | 25 +++++++++++++++++++++++++
>   include/hw/virtio/virtio.h |  5 +++++
>   2 files changed, 30 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ceb58fda6c..66ed1daf95 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3502,6 +3502,15 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>       }
>   }
>   
> +static void virtio_queue_config_read(EventNotifier *n)
> +{


Note that the config interrupt belongs to the device. So it's better not 
name it as "queue" here.


> +    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
> +
> +    if (event_notifier_test_and_clear(n)) {
> +
> +        virtio_notify_config(vdev);
> +    }
> +}
>   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>                                                   bool with_irqfd)
>   {
> @@ -3518,6 +3527,17 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>       }
>   }
>   
> +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +                                                bool with_irqfd)
> +{
> +    if (assign && !with_irqfd) {
> +        event_notifier_set_handler(&vdev->config_notifier,
> +                                   virtio_queue_config_read);
> +    } else {
> +       event_notifier_set_handler(&vdev->config_notifier, NULL);
> +    }
> +}


I wonder whether we can simply generalize 
virtio_queue_set_guest_notifier_fd_handler from

void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)

to

void virtio_set_guest_notifier_fd_handler(EventNotifier *e, bool assign,
                                                 bool with_irqfd)


Since there's actually no virtqueue specific setup in this function, 
what its callee really want is a simple EventNotifier.

Thanks


> +
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
>   {
>       return &vq->guest_notifier;
> @@ -3591,6 +3611,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
>       return &vq->host_notifier;
>   }
>   
> +EventNotifier *virtio_queue_get_config_notifier(VirtIODevice *vdev)
> +{
> +    return &vdev->config_notifier;
> +
> +}
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
>   {
>       vq->host_notifier_enabled = enabled;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b7ece7a6a8..38bd28242e 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -108,6 +108,7 @@ struct VirtIODevice
>       bool use_guest_notifier_mask;
>       AddressSpace *dma_as;
>       QLIST_HEAD(, VirtQueue) *vector_queues;
> +    EventNotifier config_notifier;
>   };
>   
>   struct VirtioDeviceClass {
> @@ -310,11 +311,15 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
>   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>                                                   bool with_irqfd);
> +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +                                                bool with_irqfd);
> +
>   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
>   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
>   void virtio_device_release_ioeventfd(VirtIODevice *vdev);
>   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
>   EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> +EventNotifier *virtio_queue_get_config_notifier(VirtIODevice *vdev);
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
>   void virtio_queue_host_notifier_read(EventNotifier *n);
>   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,


