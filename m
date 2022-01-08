Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D443C488278
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:41:47 +0100 (CET)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66UB-0008VV-Pq
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:49:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n663b-0004nj-Ca
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n663Y-0001EO-JH
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641626541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aAuBCQ76B33BLPIgV+cai7XyGwp4iZUzPCfoL/rVg4=;
 b=VQDJPaa+EvOhKbJku6OfJCcUNlQWfa4cvNK8uoPtFJaNbAYpnpTzTQqYzrEGVrysqz14Uu
 BRpeoIl1/StCQYS+DL7v3mcYNRCIjN+eNXRHgB5FKYQ05YJTyqKnnWCiYH4D4Wc1jGVslK
 Owwk2XVsKV0s4kde9x91GPPUUzAxfyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-LlMXwC5jM5CYvdhckKB84w-1; Sat, 08 Jan 2022 02:22:18 -0500
X-MC-Unique: LlMXwC5jM5CYvdhckKB84w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38A9180FD60;
 Sat,  8 Jan 2022 07:22:16 +0000 (UTC)
Received: from [10.72.13.57] (ovpn-13-57.pek2.redhat.com [10.72.13.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 504BC7A22E;
 Sat,  8 Jan 2022 07:21:57 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Support for virtio-mem-pci
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211203233404.37313-1-gshan@redhat.com>
 <20211203233404.37313-3-gshan@redhat.com>
 <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
Date: Sat, 8 Jan 2022 15:21:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.199, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/8/22 12:40 AM, Peter Maydell wrote:
> On Fri, 3 Dec 2021 at 23:34, Gavin Shan <gshan@redhat.com> wrote:
>>
>> This supports virtio-mem-pci device on "virt" platform, by simply
>> following the implementation on x86.
>>
>>     * This implements the hotplug handlers to support virtio-mem-pci
>>       device hot-add, while the hot-remove isn't supported as we have
>>       on x86.
>>
>>     * The block size is 512MB on ARM64 instead of 128MB on x86.
>>
>>     * It has been passing the tests with various combinations like 64KB
>>       and 4KB page sizes on host and guest, different memory device
>>       backends like normal, transparent huge page and HugeTLB, plus
>>       migration.
>>
>> Co-developed-by: David Hildenbrand <david@redhat.com>
>> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> 
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
> 
> This comment looks like it was cut-n-pasted from x86 -- is whatever
> it is that prevents us from reaching this point also true for arm ?
> (What is the thing that prevents us reaching this point?)
> 

Yeah, the comment was copied from x86. It's also true for ARM as a hotplug
controller on the parent bus is required for virtio-mem-pci device hot-add,
according to the following commit log.

commit a0a49813f7f2fc23bfe8a4fc6760e2a60c9a3e59
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Jun 19 15:19:07 2019 +0530

     pc: Support for virtio-pmem-pci
     
     Override the device hotplug handler to properly handle the memory device
     part via virtio-pmem-pci callbacks from the machine hotplug handler and
     forward to the actual PCI bus hotplug handler.
     
     As PCI hotplug has not been properly factored out into hotplug handlers,
     most magic is performed in the (un)realize functions. Also some PCI host
     buses don't have a PCI hotplug handler at all yet, just to be sure that
     we alway have a hotplug handler on x86, add a simple error check.
     
     Unlocking virtio-pmem will unlock virtio-pmem-pci.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>

However, I don't think the comment we have for ARM is precise enough because
it's irrelevant to x86. I will change it something like below in v4:

	/*
	 * Without a bus hotplug handler, we cannot control the plug/unplug
	 * order. We should never reach this point when hotplugging on ARM.
	 * However, it's nice to add a safety net, similar to what we have
          * on x86.
	 */


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
> 
> 
> 
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> index b20595a496..21e4d572ab 100644
>> --- a/hw/virtio/virtio-mem.c
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -125,7 +125,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>>    * The memory block size corresponds mostly to the section size.
>>    *
>>    * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
>> - * a section size of 1GB on arm64 (as long as the start address is properly
>> + * a section size of 512MB on arm64 (as long as the start address is properly
>>    * aligned, similar to ordinary DIMMs).
>>    *
>>    * We can change this at any time and maybe even make it configurable if
>> @@ -134,6 +134,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>>    */
>>   #if defined(TARGET_X86_64) || defined(TARGET_I386)
>>   #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
>> +#elif defined(TARGET_ARM)
>> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
>>   #else
>>   #error VIRTIO_MEM_USABLE_EXTENT not defined
>>   #endif
> 
> Could this comment explain where the 128MB and 512MB come from
> and why the value is different for different architectures ?
> 

Yes, the comment already explained it by "section size", which is the
minimal hotpluggable unit. It's defined by the linux guest kernel as
below. On ARM64, we pick the larger section size without considering
the base page size. Besides, the virtio-mem is/will-be enabled on
x86_64 and ARM64 guest kernel only.

#define SECTION_SIZE_BITS  29      /* ARM:    64KB base page size        */
#define SECTION_SIZE_BITS  27      /* ARM:    16KB or 4KB base page size */
#define SECTION_SIZE_BITS  27      /* x86_64                             */

Thanks,
Gavin


