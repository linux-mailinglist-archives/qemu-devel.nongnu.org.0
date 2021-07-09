Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1403C1F31
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:01:42 +0200 (CEST)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ja1-0000HT-GQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jTX-0004JI-Hm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jTV-0001uT-JP
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625810096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mI85vPyrMoUUc1SaFvWgCLCp8hf5vkO7zNockTYO444=;
 b=bLrEytdz64SD4m/f5os/R69iDZZomE/KcRtFH10pBdptCfbsigdzvpRTJDBetxrAx16Dph
 qy2fGj6H1YrOSZokmARdgn29UhwiGYAWXHz040j2t4X6uspl0Tmm1G1aq8DOfglgbXRKJz
 UhxJuFLG8EATPRSFQlNuXwsHhaG2f1k=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rmuG1qHKOCW5NT3JZU6ZBw-1; Fri, 09 Jul 2021 01:54:55 -0400
X-MC-Unique: rmuG1qHKOCW5NT3JZU6ZBw-1
Received: by mail-pj1-f71.google.com with SMTP id
 k92-20020a17090a14e5b02901731af08bd7so5399274pja.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mI85vPyrMoUUc1SaFvWgCLCp8hf5vkO7zNockTYO444=;
 b=rylGj6NtXgGRZz2EUk8TsjjkLVexjt75V+/PF1KqrPva+tVD54D1ZtFjiqp75GFj26
 5OMr1wL/9CNUai1s8G/WizuuMK6c9lkmuAr06tiUDseXxTXsYMcbDPnVjO6MLoMgIqmq
 grEUFIwWUMfU8uHQlZnUtyRSDxSQXYZcKHq4KMInip0lnFaBaEqHkz4hsKddktBjLceR
 qBA8P9qTNB+iJeBk42Mybisbsxq6oTOj48QxN4ufFomhBjU4vDqPTa0pupD/No1qufm7
 36bYHK1sAiabtrBSGuxkRp9/pYKMmhjnvNxnawx6mkG2SRvNVvN3krYOAhF26pQNSfQb
 F2jQ==
X-Gm-Message-State: AOAM5311ei4LY89xmRTpoorkw+3aKO/beqqOPPcHy3HJTC4vM8b1iT2X
 guVFnGE7pPfOLOkLKbkcUMg1xhtfuk9f3YGzHYaw9/CBw/amqbg2APg7GrgPYHWvrdliVkSUe+1
 9/47cRJkSl26hpDL1/RH1r65Ij+KMSy1rIIpqda8QWH3E0pZa996tcTSyN7a6lDGyfbY=
X-Received: by 2002:a05:6a00:164b:b029:305:f45e:e1d9 with SMTP id
 m11-20020a056a00164bb0290305f45ee1d9mr35838155pfc.10.1625810094167; 
 Thu, 08 Jul 2021 22:54:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv2Jc+aCPj5lHpIvtclfBXEeCzGwa4dozDoGQ/i8Hagf96wX/XiCibTfXRVz/ERW31FUX4vQ==
X-Received: by 2002:a05:6a00:164b:b029:305:f45e:e1d9 with SMTP id
 m11-20020a056a00164bb0290305f45ee1d9mr35838141pfc.10.1625810093900; 
 Thu, 08 Jul 2021 22:54:53 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p26sm4593022pff.18.2021.07.08.22.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:54:53 -0700 (PDT)
Subject: Re: [PATCH v8 8/9] virtio-pci:decouple the single vector from the
 interrupt process
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-9-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9fc1a974-90bd-73da-94f4-a4fd929116bb@redhat.com>
Date: Fri, 9 Jul 2021 13:54:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-9-lulu@redhat.com>
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
> use the kvm_virtio_pci_vector_use_one and _release_one
> these funtion is to deal with the single vector, the
> whole process will finish in a loop with vq number.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 109 ++++++++++++++++-------------------------
>   1 file changed, 42 insertions(+), 67 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index fe06847b62..e43d5760ee 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -666,7 +666,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
>   }
>   
>   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> -                                        unsigned int queue_no,
>                                           unsigned int vector)
>   {
>       VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
> @@ -733,87 +732,63 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
>       return 0;
>   }
>   
> -static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> +static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
>   {
> -    PCIDevice *dev = &proxy->pci_dev;
> -    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       unsigned int vector;
> -    int ret, queue_no;
> +    int ret;
>       EventNotifier *n;
> -    for (queue_no = 0; queue_no < nvqs; queue_no++) {
> -        if (!virtio_queue_get_num(vdev, queue_no)) {
> -            break;
> -        }


So this check is not moved but deleted, is this intentional?


> -        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> -        if (ret < 0) {
> -            break;
> -        }
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }


So did this?


> -        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> -        if (ret < 0) {
> -            goto undo;
> -        }
> -        /* If guest supports masking, set up irqfd now.
> -         * Otherwise, delay until unmasked in the frontend.
> -         */
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> -            if (ret < 0) {
> -                kvm_virtio_pci_vq_vector_release(proxy, vector);
> -                goto undo;
> -            }
> -        }
> +    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
> +    if (ret < 0) {
> +        goto undo;
> +    }
> +    ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> +    if (ret < 0) {
> +        goto undo;
>       }
>       return 0;
> -
>   undo:
> -    while (--queue_no >= 0) {
> -        vector = virtio_queue_vector(vdev, queue_no);
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> -            if (ret < 0) {
> -                break;
> -            }
> -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> -        }
> -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    return ret;
> +}
> +static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> +{
> +    int queue_no;
> +    int ret = 0;
> +    for (queue_no = 0; queue_no < nvqs; queue_no++) {
> +        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
>       }
>       return ret;
>   }
>   
> -static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
> +
> +static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
> +                        int queue_no)
>   {
> -    PCIDevice *dev = &proxy->pci_dev;
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       unsigned int vector;
> -    int queue_no;
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>       EventNotifier *n;
> -    int ret ;
> +    int ret;
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> +    if (ret < 0) {
> +        return;
> +    }
> +
> +    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> +    }
> +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> +}
> +static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
> +{
> +    int queue_no;
> +
>       for (queue_no = 0; queue_no < nvqs; queue_no++) {
> -        if (!virtio_queue_get_num(vdev, queue_no)) {
> -            break;
> -        }


This is deleted by not removed.


> -        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
> -        if (ret < 0) {
> -            break;
> -        }
> -        if (vector >= msix_nr_vectors_allocated(dev)) {
> -            continue;
> -        }


So did this.

Thanks


> -        /* If guest supports masking, clean up irqfd now.
> -         * Otherwise, it was cleaned when masked in the frontend.
> -         */
> -        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> -        }
> -        kvm_virtio_pci_vq_vector_release(proxy, vector);
> +        kvm_virtio_pci_vector_release_one(proxy, queue_no);
>       }
>   }
>   


