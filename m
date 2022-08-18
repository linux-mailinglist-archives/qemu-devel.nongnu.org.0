Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FEC59899B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 19:02:56 +0200 (CEST)
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiuz-0000YZ-V7
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 13:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oOirZ-0006gC-F3
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:59:21 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:35716
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oOirX-0006eR-5V
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:59:21 -0400
HMM_SOURCE_IP: 172.18.0.48:55434.636073342
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.115 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 66F242800B7;
 Fri, 19 Aug 2022 00:59:06 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id e2dea7a78ec44f4180807d854ff456da for
 peterx@redhat.com; Fri, 19 Aug 2022 00:59:09 CST
X-Transaction-ID: e2dea7a78ec44f4180807d854ff456da
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <9b158a58-181a-b3fc-a75e-89a2377c3b96@chinatelecom.cn>
Date: Fri, 19 Aug 2022 00:59:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/8] migration: Implement dirty-limit convergence algo
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <a2fc4b9a622fbefcad1750b13fcb924caf60ec0b.1658561555.git.huangy81@chinatelecom.cn>
 <Yv1nCNl9wzNmocM0@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Yv1nCNl9wzNmocM0@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/8/18 6:09, Peter Xu 写道:
> On Sat, Jul 23, 2022 at 03:49:16PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirty-limit convergence algo for live migration,
>> which is kind of like auto-converge algo but using dirty-limit
>> instead of cpu throttle to make migration convergent.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   migration/ram.c        | 53 +++++++++++++++++++++++++++++++++++++-------------
>>   migration/trace-events |  1 +
>>   2 files changed, 41 insertions(+), 13 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index b94669b..2a5cd23 100644
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
>> +        int64_t quota_dirtyrate = s->parameters.vcpu_dirty_limit;
>> +
>> +        /* Set quota dirtyrate if dirty limit not in service */
>> +        qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
>> +        trace_migration_dirty_limit_guest(quota_dirtyrate);
>> +    }
>> +}
> 
> What if migration is cancelled?  Do we have logic to stop the dirty limit,
> or should we?
Yes, we should have logic to stop dirty limit, i'll add that.
Thanks for your suggestion. :)

Yong
> 

