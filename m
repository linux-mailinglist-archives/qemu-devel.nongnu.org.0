Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E963836BFE8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:13:52 +0200 (CEST)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHup-0003Jq-RY
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHtv-0002sG-1I
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHts-0005Tm-9g
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uNNpws8qNcRNxdVDSLd9r5g9Cb6eCQ4TfL2a5C6NEU=;
 b=BgVq2KIRQB9VyN/ctH7Y1bzyfi1HPt2h8gEBviRbX7p/7hXpnH2iuOSJV8fNh/JrEFUeE3
 SsszelJ1HWx9RZCN0Xr+gCYfbqWif3t1Z0OPZUIl2cDBmRGDiREURbKOKV4wG3KF+FM9sY
 Q7WaUXVsraGsHm2cibYbwAhvesEJVqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-Cx2ddhDdPZu64RvQoym1Ug-1; Tue, 27 Apr 2021 03:12:48 -0400
X-MC-Unique: Cx2ddhDdPZu64RvQoym1Ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08981898296
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:12:47 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-153.pek2.redhat.com
 [10.72.13.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E67687FF;
 Tue, 27 Apr 2021 07:12:42 +0000 (UTC)
Subject: Re: [PATCH v6 7/9] virtio-pci: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-8-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <35563de7-7cc2-2972-d08c-0a58473dbb27@redhat.com>
Date: Tue, 27 Apr 2021 15:12:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427033951.29805-8-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
> ---
>   hw/virtio/virtio-pci.c | 186 ++++++++++++++++++++++++++---------------
>   1 file changed, 120 insertions(+), 66 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 2b7e6cc0d9..07d28dd367 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -664,12 +664,10 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
>   }
>   
>   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> -                                        unsigned int queue_no,
>                                           unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
>       int ret;
> -


Unnecessary changes.


>       if (irqfd->users == 0) {
>           ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
>           if (ret < 0) {
> @@ -708,93 +706,120 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
>       ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
>       assert(ret == 0);
>   }
> -


So did here.


> -static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> + static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
> +                                      EventNotifier **n, unsigned int *vector)


The indentation looks not correct.


>   {
>       PCIDevice *dev = &proxy->pci_dev;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    unsigned int vector;
> -    int ret, queue_no;
>       VirtQueue *vq;
> -    EventNotifier *n;
> -    for (queue_no = 0; queue_no < nvqs; queue_no++) {
> +
> +    if (queue_no == -1) {
> +        *n = virtio_get_config_notifier(vdev);
> +        *vector = vdev->config_vector;
> +    } else {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
> -            break;
> -        }
> -        vector = virtio_queue_vector(vdev, queue_no);
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }
> -        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> -        if (ret < 0) {
> -            goto undo;
> -        }
> -        /* If guest supports masking, set up irqfd now.
> -         * Otherwise, delay until unmasked in the frontend.
> -         */
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
> -            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> -            if (ret < 0) {
> -                kvm_virtio_pci_vq_vector_release(proxy, vector);
> -                goto undo;
> -            }
> +            return -1;
>           }
> +        *vector = virtio_queue_vector(vdev, queue_no);
> +        vq = virtio_get_queue(vdev, queue_no);
> +        *n = virtio_queue_get_guest_notifier(vq);
> +    }
> +    if (*vector >= msix_nr_vectors_allocated(dev)) {
> +        return -1;
>       }
>       return 0;
> +}
>   
> +static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
> +{


Let's use separate patch for the introducing of 
kvm_virtio_pci_vector_user/release_one().

And then do the config interrupt support on top.

Thanks


