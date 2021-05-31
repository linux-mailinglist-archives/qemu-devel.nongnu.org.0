Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4813954F4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:16:32 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnaHv-0002YX-38
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lnaGc-0001lr-51
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:15:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:44272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lnaGZ-0000oa-C0
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:15:09 -0400
IronPort-SDR: 9b2jIprPD+oGNjQ0WGsrYbk/eGqH95+1eFe1ptqYvRnom5utAqBz34/JPH3IB5KhZugi0fY8Al
 SyFO2ErBBIvg==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="203330256"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="203330256"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 22:14:59 -0700
IronPort-SDR: ia/FBiQpAQRF9fmqWVrQfY63t8pe3MJ6+/iFNNT9VrExSceW4hv/VyaPXFQLrLW91OxQCDsNW+
 jCLs44jd0fnw==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="446477656"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.151])
 ([10.238.0.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 22:14:56 -0700
Subject: Re: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210521043820.29678-1-chenyi.qiang@intel.com>
 <20210527211904.sjmkely4t4ragxva@habkost.net>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <e9b152b8-daad-aaa4-c89d-35fd839f2ae4@intel.com>
Date: Mon, 31 May 2021 13:14:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527211904.sjmkely4t4ragxva@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.618,
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



On 5/28/2021 5:19 AM, Eduardo Habkost wrote:
> On Fri, May 21, 2021 at 12:38:20PM +0800, Chenyi Qiang wrote:
> [...]
>> @@ -4222,6 +4247,15 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
>>       }
>>   }
>>   
>> +static void kvm_rate_limit_on_bus_lock(void)
>> +{
>> +    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
>> +
>> +    if (delay_ns) {
>> +        g_usleep(delay_ns / SCALE_US);
>> +    }
>> +}
>> +
>>   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>   {
>>       X86CPU *x86_cpu = X86_CPU(cpu);
>> @@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>       } else {
>>           env->eflags &= ~IF_MASK;
>>       }
>> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
> 
> Does the KVM API guarantee that KVM_RUN_X86_BUS_LOCK will never
> be set if KVM_BUS_LOCK_DETECTION_EXIT isn't enabled?  (Otherwise
> we risk crashing in ratelimit_calculate_delay() above if rate
> limiting is disabled).
> 

Yes. KVM_RUN_X86_BUS_LOCK flag is set when bus lock VM exit happens. Bus 
lock VM exit is disabled by default and can only be enabled through the 
KVM_BUS_LOCK_DETECTION_EXIT capability.

> If that's guaranteed, the patch looks good to me now.
> 
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
> 

