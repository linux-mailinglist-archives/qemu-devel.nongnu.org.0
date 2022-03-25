Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A04E7A51
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 19:52:53 +0100 (CET)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXp3M-00078w-DK
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 14:52:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nXp0y-00068O-D6
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nXp0t-0006kU-7e
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 14:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648234214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcR+7NT/Lx0742AAvj6wG6FV4c+l9IB4ARNUoQ2U4n4=;
 b=EXZFYFi+cWHdOJgjfT2FXGmpGlrE0DxiLMoWAM6k6ZS049176nyNKdyKjztwTFqxKeDPlj
 rDkHV9IXWfWdj2GMiwD4jB3oYWz3hS3wst0gISgTI+mRoathKHv8eZ2/LBao3XHLewRJWW
 0a/ri6XAxLhzmqOeWT/YGLuiz+RWLPk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-KAyHncZWOeuiR4fq9Pz9gA-1; Fri, 25 Mar 2022 14:50:13 -0400
X-MC-Unique: KAyHncZWOeuiR4fq9Pz9gA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81796185A7A4;
 Fri, 25 Mar 2022 18:50:12 +0000 (UTC)
Received: from [10.72.12.33] (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D0E53C6;
 Fri, 25 Mar 2022 18:50:07 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
 <20220325141949.66fc0083@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e46061b3-cebf-c4be-758e-c465cf7879c1@redhat.com>
Date: Sat, 26 Mar 2022 02:49:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220325141949.66fc0083@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 3/25/22 9:19 PM, Igor Mammedov wrote:
> On Wed, 23 Mar 2022 15:24:35 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine yet. Besides, the cluster
>> ID for the given CPU is assigned because it has been supported
>> on arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c     | 11 +++++++++++
>>   qapi/machine.json |  6 ++++--
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..064eac42f7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>       int n;
>>       unsigned int max_cpus = ms->smp.max_cpus;
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>   
>>       if (ms->possible_cpus) {
>>           assert(ms->possible_cpus->len == max_cpus);
>> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            n / (ms->smp.cores * ms->smp.threads);
> 
> are there any relation cluster values here and number of clusters with
> what virt_cpu_mp_affinity() calculates?
> 

They're different clusters. The cluster returned by virt_cpu_mp_affinity()
is reflected to MPIDR_EL1 system register, which is mainly used by VGIC2/3
interrupt controller to send send group interrupts to the CPU cluster. It's
notable that the value returned from virt_cpu_mp_affinity() is always
overrided by KVM. It means this value is only used by TCG for the emulated
GIC2/GIC3.

The cluster in 'ms->possible_cpus' is passed to ACPI PPTT table to populate
the CPU topology.


>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
> 
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>           ms->possible_cpus->cpus[n].props.thread_id = n;
> of cause target has the right to decide how to allocate IDs, and mgmt
> is supposed to query these IDs before using them.
> But:
>   * IDs within 'props' are supposed to be arch defined.
>     (on x86 IDs in range [0-smp.foo_id), on ppc it something different)
>     Question is what real hardware does here in ARM case (i.e.
>     how .../cores/threads are described on bare-metal)?
>  

On ARM64 bare-metal machine, the core/cluster ID assignment is pretty arbitrary.
I checked the CPU topology on my bare-metal machine, which has following SMP
configurations.

     # lscpu
       :
     Thread(s) per core: 4
     Core(s) per socket: 28
     Socket(s):          2

     smp.sockets  = 2
     smp.clusters = 1
     smp.cores    = 56   (28 per socket)
     smp.threads  = 4

     // CPU0-111 belongs to socket0 or package0
     // CPU112-223 belongs to socket1 or package1
     # cat /sys/devices/system/cpu/cpu0/topology/package_cpus
     00000000,00000000,00000000,0000ffff,ffffffff,ffffffff,ffffffff
     # cat /sys/devices/system/cpu/cpu111/topology/package_cpus
     00000000,00000000,00000000,0000ffff,ffffffff,ffffffff,ffffffff
     # cat /sys/devices/system/cpu/cpu112/topology/package_cpus
     ffffffff,ffffffff,ffffffff,ffff0000,00000000,00000000,00000000
     # cat /sys/devices/system/cpu/cpu223/topology/package_cpus
     ffffffff,ffffffff,ffffffff,ffff0000,00000000,00000000,00000000

     // core/cluster ID spans from 0 to 27 on socket0
     # for i in `seq 0 27`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
     # for i in `seq 28 55`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
     # for i in `seq 0 27`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
     # for i in `seq 28 55`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
     
     // However, core/cluster ID starts from 256 on socket1
     # for i in `seq 112 139`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
     256 257 258 259 260 261 262 263 264 265 266 267 268 269
     270 271 272 273 274 275 276 277 278 279 280 281 282 283
     # for i in `seq 140 167`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
     256 257 258 259 260 261 262 263 264 265 266 267 268 269
     270 271 272 273 274 275 276 277 278 279 280 281 282 283
     # for i in `seq 112 139`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
     256 257 258 259 260 261 262 263 264 265 266 267 268 269
     270 271 272 273 274 275 276 277 278 279 280 281 282 283
     # for i in `seq 140 167`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
     256 257 258 259 260 261 262 263 264 265 266 267 268 269
     270 271 272 273 274 275 276 277 278 279 280 281 282 283
    
>   * maybe related: looks like build_pptt() and build_madt() diverge on
>     the meaning of 'ACPI Processor ID' and how it's generated.
>     My understanding of 'ACPI Processor ID' is that it should match
>     across all tables. So UIDs generated in build_pptt() look wrong to me.
> 
>   * maybe related: build_pptt() looks broken wrt core/thread where it
>     may create at the same time a  leaf core with a leaf thread underneath it,
>     is such description actually valid?
> 

Yes, the UIDs in MADT/PPTT should match. I'm not sure if I missed anything here.
I don't see how the UID in MADT and PPTT table are diverged. In both functions,
'thread_id' is taken as UID.

In build_pptt(), when the entries for the cores becomes leaf, nothing will be
pushed into @list, @length becomes zero for the loop to create entries for
the threads. In this case, we won't have any entries created for threads.

> 
>>       }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..99c945f258 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to
>> +# @core-id: core number within cluster the CPU belongs to
> 
> s:cluster:cluster/die:
> 

Ok. I will amend it like below in next respin:

     # @core-id: core number within cluster/die the CPU belongs to

I'm not sure if we need make similar changes for 'cluster_id' like below?

    # @cluster-id: cluster number within die/socket the CPU belongs to
                                         ^^^^^^^^^^

>>   # @thread-id: thread number within core the CPU belongs to
>>   #
>> -# Note: currently there are 5 properties that could be present
>> +# Note: currently there are 6 properties that could be present
>>   #       but management should be prepared to pass through other
>>   #       properties with device_add command to allow for future
>>   #       interface extension. This also requires the filed names to be kept in
>> @@ -883,6 +884,7 @@
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*cluster-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }

Thanks,
Gavin


