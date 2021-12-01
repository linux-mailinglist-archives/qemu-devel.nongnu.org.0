Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A11464646
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 06:12:23 +0100 (CET)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msHun-0002ui-Us
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 00:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1msHtF-0001GF-01
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 00:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1msHtA-00022E-AW
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 00:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638335439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu2kSU5mSntFB+JsrfbZmh+a6rbMQ1y8862q2dVwwZ4=;
 b=AoZpaJQZUbGv89qaOV3LFemN4ASNvuKp69BjX3VThd7bF9Ytk6OYpDtZFtzPMRi/49rX0d
 oGVW/2/EDuhRX8Nig3a9WT/OJNaLdBT2uNEYMxenQuu7gPuSIpckXa8UhQSlWBwDK35XXk
 HW6LUlhuLVW7JoB8DOqUnMxcCKU7KZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-Wp1QQlNHMQSddfT3Q3LrlA-1; Wed, 01 Dec 2021 00:10:35 -0500
X-MC-Unique: Wp1QQlNHMQSddfT3Q3LrlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D4181EE60;
 Wed,  1 Dec 2021 05:10:34 +0000 (UTC)
Received: from [10.64.54.189] (vpn2-54-189.bne.redhat.com [10.64.54.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32EA25F4E1;
 Wed,  1 Dec 2021 05:09:47 +0000 (UTC)
Subject: Re: [PATCH 1/1] hw/arm/virt: Support for virtio-mem-pci
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
References: <20211130003328.201270-1-gshan@redhat.com>
 <20211130003328.201270-2-gshan@redhat.com>
 <be174699-17d1-f033-2228-193d1c3fb631@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <c44a9072-0f21-9321-1828-23aadea5fea3@redhat.com>
Date: Wed, 1 Dec 2021 16:09:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <be174699-17d1-f033-2228-193d1c3fb631@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 8:37 PM, David Hildenbrand wrote:
> On 30.11.21 01:33, Gavin Shan wrote:
>> This supports virtio-mem-pci device on "virt" platform, by simply
>> following the implementation on x86.
> 
> Thanks for picking this up!
> 

Thanks, David.

>>
>>     * The patch was written by David Hildenbrand <david@redhat.com>
>>       modified by Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Maybe replace this section by
> 
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 

Yes, it will be included into v2.

>>
>>     * This implements the hotplug handlers to support virtio-mem-pci
>>       device hot-add, while the hot-remove isn't supported as we have
>>       on x86.
>>
>>     * The block size is 1GB on ARM64 instead of 128MB on x86.
> 
> See below, isn't it actually 512 MiB nowadays?
> 

I think so.

>>
>>     * It has been passing the tests with various combinations like 64KB
>>       and 4KB page sizes on host and guest, different memory device
>>       backends like normal, transparent huge page and HugeTLB, plus
>>       migration.
> 
> Perfect. A note that hugetlbfs isn't fully supported/safe to use until
> we have preallocation support in QEMU (WIP).
> 

Yes, there is some warnings raised to enlarge 'request-size' on
host with 64KB page size. Note that the memory backends I used
in the testings always have "prealloc=on" property though.

>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/Kconfig         |  1 +
>>   hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
>>   hw/virtio/virtio-mem.c |  2 ++
>>   3 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 2d37d29f02..15aff8efb8 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -27,6 +27,7 @@ config ARM_VIRT
>>       select DIMM
>>       select ACPI_HW_REDUCED
>>       select ACPI_APEI
>> +    select VIRTIO_MEM_SUPPORTED
>>   
>>   config CHEETAH
>>       bool
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 369552ad45..f4599a5ef0 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -71,9 +71,11 @@
>>   #include "hw/arm/smmuv3.h"
>>   #include "hw/acpi/acpi.h"
>>   #include "target/arm/internals.h"
>> +#include "hw/mem/memory-device.h"
>>   #include "hw/mem/pc-dimm.h"
>>   #include "hw/mem/nvdimm.h"
>>   #include "hw/acpi/generic_event_device.h"
>> +#include "hw/virtio/virtio-mem-pci.h"
>>   #include "hw/virtio/virtio-iommu.h"
>>   #include "hw/char/pl011.h"
>>   #include "qemu/guest-random.h"
>> @@ -2480,6 +2482,63 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>                            dev, &error_abort);
>>   }
>>   
>> +static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
>> +                                        DeviceState *dev, Error **errp)
>> +{
>> +    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
>> +    Error *local_err = NULL;
>> +
>> +    if (!hotplug_dev2 && dev->hotplugged) {
>> +        /*
>> +         * Without a bus hotplug handler, we cannot control the plug/unplug
>> +         * order. We should never reach this point when hotplugging on x86,
>> +         * however, better add a safety net.
>> +         */
>> +        error_setg(errp, "hotplug of virtio based memory devices not supported"
>> +                   " on this bus.");
>> +        return;
>> +    }
>> +    /*
>> +     * First, see if we can plug this memory device at all. If that
>> +     * succeeds, branch of to the actual hotplug handler.
>> +     */
>> +    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
>> +                           &local_err);
>> +    if (!local_err && hotplug_dev2) {
>> +        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
>> +    }
>> +    error_propagate(errp, local_err);
>> +}
>> +
>> +static void virt_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
>> +                                    DeviceState *dev, Error **errp)
>> +{
>> +    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
>> +    Error *local_err = NULL;
>> +
>> +    /*
>> +     * Plug the memory device first and then branch off to the actual
>> +     * hotplug handler. If that one fails, we can easily undo the memory
>> +     * device bits.
>> +     */
>> +    memory_device_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
>> +    if (hotplug_dev2) {
>> +        hotplug_handler_plug(hotplug_dev2, dev, &local_err);
>> +        if (local_err) {
>> +            memory_device_unplug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
>> +        }
>> +    }
>> +    error_propagate(errp, local_err);
>> +}
>> +
>> +static void virt_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
>> +                                              DeviceState *dev, Error **errp)
>> +{
>> +    /* We don't support hot unplug of virtio based memory devices */
>> +    error_setg(errp, "virtio based memory devices cannot be unplugged.");
>> +}
>> +
>> +
>>   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>                                               DeviceState *dev, Error **errp)
>>   {
>> @@ -2513,6 +2572,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>           qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>>           qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
>>           g_free(resv_prop_str);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>> +        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
>>       }
>>   }
>>   
>> @@ -2538,6 +2599,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>           vms->iommu = VIRT_IOMMU_VIRTIO;
>>           vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>>           create_virtio_iommu_dt_bindings(vms);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>> +        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
>>       }
>>   }
>>   
>> @@ -2588,6 +2651,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>   {
>>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>           virt_dimm_unplug_request(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>> +        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
>>       } else {
>>           error_setg(errp, "device unplug request for unsupported device"
>>                      " type: %s", object_get_typename(OBJECT(dev)));
>> @@ -2611,7 +2676,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>   
>>       if (device_is_dynamic_sysbus(mc, dev) ||
>> -       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
>> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>>           return HOTPLUG_HANDLER(machine);
>>       }
>>       if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> index d5a578142b..3033692a83 100644
>> --- a/hw/virtio/virtio-mem.c
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -126,6 +126,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>>    */
>>   #if defined(TARGET_X86_64) || defined(TARGET_I386)
>>   #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
>> +#elif defined(TARGET_ARM)
>> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (1024 * MiB))
> 
> 
> Can we make this 512 MiB ?
> 
> arch/arm64/include/asm/sparsemem.h
> 
> /*
>   * Section size must be at least 512MB for 64K base
>   * page size config. Otherwise it will be less than
>   * (MAX_ORDER - 1) and the build process will fail.
>   */
> #ifdef CONFIG_ARM64_64K_PAGES
> #define SECTION_SIZE_BITS 29
> 
> #else
> 
> /*
>   * Section size must be at least 128MB for 4K base
>   * page size config. Otherwise PMD based huge page
>   * entries could not be created for vmemmap mappings.
>   * 16K follows 4K for simplicity.
>   */
> #define SECTION_SIZE_BITS 27
> #endif /* CONFIG_ARM64_64K_PAGES */
> 
> 
> Apart from that, LGTM -- thanks!
> 

Indeed. The scetion size has been changed by the following
linux commit. v2 will include the changes.

f0b13ee2324184 arm64/sparsemem: reduce SECTION_SIZE_BITS
(Wed Jan 20 21:29:13 2021 Sudarshan Rajagopalan <sudaraja@codeaurora.org>)

Thanks,
Gavin



