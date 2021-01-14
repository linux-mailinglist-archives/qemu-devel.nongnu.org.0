Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869192F59FB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:44:24 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzuUh-0000i6-K5
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuTs-0000Gq-VB
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:43:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuTq-0002RA-IO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610599409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gilZPhklOzIYT/4LKJohsGa6wV+1AIJ+amhNfHmuIZ0=;
 b=coDPUuvYMRlpaB8ZNcs902u7CPUOXYo+Dc4b171SHJ5hOn+g5GJD9xaJ9eTCAJG7pZgbkV
 +oyl0+NfF507nqjsajoznrX+dBEtG4PSg9KmDD6sQ9nRiIzeLlefD4iWyEQhhTwaYnPAd8
 j66MdN2Q5dy14NctKJHtHCS3GedfO9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-oz5uPQYFMByMEnrgxCNipg-1; Wed, 13 Jan 2021 23:43:27 -0500
X-MC-Unique: oz5uPQYFMByMEnrgxCNipg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A7C180DE08
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:43:26 +0000 (UTC)
Received: from [10.72.12.100] (ovpn-12-100.pek2.redhat.com [10.72.12.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 899375D9C0;
 Thu, 14 Jan 2021 04:43:19 +0000 (UTC)
Subject: Re: [PATCH v1 2/4] virtio-pci:add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210113154540.24981-1-lulu@redhat.com>
 <20210113154540.24981-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <592aa41f-120f-9bb4-0226-2fc0799b244a@redhat.com>
Date: Thu, 14 Jan 2021 12:43:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113154540.24981-3-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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


On 2021/1/13 下午11:45, Cindy Lu wrote:
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c         | 93 ++++++++++++++++++++++++++++++++++
>   include/hw/virtio/virtio-bus.h |  2 +
>   2 files changed, 95 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 36524a5728..f8053e1fab 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -762,6 +762,98 @@ undo:
>       return ret;
>   }
>   
> + static int kvm_virtio_pci_config_irqfd_use(VirtIOPCIProxy *proxy,
> +                                 unsigned int vector)
> +{
> +    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *n = virtio_queue_get_config_notifier(vdev);
> +    assert(irqfd);
> +    return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
> +}
> +
> +static void kvm_virtio_pci_config_irqfd_release(VirtIOPCIProxy *proxy,
> +                                      unsigned int vector)
> +{
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *n = virtio_queue_get_config_notifier(vdev);
> +    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> +    assert(irqfd);
> +    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
> +    return;
> +}
> +static int kvm_virtio_pci_config_vector_use(VirtIOPCIProxy *proxy,
> +                                        unsigned int vector)
> +{
> +    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> +    int ret;
> +
> +    if (irqfd->users == 0) {
> +        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        irqfd->virq = ret;
> +    }
> +    irqfd->users++;
> +
> +    return 0;
> +}


Any reason that we can't resue kvm_virtio_pci_vq_vector_use()? Note that 
at MSIX level there's no difference if it belongs to vq or config.


> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    unsigned int vector;
> +    int ret;
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    vector = vdev->config_vector ;
> +    ret = kvm_virtio_pci_config_vector_use(proxy, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    ret = kvm_virtio_pci_config_irqfd_use(proxy,  vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    return 0;
> +undo:
> +    kvm_virtio_pci_config_irqfd_release(proxy, vector);
> +    return ret;
> +}
> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> +{
> +    PCIDevice *dev = &proxy->pci_dev;
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    unsigned int vector;
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +    vector = vdev->config_vector ;
> +    if (vector >= msix_nr_vectors_allocated(dev)) {
> +        return;
> +    }
> +    kvm_virtio_pci_config_irqfd_release(proxy, vector);
> +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> +}
> +
> +static int virtio_pci_set_guest_config_notifier(DeviceState *d,  bool assign,
> +                                         bool with_irqfd)
> +{
> +    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *notifier = virtio_queue_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 1);
> +        virtio_set_config_notifier_fd_handler(vdev, true, with_irqfd);
> +        kvm_virtio_pci_vector_config_use(proxy);
> +    } else {
> +        virtio_set_config_notifier_fd_handler(vdev, false, with_irqfd);
> +        kvm_virtio_pci_vector_config_release(proxy);
> +        event_notifier_cleanup(notifier);
> +    }
> +    return r;
> +}


Any way to re-use virtio_pci_set_guest_notifier() here?

Thanks


> +
>   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>   {
>       PCIDevice *dev = &proxy->pci_dev;
> @@ -2137,6 +2229,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
>       k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
>       k->get_dma_as = virtio_pci_get_dma_as;
>       k->queue_enabled = virtio_pci_queue_enabled;
> +    k->set_config_notifiers = virtio_pci_set_guest_config_notifier;
>   }
>   
>   static const TypeInfo virtio_pci_bus_info = {
> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> index ef8abe49c5..dae81ee414 100644
> --- a/include/hw/virtio/virtio-bus.h
> +++ b/include/hw/virtio/virtio-bus.h
> @@ -93,6 +93,8 @@ struct VirtioBusClass {
>        */
>       bool has_variable_vring_alignment;
>       AddressSpace *(*get_dma_as)(DeviceState *d);
> +    int (*set_config_notifiers)(DeviceState *d, bool assign, bool with_irqfd);
> +
>   };
>   
>   struct VirtioBusState {


