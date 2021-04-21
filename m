Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC236656F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 08:29:02 +0200 (CEST)
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ6M9-0007fW-Gu
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 02:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lZ6KP-0006ln-Oc
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:27:13 -0400
Received: from mga05.intel.com ([192.55.52.43]:46589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lZ6KL-00010B-O9
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:27:13 -0400
IronPort-SDR: RRmBuUT+Pomv2ZwTRMwh5xQ79Gfc/JTLi2HW5VVY7LId2kcA/zXYF/GMX/fUnolS1llj8HQVRp
 DjjfBt+d4PCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280976786"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="280976786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 23:26:57 -0700
IronPort-SDR: qh8A3lMdEsu80nBqIuhi7EnNo1MADFezcyjoq1Y7SnXoDvuPnGoaIpBcpVUiXC5Dc0K7gEpq5l
 0SGOi9zibMeA==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="427398190"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.120])
 ([10.238.0.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 23:26:56 -0700
Subject: Re: [PATCH v2] i386: Add ratelimit for bus locks acquired in guest
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210420093736.17613-1-chenyi.qiang@intel.com>
 <20210420163417.lbns24ypfqz7icxg@habkost.net>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <df860e12-cea5-3d88-ba16-0dd1f8f975cb@intel.com>
Date: Wed, 21 Apr 2021 14:26:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420163417.lbns24ypfqz7icxg@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chenyi.qiang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Eduardo, thanks for your comments!


On 4/21/2021 12:34 AM, Eduardo Habkost wrote:
> Hello,
> 
> Thanks for the patch.  Comments below:
> 
> On Tue, Apr 20, 2021 at 05:37:36PM +0800, Chenyi Qiang wrote:
>> Virtual Machines can exploit bus locks to degrade the performance of
>> system. To address this kind of performance DOS attack, bus lock VM exit
>> is introduced in KVM and it will report the bus locks detected in guest,
>> which can help userspace to enforce throttling policies.
>>
> 
> Is there anything today that would protect the system from
> similar attacks from userspace with access to /dev/kvm?
> 

I can't fully understand your meaning for "similar attack with access to 
/dev/kvm". But there are some similar associated detection features on 
bare metal.

1. Split lock 
detection:https://lore.kernel.org/lkml/158031147976.396.8941798847364718785.tip-bot2@tip-bot2/
Some CPUs can raise an #AC trap when a split lock is attempted.

2. Bus lock Debug Exception: 
https://lore.kernel.org/lkml/20210322135325.682257-1-fenghua.yu@intel.com/
The kernel can be notified by an #DB trap after a user instruction 
acquires a bus lock and is executed.

> 
>> The availability of bus lock VM exit can be detected through the
>> KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
>> policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
>> bitmap is the only supported strategy at present. It indicates that KVM
>> will exit to userspace to handle the bus locks.
>>
>> This patch adds a ratelimit on the bus locks acquired in guest as a
>> mitigation policy.
>>
>> Introduce a new field "bld" to record the limited speed of bus locks in
>> target VM. The user can specify it through the "bus-lock-detection"
>> as a machine property. In current implementation, the default value of
>> the speed is 0 per second, which means no restriction on the bus locks.
>>
>> Ratelimit enforced in data transmission uses a time slice of 100ms to
>> get smooth output during regular operations in block jobs. As for
>> ratelimit on bus lock detection, simply set the ratelimit interval to 1s
>> and restrict the quota of bus lock occurrence to the value of "bld". A
>> potential alternative is to introduce the time slice as a property
>> which can help the user achieve more precise control.
>>
>> The detail of Bus lock VM exit can be found in spec:
>> https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html
>>
>> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
>>
>> ---
>> Changes from RFC v1:
>>    - Remove the rip info output, as the rip can't reflect the bus lock
>>      position correctly.
>>    - RFC v1: https://lore.kernel.org/qemu-devel/20210317084709.15605-1-chenyi.qiang@intel.com/
>> ---
>>   hw/i386/x86.c         |  6 ++++++
>>   include/hw/i386/x86.h |  7 +++++++
>>   target/i386/kvm/kvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 55 insertions(+)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index ed796fe6ba..42d10857a6 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1256,6 +1256,12 @@ static void x86_machine_initfn(Object *obj)
>>       x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
>>       x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>>       x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>> +    x86ms->bld = 0;
>> +
>> +    object_property_add_uint64_ptr(obj, "bus-lock-detection",
>> +                                   &x86ms->bld, OBJ_PROP_FLAG_READWRITE);
>> +    object_property_set_description(obj, "bus-lock-detection",
>> +            "Bus lock detection ratelimit");
> 
> I suggest using a name that indicates this is a rate limit (e.g.
> "bus-lock-rate-limit").  "bus-lock-detection" sounds like a
> boolean option to just enable/disable detection.
> 

Fair enough.

> Please register a class property at x86_machine_class_init()
> instead.  The plan is to eventually stop using instance
> properties wherever possible, as class properties make property
> introspection simpler.
> 
> See machine_class_init() for some examples of integer class
> properties.  Unfortunately object_class_property_add_uint64_ptr()
> is not very useful currently, so you'll need to write your own
> getter/setter function.
> 

Yeah, will do the change.

> 
>>   }
>>   
>>   static void x86_machine_class_init(ObjectClass *oc, void *data)
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index c09b648dff..d6e198b228 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -74,6 +74,13 @@ struct X86MachineState {
>>        * will be translated to MSI messages in the address space.
>>        */
>>       AddressSpace *ioapic_as;
>> +
>> +    /*
>> +     * ratelimit enforced on detected bus locks, the default value
>> +     * is 0 per second
>> +     */
> 
> I suggest documenting here that 0 means no limit.
> 
>> +    uint64_t bld;
>> +    RateLimit bld_limit;
>>   };
>>   
>>   #define X86_MACHINE_SMM              "smm"
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 7fe9f52710..a75fac0404 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -130,6 +130,8 @@ static bool has_msr_mcg_ext_ctl;
>>   static struct kvm_cpuid2 *cpuid_cache;
>>   static struct kvm_msr_list *kvm_feature_msrs;
>>   
>> +#define SLICE_TIME 1000000000ULL /* ns */
>> +
> 
> "slice time" is a very generic name.  I suggest "BLD_SLICE_TIME"
> or "BUS_LOCK_SLICE_TIME".
> 

Make sense. I'll change to use the BUS_LOCK_SLICE_TIME.

>>   int kvm_has_pit_state2(void)
>>   {
>>       return has_pit_state2;
>> @@ -2267,6 +2269,27 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>           }
>>       }
>>   
>> +    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
>> +        X86MachineState *x86ms = X86_MACHINE(ms);
>> +
>> +        if (x86ms->bld > 0) {
>> +            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
>> +            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
>> +                error_report("kvm: bus lock detection unsupported");
>> +                return -ENOTSUP;
>> +            }
>> +            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
>> +                                    KVM_BUS_LOCK_DETECTION_EXIT);
>> +            if (ret < 0) {
>> +                error_report("kvm: Failed to enable bus lock detection cap: %s",
>> +                             strerror(-ret));
>> +                return ret;
>> +            }
>> +
>> +            ratelimit_set_speed(&x86ms->bld_limit, x86ms->bld, SLICE_TIME);
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>   
>> @@ -4221,6 +4244,18 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
>>       }
>>   }
>>   
>> +static void kvm_rate_limit_on_bus_lock(void)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    X86MachineState *x86ms = X86_MACHINE(ms);
>> +
>> +    uint64_t delay_ns = ratelimit_calculate_delay(&x86ms->bld_limit, 1);
>> +
> 
> This doesn't look thread safe.  Isn't this going to run from the
> VCPU thread with no locks acquired?
> 
Yes, lock should be added here to fix the race for ratelimit state. I'll 
add it in next version.

>> +    if (delay_ns) {
>> +        g_usleep(delay_ns / SCALE_US);
>> +    }
>> +}
>> +
>>   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>   {
>>       X86CPU *x86_cpu = X86_CPU(cpu);
>> @@ -4236,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>       } else {
>>           env->eflags &= ~IF_MASK;
>>       }
>> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
>> +        kvm_rate_limit_on_bus_lock();
>> +    }
>>   
>>       /* We need to protect the apic state against concurrent accesses from
>>        * different threads in case the userspace irqchip is used. */
>> @@ -4594,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>           ioapic_eoi_broadcast(run->eoi.vector);
>>           ret = 0;
>>           break;
>> +    case KVM_EXIT_X86_BUS_LOCK:
>> +        /* already handled in kvm_arch_post_run */
>> +        ret = 0;
>> +        break;
>>       default:
>>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>>           ret = -1;
>> -- 
>> 2.17.1
>>
> 

