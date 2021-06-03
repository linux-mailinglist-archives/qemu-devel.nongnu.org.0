Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7795399AF3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:46:44 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loh7s-0000vq-1L
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loh6i-0000Ap-Qe
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loh6h-0003cP-4T
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622702730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUM0Od3qIQ643lUhRkBQGiipbQxhOOWzUx1FSRMq+mI=;
 b=AQZ4QzmryS0ydv5OvfurCwsINBWVJnhWHGJ8+z4cShPtSdzJXyUWBtWObYcH6966O+8UtC
 c1sE0MI8net1b2R/oDkDSQCnprEUzbb/h68u6RnfI19f/YEwI0pbW1HjnsawP3r1ZqxorV
 NFFDsFZM2ps5rbvLdLcb/aasK4yQVNw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-_95Mjte2N3We3-fR6f6-xg-1; Thu, 03 Jun 2021 02:45:27 -0400
X-MC-Unique: _95Mjte2N3We3-fR6f6-xg-1
Received: by mail-pf1-f200.google.com with SMTP id
 f19-20020a056a002393b02902d8b0956281so2939451pfc.19
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DUM0Od3qIQ643lUhRkBQGiipbQxhOOWzUx1FSRMq+mI=;
 b=o3QJfk/Ok7icZI7X63CwAHNUPZD8D9Z6yjXr5kVua0A7+XJl6+rq8omnQOjEDFZ1ti
 iAnbnnMaklJm58kjqsL1sr9beAkAJSsO2pDTdTYdyNjcc+yeE2c16Bu7zbIyRK0RWdkF
 AWHrroDIKcjYT8fyFru0cu/OTlAVT4zMOU6nXjJMiDtpSQHSrE0rPMEPGyf6hTOEfFp4
 hI13UyQCqsiakPX9uZVWKwJFNXE1UKE9+GnGfqPC0wOAH8VgXQ1VVqMIKYjgB6i8F78x
 jMew3AHL51VoaMBlDgH7dqGwJvxxX1nQuNNa7soX3xiLvHdi9zbGCXSjgN9FaBPfkp2V
 cSKA==
X-Gm-Message-State: AOAM532vVKZ60TLcyP1niK0SznEX3w203n7yT0ViOnnrAsA3uQJkX4Pb
 k4iN1lAKykNMC1WkrRZQubOsEUh/yugMKhXJOloTJK1by7zM/7z0ZxpWadnlhktd+ogB3D7JfcN
 Wc0d44eiU7xBiXvrSNrOuKggDrWuGEoKD+Leyd7pw7GVm2FDkruhx7MUGGmSqHf3/ReM=
X-Received: by 2002:a63:1161:: with SMTP id 33mr37972998pgr.270.1622702726154; 
 Wed, 02 Jun 2021 23:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/CYwJRynKps4tAvE73IzQN0IZ+l5E0pCxdj7ZqT4ja925QQVtMVfFB88a9g3qSa5ePDLUpg==
X-Received: by 2002:a63:1161:: with SMTP id 33mr37972977pgr.270.1622702725787; 
 Wed, 02 Jun 2021 23:45:25 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x1sm1153642pjk.37.2021.06.02.23.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:45:25 -0700 (PDT)
Subject: Re: [PATCH v7 09/10] virtio-pci: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-10-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cfaaa894-fb52-97f3-4324-5ce875e6a724@redhat.com>
Date: Thu, 3 Jun 2021 14:45:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-10-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> Add support for configure interrupt, use kvm_irqfd_assign and set the
> gsi to kernel. When the configure notifier was eventfd_signal by host
> kernel, this will finally inject an msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 63 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 60 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index f863c89de6..1e03f11a85 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -717,7 +717,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
>       VirtQueue *vq;
>   
>       if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> -        return -1;
> +        *n = virtio_get_config_notifier(vdev);
> +        *vector = vdev->config_vector;
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
> @@ -792,6 +797,28 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       }
>   }
>   
> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> +{
> +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}


Newline please, can this survive from checkpatch.pl?


> +static int virtio_pci_set_config_notifier(DeviceState *d, bool assign)
> +{
> +    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);
> +        virtio_set_notifier_fd_handler(vdev, VIRTIO_CONFIG_IRQ_IDX, true, true);
> +        kvm_virtio_pci_vector_config_use(proxy);
> +    } else {
> +        virtio_set_notifier_fd_handler(vdev, VIRTIO_CONFIG_IRQ_IDX,
> +                                             false, true);
> +        kvm_virtio_pci_vector_config_release(proxy);
> +        event_notifier_cleanup(notifier);
> +    }
> +    return r;
> +}
>   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> @@ -873,9 +900,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> -
> +    n = virtio_get_config_notifier(vdev);
> +    ret = virtio_pci_vq_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
> +                        vector, msg, n);
> +    if (ret < 0) {
> +        goto config_undo;
> +    }


I'd do this before the loop, but need to validate whether the vector is 
the one that is used by the config interrupt.


>       return 0;
>   
> +config_undo:
> +    n = virtio_get_config_notifier(vdev);
> +    virtio_pci_vq_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);


So unmask fail means it is still masked, we don't need to mask it again.


>   undo:
>       vq = virtio_vector_first_queue(vdev, vector);
>       while (vq && unmasked >= 0) {
> @@ -909,6 +944,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> +    n = virtio_get_config_notifier(vdev);
> +    virtio_pci_vq_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>   }
>   
>   static void virtio_pci_vector_poll(PCIDevice *dev,
> @@ -942,6 +979,20 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>               msix_set_pending(dev, vector);
>           }
>       }
> +   /*check for config interrupt*/
> +   vector = vdev->config_vector;
> +   notifier = virtio_get_config_notifier(vdev);
> +   if (vector < vector_start || vector >= vector_end ||
> +            !msix_is_masked(dev, vector)) {
> +        return;
> +   }
> +   if (k->guest_notifier_pending) {
> +        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
> +            msix_set_pending(dev, vector);
> +        }
> +   } else if (event_notifier_test_and_clear(notifier)) {
> +        msix_set_pending(dev, vector);
> +   }


Let's consider to unify the codes with vq vector here.


>   }
>   
>   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
> @@ -1002,6 +1053,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>           msix_unset_vector_notifiers(&proxy->pci_dev);
>           if (proxy->vector_irqfd) {
>               kvm_virtio_pci_vector_release(proxy, nvqs);
> +            kvm_virtio_pci_vector_config_release(proxy);
>               g_free(proxy->vector_irqfd);
>               proxy->vector_irqfd = NULL;
>           }
> @@ -1029,6 +1081,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
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
> @@ -1045,7 +1101,8 @@ notifiers_error:
>           assert(assign);
>           kvm_virtio_pci_vector_release(proxy, nvqs);
>       }
> -


Newline should be kept here.

Thanks


> +config_error:
> +    kvm_virtio_pci_vector_config_release(proxy);
>   assign_error:
>       /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
>       assert(assign);


