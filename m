Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2EF69EB5A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcE9-0006mb-Ib; Tue, 21 Feb 2023 18:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUcE7-0006lf-Nh
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUcE5-00052h-Fl
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677022751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hg3oCIWr5UZoAU201d6kZrgeChKADl8g76TDmLEic5Y=;
 b=JkO11ZV0YbCeVsVNHjrOQG0EKhwsQiVsg894HaRt/5P/6rrdGoAzJuNDV20yK3r2ioR59u
 hJNsyPvNRGfa/Wi3iwnIzdhDpHUBq7ASlcpysuokb+QTeoTH1+nexb6oyoKdglyZyQZ1vW
 iMr0DkahyUQ7kHC4JMf3nnkQvQwjiqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-c14ngFAAMoyAYjZlv-S7JA-1; Tue, 21 Feb 2023 18:39:08 -0500
X-MC-Unique: c14ngFAAMoyAYjZlv-S7JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4087802D2F;
 Tue, 21 Feb 2023 23:39:07 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE88B440D9;
 Tue, 21 Feb 2023 23:39:01 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
 <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
 <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
 <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
 <d49eb549-9a8f-ad31-9836-cfd7dac78be6@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5cade5f0-edbd-5d9a-c6d5-e2cb2f73b3b5@redhat.com>
Date: Wed, 22 Feb 2023 10:38:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d49eb549-9a8f-ad31-9836-cfd7dac78be6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/22/23 10:31 AM, Philippe Mathieu-Daudé wrote:
> On 22/2/23 00:12, Gavin Shan wrote:
>> On 2/21/23 9:21 PM, Philippe Mathieu-Daudé wrote:
>>> On 21/2/23 10:21, Gavin Shan wrote:
>>>> On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 21/2/23 09:53, Gavin Shan wrote:
>>>>>> Linux kernel guest reports warning when two CPUs in one socket have
>>>>>> been associated with different NUMA nodes, using the following command
>>>>>> lines.
>>>>>>
>>>>>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>>>>
>>>>>>    ------------[ cut here ]------------
>>>>>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>>>>>>    Modules linked in:
>>>>>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>>>>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>    pc : build_sched_domains+0x284/0x910
>>>>>>    lr : build_sched_domains+0x184/0x910
>>>>>>    sp : ffff80000804bd50
>>>>>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>>>>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>>>>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>>>>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>>>>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>>>>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>>>>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>>>>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>>>>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>>>>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>>>>>    Call trace:
>>>>>>     build_sched_domains+0x284/0x910
>>>>>>     sched_init_domains+0xac/0xe0
>>>>>>     sched_init_smp+0x48/0xc8
>>>>>>     kernel_init_freeable+0x140/0x1ac
>>>>>>     kernel_init+0x28/0x140
>>>>>>     ret_from_fork+0x10/0x20
>>>>>>
>>>>>> Fix it by preventing mutiple CPUs in one socket to be associated with
>>>>>> different NUMA nodes.
>>>>>>
>>>>>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>> ---
>>>>>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>>>>>   1 file changed, 37 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index ac626b3bef..e0af267c77 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>>>>>       return false;
>>>>>>   }
>>>>>> +static bool numa_state_valid(MachineState *ms)
>>>>>> +{
>>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>>>> +    NumaState *state = ms->numa_state;
>>>>>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
>>>>>> +    const CPUArchId *cpus = possible_cpus->cpus;
>>>>>> +    int len = possible_cpus->len, i, j;
>>>>>> +
>>>>>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>>>>>> +        return true;
>>>>>> +    }
>>>>>> +
>>>>>> +    for (i = 0; i < len; i++) {
>>>>>> +        for (j = i + 1; j < len; j++) {
>>>>>> +            if (cpus[i].props.has_socket_id &&
>>>>>> +                cpus[i].props.has_node_id &&
>>>>>> +                cpus[j].props.has_socket_id &&
>>>>>> +                cpus[j].props.has_node_id &&
>>>>>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>>>>>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>>>>>> +                error_report("CPU-%d and CPU-%d in socket-%ld have been "
>>>>>> +                             "associated with node-%ld and node-%ld",
>>>>>> +                             i, j, cpus[i].props.socket_id,
>>>>>> +                             cpus[i].props.node_id,
>>>>>> +                             cpus[j].props.node_id);
>>>>>> +                return false;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return true;
>>>>>> +}
>>>>>> +
>>>>>>   static void create_randomness(MachineState *ms, const char *node)
>>>>>>   {
>>>>>>       struct {
>>>>>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
>>>>>>           exit(1);
>>>>>>       }
>>>>>> +    if (!numa_state_valid(machine)) {
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>
>>>>> Why restrict to the virt machine?
>>>>>
>>>>
>>>> We tried x86 machines and virt machine, but the issue isn't reproducible on x86 machines.
>>>> So I think it's machine or architecture specific issue. However, I believe RiscV should
>>>> have similar issue because linux/drivers/base/arch_topology.c is shared by ARM64 and RiscV.
>>>> x86 doesn't use the driver to populate its CPU topology.
>>>
>>> Oh, I haven't thought about the other archs, I meant this seem a generic
>>> issue which affects all (ARM) machines, so why restrict to the (ARM)
>>> virt machine?
>>>
>>
>> [Ccing Igor for comments]
>>
>> Well, virt machine is the only concern to us for now. You're right that all ARM64 and ARM machines
>> need this check and limitation. So the check needs to be done in the generic path. The best way
>> I can figure out is like something below. The idea is to introduce a switch to 'struct NumaState'
>> and do the check in the generic path. The switch is turned on by individual machines. Please let me
>> know if you have better ideas
> 
> Can't this be done generically in machine_numa_finish_cpu_init()
> -> numa_validate_initiator()?
> 

Yes, machine_numa_finish_cpu_init() is better place, before numa_validate_initiator().

>> - Add 'bool struct NumaState::has_strict_socket_mapping', which is 'false' by default until
>>    machine specific initialization function calls helper set_numa_strict_socket_mapping(), for
>>    example in hw/arm/virt.c::virt_instance_init().
>>
>> - In numa_complete_configuration(), do the check to make sure the socket doesn't cross over
>>    the NUMA node boundary if 'bool struct NumaState::has_strict_socket_mapping' is true.
>>

Thanks,
Gavin


