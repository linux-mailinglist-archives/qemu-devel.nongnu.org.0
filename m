Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADF3454FA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 02:26:29 +0100 (CET)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOVoR-0001r5-TX
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 21:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOVnf-0001Ec-VJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:25:39 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOVnc-00086a-Ho
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:25:39 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4DBs5b2yznVR8;
 Tue, 23 Mar 2021 09:23:01 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 09:25:28 +0800
Subject: Re: [PATCH v5 10/10] KVM: Dirty ring support
To: Peter Xu <peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-11-peterx@redhat.com>
 <deeb1fcb-bfad-ec47-49d0-fec7bf4d4391@huawei.com>
 <20210322185213.GD16645@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <df3fd987-31ac-6e5b-e004-856b5da68ca0@huawei.com>
Date: Tue, 23 Mar 2021 09:25:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210322185213.GD16645@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/23 2:52, Peter Xu wrote:
> On Mon, Mar 22, 2021 at 09:37:19PM +0800, Keqian Zhu wrote:
>>> +/* Should be with all slots_lock held for the address spaces. */
>>> +static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
>>> +                                     uint32_t slot_id, uint64_t offset)
>>> +{
>>> +    KVMMemoryListener *kml;
>>> +    KVMSlot *mem;
>>> +
>>> +    if (as_id >= s->nr_as) {
>>> +        return;
>>> +    }
>>> +
>>> +    kml = s->as[as_id].ml;
>>> +    mem = &kml->slots[slot_id];
>>> +
>>> +    if (!mem->memory_size || offset >= (mem->memory_size / TARGET_PAGE_SIZE)) {
>> It seems that TARGET_PAGE_SIZE should be qemu_real_host_page_size.
> 
> Fixed.
> 
> [...]
> 
>>> +/*
>>> + * Flush all the existing dirty pages to the KVM slot buffers.  When
>>> + * this call returns, we guarantee that all the touched dirty pages
>>> + * before calling this function have been put into the per-kvmslot
>>> + * dirty bitmap.
>>> + *
>>> + * This function must be called with BQL held.
>>> + */
>>> +static void kvm_dirty_ring_flush(struct KVMDirtyRingReaper *r)
>> The argument is not used.
> 
> Indeed, removed.
> 
>>
>>> +{
>>> +    trace_kvm_dirty_ring_flush(0);
>>> +    /*
>>> +     * The function needs to be serialized.  Since this function
>>> +     * should always be with BQL held, serialization is guaranteed.
>>> +     * However, let's be sure of it.
>>> +     */
>>> +    assert(qemu_mutex_iothread_locked());
>>> +    /*
>>> +     * First make sure to flush the hardware buffers by kicking all
>>> +     * vcpus out in a synchronous way.
>>> +     */
>>> +    kvm_cpu_synchronize_kick_all();
>> Can we make this function to be architecture specific?
>> It seems that kick out vCPU is an architecture specific way to flush hardware buffers
>> to dirty ring (for x86 PML).
> 
> I can do that, but I'd say it's kind of an overkill if after all the kernel
> support is not there yet, so I still tend to make it as simple as possible.
OK.

> 
> [...]
> 
>>> +static void *kvm_dirty_ring_reaper_thread(void *data)
>>> +{
>>> +    KVMState *s = data;
>>> +    struct KVMDirtyRingReaper *r = &s->reaper;
>>> +
>>> +    rcu_register_thread();
>>> +
>>> +    trace_kvm_dirty_ring_reaper("init");
>>> +
>>> +    while (true) {
>>> +        r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
>>> +        trace_kvm_dirty_ring_reaper("wait");
>>> +        /*
>>> +         * TODO: provide a smarter timeout rather than a constant?
>>> +         */
>>> +        sleep(1);
>>> +
>>> +        trace_kvm_dirty_ring_reaper("wakeup");
>>> +        r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
>>> +
>>> +        qemu_mutex_lock_iothread();
>>> +        kvm_dirty_ring_reap(s);
>>> +        qemu_mutex_unlock_iothread();
>>> +
>>> +        r->reaper_iteration++;
>>> +    }
>> I don't know when does this iteration exit?
>> And I see that we start this reaper_thread in kvm_init(), maybe it's better to start it
>> when start dirty log and stop it when stop dirty log.
> 
> Yes we can make it conditional, but note that we can't hook at functions like
> memory_global_dirty_log_start() because that is only for migration purpose.
> 
> Currently QEMU exports the dirty tracking more than that, e.g., to the VGA
> code.  We'll need to try to detect whether there's any existing MR got its
> mr->dirty_log_mask set (besides global_dirty_log being set).  When all of them
> got cleared we'll need to detect too so as to turn the thread off.
> 
> It's just easier to me to run this thread with such a timeout, then when not
> necessary it'll see empty ring and return fast (index comparison for each
> ring).  Not to mention the VGA dirty tracking should be on for most of the VM
> lifecycle, so even if we have that knob this thread will probably be running
> for 99% of the time as long as any MR has its DIRTY_MEMORY_VGA bit set.
Make sense. Thanks for your explanation!

Thanks,
Keqian
> 
> [...]
> 
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index c68bc3ba8af..2f0991d93f7 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -323,6 +323,11 @@ struct qemu_work_item;
>>>   * @ignore_memory_transaction_failures: Cached copy of the MachineState
>>>   *    flag of the same name: allows the board to suppress calling of the
>>>   *    CPU do_transaction_failed hook function.
>>> + * @kvm_dirty_ring_full:
>>> + *   Whether the kvm dirty ring of this vcpu is soft-full.
>>> + * @kvm_dirty_ring_avail:
>>> + *   Semaphore to be posted when the kvm dirty ring of the vcpu is
>>> + *   available again.
>> The doc does not match code.
> 
> Right; fixed.
> 
> Thanks for taking a look, keqian.
> 

