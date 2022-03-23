Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F416A4E4B77
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 04:30:12 +0100 (CET)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWrhL-0002Rc-NM
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 23:30:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrdz-0008Lu-Bc
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrdv-0003R3-JV
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 23:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648005999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCiZ43v27uzAWVcOukl0ep+Hq/ITY1CMRj61K83M+hc=;
 b=ZzH9ZrdLoIFsVaGR7YsdpFeFr4pm3KFKsXRtcaMf7cid/dmG5m6IOZV3R59jVtI1LTcQ6y
 oXc3U4hDle1bz2LpjGad96H+FdfreoGRdSQM/a1Ht03pMFBOmXLQOBJ1CX3OdNNuMWJn8k
 wYtutdgovpvmJ43ZP1n+Q93rJfOIKes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-aNSh1I4IONKQ6XaGHy2usA-1; Tue, 22 Mar 2022 23:26:35 -0400
X-MC-Unique: aNSh1I4IONKQ6XaGHy2usA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0FA4811E75;
 Wed, 23 Mar 2022 03:26:34 +0000 (UTC)
Received: from [10.72.12.33] (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8CB2166B2D;
 Wed, 23 Mar 2022 03:26:29 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-2-gshan@redhat.com>
 <e894fe3a-a50e-f47f-773d-d859bc240923@huawei.com>
 <20220318105656.67696eb8@redhat.com>
 <5aea5611-0987-68cd-58d3-8ae53ec641e8@huawei.com>
 <20220318142723.142157c3@redhat.com>
 <e6efb1ca-08bb-fce5-de58-b8e2079880ca@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <477808a7-beec-2607-10f9-cb1bc8035467@redhat.com>
Date: Wed, 23 Mar 2022 11:26:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e6efb1ca-08bb-fce5-de58-b8e2079880ca@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
 qemu-devel@nongnu.org, zhenyzha@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan and Igor,

On 3/21/22 10:28 AM, wangyanan (Y) wrote:
> On 2022/3/18 21:27, Igor Mammedov wrote:
>> On Fri, 18 Mar 2022 21:00:35 +0800
>> "wangyanan (Y)" <wangyanan55@huawei.com> wrote:
>>> On 2022/3/18 17:56, Igor Mammedov wrote:
>>>> On Fri, 18 Mar 2022 14:23:34 +0800
>>>> "wangyanan (Y)" <wangyanan55@huawei.com> wrote:
>>>>> On 2022/3/3 11:11, Gavin Shan wrote:
>>>>>> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
>>>>>> when it isn't provided explicitly. However, the CPU topology isn't fully
>>>>>> considered in the default association and it causes CPU topology broken
>>>>>> warnings on booting Linux guest.
>>>>>>
>>>>>> For example, the following warning messages are observed when the Linux guest
>>>>>> is booted with the following command lines.
>>>>>>
>>>>>>      /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>>>>>      -accel kvm -machine virt,gic-version=host               \
>>>>>>      -cpu host                                               \
>>>>>>      -smp 6,sockets=2,cores=3,threads=1                      \
>>>>>>      -m 1024M,slots=16,maxmem=64G                            \
>>>>>>      -object memory-backend-ram,id=mem0,size=128M            \
>>>>>>      -object memory-backend-ram,id=mem1,size=128M            \
>>>>>>      -object memory-backend-ram,id=mem2,size=128M            \
>>>>>>      -object memory-backend-ram,id=mem3,size=128M            \
>>>>>>      -object memory-backend-ram,id=mem4,size=128M            \
>>>>>>      -object memory-backend-ram,id=mem4,size=384M            \
>>>>>>      -numa node,nodeid=0,memdev=mem0                         \
>>>>>>      -numa node,nodeid=1,memdev=mem1                         \
>>>>>>      -numa node,nodeid=2,memdev=mem2                         \
>>>>>>      -numa node,nodeid=3,memdev=mem3                         \
>>>>>>      -numa node,nodeid=4,memdev=mem4                         \
>>>>>>      -numa node,nodeid=5,memdev=mem5
>>>>>>             :
>>>>>>      alternatives: patching kernel code
>>>>>>      BUG: arch topology borken
>>>>>>      the CLS domain not a subset of the MC domain
>>>>>>      <the above error log repeats>
>>>>>>      BUG: arch topology borken
>>>>>>      the DIE domain not a subset of the NODE domain
>>>>>>
>>>>>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
>>>>>> are associated with NODE#0 to NODE#5 separately. That's incorrect because
>>>>>> CPU#0/1/2 should be associated with same NUMA node because they're seated
>>>>>> in same socket.
>>>>>>
>>>>>> This fixes the issue by populating the CPU topology in virt_possible_cpu_arch_ids()
>>>>>> and considering the socket index when default CPU-to-NUMA association is given
>>>>>> in virt_possible_cpu_arch_ids(). With this applied, no more CPU topology broken
>>>>>> warnings are seen from the Linux guest. The 6 CPUs are associated with NODE#0/1,
>>>>>> but there are no CPUs associated with NODE#2/3/4/5.
>>>>> It may be better to split this patch into two. One extends
>>>>> virt_possible_cpu_arch_ids,
>>>>> and the other fixes the numa node ID issue.
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>> ---
>>>>>>     hw/arm/virt.c | 17 ++++++++++++++++-
>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 46bf7ceddf..dee02b60fc 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>>>>>     static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>>>>>     {
>>>>>> -    return idx % ms->numa_state->num_nodes;
>>>>>> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
>>>>>> +
>>>>>> +    return socket_id % ms->numa_state->num_nodes;
>>>>>>     }
>>>>>>     static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>> @@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>         int n;
>>>>>>         unsigned int max_cpus = ms->smp.max_cpus;
>>>>>>         VirtMachineState *vms = VIRT_MACHINE(ms);
>>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>>>         if (ms->possible_cpus) {
>>>>>>             assert(ms->possible_cpus->len == max_cpus);
>>>>>> @@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>             ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>>>             ms->possible_cpus->cpus[n].arch_id =
>>>>>>                 virt_cpu_mp_affinity(vms, n);
>>>>>> +
>>>>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>>>> +        ms->possible_cpus->cpus[n].props.socket_id =
>>>>>> +            n / (ms->smp.dies * ms->smp.clusters *
>>>>>> +                ms->smp.cores * ms->smp.threads);
>>>>>> +        if (mc->smp_props.dies_supported) {
>>>>>> +            ms->possible_cpus->cpus[n].props.has_die_id = true;
>>>>>> +            ms->possible_cpus->cpus[n].props.die_id =
>>>>>> +                n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>>>>>> +        }
>>>>> I still don't think we need to consider dies if it's certainly not
>>>>> supported yet, IOW, we will never come into the if-branch.
>>>>> We are populating arm-specific topo info instead of the generic,
>>>>> we can probably uniformly update this part together with other
>>>>> necessary places when we decide to support dies for arm virt
>>>>> machine in the future. :)
>>>> it seems we do support dies and they are supposed to be numa boundary too,
>>>> so perhaps we should account for it when generating node-id.
>>> Sorry, I actually meant that we currently don't support dies for arm, so
>>> that
>>> we will always have "mc->smp_props.dies_supported == False" here, which
>>> makes the code a bit unnecessary.  dies are only supported for x86 for
>>> now. :)
>>>
>> then perhaps add an assert() here, so that we would notice and fix this
>> place when dies_supported becomes true.
> A simple assert() works here, I think.
> 

Ok. I will have the changes in v3. ms->smp.dies won't be included in
the calculation and assert(!mc->smp_props.clusters_supported) will be
added.

>>>>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>>>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>>>>>>             ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>>>>             ms->possible_cpus->cpus[n].props.thread_id = n;
>>>>>>         }
>>>>> Maybe we should use the same algorithm in x86_topo_ids_from_idx
>>>>> to populate the IDs, so that scope of socket-id will be [0, total_sockets),
>>>>> scope of thread-id is [0, threads_per_core), and so on. Then with a
>>>>> group of socket/cluster/core/thread-id, we determine a CPU.
>>>>>
>>>>> Suggestion: For the long term, is it necessary now to add similar topo
>>>>> info infrastructure for ARM, such as X86 TopoInfo, X86CPUTopoIDs,
>>>>> x86_topo_ids_from_idx?
>>>>>

It's a good idea, but I think it's something for future. Once
the die is supported, we may have generic mechanism to generate
the CPU topology based on its index or thread ID. It would be
nice if the mechanism can be shared by various architectures.

In the guest, which is booted with the given command lines in
the commit log, CPUs are associated with NUMA node#0/1 and
no CPUs are associated with node#2/3/4/5 after the patch is
applied on arm/virt machine. x86 has same behavior.

Thanks,
Gavin


