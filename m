Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1C3AD039
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:18:37 +0200 (CEST)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHCW-0006ee-8T
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luHBH-0004YP-4j
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:17:19 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:39181
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luHBE-0006Mj-AT
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:17:18 -0400
HMM_SOURCE_IP: 172.18.0.48:52264.1752682116
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.195?logid-fed5689284b5420a9bd2bfd1a9c08097
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 7DCD928008C;
 Sat, 19 Jun 2021 00:17:04 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id fed5689284b5420a9bd2bfd1a9c08097 for
 zhengchuan@huawei.com; Sat Jun 19 00:17:05 2021
X-Transaction-ID: fed5689284b5420a9bd2bfd1a9c08097
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v8 2/6] memory: make global_dirty_tracking a bitmask
To: Peter Xu <peterx@redhat.com>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
 <0065e888fde8114be8a66406389cd75f014a0dd8.1624028590.git.huangy81@chinatelecom.cn>
 <YMy/5togwdtCK3z8@t490s>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <2693c2a4-29f0-e196-c97c-985584c19419@chinatelecom.cn>
Date: Sat, 19 Jun 2021 00:16:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMy/5togwdtCK3z8@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.202,
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



在 2021/6/18 23:46, Peter Xu 写道:
> On Fri, Jun 18, 2021 at 11:32:03PM +0800, huangy81@chinatelecom.cn wrote:
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index b114f54..dd2404f 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -55,7 +55,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
>>   }
>>   #endif
>>   
>> -extern bool global_dirty_log;
>> +/* Possible bits for global_dirty_log */
> 
> s/log/tracking/
here, we just rename global_dirty_log to global_dirty_tracking, but the 
function name remain the same? such as:
memory_global_dirty_log_start/memory_global_dirty_log_stop
> 
> [...]
> 
>> -static void memory_global_dirty_log_do_stop(void)
>> +static void memory_global_dirty_log_do_stop(unsigned int flags)
>>   {
>> -    global_dirty_log = false;
>> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
>> +    assert((global_dirty_tracking & flags) == flags);
>> +    global_dirty_tracking &= ~flags;
>> +
>> +    trace_global_dirty_changed(global_dirty_tracking);
>>   
>>       /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
>>       memory_region_transaction_begin();
>> @@ -2691,8 +2699,9 @@ static void memory_global_dirty_log_do_stop(void)
>>   static void memory_vm_change_state_handler(void *opaque, bool running,
>>                                              RunState state)
>>   {
>> +    unsigned int *flags = (unsigned int *)opaque;
> 
> [1]
> 
>>       if (running) {
>> -        memory_global_dirty_log_do_stop();
>> +        memory_global_dirty_log_do_stop(*flags);
>>   
>>           if (vmstate_change) {
>>               qemu_del_vm_change_state_handler(vmstate_change);
>> @@ -2701,18 +2710,19 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
>>       }
>>   }
>>   
>> -void memory_global_dirty_log_stop(void)
>> +void memory_global_dirty_log_stop(unsigned int flags)
>>   {
>>       if (!runstate_is_running()) {
>>           if (vmstate_change) {
>>               return;
>>           }
>>           vmstate_change = qemu_add_vm_change_state_handler(
>> -                                memory_vm_change_state_handler, NULL);
>> +                                memory_vm_change_state_handler,
>> +                                (void *)&flags);
> 
> If to drop malloc/free, we need to cast it with (void *)flags.  &flags is the
> address of the local var, which will lost its meaning after the function
> returns..
> 
> Then at [1] it should be "unsigned int flags = (unsigned int)opaque;".
> 

