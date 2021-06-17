Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD353AAA8D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 06:51:16 +0200 (CEST)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltjzn-0005xz-DT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 00:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltjyt-0005Ek-Ix
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 00:50:20 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:60208
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltjyj-0007PD-QU
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 00:50:19 -0400
HMM_SOURCE_IP: 172.18.0.218:59188.133457744
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.242?logid-1fdf78fff46b4c18b33a9671501d6fd9
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id DC672280081;
 Thu, 17 Jun 2021 12:49:53 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 1fdf78fff46b4c18b33a9671501d6fd9 for
 zhengchuan@huawei.com; Thu Jun 17 12:49:58 2021
X-Transaction-ID: 1fdf78fff46b4c18b33a9671501d6fd9
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v4 2/6] memory: make global_dirty_log a bitmask
To: Peter Xu <peterx@redhat.com>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <3848028c3029e2e870286c84c2b3e9a93967567e.1623804189.git.huangy81@chinatelecom.cn>
 <YMoXQxNW0EHGXCS8@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <6b74cc3d-49ba-143b-d0eb-946874580390@chinatelecom.cn>
Date: Thu, 17 Jun 2021 12:49:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMoXQxNW0EHGXCS8@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.17,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/16 23:22, Peter Xu 写道:
> On Wed, Jun 16, 2021 at 09:12:28AM +0800, huangy81@chinatelecom.cn wrote:
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index b114f54..e31eef2 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -55,7 +55,11 @@ static inline void fuzz_dma_read_cb(size_t addr,
>>   }
>>   #endif
>>   
>> -extern bool global_dirty_log;
>> +/* what is the purpose of current dirty log, migration or dirty rate ? */
> 
> Nitpick: I'll make it:
> 
>    /* Possible bits for global_dirty_log */
> 
>    /* Dirty tracking enabled because migration is running */
>    #define GLOBAL_DIRTY_MIGRATION  (1U << 0)
> 
>    /* Dirty tracking enabled because measuring dirty rate */
>    #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
> 
>> +#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
>> +#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
>> +
>> +extern unsigned int global_dirty_log;
>>   
>>   typedef struct MemoryRegionOps MemoryRegionOps;
>>   
> 
> [...]
> 
>> @@ -39,7 +39,7 @@
>>   static unsigned memory_region_transaction_depth;
>>   static bool memory_region_update_pending;
>>   static bool ioeventfd_update_pending;
>> -bool global_dirty_log;
>> +unsigned int global_dirty_log;
> 
> I'm wondering whether it's a good chance to rename it to global_dirty_tracking,
> because "logging" has a hint on the method while it's not the only one now.
yeah, all references to global_dirty_log should be modified and can this 
be done in a single patch before this patchset?
> 
>>   
>>   static QTAILQ_HEAD(, MemoryListener) memory_listeners
>>       = QTAILQ_HEAD_INITIALIZER(memory_listeners);
>> @@ -2659,14 +2659,19 @@ void memory_global_after_dirty_log_sync(void)
>>   
>>   static VMChangeStateEntry *vmstate_change;
>>   
>> -void memory_global_dirty_log_start(void)
>> +void memory_global_dirty_log_start(unsigned int flags)
>>   {
>>       if (vmstate_change) {
>>           qemu_del_vm_change_state_handler(vmstate_change);
>>           vmstate_change = NULL;
>>       }
>>   
>> -    global_dirty_log = true;
>> +#define  GLOBAL_DIRTY_MASK  (0x3)
>> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
>> +    assert(global_dirty_log ^ flags);
> 
> Heh, this is probably my fault... I think what I wanted to suggest is actually:
> 
>         assert(!(global_dirty_log & flags));
this is more graceful if concerning about only one of the reason can 
start dirty tracking at once. I'll pick up it in the next version.
> 
> Then for stop() below...
> 
>> +    global_dirty_log |= flags;
>> +
>> +    trace_global_dirty_changed(global_dirty_log);
>>   
>>       MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
>>   
>> @@ -2676,9 +2681,12 @@ void memory_global_dirty_log_start(void)
>>       memory_region_transaction_commit();
>>   }
>>   
>> -static void memory_global_dirty_log_do_stop(void)
>> +static void memory_global_dirty_log_do_stop(unsigned int flags)
>>   {
>> -    global_dirty_log = false;
>> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> 
> ... it should probably be:
> 
>         assert((global_dirty_log & flags) == flags);
> 
> Sorry about the confusion.
not at all, since i'm not figure out how this bitmask works clearly, 
thanks a lot for your guidance.
> 

-- 
Best regard

Hyman Huang(黄勇)

