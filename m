Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD83C1F19
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:52:02 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jQg-0005Bl-1V
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1iyE-0002Nh-HB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1iyA-0004B5-ED
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625808152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blm1Hz8i9fMAwN8ur+uKCGT22Cc4DOnYQyvsmc6T8QI=;
 b=KWRSvgcfxLRUpezdoEtjZNIdaTs7/GGFJojqTRg+RyVEMJhrIo4cXCRvbyLcrqcYTO6ygw
 Od1c7Qzt/+TT2qfUWzUO2tcX98HsHhw9i5ZVTgW6xkcOuin+/Yf8jxkLmy9lJRLsu+BFXL
 XMV99T+bI1Gw5IkSOmRypplOFdPUMn4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-cfjos2Z7M5aus95989xS7w-1; Fri, 09 Jul 2021 01:22:31 -0400
X-MC-Unique: cfjos2Z7M5aus95989xS7w-1
Received: by mail-pf1-f198.google.com with SMTP id
 s5-20020aa78d450000b02902ace63a7e93so5522339pfe.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=blm1Hz8i9fMAwN8ur+uKCGT22Cc4DOnYQyvsmc6T8QI=;
 b=tbGZ3Ji/Ej/s698wlGXwKAbGFFtYdjRexcjw1JPt0LeURbdxBLo2fmyijh+SMcOrZ4
 RtAjt6C9pspmXDOSMiNxZVYyV4bNIkc9ZJbqfXvdRqHmM+o9DjW32urwiHFC5Rm6LdMu
 LYgo80RbzNkrgxfh7J9S+/ikHYfF6QOykxkasTJqfZkZZ1rj33B6vOSPvdRDltI3BYsk
 tKHOJEtsaawJSYXqRvKlGy213/Ie+nKzU2lTe7n0ifU4KHjZsQmdzQWfp5PB8mlDkt7n
 4y6UVdPu5bIU4Vvse58aKvrhdC9m24mbWOvT2FLAlPJpUK6SQYLJ1D97G/94/pwfTCWe
 fI0g==
X-Gm-Message-State: AOAM530JxQzL5KRe4TwtH2BNSsOuXSBOX0HNugiGH7kDN1JISmwAOHTH
 SuBzI7CKPkEnSODwDfh8uV8QxAbZtj6ddoifaY4dVdhLZJHHiEpR7qf8MR+RyhPZxjb1Fv64xNp
 Omy/ZwzzUdPfRwQHyh0CoKEDIleX2vfcq80+FcW/oiWvEywq4o9FO/9XvzghU1kI1URc=
X-Received: by 2002:a65:5648:: with SMTP id m8mr36373178pgs.93.1625808150122; 
 Thu, 08 Jul 2021 22:22:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxod5Dkr1Hy2KjnLi8PHzgXLg5yxHB5oDx0LqDn+2ZR9lKjcw+2tt/dpBsrDyE8F3ESd8e4xQ==
X-Received: by 2002:a65:5648:: with SMTP id m8mr36373152pgs.93.1625808149761; 
 Thu, 08 Jul 2021 22:22:29 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w6sm5672293pgh.56.2021.07.08.22.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:22:29 -0700 (PDT)
Subject: Re: [PATCH v8 2/9] virtio-pci:decouple virtqueue from interrupt
 setting process
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0792e4d6-1008-89a2-33d2-f1f47f59b2ce@redhat.com>
Date: Fri, 9 Jul 2021 13:22:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-3-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
> Decouple virtqueue from interrupt setting process to support config interrupt
> Now the code for interrupt/vector are coupling
> with the vq number, this patch will decouple the vritqueue
> numbers from these functions
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 55 ++++++++++++++++++++++++------------------
>   1 file changed, 31 insertions(+), 24 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index b321604d9b..2fe5b1f5aa 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -693,23 +693,17 @@ static void kvm_virtio_pci_vq_vector_release(VirtIOPCIProxy *proxy,
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
> @@ -724,7 +718,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
>       int ret, queue_no;
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -741,7 +736,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>            * Otherwise, delay until unmasked in the frontend.
>            */
>           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +            vq = virtio_get_queue(vdev, queue_no);
> +            n = virtio_queue_get_guest_notifier(vq);


I see some similar logic below, let's introduce helper for them.


> +            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>               if (ret < 0) {
>                   kvm_virtio_pci_vq_vector_release(proxy, vector);
>                   goto undo;
> @@ -757,7 +754,9 @@ undo:
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
> @@ -771,7 +770,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       unsigned int vector;
>       int queue_no;
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -
> +    VirtQueue *vq;
> +    EventNotifier *n;
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               break;
> @@ -784,21 +784,22 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
>   }
>   
> -static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
> +static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> -                                       MSIMessage msg)
> +                                       MSIMessage msg,
> +                                       EventNotifier *n)
>   {
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> -    EventNotifier *n = virtio_queue_get_guest_notifier(vq);
>       VirtIOIRQFD *irqfd;
>       int ret = 0;
>   
> @@ -825,14 +826,15 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>               event_notifier_set(n);
>           }
>       } else {
> -        ret = kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
>       }
>       return ret;
>   }
>   
> -static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
> +static void virtio_pci_one_vector_mask(VirtIOPCIProxy *proxy,
>                                                unsigned int queue_no,
> -                                             unsigned int vector)
> +                                             unsigned int vector,
> +                                             EventNotifier *n)
>   {
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> @@ -843,7 +845,7 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIProxy *proxy,
>       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>           k->guest_notifier_mask(vdev, queue_no, true);
>       } else {
> -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
>       }
>   }
>   
> @@ -853,6 +855,7 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int ret, index, unmasked = 0;
>   
>       while (vq) {
> @@ -861,7 +864,8 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            ret = virtio_pci_vq_vector_unmask(proxy, index, vector, msg);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            ret = virtio_pci_one_vector_unmask(proxy, index, vector, msg, n);
>               if (ret < 0) {
>                   goto undo;
>               }
> @@ -877,7 +881,8 @@ undo:
>       while (vq && unmasked >= 0) {
>           index = virtio_get_queue_index(vq);
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            n = virtio_queue_get_guest_notifier(vq);
> +            virtio_pci_one_vector_mask(proxy, index, vector, n);
>               --unmasked;
>           }
>           vq = virtio_vector_next_queue(vq);
> @@ -890,15 +895,17 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>       VirtIOPCIProxy *proxy = container_of(dev, VirtIOPCIProxy, pci_dev);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtQueue *vq = virtio_vector_first_queue(vdev, vector);
> +    EventNotifier *n;
>       int index;
>   
>       while (vq) {
>           index = virtio_get_queue_index(vq);
> +         n = virtio_queue_get_guest_notifier(vq);


Indentation looks odd.

Thanks


>           if (!virtio_queue_get_num(vdev, index)) {
>               break;
>           }
>           if (index < proxy->nvqs_with_notifiers) {
> -            virtio_pci_vq_vector_mask(proxy, index, vector);
> +            virtio_pci_one_vector_mask(proxy, index, vector, n);
>           }
>           vq = virtio_vector_next_queue(vq);
>       }


