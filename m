Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36E671138
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:34:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHyGi-0002ZG-1T; Tue, 17 Jan 2023 21:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pHyGe-0002YE-MU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 21:33:36 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pHyGb-0005Vg-Li
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 21:33:36 -0500
HMM_SOURCE_IP: 172.18.0.188:39498.196468785
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id E47782800AF;
 Wed, 18 Jan 2023 10:32:56 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0023 with ESMTP id ce4ff381cf784cd19d4c5b9ce416bb76 for
 armbru@redhat.com; Wed, 18 Jan 2023 10:33:23 CST
X-Transaction-ID: ce4ff381cf784cd19d4c5b9ce416bb76
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <427c25c1-4bea-c389-ee1f-754952f608c1@chinatelecom.cn>
Date: Wed, 18 Jan 2023 10:33:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RESEND v3 09/10] migration: Export dirty-limit time info
 for observation
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1670087275.git.huangy81@chinatelecom.cn>
 <cover.1670087275.git.huangy81@chinatelecom.cn>
 <522bd838bcc4df6c232a240a71e5c2fa550f3f48.1670087276.git.huangy81@chinatelecom.cn>
 <875ydddtme.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <875ydddtme.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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



在 2023/1/11 22:38, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Export dirty limit throttle time and estimated ring full
>> time, through which we can observe if dirty limit take
>> effect during live migration.
> 
> Suggest something like "Extend query-migrate to provide ..." both here
> and in subject.
> 
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   include/sysemu/dirtylimit.h |  2 ++
>>   migration/migration.c       | 10 ++++++++++
>>   monitor/hmp-cmds.c          | 10 ++++++++++
>>   qapi/migration.json         | 15 ++++++++++++++-
>>   softmmu/dirtylimit.c        | 39 +++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
>> index 8d2c1f3..f15e01d 100644
>> --- a/include/sysemu/dirtylimit.h
>> +++ b/include/sysemu/dirtylimit.h
>> @@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
>>   void dirtylimit_set_all(uint64_t quota,
>>                           bool enable);
>>   void dirtylimit_vcpu_execute(CPUState *cpu);
>> +int64_t dirtylimit_throttle_time_per_full(void);
>> +int64_t dirtylimit_ring_full_time(void);
>>   #endif
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 127d0fe..3f92389 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -62,6 +62,7 @@
>>   #include "yank_functions.h"
>>   #include "sysemu/qtest.h"
>>   #include "sysemu/kvm.h"
>> +#include "sysemu/dirtylimit.h"
>>   
>>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>>   
>> @@ -1114,6 +1115,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>>           info->ram->remaining = ram_bytes_remaining();
>>           info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
>>       }
>> +
>> +    if (migrate_dirty_limit() && dirtylimit_in_service()) {
>> +        info->has_dirty_limit_throttle_time_per_full = true;
>> +        info->dirty_limit_throttle_time_per_full =
>> +                            dirtylimit_throttle_time_per_full();
>> +
>> +        info->has_dirty_limit_ring_full_time = true;
>> +        info->dirty_limit_ring_full_time = dirtylimit_us_ring_full();
>> +    }
>>   }
>>   
>>   static void populate_disk_info(MigrationInfo *info)
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 9ad6ee5..c3aaba3 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -339,6 +339,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>>                          info->cpu_throttle_percentage);
>>       }
>>   
>> +    if (info->has_dirty_limit_throttle_time_per_full) {
>> +        monitor_printf(mon, "dirty-limit throttle time: %" PRIi64 " us\n",
>> +                       info->dirty_limit_throttle_time_per_full);
>> +    }
>> +
>> +    if (info->has_dirty_limit_ring_full_time) {
>> +        monitor_printf(mon, "dirty-limit ring full time: %" PRIi64 " us\n",
>> +                       info->dirty_limit_ring_full_time);
>> +    }
> 
> I discuss naming below.  If we change the names, we probably want to
> change the string literals here, too.
> 
>> +
>>       if (info->has_postcopy_blocktime) {
>>           monitor_printf(mon, "postcopy blocktime: %u\n",
>>                          info->postcopy_blocktime);
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 6055fdc..ae7d22d 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -242,6 +242,17 @@
>>   #                   Present and non-empty when migration is blocked.
>>   #                   (since 6.0)
>>   #
>> +# @dirty-limit-throttle-time-per-full: Maximum throttle time (in microseconds) of virtual
>> +#                                      CPUs each dirty ring full round, used to observe
> 
> What's a dirty "ring full round"?  Is it a migration round?  Something
> else?
No, not migration round.

When dirty ring is full and return to userspace due to the exception 
"KVM_EXIT_DIRTY_RING_FULL"。 The "dirty-limit" logic would make vcpu 
sleep some time, which is adjusted dynamically every exception, and 
which is represented by the "dirty-limit-throttle-time-per-full".

As to "dirty ring full round" (sorry about that i failed to make it 
clear), It represents one round that dirty ring of vCPU is full.
> 
>> +#                                      if dirty-limit take effect during live migration.
> 
> takes effect
> 
> I think "if dirty-limit takes effect" isn't quite right.  We can use
> this to observe how MigrationCapability dirty-limit affects the guest.
> What about "shows how MigrationCapability dirty-limit affects the
> guest"?
It's better than what i described.

> 
> Even though dirty-limit-throttle-time-per-full is quite long, it still
> feels abbreviated.  Full what?  What about
> dirty-limit-throttle-time-per-round?  Naming is hard.
It's ok

> 
>> +#                                      (since 7.3)
>> +#
>> +# @dirty-limit-ring-full-time: Estimated average dirty ring full time (in microseconds)
>> +#                              each dirty ring full round, note that the value equals
>> +#                              dirty ring memory size divided by average dirty page rate
>> +#                              of virtual CPU, which can be used to observe the average
>> +#                              memory load of virtual CPU indirectly. (since 7.3)
>> +#
> 
> Uff.
> 
> What is estimated?  The average amount of time the dirty ring (whatever
> that is) is full in each migration round?
Yes. Since we could not monitor the actual time, the value is calculated 
by the formula:
dirty ring full time = dirty ring size / dirty page rate.

> 
> Aside: our doc comment syntax can push text blocks far to the right.
> Not good.  Also not your fault, and not your problem to fix.
> 
>>   # Since: 0.14
>>   ##
>>   { 'struct': 'MigrationInfo',
>> @@ -259,7 +270,9 @@
>>              '*postcopy-blocktime' : 'uint32',
>>              '*postcopy-vcpu-blocktime': ['uint32'],
>>              '*compression': 'CompressionStats',
>> -           '*socket-address': ['SocketAddress'] } }
>> +           '*socket-address': ['SocketAddress'],
>> +           '*dirty-limit-throttle-time-per-full': 'int64',
>> +           '*dirty-limit-ring-full-time': 'int64'} }
>>   
>>   ##
>>   # @query-migrate:
> 
> [...]
> 

-- 
Best regard

Hyman Huang(黄勇)

