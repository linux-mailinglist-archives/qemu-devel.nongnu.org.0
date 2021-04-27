Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A309536BFFB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:18:05 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHyu-0005yG-Ml
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHw5-0004hU-6f
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHw1-0006of-S5
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3HZR0IWvCOw4nNSF4ZTIoIqvSh8ccf2H12/prrf918=;
 b=Oj4Y0D5ungQk3nLZ3xfz6c3qaUXBFQgPoU06sknfLB9KHX9X5xOXVQ8vofy6tMocdJCZUy
 ONhcoBaC0sKMehlw0q5nT5Y8sdNwqM8WG06WQQGLAK1ZP1x0nVInPkl4CHcCpmJ7uY7yXP
 pGR/fiJ/d1fJv+V55a2771BwDkRl+5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-VcU2c9hHMzSZ_gdXWEKtBA-1; Tue, 27 Apr 2021 03:15:03 -0400
X-MC-Unique: VcU2c9hHMzSZ_gdXWEKtBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2E98C39D3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:15:02 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-153.pek2.redhat.com
 [10.72.13.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0A960CC6;
 Tue, 27 Apr 2021 07:15:00 +0000 (UTC)
Subject: Re: [PATCH v6 8/9] virtio: decouple virtqueue from set notifier fd
 handler
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-9-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <819b96b3-6934-3b18-a5dc-ca7092aadb51@redhat.com>
Date: Tue, 27 Apr 2021 15:14:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427033951.29805-9-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


ÔÚ 2021/4/27 ÉÏÎç11:39, Cindy Lu Ð´µÀ:
> This patch will decouple virtqueue from
> virtio_queue_set_guest_notifier_fd_handler,
> here queue number -1 mean the configure interrupt. The funtion
> will set the config_notify_read as fd handler


Any reason that this is not done before patch 3?

Thanks


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/s390x/virtio-ccw.c      |  6 +++---
>   hw/virtio/virtio-mmio.c    |  8 ++++----
>   hw/virtio/virtio-pci.c     |  9 +++++----
>   hw/virtio/virtio.c         | 35 +++++++++++++++++------------------
>   include/hw/virtio/virtio.h |  4 +---
>   5 files changed, 30 insertions(+), 32 deletions(-)
>
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 4582e94ae7..5d73c99d30 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -989,11 +989,11 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>           if (with_irqfd) {
>               r = virtio_ccw_add_irqfd(dev, n);
>               if (r) {
> -                virtio_queue_set_guest_notifier_fd_handler(vq, false,
> +                virtio_set_notifier_fd_handler(vdev, n, false,
>                                                              with_irqfd);
>                   return r;
>               }
> @@ -1017,7 +1017,7 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
>           if (with_irqfd) {
>               virtio_ccw_remove_irqfd(dev, n);
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>       return 0;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index d8cb368728..4ea55001be 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -620,9 +620,9 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>       } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>   
> @@ -642,9 +642,9 @@ static int virtio_mmio_set_config_notifier(DeviceState *d,  bool assign)
>       int r = 0;
>       if (assign) {
>           r = event_notifier_init(notifier, 0);
> -        virtio_set_config_notifier_fd_handler(vdev, true, false);
> +        virtio_set_notifier_fd_handler(vdev, -1, true, false);
>       } else {
> -        virtio_set_config_notifier_fd_handler(vdev, false, false);
> +        virtio_set_notifier_fd_handler(vdev, -1, false, false);
>           event_notifier_cleanup(notifier);
>       }
>           if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 07d28dd367..5033b3db4f 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -806,10 +806,10 @@ static int virtio_pci_set_config_notifier(DeviceState *d,  bool assign)
>       int r = 0;
>       if (assign) {
>           r = event_notifier_init(notifier, 0);
> -        virtio_set_config_notifier_fd_handler(vdev, true, true);
> +        virtio_set_notifier_fd_handler(vdev, -1, true, true);
>           kvm_virtio_pci_vector_config_use(proxy);
>       } else {
> -        virtio_set_config_notifier_fd_handler(vdev, false, true);
> +        virtio_set_notifier_fd_handler(vdev, -1, false, true);
>           kvm_virtio_pci_vector_config_release(proxy);
>           event_notifier_cleanup(notifier);
>       }
> @@ -1005,9 +1005,9 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>       } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>   
> @@ -1049,6 +1049,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>           msix_unset_vector_notifiers(&proxy->pci_dev);
>           if (proxy->vector_irqfd) {
>               kvm_virtio_pci_vector_release(proxy, nvqs);
> +            kvm_virtio_pci_vector_config_release(proxy);
>               g_free(proxy->vector_irqfd);
>               proxy->vector_irqfd = NULL;
>           }
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5dff29c981..8f0087deac 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3510,32 +3510,31 @@ static void virtio_config_read(EventNotifier *n)
>           virtio_notify_config(vdev);
>       }
>   }
> -void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
> -                                                bool with_irqfd)
> +
> +void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int queue_no,
> +                               bool assign, bool with_irqfd)
>   {
> -    if (assign && !with_irqfd) {
> -        event_notifier_set_handler(&vq->guest_notifier,
> -                                   virtio_queue_guest_notifier_read);
> +    EventNotifier *e ;
> +    EventNotifierHandler *handler;
> +    if (queue_no != -1) {
> +        VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> +        e = &vq->guest_notifier;
> +        handler = virtio_queue_guest_notifier_read;
> +    } else {
> +        e = &vdev->config_notifier;
> +        handler = virtio_config_read;
> +   }
> +   if (assign && !with_irqfd) {
> +        event_notifier_set_handler(e, handler);
>       } else {
> -        event_notifier_set_handler(&vq->guest_notifier, NULL);
> +        event_notifier_set_handler(e, NULL);
>       }
>       if (!assign) {
>           /* Test and clear notifier before closing it,
>            * in case poll callback didn't have time to run. */
> -        virtio_queue_guest_notifier_read(&vq->guest_notifier);
> +        handler(e);
>       }
>   }
> -void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> -                                                bool with_irqfd)
> -{
> -    if (assign && !with_irqfd) {
> -        event_notifier_set_handler(&vdev->config_notifier,
> -                                   virtio_config_read);
> -    } else {
> -       event_notifier_set_handler(&vdev->config_notifier, NULL);
> -    }
> -}
> -
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
>   {
>       return &vq->guest_notifier;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b0b714f6d4..d22f5a3e7e 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -309,9 +309,7 @@ void virtio_queue_update_used_idx(VirtIODevice *vdev, int n);
>   VirtQueue *virtio_get_queue(VirtIODevice *vdev, int n);
>   uint16_t virtio_get_queue_index(VirtQueue *vq);
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
> -void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
> -                                                bool with_irqfd);
> -void virtio_set_config_notifier_fd_handler(VirtIODevice *vdev, bool assign,
> +void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int n, bool assign,
>                                                   bool with_irqfd);
>   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
>   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);


