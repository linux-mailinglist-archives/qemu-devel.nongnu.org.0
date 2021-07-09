Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2A3C1F33
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:04:16 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jcV-0001vW-5O
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jbe-0001Fv-Rr
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 02:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1jbc-00065C-GW
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 02:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625810599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fh3WQuZ0bkgkNhbfV9pz5fUoP3psKoAZvAzo3nOve6I=;
 b=HVmHJIclM2sOay3aX3fsDyPlSJX778PGORAJe5utFun3bGnKYN+PwToaLmY2P+WQFzEIV+
 6dm3BNzNCxUonvGtIz6AhnTNHQT7Rp+7EMBjwb1tp7JILITVcWxBtRsXzFesaLpXK50QHe
 l13iSmrm36q2Yr24K8O33S+ICo2TSIo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-uOMxNduiPJ-pjpsAnQR9ZA-1; Fri, 09 Jul 2021 02:03:18 -0400
X-MC-Unique: uOMxNduiPJ-pjpsAnQR9ZA-1
Received: by mail-pf1-f200.google.com with SMTP id
 s5-20020aa78d450000b02902ace63a7e93so5593417pfe.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 23:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Fh3WQuZ0bkgkNhbfV9pz5fUoP3psKoAZvAzo3nOve6I=;
 b=OeBUYrQFDv5ssSkK21YG0R4RTAM/cabVPWwCx2uFhYf+ruWllX5u/jgEhVZIhDv/4o
 +yrXZqVdgsuiqf4bAyBzbDzb3KpEvlUW6vWpi9GEwI+LLZ3lKUT2w8UBp3DCspmgDzr0
 jQFME+EymBIK6nMFf1sYmEjTgyChBRKR+w+3VsTMioJAo+qSJa3SEW6L7L+zi/rkoIB/
 v00MfmEj3M9nRfntb1I6FVBRtM2e4VFAY3xVLlu06AbA/550UPaayv+3Fj/swTLI3UMA
 lyg8OQm9RBfNYXGRJZKT/8+1mICixZf0IQ4Wa5jztSSQKGZpTBtOiJwvTxVrskfoUL9d
 gBKw==
X-Gm-Message-State: AOAM533AnGcgFxVznjctlVdZFGAOnHTM/2PR6HAPh026eT9fVBufNojT
 TWYxMXyChPl8t/g/JOq61i/7A2omAE1D5ckDVV5qVrfg7ooUuDh0UTCm3sYCVGptojrAQchajY2
 UknwaFxkzVedUSSlrgr+r7dmT5rmLVKhQG+bJIkEii3du7uCKW9tS/ltplrgYgbnazIY=
X-Received: by 2002:a65:63c1:: with SMTP id n1mr36174546pgv.398.1625810596908; 
 Thu, 08 Jul 2021 23:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDWSXGhc7QN/TihtNNaVwdDMSEuolviRQbWlZXMZamtD8AH+Ija+ftCvwPsZdtLhN86SEbfw==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr36174517pgv.398.1625810596553; 
 Thu, 08 Jul 2021 23:03:16 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 85sm951979pfz.76.2021.07.08.23.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 23:03:16 -0700 (PDT)
Subject: Re: [PATCH v8 9/9] virtio-pci: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-10-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d8445fb-846d-5026-1985-cf5787dccfb0@redhat.com>
Date: Fri, 9 Jul 2021 14:03:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-10-lulu@redhat.com>
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
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 60 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index e43d5760ee..73b5ffd1b8 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -717,7 +717,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
>       VirtQueue *vq;
>   
>       if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> -        return -1;
> +        *n = virtio_get_config_notifier(vdev);
> +        *vector = vdev->config_vector;


Is there a case that the vector is not vdev->config_vector? If not, we 
probably don't need this.


>       } else {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               return -1;
> @@ -764,6 +765,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       return ret;
>   }
>   
> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}
>   
>   static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
>                           int queue_no)
> @@ -792,6 +797,30 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       }
>   }
>   
> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)


"kvm_virtio_pci_config_vector_relase" please, consider we've already had:

kvm_virtio_pci_vq_vector_release().

Thanks


> +{
> +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}



Blank line is needed.


> +static int virtio_pci_set_config_notifier(DeviceState *d, bool assign)
> +{
> +    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);
> +        if (r < 0) {
> +            return r;
> +        }
> +        virtio_set_config_notifier_fd_handler(vdev, true, true);
> +        kvm_virtio_pci_vector_config_use(proxy);
> +    } else {
> +        virtio_set_config_notifier_fd_handler(vdev, false, true);
> +        kvm_virtio_pci_vector_config_release(proxy);
> +        event_notifier_cleanup(notifier);
> +    }


We check MSIX in virtio_pci_set_guest_notifier but not here, any reason 
for this?

And I think we need consider to reuse the code in 
virtio_pci_set_guest_notifier().


> +    return r;
> +}
>   static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> @@ -873,7 +902,12 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> -
> +    n = virtio_get_config_notifier(vdev);
> +    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
> +                        vector, msg, n);
> +    if (ret < 0) {
> +        goto undo;
> +    }
>       return 0;
>   
>   undo:
> @@ -909,6 +943,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> +    n = virtio_get_config_notifier(vdev);
> +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>   }
>   
>   static void virtio_pci_vector_poll(PCIDevice *dev,
> @@ -921,19 +957,17 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>       int queue_no;
>       unsigned int vector;
>       EventNotifier *notifier;
> -    VirtQueue *vq;
> -
> -    for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
> -        if (!virtio_queue_get_num(vdev, queue_no)) {
> +    int ret;
> +    for (queue_no = VIRTIO_CONFIG_IRQ_IDX;
> +            queue_no < proxy->nvqs_with_notifiers; queue_no++) {
> +        ret = virtio_pci_get_notifier(proxy, queue_no, &notifier, &vector);
> +        if (ret < 0) {
>               break;
>           }
> -        vector = virtio_queue_vector(vdev, queue_no);
>           if (vector < vector_start || vector >= vector_end ||
>               !msix_is_masked(dev, vector)) {
>               continue;
>           }
> -        vq = virtio_get_queue(vdev, queue_no);
> -        notifier = virtio_queue_get_guest_notifier(vq);
>           if (k->guest_notifier_pending) {
>               if (k->guest_notifier_pending(vdev, queue_no)) {
>                   msix_set_pending(dev, vector);
> @@ -1002,6 +1036,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>           msix_unset_vector_notifiers(&proxy->pci_dev);
>           if (proxy->vector_irqfd) {
>               kvm_virtio_pci_vector_release(proxy, nvqs);
> +            kvm_virtio_pci_vector_config_release(proxy);
>               g_free(proxy->vector_irqfd);
>               proxy->vector_irqfd = NULL;
>           }
> @@ -1029,6 +1064,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>                   goto assign_error;
>               }
>           }
> +        r = virtio_pci_set_config_notifier(d, assign);
> +        if (r < 0) {
> +            goto config_error;
> +        }
>           r = msix_set_vector_notifiers(&proxy->pci_dev,
>                                         virtio_pci_vector_unmask,
>                                         virtio_pci_vector_mask,
> @@ -1045,7 +1084,8 @@ notifiers_error:
>           assert(assign);
>           kvm_virtio_pci_vector_release(proxy, nvqs);
>       }
> -
> +config_error:
> +    kvm_virtio_pci_vector_config_release(proxy);
>   assign_error:
>       /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
>       assert(assign);


