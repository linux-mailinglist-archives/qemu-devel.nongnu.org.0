Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29C46D724
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 16:39:13 +0100 (CET)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muz2F-0000kA-Ky
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 10:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muyzz-0007lX-Rz
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 10:36:52 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:37630
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muyzw-0006DJ-I6
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 10:36:51 -0500
HMM_SOURCE_IP: 172.18.0.188:57610.671055688
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.232 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id E3CEC280083;
 Wed,  8 Dec 2021 23:36:30 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 023e7d47bc0e4e15bd0548ab8accb590 for
 peterx@redhat.com; Wed, 08 Dec 2021 23:36:37 CST
X-Transaction-ID: 023e7d47bc0e4e15bd0548ab8accb590
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <35074c69-25e7-f2f1-b7b8-e35b9744e356@chinatelecom.cn>
Date: Wed, 8 Dec 2021 23:36:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 2/3] cpu-throttle: implement vCPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <155c8ef6b68c06829f971d356732783c671f661a.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3hfN+xKie2geL+@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya3hfN+xKie2geL+@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/6 18:10, Peter Xu 写道:
> On Fri, Dec 03, 2021 at 09:39:46AM +0800, huangy81@chinatelecom.cn wrote:
>> +static uint64_t dirtylimit_pct(unsigned int last_pct,
>> +                               uint64_t quota,
>> +                               uint64_t current)
>> +{
>> +    uint64_t limit_pct = 0;
>> +    RestrainPolicy policy;
>> +    bool mitigate = (quota > current) ? true : false;
>> +
>> +    if (mitigate && ((current == 0) ||
>> +        (last_pct <= DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE))) {
>> +        return 0;
>> +    }
>> +
>> +    policy = dirtylimit_policy(last_pct, quota, current);
>> +    switch (policy) {
>> +    case RESTRAIN_SLIGHT:
>> +        /* [90, 99] */
>> +        if (mitigate) {
>> +            limit_pct =
>> +                last_pct - DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
>> +        } else {
>> +            limit_pct =
>> +                last_pct + DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
>> +
>> +            limit_pct = MIN(limit_pct, CPU_THROTTLE_PCT_MAX);
>> +        }
>> +       break;
>> +    case RESTRAIN_HEAVY:
>> +        /* [75, 90) */
>> +        if (mitigate) {
>> +            limit_pct =
>> +                last_pct - DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
>> +        } else {
>> +            limit_pct =
>> +                last_pct + DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
>> +
>> +            limit_pct = MIN(limit_pct,
>> +                DIRTYLIMIT_THROTTLE_SLIGHT_WATERMARK);
>> +        }
>> +       break;
>> +    case RESTRAIN_RATIO:
>> +        /* [0, 75) */
>> +        if (mitigate) {
>> +            if (last_pct <= (((quota - current) * 100 / quota))) {
>> +                limit_pct = 0;
>> +            } else {
>> +                limit_pct = last_pct -
>> +                    ((quota - current) * 100 / quota);
>> +                limit_pct = MAX(limit_pct, CPU_THROTTLE_PCT_MIN);
>> +            }
>> +        } else {
>> +            limit_pct = last_pct +
>> +                ((current - quota) * 100 / current);
>> +
>> +            limit_pct = MIN(limit_pct,
>> +                DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK);
>> +        }
>> +       break;
>> +    case RESTRAIN_KEEP:
>> +    default:
>> +       limit_pct = last_pct;
>> +       break;
>> +    }
>> +
>> +    return limit_pct;
>> +}
>> +
>> +static void *dirtylimit_thread(void *opaque)
>> +{
>> +    int cpu_index = *(int *)opaque;
>> +    uint64_t quota_dirtyrate, current_dirtyrate;
>> +    unsigned int last_pct = 0;
>> +    unsigned int pct = 0;
>> +
>> +    rcu_register_thread();
>> +
>> +    quota_dirtyrate = dirtylimit_quota(cpu_index);
>> +    current_dirtyrate = dirtylimit_current(cpu_index);
>> +
>> +    pct = dirtylimit_init_pct(quota_dirtyrate, current_dirtyrate);
>> +
>> +    do {
>> +        trace_dirtylimit_impose(cpu_index,
>> +            quota_dirtyrate, current_dirtyrate, pct);
>> +
>> +        last_pct = pct;
>> +        if (pct == 0) {
>> +            sleep(DIRTYLIMIT_CALC_PERIOD_TIME_S);
>> +        } else {
>> +            dirtylimit_check(cpu_index, pct);
>> +        }
>> +
>> +        quota_dirtyrate = dirtylimit_quota(cpu_index);
>> +        current_dirtyrate = dirtylimit_current(cpu_index);
>> +
>> +        pct = dirtylimit_pct(last_pct, quota_dirtyrate, current_dirtyrate);
> 
> So what I had in mind is we can start with an extremely simple version of
> negative feedback system.  Say, firstly each vcpu will have a simple number to
> sleep for some interval (this is ugly code, but just show what I meant..):
> 
> ===============
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index eecd8031cf..c320fd190f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2932,6 +2932,8 @@ int kvm_cpu_exec(CPUState *cpu)
>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>               qemu_mutex_lock_iothread();
>               kvm_dirty_ring_reap(kvm_state);
> +            if (dirtylimit_enabled(cpu->cpu_index) && cpu->throttle_us_per_full)
> +                usleep(cpu->throttle_us_per_full);
>               qemu_mutex_unlock_iothread();
>               ret = 0;
>               break;
> ===============
> 
> I think this will have finer granularity when throttle (for 4096 ring size,
> that's per-16MB operation) than current way where we inject per-vcpu async task
> to sleep, like auto-converge.
> 
> Then we have the "black box" to tune this value with below input/output:
> 
>    - Input: dirty rate information, same as current algo
> 
>    - Output: increase/decrease of per-vcpu throttle_us_per_full above, and
>      that's all
> 
> We can do the sampling per-second, then we keep doing it: we can have 1 thread
> doing per-second task collecting dirty rate information for all the vcpus, then
> tune that throttle_us_per_full for each of them.
> 
> The simplest linear algorithm would be as simple as (for each vcpu):
> 
>    if (quota < current)
>      throttle_us_per_full += SOMETHING;
>      if (throttle_us_per_full > MAX)
>        throttle_us_per_full = MAX;
>    else
>      throttle_us_per_full -= SOMETHING;
>      if (throttle_us_per_full < 0)
>        throttle_us_per_full = 0;
> 
> I think your algorithm is fine, but thoroughly review every single bit of it in
> one shot will be challenging, and it's also hard to prove every bit of the
> algorithm is helpful, as there're a lot of hand-made macros and state changes.
> 
> I actually tested the current algorithm of yours, the dirty rate fluctuates a
> bit (when I specified 200MB/s, it can go into either a few tens of MB/s or
> 300MB/s, normally less), neither does it respond fast (the initial throtle from
> 500MB/s -> 200MB/s should need 1 minute or something), so it seems not ideal
> anyway. In that case I prefer we start with simple.
> 
> So IMHO we can start with this simple scheme first then it'll start working
> with much less line of codes, afaict.  With that scheme ready in the 1st or
> initial patches, it'll be easier to either apply any better algorithm
> (e.g. your current one, if you're confident with that) or other things then
> it'll be much easier to review too if you could consider split your patch like
> that.
> 
> Normally per my knowledge for the need on migration, we could consider add an
> integral algorithm into this linear algorithm that I said above, and it should
> help us reach a very stable and constant state of throttling already.  But
> we'll need to try it out, as I never tried.
> 
> What do you think?
> 
I absolutely agree with your point, negative feedback system is also 
what i thought in the first place, and theoretically may be the most 
appropriate algo to control the vcpu in a stable dirty page rate from my 
point of view, but at the very beginning i'm not sure the new algo of 
throttling can be accepted, so i adopted the exiting auto-converge algo 
in qemu... :). One of my purposes of posting this patchset is for the 
sake of RFC, and thanks Peter very much for giving the advice.

I'll try it out and see the results. If things go well, the negative 
feedback system to control the dirty page rate for a vcpu will be 
introduced next version.

