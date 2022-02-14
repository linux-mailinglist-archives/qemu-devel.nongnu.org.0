Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC54B4538
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:10:48 +0100 (CET)
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJXNc-0005np-R2
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nJXJ1-00038p-Px
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:06:00 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:58623
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nJXIz-0001YO-7P
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:05:59 -0500
HMM_SOURCE_IP: 172.18.0.188:57572.1955717887
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5EBE72800D8;
 Mon, 14 Feb 2022 17:05:41 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id eecb867586384a0aa769e875390ec8dc for
 peterx@redhat.com; Mon, 14 Feb 2022 17:05:47 CST
X-Transaction-ID: eecb867586384a0aa769e875390ec8dc
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <b9c33974-7c1d-5efd-5667-cd705775e501@chinatelecom.cn>
Date: Mon, 14 Feb 2022 17:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v14 6/7] softmmu/dirtylimit: Implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <ad0a6e05b5bec2c2c8dd3a7663e39e3cf9af71a3.1644509582.git.huangy81@chinatelecom.cn>
 <YgoQxbzrNleQT9TH@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgoQxbzrNleQT9TH@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



在 2022/2/14 16:20, Peter Xu 写道:
> On Fri, Feb 11, 2022 at 12:17:40AM +0800, huangy81@chinatelecom.cn wrote:
>> @@ -2964,8 +2971,13 @@ int kvm_cpu_exec(CPUState *cpu)
>>                */
>>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>>               qemu_mutex_lock_iothread();
>> -            kvm_dirty_ring_reap(kvm_state, NULL);
>> +            if (dirtylimit_in_service()) {
>> +                kvm_dirty_ring_reap(kvm_state, cpu);
>> +            } else {
>> +                kvm_dirty_ring_reap(kvm_state, NULL);
>> +            }
> 
> Could you add some comment here on why the cpu pointer is conditionally passed
> into the reaping routine?  Even if we know it now, it's not immediately obvious
> to all the readers.
Sure.
> 
> [...]
> 
>> +struct {
>> +    VcpuDirtyLimitState *states;
>> +    /* Max cpus number configured by user */
>> +    int max_cpus;
>> +    /* Number of vcpu under dirtylimit */
>> +    int limited_nvcpu;
>> +    /* Function to implement throttle set up */
>> +    DirtyLimitFunc setup;
> 
> "setup" normally is used only at startup of something, but not per interval.
> Perhaps "process" or "adjust"?  Same across other "setup" namings across the
> patch.
Ok, 'adjust' is fine.
> 
> Again, I'd rather call the function directly..
Um, maybe using the function pointer is more extensible.

[...]
static void *vcpu_dirty_rate_stat_thread(void *opaque)
{
     rcu_register_thread();

     /* start log sync */
     global_dirty_log_change(GLOBAL_DIRTY_LIMIT, true);

     while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
         vcpu_dirty_rate_stat_collect();
         if (dirtylimit_in_service() &&
             dirtylimit_state->setup) {
             dirtylimit_state->setup();
         }
     }

     /* stop log sync */
     global_dirty_log_change(GLOBAL_DIRTY_LIMIT, false);

     rcu_unregister_thread();
     return NULL;
}
[...]

Function pointer makes the 'dirtyrate-stat' logic and 'dirtylimit' logic 
kind of decoupled.

But i'm ok if you insist because it's just about how to call the 
'dirtylimit' and doesn't affect the whole logic.

> 
> [...]
> 
>> +static void dirtylimit_adjust_throttle(CPUState *cpu)
>> +{
>> +    uint64_t quota = 0;
>> +    uint64_t current = 0;
>> +    int cpu_index = cpu->cpu_index;
>> +
>> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
>> +    current = vcpu_dirty_rate_get(cpu_index);
>> +
>> +    if (current == 0) {
>> +        cpu->throttle_us_per_full = 0;
>> +        goto end;
> 
> Can be dropped?
> 
>> +    } else if (dirtylimit_done(quota, current)) {
>> +        goto end;
> 
> Same here.  Dropping it wholely and:
> 
>         } else if (!dirtylimit_done(quota, current)) {
>             dirtylimit_set_throttle(cpu, quota, current);
>         }
> 
> Would work?
> 
>> +    } else {
>> +        dirtylimit_set_throttle(cpu, quota, current);
>> +    }
>> +end:
> 
> Can be dropped?
> 
>> +    trace_dirtylimit_adjust_throttle(cpu_index,
>> +                                     quota, current,
>> +                                     cpu->throttle_us_per_full);
>> +    return;
>> +}
>> +
>> +void dirtylimit_setup(void)
>> +{
>> +    CPUState *cpu;
>> +
>> +    if (!qatomic_read(&dirtylimit_quit)) {
>> +        dirtylimit_state_lock();
>> +
>> +        if (!dirtylimit_in_service()) {
>> +            dirtylimit_state_unlock();
> 
> Need to return?
> 
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
>> +}
> 
> [...]
> 
>> +void dirtylimit_set_vcpu(int cpu_index,
>> +                         uint64_t quota,
>> +                         bool enable)
>> +{
>> +    dirtylimit_vcpu_set_quota(cpu_index, quota, enable);
>> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
>> +}
> 
> This helper is not "help"ful..  How about wrapping the trace into
> dirtylimit_vcpu_set_quota, then drop it?
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

