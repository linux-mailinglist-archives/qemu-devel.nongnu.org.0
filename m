Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89419495D30
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:02:40 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqkh-0004Kx-6o
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:02:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nAoyH-0007yD-3O
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:08:37 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:58887
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nAoxa-0007Gx-Gz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:08:11 -0500
HMM_SOURCE_IP: 172.18.0.218:33332.658219723
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 54C75280113;
 Fri, 21 Jan 2022 16:07:27 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 21411c8d4ab147c8b544cd94ea87760c for
 peterx@redhat.com; Fri, 21 Jan 2022 16:07:30 CST
X-Transaction-ID: 21411c8d4ab147c8b544cd94ea87760c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <f6d0b94c-3357-71dc-f992-b6d3d41fa6a7@chinatelecom.cn>
Date: Fri, 21 Jan 2022 16:07:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YeUbhC7MG32K9pxu@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> 
> Again, I won't ask for a good algorithm as the 1st version, but then I think
> it's nicer we have the simplest algorithm merged first, which should be very
> easy to verify.
> 
Hi, Peter, i'm working on simplifying the algorithm.
Current throttle logic is like the following:

1. If error value(|quota - current|) less than 25MB/s, we assert 
throttle already done and do nothing.

2. Start to throttle if "error value greater than 25MB/s" scenario 
detected twice.

3. Speed up throttle via plus and minus linearly if "error value" be 
found too large.

4. Throttle normally via plus and minus a fixed time slice.

I think 1、4 are basic logic and shoul not be dropped, and 2 could be 
removed(i take this from auto-converg algo), i prefer to reserve 3 so 
that the throttle can response fast.

How about this?

Could it be possible that i add some comments in 
dirtylimit_adjust_throttle and not touch the logic? I test the result of 
v12 and it seems working fine.

>> +
>> +static void dirtylimit_adjust_throttle(CPUState *cpu)
>> +{
>> +    uint64_t quota = 0;
>> +    uint64_t current = 0;
>> +    int cpu_index = cpu->cpu_index;
>> +
>> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
>> +    current = vcpu_dirty_rate_get(cpu_index);
>> +
>> +    if (current == 0 &&
>> +        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt == 0) {
>> +        cpu->throttle_us_per_full = 0;
>> +        goto end;
>> +    } else if (++dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt
>> +               < 2) {
>> +        goto end;
>> +    } else if (dirtylimit_done(quota, current)) {
>> +        goto end;
>> +    } else {
>> +        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt = 0;
>> +        dirtylimit_set_throttle(cpu, quota, current);
>> +    }
>> +end:
>> +    trace_dirtylimit_adjust_throttle(cpu_index,
>> +                                     quota, current,
>> +                                     cpu->throttle_us_per_full);
>> +    return;
>> +}
>> +
>> +static void *dirtylimit_thread(void *opaque)
>> +{
>> +    CPUState *cpu;
>> +
>> +    rcu_register_thread();
>> +
>> +    while (!qatomic_read(&dirtylimit_quit)) {
>> +        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);
> 
> Sorry to have not mentioned this: I think we probably don't even need this
> dirtylimit thread.
> 
> It'll be hard to make the "sleep" right here.. you could read two identical
> values from the dirty calc thread because the 1sec sleep is not accurate, so
> even after this sleep() the calc thread may not have provided the latest number
> yet.
> 
> It'll be much cleaner (and most importantly, accurate..) to me if we could make
> this a hook function being passed over to the vcpu_dirty_rate_stat_thread()
> thread, then after each vcpu_dirty_rate_stat_collect() we call the hook.
> 
>> +
>> +        dirtylimit_state_lock();
>> +
>> +        if (!dirtylimit_in_service()) {
>> +            dirtylimit_state_unlock();
>> +            break;
>> +        }
>> +
>> +        CPU_FOREACH(cpu) {
>> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
>> +                continue;
>> +            }
>> +            dirtylimit_adjust_throttle(cpu);
>> +        }
>> +        dirtylimit_state_unlock();
>> +    }
>> +
>> +    rcu_unregister_thread();
>> +
>> +    return NULL;
>> +}
>> +
>> +static void dirtylimit_thread_start(void)
>> +{
>> +    qatomic_set(&dirtylimit_quit, 0);
>> +    qemu_thread_create(&dirtylimit_thr,
>> +                       "dirtylimit",
>> +                       dirtylimit_thread,
>> +                       NULL,
>> +                       QEMU_THREAD_JOINABLE);
>> +}
>> +
>> +static void dirtylimit_thread_stop(void)
>> +{
>> +    qatomic_set(&dirtylimit_quit, 1);
>> +    qemu_mutex_unlock_iothread();
>> +    qemu_thread_join(&dirtylimit_thr);
>> +    qemu_mutex_lock_iothread();
>> +}
>> +
>> +void dirtylimit_set_vcpu(int cpu_index,
>> +                         uint64_t quota,
>> +                         bool enable)
>> +{
>> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
>> +
>> +    if (enable) {
>> +        if (dirtylimit_in_service()) {
>> +            /* only set the vcpu dirty page rate limit */
>> +            dirtylimit_vcpu_set_quota(cpu_index, quota, true);
>> +            return;
>> +        }
>> +
>> +        /* initialize state when set dirtylimit first time */
>> +        dirtylimit_state_lock();
>> +        dirtylimit_state_initialize();
>> +        dirtylimit_vcpu_set_quota(cpu_index, quota, true);
>> +        dirtylimit_state_unlock();
>> +
>> +        dirtylimit_thread_start();
> 
> Can we move dirtylimit global initializations out of dirtylimit_set_vcpu() too?
> We should always keep init/cleanup of dirty_rate_calc and dirtylimit together,
> because they should, imho.  We never enable one of them.
> 
> I commented similarly in previous version on this.
> 
>> +    } else {
>> +        if (!dirtylimit_in_service()) {
>> +            return;
>> +        }
>> +
>> +        dirtylimit_state_lock();
>> +        /* dirty page rate limit is not enabled */
>> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
>> +            dirtylimit_state_unlock();
>> +            return;
>> +        }
>> +
>> +        /* switch off vcpu dirty page rate limit */
>> +        dirtylimit_vcpu_set_quota(cpu_index, 0, false);
>> +        dirtylimit_state_unlock();
>> +
>> +        if (!dirtylimit_state->limited_nvcpu) {
>> +            dirtylimit_thread_stop();
>> +
>> +            dirtylimit_state_lock();
>> +            dirtylimit_state_finalize();
>> +            dirtylimit_state_unlock();
> 
> We don't need such a fine control of locking, IMHO.. it can be a very big lock
> just to serialize things..
> 
> IMHO it could be as simple as:
> 
> void dirtylimit_set_vcpu(int cpu_index,
>                           uint64_t quota,
>                           bool enable)
> {
>      dirtylimit_vcpu_set_quota(cpu_index, quota, enable);
>      trace_dirtylimit_set_vcpu(cpu_index, quota);
> }
> 
> void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
>                                uint64_t cpu_index,
>                                uint64_t dirty_rate,
>                                Error **errp)
> {
>      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>          error_setg(errp, "dirty page limit feature requires KVM with"
>                     " accelerator property 'dirty-ring-size' set'");
>          return;
>      }
> 
>      if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
>          error_setg(errp, "incorrect cpu index specified");
>          return;
>      }
> 
>      dirtylimit_state_lock();
> 
>      if (!dirtylimit_in_service()) {
>          /* TODO: we could have one helper to initialize all of them */
>          vcpu_dirty_rate_stat_initialize();
>          vcpu_dirty_rate_stat_start();
>          dirtylimit_state_initialize();
>          dirtylimit_vcpu_set_quota(cpu_index, quota, true);
>      }
> 
>      if (has_cpu_index) {
>          dirtylimit_set_vcpu(cpu_index, dirty_rate, true);
>      } else {
>          dirtylimit_set_all(dirty_rate, true);
>      }
> 
>      dirtylimit_state_unlock();
> }
> 
> I didn't write the cleanup path, but it's the same: we should only cleanup all
> the global structs in cancel-vcpu-dirty-limit when we found there's zero vcpus
> in track, and it should be done once there.
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

