Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019164C87BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:20:21 +0100 (CET)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyg5-0005uv-Q4
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:20:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOyb3-00023e-Im
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOyb1-0007GV-1q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY1/5CU4VgE1NW1pow078coz1kNMXcagsEvDV6whPTI=;
 b=X10hnatJbqXeagtZ9tk9rU917if18K6EhFHVnXtdIMgTRzC7Su5HYXu22yURFFhUUA+a5b
 +lA/jQTna9PrD5ASTa5CGWL/QkNDMA7IShaRtadN+ulJalVqbQQjbv8WaKq2UZ76cA1CwI
 d24fCBxQk9en0LUBtgoWz+jxxcYU1x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-9jHGk5fWO-SQd4uDzlbVdw-1; Tue, 01 Mar 2022 04:14:59 -0500
X-MC-Unique: 9jHGk5fWO-SQd4uDzlbVdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B9D1091DA0;
 Tue,  1 Mar 2022 09:14:58 +0000 (UTC)
Received: from [10.72.13.86] (ovpn-13-86.pek2.redhat.com [10.72.13.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 403551038AC6;
 Tue,  1 Mar 2022 09:14:53 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: Igor Mammedov <imammedo@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
 <211c23f8-b5bd-219d-e584-20a0b700919d@redhat.com>
 <20220225110306.6c3e97a1@redhat.com>
 <6a520e47-e3ad-13a1-89f1-8d4213fb944a@redhat.com>
 <20220228115403.03e14446@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <7c0cc1c1-e94e-4d82-5ced-9f6e06d56e52@redhat.com>
Date: Tue, 1 Mar 2022 17:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220228115403.03e14446@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 2/28/22 6:54 PM, Igor Mammedov wrote:
> On Mon, 28 Feb 2022 12:26:53 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 2/25/22 6:03 PM, Igor Mammedov wrote:
>>> On Fri, 25 Feb 2022 16:41:43 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>> On 2/17/22 10:14 AM, Gavin Shan wrote:
>>>>> On 1/26/22 5:14 PM, Igor Mammedov wrote:
>>>>>> On Wed, 26 Jan 2022 13:24:10 +0800
>>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>>      
>>>>>>> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
>>>>>>> when it isn't provided explicitly. However, the CPU topology isn't fully
>>>>>>> considered in the default association and it causes CPU topology broken
>>>>>>> warnings on booting Linux guest.
>>>>>>>
>>>>>>> For example, the following warning messages are observed when the Linux guest
>>>>>>> is booted with the following command lines.
>>>>>>>
>>>>>>>      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>>>>>>      -accel kvm -machine virt,gic-version=host               \
>>>>>>>      -cpu host                                               \
>>>>>>>      -smp 6,sockets=2,cores=3,threads=1                      \
>>>>>>>      -m 1024M,slots=16,maxmem=64G                            \
>>>>>>>      -object memory-backend-ram,id=mem0,size=128M            \
>>>>>>>      -object memory-backend-ram,id=mem1,size=128M            \
>>>>>>>      -object memory-backend-ram,id=mem2,size=128M            \
>>>>>>>      -object memory-backend-ram,id=mem3,size=128M            \
>>>>>>>      -object memory-backend-ram,id=mem4,size=128M            \
>>>>>>>      -object memory-backend-ram,id=mem4,size=384M            \
>>>>>>>      -numa node,nodeid=0,memdev=mem0                         \
>>>>>>>      -numa node,nodeid=1,memdev=mem1                         \
>>>>>>>      -numa node,nodeid=2,memdev=mem2                         \
>>>>>>>      -numa node,nodeid=3,memdev=mem3                         \
>>>>>>>      -numa node,nodeid=4,memdev=mem4                         \
>>>>>>>      -numa node,nodeid=5,memdev=mem5
>>>>>>>             :
>>>>>>>      alternatives: patching kernel code
>>>>>>>      BUG: arch topology borken
>>>>>>>      the CLS domain not a subset of the MC domain
>>>>>>>      <the above error log repeats>
>>>>>>>      BUG: arch topology borken
>>>>>>>      the DIE domain not a subset of the NODE domain
>>>>>>>
>>>>>>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
>>>>>>> are associated with NODE#0 to NODE#5 separately. That's incorrect because
>>>>>>> CPU#0/1/2 should be associated with same NUMA node because they're seated
>>>>>>> in same socket.
>>>>>>>
>>>>>>> This fixes the issue by considering the socket when default CPU-to-NUMA
>>>>>>> is given. With this applied, no more CPU topology broken warnings are seen
>>>>>>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
>>>>>>> no CPUs associated with NODE#2/3/4/5.
>>>>>>      
>>>>>>>   From migration point of view it looks fine to me, and doesn't need a compat knob
>>>>>> since NUMA data (on virt-arm) only used to construct ACPI tables (and we don't
>>>>>> version those unless something is broken by it).
>>>>>>
>>>>>>      
>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>> ---
>>>>>>>     hw/arm/virt.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>> index 141350bf21..b4a95522d3 100644
>>>>>>> --- a/hw/arm/virt.c
>>>>>>> +++ b/hw/arm/virt.c
>>>>>>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>>>>>>     static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>>>>>>     {
>>>>>>> -    return idx % ms->numa_state->num_nodes;
>>>>>>> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>>>>>>
>>>>>> I'd like for ARM folks to confirm whether above is correct
>>>>>> (i.e. socket is NUMA node boundary and also if above topo vars
>>>>>> could have odd values. Don't look at horribly complicated x86
>>>>>> as example, but it showed that vendors could stash pretty much
>>>>>> anything there, so we should consider it here as well and maybe
>>>>>> forbid that in smp virt-arm parser)
>>>>>>      
>>>>>
>>>>> After doing some investigation, I don't think the socket is NUMA node boundary.
>>>>> Unfortunately, I didn't find it's documented like this in any documents after
>>>>> checking device-tree specification, Linux CPU topology and NUMA binding documents.
>>>>>
>>>>> However, there are two options here according to Linux (guest) kernel code:
>>>>> (A) socket is NUMA node boundary  (B) CPU die is NUMA node boundary. They are
>>>>> equivalent as CPU die isn't supported on arm/virt machine. Besides, the topology
>>>>> of one-to-one association between socket and NUMA node sounds natural and simplified.
>>>>> So I think (A) is the best way to go.
>>>>>
>>>>> Another thing I want to explain here is how the changes affect the memory
>>>>> allocation in Linux guest. Taking the command lines included in the commit
>>>>> log as an example, the first two NUMA nodes are bound to CPUs while the other
>>>>> 4 NUMA nodes are regarded as remote NUMA nodes to CPUs. The remote NUMA node
>>>>> won't accommodate the memory allocation until the memory in the near (local)
>>>>> NUMA node becomes exhausted. However, it's uncertain how the memory is hosted
>>>>> if memory binding isn't applied.
>>>>>
>>>>> Besides, I think the code should be improved like below to avoid overflow on
>>>>> ms->numa_state->num_nodes.
>>>>>
>>>>>     static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>>>>     {
>>>>> -    return idx % ms->numa_state->num_nodes;
>>>>> +    int node_idx;
>>>>> +
>>>>> +    node_idx = idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>>>>> +    return node_idx % ms->numa_state->num_nodes;
>>>
>>> using idx directly to deduce node looks a bit iffy
>>> take x86_get_default_cpu_node_id() as an example,
>>> it translates it uses idx to pick arch_id (APIC ID)
>>> which has topology encoded into it and than translates
>>> that to node boundary (pkg_id -> socket)
>>>
>>> Probably the same should happen here.
>>>
>>> PS:
>>> may be a little on tangent to the topic but chunk above
>>> mentions dies/clusters/cores/threads as possible attributes
>>> for CPUs but virt_possible_cpu_arch_ids() says that only
>>> has_thread_id = true
>>> are supported, which looks broken to me.
>>>    
>>
>> The x86's APIC ID, where the CPU topology is encoded, is something
>> ideal for arm/virt to follow here. With CPU topology embedded to
>> struct CPUArchId::arch_id, lots of ACPI tables like MADT, SRAT, PPTT
>> needs the corresponding update to expose it through "ACPI Processor UID"
>> field in those ACPI tables. It's much more than what we want to fix
>> the issue here because I don't see additional benefits to do it.
>>
>> Besides, the package or socket index is exactly determined by 'idx'
>> on arm/virt. The CPU topology is exposed through ACPI PPTT, depending on
>> ms->smp. The threads/cores/clusters/dies in the struct determines
>> the indexes of threads ('idx') who belongs to the same socket.
>>
>> Yes, the information maintained in ms->possible_cpus->cpu[i].props
>> is inconsistent to ms->smp. It means ms->possible_cpus->cpu[i].props.thread_id
>> is "CPU index" or "vcpu index", not "thread ID". Other fields like
>> sockets/dies/clusters/cores in ms->possible_cpus->cpu[i].props are
>> never used on arm/virt. However, the code changes included in this
>> patch to fix the broken CPU topology issue is still correct, or we
>> can enhance it like below in case 'has_socket_id' contains the correct
>> information in the future.
>>
>> static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>> {
>> -    return idx % ms->numa_state->num_nodes;
>> +    int socket_id;
>> +
>> +    if (ms->possible_cpus->cpus[idx].props.has_socket_id) {
>> +        socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
>> +    } else {
>> +        socket_id = idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>> +    }
>> +
>> +    return socket_id % ms->numa_state->num_nodes;
>> }
> 
> All of above points out, that we already have a bunch of scattered code
> that calculates topology in its own way every time.
> Piling more code duplication on top of that while generic way to do it
> exists, doesn't improve things at all. It just put burden of cleaning
> up after you on someone else.
> If it were the last day security/regression fix, it might be fine but
> as it is, the issue could be fixed in systematic way without adding
> more duplication.
> 
> So if you are reluctant to fix all already existing code, as minimum
> one could fix virt_possible_cpu_arch_ids() to initialize all current
> supported topology metadata once and then use it in
> virt_get_default_cpu_node_id() instead of old/new mix above.
> Cleanup of other places can be done incrementally by follow up patches.
> 

Thanks for your comments and continuous reviews. I will fix all the
discussed issues in v2, including to expose CPU topology through the
unified processor ID field in various ACPI tables. It's pointless to
calculate the topology and CPU-to-NUMA association in the scattered
codes.

>>>>>     }
>>>>>
>>>>>       
>>>>>>>     }
>>>>>>>     static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>      

Thanks,
Gavin


