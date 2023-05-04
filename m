Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650E6F6731
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:23:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUFM-0000N8-PX; Thu, 04 May 2023 04:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puUFJ-0000Kx-PT
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:23:25 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puUFG-00008U-Fp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:23:25 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 4E22E60BE6;
 Thu,  4 May 2023 11:23:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43e::1:b] (unknown
 [2a02:6b8:b081:b43e::1:b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id DNKVuf0MouQ0-YZwXoAYY; Thu, 04 May 2023 11:23:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683188594; bh=ytjfhwxrObHkf97iflKUUg4Mi2qkk478HrWfdl71nOU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=bLOhIOYZjAd9oVgOAwcnmu3MRJZlAyQ+cW/KEXqeN9iBi5d+XHhAo53Bye1iSh0AA
 VPJCFoQyqIbo5ID3m66gCJ9YhqgiuSd6cC62MKG46Px7vF+XkpkCDKaWCFNpyEpQWm
 o5NxJXq/AcjO5lV6igWc6tcYowsZpMuH9+y6JxYQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b0d9e820-6ee1-0e49-2195-f535bcc00555@yandex-team.ru>
Date: Thu, 4 May 2023 11:23:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "quintela@redhat.com" <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
 <MWHPR11MB003113F9302058F9BA7F20479B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB003113F9302058F9BA7F20479B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04.05.23 11:09, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Saturday, April 29, 2023 3:49 AM
>> To: qemu-devel@nongnu.org
>> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
>> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Peter Xu
>> <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
>> Subject: [PATCH v4 09/10] migration: disallow change capabilities in COLO
>> state
>>
>> COLO is not listed as running state in migrate_is_running(), so, it's
>> theoretically possible to disable colo capability in COLO state and the
>> unexpected error in migration_iteration_finish() is reachable.
>>
>> Let's disallow that in qmp_migrate_set_capabilities. Than the error becomes
>> absolutely unreachable: we can get into COLO state only with enabled
>> capability and can't disable it while we are in COLO state. So substitute the
>> error by simple assertion.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   migration/migration.c | 5 +----
>>   migration/options.c   | 2 +-
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c index
>> 0d912ee0d7..8c5bbf3e94 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2751,10 +2751,7 @@ static void
>> migration_iteration_finish(MigrationState *s)
>>           runstate_set(RUN_STATE_POSTMIGRATE);
>>           break;
>>       case MIGRATION_STATUS_COLO:
>> -        if (!migrate_colo()) {
>> -            error_report("%s: critical error: calling COLO code without "
>> -                         "COLO enabled", __func__);
>> -        }
>> +        assert(migrate_colo());
>>           migrate_start_colo_process(s);
>>           s->vm_was_running = true;
>>           /* Fallthrough */
>> diff --git a/migration/options.c b/migration/options.c index
>> 865a0214d8..f461d02eeb 100644
>> --- a/migration/options.c
>> +++ b/migration/options.c
>> @@ -598,7 +598,7 @@ void
>> qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>>       MigrationCapabilityStatusList *cap;
>>       bool new_caps[MIGRATION_CAPABILITY__MAX];
>>
>> -    if (migration_is_running(s->state)) {
>> +    if (migration_is_running(s->state) || migration_in_colo_state()) {
> 
> Make the "MIGRATION_STATUS_COLO" into the " migration_is_running()" is a better way?

I wasn't sure that that's correct.. migration_is_running() is used in several places, to do so, I'd have to analyze them all.

> Like the "migration_is_setup_ot_active()".
> 
> Thanks
> Chen
> 
>>           error_setg(errp, QERR_MIGRATION_ACTIVE);
>>           return;
>>       }
>> --
>> 2.34.1
> 

-- 
Best regards,
Vladimir


