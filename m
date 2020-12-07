Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB852D183E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:12:18 +0100 (CET)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKzf-0006xq-OU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmKvf-0005jH-WC
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:08:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:49398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmKve-00057o-3I
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:08:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D4A5AE63;
 Mon,  7 Dec 2020 18:08:04 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e770b13a-7ac7-00b6-99d1-0be24426ea8b@suse.de>
Date: Mon, 7 Dec 2020 19:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201207174916.GD1289986@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:49 PM, Eduardo Habkost wrote:
> On Mon, Dec 07, 2020 at 09:40:42AM +0100, Claudio Fontana wrote:
>> cc->do_interrupt is a TCG callback used in accel/tcg only,
>> call instead directly the arm_cpu_do_interrupt for the
>> injection of exeptions from KVM, so that
>>
>> do_interrupt can be exported to TCG-only operations in the CPUClass.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/helper.c | 4 ++++
>>  target/arm/kvm64.c  | 4 ++--
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 38cd35c049..bebaabf525 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -9895,6 +9895,10 @@ static void handle_semihosting(CPUState *cs)
>>   * Do any appropriate logging, handle PSCI calls, and then hand off
>>   * to the AArch64-entry or AArch32-entry function depending on the
>>   * target exception level's register width.
>> + *
>> + * Note: this is used for both TCG (as the do_interrupt tcg op),
>> + *       and KVM to re-inject guest debug exceptions, and to
>> + *       inject a Synchronous-External-Abort.
>>   */
>>  void arm_cpu_do_interrupt(CPUState *cs)
>>  {
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index f74bac2457..2b17e4203d 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -960,7 +960,7 @@ static void kvm_inject_arm_sea(CPUState *c)
>>  
>>      env->exception.syndrome = esr;
>>  
>> -    cc->do_interrupt(c);
>> +    arm_cpu_do_interrupt(c);
> 
> How can we be sure cc->do_interrupt always points to
> arm_cpu_do_interrupt today?

You are right, I am currently looking at the same problem.

> 
> arm_v7m_class_init() (used by cortex-* CPU models) overrides it.
> Those CPU models as "TCG CPUs" in the code, but I don't see what
> makes them TCG-specific.  What exactly is the expected behavior
> if using, e.g., "-cpu cortex-m33 -accel kvm"?

I agree that's a problem, and I am looking to fix it,
but also:

what about also the existing code with qemu-arm (user mode)?

In that case do_interrupt is not set at all in target/arm/cpu.c, since it's protected by #ifndef CONFIG_USER_ONLY

Did we have a potential NULL pointer trying to be dereferenced there?

Commit 0adf7d3cc3f724e1e9ce5aaa008bd9daeb490f19 says:

 target-arm: do not set do_interrupt handlers for ARM and AArch64 user modes
    
 User mode emulation should never get interrupts and thus should not
 use the system emulation exception handler function.

--

But this was 2014. Is the comment above true today?

Looking at this commit in 2017, it does not seem to me to be the case:

commit 17b50b0c299f1266578b01f7134810362418ac2e
Author: Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
Date:   Tue Nov 14 11:18:18 2017 +0300

    cpu-exec: avoid cpu_exec_nocache infinite loop with record/replay
    
    This patch
    [...]
    Second, try to cause the exception at the beginning of
    cpu_handle_exception, and exit immediately if the TB cannot
    execute.  With this change, interrupts are processed and
    cpu_exec_nocache can make process.

--

So to me it seems like this creates the potential for a NULL pointer deref, today, in arm user mode,
since the handler is set only for !CONFIG_USER_ONLY, but it is potentially used also in user mode.

Is cc->do_interrupt supposed to be !CONFIG_USER_ONLY or not?

I am not sure at this point.


> 
> 
>>  }
>>  
>>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
>> @@ -1545,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
>>      env->exception.vaddress = debug_exit->far;
>>      env->exception.target_el = 1;
>>      qemu_mutex_lock_iothread();
>> -    cc->do_interrupt(cs);
>> +    arm_cpu_do_interrupt(cs);
>>      qemu_mutex_unlock_iothread();
>>  
>>      return false;
>> -- 
>> 2.26.2
>>
> 


