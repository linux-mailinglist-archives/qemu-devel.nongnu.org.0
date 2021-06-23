Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62D3B11DF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 04:44:25 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvssK-0002fC-1p
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 22:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lvsqz-0001Kc-N9
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 22:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lvsqw-0005Uy-Fy
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 22:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624416177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NT61TJxzA0qNcB5jpOvUgcTbQz7I3GWz0L1hcOoLOSk=;
 b=KafqfKdmUqpg06FBoE3XP1+v95o5zXMg/1esnAi/56r+c0sQPYdc8gbATINaU+XuPTIND+
 knXyPmYPyqbFeF+XIuODTHzXcQ76gyGh4ncAUefvOPitlPs0S9jE/8KlogPn0XHUfEsdkh
 sPyWthYwDCXVby9tm42pjpYETqUF8u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-AmsBjLliPMyH3yCU93jl3w-1; Tue, 22 Jun 2021 22:42:54 -0400
X-MC-Unique: AmsBjLliPMyH3yCU93jl3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77FFA800D55;
 Wed, 23 Jun 2021 02:42:53 +0000 (UTC)
Received: from [10.64.54.84] (vpn2-54-84.bne.redhat.com [10.64.54.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ACB760875;
 Wed, 23 Jun 2021 02:42:47 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
To: Andrew Jones <drjones@redhat.com>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
 <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
 <20210622071349.ibni4btfjrb2v2p2@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <707a90ca-4a12-5813-4834-6ed5c77200b5@redhat.com>
Date: Wed, 23 Jun 2021 14:43:49 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20210622071349.ibni4btfjrb2v2p2@gator>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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

On 6/22/21 5:13 PM, Andrew Jones wrote:
> On Tue, Jun 22, 2021 at 06:53:41PM +1000, Gavin Shan wrote:
>> On 6/3/21 2:48 PM, Gavin Shan wrote:
>>> On 6/2/21 9:36 PM, Andrew Jones wrote:
>>>> On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
>>>>> On 6/1/21 5:50 PM, Andrew Jones wrote:
>>>>>> On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
>>>>>>> We possibly populate empty nodes where memory isn't included and might
>>>>>>> be hot added at late time. The FDT memory nodes can't be created due
>>>>>>> to conflicts on their names if multiple empty nodes are specified.
>>>>>>> For example, the VM fails to start with the following error messages.
>>>>>>>
>>>>>>>      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
>>>>>>>      -accel kvm -machine virt,gic-version=host                        \
>>>>>>>      -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
>>>>>>>      -object memory-backend-ram,id=mem0,size=512M                     \
>>>>>>>      -object memory-backend-ram,id=mem1,size=512M                     \
>>>>>>>      -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
>>>>>>>      -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
>>>>>>>      -numa node,nodeid=2                                              \
>>>>>>>      -numa node,nodeid=3                                              \
>>>>>>>        :
>>>>>>>      -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
>>>>>>>
>>>>>>>      qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
>>>>>>>                           FDT_ERR_EXISTS
>>>>>>>
>>>>>>> This fixes the issue by using NUMA node ID or zero in the memory node
>>>>>>> name to avoid the conflicting memory node names. With this applied, the
>>>>>>> VM can boot successfully with above command lines.
>>>>>>>
>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>> ---
>>>>>>>     hw/arm/boot.c | 7 ++++++-
>>>>>>>     1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>>>>> index d7b059225e..3169bdf595 100644
>>>>>>> --- a/hw/arm/boot.c
>>>>>>> +++ b/hw/arm/boot.c
>>>>>>> @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>>>>>>>         char *nodename;
>>>>>>>         int ret;
>>>>>>> -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>>>>>>> +    if (numa_node_id >= 0) {
>>>>>>> +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
>>>>>>> +    } else {
>>>>>>> +        nodename = g_strdup("/memory@0");
>>>>>>> +    }
>>>>>>> +
>>>>>>>         qemu_fdt_add_subnode(fdt, nodename);
>>>>>>>         qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>>>>>>>         ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
>>
>> [...]
>>
>>>
>>> I've sent one separate mail to check with Rob Herring. Hopefully he have
>>> ideas as he is maintaining linux FDT subsystem. You have been included to
>>> that thread. I didn't find something meaningful to this thread after doing
>>> some google search either.
>>>
>>> Yes, I agree with you we need to follow the specification strictly. It seems
>>> it's uncertain about the 'physical memory map' bus binding requirements.
>>>
>>
>> I didn't get expected answers from device-tree experts.
> 
> What response did you get? Can you please provide a link to the discussion?
> 

Sorry about the confusion. I meant "no response" by "expected answers". Here
is the mail sent to Rob before, no reply so far:

https://lkml.org/lkml/2021/6/2/1446

>> After rethinking about it,
>> I plan to fix this like this way, but please let me know if it sounds sensible
>> to you.
>>
>> The idea is to assign a (not overlapped) dummy base address to each memory
>> node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
>> The 'length' of the 'reg' property in the device-tree nodes, corresponding
>> to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
>> until memory is added to these nodes.
>>
>> I had the temporary patch for the implementation. It works fine and VM can
>> boot up successfully.
> 
> I would like to be sure that the kernel developers for NUMA, memory
> hotplug, and devicetree specifications are all happy with the approach
> before adding it to QEMU.
> 

As I understood, it won't break anything from perspectives of NUMA
and device-tree specification. First of all, NUMA cares the so-called
distance map and 'numa-node-id' property in the individual device-tree
nodes. The device-tree specification doesn't say 'length' in 'reg'
property of memory node can't be zero. Also, the linux device-tree
implementation has the check on 'length', the memory block won't be
added if it's zero.

Documentation/devicetree/bindings/numa.txt has more details about
the required device-tree NUMA properties.

I'm not sure about memory hotplug. I tried memory hot add and it seems
working finely. Memory hot-add/remove are working without issues:

/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
-accel kvm -machine virt,gic-version=host               \
-cpu host -smp 4,sockets=2,cores=2,threads=1            \
-m 4096M,slots=16,maxmem=64G                            \
-object memory-backend-ram,id=mem0,size=2048M           \
-object memory-backend-ram,id=mem1,size=2048M           \
-numa node,nodeid=0,cpus=0-1,memdev=mem0                \
-numa node,nodeid=1,cpus=2-3,memdev=mem1                \
-numa node,nodeid=2                                     \
-numa node,nodeid=3
    :

Memory hot-add
===============

# cat /proc/meminfo  | grep MemTotal
MemTotal:        4027472 kB
# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
Node 2 MemTotal:       0 kB

(qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
(qemu) device_add pc-dimm,id=dimm0,memdev=hp-mem0,node=3

# cat /proc/meminfo  | grep MemTotal
MemTotal:        5076048 kB
# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
Node 2 MemTotal: 1048576 kB

Memory hot-remove
=================

(qemu) device_del dimm0
(qemu) object_del hp-mem0

# cat /proc/meminfo  | grep MemTotal
MemTotal:        4027472 kB
# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
cat: can't open '/sys/devices/system/node/node2/meminfo': No such file or directory

After this point, the memory can be added again without issues with
"object_add" and "device_add". So it sounds reasonable to remove
the empty NUMA node during memory hot-remove.

Thanks,
Gavin


