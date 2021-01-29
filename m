Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F530870D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:33:58 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PE5-0005dC-OE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l5PCY-0004iK-Di
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:32:22 -0500
Received: from mail-eopbgr30102.outbound.protection.outlook.com
 ([40.107.3.102]:26383 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l5PCU-0002B7-9J
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:32:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmrfQjjsC3ASSKJBxl0CtgXRAJuQ/2V1wc+VSOT/UTIkaIvlar/TeQWcJ/RZlUHsr0TC7Rg/KQKQe6IepQ3vS7Cmrh7//7ziX/iOO0CITggT8a65fjZjPNBIyymhIOiAqF96gkwsaHOPOr+npKPcdGiCztVon3hcspwFidFXKt0CfvNPUZS7tQvWO0CQrFocUqUjfZj5tk1ZgJZkjmYezyMp9eXFzS+yGvZ/WPx7gZ/Lgwk7so6d5gqbLO3e8OvFPkFSAzCq0qSIQCZJcDiJcFMT7LGn6fCAWrBguy3iFuqcHdnujVaUP6F18c+oaK9GsiULYzI1bbdwwv3vOy0IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFXn+Cm5RV8q55iICCzlOCPEWrWh8eIbqbvij7SNSaU=;
 b=e2lid6qW2REoM6ncx/GdYqCRImguIJnuRm9H5HM1Dy0FhR19dE3kTl5e0Eej4SqfP1wpQkGvh2sj/1qKGCePDkAkEncMzt+o3AxkTWBWLhREElcv5/xvB5u8tt9OmQJvMHyddAwIkGmXksQyOvoF2dMs6B1xVgc0SwrBXmejkTrRX1pU3tED4hUwOrVUCBf5mKpcT4pN5fUumaak+E4yMCbIDCDhQbPkP6wjYuzbATZVPYmufb/kFALxhZsXTSv1gFOppj5pBQs8ivl6/M1m7lhTam/VOVtKVCWWZQFrbjxS+Bt3EgVW2W+G0CyHAGJhvQGzHrHr880zPV7YUsm6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFXn+Cm5RV8q55iICCzlOCPEWrWh8eIbqbvij7SNSaU=;
 b=T0zLavtKvZ03gZENgnjD3Vnb0Q7Wt6swgK4x3Hy0l8buHumDZ7f7+Y5HbE5BuyHkvC24UteI+WU4n+zmM0YQmINavJw3GEhfTdnxk6Lsp93eNacgjiUFkVkY+NSXKCUWMt1mrQBpNsSODn6XJLOGFce43OzeKiBSHgG1YOmBFhQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB6067.eurprd08.prod.outlook.com (2603:10a6:20b:287::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 08:17:11 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:17:10 +0000
Subject: Re: [PATCH v13 4/5] migration: implementation of background snapshot
 thread
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <20210121152458.193248-5-andrey.gruzdev@virtuozzo.com>
 <20210128182904.GH2951@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <5f1ad08d-9fbd-bc9e-3da4-03070534d940@virtuozzo.com>
Date: Fri, 29 Jan 2021 11:17:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210128182904.GH2951@work-vm>
Content-Type: multipart/alternative;
 boundary="------------92AB575CF0B77155354965F1"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR05CA0073.eurprd05.prod.outlook.com
 (2603:10a6:208:136::13) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR05CA0073.eurprd05.prod.outlook.com (2603:10a6:208:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Fri, 29 Jan 2021 08:17:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1463fca-f5dc-4784-bad6-08d8c42e4580
X-MS-TrafficTypeDiagnostic: AM9PR08MB6067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB606740BB9E6FE1D4ACE80C139FB99@AM9PR08MB6067.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d16bB274ega7jHzR4SHAYq7VoEJFzfJLxk5oPLwdlyz/DKQy6GKqQ3K3ryRXfmZb/A46V1cWJU5m8BxQCFfhhuLNGmOl/CzI2XXYOK9ZRjd5y7z3SgSrsyR4QtQGzkKAs9zNHnivs1ChNPo6qF0b1NfhAyabOdCRL15F6EKoF4gsYOSvVR43TrPyHd8QuYsQRuOGuPfm8OmuEgFY2INJ7bplVA5NldiXG30HAFh98tx51c4niMKRdNjCCNkmI5OgzcWMTEI/IUamlL3r6IujT7t157K/e+SnDIEL4B0KSatVdszjQF57dLHzef9b0zX94gyhCCUUG7D0J6oPa40F1aiGPewgRYLImdTktmiGg3G+Qf9BkdabEF1cqCRn9YLTrN9538Dazg51V96rsYwP36OtCtA3UlqVoKFXp05c528OfzM1KwZmcMO/sYg018rMltAs28KMXCCNrcZrksiOg665nWKjo6ksqCk6B/Kyy335q4EyXk9If2hSloQ/SYki+kRauEAwE4ooKllkwkAhpBjdr4qFid3I0eG7FmW+/HG2ZzB6PMUFgWiWVBgg6lEa/VMJASYCgShlVG+OIkW9ShkGb6Oh2XHRQOHC7XR8F9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(346002)(396003)(376002)(33964004)(31686004)(6486002)(83380400001)(36756003)(4326008)(31696002)(2906002)(54906003)(86362001)(16576012)(316002)(16526019)(186003)(30864003)(6916009)(52116002)(44832011)(8676002)(2616005)(53546011)(8936002)(478600001)(956004)(26005)(66946007)(5660300002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2drWTFLQVorVW0rVUltS0NTVkc1V2NldzczSWRUYzF0OFhFTjJiUFNOa1pq?=
 =?utf-8?B?aitQN3lybVI4ZURMWmNkUkNnMWxHcVFKejNnc1Jyc1J5czVEL2ZDdEdCM0ww?=
 =?utf-8?B?R0RwQUhjcFQzQzgrK25ZRXRmSHFSWG1uQ3hLeWNodDNkZ1F5LzllQ3d5V3Bk?=
 =?utf-8?B?K1ZZajRKckdJeXdPOENhMDZKVkNha2QzSGdKaHhQUHB6Q1MvVklzRzJwR2pr?=
 =?utf-8?B?bk9GQ2lXeXIyQ3ZSa25vdnhodlRMOEtnMElocWFJVi83bG1FbUlKdXFyVy9i?=
 =?utf-8?B?Rk00UXp2NzJmemlleE9ZTFNEWFA5TXdoMW5ITTlRNEkyS2NYN2c5WHE2RzVX?=
 =?utf-8?B?Rk1oKzlyZHZRS3ZnRnJ4ZmpRSWJKcThGdUQvdGZqNlh1M0VVWlM3bVYwSkZR?=
 =?utf-8?B?NTVuYXlhU1NSYy8xMFRZajJrRC9mRFZGeXlDY2VHSFpWdUFQbEs1Nmx4dit0?=
 =?utf-8?B?Zm1aQ3BIaklCT3F5aGt6cE9qdk8vTGhxaXAxdDZOVGNrY3hmekNvaWN4TG9k?=
 =?utf-8?B?R2ZMejJxQWthYnN2cTBQV25GdUlWYkdCY1F4OER3NzFPalo1QllFbTE2Vncx?=
 =?utf-8?B?ZWxFWjIwUWtaNEl4WFlpb0xIN1pPQW1JN0JHVlN2ZnFvdG1BTWdscnc2WGgz?=
 =?utf-8?B?dEdmL1ZUaDJNVWpRS3BJaWpmeHM1ekdORzFLNkFBZmJyczRWZXFGMENPTXg1?=
 =?utf-8?B?cEJWOGRwNERwYjY1cUlJSkJYa3ZoYUpkZTdMeG5LL29jdkF3SS9jT3I5TnVW?=
 =?utf-8?B?K2FnRlN0MzZRdVdIYTlCeHBrMy9iS0xzZkN3RTdEbGc2T09HNWhBUGxlVElu?=
 =?utf-8?B?WnU5Skh6NHVDcGJ3cVdKZ0Y1YWo2Mm1RQndsZ2VweUFnOW9KOXhSam1QUVQx?=
 =?utf-8?B?cGpDU2dqVjR3WnF0NUFlVmsxeHV0NWQ5c1Z3bk1sZ2t4WklLZUF2RktmRGVG?=
 =?utf-8?B?Zi9pYzBBTEpHSjZuY1VvN25pZkJMazN4THprMlYzc3dPbmJ1WHlsbEI0NHBQ?=
 =?utf-8?B?SW0vTE9aczV6TXRmNUFMaHdNaTBRaWFaRDErQ0pPN1BQUXFBMWswQStib2Rm?=
 =?utf-8?B?YlVkcWVnK0RWZ01DK3NQNjlaekJ2eFhOZjNGaGVoTk0veFFEZUM1WDFVRUZQ?=
 =?utf-8?B?VjN2cEtTWUZiZitWYlppektUMHd3TS9hbWRjWWVPaUM4NlFFU1l4aHRnY1hN?=
 =?utf-8?B?R2NCbmFDNWFoTmZneGRuMTdiMk5FWXgxQWttMUc2eXZYaysvOWFDamZoVGh5?=
 =?utf-8?B?VkRSNkJBODAxc25LL2lmaGJMUGt5eERWZ3o3S21uUGRSQ29tOUlVamVWNVZZ?=
 =?utf-8?B?RnBNV0xYQS9tT0ZEQ1V3RUlsVGFqRExQL2I2WW1OZXlTQnF3STQ0aHlvTHN5?=
 =?utf-8?B?UHU1RE83RGYxVEE2VVpXWFFHS1IwY1I1Nlp4cFZnb3lDOHQ3TXNSSmlxakVs?=
 =?utf-8?Q?U4IZU+XU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1463fca-f5dc-4784-bad6-08d8c42e4580
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:17:10.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXg8B+Fs0PVM+4cTyb4FEacPlcFUO0HbjkFBY6Unn/uFiBg2muW5GgJ9JOrtO11SVuNMX1wIOFxCNyQHT1lK4jSKJ6QtDlyYD1Dazmf3pwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6067
Received-SPF: pass client-ip=40.107.3.102;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------92AB575CF0B77155354965F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.01.2021 21:29, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> Introducing implementation of 'background' snapshot thread
>> which in overall follows the logic of precopy migration
>> while internally utilizes completely different mechanism
>> to 'freeze' vmstate at the start of snapshot creation.
>>
>> This mechanism is based on userfault_fd with wr-protection
>> support and is Linux-specific.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Acked-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Thanks for fixing the thread name; I've just noticed something though:
>
>> ---
>>   migration/migration.c | 263 ++++++++++++++++++++++++++++++++++++++++--
>>   migration/migration.h |   3 +
>>   migration/savevm.c    |   1 -
>>   migration/savevm.h    |   2 +
>>   4 files changed, 258 insertions(+), 11 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index f018337fbc..869afa7a86 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1130,7 +1130,6 @@ static void fill_source_migration_info(MigrationInfo *info)
>>       info->status = s->state;
>>   }
>>   
>> -#ifdef CONFIG_LINUX
>>   typedef enum WriteTrackingSupport {
>>       WT_SUPPORT_UNKNOWN = 0,
>>       WT_SUPPORT_ABSENT,
>> @@ -1155,7 +1154,6 @@ WriteTrackingSupport migrate_query_write_tracking(void)
>>   
>>       return WT_SUPPORT_COMPATIBLE;
>>   }
>> -#endif /* CONFIG_LINUX */
> Why is this 4/5 patch removing these ifdef's (including the one below);
> since it's the ram_write_tracking_available that lets you know if you
> can do it, and htat's got ifdef's, why do these lines go in at all?
>
> Dave
>
I think I just missed to remove #ifdef's from the first patch, that's the reason.
I'll fix it.

Andrey

>>   /**
>>    * @migration_caps_check - check capability validity
>> @@ -1219,7 +1217,6 @@ static bool migrate_caps_check(bool *cap_list,
>>       }
>>   
>>       if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
>> -#ifdef CONFIG_LINUX
>>           WriteTrackingSupport wt_support;
>>           int idx;
>>           /*
>> @@ -1250,11 +1247,6 @@ static bool migrate_caps_check(bool *cap_list,
>>                   return false;
>>               }
>>           }
>> -#else
>> -        error_setg(errp,
>> -                "Background-snapshot is not supported on non-Linux hosts");
>> -        return false;
>> -#endif
>>       }
>>   
>>       return true;
>> @@ -2016,6 +2008,7 @@ void migrate_init(MigrationState *s)
>>        * locks.
>>        */
>>       s->cleanup_bh = 0;
>> +    s->vm_start_bh = 0;
>>       s->to_dst_file = NULL;
>>       s->state = MIGRATION_STATUS_NONE;
>>       s->rp_state.from_dst_file = NULL;
>> @@ -3233,6 +3226,50 @@ fail:
>>                         MIGRATION_STATUS_FAILED);
>>   }
>>   
>> +/**
>> + * bg_migration_completion: Used by bg_migration_thread when after all the
>> + *   RAM has been saved. The caller 'breaks' the loop when this returns.
>> + *
>> + * @s: Current migration state
>> + */
>> +static void bg_migration_completion(MigrationState *s)
>> +{
>> +    int current_active_state = s->state;
>> +
>> +    /*
>> +     * Stop tracking RAM writes - un-protect memory, un-register UFFD
>> +     * memory ranges, flush kernel wait queues and wake up threads
>> +     * waiting for write fault to be resolved.
>> +     */
>> +    ram_write_tracking_stop();
>> +
>> +    if (s->state == MIGRATION_STATUS_ACTIVE) {
>> +        /*
>> +         * By this moment we have RAM content saved into the migration stream.
>> +         * The next step is to flush the non-RAM content (device state)
>> +         * right after the ram content. The device state has been stored into
>> +         * the temporary buffer before RAM saving started.
>> +         */
>> +        qemu_put_buffer(s->to_dst_file, s->bioc->data, s->bioc->usage);
>> +        qemu_fflush(s->to_dst_file);
>> +    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
>> +        goto fail;
>> +    }
>> +
>> +    if (qemu_file_get_error(s->to_dst_file)) {
>> +        trace_migration_completion_file_err();
>> +        goto fail;
>> +    }
>> +
>> +    migrate_set_state(&s->state, current_active_state,
>> +                      MIGRATION_STATUS_COMPLETED);
>> +    return;
>> +
>> +fail:
>> +    migrate_set_state(&s->state, current_active_state,
>> +                      MIGRATION_STATUS_FAILED);
>> +}
>> +
>>   bool migrate_colo_enabled(void)
>>   {
>>       MigrationState *s = migrate_get_current();
>> @@ -3573,6 +3610,47 @@ static void migration_iteration_finish(MigrationState *s)
>>       qemu_mutex_unlock_iothread();
>>   }
>>   
>> +static void bg_migration_iteration_finish(MigrationState *s)
>> +{
>> +    qemu_mutex_lock_iothread();
>> +    switch (s->state) {
>> +    case MIGRATION_STATUS_COMPLETED:
>> +        migration_calculate_complete(s);
>> +        break;
>> +
>> +    case MIGRATION_STATUS_ACTIVE:
>> +    case MIGRATION_STATUS_FAILED:
>> +    case MIGRATION_STATUS_CANCELLED:
>> +    case MIGRATION_STATUS_CANCELLING:
>> +        break;
>> +
>> +    default:
>> +        /* Should not reach here, but if so, forgive the VM. */
>> +        error_report("%s: Unknown ending state %d", __func__, s->state);
>> +        break;
>> +    }
>> +
>> +    migrate_fd_cleanup_schedule(s);
>> +    qemu_mutex_unlock_iothread();
>> +}
>> +
>> +/*
>> + * Return true if continue to the next iteration directly, false
>> + * otherwise.
>> + */
>> +static MigIterateState bg_migration_iteration_run(MigrationState *s)
>> +{
>> +    int res;
>> +
>> +    res = qemu_savevm_state_iterate(s->to_dst_file, false);
>> +    if (res > 0) {
>> +        bg_migration_completion(s);
>> +        return MIG_ITERATE_BREAK;
>> +    }
>> +
>> +    return MIG_ITERATE_RESUME;
>> +}
>> +
>>   void migration_make_urgent_request(void)
>>   {
>>       qemu_sem_post(&migrate_get_current()->rate_limit_sem);
>> @@ -3720,6 +3798,165 @@ static void *migration_thread(void *opaque)
>>       return NULL;
>>   }
>>   
>> +static void bg_migration_vm_start_bh(void *opaque)
>> +{
>> +    MigrationState *s = opaque;
>> +
>> +    qemu_bh_delete(s->vm_start_bh);
>> +    s->vm_start_bh = NULL;
>> +
>> +    vm_start();
>> +    s->downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - s->downtime_start;
>> +}
>> +
>> +/**
>> + * Background snapshot thread, based on live migration code.
>> + * This is an alternative implementation of live migration mechanism
>> + * introduced specifically to support background snapshots.
>> + *
>> + * It takes advantage of userfault_fd write protection mechanism introduced
>> + * in v5.7 kernel. Compared to existing dirty page logging migration much
>> + * lesser stream traffic is produced resulting in smaller snapshot images,
>> + * simply cause of no page duplicates can get into the stream.
>> + *
>> + * Another key point is that generated vmstate stream reflects machine state
>> + * 'frozen' at the beginning of snapshot creation compared to dirty page logging
>> + * mechanism, which effectively results in that saved snapshot is the state of VM
>> + * at the end of the process.
>> + */
>> +static void *bg_migration_thread(void *opaque)
>> +{
>> +    MigrationState *s = opaque;
>> +    int64_t setup_start;
>> +    MigThrError thr_error;
>> +    QEMUFile *fb;
>> +    bool early_fail = true;
>> +
>> +    rcu_register_thread();
>> +    object_ref(OBJECT(s));
>> +
>> +    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>> +
>> +    setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>> +    /*
>> +     * We want to save vmstate for the moment when migration has been
>> +     * initiated but also we want to save RAM content while VM is running.
>> +     * The RAM content should appear first in the vmstate. So, we first
>> +     * stash the non-RAM part of the vmstate to the temporary buffer,
>> +     * then write RAM part of the vmstate to the migration stream
>> +     * with vCPUs running and, finally, write stashed non-RAM part of
>> +     * the vmstate from the buffer to the migration stream.
>> +     */
>> +    s->bioc = qio_channel_buffer_new(128 * 1024);
>> +    qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>> +    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>> +    object_unref(OBJECT(s->bioc));
>> +
>> +    update_iteration_initial_status(s);
>> +
>> +    qemu_savevm_state_header(s->to_dst_file);
>> +    qemu_savevm_state_setup(s->to_dst_file);
>> +
>> +    if (qemu_savevm_state_guest_unplug_pending()) {
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>> +                          MIGRATION_STATUS_WAIT_UNPLUG);
>> +
>> +        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
>> +               qemu_savevm_state_guest_unplug_pending()) {
>> +            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>> +        }
>> +
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
>> +                          MIGRATION_STATUS_ACTIVE);
>> +    } else {
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>> +                MIGRATION_STATUS_ACTIVE);
>> +    }
>> +    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
>> +
>> +    trace_migration_thread_setup_complete();
>> +    s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +
>> +    qemu_mutex_lock_iothread();
>> +
>> +    /*
>> +     * If VM is currently in suspended state, then, to make a valid runstate
>> +     * transition in vm_stop_force_state() we need to wakeup it up.
>> +     */
>> +    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
>> +    s->vm_was_running = runstate_is_running();
>> +
>> +    if (global_state_store()) {
>> +        goto fail;
>> +    }
>> +    /* Forcibly stop VM before saving state of vCPUs and devices */
>> +    if (vm_stop_force_state(RUN_STATE_PAUSED)) {
>> +        goto fail;
>> +    }
>> +    /*
>> +     * Put vCPUs in sync with shadow context structures, then
>> +     * save their state to channel-buffer along with devices.
>> +     */
>> +    cpu_synchronize_all_states();
>> +    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>> +        goto fail;
>> +    }
>> +    /* Now initialize UFFD context and start tracking RAM writes */
>> +    if (ram_write_tracking_start()) {
>> +        goto fail;
>> +    }
>> +    early_fail = false;
>> +
>> +    /*
>> +     * Start VM from BH handler to avoid write-fault lock here.
>> +     * UFFD-WP protection for the whole RAM is already enabled so
>> +     * calling VM state change notifiers from vm_start() would initiate
>> +     * writes to virtio VQs memory which is in write-protected region.
>> +     */
>> +    s->vm_start_bh = qemu_bh_new(bg_migration_vm_start_bh, s);
>> +    qemu_bh_schedule(s->vm_start_bh);
>> +
>> +    qemu_mutex_unlock_iothread();
>> +
>> +    while (migration_is_active(s)) {
>> +        MigIterateState iter_state = bg_migration_iteration_run(s);
>> +        if (iter_state == MIG_ITERATE_SKIP) {
>> +            continue;
>> +        } else if (iter_state == MIG_ITERATE_BREAK) {
>> +            break;
>> +        }
>> +
>> +        /*
>> +         * Try to detect any kind of failures, and see whether we
>> +         * should stop the migration now.
>> +         */
>> +        thr_error = migration_detect_error(s);
>> +        if (thr_error == MIG_THR_ERR_FATAL) {
>> +            /* Stop migration */
>> +            break;
>> +        }
>> +
>> +        migration_update_counters(s, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
>> +    }
>> +
>> +    trace_migration_thread_after_loop();
>> +
>> +fail:
>> +    if (early_fail) {
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>> +                MIGRATION_STATUS_FAILED);
>> +        qemu_mutex_unlock_iothread();
>> +    }
>> +
>> +    bg_migration_iteration_finish(s);
>> +
>> +    qemu_fclose(fb);
>> +    object_unref(OBJECT(s));
>> +    rcu_unregister_thread();
>> +
>> +    return NULL;
>> +}
>> +
>>   void migrate_fd_connect(MigrationState *s, Error *error_in)
>>   {
>>       Error *local_err = NULL;
>> @@ -3783,8 +4020,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>           migrate_fd_cleanup(s);
>>           return;
>>       }
>> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>> -                       QEMU_THREAD_JOINABLE);
>> +
>> +    if (migrate_background_snapshot()) {
>> +        qemu_thread_create(&s->thread, "bg_snapshot",
>> +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
>> +    } else {
>> +        qemu_thread_create(&s->thread, "live_migration",
>> +                migration_thread, s, QEMU_THREAD_JOINABLE);
>> +    }
>>       s->migration_thread_running = true;
>>   }
>>   
>> diff --git a/migration/migration.h b/migration/migration.h
>> index f40338cfbf..0723955cd7 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -20,6 +20,7 @@
>>   #include "qemu/thread.h"
>>   #include "qemu/coroutine_int.h"
>>   #include "io/channel.h"
>> +#include "io/channel-buffer.h"
>>   #include "net/announce.h"
>>   #include "qom/object.h"
>>   
>> @@ -147,8 +148,10 @@ struct MigrationState {
>>   
>>       /*< public >*/
>>       QemuThread thread;
>> +    QEMUBH *vm_start_bh;
>>       QEMUBH *cleanup_bh;
>>       QEMUFile *to_dst_file;
>> +    QIOChannelBuffer *bioc;
>>       /*
>>        * Protects to_dst_file pointer.  We need to make sure we won't
>>        * yield or hang during the critical section, since this lock will
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 4f3b69ecfc..9f8ad5e0f5 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1355,7 +1355,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>>       return 0;
>>   }
>>   
>> -static
>>   int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>                                                       bool in_postcopy,
>>                                                       bool inactivate_disks)
>> diff --git a/migration/savevm.h b/migration/savevm.h
>> index ba64a7e271..aaee2528ed 100644
>> --- a/migration/savevm.h
>> +++ b/migration/savevm.h
>> @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
>>   void qemu_loadvm_state_cleanup(void);
>>   int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>>   int qemu_load_device_state(QEMUFile *f);
>> +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>> +        bool in_postcopy, bool inactivate_disks);
>>   
>>   #endif
>> -- 
>> 2.25.1
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------92AB575CF0B77155354965F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28.01.2021 21:29, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128182904.GH2951@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Introducing implementation of 'background' snapshot thread
which in overall follows the logic of precopy migration
while internally utilizes completely different mechanism
to 'freeze' vmstate at the start of snapshot creation.

This mechanism is based on userfault_fd with wr-protection
support and is Linux-specific.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
Acked-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
Reviewed-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for fixing the thread name; I've just noticed something though:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 migration/migration.c | 263 ++++++++++++++++++++++++++++++++++++++++--
 migration/migration.h |   3 +
 migration/savevm.c    |   1 -
 migration/savevm.h    |   2 +
 4 files changed, 258 insertions(+), 11 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index f018337fbc..869afa7a86 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1130,7 +1130,6 @@ static void fill_source_migration_info(MigrationInfo *info)
     info-&gt;status = s-&gt;state;
 }
 
-#ifdef CONFIG_LINUX
 typedef enum WriteTrackingSupport {
     WT_SUPPORT_UNKNOWN = 0,
     WT_SUPPORT_ABSENT,
@@ -1155,7 +1154,6 @@ WriteTrackingSupport migrate_query_write_tracking(void)
 
     return WT_SUPPORT_COMPATIBLE;
 }
-#endif /* CONFIG_LINUX */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why is this 4/5 patch removing these ifdef's (including the one below);
since it's the ram_write_tracking_available that lets you know if you
can do it, and htat's got ifdef's, why do these lines go in at all?

Dave

</pre>
    </blockquote>
    <pre>I think I just missed to remove #ifdef's from the first patch, that's the reason.
I'll fix it.

Andrey
</pre>
    <blockquote type="cite" cite="mid:20210128182904.GH2951@work-vm">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> /**
  * @migration_caps_check - check capability validity
@@ -1219,7 +1217,6 @@ static bool migrate_caps_check(bool *cap_list,
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-#ifdef CONFIG_LINUX
         WriteTrackingSupport wt_support;
         int idx;
         /*
@@ -1250,11 +1247,6 @@ static bool migrate_caps_check(bool *cap_list,
                 return false;
             }
         }
-#else
-        error_setg(errp,
-                &quot;Background-snapshot is not supported on non-Linux hosts&quot;);
-        return false;
-#endif
     }
 
     return true;
@@ -2016,6 +2008,7 @@ void migrate_init(MigrationState *s)
      * locks.
      */
     s-&gt;cleanup_bh = 0;
+    s-&gt;vm_start_bh = 0;
     s-&gt;to_dst_file = NULL;
     s-&gt;state = MIGRATION_STATUS_NONE;
     s-&gt;rp_state.from_dst_file = NULL;
@@ -3233,6 +3226,50 @@ fail:
                       MIGRATION_STATUS_FAILED);
 }
 
+/**
+ * bg_migration_completion: Used by bg_migration_thread when after all the
+ *   RAM has been saved. The caller 'breaks' the loop when this returns.
+ *
+ * @s: Current migration state
+ */
+static void bg_migration_completion(MigrationState *s)
+{
+    int current_active_state = s-&gt;state;
+
+    /*
+     * Stop tracking RAM writes - un-protect memory, un-register UFFD
+     * memory ranges, flush kernel wait queues and wake up threads
+     * waiting for write fault to be resolved.
+     */
+    ram_write_tracking_stop();
+
+    if (s-&gt;state == MIGRATION_STATUS_ACTIVE) {
+        /*
+         * By this moment we have RAM content saved into the migration stream.
+         * The next step is to flush the non-RAM content (device state)
+         * right after the ram content. The device state has been stored into
+         * the temporary buffer before RAM saving started.
+         */
+        qemu_put_buffer(s-&gt;to_dst_file, s-&gt;bioc-&gt;data, s-&gt;bioc-&gt;usage);
+        qemu_fflush(s-&gt;to_dst_file);
+    } else if (s-&gt;state == MIGRATION_STATUS_CANCELLING) {
+        goto fail;
+    }
+
+    if (qemu_file_get_error(s-&gt;to_dst_file)) {
+        trace_migration_completion_file_err();
+        goto fail;
+    }
+
+    migrate_set_state(&amp;s-&gt;state, current_active_state,
+                      MIGRATION_STATUS_COMPLETED);
+    return;
+
+fail:
+    migrate_set_state(&amp;s-&gt;state, current_active_state,
+                      MIGRATION_STATUS_FAILED);
+}
+
 bool migrate_colo_enabled(void)
 {
     MigrationState *s = migrate_get_current();
@@ -3573,6 +3610,47 @@ static void migration_iteration_finish(MigrationState *s)
     qemu_mutex_unlock_iothread();
 }
 
+static void bg_migration_iteration_finish(MigrationState *s)
+{
+    qemu_mutex_lock_iothread();
+    switch (s-&gt;state) {
+    case MIGRATION_STATUS_COMPLETED:
+        migration_calculate_complete(s);
+        break;
+
+    case MIGRATION_STATUS_ACTIVE:
+    case MIGRATION_STATUS_FAILED:
+    case MIGRATION_STATUS_CANCELLED:
+    case MIGRATION_STATUS_CANCELLING:
+        break;
+
+    default:
+        /* Should not reach here, but if so, forgive the VM. */
+        error_report(&quot;%s: Unknown ending state %d&quot;, __func__, s-&gt;state);
+        break;
+    }
+
+    migrate_fd_cleanup_schedule(s);
+    qemu_mutex_unlock_iothread();
+}
+
+/*
+ * Return true if continue to the next iteration directly, false
+ * otherwise.
+ */
+static MigIterateState bg_migration_iteration_run(MigrationState *s)
+{
+    int res;
+
+    res = qemu_savevm_state_iterate(s-&gt;to_dst_file, false);
+    if (res &gt; 0) {
+        bg_migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
+    return MIG_ITERATE_RESUME;
+}
+
 void migration_make_urgent_request(void)
 {
     qemu_sem_post(&amp;migrate_get_current()-&gt;rate_limit_sem);
@@ -3720,6 +3798,165 @@ static void *migration_thread(void *opaque)
     return NULL;
 }
 
+static void bg_migration_vm_start_bh(void *opaque)
+{
+    MigrationState *s = opaque;
+
+    qemu_bh_delete(s-&gt;vm_start_bh);
+    s-&gt;vm_start_bh = NULL;
+
+    vm_start();
+    s-&gt;downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - s-&gt;downtime_start;
+}
+
+/**
+ * Background snapshot thread, based on live migration code.
+ * This is an alternative implementation of live migration mechanism
+ * introduced specifically to support background snapshots.
+ *
+ * It takes advantage of userfault_fd write protection mechanism introduced
+ * in v5.7 kernel. Compared to existing dirty page logging migration much
+ * lesser stream traffic is produced resulting in smaller snapshot images,
+ * simply cause of no page duplicates can get into the stream.
+ *
+ * Another key point is that generated vmstate stream reflects machine state
+ * 'frozen' at the beginning of snapshot creation compared to dirty page logging
+ * mechanism, which effectively results in that saved snapshot is the state of VM
+ * at the end of the process.
+ */
+static void *bg_migration_thread(void *opaque)
+{
+    MigrationState *s = opaque;
+    int64_t setup_start;
+    MigThrError thr_error;
+    QEMUFile *fb;
+    bool early_fail = true;
+
+    rcu_register_thread();
+    object_ref(OBJECT(s));
+
+    qemu_file_set_rate_limit(s-&gt;to_dst_file, INT64_MAX);
+
+    setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    /*
+     * We want to save vmstate for the moment when migration has been
+     * initiated but also we want to save RAM content while VM is running.
+     * The RAM content should appear first in the vmstate. So, we first
+     * stash the non-RAM part of the vmstate to the temporary buffer,
+     * then write RAM part of the vmstate to the migration stream
+     * with vCPUs running and, finally, write stashed non-RAM part of
+     * the vmstate from the buffer to the migration stream.
+     */
+    s-&gt;bioc = qio_channel_buffer_new(128 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(s-&gt;bioc), &quot;vmstate-buffer&quot;);
+    fb = qemu_fopen_channel_output(QIO_CHANNEL(s-&gt;bioc));
+    object_unref(OBJECT(s-&gt;bioc));
+
+    update_iteration_initial_status(s);
+
+    qemu_savevm_state_header(s-&gt;to_dst_file);
+    qemu_savevm_state_setup(s-&gt;to_dst_file);
+
+    if (qemu_savevm_state_guest_unplug_pending()) {
+        migrate_set_state(&amp;s-&gt;state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_WAIT_UNPLUG);
+
+        while (s-&gt;state == MIGRATION_STATUS_WAIT_UNPLUG &amp;&amp;
+               qemu_savevm_state_guest_unplug_pending()) {
+            qemu_sem_timedwait(&amp;s-&gt;wait_unplug_sem, 250);
+        }
+
+        migrate_set_state(&amp;s-&gt;state, MIGRATION_STATUS_WAIT_UNPLUG,
+                          MIGRATION_STATUS_ACTIVE);
+    } else {
+        migrate_set_state(&amp;s-&gt;state, MIGRATION_STATUS_SETUP,
+                MIGRATION_STATUS_ACTIVE);
+    }
+    s-&gt;setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
+
+    trace_migration_thread_setup_complete();
+    s-&gt;downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    qemu_mutex_lock_iothread();
+
+    /*
+     * If VM is currently in suspended state, then, to make a valid runstate
+     * transition in vm_stop_force_state() we need to wakeup it up.
+     */
+    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
+    s-&gt;vm_was_running = runstate_is_running();
+
+    if (global_state_store()) {
+        goto fail;
+    }
+    /* Forcibly stop VM before saving state of vCPUs and devices */
+    if (vm_stop_force_state(RUN_STATE_PAUSED)) {
+        goto fail;
+    }
+    /*
+     * Put vCPUs in sync with shadow context structures, then
+     * save their state to channel-buffer along with devices.
+     */
+    cpu_synchronize_all_states();
+    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
+        goto fail;
+    }
+    /* Now initialize UFFD context and start tracking RAM writes */
+    if (ram_write_tracking_start()) {
+        goto fail;
+    }
+    early_fail = false;
+
+    /*
+     * Start VM from BH handler to avoid write-fault lock here.
+     * UFFD-WP protection for the whole RAM is already enabled so
+     * calling VM state change notifiers from vm_start() would initiate
+     * writes to virtio VQs memory which is in write-protected region.
+     */
+    s-&gt;vm_start_bh = qemu_bh_new(bg_migration_vm_start_bh, s);
+    qemu_bh_schedule(s-&gt;vm_start_bh);
+
+    qemu_mutex_unlock_iothread();
+
+    while (migration_is_active(s)) {
+        MigIterateState iter_state = bg_migration_iteration_run(s);
+        if (iter_state == MIG_ITERATE_SKIP) {
+            continue;
+        } else if (iter_state == MIG_ITERATE_BREAK) {
+            break;
+        }
+
+        /*
+         * Try to detect any kind of failures, and see whether we
+         * should stop the migration now.
+         */
+        thr_error = migration_detect_error(s);
+        if (thr_error == MIG_THR_ERR_FATAL) {
+            /* Stop migration */
+            break;
+        }
+
+        migration_update_counters(s, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
+    }
+
+    trace_migration_thread_after_loop();
+
+fail:
+    if (early_fail) {
+        migrate_set_state(&amp;s-&gt;state, MIGRATION_STATUS_ACTIVE,
+                MIGRATION_STATUS_FAILED);
+        qemu_mutex_unlock_iothread();
+    }
+
+    bg_migration_iteration_finish(s);
+
+    qemu_fclose(fb);
+    object_unref(OBJECT(s));
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
 void migrate_fd_connect(MigrationState *s, Error *error_in)
 {
     Error *local_err = NULL;
@@ -3783,8 +4020,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         migrate_fd_cleanup(s);
         return;
     }
-    qemu_thread_create(&amp;s-&gt;thread, &quot;live_migration&quot;, migration_thread, s,
-                       QEMU_THREAD_JOINABLE);
+
+    if (migrate_background_snapshot()) {
+        qemu_thread_create(&amp;s-&gt;thread, &quot;bg_snapshot&quot;,
+                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
+    } else {
+        qemu_thread_create(&amp;s-&gt;thread, &quot;live_migration&quot;,
+                migration_thread, s, QEMU_THREAD_JOINABLE);
+    }
     s-&gt;migration_thread_running = true;
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index f40338cfbf..0723955cd7 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -20,6 +20,7 @@
 #include &quot;qemu/thread.h&quot;
 #include &quot;qemu/coroutine_int.h&quot;
 #include &quot;io/channel.h&quot;
+#include &quot;io/channel-buffer.h&quot;
 #include &quot;net/announce.h&quot;
 #include &quot;qom/object.h&quot;
 
@@ -147,8 +148,10 @@ struct MigrationState {
 
     /*&lt; public &gt;*/
     QemuThread thread;
+    QEMUBH *vm_start_bh;
     QEMUBH *cleanup_bh;
     QEMUFile *to_dst_file;
+    QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file pointer.  We need to make sure we won't
      * yield or hang during the critical section, since this lock will
diff --git a/migration/savevm.c b/migration/savevm.c
index 4f3b69ecfc..9f8ad5e0f5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1355,7 +1355,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
     return 0;
 }
 
-static
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
                                                     bool inactivate_disks)
diff --git a/migration/savevm.h b/migration/savevm.h
index ba64a7e271..aaee2528ed 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
 void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
+int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
+        bool in_postcopy, bool inactivate_disks);
 
 #endif
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------92AB575CF0B77155354965F1--

