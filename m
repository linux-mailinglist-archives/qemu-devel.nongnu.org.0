Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3563E6F9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 02:15:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Y9N-0005MB-6q; Wed, 30 Nov 2022 20:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p0Y9D-0005KT-4v
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 20:13:55 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p0Y9A-00063M-Aa
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 20:13:54 -0500
HMM_SOURCE_IP: 172.18.0.188:35654.1752127289
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.82 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 369202800CA;
 Thu,  1 Dec 2022 09:13:22 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([125.69.43.82])
 by app0023 with ESMTP id 83396077f2c445f2b3a0dd33e48b2a0e for
 peterx@redhat.com; Thu, 01 Dec 2022 09:13:43 CST
X-Transaction-ID: 83396077f2c445f2b3a0dd33e48b2a0e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.43.82
X-MEDUSA-Status: 0
Message-ID: <1e4a21e7-ec84-2646-a629-e553a2f50a06@chinatelecom.cn>
Date: Thu, 1 Dec 2022 09:13:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 07/11] migration: Implement dirty-limit convergence algo
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <5727cd0876e1a8d3db451feb46afb3281875cca3.1669047366.git.huangy81@chinatelecom.cn>
 <Y4aS9UjwNabKMAHN@x1n>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Y4aS9UjwNabKMAHN@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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



在 2022/11/30 7:17, Peter Xu 写道:
> On Mon, Nov 21, 2022 at 11:26:39AM -0500, huangy81@chinatelecom.cn wrote:
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 86950a1..096b61a 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -240,6 +240,7 @@ void migration_cancel(const Error *error)
>>       if (error) {
>>           migrate_set_error(current_migration, error);
>>       }
>> +    qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
> 
> Disable it only if migrate_dirty_limit() is true?  It seems okay if the
> admin wants to use dirtylimit separately from migration.
Ok.
> 
>>       migrate_fd_cancel(current_migration);
>>   }
> 
> [...]
> 
>> @@ -1148,22 +1175,31 @@ static void migration_trigger_throttle(RAMState *rs)
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
> 
> Does dirtylimit cap needs to check blk_mig_bulk_active() too?  I assume
> that check was used to ignore the bulk block migration phase where major
> bandwidth will be consumed by block migrations so the measured bandwidth is
> not accurate.  IIUC it applies to dirtylimit too.Indeed, i'll add this next version.
> 
>>               trace_migration_throttle();
>> -            rs->dirty_rate_high_cnt = 0;
>>               mig_throttle_guest_down(bytes_dirty_period,
>>                                       bytes_dirty_threshold);
>> +        } else if (migrate_dirty_limit() &&
>> +                   kvm_dirty_ring_enabled() &&
>> +                   migration_is_active(s)) {
> 
> Is "kvm_dirty_ring_enabled()" and "migration_is_active(s)" check helpful?
> Can we only rely on migrate_dirty_limit() alone?
In qmp_set_vcpu_dirty_limit, it checks if kvm enabled and dirty ring 
size set. When "dirty-limit" capability set, we also check this in 
migrate_caps_check, so kvm_dirty_ring_enabled can be dropped indeed.

As for migration_is_active, dirty-limit can be set anytime and migration 
is active already in the path. It also can be dropped.

I'll fix this next version.
> 

