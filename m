Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2BE341353
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:01:14 +0100 (CET)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5Nx-0004hq-2r
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lN5MM-0004Hd-QL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 22:59:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:7480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lN5MJ-0008S5-Pt
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 22:59:34 -0400
IronPort-SDR: Bgs0JmcdziBRESRcMpxsFELpCNdwTVQJsIC7BP/LFAVcExehrRs6pCjux4U264p14hsXcUDXXG
 XPE4xbmHMcuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169112756"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169112756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 19:59:24 -0700
IronPort-SDR: G7DhFJemi7/vXOUCGNyNPwcavlAlfAARBT4saZYGhK8SITI7H4BumF8CouV+qxU9X5RSHzPggK
 Ty+RwmoN/SZA==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="406599545"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.2.5])
 ([10.238.2.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 19:59:23 -0700
Subject: Re: [RFC PATCH] i386: Add ratelimit for bus locks acquired in guest
To: Marcelo Tosatti <mtosatti@redhat.com>
References: <20210317084709.15605-1-chenyi.qiang@intel.com>
 <20210318173200.GA35410@fuller.cnet>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <bdae25cb-49c6-76be-db9b-fd2a5f890531@intel.com>
Date: Fri, 19 Mar 2021 10:59:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318173200.GA35410@fuller.cnet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marcelo,

Thank you for your comment.

On 3/19/2021 1:32 AM, Marcelo Tosatti wrote:
> On Wed, Mar 17, 2021 at 04:47:09PM +0800, Chenyi Qiang wrote:
>> Virtual Machines can exploit bus locks to degrade the performance of
>> system. To address this kind of performance DOS attack, bus lock VM exit
>> is introduced in KVM and it will report the bus locks detected in guest,
>> which can help userspace to enforce throttling policies.
> 
>>
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
>> ---
>>   hw/i386/x86.c         |  6 ++++++
>>   include/hw/i386/x86.h |  7 +++++++
>>   target/i386/kvm/kvm.c | 44 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 7865660e2c..a70a259e97 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1209,6 +1209,12 @@ static void x86_machine_initfn(Object *obj)
>>       x86ms->acpi = ON_OFF_AUTO_AUTO;
>>       x86ms->smp_dies = 1;
>>       x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
>> +    x86ms->bld = 0;
>> +
>> +    object_property_add_uint64_ptr(obj, "bus-lock-detection",
>> +                                   &x86ms->bld, OBJ_PROP_FLAG_READWRITE);
>> +    object_property_set_description(obj, "bus-lock-detection",
>> +            "Bus lock detection ratelimit");
>>   }
>>   
>>   static void x86_machine_class_init(ObjectClass *oc, void *data)
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index 56080bd1fb..1f0ffbcfb9 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -72,6 +72,13 @@ struct X86MachineState {
>>        * will be translated to MSI messages in the address space.
>>        */
>>       AddressSpace *ioapic_as;
>> +
>> +    /*
>> +     * ratelimit enforced on detected bus locks, the default value
>> +     * is 0 per second
>> +     */
>> +    uint64_t bld;
>> +    RateLimit bld_limit;
>>   };
>>   
>>   #define X86_MACHINE_SMM              "smm"
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index c8d61daf68..724862137d 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -130,6 +130,8 @@ static bool has_msr_mcg_ext_ctl;
>>   static struct kvm_cpuid2 *cpuid_cache;
>>   static struct kvm_msr_list *kvm_feature_msrs;
>>   
>> +#define SLICE_TIME 1000000000ULL /* ns */
>> +
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
>> +    if (delay_ns) {
>> +        g_usleep(delay_ns / SCALE_US);
>> +    }
>> +}
> 
> Hi,
> 
> Can't see a use-case where the throttling is very useful: this will
> slowdown the application to a halt (if its bus-lock instruction is
> being called frequently).
> 

The throttling is aimed to only slowdown the target application and 
avoid slowdown the whole system (if bus-lock is frequent). As you known, 
bus locks takes more cycles and disrupt performance on other cores.

> However its very nice to know that it (bus lock) has happened.
> 
> So on KVM bus exit do you emulate the instruction or just execute it
> in the guest (without a VM-exit for the second time) ?
> 
Bus lock VM exit is a trap-like VM exit and delivered following the 
execution of the instruction acquiring the bus lock. Thus, it can just 
detect the occurrence of bus locks and can't intercept it. In KVM, we 
don't emulate the instruction. Bus lock already happens and guest will 
proceed to execute.


> (But maybe there are usecases where the throttling makes sense,
> sleep is performed outside global mutex lock, so patch looks good).
> 

