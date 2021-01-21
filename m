Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC82FE87B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:14:11 +0100 (CET)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xuk-00079R-MM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2XpU-0000Yn-Gj
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:08:44 -0500
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:60438 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2XpO-0007Rt-HF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:08:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRo8O+xbqX1UVn8ruBj7W+M5xvH+KbPm7l+OAE9JxQLwEku2dbcN/rxuv9Plbh9QuYV85jfblzA8vbM6tWqp0FjlMVyWGd+O8TWUnZ4hV2MrddfgLvB2REl5+vTDWH0RhEPZt5ir1AqqqQUe+jjWUJRrq89TIRE65QdqR4FUvf4kZxvyiB5+jpIb6J7d8sHc7yeQXWKIoSkm/kYJ46SZBjbG0otRGYw+VC94CLhP2bKKzZN9D0/MEXzAguBi0ZLKTVwwL5UXaDGLYXycSEJGE/PseK3V7s6/CFoceJnh7eUvMKPQljF9Ew3WUaC+JVgN21n+Hl6GBTpOZLb3M1/iuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6UMTT7zUx7hir74FY67/ke61ulIDNJyCf3ZJ+xS0Xw=;
 b=kuljthTtEYpw28nXxiCT7YsCNXEEhNMKFhjHfQ3vUhjlP8itL9t+imYwaoPqE+ZPqEBKC93LChJQgcp+RF18QBEEt4uDHKNDG+i9r3wmmjWvoaxRyJPCWcJiWX+QonI5ubGkpqly6D0T1Ub5p1BPTby0yTN38ap7c47+k2Mkg1EEd1SqZG/VpeR3eFFOPT2JRJ1Vome3sTNvm99OfUZWUEhM8G6DK2x1zB2g5j4h8ya/Y8Cn+RwmN2fnKQldrk2Dv7MCRZYfyAArM7XBSnOwySD0NNGRiR5SFKl1x/K8z9eWqvclQgMfJNoDgsHYK4OLFVKfeLrlDzfSOIOfoSfuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6UMTT7zUx7hir74FY67/ke61ulIDNJyCf3ZJ+xS0Xw=;
 b=N/OKwSNInMdL3sNeRAoZZg8SV3FXhRsaIntdIuwQ7JcElhuAWALlC6vAV3vm/q4h6odhZfGxf8CgvO/ccjfcnlWG6U60Ab2ckK4v8zuYd1k+HTZz0SPSN+A3FtDqBaPx8HxWqG8hk5RpjFXhN8emZWj8TN6R1gCIAjhf2lnr5VM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 21 Jan
 2021 11:08:35 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 11:08:35 +0000
Subject: Re: [PATCH v11 4/5] migration: implementation of background snapshot
 thread
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-5-andrey.gruzdev@virtuozzo.com>
 <20210119184931.GJ3008@work-vm>
 <a552fca2-b06e-feb7-997f-24d8341267e5@virtuozzo.com>
 <20210121095647.GC3072@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <d8ff9353-22fb-08b4-ec12-e5e6a13266d5@virtuozzo.com>
Date: Thu, 21 Jan 2021 14:08:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121095647.GC3072@work-vm>
Content-Type: multipart/alternative;
 boundary="------------B03D7290855916D37B3DCD41"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:208:55::22) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR04CA0117.eurprd04.prod.outlook.com (2603:10a6:208:55::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 11:08:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d0cebf9-665b-4656-1087-08d8bdfce568
X-MS-TrafficTypeDiagnostic: AM9PR08MB6273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB6273849E8A1873C109ECE42B9FA10@AM9PR08MB6273.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NxJZ9KqsQdL98DYvnlyYVE46uYWPwVid56A9deezx0qxopjjBqOXTVnxE9MU48YGETyjZ9xULlALoDTC5+sjBioFHvR+WAnobf9jNtRB11mlVH0QqbHZ7OhrzkpXb5F5+uDfDr1XuXAQk3e7VCKQ+Ee7nvqNEgKrgYNYZ40LgGETzvbxSW+Qovsl3nedN8kUNCBjTAz+VgvH3kCGy1x2Pv6IycKZQPGj9yP3BNeR5eJ7SioJJVKRGrGEQo4w32dKV31+1yqkwiKKonpvPgvU7RnYhvVEf987xyQ9DvDfFxBFq2wXt8a4Rqa/0xR81F/zH6GjxPDqeoFDZpt/n8Xx3+gsV9pqX0xVtcCtyjyTZ6ppaDBTK+t/VPv7Fukvb/NeA1EdLiJCNEE6tLT+0mQX/IfoEQryY6In9j+OjKVOrimLFDDXBVVRX8r6p0McoVU44ps0AAtHKMFeucmGtS2IruM6w/H7N8QGORUU4H7PVhZPpRG4H7pk/nOVXeg+P+0Z2T20HNc+HaT2+y0t4UHHhwdKo1HfmFIZZG7n6xrB47p4dUoOTTTtTOTa98YKevTVl75gwLs8y5I6BKSVlRNmTxjHXvFUKL9YT7DtnFdx7hU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39840400004)(44832011)(8676002)(16526019)(30864003)(36756003)(26005)(66556008)(86362001)(31696002)(8936002)(83380400001)(66476007)(186003)(478600001)(53546011)(66946007)(33964004)(31686004)(5660300002)(956004)(52116002)(2616005)(6486002)(16576012)(4326008)(316002)(2906002)(6916009)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N1AxRkZ3b2lZVHRlZ1pWWTdXd2JVWlV3RkNtZkFyTWsyVmRsZ3BtVWFYY0FF?=
 =?utf-8?B?VmtJMXpHQnFvN3p3VFNEV0JwN2hhYXRWbzZaTjVzbWNMSXhIYXZnR1M1aE5K?=
 =?utf-8?B?RjN3V3lWT2svaEV2NHFPZHRGakYyMWQ0a042bTAvV1M2OU16d0dvRE5uWmVI?=
 =?utf-8?B?d0dOc25pY0ZmV1ZrcG92cnBnTVZVcm5tNUtJeFp3Z3VWK1dMc3Fmdm9HeUd0?=
 =?utf-8?B?K21BOEltYTZJSGVWY0F0dDlWNnlqYUd6akh6SG15bE54RmlZYWJPaE01cXZN?=
 =?utf-8?B?Zm9HZ010dlhGbnpwaCtuZXVqVkk0cUVRMUp6cUhQbGhka2o1SEhoUDRjQXJz?=
 =?utf-8?B?SDVHN1ExaUs1YnR2SDFLVkpVSk9oSS9aNk5PRUkyU0FOQlBzZmlDdTFKc0FZ?=
 =?utf-8?B?QjAzQmVLU1J0cUhkR3grN3hWZlEwSjNiU25LQS9aSVdma2pXZEd5K3lrUUpZ?=
 =?utf-8?B?LzkvQThyM3NWeFc1RFhiMzlrWmNrRW94Rzl3aXJmTldYMklUNHRMdDl1RGhO?=
 =?utf-8?B?aXl4REpRbk0yUFJWbkJ5eHVwQlpVbHJ3TS9saGdrWUQzNUhJMWVNRk41eHpt?=
 =?utf-8?B?QlcyamwxeUVJWVdFVG1IdzVVK0JVb2x3QmQyVGpoREZBcUJsTEdldWx3OHB3?=
 =?utf-8?B?VUFMcmVyTUYzd1kvcWtUOUdSczZ3RlJTbTF3dG45VlMxUDlHSGg2ZTUwNGlX?=
 =?utf-8?B?cnhjZUNlN2J4N08ybDNoTDZoS1YrV1pnTERRYmJzSUxIU0s3ekN6RlFWTHJn?=
 =?utf-8?B?b0tVcjdoV0Y5ZUliRVZhbFRScktmUVgrUThQMnYveHYwdUp1dXdBNUhwRndI?=
 =?utf-8?B?UkxGSDRCcVhMa0xQKytnN0ozbEJZTzM0WTgvakdTRno5NzJpc3FIdkJLam9D?=
 =?utf-8?B?NFNZWllxbkw4TGg5NWJTQTRCYjVscXM2by90MG5aV1c4cElkL3pNWDd1dXdi?=
 =?utf-8?B?b1A0NjhVbFg5OWl4ODFXUWpINXV2NVFHRW5oQmdnSE43L2pId2hRRzNoMk5M?=
 =?utf-8?B?bEZkZlVlb3BXSlY4bWlpNzB0bDRnWGIvVFBONUQ2YzUxOEFpQlJNeW1wYkhi?=
 =?utf-8?B?Mm96VGpJcEJnWVZlc2tzM0Jua3lJREtYSysvU1hrV1BNYWV2UEQ1VGN0Qm0y?=
 =?utf-8?B?ZlNLUG40S2JYZ2tOdzVqYnRpOUQ5eWhtMnNSdStNRUcwRVlqY1VXak5YcW9L?=
 =?utf-8?B?VjBSdkNOZHJpazJoempsWmkwWkFuRm1VNUlPdDFET1FlS3RpWWM0Q3Y4TVFQ?=
 =?utf-8?B?aEZOQ3hJenh1Sk5rVlo0WG8zOG9LdStWYksvMEpQalp5YmR4L3NaWGY5Qkov?=
 =?utf-8?Q?ydD/rMdvnKxf8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0cebf9-665b-4656-1087-08d8bdfce568
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 11:08:35.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUEWg/Ygv+hUWF4WxJ6EDuhFC2bW+hMPN+s2hAuStOjv6Ch+SPhjLdLZ2v0h1e/jZ+89OVP2UxfHMyfslHxEyulNlXdPYY65T1qDxkNLFUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273
Received-SPF: pass client-ip=40.107.0.98;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001,
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

--------------B03D7290855916D37B3DCD41
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.01.2021 12:56, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>> Introducing implementation of 'background' snapshot thread
>>>> which in overall follows the logic of precopy migration
>>>> while internally utilizes completely different mechanism
>>>> to 'freeze' vmstate at the start of snapshot creation.
>>>>
>>>> This mechanism is based on userfault_fd with wr-protection
>>>> support and is Linux-specific.
>>> I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
>>> you still have the source running so still have it accessing the disk;
>>> do you do anything to try and wire the ram snapshotting up to disk
>>> snapshotting?
>> Block-related manipulations should be done externally, I think.
>> So create backing images for RW nodes, then stop VM, switch block graph
>> and start background snapshot. Something like create 'virsh snapshot-create-as'
>> does, but in other sequence.
> If you get a chance it would be great if you could put together an
> example of doing the combination RAM+block; that way we find out if there's
> anything silly missing.
>
> Dave

Yep, I'll take a look at the QMP command sequences, how it should look
like in our case and prepare an example, hope we are not missing something serious.
At least we know that block setup data won't go to snapshot.
I've also checked starting background snapshot from the stopped VM state -
looks OK, VM resumes operation, snapshot is saved, no apparent problems.

Maybe it will take some time, since now I'm on task to create tool to store
snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.

Andrey

>> //
>>
>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>> Acked-by: Peter Xu <peterx@redhat.com>
>>>> ---
>>>>    migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
>>>>    migration/migration.h |   3 +
>>>>    migration/ram.c       |   2 +
>>>>    migration/savevm.c    |   1 -
>>>>    migration/savevm.h    |   2 +
>>>>    5 files changed, 260 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 2c2cb9ef01..0901a15ac5 100644
>>> <snip>
>>>
>>>> -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>>>> -                       QEMU_THREAD_JOINABLE);
>>>> +
>>>> +    if (migrate_background_snapshot()) {
>>>> +        qemu_thread_create(&s->thread, "background_snapshot",
>>> Unfortunately that wont work - there's a 14 character limit on
>>> the thread name length; I guess we just shorten that to bg_snapshot
>> Yep, missed that pthread_set_name_np() has a length limit)
>>
>>> Other than that,
>>>
>>>
>>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>
>>>> +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
>>>> +    } else {
>>>> +        qemu_thread_create(&s->thread, "live_migration",
>>>> +                migration_thread, s, QEMU_THREAD_JOINABLE);
>>>> +    }
>>>>        s->migration_thread_running = true;
>>>>    }
>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>> index f40338cfbf..0723955cd7 100644
>>>> --- a/migration/migration.h
>>>> +++ b/migration/migration.h
>>>> @@ -20,6 +20,7 @@
>>>>    #include "qemu/thread.h"
>>>>    #include "qemu/coroutine_int.h"
>>>>    #include "io/channel.h"
>>>> +#include "io/channel-buffer.h"
>>>>    #include "net/announce.h"
>>>>    #include "qom/object.h"
>>>> @@ -147,8 +148,10 @@ struct MigrationState {
>>>>        /*< public >*/
>>>>        QemuThread thread;
>>>> +    QEMUBH *vm_start_bh;
>>>>        QEMUBH *cleanup_bh;
>>>>        QEMUFile *to_dst_file;
>>>> +    QIOChannelBuffer *bioc;
>>>>        /*
>>>>         * Protects to_dst_file pointer.  We need to make sure we won't
>>>>         * yield or hang during the critical section, since this lock will
>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>> index 5707382db1..05fe0c8592 100644
>>>> --- a/migration/ram.c
>>>> +++ b/migration/ram.c
>>>> @@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>>>>        page_address = (void *) uffd_msg.arg.pagefault.address;
>>>>        bs = qemu_ram_block_from_host(page_address, false, offset);
>>>>        assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
>>>> +
>>>>        return bs;
>>>>    }
>>>>    #endif /* CONFIG_LINUX */
>>>> @@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>>>>            /* Un-protect memory range. */
>>>>            res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>>>>                    false, false);
>>>> +
>>>>            /* We don't want to override existing error from ram_save_host_page(). */
>>>>            if (res < 0 && *res_override >= 0) {
>>>>                *res_override = res;
>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>> index 27e842812e..dd4ad0aaaf 100644
>>>> --- a/migration/savevm.c
>>>> +++ b/migration/savevm.c
>>>> @@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>>>>        return 0;
>>>>    }
>>>> -static
>>>>    int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>                                                        bool in_postcopy,
>>>>                                                        bool inactivate_disks)
>>>> diff --git a/migration/savevm.h b/migration/savevm.h
>>>> index ba64a7e271..aaee2528ed 100644
>>>> --- a/migration/savevm.h
>>>> +++ b/migration/savevm.h
>>>> @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
>>>>    void qemu_loadvm_state_cleanup(void);
>>>>    int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>>>>    int qemu_load_device_state(QEMUFile *f);
>>>> +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>> +        bool in_postcopy, bool inactivate_disks);
>>>>    #endif
>>>> -- 
>>>> 2.25.1
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


--------------B03D7290855916D37B3DCD41
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21.01.2021 12:56, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121095647.GC3072@work-vm">
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
        <pre class="moz-quote-pre" wrap="">
Block-related manipulations should be done externally, I think.
So create backing images for RW nodes, then stop VM, switch block graph
and start background snapshot. Something like create 'virsh snapshot-create-as'
does, but in other sequence.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you get a chance it would be great if you could put together an
example of doing the combination RAM+block; that way we find out if there's
anything silly missing.

Dave
</pre>
    </blockquote>
    <pre>Yep, I'll take a look at the QMP command sequences, how it should look
like in our case and prepare an example, hope we are not missing something serious.
At least we know that block setup data won't go to snapshot.
I've also checked starting background snapshot from the stopped VM state -
looks OK, VM resumes operation, snapshot is saved, no apparent problems.

Maybe it will take some time, since now I'm on task to create tool to store
snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.
Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.

Andrey

</pre>
    <blockquote type="cite" cite="mid:20210121095647.GC3072@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
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
        <pre class="moz-quote-pre" wrap="">
Yep, missed that pthread_set_name_np() has a length limit)

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
        <pre class="moz-quote-pre" wrap="">
-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com

</pre>
      </blockquote>
    </blockquote>
    <pre>
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------B03D7290855916D37B3DCD41--

