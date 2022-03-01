Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827554C882A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:37:33 +0100 (CET)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOywl-00060x-Vf
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOyi8-0002IN-Ng
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:22:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOyi0-00023C-IZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s65g2l+jO3j2mkvKd26NY3QhKOHTHhSuqeJjhMuceU=;
 b=C7smzOtJO0+TiqdOUsZMGSJS+vcWLiX5xrXEAf/T/713hj2JYUae4qalbll8i1Zv2zyPca
 TlI90URC5wwAGdiZbdNyrX/L9y4zn2QG001l0RURrWxyUX52WWWt/NGLdQppiRzg9X8unS
 ol3a2BvO9C/5PZwLOfSa4F92ARzse4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-xpMQHoIQN1S5vK-xUuuMoQ-1; Tue, 01 Mar 2022 04:21:30 -0500
X-MC-Unique: xpMQHoIQN1S5vK-xUuuMoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E3D6835DE1;
 Tue,  1 Mar 2022 09:21:29 +0000 (UTC)
Received: from [10.72.13.86] (ovpn-13-86.pek2.redhat.com [10.72.13.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA1B82E5B;
 Tue,  1 Mar 2022 09:20:17 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Igor Mammedov <imammedo@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
Date: Tue, 1 Mar 2022 17:20:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220228100820.477e2311@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kraxel@redhat.com,
 Shan Gavin <shan.gavin@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 2/28/22 5:08 PM, Igor Mammedov wrote:
> On Mon, 28 Feb 2022 15:52:03 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> When the memory size on the first NUMA node is less than 128MB, the
>> guest hangs inside EDK2 as the following logs show.
>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64         \
>>    -accel kvm -machine virt,gic-version=host                       \
>>    -cpu host -smp 8,sockets=2,cores=2,threads=2                    \
>>    -m 1024M,slots=16,maxmem=64G                                    \
>>    -object memory-backend-ram,id=mem0,size=127M                    \
>>    -object memory-backend-ram,id=mem1,size=897M                    \
>>    -numa node,nodeid=0,memdev=mem0                                 \
>>    -numa node,nodeid=1,memdev=mem1                                 \
>>    -L /home/gavin/sandbox/qemu.main/build/pc-bios                  \
>>     :
>>    QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x47F00000 - 0x7FFFFFFF
>>    QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x40000000 - 0x47EFFFFF
>>    ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000
>>
>> This adds MachineClass::validate_numa_nodes() to validate the memory
>> size on the first NUMA node. The guest is stopped from booting and
>> the reason is given for this specific case.
> 
> Unless it architecturally wrong thing i.e. (node size less than 128Mb)
> ,in which case limiting it in QEMU would be justified, I'd prefer
> firmware being fixed or it reporting more useful for user error message.
>  

[include EDK2 developers]

I don't think 128MB node memory size is architecturally required.
I also thought EDK2 would be better place to provide a precise error
mesage and discussed it through with EDK2 developers. Lets see what
are their thoughts this time.
  
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c       | 9 +++++++++
>>   hw/core/numa.c      | 5 +++++
>>   include/hw/boards.h | 1 +
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 46bf7ceddf..234e7fca28 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2491,6 +2491,14 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>       return idx % ms->numa_state->num_nodes;
>>   }
>>   
>> +static void virt_validate_numa_nodes(MachineState *ms)
>> +{
>> +    if (ms->numa_state->nodes[0].node_mem < 128 * MiB) {
>> +        error_report("The first NUMA node should have at least 128MB memory");
>> +        exit(1);
> 
> perhaps error_fatal() would be better
> 

Yes, I think so :)

>> +    }
>> +}
>> +
>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>   {
>>       int n;
>> @@ -2836,6 +2844,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>       mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>       mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +    mc->validate_numa_nodes = virt_validate_numa_nodes;
>>       mc->kvm_type = virt_kvm_type;
>>       assert(!mc->get_hotplug_handler);
>>       mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 1aa05dcf42..543a2eaf11 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -724,6 +724,11 @@ void numa_complete_configuration(MachineState *ms)
>>               /* Validation succeeded, now fill in any missing distances. */
>>               complete_init_numa_distance(ms);
>>           }
>> +
>> +        /* Validate NUMA nodes for the individual machine */
>> +        if (mc->validate_numa_nodes) {
>> +            mc->validate_numa_nodes(ms);
>> +        }
>>       }
>>   }
>>   
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index c92ac8815c..9709a35eeb 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -282,6 +282,7 @@ struct MachineClass {
>>                                                            unsigned cpu_index);
>>       const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
>>       int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
>> +    void (*validate_numa_nodes)(MachineState *ms);
>>       ram_addr_t (*fixup_ram_size)(ram_addr_t size);
>>   };
>>   

Thanks,
Gavin


