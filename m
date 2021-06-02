Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A1397E0C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 03:29:04 +0200 (CEST)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loFgt-00045K-Jj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 21:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1loFen-00028z-QX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 21:26:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:7160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1loFel-0001cI-8K
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 21:26:53 -0400
IronPort-SDR: o/QthKxMNvXUp4ZuIoyslZJqqsINiQU2fuBjOzoA4gI3Jrcic8senaITuXOd1fXQ++m1de0O8T
 uLJ9y+enJwRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203710332"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="203710332"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 18:26:46 -0700
IronPort-SDR: wehWSk+nuy0mEWYl9b3SfkNuXo9DPFfOKnTXFBOF5zET+7mp9Y0YpEFcr6JMUnlZh7/ONDaaNe
 Kptb/hBBj+HQ==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="479507043"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.151])
 ([10.238.0.151])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 18:26:45 -0700
Subject: Re: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210521043820.29678-1-chenyi.qiang@intel.com>
 <20210527211904.sjmkely4t4ragxva@habkost.net>
 <e9b152b8-daad-aaa4-c89d-35fd839f2ae4@intel.com>
 <20210601181837.dl5tcyqywtoidu57@habkost.net>
 <20210601201051.keixbycislhcsgkc@habkost.net>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <ef608081-a9f9-6d8c-41d5-d29d028a128e@intel.com>
Date: Wed, 2 Jun 2021 09:26:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601201051.keixbycislhcsgkc@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 6/2/2021 4:10 AM, Eduardo Habkost wrote:
> On Tue, Jun 01, 2021 at 02:18:37PM -0400, Eduardo Habkost wrote:
>> On Mon, May 31, 2021 at 01:14:54PM +0800, Chenyi Qiang wrote:
>>>
>>>
>>> On 5/28/2021 5:19 AM, Eduardo Habkost wrote:
>>>> On Fri, May 21, 2021 at 12:38:20PM +0800, Chenyi Qiang wrote:
>>>> [...]
>>>>> @@ -4222,6 +4247,15 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
>>>>>        }
>>>>>    }
>>>>> +static void kvm_rate_limit_on_bus_lock(void)
>>>>> +{
>>>>> +    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
>>>>> +
>>>>> +    if (delay_ns) {
>>>>> +        g_usleep(delay_ns / SCALE_US);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>>>>    {
>>>>>        X86CPU *x86_cpu = X86_CPU(cpu);
>>>>> @@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>>>>>        } else {
>>>>>            env->eflags &= ~IF_MASK;
>>>>>        }
>>>>> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
>>>>
>>>> Does the KVM API guarantee that KVM_RUN_X86_BUS_LOCK will never
>>>> be set if KVM_BUS_LOCK_DETECTION_EXIT isn't enabled?  (Otherwise
>>>> we risk crashing in ratelimit_calculate_delay() above if rate
>>>> limiting is disabled).
>>>>
>>>
>>> Yes. KVM_RUN_X86_BUS_LOCK flag is set when bus lock VM exit happens. Bus
>>> lock VM exit is disabled by default and can only be enabled through the
>>> KVM_BUS_LOCK_DETECTION_EXIT capability.
>>
>> I'm queueing on x86-next, thanks!
> 
> This breaks the build.  Is there a linux-headers update patch I've missed?
> 

Thanks for the queue and sorry for forgetting to submit the 
linux-headers update patch.

> ../target/i386/kvm/kvm.c: In function 'kvm_arch_init':
> ../target/i386/kvm/kvm.c:2322:42: error: 'KVM_CAP_X86_BUS_LOCK_EXIT' undeclared (first use in this function); did you mean 'KVM_CAP_X86_DISABLE_EXITS'?
>               ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
>                                            ^~~~~~~~~~~~~~~~~~~~~~~~~
>                                            KVM_CAP_X86_DISABLE_EXITS
> 

