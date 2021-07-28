Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900493D8734
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 07:42:47 +0200 (CEST)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8cL8-0005yt-2d
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 01:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1m8cIx-0005Cw-Gj
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 01:40:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1m8cIt-0007PW-MO
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 01:40:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209472569"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209472569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 22:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="517283019"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.162])
 ([10.238.0.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 22:40:13 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210521043820.29678-1-chenyi.qiang@intel.com>
 <YP/DkxqH3h4fROM/@work-vm>
Message-ID: <e23048cd-d502-fe42-cd5c-c42a51469835@intel.com>
Date: Wed, 28 Jul 2021 13:40:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP/DkxqH3h4fROM/@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chenyi.qiang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/27/2021 4:28 PM, Dr. David Alan Gilbert wrote:
> * Chenyi Qiang (chenyi.qiang@intel.com) wrote:
>> A bus lock is acquired through either split locked access to writeback
>> (WB) memory or any locked access to non-WB memory. It is typically >1000
>> cycles slower than an atomic operation within a cache and can also
>> disrupts performance on other cores.
>>
>> Virtual Machines can exploit bus locks to degrade the performance of
>> system. To address this kind of performance DOS attack coming from the
>> VMs, bus lock VM exit is introduced in KVM and it can report the bus
>> locks detected in guest. If enabled in KVM, it would exit to the
>> userspace to let the user enforce throttling policies once bus locks
>> acquired in VMs.
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
>> Introduce a new field "bus_lock_ratelimit" to record the limited speed
>> of bus locks in the target VM. The user can specify it through the
>> "bus-lock-ratelimit" as a machine property. In current implementation,
>> the default value of the speed is 0 per second, which means no
>> restrictions on the bus locks.
>>
>> As for ratelimit on detected bus locks, simply set the ratelimit
>> interval to 1s and restrict the quota of bus lock occurence to the value
>> of "bus_lock_ratelimit". A potential alternative is to introduce the
>> time slice as a property which can help the user achieve more precise
>> control.
>>
>> The detail of bus lock VM exit can be found in spec:
>> https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html
>>
>> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> 
> Hi Chenyi,
> 
>    I noticed in this patch:
> 
> 
>> +static void kvm_rate_limit_on_bus_lock(void)
>> +{
>> +    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
>> +
>> +    if (delay_ns) {
>> +        g_usleep(delay_ns / SCALE_US);
>> +    }
>> +}
> 
> and wondered if this would block cpu kicks, and what would happen if
> delay_ns got quite big - Eduardo thinks it might get upto 1s.
> 

I did a rough test, force the delay_ns to 1s and see how long it will 
take to sleep 20s in guest. Actually, for 1-vcpu VM, the output of 
elapsed time is 20.4~20.6s, so I assume the applications in guest may 
lose some precision. Changing to a more refined time slice control is an 
solution. (But concerning that such ratelimit only happen in a malicious 
guest, maybe it is acceptable to lose some accuracy.)

> Also, it feels similar to what migration does during 'auto converge';
> see softmuu/cpu-throttle.c - instead of doing your own g_usleep
> you could call cpu_throttle_set with a given throttle rate.
> 

Yes, looked at the cpu-throttle code, cpu_throttle_set works similarly, 
but need some refactor. Migration uses the static throttle_percentage to 
control the global throttling, so if bus lock throttling calls 
cpu_throttle_set, it needs to distinguish with migration.

> Dave
> 
>> +
>>   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>   {
>>       X86CPU *x86_cpu = X86_CPU(cpu);
>> @@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>       } else {
>>           env->eflags &= ~IF_MASK;
>>       }
>> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
>> +        kvm_rate_limit_on_bus_lock();
>> +    }
>>   
>>       /* We need to protect the apic state against concurrent accesses from
>>        * different threads in case the userspace irqchip is used. */
>> @@ -4595,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
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
>>

