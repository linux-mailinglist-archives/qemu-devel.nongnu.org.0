Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E076A42B03F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 01:33:55 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maRHO-00036d-Ds
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 19:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maRG8-0002F5-KX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 19:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maRG4-0003YQ-I9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 19:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634081548;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Hf45gFSTC73WPjDgKzM5hCKE5YWtEaNeo4yaOhgCsc=;
 b=gnUCQMJeJeIMndzNQC8OUeRvmbhBoZ/plvZvuR5UKAlVvwdx4Q0pLf6LrBztkr58OYDXH7
 3mXnVOPD6ftJX3BA+UXKu17eqephGp7SYwzPzKgLRZc7A/rDHk8HJS7hErowykq8T2ucXA
 YpYPJKIl088Y9T6z5XgICGVx2XKMV1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-4RZxkS1VPGS09SmpRRYTsw-1; Tue, 12 Oct 2021 19:32:25 -0400
X-MC-Unique: 4RZxkS1VPGS09SmpRRYTsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EAEE801A93;
 Tue, 12 Oct 2021 23:32:24 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE02257CA2;
 Tue, 12 Oct 2021 23:32:20 +0000 (UTC)
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
To: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com> <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
 <20211012142754.1c4e5071@redhat.com> <20211012131308.45j7ofd4xwk42epv@gator>
 <20211012155321.256e8867@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <eed6bdaf-e52e-0bc6-7669-7a65e75a4b08@redhat.com>
Date: Wed, 13 Oct 2021 10:32:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211012155321.256e8867@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: robh@kernel.org, ehabkost@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 10/13/21 12:53 AM, Igor Mammedov wrote:
> On Tue, 12 Oct 2021 15:13:08 +0200
> Andrew Jones <drjones@redhat.com> wrote: 
>> On Tue, Oct 12, 2021 at 02:27:54PM +0200, Igor Mammedov wrote:
>>> On Tue, 12 Oct 2021 12:37:54 +0200
>>> Andrew Jones <drjones@redhat.com> wrote:   
>>>> On Tue, Oct 12, 2021 at 11:40:16AM +0200, Igor Mammedov wrote:
>>>>> On Wed,  6 Oct 2021 18:22:08 +0800
>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>      
>>>>>> The following option is used to specify the distance map. It's
>>>>>> possible the option isn't provided by user. In this case, the
>>>>>> distance map isn't populated and exposed to platform. On the
>>>>>> other hand, the empty NUMA node, where no memory resides, is
>>>>>> allowed on ARM64 virt platform. For these empty NUMA nodes,
>>>>>> their corresponding device-tree nodes aren't populated, but
>>>>>> their NUMA IDs should be included in the "/distance-map"
>>>>>> device-tree node, so that kernel can probe them properly if
>>>>>> device-tree is used.
>>>>>>
>>>>>>    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>>>
>>>>>> So when user doesn't specify distance map, we need to generate
>>>>>> the default distance map, where the local and remote distances
>>>>>> are 10 and 20 separately. This adds an extra parameter to the
>>>>>> exiting complete_init_numa_distance() to generate the default
>>>>>> distance map for this case.
>>>>>>
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>
>>>>>
>>>>> how about error-ing out if distance map is required but
>>>>> not provided by user explicitly and asking user to fix
>>>>> command line?
>>>>>
>>>>> Reasoning behind this that defaults are hard to maintain
>>>>> and will require compat hacks and being raod blocks down
>>>>> the road.
>>>>> Approach I was taking with generic NUMA code, is deprecating
>>>>> defaults and replacing them with sanity checks, which bail
>>>>> out on incorrect configuration and ask user to correct command line.
>>>>> Hence I dislike approach taken in this patch.
>>>>>
>>>>> If you really wish to provide default, push it out of
>>>>> generic code into ARM specific one
>>>>> (then I won't oppose it that much (I think PPC does
>>>>> some magic like this))
>>>>> Also behavior seems to be ARM specific so generic
>>>>> NUMA code isn't a place for it anyways
>>>>
>>>> The distance-map DT node and the default 10/20 distance-map values
>>>> aren't arch-specific. RISCV is using it too.
>>>>
>>>> I'm on the fence with this. I see erroring-out to require users
>>>> to provide explicit command lines as a good thing, but I also
>>>> see it as potentially an unnecessary burden for those that want
>>>> the default map anyway. The optional nature of the distance-map
>>>> node and the specification of the default map is here [1]
>>>>
>>>> [1] Linux source: Documentation/devicetree/bindings/numa.txt
>>>
>>> Looking at proposed linux patches [ https://lkml.org/lkml/2021/9/27/31 ],
>>> using optional distance table as source for numa-node-ids,
>>> looks like a hack around kernel's inability to fish them out
>>> from CPU &| PCI nodes (using those nodes as source should
>>> cover memory-less node use-case).
>>>
>>> I consider including optional node as a policy decision.
>>> So user shall include it explicitly on QEMU command line
>>> if necessary (that works just fine for x86), or guest OS
>>> can make up defaults on its own in absence of data.
>>
>> OK, so erroring-out on configs that must provide distance-maps, rather
>> than automatically generating them for all configs is better.
>>
>>>    
>>>> So, my r-b stands for this patch, but I also wouldn't complain
>>>> about respinning it to error out instead.
>>>    
>>>> I would complain about
>>>> moving the logic to Arm specific code, though, since RISCV would
>>>> then need to duplicate it.
>>>
>>> Instead of putting workaround in QEMU and then making them generic,
>>> I'd prefer to:
>>>   1. make QEMU to be able generate DT with memory-less nodes
>>
>> How? DT syntax doesn't allow this, because each node needs a unique
>> name which is derived from its base address, which an empty numa
> you are talking about memory@foo nodes, aren't you?
> 
>> node doesn't have.
> 
> Looking at Documentation/devicetree/bindings/numa.txt
> 
> mem/cpu/pci nodes also contain numa-node-id attribute,
> so idea is to collect IDs from all present sources
> instead of abusing distance map.
>   
> That would allow QEMU to skip memory@foo elements for
> memory-less nodes because they obviously do not exist
> and there is no way to describe them using 'memory' nodes.
> 

I don't think it's feasible because it's hard to elaborate NUMA node IDs
from this sort of sources. Apart from mem/cpu/pci, the NUMA node IDs
can be included into platform devices, which could be vendor specific
sometimes. Other type of devices, which I don't know, could include
NUMA node IDs either.

Besides, things become more complicated when hotplug is considered.
For example, the hot-added CPU is associated with a non-existing
NUMA node. The CPU hot-add fails until the associated NUMA node
is initialized. This means CPU/mem hotplug have to be twisted.

So the point is to elaborate the NUMA node IDs from the limited
source: mem/cpu/distance-map. The distance-map is optional in
current Linux implementation.

>>>   2. fix guest to get numa-node-id from CPU/PCI nodes if
>>>      memory node isn't present,
>>
>> I'm not sure that's possible with DT. If it is, then proposing it
>> upstream to Linux DT maintainers would be the next step.
> Added Rob to CC.
> 

As explained above.

>>
>>> or use ACPI tables which can
>>>      describe memory-less NUMA nodes if fixing how DT is
>>>      parsed unfeasible.
>>
>> We use ACPI already for our guests, but we also generate a DT (which
>> edk2 consumes). We can't generate a valid DT when empty numa nodes
> does edk2 actually uses numa info from QEMU?
> 
>> are put on the command line unless we follow a DT spec saying how
>> to do that. The current spec says we should have a distance-map
>> that contains those nodes.
> 
> can you point out to the spec and place within it, pls?
>

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20211012&id=58ae0b51506802713aa0e9956d1853ba4c722c98
("Documentation, dt, numa: Add note to empty NUMA node")

Thanks,
Gavin


