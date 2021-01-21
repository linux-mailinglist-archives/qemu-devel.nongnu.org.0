Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FA2FF344
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:38:02 +0100 (CET)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eqH-00028u-IE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2ehi-0004DU-KU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:29:10 -0500
Received: from mail-eopbgr00120.outbound.protection.outlook.com
 ([40.107.0.120]:3869 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2ehe-0005nn-86
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:29:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw763cpJps+PhMFq7jW38xTFKlSdjp9qtl1g+v9wA0xWVQVfUVo7CTAhujdGwGrGaemDpR8c1V2VnAUlf9g35t4/ivSeVotOXCViR6BRVvaNNPK9CD1LETvXq0h5rWVwCz1ag+jTIiNWsdHw1A9JY0CwD/urmFi9uVtjGWJ7wfQzC6/aKLM1VqjCOm7HDfehXOfyOmpru1I4o0uMgz1PHheQ+C+yErJmmxScmO3Kp0HgN8gvLXu2pyD6qcnyIAnrU0IGt+uY1IzfK7ihacYaFUD0ZgLS2mvcXoSpUNH1o4Nrn40OnSEiJ7nt7gGghYeRlrrHI4idcgzph/xNrEQ3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht0Ms3uLHPl9e/3m6tEcMcce7e8B3IBSFfgY2wnGdU0=;
 b=g+D0vePyaQeC+qXS4iuocL+qSqY93bkvHJZ/eU9DoJeg9vWWDaSLeZeZrrSjowO0+6/SU6+JrvB5EIuYOXq2rgHTnpXHedojh+oCg+RxV27+Iph1TQywhnqSUanLUGtC09VNw/wVesIUJVrTg+KUIUIFWahKDNfykWqkUy3wd3u6yNi3yLWJD91b1+N/OeZDjZ/HyRIiHp5bn8xG/qkn7C9pcQgqLvn9kw5UgnlnhRZ815ATfRWIhkQPUqnxXWD0ue2xe6z8srpUhINaE1u2EvoarAYwHkiPSJV7bWNhqSypRNyziKdbOfUFmScAQ+WG0Ob6F37Elop8PL1Mq89x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht0Ms3uLHPl9e/3m6tEcMcce7e8B3IBSFfgY2wnGdU0=;
 b=O83XPy3734q0k7OXkotKX5T4SXO62bHTxQCLckbFmG5QUQwAKHcrz1b83X1yQPFY980X4MV0e4x1pZZU4hG0OjuppDlqncfTpVU5WaE447iOW0zPudb8CaSfK8DYg0e9z0XsSpcMWG5gizw/N3qzEKkjISoG5Url8xDYzXULT10=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB5891.eurprd08.prod.outlook.com (2603:10a6:20b:2da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 18:29:02 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 18:29:02 +0000
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
 <25fa36c8-117c-1f30-b678-b4cbebeee6c9@virtuozzo.com>
 <20210121174829.GM3072@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <e10de4d6-3aa0-d3b7-f092-82d023df219c@virtuozzo.com>
Date: Thu, 21 Jan 2021 21:29:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121174829.GM3072@work-vm>
Content-Type: multipart/alternative;
 boundary="------------3CC4233DB46E0F662B8FD4BB"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 21 Jan 2021 18:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f9bbef8-b82c-4617-5f2f-08d8be3a6d08
X-MS-TrafficTypeDiagnostic: AM9PR08MB5891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB58915B51FC01A57C92DBB5EC9FA10@AM9PR08MB5891.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gGwy8YVRNj4banJntALgW5P4zX1fgBs6Pob7MdnRgFdUpeaA/qByAFGzwAAJrkpAHXXBRwkOOBs0AMBftyya53c6J3iQkA+3kCyZPJdRbecJ9xdh/TpZgrT8x3sqlBS+ydK+rI2a9m8n4QHEx4/I/fG8x19N+eqTkeUpb4dzh2b6fiCkTA4dWW0dplEQOKtmOSfiLC87eKXBoAFtqVwAUkW1R8U8huo+ULOdIwZIav8wXNGid/6MON6bN9rNcXxFnFu9qdy7KQvrqmOTUkmsxTpBmP5fa/u5ZT1aT7IVijJi8FXM6FyhdMMVHpZAq/t4ogsz8/3fLYIMHIKKURQi+P8O7aPzlZdgILF1djmMormzl27GmPF4MpYLJGYiAbVubVW1Udy3s+o38xAoSq/iT94/jKHBapVB1olJOEEZXE55hOH7O/pQOq4EN3F1Qg1rq7pSd0MRfJaQYqI2FlrsBWJiepXBIDevfTtpqip60w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(376002)(346002)(136003)(366004)(30864003)(4326008)(86362001)(26005)(83380400001)(53546011)(66946007)(5660300002)(6916009)(36756003)(54906003)(16526019)(66476007)(478600001)(16576012)(956004)(31696002)(8676002)(186003)(44832011)(6486002)(2906002)(2616005)(8936002)(33964004)(66556008)(31686004)(52116002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXpXakErM2lFWmRMdmNMZHZ0M01zajQzRm8rMmtIb1U4RnNydm50SkRjdXBs?=
 =?utf-8?B?ZWlaMjhHT1R5UnVrenV3V29EdE5aMEV0aXlyYzFFejFWeDkvWGp5M3lpT0g4?=
 =?utf-8?B?YjFvMXVKRWxUenF4ZEUzS3E0VTJRdVpxUHVsa3lISk1Jcm8vbkNmWWhMb1hH?=
 =?utf-8?B?LzhJaVlYUk9lRzlWQ20zcDBRS2d0RXpmeDlJRXFMSEFIekc3eE4vYTNlbVdF?=
 =?utf-8?B?K0tobUFYNjl6YkZyWlZLQzBTaWRuYmZmYWdwT3U3NjdNYitEOW9mYmtWdFZS?=
 =?utf-8?B?NkxVa2dxdDUrOGtXem1TejNqYkxWb3BSNWNEMW1aeWV1NEd5K05EOXNWUFpw?=
 =?utf-8?B?VWd3Q1BYR3BqOUZrayt3aWppOHg5cldFcUhXNUFWR0hlOFFJRUVBcnM4WXR4?=
 =?utf-8?B?V2lpYm9UblhYbitrZ2txT2o3eGplc3Z4bWRldldaMWt2VEZPMnZtNWM4SSsw?=
 =?utf-8?B?empLMHhTY0NzVWxLc1ZvTnVnMjBsZzdzdFhuZDdpSmJuOG54aXVDNzgyYjFX?=
 =?utf-8?B?MjlnaHp1NXRTdXpVY1JZMmJxejBDSEdxQ3FlZXN1eHptaVZGbUZBeElNVlE4?=
 =?utf-8?B?clM1RVh3UzI5MDVrc0lETDJySm9rRlBBZkl5WmdSclRNN3FEc3dNVEVLZEVM?=
 =?utf-8?B?dFFyZU5Qa01lWlFMV3YvWUVoOHBZTFRYS0VyNlhBOUxENnNzRGV6RWJNKzVC?=
 =?utf-8?B?d1ZFTzB0SGdRTWJmM0NZUkt0dmM0T21pUEV1M2lLNTBzQ1dLN3NGeUtueWFO?=
 =?utf-8?B?SVQ5ZldTaTg0TnlyL1I0QkdYTDl4V0lDQVMvN09NbDU1VmxsVUNKdm5ySTJV?=
 =?utf-8?B?VkNyOFdrQ1l5N2cyYTdCbTlJSCtyamtjbm1KczdCRDA4cGZZd3pFN1lLU1Fo?=
 =?utf-8?B?dnE2akN2VGUweW45UUVJbUtVR3ZDRm90RHIzYUlNZFpnNnVXSWdLNkp3QXFs?=
 =?utf-8?B?aHNKR0JpVU1xVE5jNTZzRTNYS1Fub2tzaW1rR3lJd0ZpK2kxT2g5cUZBdDBQ?=
 =?utf-8?B?ZDF5eTl6MDl6U1NtczY1RmI1M1o5Z0ZjM0Jla0twOWN1bndUYmxtWGJSdkNt?=
 =?utf-8?B?b2ZQdkFsYkREUHkzRU9pdkxZTWNiMFBMaHc0ZmxRYmdFRWJnWlcyWmlSRGR6?=
 =?utf-8?B?b29YK0Q3VGY5M2dVVGpqMnhOVTFnNXhIZ2JIYkRqQXRjY1YvZC9oeGwwMUx3?=
 =?utf-8?B?dDVZTlV4d0ZQMXFSY0FWRG5vUVNmUDZNVGlJaU91aks2YWttbjluelM3ZzBM?=
 =?utf-8?B?WmFDbGJNZVdzZXNTa3BJVmJkeW1pcStTYnFNeURMMloyclNvampDRk41ZnM0?=
 =?utf-8?Q?g0Au8d7lfq2qg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9bbef8-b82c-4617-5f2f-08d8be3a6d08
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 18:29:02.1649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xAmX+pR+T8EOrKAcbSL0c+o0fomrn7vm2SIxjMk/a8cKdhEGVms6OQhIFbRX+5aFScmqKep8DVurkiGEbFauBHXyQLTewVP35fgjSLDnVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5891
Received-SPF: pass client-ip=40.107.0.120;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

--------------3CC4233DB46E0F662B8FD4BB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.01.2021 20:48, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 21.01.2021 19:11, Dr. David Alan Gilbert wrote:
>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>> On 21.01.2021 12:56, Dr. David Alan Gilbert wrote:
>>>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>>>> On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
>>>>>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>>>>>> Introducing implementation of 'background' snapshot thread
>>>>>>>> which in overall follows the logic of precopy migration
>>>>>>>> while internally utilizes completely different mechanism
>>>>>>>> to 'freeze' vmstate at the start of snapshot creation.
>>>>>>>>
>>>>>>>> This mechanism is based on userfault_fd with wr-protection
>>>>>>>> support and is Linux-specific.
>>>>>>> I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
>>>>>>> you still have the source running so still have it accessing the disk;
>>>>>>> do you do anything to try and wire the ram snapshotting up to disk
>>>>>>> snapshotting?
>>>>>> Block-related manipulations should be done externally, I think.
>>>>>> So create backing images for RW nodes, then stop VM, switch block graph
>>>>>> and start background snapshot. Something like create 'virsh snapshot-create-as'
>>>>>> does, but in other sequence.
>>>>> If you get a chance it would be great if you could put together an
>>>>> example of doing the combination RAM+block; that way we find out if there's
>>>>> anything silly missing.
>>>>>
>>>>> Dave
>>>> Yep, I'll take a look at the QMP command sequences, how it should look
>>>> like in our case and prepare an example, hope we are not missing something serious.
>>>> At least we know that block setup data won't go to snapshot.
>>>> I've also checked starting background snapshot from the stopped VM state -
>>>> looks OK, VM resumes operation, snapshot is saved, no apparent problems.
>>>>
>>>> Maybe it will take some time, since now I'm on task to create tool to store
>>>> snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
>>> If you want to make it indexable, why not just do a simple write(2) call
>>> for the whole of RAM rather than doing the thing like normal migration?
>>>
>>> Dave
>> For me the main reason is apparent file size.. While we can get the same allocation
>> size when saving via write(2) on Linux, in many cases the apparent file size will
>> be much bigger then if use QCOW2.
> Do you mean because of zero pages or for some other reason?
>
> Dave

Yes. So plain sparse file on ext4 would grow to apparent size equal to
highest non-zero GPA. While QCOW2 won't. It's important from the point of
user experience, since desktop workload often show very small non-zero RSS.
When I start Win10 on QEMU with a single Firefox tab with some Youtube HD
video I have only 2-5GB of migration data on a 16GB VM.

Andrey

>> Andrey
>>
>>>> Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.
>>>>
>>>> Andrey
>>>>
>>>>>> //
>>>>>>
>>>>>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>>>>>> Acked-by: Peter Xu <peterx@redhat.com>
>>>>>>>> ---
>>>>>>>>      migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
>>>>>>>>      migration/migration.h |   3 +
>>>>>>>>      migration/ram.c       |   2 +
>>>>>>>>      migration/savevm.c    |   1 -
>>>>>>>>      migration/savevm.h    |   2 +
>>>>>>>>      5 files changed, 260 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>>>> index 2c2cb9ef01..0901a15ac5 100644
>>>>>>> <snip>
>>>>>>>
>>>>>>>> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>>>>>>>> -                       QEMU_THREAD_JOINABLE);
>>>>>>>> +
>>>>>>>> +    if (migrate_background_snapshot()) {
>>>>>>>> +        qemu_thread_create(&s->thread, "background_snapshot",
>>>>>>> Unfortunately that wont work - there's a 14 character limit on
>>>>>>> the thread name length; I guess we just shorten that to bg_snapshot
>>>>>> Yep, missed that pthread_set_name_np() has a length limit)
>>>>>>
>>>>>>> Other than that,
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>>>>
>>>>>>>> +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
>>>>>>>> +    } else {
>>>>>>>> +        qemu_thread_create(&s->thread, "live_migration",
>>>>>>>> +                migration_thread, s, QEMU_THREAD_JOINABLE);
>>>>>>>> +    }
>>>>>>>>          s->migration_thread_running = true;
>>>>>>>>      }
>>>>>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>>>>>> index f40338cfbf..0723955cd7 100644
>>>>>>>> --- a/migration/migration.h
>>>>>>>> +++ b/migration/migration.h
>>>>>>>> @@ -20,6 +20,7 @@
>>>>>>>>      #include "qemu/thread.h"
>>>>>>>>      #include "qemu/coroutine_int.h"
>>>>>>>>      #include "io/channel.h"
>>>>>>>> +#include "io/channel-buffer.h"
>>>>>>>>      #include "net/announce.h"
>>>>>>>>      #include "qom/object.h"
>>>>>>>> @@ -147,8 +148,10 @@ struct MigrationState {
>>>>>>>>          /*< public >*/
>>>>>>>>          QemuThread thread;
>>>>>>>> +    QEMUBH *vm_start_bh;
>>>>>>>>          QEMUBH *cleanup_bh;
>>>>>>>>          QEMUFile *to_dst_file;
>>>>>>>> +    QIOChannelBuffer *bioc;
>>>>>>>>          /*
>>>>>>>>           * Protects to_dst_file pointer.  We need to make sure we won't
>>>>>>>>           * yield or hang during the critical section, since this lock will
>>>>>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>>>>>> index 5707382db1..05fe0c8592 100644
>>>>>>>> --- a/migration/ram.c
>>>>>>>> +++ b/migration/ram.c
>>>>>>>> @@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>>>>>>>>          page_address = (void *) uffd_msg.arg.pagefault.address;
>>>>>>>>          bs = qemu_ram_block_from_host(page_address, false, offset);
>>>>>>>>          assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
>>>>>>>> +
>>>>>>>>          return bs;
>>>>>>>>      }
>>>>>>>>      #endif /* CONFIG_LINUX */
>>>>>>>> @@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>>>>>>>>              /* Un-protect memory range. */
>>>>>>>>              res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>>>>>>>>                      false, false);
>>>>>>>> +
>>>>>>>>              /* We don't want to override existing error from ram_save_host_page(). */
>>>>>>>>              if (res < 0 && *res_override >= 0) {
>>>>>>>>                  *res_override = res;
>>>>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>>>>> index 27e842812e..dd4ad0aaaf 100644
>>>>>>>> --- a/migration/savevm.c
>>>>>>>> +++ b/migration/savevm.c
>>>>>>>> @@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>>>>>>>>          return 0;
>>>>>>>>      }
>>>>>>>> -static
>>>>>>>>      int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>>>>                                                          bool in_postcopy,
>>>>>>>>                                                          bool inactivate_disks)
>>>>>>>> diff --git a/migration/savevm.h b/migration/savevm.h
>>>>>>>> index ba64a7e271..aaee2528ed 100644
>>>>>>>> --- a/migration/savevm.h
>>>>>>>> +++ b/migration/savevm.h
>>>>>>>> @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
>>>>>>>>      void qemu_loadvm_state_cleanup(void);
>>>>>>>>      int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>>>>>>>>      int qemu_load_device_state(QEMUFile *f);
>>>>>>>> +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>>>> +        bool in_postcopy, bool inactivate_disks);
>>>>>>>>      #endif
>>>>>>>> -- 
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>> -- 
>>>>>> Andrey Gruzdev, Principal Engineer
>>>>>> Virtuozzo GmbH  +7-903-247-6397
>>>>>>                    virtuzzo.com
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


--------------3CC4233DB46E0F662B8FD4BB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21.01.2021 20:48, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121174829.GM3072@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 21.01.2021 19:11, Dr. David Alan Gilbert wrote:
</pre>
        <blockquote type="cite">
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
            <pre class="moz-quote-pre" wrap="">Yep, I'll take a look at the QMP command sequences, how it should look
like in our case and prepare an example, hope we are not missing something serious.
At least we know that block setup data won't go to snapshot.
I've also checked starting background snapshot from the stopped VM state -
looks OK, VM resumes operation, snapshot is saved, no apparent problems.

Maybe it will take some time, since now I'm on task to create tool to store
snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">If you want to make it indexable, why not just do a simple write(2) call
for the whole of RAM rather than doing the thing like normal migration?

Dave
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
For me the main reason is apparent file size.. While we can get the same allocation
size when saving via write(2) on Linux, in many cases the apparent file size will
be much bigger then if use QCOW2.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you mean because of zero pages or for some other reason?

Dave
</pre>
    </blockquote>
    <pre>Yes. So plain sparse file on ext4 would grow to apparent size equal to
highest non-zero GPA. While QCOW2 won't. It's important from the point of
user experience, since desktop workload often show very small non-zero RSS.
When I start Win10 on QEMU with a single Firefox tab with some Youtube HD
video I have only 2-5GB of migration data on a 16GB VM.

Andrey
</pre>
    <blockquote type="cite" cite="mid:20210121174829.GM3072@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Andrey

</pre>
        <blockquote type="cite">
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
        <pre class="moz-quote-pre" wrap="">
-- 
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

--------------3CC4233DB46E0F662B8FD4BB--

