Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542484B663C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:35:50 +0100 (CET)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtJN-0002UV-Fx
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nJt3R-0000bu-8D
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nJt3N-0004T5-NM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644913155;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ9OuGoS/NA2Tzl6Uq1iqNJKWTyzkp/8xEHR9qHGdq4=;
 b=HFZlgPwRdeBiHn8tzIz7O7sJNHbHiKqpai9Dgj8bA3PwCGC4xdR46vLs1cdJ85+kGw3nvy
 iDFAS/1qFIqN4T3wDZ+sXwGz8hGCkfhwSM+4g6LUarzoJmUNBYd8ZLRKhNTo9TB097/1+C
 Qb7qHsnhEXl6aa/v8JMTxpxpJeKno5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-8nrmdEoAOay3HYZqvdcXNg-1; Tue, 15 Feb 2022 03:19:12 -0500
X-MC-Unique: 8nrmdEoAOay3HYZqvdcXNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E4DA2F26;
 Tue, 15 Feb 2022 08:19:10 +0000 (UTC)
Received: from [10.72.13.24] (ovpn-13-24.pek2.redhat.com [10.72.13.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFD8709E0;
 Tue, 15 Feb 2022 08:19:04 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <f5780366-7c6e-1643-d471-1304ce6584ca@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5c99b245-e118-f7bd-4a4f-2c865bacaa75@redhat.com>
Date: Tue, 15 Feb 2022 16:19:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <f5780366-7c6e-1643-d471-1304ce6584ca@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 3:05 PM, wangyanan (Y) via wrote
> On 2022/1/26 17:14, Igor Mammedov wrote:
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
>> >From migration point of view it looks fine to me, and doesn't need a compat knob
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
>> I'd like for ARM folks to confirm whether above is correct
>> (i.e. socket is NUMA node boundary and also if above topo vars
>> could have odd values. Don't look at horribly complicated x86
>> as example, but it showed that vendors could stash pretty much
>> anything there, so we should consider it here as well and maybe
>> forbid that in smp virt-arm parser)
> We now have a generic smp parser in machine-smp.c and it guarantees
> different machine boards a correct group of topo vars: supported topo
> vars being valid and value of unsupported ones being 1. I think it's safe
> to use them here. Or am I missing something else?
> 
> Also, we may not need to include "dies" here because it's not supported
> on ARM virt machine. I believe we will always have "ms->smp.dies==1"
> for this machine.
> 

I'm sorry for the delayed response because I'm just back from two weeks
holiday.

The issue isn't related to CPU topology directly. It's actually related
to the fact: the default NUMA node ID will be picked for one particular
CPU if the associated NUMA node ID isn't provided by users explicitly.
So it's related to the CPU-to-NUMA association.

For example, the CPU-to-NUMA association is breaking socket boundary
without the code change included in this patch when the guest is booted
with the command lines like below. With this patch applied, the CPU-to-NUMA
association is following socket boundary, to make Linux guest happy.

     -smp 6,sockets=2,cores=3,threads=1                      \
     -m 1024M,slots=16,maxmem=64G                            \
     -object memory-backend-ram,id=mem0,size=128M            \
     -object memory-backend-ram,id=mem1,size=128M            \
     -object memory-backend-ram,id=mem2,size=128M            \
     -object memory-backend-ram,id=mem3,size=128M            \
     -object memory-backend-ram,id=mem4,size=128M            \
     -object memory-backend-ram,id=mem4,size=384M            \
     -numa node,nodeid=0,memdev=mem0                         \
     -numa node,nodeid=1,memdev=mem1                         \
     -numa node,nodeid=2,memdev=mem2                         \
     -numa node,nodeid=3,memdev=mem3                         \
     -numa node,nodeid=4,memdev=mem4                         \
     -numa node,nodeid=5,memdev=mem5

     CPU     Core      Socket        NUMA-Node     NUA-Node-with-patch
     ------------------------------------------------------------------
      0       0          0             0           0
      1       1          0             1           0
      2       2          0             2           0
      3       0          1             3           1
      4       1          1             4           1
      5       2          1             5           1

I think it's fine to include "ms->smp.dies" here since it's always 1 on
virt machine. We needn't change the code once it's supported some day.

>>>   }
>>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)

Thanks,
Gavin


