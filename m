Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14D4EFFDA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 11:02:37 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naZeW-0008Kk-Gi
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 05:02:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1naZbv-0007QR-Fl
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:59:55 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:40681
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1naZbs-0003Tz-Fh
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:59:55 -0400
HMM_SOURCE_IP: 172.18.0.218:50652.1936847047
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 3989E2800E8;
 Sat,  2 Apr 2022 16:59:28 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id b06ee3e3d9ac461e809a86c6b8966eb6 for
 huangy81@chinatelecom.cn; Sat, 02 Apr 2022 16:59:45 CST
X-Transaction-ID: b06ee3e3d9ac461e809a86c6b8966eb6
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <bc185240-6711-893b-6755-127e4410613d@chinatelecom.cn>
Date: Sat, 2 Apr 2022 16:59:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/4] kvm: Introduce a dirty rate calculation method
 based on dirty ring
To: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <046226dadeccb0f66709c915098d7f15ab534353.1648091540.git.wucy11@chinatelecom.cn>
 <a58111a4-5674-7d47-5f7d-a29a444e36c6@chinatelecom.cn>
From: Chongyun Wu <wucy11@chinatelecom.cn>
In-Reply-To: <a58111a4-5674-7d47-5f7d-a29a444e36c6@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 dengpc12@chinatelecom.cn, Paolo Bonzini <pbonzini@redhat.com>,
 baiyw2@chinatelecom.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


on 4/2/2022 3:28 PM, Hyman Huang wrote:
> 
> 
> 在 2022/3/28 9:32, wucy11@chinatelecom.cn 写道:
>> From: Chongyun Wu <wucy11@chinatelecom.cn>
>>
>> A new structure KVMDirtyRingDirtyCounter is introduced in
>> KVMDirtyRingReaper to record the number of dirty pages
>> within a period of time.
>>
>> When kvm_dirty_ring_mark_page collects dirty pages, if it
>> finds that the current dirty pages are not duplicates, it
>> increases the dirty_pages_period count.
>>
>> Divide the dirty_pages_period count by the interval to get
>> the dirty page rate for this period.
>>
>> And use dirty_pages_period_peak_rate to count the highest
>> dirty page rate, to solve the problem that the dirty page
>> collection rate may change greatly during a period of time,
>> resulting in a large change in the dirty page rate.
>>
>> Through sufficient testing, it is found that the dirty rate
>> calculated after kvm_dirty_ring_flush usually matches the actual
>> pressure, and the dirty rate counted per second may change in the
>> subsequent seconds, so record the peak dirty rate as the real
>> dirty pages rate.
>>
>> This dirty pages rate is mainly used as the subsequent autoconverge
>> calculation speed limit throttle.
> As Peter's advice, i think the better way is exporting or adapting the existing 
> implemenation of dirty page rate calculation instead of building different blocks.
Yes,that right. But this is a little different.
Qemu currently already has a variety of dirty page rate calculation methods, 
which are used in different scenarios. This method is mainly to calculate the 
appropriate speed limit threshold in the process of hot migration of the dirty 
ring. It is realized by making full use of the characteristics of the dirty 
ring, that is, statistics are performed when collecting dirty pages, which 
cannot be achieved by the old bitmap method, and it will not add too much extra 
overhead, such as starting new threads, etc. There is no need to input 
parameters such as a suitable sampling period, etc., which is simple and 
convenient. Through the test, the pressure of the actual stress added can be 
relatively accurately calculated.

>>
>> Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
>> ---
>>   accel/kvm/kvm-all.c  | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   include/sysemu/kvm.h |  2 ++
>>   2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 5e02700..a158b1c 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -114,6 +114,13 @@ enum KVMDirtyRingReaperSpeedControl {
>>       KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN
>>   };
>> +struct KVMDirtyRingDirtyCounter {
>> +    int64_t time_last_count;
>> +    uint64_t dirty_pages_period;
>> +    int64_t dirty_pages_rate;
>> +    int64_t dirty_pages_period_peak_rate;
>> +};
>> +
>>   /*
>>    * KVM reaper instance, responsible for collecting the KVM dirty bits
>>    * via the dirty ring.
>> @@ -128,6 +135,7 @@ struct KVMDirtyRingReaper {
>>       uint64_t ring_full_cnt;
>>       float ratio_adjust_threshold;
>>       int stable_count_threshold;
>> +    struct KVMDirtyRingDirtyCounter counter; /* Calculate dirty pages rate */
>>   };
>>   struct KVMState
>> @@ -739,7 +747,9 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t 
>> as_id,
>>           return;
>>       }
>> -    set_bit(offset, mem->dirty_bmap);
>> +    if (!test_and_set_bit(offset, mem->dirty_bmap)) {
>> +        s->reaper.counter.dirty_pages_period++;
>> +    }
>>   }
>>   static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>> @@ -783,6 +793,56 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, 
>> CPUState *cpu)
>>       return count;
>>   }
>> +int64_t kvm_dirty_ring_get_rate(void)
>> +{
>> +    return kvm_state->reaper.counter.dirty_pages_rate;
>> +}
>> +
>> +int64_t kvm_dirty_ring_get_peak_rate(void)
>> +{
>> +    return kvm_state->reaper.counter.dirty_pages_period_peak_rate;
>> +}
>> +
>> +static void kvm_dirty_ring_reap_count(KVMState *s)
>> +{
>> +    int64_t spend_time = 0;
>> +    int64_t end_time;
>> +
>> +    if (!s->reaper.counter.time_last_count) {
>> +        s->reaper.counter.time_last_count =
>> +            qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    }
>> +
>> +    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    spend_time = end_time - s->reaper.counter.time_last_count;
>> +
>> +    if (!s->reaper.counter.dirty_pages_period ||
>> +        !spend_time) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * More than 1 second = 1000 millisecons,
>> +     * or trigger by kvm_log_sync_global which spend time
>> +     * more than 300 milliscons.
>> +     */
>> +    if (spend_time > 1000) {
>> +        /* Count the dirty page rate during this period */
>> +        s->reaper.counter.dirty_pages_rate =
>> +            s->reaper.counter.dirty_pages_period * 1000 / spend_time;
>> +        /* Update the peak dirty page rate at this period */
>> +        if (s->reaper.counter.dirty_pages_rate >
>> +            s->reaper.counter.dirty_pages_period_peak_rate) {
>> +            s->reaper.counter.dirty_pages_period_peak_rate =
>> +                s->reaper.counter.dirty_pages_rate;
>> +        }
>> +
>> +        /* Reset counters */
>> +        s->reaper.counter.dirty_pages_period = 0;
>> +        s->reaper.counter.time_last_count = 0;
>> +    }
>> +}
>> +
>>   /* Must be with slots_lock held */
>>   static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
>>   {
>> @@ -793,6 +853,8 @@ static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
>>       stamp = get_clock();
>> +    kvm_dirty_ring_reap_count(s);
>> +
>>       CPU_FOREACH(cpu) {
>>           total += kvm_dirty_ring_reap_one(s, cpu);
>>       }
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index a783c78..05846f9 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -582,4 +582,6 @@ bool kvm_cpu_check_are_resettable(void);
>>   bool kvm_arch_cpu_check_are_resettable(void);
>>   bool kvm_dirty_ring_enabled(void);
>> +int64_t kvm_dirty_ring_get_rate(void);
>> +int64_t kvm_dirty_ring_get_peak_rate(void);
>>   #endif
> 

-- 
Best Regard,
Chongyun Wu

