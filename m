Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDD3AFD74
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:54:35 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaIs-0008Fu-AP
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lvaHL-00062H-JC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lvaHG-0005X3-GH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624344768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSuqkVBPW+JIZrS5fYWYWz+SMDhNF4gXBhqltHnxIcQ=;
 b=JBTzd/yP3EdLCzqyy1IhBjgbXpUDizlMhHnWbzoM4a9fXAwA0aIl9q+RLVq3zH4GKYl2Ld
 lRZqGWr9A6Pk2VAbEwnTqfLOn26+uT1J83rpgnor47TPX6h/G0TkLtZlKrvNktS/2UqM2C
 cx8MfU28soDZSzWo8qZozIWePsgxleQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-EiPcDx_ONcqPBk-oMshmwg-1; Tue, 22 Jun 2021 02:52:47 -0400
X-MC-Unique: EiPcDx_ONcqPBk-oMshmwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CD9804141;
 Tue, 22 Jun 2021 06:52:45 +0000 (UTC)
Received: from [10.64.54.84] (vpn2-54-84.bne.redhat.com [10.64.54.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 115CB60BF1;
 Tue, 22 Jun 2021 06:52:40 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
From: Gavin Shan <gshan@redhat.com>
To: Andrew Jones <drjones@redhat.com>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
Message-ID: <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
Date: Tue, 22 Jun 2021 18:53:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 6/3/21 2:48 PM, Gavin Shan wrote:
> On 6/2/21 9:36 PM, Andrew Jones wrote:
>> On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
>>> On 6/1/21 5:50 PM, Andrew Jones wrote:
>>>> On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
>>>>> We possibly populate empty nodes where memory isn't included and might
>>>>> be hot added at late time. The FDT memory nodes can't be created due
>>>>> to conflicts on their names if multiple empty nodes are specified.
>>>>> For example, the VM fails to start with the following error messages.
>>>>>
>>>>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
>>>>>     -accel kvm -machine virt,gic-version=host                        \
>>>>>     -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
>>>>>     -object memory-backend-ram,id=mem0,size=512M                     \
>>>>>     -object memory-backend-ram,id=mem1,size=512M                     \
>>>>>     -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
>>>>>     -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
>>>>>     -numa node,nodeid=2                                              \
>>>>>     -numa node,nodeid=3                                              \
>>>>>       :
>>>>>     -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
>>>>>
>>>>>     qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
>>>>>                          FDT_ERR_EXISTS
>>>>>
>>>>> This fixes the issue by using NUMA node ID or zero in the memory node
>>>>> name to avoid the conflicting memory node names. With this applied, the
>>>>> VM can boot successfully with above command lines.
>>>>>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>    hw/arm/boot.c | 7 ++++++-
>>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>>> index d7b059225e..3169bdf595 100644
>>>>> --- a/hw/arm/boot.c
>>>>> +++ b/hw/arm/boot.c
>>>>> @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>>>>>        char *nodename;
>>>>>        int ret;
>>>>> -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>>>>> +    if (numa_node_id >= 0) {
>>>>> +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
>>>>> +    } else {
>>>>> +        nodename = g_strdup("/memory@0");
>>>>> +    }
>>>>> +
>>>>>        qemu_fdt_add_subnode(fdt, nodename);
>>>>>        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>>>>>        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,

[...]

> 
> I've sent one separate mail to check with Rob Herring. Hopefully he have
> ideas as he is maintaining linux FDT subsystem. You have been included to
> that thread. I didn't find something meaningful to this thread after doing
> some google search either.
> 
> Yes, I agree with you we need to follow the specification strictly. It seems
> it's uncertain about the 'physical memory map' bus binding requirements.
> 

I didn't get expected answers from device-tree experts. After rethinking about it,
I plan to fix this like this way, but please let me know if it sounds sensible
to you.

The idea is to assign a (not overlapped) dummy base address to each memory
node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
The 'length' of the 'reg' property in the device-tree nodes, corresponding
to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
until memory is added to these nodes.

I had the temporary patch for the implementation. It works fine and VM can
boot up successfully.

Thanks,
Gavin


