Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C146EEDB0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:51:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prY3S-0003ln-LW; Wed, 26 Apr 2023 01:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prY3K-0003cA-67
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prY3I-0001io-M8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fpn2YgDl2bpPT2f7ahurb5xVyOrmeEAYTaN37axwWZY=;
 b=hcL1ux+nc1OLcraA19jluaOajcHgVhuPtoDCUneeHEw2LfxdGuMjMgqje9FIyHKZLiDm3F
 Hz+aKxs0ocUzNnaNznNG+od+02J/0BpKcdAnXKtZ6nGazXix06ikoA6zbyF2PFxf5+DdWO
 PfYW6OEz4YMIit/EALt1DbAVEp0HO6o=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-PLYUQp7RPiOQ653MZkNS1w-1; Wed, 26 Apr 2023 01:50:50 -0400
X-MC-Unique: PLYUQp7RPiOQ653MZkNS1w-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-24b25d3538eso3637220a91.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 22:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682488249; x=1685080249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fpn2YgDl2bpPT2f7ahurb5xVyOrmeEAYTaN37axwWZY=;
 b=eQyBDoULaVZCH+SsfUL0oi0ORfvJVlcIZX/f60Vg9TEywpqhFSUXBlF0/f9JZt4+cu
 R1HSCwKEQmO5QGCBuIVqbLH65XNSyjegOkoJdnlog6y+wfxIGi2kIHVAacwifg84s8wj
 10fn2a6GfYaPsqurYeVJ2sQReAgH8uT+GTyDchAqVVcmldNb8kHCGsv7O5NjTzcnpB/W
 Ep88foCMhImo5gO1lmrF+6QjoxXY4vfMjQp7CCX/nqEltsS3Qio94gTAsW6GhhXwmQal
 62eWtyjqY0Rl4msEomKqaHsT7n7GKcr8awxynZzD/K87yQXBDP33TPrQz33wVo5ExdfL
 HDyw==
X-Gm-Message-State: AAQBX9fLL4bWrg/R7moutxPUejIiJ3q1Wi+yVLTYjC+3xe0Tk4mqzZFx
 Rcee1m72ODJTVhMvcVo6HLYe0rxDJowwaQDjUEozYGO1g/1FYRRVs4IhcJNRNzg2P73JMnw86/G
 ujrAMKZNMWFXhIFY=
X-Received: by 2002:a17:902:ab07:b0:1a1:defc:30d8 with SMTP id
 ik7-20020a170902ab0700b001a1defc30d8mr20514909plb.32.1682488249132; 
 Tue, 25 Apr 2023 22:50:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTUtwmrE4/FPDipldABkDhALihZUBJ17kFTY0lmYpCR+GhL+Keb1tT0QErEtGszkzt9ENSlQ==
X-Received: by 2002:a17:902:ab07:b0:1a1:defc:30d8 with SMTP id
 ik7-20020a170902ab0700b001a1defc30d8mr20514895plb.32.1682488248844; 
 Tue, 25 Apr 2023 22:50:48 -0700 (PDT)
Received: from [10.72.12.241] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170902700900b0019c2b1c4ad4sm1066950plk.6.2023.04.25.22.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 22:50:48 -0700 (PDT)
Message-ID: <98eda02a-63a8-7c2d-7c10-85ca986141a2@redhat.com>
Date: Wed, 26 Apr 2023 13:50:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 2/4] virtio-pci: add handling of ATS state change
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, peterx@redhat.com,
 david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com
References: <20230424112147.17083-1-viktor@daynix.com>
 <20230424112147.17083-3-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230424112147.17083-3-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/4/24 19:21, Viktor Prutyanov 写道:
> Guest may enable or disable ATS for the device. Add logic for handling
> these events.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>   hw/virtio/virtio-pci.c     | 12 ++++++++++++
>   include/hw/virtio/virtio.h |  2 ++
>   2 files changed, 14 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..70f63a4986 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1731,6 +1731,17 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
>       }
>   }
>   
> +static void virtio_pci_ats_ctrl_trigger(PCIDevice *pci_dev, bool enable)
> +{
> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +
> +    vdev->ats_enabled = enable;
> +
> +    if (vdev->ats_ctrl_trigger)
> +        vdev->ats_ctrl_trigger(enable, vdev);
> +}
> +
>   static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
>                                              const char *vdev_name)
>   {
> @@ -2166,6 +2177,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>           if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
>               pcie_ats_init(pci_dev, last_pcie_cap_offset,
>                             proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
> +            pci_dev->ats_ctrl_trigger = virtio_pci_ats_ctrl_trigger;
>               last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
>           }
>   
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 77c6c55929..2812561aae 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -155,6 +155,8 @@ struct VirtIODevice
>       QLIST_HEAD(, VirtQueue) *vector_queues;
>       QTAILQ_ENTRY(VirtIODevice) next;
>       EventNotifier config_notifier;
> +    void (*ats_ctrl_trigger)(bool enable, VirtIODevice *vdev);
> +    bool ats_enabled;


ATS is pci specific in the virtio layer we might use something more 
general like "device-iotlb"?

And this method needs to go in VirtioDeviceClass.

Thanks


>   };
>   
>   struct VirtioDeviceClass {


