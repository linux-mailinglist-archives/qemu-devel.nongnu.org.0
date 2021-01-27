Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63B305228
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 06:36:52 +0100 (CET)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4dVb-0001FX-NI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 00:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dUW-0000G5-3V
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dUS-0005r0-Fk
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611725738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agMNkeVkswJef2P1fevzie+v0f285j99AOw1uvhpYmk=;
 b=XRuLGQ/yCG9NvsIg0iYLCxfC4PAWE+fjT8uLpcCaUzGumYNs5HLcbPvZNNFaMh9DOg25pp
 HlQk1SvLY+kQ2Hc4YwrCYoGkysUS6hy+rXB3x3RNllvYmUq/nWc2N+E4GcM65vMTluPJCd
 ifxcdWqkVOxiEFRW5QVRKUH3w5r+Hbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-U4goUC_JMmSqhvUfG4be7Q-1; Wed, 27 Jan 2021 00:35:35 -0500
X-MC-Unique: U4goUC_JMmSqhvUfG4be7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBB21802B40
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 05:35:34 +0000 (UTC)
Received: from [10.72.13.33] (ovpn-13-33.pek2.redhat.com [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5D55D746;
 Wed, 27 Jan 2021 05:35:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] virtio: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b5daf4b8-1c06-e8b5-420a-6c75fdcd38da@redhat.com>
Date: Wed, 27 Jan 2021 13:35:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126074254.3225-2-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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


On 2021/1/26 下午3:42, Cindy Lu wrote:
> Add configure notifier and virtio_set_config_notifier_fd_handler
> in virtio


The title and commit log is kind of misleading.

I think we should use "virtio: add guest notifier for config interrupt"


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio.c             | 26 ++++++++++++++++++++++++++
>   include/hw/virtio/virtio-bus.h |  2 ++
>   include/hw/virtio/virtio.h     |  6 ++++++
>   3 files changed, 34 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ceb58fda6c..25e164cf8a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3502,6 +3502,16 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>       }
>   }
>   
> +static void virtio_config_read(EventNotifier *n)
> +{
> +    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
> +    if (!vdev->use_config_notifier) {
> +        return;
> +    }
> +    if (event_notifier_test_and_clear(n)) {
> +        virtio_notify_config(vdev);
> +    }
> +}
>   void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>                                                   bool with_irqfd)
>   {
> @@ -3518,6 +3528,17 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
>       }
>   }
>   
> +void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +                                                bool with_irqfd)
> +{
> +    if (assign && !with_irqfd) {
> +        event_notifier_set_handler(&vdev->config_notifier,
> +                                   virtio_config_read);
> +    } else {
> +       event_notifier_set_handler(&vdev->config_notifier, NULL);
> +    }
> +}
> +
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
>   {
>       return &vq->guest_notifier;
> @@ -3591,6 +3612,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
>       return &vq->host_notifier;
>   }
>   
> +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
> +{
> +    return &vdev->config_notifier;
> +
> +}
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
>   {
>       vq->host_notifier_enabled = enabled;
> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> index ef8abe49c5..97e13ec484 100644
> --- a/include/hw/virtio/virtio-bus.h
> +++ b/include/hw/virtio/virtio-bus.h
> @@ -93,6 +93,8 @@ struct VirtioBusClass {
>        */
>       bool has_variable_vring_alignment;
>       AddressSpace *(*get_dma_as)(DeviceState *d);
> +    int (*set_config_notifiers)(DeviceState *d, bool assign);
> +
>   };
>   
>   struct VirtioBusState {
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b7ece7a6a8..79f2f78625 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -108,6 +108,8 @@ struct VirtIODevice
>       bool use_guest_notifier_mask;
>       AddressSpace *dma_as;
>       QLIST_HEAD(, VirtQueue) *vector_queues;
> +    EventNotifier config_notifier;
> +    bool use_config_notifier;


Let's document those two fields.

Thanks


>   };
>   
>   struct VirtioDeviceClass {
> @@ -310,11 +312,15 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
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
> +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
>   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
>   void virtio_queue_host_notifier_read(EventNotifier *n);
>   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,


