Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427640376B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:59:36 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuMh-0004QJ-7G
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNuLb-00030v-Un
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNuLY-00065C-VY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631095104;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MTGRTqWd8QgRoHWfMcP7MoyGQRrP+nFrHuOwGZJ3Q4=;
 b=GjuHYjVMbnZ6OhbYq/QI3i86CMdsvcUbFu+CybsUpsdq98hQTWaKxoscuE+pqgQoPPLx1i
 EZEUeznhRjO5A1Pc1Kz7ooYSQSfiJnignp7gXs4af1m1qrrmj/ldmx9juUofRHVnyVKRyK
 DFiBfzwtasya72lWxxZbrD349CaegHk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364--us-atcgN1GHl-_FSKVpzQ-1; Wed, 08 Sep 2021 05:58:23 -0400
X-MC-Unique: -us-atcgN1GHl-_FSKVpzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so645052wmq.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7MTGRTqWd8QgRoHWfMcP7MoyGQRrP+nFrHuOwGZJ3Q4=;
 b=SfMckZ1kiyTRyFH0M2YimvrVydPXlFPM9Ki8aYXsnH4Z5xC442+ReJug9hz/XrTEjm
 ohwylM9ulq2o8xaBRu0NRNSXZQ2NGCNGIDvUSnbKqSL/0/qmo1P0e+ofyi+QesJCk7oX
 AWg47h25O5ui9pFyLwBdmMwCyozPMhQ5crGHQMXSuyu+NUBpobfMhcG0QFTHXy/R1ZjG
 06xH79VIZOVe6L2XK4QhQKWvwCS+5g++UKaWn6EdnmWBZjOERv8xjwbvy+pVGTSSuBEV
 zHz/KFQg+ft/KUH9qjbFTqQehzwbBKo03IrNd97oVjTkV3VisY5pANhpH9cZdNYjNFFI
 tvRg==
X-Gm-Message-State: AOAM530SFd4FxYZGk1tE2x3g76AmMn3FIJViYgj+WlbZDsvQW+OyfZ1C
 P2XTNczI3SCnA/sKBd9X5pK7x6e4Kh6DMZwc0jFF6JoBlnUSGZQ3Z8AG6SsTOecvqzAwQ0GqIs+
 HGBjmYdhz51fY8rw=
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr2665399wmr.141.1631095102069; 
 Wed, 08 Sep 2021 02:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOroPpTFo8tfmTrq0xsbipZJYW9AqRxFlPGpjzXafuS2HlQMf5XvYdSH2xgUYdz/d7tOjikA==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr2665374wmr.141.1631095101835; 
 Wed, 08 Sep 2021 02:58:21 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e8sm1764185wrc.96.2021.09.08.02.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 02:58:21 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] pc: Allow instantiating a virtio-iommu device
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-8-jean-philippe@linaro.org>
 <9e656d29-9ead-c095-15b6-3038ac60127a@redhat.com> <YTiIPrpDJ3RtrTMf@larix>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7a2bf678-3ffb-82b6-00cf-b7dee4d5f826@redhat.com>
Date: Wed, 8 Sep 2021 11:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YTiIPrpDJ3RtrTMf@larix>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 9/8/21 11:54 AM, Jean-Philippe Brucker wrote:
> On Mon, Sep 06, 2021 at 04:57:39PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> Add a hotplug handler for virtio-iommu on x86 and set the necessary
>>> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
>>> region is reserved for MSIs. DMA transactions to this range either
>>> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
>> s/bypasses/bypass.
>>> Although virtio-iommu does not support IRQ remapping it must be informed
>>> of the reserved region so that it can forward DMA transactions targeting
>>> this region.
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Feel free to remove my SoB. I have done much here.
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> ---
>>>  hw/i386/pc.c | 21 ++++++++++++++++++++-
>>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 694fc9ce07..c1e1cffe16 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -797,6 +797,11 @@ void pc_machine_done(Notifier *notifier, void *data)
>>>                       "irqchip support.");
>>>          exit(EXIT_FAILURE);
>>>      }
>>> +
>>> +    if (pcms->virtio_iommu && x86_iommu_get_default()) {
>>> +        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>>  }
>> I think you shall detect the case of dual instantiation of intel_iommu
>> and virtio-iommu.
> Those are handled by x86_iommu_set_default() and
Oh I did not notice the x86_iommu_get_default() stuff.

sorry for the noise

Eric


> pc_machine_device_plug_cb() (below) respectively. I considered factoring
> it but I think it just adds complexity.
>
> Thanks,
> Jean
>
>> Maybe pc_hotplug_allowed() can be used for that. Note
>> that both devices can be refered to in either order.
>>>  
>>>  void pc_guest_info_init(PCMachineState *pcms)
>>> @@ -1376,6 +1381,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>>>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>>>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>>> +        /* Declare the reserved MSI region */
>>> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
>>> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
>>> +
>>> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>>> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
>>> +        g_free(resv_prop_str);
>>>      }
>>>  }
>>>  
>>> @@ -1393,6 +1406,11 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>>          PCMachineState *pcms = PC_MACHINE(hotplug_dev);
>>>          PCIDevice *pdev = PCI_DEVICE(dev);
>>>  
>>> +        if (pcms->virtio_iommu) {
>>> +            error_setg(errp,
>>> +                       "QEMU does not support multiple vIOMMUs for x86 yet.");
>>> +            return;
>>> +        }
>>>          pcms->virtio_iommu = true;
>>>          pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>>>      }
>>> @@ -1436,7 +1454,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>>>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>>>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>>> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>>> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
>>> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>>>          return HOTPLUG_HANDLER(machine);
>>>      }
>>>  
>> Thanks
>>
>> Eric
>>


