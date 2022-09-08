Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5F5B20B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:37:54 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIf8-0008C2-4R
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oWId1-00069w-Px
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:35:42 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:55899
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oWIcy-0007HA-6t
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:35:39 -0400
HMM_SOURCE_IP: 172.18.0.218:37440.345654206
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.96.92 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 5A8CE28008F;
 Thu,  8 Sep 2022 22:35:11 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id dd439ef2ec1941c392f78d29129f8e68 for
 peterx@redhat.com; Thu, 08 Sep 2022 22:35:16 CST
X-Transaction-ID: dd439ef2ec1941c392f78d29129f8e68
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <7022f34e-76d5-7287-74eb-846ae62e0f42@chinatelecom.cn>
Date: Thu, 8 Sep 2022 22:35:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 4/8] migration: Implement dirty-limit convergence algo
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <4b42dedc0d1ed336ef39c604f3aa1611745a3917.1662052189.git.huangy81@chinatelecom.cn>
 <Yxevn7rSCKaPHQfd@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Yxevn7rSCKaPHQfd@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/9/7 4:37, Peter Xu 写道:
> On Fri, Sep 02, 2022 at 01:22:32AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirty-limit convergence algo for live migration,
>> which is kind of like auto-converge algo but using dirty-limit
>> instead of cpu throttle to make migration convergent.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   migration/migration.c  |  1 +
>>   migration/ram.c        | 53 +++++++++++++++++++++++++++++++++++++-------------
>>   migration/trace-events |  1 +
>>   3 files changed, 42 insertions(+), 13 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index d117bb4..64696de 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -239,6 +239,7 @@ void migration_cancel(const Error *error)
>>       if (error) {
>>           migrate_set_error(current_migration, error);
>>       }
>> +    qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
>>       migrate_fd_cancel(current_migration);
>>   }
>>   
>> diff --git a/migration/ram.c b/migration/ram.c
>> index dc1de9d..cc19c5e 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -45,6 +45,7 @@
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-types-migration.h"
>>   #include "qapi/qapi-events-migration.h"
>> +#include "qapi/qapi-commands-migration.h"
>>   #include "qapi/qmp/qerror.h"
>>   #include "trace.h"
>>   #include "exec/ram_addr.h"
>> @@ -57,6 +58,8 @@
>>   #include "qemu/iov.h"
>>   #include "multifd.h"
>>   #include "sysemu/runstate.h"
>> +#include "sysemu/dirtylimit.h"
>> +#include "sysemu/kvm.h"
>>   
>>   #include "hw/boards.h" /* for machine_dump_guest_core() */
>>   
>> @@ -1139,6 +1142,21 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
>>       }
>>   }
>>   
>> +/*
>> + * Enable dirty-limit to throttle down the guest
>> + */
>> +static void migration_dirty_limit_guest(void)
>> +{
>> +    if (!dirtylimit_in_service()) {
>> +        MigrationState *s = migrate_get_current();
>> +        int64_t quota_dirtyrate = s->parameters.x_vcpu_dirty_limit;
>> +
>> +        /* Set quota dirtyrate if dirty limit not in service */
>> +        qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
>> +        trace_migration_dirty_limit_guest(quota_dirtyrate);
>> +    }
>> +}
>> +
>>   static void migration_trigger_throttle(RAMState *rs)
>>   {
>>       MigrationState *s = migrate_get_current();
>> @@ -1148,22 +1166,31 @@ static void migration_trigger_throttle(RAMState *rs)
>>       uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
>>       uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
>>   
>> -    /* During block migration the auto-converge logic incorrectly detects
>> -     * that ram migration makes no progress. Avoid this by disabling the
>> -     * throttling logic during the bulk phase of block migration. */
>> -    if (migrate_auto_converge() && !blk_mig_bulk_active()) {
>> -        /* The following detection logic can be refined later. For now:
>> -           Check to see if the ratio between dirtied bytes and the approx.
>> -           amount of bytes that just got transferred since the last time
>> -           we were in this routine reaches the threshold. If that happens
>> -           twice, start or increase throttling. */
>> -
>> -        if ((bytes_dirty_period > bytes_dirty_threshold) &&
>> -            (++rs->dirty_rate_high_cnt >= 2)) {
>> +    /*
>> +     * The following detection logic can be refined later. For now:
>> +     * Check to see if the ratio between dirtied bytes and the approx.
>> +     * amount of bytes that just got transferred since the last time
>> +     * we were in this routine reaches the threshold. If that happens
>> +     * twice, start or increase throttling.
>> +     */
>> +
>> +    if ((bytes_dirty_period > bytes_dirty_threshold) &&
>> +        (++rs->dirty_rate_high_cnt >= 2)) {
>> +        rs->dirty_rate_high_cnt = 0;
>> +        /*
>> +         * During block migration the auto-converge logic incorrectly detects
>> +         * that ram migration makes no progress. Avoid this by disabling the
>> +         * throttling logic during the bulk phase of block migration
>> +         */
>> +
>> +        if (migrate_auto_converge() && !blk_mig_bulk_active()) {
>>               trace_migration_throttle();
>> -            rs->dirty_rate_high_cnt = 0;
>>               mig_throttle_guest_down(bytes_dirty_period,
>>                                       bytes_dirty_threshold);
>> +        } else if (migrate_dirty_limit() &&
>> +                   kvm_dirty_ring_enabled() &&
>> +                   migration_is_active(s)) {
>> +            migration_dirty_limit_guest();
> 
> We'll call this multiple time, but only the 1st call will make sense, right?
Yes.
> 
> Can we call it once somewhere?  E.g. at the start of migration?It make sense indeed, if dirtylimit run once migration start, the 
behavior of dirtylimit migration would be kind of different from 
auto-converge, i mean, dirtylimit will make guest write vCPU slow no 
matter if dirty_rate_high_cnt exceed 2 times. For those vms that dirty 
memory lightly, they can get convergent without throttle, but in the new 
way ,if we set the dirtylimit to a very low value, they may suffer 
restriction. Can we accept that ?
> 
> Thanks,
> 

