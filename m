Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52F341359
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:06:45 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5TI-0005qH-6X
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lN5Rq-0005PG-Qc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:05:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lN5Rn-0003Ws-LL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:05:14 -0400
IronPort-SDR: eSfkkSj1m5rvXj8tlafvqkuCI0PMzc0bIf0mcVHfgG9VQ0uaEwGQSfcoP6SpxJC3mbYNqvbLnN
 7jvBQkw6S1Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="251166446"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="251166446"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:05:07 -0700
IronPort-SDR: um9X0ouB9NuJoY8gFCyEuJi1aEnCh+HLKsNURUgkPJ6sLL1i1Ra8swZMnxcZtCJ4BhykLuOS7e
 74tmsyJOLCBg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="406601193"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.2.5])
 ([10.238.2.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:05:06 -0700
Subject: Re: [RFC PATCH] i386: Add ratelimit for bus locks acquired in guest
To: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
References: <20210317084709.15605-1-chenyi.qiang@intel.com>
 <1760f09a-fc0c-047e-c38b-8180e4f23517@intel.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <d225af02-1aaf-8702-b1b3-7b1e9c61a560@intel.com>
Date: Fri, 19 Mar 2021 11:05:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1760f09a-fc0c-047e-c38b-8180e4f23517@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=chenyi.qiang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/19/2021 9:23 AM, Xiaoyao Li wrote:
> On 3/17/2021 4:47 PM, Chenyi Qiang wrote:
> [...]
>>   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>   {
>>       X86CPU *x86_cpu = X86_CPU(cpu);
>> @@ -4236,6 +4271,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, 
>> struct kvm_run *run)
>>       } else {
>>           env->eflags &= ~IF_MASK;
>>       }
>> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
>> +        kvm_cpu_synchronize_state(cpu);
>> +        warn_report("bus lock detected at rip: 0x%lx", env->eip);
> 
> Chenyi,
> 
> Let's drop the eip here since QEMU has no idea whether it points to the 
> next instruction or the exact instruction acquires bus lock.
> 

Fair enough.

>> +        kvm_rate_limit_on_bus_lock();
>> +    }
>>       /* We need to protect the apic state against concurrent accesses 
>> from
>>        * different threads in case the userspace irqchip is used. */
>> @@ -4594,6 +4634,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct 
>> kvm_run *run)
>>           ioapic_eoi_broadcast(run->eoi.vector);
>>           ret = 0;
>>           break;
>> +    case KVM_EXIT_X86_BUS_LOCK:
>> +        /* already handled in kvm_arch_post_run */
>> +        ret = 0;
>> +        break;
>>       default:
>>           fprintf(stderr, "KVM: unknown exit reason %d\n", 
>> run->exit_reason);
>>           ret = -1;
>>
> 

