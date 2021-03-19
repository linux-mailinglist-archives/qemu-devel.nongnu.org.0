Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED30341212
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 02:24:55 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN3sj-0006yN-KV
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 21:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1lN3s0-0006YD-0D
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 21:24:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1lN3rx-0002Di-JY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 21:24:07 -0400
IronPort-SDR: aAswBcLbv18a8dd6gTM4/kVl5aox5M3LSArCfb/9xMYz/F8Uddtm4+i5j2ftcmsVC37GD7N1xB
 XFuGDugjl0RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="253809164"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="253809164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 18:23:57 -0700
IronPort-SDR: tevrsQ4M3sGGfqDZw627/hrzqBs3G5ELEjRwaJT6LTsj+HrPWYpPUImjXQxiograZKHWVehmNH
 Tw5ESTcaN1eg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413316108"
Received: from unknown (HELO [10.239.13.106]) ([10.239.13.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 18:23:51 -0700
Subject: Re: [RFC PATCH] i386: Add ratelimit for bus locks acquired in guest
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
References: <20210317084709.15605-1-chenyi.qiang@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <1760f09a-fc0c-047e-c38b-8180e4f23517@intel.com>
Date: Fri, 19 Mar 2021 09:23:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317084709.15605-1-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
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

On 3/17/2021 4:47 PM, Chenyi Qiang wrote:
[...]
>   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>   {
>       X86CPU *x86_cpu = X86_CPU(cpu);
> @@ -4236,6 +4271,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>       } else {
>           env->eflags &= ~IF_MASK;
>       }
> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
> +        kvm_cpu_synchronize_state(cpu);
> +        warn_report("bus lock detected at rip: 0x%lx", env->eip);

Chenyi,

Let's drop the eip here since QEMU has no idea whether it points to the 
next instruction or the exact instruction acquires bus lock.

> +        kvm_rate_limit_on_bus_lock();
> +    }
>   
>       /* We need to protect the apic state against concurrent accesses from
>        * different threads in case the userspace irqchip is used. */
> @@ -4594,6 +4634,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>           ioapic_eoi_broadcast(run->eoi.vector);
>           ret = 0;
>           break;
> +    case KVM_EXIT_X86_BUS_LOCK:
> +        /* already handled in kvm_arch_post_run */
> +        ret = 0;
> +        break;
>       default:
>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>           ret = -1;
> 


