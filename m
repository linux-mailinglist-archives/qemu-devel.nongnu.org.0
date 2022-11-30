Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FE63CDB8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 04:14:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0DWN-0000AH-LD; Tue, 29 Nov 2022 22:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p0DWK-00009r-BW
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 22:12:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p0DWH-0000lN-R6
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 22:12:24 -0500
HMM_SOURCE_IP: 172.18.0.48:43214.1395830115
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id B5E3D2800DB;
 Wed, 30 Nov 2022 11:11:53 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0024 with ESMTP id b7f623ed9f634691aa1554cba50bb438 for
 peterx@redhat.com; Wed, 30 Nov 2022 11:12:12 CST
X-Transaction-ID: b7f623ed9f634691aa1554cba50bb438
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <7b0d655d-1f34-7a1b-3ba4-78cda6046d9e@chinatelecom.cn>
Date: Wed, 30 Nov 2022 11:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 03/11] kvm-all: Do not allow reap vcpu dirty ring
 buffer if not ready
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cef36a9ceae0a67d746cfb459939d5886ab07bd9.1669047366.git.huangy81@chinatelecom.cn>
 <Y4aK3phFjJ1l9wnv@x1n>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Y4aK3phFjJ1l9wnv@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.258,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/30 6:42, Peter Xu 写道:
> Hi, Yong,
> 
> On Mon, Nov 21, 2022 at 11:26:35AM -0500, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> When tested large vcpu size vm with dirtylimit feature, Qemu crashed
>> due to the assertion in kvm_dirty_ring_reap_one, which assert that
>> vcpu's kvm_dirty_gfns has been allocated and not NULL.
>>
>> Because dirty ring reaper thread races with Qemu main thread, reaper
>> may reap vcpu's dirty ring buffer when main thread doesn't complete
>> vcpu instantiation. So add the waiting logic in reaper thread and
>> start to reap until vcpu instantiation is completed.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   accel/kvm/kvm-all.c | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index f99b0be..9457715 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1401,6 +1401,35 @@ out:
>>       kvm_slots_unlock();
>>   }
>>   
>> +/*
>> + * test if dirty ring has been initialized by checking if vcpu
>> + * has been initialized and gfns was allocated correspondlingly.
>> + * return true if dirty ring has been initialized, false otherwise.
>> + */
>> +static bool kvm_vcpu_dirty_ring_initialized(void)
>> +{
>> +    CPUState *cpu;
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    int ncpus = ms->smp.cpus;
>> +
>> +    /*
>> +     * assume vcpu has not been initilaized if generation
>> +     * id less than number of vcpu
>> +     */
>> +    if (ncpus > cpu_list_generation_id_get()) {
>> +        return false;
>> +    }
>> +
>> +    CPU_FOREACH(cpu) {
>> +        if (!cpu->kvm_dirty_gfns) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +
>>   static void *kvm_dirty_ring_reaper_thread(void *data)
>>   {
>>       KVMState *s = data;
>> @@ -1410,6 +1439,13 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>>   
>>       trace_kvm_dirty_ring_reaper("init");
>>   
>> +retry:
>> +    /* don't allow reaping dirty ring if ring buffer hasn't been mapped */
>> +    if (!kvm_vcpu_dirty_ring_initialized()) {
>> +        sleep(1);
> 
> The sleep here is probably not necessary.  Could you instead have a look at
> the other much simpler patch?  
Of course yes, this patch is much more graceful, i'll cherry pick it 
next version.

Here:
> 
> https://lore.kernel.org/qemu-devel/20220927154653.77296-1-peterx@redhat.com/
> 
>> +        goto retry;
>> +    }
>> +
>>       while (true) {
>>           r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
>>           trace_kvm_dirty_ring_reaper("wait");
>> -- 
>> 1.8.3.1
>>
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

