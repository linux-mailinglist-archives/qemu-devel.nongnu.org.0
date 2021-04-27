Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E136BF64
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 08:42:41 +0200 (CEST)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHQe-00088d-Ip
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 02:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHP1-0007ee-MQ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHOy-0003O5-3N
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619505654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUzXVkOwMrVTbM1o7/K4W/oypU9K4I/fEOeh6DCyyfo=;
 b=Fos8gNRwRPVGmhH0Ki+qXhPEPgAmEyqvMWeRElokMxzWsBLfo8h1LL0t2xbyxT9avyrNBs
 JrZbeHXWSkYRgMjexPs7D40Sl8oFRY5pByms0asxsmV4BLaOMdoM1X+xuUBZrPagnupEMO
 zkAhhrAYaTGNT1MoNQ+pymI585DmIqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-5ShvQ6UFO2GruDnvJ2TvAw-1; Tue, 27 Apr 2021 02:40:52 -0400
X-MC-Unique: 5ShvQ6UFO2GruDnvJ2TvAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B281718B6142
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:40:51 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-153.pek2.redhat.com
 [10.72.13.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEFA853CC6;
 Tue, 27 Apr 2021 06:40:46 +0000 (UTC)
Subject: Re: [PATCH v6 2/9] virtio-pci:decouple virtqueue from interrupt
 setting process
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78e0debd-a63f-cffc-b252-b138fef4c12d@redhat.com>
Date: Tue, 27 Apr 2021 14:40:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427033951.29805-3-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> Now the code for interrupt/vector are coupling
> with the vq number, this patch will decouple the vritqueue
> numbers from these functions.


So you need to describe why such kind of decoupling is needed,


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 51 ++++++++++++++++++++++++------------------
>   1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 36524a5728..2b7e6cc0d9 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -691,23 +691,17 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
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
> @@ -722,7 +716,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
>       int ret, queue_no;
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -739,7 +734,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
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
> @@ -755,7 +752,9 @@ undo:
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
> @@ -769,7 +768,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       unsigned int vector;
>       int queue_no;
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -782,7 +782,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
> @@ -791,12 +793,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> -                                       MSIMessage msg)
> +                                       MSIMessage msg,
> +                                        EventNotifier *n)


So you switch to use EventNotifier but keep using queue_no/vector, this 
looks kind of duplication.

If we can keep queue_no or virtio_queue_get_guest_notifier working as in 
the past, I don't see any reason for this effort.

Thanks


>   {
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       VirtIOIRQFD *irqfd;
>       int ret = 0;
>   
> @@ -823,14 +824,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>               event_notifier_set(n);
>           }
>       } else {
> -        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>       }
>       return ret;
>   }
>   
>   static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>                                                unsigned int queue_no,
> -                                             unsigned int vector)
> +                                             unsigned int vector,
> +                                             EventNotifier *n)
>   {
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> @@ -841,7 +843,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>           k->guest_notifier_mask(vdev, queue_no, true);
>       } else {
> -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
>       }
>   }
>   
> @@ -851,6 +853,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int ret, index, unmasked = 0;
>   
>       while (vq) {
> @@ -859,7 +862,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg, n);
>               if (ret < 0) {
>                   goto undo;
>               }
> @@ -875,7 +879,8 @@ undo:
>       while (vq && unmasked >= 0) {
>           index = virtio_get_queue_index(vq);
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            virtio_pci_vq_vector_mask(proxy, index, vector, n);
>               --unmasked;
>           }
>           vq = virtio_vector_next_queue(vq);
> @@ -888,15 +893,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int index;
>   
>       while (vq) {
>           index = virtio_get_queue_index(vq);
> +         n = virtio_queue_get_guest_notifier(vq);
>           if (!virtio_queue_get_num(vdev, index)) {
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            virtio_pci_vq_vector_mask(proxy, index, vector, n);
>           }
>           vq = virtio_vector_next_queue(vq);
>       }


