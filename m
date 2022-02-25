Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8654C40FB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:11:16 +0100 (CET)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWd9-00046O-F1
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nNWAq-0003I8-Qw
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:42:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nNWAm-0004IN-Jx
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645778515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zz7vkMUGrmZh3ySnPeZRs2dwqJEAewplTTnX1ZX9vuM=;
 b=PXE+eyq/bHo32fTKKK+A8R8GnudY2RF8EkxMe2j9P+XU0h9N/ItSlUEXZ+0b38lzDBuVqp
 mXJIBOHz4b0PLF0e4Uy37x0hwA55fdbpyhwAaZW4CWoHKx79QIDojlOKdfQ/i5RPl3YlpS
 rPi0wkzahhTzx02RZv9r3VxFZ4vQzAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-FdhwJA9fNU6j-E-MytvzlQ-1; Fri, 25 Feb 2022 03:41:50 -0500
X-MC-Unique: FdhwJA9fNU6j-E-MytvzlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 195DD51B3;
 Fri, 25 Feb 2022 08:41:49 +0000 (UTC)
Received: from [10.72.12.101] (ovpn-12-101.pek2.redhat.com [10.72.12.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB1A5F930;
 Fri, 25 Feb 2022 08:41:45 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
Message-ID: <211c23f8-b5bd-219d-e584-20a0b700919d@redhat.com>
Date: Fri, 25 Feb 2022 16:41:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 2/17/22 10:14 AM, Gavin Shan wrote:
> On 1/26/22 5:14 PM, Igor Mammedov wrote:
>> On Wed, 26 Jan 2022 13:24:10 +0800
>> Gavin Shan <gshan@redhat.com> wrote:
>>
>>> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
>>> when it isn't provided explicitly. However, the CPU topology isn't fully
>>> considered in the default association and it causes CPU topology broken
>>> warnings on booting Linux guest.
>>>
>>> For example, the following warning messages are observed when the Linux guest
>>> is booted with the following command lines.
>>>
>>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>>    -accel kvm -machine virt,gic-version=host               \
>>>    -cpu host                                               \
>>>    -smp 6,sockets=2,cores=3,threads=1                      \
>>>    -m 1024M,slots=16,maxmem=64G                            \
>>>    -object memory-backend-ram,id=mem0,size=128M            \
>>>    -object memory-backend-ram,id=mem1,size=128M            \
>>>    -object memory-backend-ram,id=mem2,size=128M            \
>>>    -object memory-backend-ram,id=mem3,size=128M            \
>>>    -object memory-backend-ram,id=mem4,size=128M            \
>>>    -object memory-backend-ram,id=mem4,size=384M            \
>>>    -numa node,nodeid=0,memdev=mem0                         \
>>>    -numa node,nodeid=1,memdev=mem1                         \
>>>    -numa node,nodeid=2,memdev=mem2                         \
>>>    -numa node,nodeid=3,memdev=mem3                         \
>>>    -numa node,nodeid=4,memdev=mem4                         \
>>>    -numa node,nodeid=5,memdev=mem5
>>>           :
>>>    alternatives: patching kernel code
>>>    BUG: arch topology borken
>>>    the CLS domain not a subset of the MC domain
>>>    <the above error log repeats>
>>>    BUG: arch topology borken
>>>    the DIE domain not a subset of the NODE domain
>>>
>>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
>>> are associated with NODE#0 to NODE#5 separately. That's incorrect because
>>> CPU#0/1/2 should be associated with same NUMA node because they're seated
>>> in same socket.
>>>
>>> This fixes the issue by considering the socket when default CPU-to-NUMA
>>> is given. With this applied, no more CPU topology broken warnings are seen
>>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
>>> no CPUs associated with NODE#2/3/4/5.
>>
>>> From migration point of view it looks fine to me, and doesn't need a compat knob
>> since NUMA data (on virt-arm) only used to construct ACPI tables (and we don't
>> version those unless something is broken by it).
>>
>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 141350bf21..b4a95522d3 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>>   {
>>> -    return idx % ms->numa_state->num_nodes;
>>> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>>
>> I'd like for ARM folks to confirm whether above is correct
>> (i.e. socket is NUMA node boundary and also if above topo vars
>> could have odd values. Don't look at horribly complicated x86
>> as example, but it showed that vendors could stash pretty much
>> anything there, so we should consider it here as well and maybe
>> forbid that in smp virt-arm parser)
>>
> 
> After doing some investigation, I don't think the socket is NUMA node boundary.
> Unfortunately, I didn't find it's documented like this in any documents after
> checking device-tree specification, Linux CPU topology and NUMA binding documents.
> 
> However, there are two options here according to Linux (guest) kernel code:
> (A) socket is NUMA node boundary  (B) CPU die is NUMA node boundary. They are
> equivalent as CPU die isn't supported on arm/virt machine. Besides, the topology
> of one-to-one association between socket and NUMA node sounds natural and simplified.
> So I think (A) is the best way to go.
> 
> Another thing I want to explain here is how the changes affect the memory
> allocation in Linux guest. Taking the command lines included in the commit
> log as an example, the first two NUMA nodes are bound to CPUs while the other
> 4 NUMA nodes are regarded as remote NUMA nodes to CPUs. The remote NUMA node
> won't accommodate the memory allocation until the memory in the near (local)
> NUMA node becomes exhausted. However, it's uncertain how the memory is hosted
> if memory binding isn't applied.
> 
> Besides, I think the code should be improved like below to avoid overflow on
> ms->numa_state->num_nodes.
> 
>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
> -    return idx % ms->numa_state->num_nodes;
> +    int node_idx;
> +
> +    node_idx = idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +    return node_idx % ms->numa_state->num_nodes;
>   }
> 
> 

Kindly ping...

>>>   }
>>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>

Thanks,
Gavin


