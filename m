Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A076A5F3F24
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:05:23 +0200 (CEST)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdre-0008VV-Iq
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdhl-0000Wa-Fp
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdhd-000411-SC
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664873700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmG0hf4A0zlDjeeZXjGfqJC0fhL7iXup6+3ipqrLQfI=;
 b=aVJzdQtoe+/d53qsbSKkInEH/waszwMyZGPnW27PRGOP11qNDp2gRIepRVzR9c+IiPfev9
 xyB3IEW2PVcWR2JGKiiSeFStEgb5HXSJBOyNPDzPW+CB21Rl6D0vz1flAIWli7/y/qgAGl
 waPG5eF9jUZv07Jm6HGIroU9KNmQsRk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-BSe8EGcKMy6pxOaVu2j8kQ-1; Tue, 04 Oct 2022 04:54:58 -0400
X-MC-Unique: BSe8EGcKMy6pxOaVu2j8kQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r9-20020a1c4409000000b003b3f017f259so7542536wma.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 01:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=gmG0hf4A0zlDjeeZXjGfqJC0fhL7iXup6+3ipqrLQfI=;
 b=hAQaKVPdSbczoIk4r/Lmeaj1B+9m3Y60ZB6w+RJMXfP6aTSL0ffEYlayk9k3tWdfSj
 74bImR5MweZuF7YtXQWRyfebRwSY1zZN7THSrUo1AFgI/Dq2J4DX0/RBHZWzBytsdE9N
 79FMDkb5Ui0UYBM0GQ0CaRMf8bTSvZZB2ENtYevot5hCB7wZzip0KxQHSD1NU8ES8VM3
 cWMd8eAl0ng/LlmW66Kyg9xiytshzvI4IpQDYsqA7x3e6xOs7WzmZ6xQ9muAWgdQDU3i
 HjGBEvdwXLvs7AZeee5Yen6YGfVsrd+GTGPpf0f0IdAedydV0eIxBmntuTZamMaw3Zuh
 pAiA==
X-Gm-Message-State: ACrzQf3YSuxB9jO2ViBOzFmyMUEOz4XVayOnBFQH9R/hIMMEEHCgvmAa
 IN9uWbfDU5ymF5RVzgn735tf8pCpuhNn6zkPiHzapDLe1Gnl9rBGU1DmGw1qA36SVPFat2AxY2v
 t0pr7MuhNKLwAdA4=
X-Received: by 2002:adf:f58b:0:b0:22e:3c4:cf83 with SMTP id
 f11-20020adff58b000000b0022e03c4cf83mr11447328wro.379.1664873697551; 
 Tue, 04 Oct 2022 01:54:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7jonD0gW62vYzNe83LZYLg8pyUZluyyC2AKv4dC6eNvXQ5kKPnkHCVYhjfrNXFUd1hFwGE2g==
X-Received: by 2002:adf:f58b:0:b0:22e:3c4:cf83 with SMTP id
 f11-20020adff58b000000b0022e03c4cf83mr11447317wro.379.1664873697287; 
 Tue, 04 Oct 2022 01:54:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:5000:4fff:1dd6:7868:a36?
 (p200300cbc70650004fff1dd678680a36.dip0.t-ipconnect.de.
 [2003:cb:c706:5000:4fff:1dd6:7868:a36])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d5606000000b00228d52b935asm12327428wrv.71.2022.10.04.01.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 01:54:56 -0700 (PDT)
Message-ID: <066027ec-a02d-97db-dfa7-2c46866b49d4@redhat.com>
Date: Tue, 4 Oct 2022 10:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 3/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-4-kraxel@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220930135810.1892149-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 30.09.22 15:58, Gerd Hoffmann wrote:
> Not needed for a virtio 1.0 device.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/hw/pci/pci.h        | 1 -
>   hw/virtio/virtio-pmem-pci.c | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b6aefb33fb17..42c83cb5ed00 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -84,7 +84,6 @@ extern bool pci_available;
>   #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
>   #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>   #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> -#define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
>   
>   #define PCI_VENDOR_ID_REDHAT             0x1b36
>   #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
> index 2b2a0b1eae10..7d9f4ec189b9 100644
> --- a/hw/virtio/virtio-pmem-pci.c
> +++ b/hw/virtio/virtio-pmem-pci.c
> @@ -90,8 +90,6 @@ static void virtio_pmem_pci_class_init(ObjectClass *klass, void *data)
>   
>       k->realize = virtio_pmem_pci_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_PMEM;
>       pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>       pcidev_k->class_id = PCI_CLASS_OTHERS;
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


