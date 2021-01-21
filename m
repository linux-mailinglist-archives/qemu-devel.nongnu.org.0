Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F62FF1FC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:32:33 +0100 (CET)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dou-0000UA-0s
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2dkt-0006Mw-Qp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:24 -0500
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:63041 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2dkp-0003NC-NC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So8nkpL/C8CDU5UG1DL59RtPdrPXbemf3bZx41n1nMyUIVr/pmGEdSiDKPN22chnY/Ysu+3NscyUgRL4JvtAzoqmDmnSMC3XmmACKABgtDVrf53wJxIYHTit9c55wecgoLnVWiOL7X3HVum4/1wAbsR2uVo+YXHE9JjCwzj5XwGWtvyOX7QT+dUbhFE2nIYcajSU3Cv4twysd3L8z+xnUvvLFKtpxamNbx9ngnIZBmoDTktoopBQx/qy9LvCZcsl6DpAEqhJRP3WXEdpBPtRWNVJTJhRSSmw7w9Csc7NDJgu2LyNJ2P80aWwLfpKkgJRd4nfWILd89ywVjsaDBg+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FskvNhVAqI332BzHl2fq2SU7DBgvrH2Jn00ZkDcMkc=;
 b=XD0MZbp86KD88q+o9cjuSIy6W20xGodaq0r0IM7FMZLaHDnsNDrG9oDobRylSM5x5BYJapD2Zj2683TLu1AYF9lAW+ZbHloK/MblCUh2DhZRdBvleyMjGfLpYEBpNDcaWj3nxiYn628mHzUub1JnzvL6KMXEBFzesbGqdjWKL0lN5S8FIK3BDv1JWTTwS6xc66b0LVa7EksYHcm8DPFTINDtntPJkJGlKrRJYplcv6Qricuuk1PWslzbpa89FrOHszSn76xYlOt3gBsZWJX6016XyaqgHH3GHBatiPrAqc/vD6UFdvrnTBgIOgyyBU6v4tP2H4IeRfK4L2dQYbJ3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FskvNhVAqI332BzHl2fq2SU7DBgvrH2Jn00ZkDcMkc=;
 b=vCptzc7k8ZwHkH8Ft18FK+NHtCqpcG1ljmos9WE6QtYjnDS3l58i3BV+65SmVsQlB4gIBIZANr0Yz/i+8YPo6ej4eotfEpka7YeRt4Vmu1glrTv0WaW0TqJ884Ppr3p4FE/CJupSp1DAE5AP82nC2gYWxwRY04PeGayJMG3AUos=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5762.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 17:28:16 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 17:28:16 +0000
Subject: Re: [PATCH v11 4/5] migration: implementation of background snapshot
 thread
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-5-andrey.gruzdev@virtuozzo.com>
 <20210119184931.GJ3008@work-vm>
 <a552fca2-b06e-feb7-997f-24d8341267e5@virtuozzo.com>
 <20210121095647.GC3072@work-vm>
 <d8ff9353-22fb-08b4-ec12-e5e6a13266d5@virtuozzo.com>
 <20210121161145.GI3072@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <25fa36c8-117c-1f30-b678-b4cbebeee6c9@virtuozzo.com>
Date: Thu, 21 Jan 2021 20:28:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121161145.GI3072@work-vm>
Content-Type: multipart/alternative;
 boundary="------------FA9EB61DF069640C1AB6F07D"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:208:ac::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Thu, 21 Jan 2021 17:28:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f31969f-8d7a-4576-470c-08d8be31ef83
X-MS-TrafficTypeDiagnostic: AM8PR08MB5762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB576278E0DF0E1BFDA43411459FA10@AM8PR08MB5762.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wUWdLHTSOigl5pFRYrqBftvxkmflx76cFnVm8PcqxFr2cybkHLEdtQqunXNBYjpJuDBqxHXjJ+kmpjVawo5zMcSaVg/nKUjWVmq9GEgcYNaCxT4IB5hvmvyodrt8K+NOuk7wsruT3yD1KClgYXLtQ7CHd7hfqc38xwZ988RS9rH5AeguoWlSzlUx/+oDY/2UiVKYo10TfhcNcYQK1e8FPgrsmfsZohnTHSCk1Yo4cOM/CjdMw6PGXtxTs/cvOfthbhuVfgD1N0evsm2BH4jrwOI8nDPDlFhElyBBH+LKcs1k540fWwbOAyVjTKSlrjm5BQawc68nHVHU9ECkRQSd1pCFB8NgcXY93OolY7bnH3YGivHsR35ghxkdBlLuSBNtsn+AAWZWexAm0CwLBHfuP67Y3z9v11QEm7S4NshpKZ3R6wQqr7Kku2qFdR/PbByVcmaHB4dKSAZ3iOoQ6FnXhVLL1FPmiH3t/W9YDVdOgxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(366004)(136003)(346002)(6486002)(6916009)(30864003)(54906003)(31696002)(316002)(4326008)(83380400001)(26005)(52116002)(478600001)(44832011)(16576012)(2906002)(31686004)(5660300002)(33964004)(956004)(66556008)(8676002)(66946007)(86362001)(8936002)(36756003)(2616005)(186003)(16526019)(53546011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmNxczlkVExmZVQ1S0tZcVZEMWVuanVJTCtra1hleVNZNkhFVlBjWWRqeG0v?=
 =?utf-8?B?WXR2S0IvcEFjTG1HZzV2TXhhbDhNZTN0Y1dJVGwwRlFIYmpmaFpSNGhyWGZl?=
 =?utf-8?B?bXBHdTRzWTFQSVV1KzZaMWYzM3VhbFBDSWw5TzhrZkVweVk2MHZKanRRNTRX?=
 =?utf-8?B?dmJFdExMVk1PVzRieVpiVFlaWXFoOWxiVXREMHlZeWYrTHJ5TXdJdTN2VUVk?=
 =?utf-8?B?SjZ0RXpJQ2JRdEtJcURoTSs2OFNLNFRkMml1bGIyWDF5VmlFdkY5K3o5QlFN?=
 =?utf-8?B?MENDOTRaWlQ0a204dWRLZDVhcFp5azd2NWNyYk03ckpSUnFCd0E0YTJNWmRn?=
 =?utf-8?B?Wk41R0FKcUE4VjF3aE14amc2T3BqZ0cwK2RGZVUyRzE0dUsrdHNlK04yNS9m?=
 =?utf-8?B?YjhZaTd2b0x5VFA5M1U2RUtKL1lWeDQ2Uk9sZGhBUlNXWmVZeXUxcXhYSUd3?=
 =?utf-8?B?Sjl3a3orNU9VTStBcHY2V1NEUnQ0dThsSnBqSDBETzFwVzJlT2NFelAxd2hZ?=
 =?utf-8?B?dkNxWVIwRUk0bkFwMTFqOWFLRVBTUHlsb3hyM2tUMHVHcVJ0cXN3NTdYNU10?=
 =?utf-8?B?S0djZndzVUpyaE5EWHdRbEloMlVVTEViYWxJNmg4ME1WRlZnUHQrSDJ4NVgr?=
 =?utf-8?B?ck5oeVFZSlhZNkZPZm1UeW5vclI5clE0Q25JVnRZV0NSeUhwOTJqanAybkMv?=
 =?utf-8?B?L0dmMnVLTkhGVjVKNVRhRWNrZkdIb1JzMHpEMlJkZzZEWjd1OGRaUk1VUm1h?=
 =?utf-8?B?d0xzVWJocW9PdzEvVjVJQnJEQ0Z3YUxhNlozYnQ1bXRtdEFUM0t1TFZ2S2Rw?=
 =?utf-8?B?dU9JS1hrNTNCWWdETis5em4wNVVJOHpYRG5sUHRlNVpXazdhM3ZPbm9DZlhz?=
 =?utf-8?B?NHBZMTN4cDcvUm14K0k4Ymt5ZWZRcWRhcTNFYmZpNklXZjA0U0hoN2dDTVlG?=
 =?utf-8?B?L1lTR1ZYRVd1TVdFcGVwQzRpT25wUVFPOGEyeUdEd1dtNE9ya1RwUnltZngy?=
 =?utf-8?B?SVlPa1JLZlhCcjBQNzZRSG5xb1hjK1IyOW55YnNLK2tLNzFIL3l1N1UrcDVP?=
 =?utf-8?B?eUtJdWdaUE5YNnZuNitBVkMvYndsUGlFMnpKM3NuMXBtUW9VRUNvL1MvZTJT?=
 =?utf-8?B?OFZ0UWs5MnFJWVN2bUtlK0JOYW9UNXlKV0lUbWw4ZDJvcUpVVmRnS24yMDV3?=
 =?utf-8?B?cDdDVFRRZVdWL21JOVp2cGwySDVMY2c5SlVUd2JWOS9mSGVLSTVROGxMV3Nr?=
 =?utf-8?B?T1JsTmxyODFqalBjZkUyQkJGVi9wbW1uT1dNUmhMYzhDbE5sS2cwN1lJMFlm?=
 =?utf-8?Q?IO0aj3yXMdEO0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f31969f-8d7a-4576-470c-08d8be31ef83
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:28:16.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPaENFPz79FiaeVQUyGyugFAaFD2BlUVJAZjkuPBxSjxTJXbota735CmMw6JlJxEO3oNjh3nd5gWZhGfFN2TDhtoWfCRBOn3OF/mj85rt7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5762
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------FA9EB61DF069640C1AB6F07D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.01.2021 19:11, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 21.01.2021 12:56, Dr. David Alan Gilbert wrote:
>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>> On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
>>>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>>>> Introducing implementation of 'background' snapshot thread
>>>>>> which in overall follows the logic of precopy migration
>>>>>> while internally utilizes completely different mechanism
>>>>>> to 'freeze' vmstate at the start of snapshot creation.
>>>>>>
>>>>>> This mechanism is based on userfault_fd with wr-protection
>>>>>> support and is Linux-specific.
>>>>> I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
>>>>> you still have the source running so still have it accessing the disk;
>>>>> do you do anything to try and wire the ram snapshotting up to disk
>>>>> snapshotting?
>>>> Block-related manipulations should be done externally, I think.
>>>> So create backing images for RW nodes, then stop VM, switch block graph
>>>> and start background snapshot. Something like create 'virsh snapshot-create-as'
>>>> does, but in other sequence.
>>> If you get a chance it would be great if you could put together an
>>> example of doing the combination RAM+block; that way we find out if there's
>>> anything silly missing.
>>>
>>> Dave
>> Yep, I'll take a look at the QMP command sequences, how it should look
>> like in our case and prepare an example, hope we are not missing something serious.
>> At least we know that block setup data won't go to snapshot.
>> I've also checked starting background snapshot from the stopped VM state -
>> looks OK, VM resumes operation, snapshot is saved, no apparent problems.
>>
>> Maybe it will take some time, since now I'm on task to create tool to store
>> snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
> If you want to make it indexable, why not just do a simple write(2) call
> for the whole of RAM rather than doing the thing like normal migration?
>
> Dave

For me the main reason is apparent file size.. While we can get the same allocation
size when saving via write(2) on Linux, in many cases the apparent file size will
be much bigger then if use QCOW2.

Andrey

>> Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.
>>
>> Andrey
>>
>>>> //
>>>>
>>>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>>>> Acked-by: Peter Xu <peterx@redhat.com>
>>>>>> ---
>>>>>>     migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
>>>>>>     migration/migration.h |   3 +
>>>>>>     migration/ram.c       |   2 +
>>>>>>     migration/savevm.c    |   1 -
>>>>>>     migration/savevm.h    |   2 +
>>>>>>     5 files changed, 260 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>> index 2c2cb9ef01..0901a15ac5 100644
>>>>> <snip>
>>>>>
>>>>>> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>>>>>> -                       QEMU_THREAD_JOINABLE);
>>>>>> +
>>>>>> +    if (migrate_background_snapshot()) {
>>>>>> +        qemu_thread_create(&s->thread, "background_snapshot",
>>>>> Unfortunately that wont work - there's a 14 character limit on
>>>>> the thread name length; I guess we just shorten that to bg_snapshot
>>>> Yep, missed that pthread_set_name_np() has a length limit)
>>>>
>>>>> Other than that,
>>>>>
>>>>>
>>>>>
>>>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>>
>>>>>> +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
>>>>>> +    } else {
>>>>>> +        qemu_thread_create(&s->thread, "live_migration",
>>>>>> +                migration_thread, s, QEMU_THREAD_JOINABLE);
>>>>>> +    }
>>>>>>         s->migration_thread_running = true;
>>>>>>     }
>>>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>>>> index f40338cfbf..0723955cd7 100644
>>>>>> --- a/migration/migration.h
>>>>>> +++ b/migration/migration.h
>>>>>> @@ -20,6 +20,7 @@
>>>>>>     #include "qemu/thread.h"
>>>>>>     #include "qemu/coroutine_int.h"
>>>>>>     #include "io/channel.h"
>>>>>> +#include "io/channel-buffer.h"
>>>>>>     #include "net/announce.h"
>>>>>>     #include "qom/object.h"
>>>>>> @@ -147,8 +148,10 @@ struct MigrationState {
>>>>>>         /*< public >*/
>>>>>>         QemuThread thread;
>>>>>> +    QEMUBH *vm_start_bh;
>>>>>>         QEMUBH *cleanup_bh;
>>>>>>         QEMUFile *to_dst_file;
>>>>>> +    QIOChannelBuffer *bioc;
>>>>>>         /*
>>>>>>          * Protects to_dst_file pointer.  We need to make sure we won't
>>>>>>          * yield or hang during the critical section, since this lock will
>>>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>>>> index 5707382db1..05fe0c8592 100644
>>>>>> --- a/migration/ram.c
>>>>>> +++ b/migration/ram.c
>>>>>> @@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>>>>>>         page_address = (void *) uffd_msg.arg.pagefault.address;
>>>>>>         bs = qemu_ram_block_from_host(page_address, false, offset);
>>>>>>         assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
>>>>>> +
>>>>>>         return bs;
>>>>>>     }
>>>>>>     #endif /* CONFIG_LINUX */
>>>>>> @@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>>>>>>             /* Un-protect memory range. */
>>>>>>             res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>>>>>>                     false, false);
>>>>>> +
>>>>>>             /* We don't want to override existing error from ram_save_host_page(). */
>>>>>>             if (res < 0 && *res_override >= 0) {
>>>>>>                 *res_override = res;
>>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>>> index 27e842812e..dd4ad0aaaf 100644
>>>>>> --- a/migration/savevm.c
>>>>>> +++ b/migration/savevm.c
>>>>>> @@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>>>>>>         return 0;
>>>>>>     }
>>>>>> -static
>>>>>>     int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>>                                                         bool in_postcopy,
>>>>>>                                                         bool inactivate_disks)
>>>>>> diff --git a/migration/savevm.h b/migration/savevm.h
>>>>>> index ba64a7e271..aaee2528ed 100644
>>>>>> --- a/migration/savevm.h
>>>>>> +++ b/migration/savevm.h
>>>>>> @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
>>>>>>     void qemu_loadvm_state_cleanup(void);
>>>>>>     int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>>>>>>     int qemu_load_device_state(QEMUFile *f);
>>>>>> +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>> +        bool in_postcopy, bool inactivate_disks);
>>>>>>     #endif
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
>>>> -- 
>>>> Andrey Gruzdev, Principal Engineer
>>>> Virtuozzo GmbH  +7-903-247-6397
>>>>                   virtuzzo.com
>>>>
>> -- 
>> Andrey Gruzdev, Principal Engineer
>> Virtuozzo GmbH  +7-903-247-6397
>>                  virtuzzo.com
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------FA9EB61DF069640C1AB6F07D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21.01.2021 19:11, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121161145.GI3072@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 21.01.2021 12:56, Dr. David Alan Gilbert wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
</pre>
            <blockquote type="cite">
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
              <pre class="moz-quote-pre" wrap="">I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
you still have the source running so still have it accessing the disk;
do you do anything to try and wire the ram snapshotting up to disk
snapshotting?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Block-related manipulations should be done externally, I think.
So create backing images for RW nodes, then stop VM, switch block graph
and start background snapshot. Something like create 'virsh snapshot-create-as'
does, but in other sequence.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">If you get a chance it would be great if you could put together an
example of doing the combination RAM+block; that way we find out if there's
anything silly missing.

Dave
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yep, I'll take a look at the QMP command sequences, how it should look
like in our case and prepare an example, hope we are not missing something serious.
At least we know that block setup data won't go to snapshot.
I've also checked starting background snapshot from the stopped VM state -
looks OK, VM resumes operation, snapshot is saved, no apparent problems.

Maybe it will take some time, since now I'm on task to create tool to store
snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you want to make it indexable, why not just do a simple write(2) call
for the whole of RAM rather than doing the thing like normal migration?

Dave
</pre>
    </blockquote>
    <pre>For me the main reason is apparent file size.. While we can get the same allocation
size when saving via write(2) on Linux, in many cases the apparent file size will
be much bigger then if use QCOW2.

Andrey
</pre>
    <blockquote type="cite" cite="mid:20210121161145.GI3072@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.

Andrey

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">//

</pre>
            <blockquote type="cite">
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
              <pre class="moz-quote-pre" wrap="">&lt;snip&gt;

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">-    qemu_thread_create(&amp;s-&gt;thread, &quot;live_migration&quot;, migration_thread, s,
-                       QEMU_THREAD_JOINABLE);
+
+    if (migrate_background_snapshot()) {
+        qemu_thread_create(&amp;s-&gt;thread, &quot;background_snapshot&quot;,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Unfortunately that wont work - there's a 14 character limit on
the thread name length; I guess we just shorten that to bg_snapshot
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yep, missed that pthread_set_name_np() has a length limit)

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Other than that,



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
            <pre class="moz-quote-pre" wrap="">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com

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

--------------FA9EB61DF069640C1AB6F07D--

