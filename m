Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C4399829
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 04:48:14 +0200 (CEST)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lodP3-0005bg-7T
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 22:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lodOG-0004jk-8D
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 22:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lodO7-0008HA-SV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 22:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622688432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6Q72O726VvpueMtyVLYMyFL2oyboTiE5pP86t/3D3U=;
 b=gBNJCOFad4SQ6c9REnC0zRa/fGiLFuUeA/if/D+l4KplpZzQpbl+u1DMZM7kRkacJlcSyV
 DIu3XGZ3YJ28yUCct4geNgpLmAUaapUs77PtfjZCIgQsZZgPPUQxbmnnVnPIfJvTnQOKNY
 GBBFItLqGz8X9I+2NM4g8OI6iprPJCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-UVW6FRJSMT6h7GZGg_IOUw-1; Wed, 02 Jun 2021 22:47:10 -0400
X-MC-Unique: UVW6FRJSMT6h7GZGg_IOUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB4F80DE00;
 Thu,  3 Jun 2021 02:47:09 +0000 (UTC)
Received: from [10.64.54.205] (vpn2-54-205.bne.redhat.com [10.64.54.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93A4F1037EBF;
 Thu,  3 Jun 2021 02:47:00 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
To: Andrew Jones <drjones@redhat.com>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
Date: Thu, 3 Jun 2021 14:48:03 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20210602113642.axaxxgnw2haghas4@gator.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 6/2/21 9:36 PM, Andrew Jones wrote:
> On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
>> On 6/1/21 5:50 PM, Andrew Jones wrote:
>>> On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
>>>> We possibly populate empty nodes where memory isn't included and might
>>>> be hot added at late time. The FDT memory nodes can't be created due
>>>> to conflicts on their names if multiple empty nodes are specified.
>>>> For example, the VM fails to start with the following error messages.
>>>>
>>>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
>>>>     -accel kvm -machine virt,gic-version=host                        \
>>>>     -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
>>>>     -object memory-backend-ram,id=mem0,size=512M                     \
>>>>     -object memory-backend-ram,id=mem1,size=512M                     \
>>>>     -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
>>>>     -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
>>>>     -numa node,nodeid=2                                              \
>>>>     -numa node,nodeid=3                                              \
>>>>       :
>>>>     -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
>>>>
>>>>     qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
>>>>                          FDT_ERR_EXISTS
>>>>
>>>> This fixes the issue by using NUMA node ID or zero in the memory node
>>>> name to avoid the conflicting memory node names. With this applied, the
>>>> VM can boot successfully with above command lines.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/boot.c | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>> index d7b059225e..3169bdf595 100644
>>>> --- a/hw/arm/boot.c
>>>> +++ b/hw/arm/boot.c
>>>> @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>>>>        char *nodename;
>>>>        int ret;
>>>> -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>>>> +    if (numa_node_id >= 0) {
>>>> +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
>>>> +    } else {
>>>> +        nodename = g_strdup("/memory@0");
>>>> +    }
>>>> +
>>>>        qemu_fdt_add_subnode(fdt, nodename);
>>>>        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>>>>        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
>>
>> [...]
>>
>>>
>>> Is it conventional to use the unit-address like this? If so, can you point
>>> out where that's documented? If it's not conventional, then we shouldn't
>>> do it. And then I'm not sure what we should do in this case. Here's a
>>> couple links I found, but they don't really help...
>>>
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#sect-node-names
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#memory-node
>>>
>>
>> As stated in the document (section 2.2.1.1). It's conventional to take the first
>> address of 'reg' property as unit-address, but it's not mandatory as I understand:
>>
>> (1) In section 2.2.1.1, the bus can specify additional format to unit-address.
> 
> The bus type we're using is the physical memory map. Does it allow this
> use of the unit-address? I still haven't seen that documented anywhere.
> 
>> (2) The device node name isn't used to identify the device node in Linux kernel.
>>      They are actually identified by 'device_type' property.
>>      (drivers/of/fdt.c::early_init_dt_scan_memory())
> 
> This doesn't matter. We can't change DT node name formats just because
> they may not impact Linux. We need to follow the DT standard and the Linux
> convention.
> 
>>
>> I think it's still nice to include the unit-address in meory node's name. For the
>> conflicting nodes, we add more suffix like below. I can update the code in v2 if
>> it's preferred way to go.
> 
> I don't think we should change the semantics of the unit address at all,
> not without either a) finding a document that says our use is OK or b)
> getting it documented in the Linux kernel first.
> 

[...]

I've sent one separate mail to check with Rob Herring. Hopefully he have
ideas as he is maintaining linux FDT subsystem. You have been included to
that thread. I didn't find something meaningful to this thread after doing
some google search either.

Yes, I agree with you we need to follow the specification strictly. It seems
it's uncertain about the 'physical memory map' bus binding requirements.

Thanks,
Gavin


