Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95492FE5AA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:59:10 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Vo5-0002Wn-R4
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2VnD-00027h-5N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:58:15 -0500
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:58784 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2Vn8-0006Zn-1X
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:58:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdzGk1B90gmYBYD/3Oc7OXxzIaw6h+g36otSu3uw4mO829+RnporqUsYOU2F50hzCy/BTS6F9LhNZdznjkA10C022+n15Ms8MEvlYRyjT078MK24Zvxu6vLBlWoUYRV4WiVPVyjJUS6u/RtuokaLLHyNGwIydXLHLOyZz9vGrtorGeJxZayn4vwKzIPLkFuies0OKoIKy5MasuXHfqJ6V6vfu0Awyty4gpz5O6E6jMkhHlqvjHuyFE726bqRnJlNgbpXloAsoFJKAf0S2UBcpBbZNZCHHsjH/eiGZ1h+hvluy1YdNz6elyVLWZAvunr2CKpEJgmh8FrOVKJdr1ntkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFqzE7PbMqELdk786R5Id3Y1ttcBFy4bk2yFb7dZKLw=;
 b=LVct/4bjZIxW+2VU3NHZjPgteAq9Ff+9BOBh9TqYpl+5LTWh2gh2PcGIBXXLEySrSmLViIgeCcVV8Lpo2tEpyHUOzhkkJX3Nz8rQecmATNZMSAoEJ5ghASSYYFBJZK80afcBnI3I8v1tnBC8ZhyGOeIkiREjI9QN0SlaqFqrWkDWjKIMDqVAZXxeATqkZX8PGTQjIpniReBs/4L4YzgtdRFkQi3W60+ffuyjZMadmCfl10jphb6h4wiA/Vd0oFd0vHuSwKoJC+08gjrHC6hDCu5zV3tDAUJ8fCnaTbWLqQlOrHt/cjXYX9IeFDFS9t3dyMKpF09pVG6D4GKgGgMCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFqzE7PbMqELdk786R5Id3Y1ttcBFy4bk2yFb7dZKLw=;
 b=M/UrTKDlMP5qPlLGYJZm9e2OTRo9MvKZiW8D1yc6XICIJyn1d/SY47pTdgtF+3U+G6pAsxJwktAIQaufeZqEZHgCcaw6KyRquvZPzOy4/NI3kQ/zuFwj7YtUxiIngpGgxcWWGMgJbkyZkVlgFKUe474314JAmRsMez/rvkgJi8M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM4PR08MB2850.eurprd08.prod.outlook.com (2603:10a6:205:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Thu, 21 Jan
 2021 08:58:06 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 08:58:06 +0000
Subject: Re: [PATCH v11 4/5] migration: implementation of background snapshot
 thread
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-5-andrey.gruzdev@virtuozzo.com>
 <20210119184931.GJ3008@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <a552fca2-b06e-feb7-997f-24d8341267e5@virtuozzo.com>
Date: Thu, 21 Jan 2021 11:58:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210119184931.GJ3008@work-vm>
Content-Type: multipart/alternative;
 boundary="------------702805B204BB86637E4F6FBB"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR05CA0127.eurprd05.prod.outlook.com
 (2603:10a6:207:2::29) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR05CA0127.eurprd05.prod.outlook.com (2603:10a6:207:2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 08:58:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7f58e6-fe41-4fc0-62ea-08d8bdeaaafe
X-MS-TrafficTypeDiagnostic: AM4PR08MB2850:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB28502462CFD11B3CD7FBB5059FA10@AM4PR08MB2850.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e8EKduyRb50JOGAKFIv7UPBzfq6e/CFt9eOEfh2WPml567SC1E35g+g2SLnuDuelBRU0tyiS5RAQd2OPW0hjC2/dLlNR4rLXX++VKbUbnf8safuABvZhVti2SMWuzpiScacnYKRIHQOcG5yst5k1iM5l8Mm15RFpGOfvkwfbsqXR/fnc2OjSFLsgoJwBY8Gr4s1A8w2bpSoquguVqhlb9UBj8+tQeNKXGLII2NhjQTVR6O2OHn68dIhw5tbW5u+1zjcDzXz5OPmhyuar/5ubL0jJaVe1h9dcSa0JtEeYAsQURuibzmyJ6t4Rc5NrWkFz6zsREbN1uATW3QR9S8KDv1Bohl51WFO/G40egSbkdEUCEdqVyM13mP080kcosrHXglOAVmQyMJa5nxS9vGZR3e2o7mgKeYvgxm027x73zyAosT8rkh/7P0SLOOYVPEZPnTI/RYKltu0QvZuPhQIp7AU5a+5Txypfay91zJU6KokoyElAcjCGEmAjm9BfI38tyuN/f69qaXfDaZqCCnQV2JC7ZqmBGT40KqQQNqIQUq7DA3auiV97T6dP9GhkTbU4MFrbUCvxFOT4HpOK2OI0MsVLpJ14G2Z9B4zhRlE68ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(376002)(136003)(366004)(186003)(2616005)(316002)(54906003)(16576012)(956004)(36756003)(83380400001)(8936002)(6916009)(66476007)(16526019)(478600001)(5660300002)(66946007)(53546011)(8676002)(44832011)(26005)(66556008)(2906002)(52116002)(86362001)(31686004)(4326008)(33964004)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NG5JOWtzbEFjZTVGOE5PcjhPVnpqc2s4L1lHaUtHV3htR1J5TU9UelZHb29N?=
 =?utf-8?B?RFNzUmxhQXNUbWErV01iUkxUelpGNHptN2x1aDdZN211TnFaQVZNc0hWU2k2?=
 =?utf-8?B?Mk02NjN3ZnFIN1ZBS21lTm81ZUFJWW1sQXJNUHI3ZERQT2JyQnVNWllVYmdB?=
 =?utf-8?B?eW9DUldmdk13QzFnZ3cxWWZ1NXBibXFRTVV2TmRZb0ZiZE00dkcyaElEaGZQ?=
 =?utf-8?B?MXNwYktVZVowQzEyNEk4dFpzd0ZnOHQ0Z3dKeDRwZy9iTFhlcWI5NEpBbU0z?=
 =?utf-8?B?MytQR2JZTXlVREJPQ0lyWDFPd1JhQUZIY0dPVDJXaVVoNE14aXo0Njg5UHRa?=
 =?utf-8?B?cUgzQzI4aEtQU3Y5ZEtZUmhJTHB5WFFCWUpiTlJFSko0OEI0dk0xY3pzQnVH?=
 =?utf-8?B?bmVEQzZUYmIzWGI2ejBpMzRhZ2dXTEtoaENJMVZTazZRM05vckN2V2JTbEtE?=
 =?utf-8?B?YTNWWVQvZFpwRitwU3daSDZNVll1OVFvUkkrK3g4Q0RnUHI2dzVYNnJhclNJ?=
 =?utf-8?B?NmtnRlB5c1J0YmRKamdrR1VxL25VVzk5Qi9rM1FCb2s0MkZDZmxzRXFwQUJr?=
 =?utf-8?B?WVRPTFRDRG50WE0wZ3hIeFl3UTlNZkVJWkxtaEVYNzVBUmk4T0IvUWFmVmxo?=
 =?utf-8?B?TFkxSFlpMnlTSW9zeXMvR2lKUlJHY3psS0NsTlhXL29zNGJ6dlBGTERWU1dz?=
 =?utf-8?B?a0hta05Xc3E5STMzRlJNZ3ZYSGtSZ3k4ajVUVWdoRW5BSXNOaWNMYUhzVUM4?=
 =?utf-8?B?aDN5aGcxMExmVS9YRmN3MWdkVXJtY3V5UXlEWXhsdmx0SG1QaVhDSStwZEFG?=
 =?utf-8?B?bkxTY2hzOGIvKzRTVnU1YXRpTFpIYjB6TXZHVGtKbVI3aWwxdDVoMnQwMmJB?=
 =?utf-8?B?ZkRLNHpRTVBobmduK0FYS3JIeVpuY09Fcit2eWw4c3JkQ2liTVpteTc3R1pj?=
 =?utf-8?B?QVZqR1o5RmVDMFhFOGhkbGFxNTI5UzF1K3V2OGFHQmlVR3J4TW9mT0o5UGhs?=
 =?utf-8?B?L0FhV2NObjhsdTFFSzJVQmRmVVZoM0Vic1pYYU8yeWhYaWpsaFI0eVhLNkdO?=
 =?utf-8?B?T3h4UUs1TEk1b24xRmZiU010ZVVzRXhDUjFVeGJJN1YyYVcxV2pUWXNKV2Yr?=
 =?utf-8?B?allZYVU5WGJCaTQ3SkRJV2FHNE9OTmFvRnVjdHhVVFNCMjlrTFRhRUhLK0pm?=
 =?utf-8?B?ZmFrL25JdmRLWFlyeUZZL3B5ajRNcHZ1K2F2MEJGNnQ2NlBQTEhTRHhZb0J5?=
 =?utf-8?B?NlJwdlk2M0lKMFdWcklUUjhVb0lPZ0k2WmcwZ2hWQkFwdlhXalpwTjN5b1dz?=
 =?utf-8?Q?nsbnsXH7zliw0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7f58e6-fe41-4fc0-62ea-08d8bdeaaafe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 08:58:06.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw3tfeXBTA+6jlGVPn0ohFjdAqdv0lTv1fwmGqmQqf65kMS/13/b2FmvOqDbbjmdmRaHdVSv9nVwfRcWc7rykEE6sR0lMHbL1J0NfgeFs1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------702805B204BB86637E4F6FBB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> Introducing implementation of 'background' snapshot thread
>> which in overall follows the logic of precopy migration
>> while internally utilizes completely different mechanism
>> to 'freeze' vmstate at the start of snapshot creation.
>>
>> This mechanism is based on userfault_fd with wr-protection
>> support and is Linux-specific.
> I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
> you still have the source running so still have it accessing the disk;
> do you do anything to try and wire the ram snapshotting up to disk
> snapshotting?

Block-related manipulations should be done externally, I think.
So create backing images for RW nodes, then stop VM, switch block graph
and start background snapshot. Something like create 'virsh snapshot-create-as'
does, but in other sequence.

//

>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Acked-by: Peter Xu <peterx@redhat.com>
>> ---
>>   migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
>>   migration/migration.h |   3 +
>>   migration/ram.c       |   2 +
>>   migration/savevm.c    |   1 -
>>   migration/savevm.h    |   2 +
>>   5 files changed, 260 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 2c2cb9ef01..0901a15ac5 100644
> <snip>
>
>> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>> -                       QEMU_THREAD_JOINABLE);
>> +
>> +    if (migrate_background_snapshot()) {
>> +        qemu_thread_create(&s->thread, "background_snapshot",
> Unfortunately that wont work - there's a 14 character limit on
> the thread name length; I guess we just shorten that to bg_snapshot

Yep, missed that pthread_set_name_np() has a length limit)

> Other than that,
>
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
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
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 5707382db1..05fe0c8592 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>>       page_address = (void *) uffd_msg.arg.pagefault.address;
>>       bs = qemu_ram_block_from_host(page_address, false, offset);
>>       assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
>> +
>>       return bs;
>>   }
>>   #endif /* CONFIG_LINUX */
>> @@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>>           /* Un-protect memory range. */
>>           res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>>                   false, false);
>> +
>>           /* We don't want to override existing error from ram_save_host_page(). */
>>           if (res < 0 && *res_override >= 0) {
>>               *res_override = res;
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 27e842812e..dd4ad0aaaf 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
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


--------------702805B204BB86637E4F6FBB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 19.01.2021 21:49, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119184931.GJ3008@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Introducing implementation of 'background' snapshot thread
which in overall follows the logic of precopy migration
while internally utilizes completely different mechanism
to 'freeze' vmstate at the start of snapshot creation.

This mechanism is based on userfault_fd with wr-protection
support and is Linux-specific.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
you still have the source running so still have it accessing the disk;
do you do anything to try and wire the ram snapshotting up to disk
snapshotting?
</pre>
    </blockquote>
    <pre>Block-related manipulations should be done externally, I think.
So create backing images for RW nodes, then stop VM, switch block graph
and start background snapshot. Something like create 'virsh snapshot-create-as'
does, but in other sequence.

<span class="aCOpRe"><span><em></em></span></span></pre>
    <blockquote type="cite" cite="mid:20210119184931.GJ3008@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
Acked-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
---
 migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
 migration/migration.h |   3 +
 migration/ram.c       |   2 +
 migration/savevm.c    |   1 -
 migration/savevm.h    |   2 +
 5 files changed, 260 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2c2cb9ef01..0901a15ac5 100644
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&lt;snip&gt;

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-    qemu_thread_create(&amp;s-&gt;thread, &quot;live_migration&quot;, migration_thread, s,
-                       QEMU_THREAD_JOINABLE);
+
+    if (migrate_background_snapshot()) {
+        qemu_thread_create(&amp;s-&gt;thread, &quot;background_snapshot&quot;,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unfortunately that wont work - there's a 14 character limit on
the thread name length; I guess we just shorten that to bg_snapshot
</pre>
    </blockquote>
    <pre>Yep, missed that pthread_set_name_np() has a length limit)
</pre>
    <blockquote type="cite" cite="mid:20210119184931.GJ3008@work-vm">
      <pre class="moz-quote-pre" wrap="">
Other than that,



Reviewed-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
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
diff --git a/migration/ram.c b/migration/ram.c
index 5707382db1..05fe0c8592 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
     page_address = (void *) uffd_msg.arg.pagefault.address;
     bs = qemu_ram_block_from_host(page_address, false, offset);
     assert(bs &amp;&amp; (bs-&gt;flags &amp; RAM_UF_WRITEPROTECT) != 0);
+
     return bs;
 }
 #endif /* CONFIG_LINUX */
@@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
         /* Un-protect memory range. */
         res = uffd_change_protection(rs-&gt;uffdio_fd, page_address, run_length,
                 false, false);
+
         /* We don't want to override existing error from ram_save_host_page(). */
         if (res &lt; 0 &amp;&amp; *res_override &gt;= 0) {
             *res_override = res;
diff --git a/migration/savevm.c b/migration/savevm.c
index 27e842812e..dd4ad0aaaf 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
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

--------------702805B204BB86637E4F6FBB--

