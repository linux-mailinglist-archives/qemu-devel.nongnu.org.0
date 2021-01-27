Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5230524E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 06:46:12 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ded-0004Oh-6B
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 00:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4ddI-0003t1-Kj
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4ddG-00024R-Pf
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611726286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZIROi+RzC62kLEHCujKpaPrbBX2MJvOF9+2OTBwMzc=;
 b=VM3fc9BTvDMEX046AuhtKjycatpS/OoUTTfzA1jdxTdphiV1JkJQpZmcs9j+YKn45B4P80
 q/NDwCNgJXWyNLlV4T7AE9jfk3i2tfYRd4/byEH4Pxu5eyxcAR9HxhiBlVxkV/R8eWfQ50
 UT4D56D1cb6Cbcf2Cy3OvZNDj9XXFUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-HgkMoP2BMdCN4CNPP_efig-1; Wed, 27 Jan 2021 00:44:44 -0500
X-MC-Unique: HgkMoP2BMdCN4CNPP_efig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 145E5107ACE3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 05:44:43 +0000 (UTC)
Received: from [10.72.13.33] (ovpn-13-33.pek2.redhat.com [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2DF8708E0;
 Wed, 27 Jan 2021 05:44:37 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] virtio-pci: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <26f38bc0-6461-b268-6dca-1cfd9bfa58f6@redhat.com>
Date: Wed, 27 Jan 2021 13:44:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126074254.3225-4-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++--------
>   1 file changed, 75 insertions(+), 17 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 36524a5728..8e192600b8 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -664,7 +664,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
>   }
>   
>   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> -                                        unsigned int queue_no,
>                                           unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> @@ -691,23 +690,17 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
>   }
>   
>   static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
> -                                 unsigned int queue_no,
> +                                 EventNotifier *n,
>                                    unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> -    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
>   }
>   
>   static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
> -                                      unsigned int queue_no,
> +                                      EventNotifier *n ,
>                                         unsigned int vector)
>   {
> -    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
>       int ret;
>   
> @@ -722,7 +715,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
>       int ret, queue_no;
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;


new line is needed.


>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -731,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>           if (vector >= msix_nr_vectors_allocated(dev)) {
>               continue;
>           }
> -        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_vq_vector_use(proxy,  vector);
>           if (ret < 0) {
>               goto undo;
>           }
> @@ -739,7 +733,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, delay until unmasked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>               if (ret < 0) {
>                   kvm_virtio_pci_vq_vector_release(proxy, vector);
>                   goto undo;
> @@ -755,13 +751,69 @@ undo:
>               continue;
>           }
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);
>       }
>       return ret;
>   }
>   
> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    unsigned int vector;
> +    int ret;
> +    EventNotifier *n = virtio_get_config_notifier(vdev);
> +
> +    vector = vdev->config_vector ;
> +    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    ret = kvm_virtio_pci_irqfd_use(proxy,  n, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    return 0;
> +undo:
> +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    return ret;
> +}


newline is needed.


> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> +{
> +    PCIDevice *dev = &proxy->pci_dev;
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    unsigned int vector;
> +    EventNotifier *n = virtio_get_config_notifier(vdev);
> +    vector = vdev->config_vector ;
> +    if (vector >= msix_nr_vectors_allocated(dev)) {
> +        return;
> +    }
> +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> +}
> +
> +static int virtio_pci_set_config_notifier(DeviceState *d,  bool assign)
> +{
> +    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);
> +        virtio_set_config_notifier_fd_handler(vdev, true, true);
> +        kvm_virtio_pci_vector_config_use(proxy);
> +    } else {
> +        virtio_set_config_notifier_fd_handler(vdev, false, true);
> +        kvm_virtio_pci_vector_config_release(proxy);
> +        event_notifier_cleanup(notifier);
> +    }
> +    return r;
> +}


Two questions, don't we need to check whether or not MSIX is enalbed in 
this case? Instead of introducing new helpers that is easy to be buggy I 
still prefer to re-use virtio_pci_set_guest_notifier:

We can switch to use accepts EventNotifier instead of virtqueue index. 
And we need also convert virtqueue_set_guest_notifier_fd_handler() to 
accept EventNotifier.


> +
>   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>   {
>       PCIDevice *dev = &proxy->pci_dev;
> @@ -769,7 +821,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       unsigned int vector;
>       int queue_no;
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;


newline is needed.

Thanks


>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -782,7 +835,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, it was cleaned when masked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);
>       }
> @@ -823,7 +878,7 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>               event_notifier_set(n);
>           }
>       } else {
> -        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>       }
>       return ret;
>   }
> @@ -835,13 +890,15 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>   
> +    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> +    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       /* If guest supports masking, keep irqfd but mask it.
>        * Otherwise, clean it up now.
>        */
>       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>           k->guest_notifier_mask(vdev, queue_no, true);
>       } else {
> -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
>       }
>   }
>   
> @@ -2137,6 +2194,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
>       k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
>       k->get_dma_as = virtio_pci_get_dma_as;
>       k->queue_enabled = virtio_pci_queue_enabled;
> +    k->set_config_notifiers = virtio_pci_set_config_notifier;
>   }
>   
>   static const TypeInfo virtio_pci_bus_info = {


