Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB644EFF69
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 09:32:48 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naYFc-0000N7-2Q
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 03:32:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1naYC4-0005d5-Gy
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:29:08 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:42553
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1naYC0-00085M-UY
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:29:08 -0400
HMM_SOURCE_IP: 172.18.0.218:44090.939392685
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 074AC2800C4;
 Sat,  2 Apr 2022 15:28:22 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id bba72921117e41de8f980f07545b2545 for
 huangy81@chinatelecom.cn; Sat, 02 Apr 2022 15:28:57 CST
X-Transaction-ID: bba72921117e41de8f980f07545b2545
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <beb71ac6-28b0-77e3-a3aa-e11167d537f5@chinatelecom.cn>
Date: Sat, 2 Apr 2022 15:28:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] kvm: Dynamically adjust the rate of dirty ring
 reaper thread
To: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <7e786b6ab74e0c62661176fa7aec243c7b9bea8d.1648091540.git.wucy11@chinatelecom.cn>
 <80aa611e-55da-e76c-d09b-bda3a94f3169@chinatelecom.cn>
From: Chongyun Wu <wucy11@chinatelecom.cn>
In-Reply-To: <80aa611e-55da-e76c-d09b-bda3a94f3169@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
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
Cc: tugy@chinatelecom.cn, David Hildenbrand <david@redhat.com>,
 yuanmh12@chinatelecom.cn, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 f4bug@amsat.org, dengpc12@chinatelecom.cn, Paolo Bonzini <pbonzini@redhat.com>,
 baiyw2@chinatelecom.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

on 4/2/2022 3:04 PM, Hyman Huang wrote:
> 
> 
> 在 2022/3/28 9:32, wucy11@chinatelecom.cn 写道:
>> From: Chongyun Wu <wucy11@chinatelecom.cn>
>>
>> Dynamically adjust the dirty ring collection thread to
>> reduce the occurrence of ring full, thereby reducing the
>> impact on customers, improving the efficiency of dirty
>> page collection, and thus improving the migration efficiency.
>>
>> Implementation:
>> 1) Define different collection speeds for the reap thread.
>>
>> 2) Divide the total number of dirty pages collected each
>> time by the ring size to get a ratio which indicates the
>> occupancy rate of dirty pages in the ring. The higher the
>> ratio, the higher the possibility that the ring will be full.
>>
>> 3) Different ratios correspond to different running speeds.
>> A higher ratio value indicates that a higher running speed
>> is required to collect dirty pages as soon as possible to
>> ensure that too many ring fulls will not be generated,
>> which will affect the customer's business.
> 
>>
>> This patch can significantly reduce the number of ring full
>> occurrences in the case of high memory dirty page pressure,
>> and minimize the impact on guests.
>>
> Increase the frequency of reaping dirty ring can reduce the guest
> vcpu block time obviously and consequently improve the guest memory performance.
> 
> But this also make the write-memory vcpu run more time and dirty more memory, so 
> the migration time may become longer. Maybe we
> should also focus on the migraiton time and compare with traditional  algo.

Below are quemu guestperf test results, with this patch the performence are
improved. The max_memory_update_speed(ms/GB) will affect the customer's normal 
use of memory. The impact of memory efficiency on the guest is sometimes even 
greater than the impact on the CPU. Therefore, it is necessary to reduce the 
impact on the guest during the migration process.

As for saying that doing so will increase the migration time, it has not been 
found in actual testing yet. And the effect of these patch series in reducing 
migration time is also obvious.

guestperf drop duration(s): Duration of significant drop in guestperf
performance
|--------------+-------+--------+-------+-------------+---------------- --|
| dirty        |  ring | memory |  VM   | guestperf   | max_memory_update |
| tracking     |  size | stress |       | drop        | speed(ms/GB)      |
| mode version |       |        |       | duration(s) |                   |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |     3G |  2C4G |          18 |              3300 |
| dirty ring   |  4096 |     3G |  2C4G |          23 |              2766 |
| **optmized** |  4096 |     3G |  2C4G |         5.5 |              2962 |
| dirty ring   | 65536 |     3G |  2C4G |        22.2 |              3283 |
| **optmized** | 65536 |     3G |  2C4G |           6 |              3160 |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |     3G | 8C32G |          38 |              7571 |
| dirty ring   |  4096 |     3G | 8C32G |          62 |             48.8K |
| **optmized** |  4096 |     3G | 8C32G |          13 |              7921 |
| dirty ring   | 65536 |     3G | 8C32G |          71 |             12.7K |
| **optmized** | 65536 |     3G | 8C32G |          14 |              8700 |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |     6G | 8C32G |        61.5 |             10.5K |
| dirty ring   |  4096 |     6G | 8C32G |          68 |            23.87K |
| **optmized** |  4096 |     6G | 8C32G |          16 |             11.6K |
| dirty ring   | 65536 |     6G | 8C32G |          63 |               12K |
| **optmized** | 65536 |     6G | 8C32G |          15 |               12K |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |    10G | 8C32G |         110 |            13.68k |
| dirty ring   |  4096 |    10G | 8C32G |          91 |            16.87K |
| **optmized** |  4096 |    10G | 8C32G |        12.1 |             11.2K |
| dirty ring   | 65536 |    10G | 8C32G |          88 |             25.3k |
| **optmized** | 65536 |    10G | 8C32G |        11.5 |             11.1k |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |    20G | 8C32G |       161.6 |             24.4K |
| dirty ring   |  4096 |    20G | 8C32G |       152.8 |            28.65K |
| **optmized** |  4096 |    20G | 8C32G |          20 |             20.2K |
| dirty ring   | 65536 |    20G | 8C32G |       157.3 |               25k |
| **optmized** | 65536 |    20G | 8C32G |          21 |             20.9K |
|--------------+-------+--------+-------+-------------+-------------------|
| bitmap mode  |     0 |    30G | 8C32G |       221.5 |             28.4K |
| dirty ring   |  4096 |    30G | 8C32G |         187 |            41.19K |
| **optmized** |  4096 |    30G | 8C32G |        29.5 |               29K |
| dirty ring   | 65536 |    30G | 8C32G |         171 |             30.8K |
| **optmized** | 65536 |    30G | 8C32G |        29.5 |             29.1K |
|--------------+-------+--------+-------+-------------+-------------------|

>> Using this patch for the qeum guestperf test, the memory
>> performance during the migration process is somewhat improved
>> compared to the bitmap method, and is significantly improved
>> compared to the unoptimized dirty ring method. For detailed
>> test data, please refer to the follow-up series of patches.
>>
>> Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
>> ---
>>   accel/kvm/kvm-all.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 144 insertions(+), 5 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 27864df..65a4de8 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -91,6 +91,27 @@ enum KVMDirtyRingReaperState {
>>       KVM_DIRTY_RING_REAPER_REAPING,
>>   };
>>
>> +enum KVMDirtyRingReaperRunLevel {
>> +    /* The reaper runs at default normal speed */
>> +    KVM_DIRTY_RING_REAPER_RUN_NORMAL = 0,
>> +    /* The reaper starts to accelerate in different gears */
>> +    KVM_DIRTY_RING_REAPER_RUN_FAST1,
>> +    KVM_DIRTY_RING_REAPER_RUN_FAST2,
>> +    KVM_DIRTY_RING_REAPER_RUN_FAST3,
>> +    KVM_DIRTY_RING_REAPER_RUN_FAST4,
>> +    /* The reaper runs at the fastest speed */
>> +    KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED,
>> +};
>> + > +enum KVMDirtyRingReaperSpeedControl {
>> +    /* Maintain current speed */
>> +    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_KEEP = 0,
>> +    /* Accelerate current speed */
>> +    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP,
>> +    /* Decrease current speed */
>> +    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN
>> +};
>> +
>>   /*
>>    * KVM reaper instance, responsible for collecting the KVM dirty bits
>>    * via the dirty ring.
>> @@ -100,6 +121,11 @@ struct KVMDirtyRingReaper {
>>       QemuThread reaper_thr;
>>       volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
>>       volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
>> +    /* Control the running speed of the reaper thread to fit dirty page rate */
>> +    enum KVMDirtyRingReaperRunLevel run_level;
>> +    uint64_t ring_full_cnt;
>> +    float ratio_adjust_threshold;
>> +    int stable_count_threshold;
> Could you add some comments about the introduced field?
Thanks for mention.

>>   };
>>   struct KVMState
>> @@ -1449,11 +1475,115 @@ out:
>>       kvm_slots_unlock();
>>   }
> [...]
>> +static uint64_t calcu_sleep_time(KVMState *s,
>> +                                       uint64_t dirty_count,
>> +                                       uint64_t ring_full_cnt_last,
>> +                                       uint32_t *speed_down_cnt)
> Code isn't aligned
Thanks for mention.

>> +{
>> +    float ratio = 0.0;
>> +    uint64_t sleep_time = 1000000;
>> +    enum KVMDirtyRingReaperRunLevel run_level_want;
>> +    enum KVMDirtyRingReaperSpeedControl speed_control;
>> +
>> +    /*
>> +     * When the number of dirty pages collected exceeds
>> +     * the given percentage of the ring size,the speed
>> +     * up action will be triggered.
>> +     */
>> +    s->reaper.ratio_adjust_threshold = 0.1;
>> +    s->reaper.stable_count_threshold = 5;
>> +
>> +    ratio = (float)dirty_count / s->kvm_dirty_ring_size;
>> +
>> +    if (s->reaper.ring_full_cnt > ring_full_cnt_last) {
>> +        /* If get a new ring full need speed up reaper thread */
>> +        if (s->reaper.run_level != KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED) {
>> +            s->reaper.run_level++;
>> +        }
>> +    } else {
>> +        /*
>> +         * If get more dirty pages this loop and this status continus
>> +         * for many times try to speed up reaper thread.
>> +         * If the status is stable and need to decide which speed need
>> +         * to use.
>> +         */
>> +        if (ratio < s->reaper.ratio_adjust_threshold) {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_NORMAL;
>> +        } else if (ratio < s->reaper.ratio_adjust_threshold * 2) {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST1;
>> +        } else if (ratio < s->reaper.ratio_adjust_threshold * 3) {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST2;
>> +        } else if (ratio < s->reaper.ratio_adjust_threshold * 4) {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST3;
>> +        } else if (ratio < s->reaper.ratio_adjust_threshold * 5) {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST4;
>> +        } else {
>> +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED;
>> +        }
>> +
>> +        /* Get if need speed up or slow down */
>> +        if (run_level_want > s->reaper.run_level) {
>> +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP;
>> +            *speed_down_cnt = 0;
>> +        } else if (run_level_want < s->reaper.run_level) {
>> +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN;
>> +            *speed_down_cnt++;
>> +        } else {
>> +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_KEEP;
>> +        }
>> +
>> +        /* Control reaper thread run in sutiable run speed level */
>> +        if (speed_control == KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP) {
>> +            /* If need speed up do not check its stable just do it */
>> +            s->reaper.run_level++;
>> +        } else if (speed_control ==
>> +            KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN) {
>> +            /* If need speed down we should filter this status */
>> +            if (*speed_down_cnt > s->reaper.stable_count_threshold) {
>> +                s->reaper.run_level--;
>> +            }
>> +        }
>> +    }
>> +
>> +    /* Set the actual running rate of the reaper */
>> +    switch (s->reaper.run_level) {
>> +    case KVM_DIRTY_RING_REAPER_RUN_NORMAL:
>> +        sleep_time = 1000000;
>> +        break;
>> +    case KVM_DIRTY_RING_REAPER_RUN_FAST1:
>> +        sleep_time = 500000;
>> +        break;
>> +    case KVM_DIRTY_RING_REAPER_RUN_FAST2:
>> +        sleep_time = 250000;
>> +        break;
>> +    case KVM_DIRTY_RING_REAPER_RUN_FAST3:
>> +        sleep_time = 125000;
>> +        break;
>> +    case KVM_DIRTY_RING_REAPER_RUN_FAST4:
>> +        sleep_time = 100000;
>> +        break;
>> +    case KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED:
>> +        sleep_time = 80000;
>> +        break;
>> +    default:
>> +        sleep_time = 1000000;
>> +        error_report("Bad reaper thread run level, use default");
>> +    }
>> +
>> +    return sleep_time;
>> +}
>> +I think how to calculate the sleep time needs discuussion, including why 
> we define 5 levels, why we choose the time constants and in what scenarios this 
> algo works fine.


> 
> The other thing is i still think it's nicer we have the simplest algorithm 
> firstly, which should be very easy to verify.
>>   static void *kvm_dirty_ring_reaper_thread(void *data)
>>   {
>>       KVMState *s = data;
>>       struct KVMDirtyRingReaper *r = &s->reaper;
>> +    uint64_t count = 0;
>> +    uint64_t sleep_time = 1000000;
>> +    uint64_t ring_full_cnt_last = 0;
>> +    /* Filter speed jitter */
>> +    uint32_t speed_down_cnt = 0;
>> +
>>       rcu_register_thread();
>>       trace_kvm_dirty_ring_reaper("init");
>> @@ -1461,18 +1591,26 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>>       while (true) {
>>           r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
>>           trace_kvm_dirty_ring_reaper("wait");
>> -        /*
>> -         * TODO: provide a smarter timeout rather than a constant?
>> -         */
>> -        sleep(1);
>> +
>> +       ring_full_cnt_last = s->reaper.ring_full_cnt;
>> +
>> +        usleep(sleep_time);
>>           trace_kvm_dirty_ring_reaper("wakeup");
>>           r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
>>           qemu_mutex_lock_iothread();
>> -        kvm_dirty_ring_reap(s);
>> +        count = kvm_dirty_ring_reap(s);
>>           qemu_mutex_unlock_iothread();
>> +        /*
>> +         * Calculate the appropriate sleep time according to
>> +         * the speed of the current dirty page.
>> +         */
>> +        sleep_time = calcu_sleep_time(s, count,
>> +                                      ring_full_cnt_last,
>> +                                      &speed_down_cnt);
>> +
>>           r->reaper_iteration++;
>>       }
>> @@ -2958,6 +3096,7 @@ int kvm_cpu_exec(CPUState *cpu)
>>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>>               qemu_mutex_lock_iothread();
>>               kvm_dirty_ring_reap(kvm_state);
>> +            kvm_state->reaper.ring_full_cnt++;
>>               qemu_mutex_unlock_iothread();
>>               ret = 0;
>>               break;
> 
> Thanks.

-- 
Best Regard,
Chongyun Wu

