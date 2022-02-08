Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391894AD570
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:21:36 +0100 (CET)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNcs-0006wH-4a
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nHLwg-00055l-PD
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:33:54 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53971
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nHLwe-0003lt-0o
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:33:54 -0500
HMM_SOURCE_IP: 172.18.0.218:45020.1911127661
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 9D3CA280134;
 Tue,  8 Feb 2022 16:33:42 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 6f8a6be6c3764439b8bf90394119272c for
 peterx@redhat.com; Tue, 08 Feb 2022 16:33:45 CST
X-Transaction-ID: 6f8a6be6c3764439b8bf90394119272c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <da401eae-f7c3-c489-f7dc-64378a6d35a1@chinatelecom.cn>
Date: Tue, 8 Feb 2022 16:33:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 2/5] migration/dirtyrate: refactor dirty page rate
 calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
 <1ecd8924ec4c9f9d35d73c8e3e066c9869e8b298.1643026714.git.huangy81@chinatelecom.cn>
 <YgInPaeq0mUzwv6R@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgInPaeq0mUzwv6R@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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



在 2022/2/8 16:18, Peter Xu 写道:
> On Mon, Jan 24, 2022 at 10:10:37PM +0800, huangy81@chinatelecom.cn wrote:
>> diff --git a/cpus-common.c b/cpus-common.c
>> index 6e73d3e..63159d6 100644
>> --- a/cpus-common.c
>> +++ b/cpus-common.c
>> @@ -73,6 +73,7 @@ static int cpu_get_free_index(void)
>>   }
>>   
>>   CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
>> +unsigned int cpu_list_generation_id;
>>   
>>   void cpu_list_add(CPUState *cpu)
>>   {
>> @@ -84,6 +85,7 @@ void cpu_list_add(CPUState *cpu)
>>           assert(!cpu_index_auto_assigned);
>>       }
>>       QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
>> +    cpu_list_generation_id++;
>>   }
>>   
>>   void cpu_list_remove(CPUState *cpu)
>> @@ -96,6 +98,7 @@ void cpu_list_remove(CPUState *cpu)
>>   
>>       QTAILQ_REMOVE_RCU(&cpus, cpu, node);
>>       cpu->cpu_index = UNASSIGNED_CPU_INDEX;
>> +    cpu_list_generation_id++;
>>   }
> 
> Could you move the cpu list gen id changes into a separate patch?
Yes, of course
> 
>>   
>>   CPUState *qemu_get_cpu(int index)
>> diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
>> new file mode 100644
>> index 0000000..ea4785f
>> --- /dev/null
>> +++ b/include/sysemu/dirtyrate.h
>> @@ -0,0 +1,31 @@
>> +/*
>> + * dirty page rate helper functions
>> + *
>> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
>> + *
>> + * Authors:
>> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef QEMU_DIRTYRATE_H
>> +#define QEMU_DIRTYRATE_H
>> +
>> +extern unsigned int cpu_list_generation_id;
> 
> How about exporting a function cpu_list_generation_id_get() from the cpu code,
> rather than referencing it directly?
Ok, this will be done along with "cpu list gen id changes" in a separate 
patch
> 
>> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
>> +                                 int64_t init_time_ms,
>> +                                 VcpuStat *stat,
>> +                                 unsigned int flag,
>> +                                 bool one_shot)
>> +{
>> +    DirtyPageRecord *records;
>> +    int64_t duration;
>> +    int64_t dirtyrate;
>> +    int i = 0;
>> +    unsigned int gen_id;
>> +
>> +retry:
>> +    cpu_list_lock();
>> +    gen_id = cpu_list_generation_id;
>> +    records = vcpu_dirty_stat_alloc(stat);
>> +    vcpu_dirty_stat_collect(stat, records, true);
>> +
>> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
>> +    cpu_list_unlock();
> 
> Should release the lock before sleep (dirty_stat_wait)?
Good point, since we have introduced the cpu_list_generation_id and make 
sure the we can handle the plug/unplug scenario, we can make the cpu 
plug/unplug as fast as it can. :)
> 
>> +
>> +    global_dirty_log_sync(flag, one_shot);
>> +
>> +    cpu_list_lock();
>> +    if (gen_id != cpu_list_generation_id) {
>> +        g_free(records);
>> +        g_free(stat->rates);
>> +        cpu_list_unlock();
>> +        goto retry;
>> +    }
>> +    vcpu_dirty_stat_collect(stat, records, false);
>> +    cpu_list_unlock();
>> +
>> +    for (i = 0; i < stat->nvcpu; i++) {
>> +        dirtyrate = do_calculate_dirtyrate(records[i], duration);
>> +
>> +        stat->rates[i].id = i;
>> +        stat->rates[i].dirty_rate = dirtyrate;
>> +
>> +        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
>> +    }
>> +
>> +    g_free(records);
>> +
>> +    return duration;
>> +}
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

