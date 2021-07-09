Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326303C1F23
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:55:53 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jUN-0005NE-7K
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jSP-0002RC-Ua
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jSN-0001bZ-VU
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625810027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGdWZ2EzcuzLWptRShP/YP77Bz9sckmmZ7rD7XzE/YE=;
 b=XyrxILj4/nnFRXQ1uhW9syXZGiGIGmqd8URd00m/B4uV3l4NqGxzVDXJPb3kU/2wOPcNaH
 a0eOaQgwY4fnCFSB0irNMyYTohFsGPjfLYS3ak2BWSWj96SFi5NbtE3+0leq528IvOZJDj
 UCnh4tCsj4hC7i/NBKUR5j3Kp0FGhRE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-XEZKnHmvPISNI15CndQP-Q-1; Fri, 09 Jul 2021 01:53:46 -0400
X-MC-Unique: XEZKnHmvPISNI15CndQP-Q-1
Received: by mail-pj1-f70.google.com with SMTP id
 n34-20020a17090a5aa5b029017068421287so5026424pji.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wGdWZ2EzcuzLWptRShP/YP77Bz9sckmmZ7rD7XzE/YE=;
 b=aG/KZCvFS8ki7HVgeT3Z9Y8L6JbI1hWYNqdkJRXSOx3UcoVVx7HqP8s/wlqbcADXhM
 z1Q22GKSehr/5SjHrXt6px9mSALUCfja4iyGo3FrxviPXiboqdm0/hm4x8o8MYMfsHgP
 miRgy2Q2sKWgQ38IMxc88W9kNSea2EsTq1rE019SlN8viOOKwfs7ZqD5ZEjuaix4gATE
 Wydu+zVung7t2Q589l2FflByrzoiCVEQOFha8bs9E0cfkt3+r7offCxcJiKqN86DqWnJ
 S+MvAc10PiQnLhli+7AuetOfqGoprPPm+hCeiTBsgG6pvUu5h4XBtD8aNEiskQ5KoQfT
 Y73w==
X-Gm-Message-State: AOAM530ll1fA/BAOeGrAfxtAfwMmNgiQL8p5KXdi4UV5XxtGszOLj/jv
 NIfKcHq5lHdazgBhosXOm6RsPnZYihuR0XkY+dWVUm9d3rdgItPrYHdLJpZXGQ4mDxRynpG9SwU
 5KEIkNVD6wMzp3PaYs9wWMhPsL1N10nprWxBv/o8ia4WqX267defTC5D51yf7SuM+Bns=
X-Received: by 2002:a17:90b:3617:: with SMTP id
 ml23mr14149613pjb.236.1625810024927; 
 Thu, 08 Jul 2021 22:53:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKqITU63G7VmMb8zTiL22AgVIjH/DplZcHYNmQOdPZoMpNmqtsAAM25U9Hv3GIYcRBYc0TDQ==
X-Received: by 2002:a17:90b:3617:: with SMTP id
 ml23mr14149589pjb.236.1625810024539; 
 Thu, 08 Jul 2021 22:53:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y187sm898868pfb.185.2021.07.08.22.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:53:44 -0700 (PDT)
Subject: Re: [PATCH v8 7/9] virtio-pci: decouple notifier from interrupt
 process
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-8-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <754e0702-0b34-db98-0cb6-802c3bf64e9e@redhat.com>
Date: Fri, 9 Jul 2021 13:53:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-8-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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


ÔÚ 2021/7/6 ÏÂÎç3:20, Cindy Lu Ð´µÀ:
> use the virtio_pci_get_notifier function to
> get the notifer, the input of the function
> will is the idx, the output is notifier and
> vector


You need to describe why such decoupling is needed.


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


I think we need move this patch as patch 3.


> ---
>   hw/virtio/virtio-pci.c | 45 ++++++++++++++++++++++++++++++++----------
>   1 file changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 2fe5b1f5aa..fe06847b62 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -710,6 +710,28 @@ static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
>       ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
>       assert(ret == 0);
>   }
> +static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
> +                                      EventNotifier **n, unsigned int *vector)
> +{
> +    PCIDevice *dev = &proxy->pci_dev;
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    VirtQueue *vq;
> +
> +    if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> +        return -1;
> +    } else {
> +        if (!virtio_queue_get_num(vdev, queue_no)) {
> +            return -1;
> +        }
> +        *vector = virtio_queue_vector(vdev, queue_no);
> +        vq = virtio_get_queue(vdev, queue_no);
> +        *n = virtio_queue_get_guest_notifier(vq);
> +    }
> +    if (*vector >= msix_nr_vectors_allocated(dev)) {
> +        return -1;
> +    }
> +    return 0;
> +}
>   
>   static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>   {
> @@ -718,13 +740,15 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
>       int ret, queue_no;
> -    VirtQueue *vq;
>       EventNotifier *n;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
>           }
> -        vector = virtio_queue_vector(vdev, queue_no);
> +        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +        if (ret < 0) {
> +            break;


So this suppresses the check below? (you had a similar check that is 
done in virtio_pci_get_notifier).

Thanks


> +        }
>           if (vector >= msix_nr_vectors_allocated(dev)) {
>               continue;
>           }
> @@ -736,8 +760,6 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, delay until unmasked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
>               ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>               if (ret < 0) {
>                   kvm_virtio_pci_vq_vector_release(proxy, vector);
> @@ -754,8 +776,10 @@ undo:
>               continue;
>           }
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
> +            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +            if (ret < 0) {
> +                break;
> +            }
>               kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);
> @@ -770,13 +794,16 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       unsigned int vector;
>       int queue_no;
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq;
>       EventNotifier *n;
> +    int ret ;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
>           }
> -        vector = virtio_queue_vector(vdev, queue_no);
> +        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +        if (ret < 0) {
> +            break;
> +        }
>           if (vector >= msix_nr_vectors_allocated(dev)) {
>               continue;
>           }
> @@ -784,8 +811,6 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, it was cleaned when masked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            vq = virtio_get_queue(vdev, queue_no);
> -            n = virtio_queue_get_guest_notifier(vq);
>               kvm_virtio_pci_irqfd_release(proxy, n, vector);
>           }
>           kvm_virtio_pci_vq_vector_release(proxy, vector);


