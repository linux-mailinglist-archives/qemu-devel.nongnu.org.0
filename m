Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73701359693
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:41:26 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlld-0000Qi-IM
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUljt-0008R2-9s
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUljq-0005aU-35
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617953972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8J5e2vxKpzHTDIycCvnczErFOZxD7WArMMkIMTppVXQ=;
 b=hyJ1BxUCnJtKuDiBiOO7rII52J+UPBOzhhRe53IieMle50OWLdEGXNry+M9rKaZnYwWrlW
 wLodMPocObmCEgERwdt1zQ8bP6a2aGa/OHQ6U/jcU1Wf3Fj7fk36M40VgMLJMG1z5tD0oO
 S08OqE9mJcTD1kUaL4HEGkbqYU5H2K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-WkmT8vgvPMiSqiloX_UBbg-1; Fri, 09 Apr 2021 03:39:30 -0400
X-MC-Unique: WkmT8vgvPMiSqiloX_UBbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6662E99C2
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 07:39:29 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED754100238C;
 Fri,  9 Apr 2021 07:39:24 +0000 (UTC)
Subject: Re: [PATCH v5 6/6] virtio-pci: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-7-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <24719d4b-824b-3f0c-2322-71b53a6e8c3d@redhat.com>
Date: Fri, 9 Apr 2021 15:39:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408093824.14985-7-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2021/4/8 下午5:38, Cindy Lu 写道:
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 91 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 88 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 481f6e7505..7b02f42c06 100644
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
> @@ -726,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>           if (vector >= msix_nr_vectors_allocated(dev)) {
>               continue;
>           }
> -        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_vq_vector_use(proxy,  vector);
>           if (ret < 0) {
>               goto undo;
>           }
> @@ -760,6 +759,56 @@ undo:
>       }
>       return ret;
>   }
> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    unsigned int vector;
> +    int ret;
> +    EventNotifier *n = virtio_get_config_notifier(vdev);
> +    vector = vdev->config_vector ;
> +    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    ret = kvm_virtio_pci_irqfd_use(proxy,  n, vector);


So the kvm_virtio_pci_vector_use() has the following codes:

         /* If guest supports masking, set up irqfd now.
          * Otherwise, delay until unmasked in the frontend.
          */
         if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
             vq = virtio_get_queue(vdev, queue_no);
             n = virtio_queue_get_guest_notifier(vq);
             ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
             if (ret < 0) {
                 kvm_virtio_pci_vq_vector_release(proxy, vector);
                 goto undo;
             }
         }

Do we need to check the masking support here as well?

Btw, I think we can factor out the core logic (decouple the queue_no) of 
kvm_virtio_pci_vector_user() and let it be reused by config interrupt.


> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    return 0;
> +undo:
> +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    return ret;
> +}
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


So let's try to unify the codes between this and 
virtio_queue_set_guest_notifier_fd_handler(). Bascailly it's just 
decouple virtqueue *.


> +        kvm_virtio_pci_vector_config_release(proxy);
> +        event_notifier_cleanup(notifier);
> +    }
> +    return r;
> +}
>   
>   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>   {
> @@ -858,6 +907,14 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>       EventNotifier *n;
>       int ret, index, unmasked = 0;
>   
> +   if (vdev->use_config_notifier == true) {
> +        n = virtio_get_config_notifier(vdev);
> +        ret = virtio_pci_vq_vector_unmask(proxy, 0, vector, msg,
> +                    VIRTIO_CONFIG_VECTOR, n);
> +        if (ret < 0) {
> +            goto config_undo;
> +       }
> +    }
>       while (vq) {
>           index = virtio_get_queue_index(vq);
>           if (!virtio_queue_get_num(vdev, index)) {
> @@ -889,6 +946,10 @@ undo:
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> + config_undo:
> +            n = virtio_get_config_notifier(vdev);
> +            virtio_pci_vq_vector_mask(proxy, 0, vector,
> +                VIRTIO_CONFIG_VECTOR, n);
>       return ret;
>   }
>   
> @@ -900,6 +961,10 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>       EventNotifier *n;
>       int index;
>   
> +   if (vdev->use_config_notifier == true) {


Is this sufficient to know the vector is used by config interrupt?


> +        n = virtio_get_config_notifier(vdev);
> +        virtio_pci_vq_vector_mask(proxy, 0, vector, VIRTIO_CONFIG_VECTOR, n);
> +   }
>       while (vq) {
>           index = virtio_get_queue_index(vq);
>            n = virtio_queue_get_guest_notifier(vq);
> @@ -945,6 +1010,21 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>               msix_set_pending(dev, vector);
>           }
>       }
> +   if (vdev->use_config_notifier == true) {
> +        vector = vdev->config_vector;
> +        notifier = virtio_get_config_notifier(vdev);
> +        if (vector < vector_start || vector >= vector_end ||
> +            !msix_is_masked(dev, vector)) {
> +            return;
> +        }
> +        if (k->guest_notifier_pending) {
> +            if (k->guest_notifier_pending(vdev, 0,  VIRTIO_CONFIG_VECTOR)) {
> +                msix_set_pending(dev, vector);
> +            }
> +        } else if (event_notifier_test_and_clear(notifier)) {
> +            msix_set_pending(dev, vector);
> +        }
> +    }


Let's unify the code here with the code that deal with vq vectors in the 
loop above.

Thanks


>   }
>   
>   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
> @@ -1032,6 +1112,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>                   goto assign_error;
>               }
>           }
> +            r = virtio_pci_set_config_notifier(d, assign);
> +            if (r < 0) {
> +                goto config_error;
> +         }
>           r = msix_set_vector_notifiers(&proxy->pci_dev,
>                                         virtio_pci_vector_unmask,
>                                         virtio_pci_vector_mask,
> @@ -1048,7 +1132,8 @@ notifiers_error:
>           assert(assign);
>           kvm_virtio_pci_vector_release(proxy, nvqs);
>       }
> -
> + config_error:
> +        kvm_virtio_pci_vector_config_release(proxy);
>   assign_error:
>       /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
>       assert(assign);


