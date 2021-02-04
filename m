Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56530FB49
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:26:08 +0100 (CET)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jKR-00081t-Ab
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l7iXg-000844-Hl
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:35:44 -0500
Received: from mail-he1eur01on0726.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::726]:47126
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l7iXa-0004CH-BR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:35:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTdqrdv2HN5qKPlKP4CgbK1gee0YktBxo0GwMvwfCBq9cUA4oczOBzEP5qndYnfSHN5h6bh7nmyBLndjxCvy+bUZK+gL00nRUrCCQGydX1Nt5/rXU1Mv9DW/RiRNbnvB/kzWNolS+esF7cBFlSmhoVzLTjxf5/Yh0DCfiZ2Y2uXF41boymvBzmqKxxeIq5gGCQ/RPibY2WkOcTU91t6OzGZwrAvyWaILs1BDzuzk0ER3sNkj9eRAtLo3wKxi64KezbdzaG20ghmi5aVlEPx5M0aqvTN5dsTb/nTEkDTrv4au+RzKqM8VKavtrc91jX47IOoOvTDgh6dSeuyJBNsq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOL0LnnoLLgTeQ1umfL/WocsqzptQXChk7DyQgMbpp0=;
 b=I8KC0YWV5VPshINQm1N+aWaCCIvXMBU0zSimTs2D/opBizGnrcj4QXNUzZS43wOeO3OmV01YI9DsWbJRVlRN6UHD1GP2B4HzskonVyeipECECgncgTdeV0xOeO+taazmbvmqOXOJ2FQmOcYszaLNPb+8o8PRlUCcQZJ5U9RclwHR9I5oxmpJ6vktabyHtTro+iM8UEfjEyuVcqggBTEZavw0sbYCuORx30EVb727JufLah5hzUJ3fiAGnJBnDyrY+4+JaCPjWT8tQxaTWSGz5AGYmWwPwMCWMnjxa5/tFgkxyS5JxKiU293uZ8HAlvl8GLljTXSPGANmbm20ZNXM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOL0LnnoLLgTeQ1umfL/WocsqzptQXChk7DyQgMbpp0=;
 b=rNi4wSMmK64k96+UdS/St7ErJ90afzTZmlus2fzT4HgEG8/GAZ2FH+J1k0c6LqMf6ZpnBDovoAduUFXJhVC23DMMXo97PChp1TwTd7Gv5dHii3K/8wd6rj6JjwrQBokqDSqyuZFOPs/1VZ3FaH9/o2muh0bhENdi4thiCmu/8SU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4435.eurprd08.prod.outlook.com (2603:10a6:208:144::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 4 Feb
 2021 17:30:32 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 17:30:32 +0000
Subject: Re: [PATCH v14 0/5] UFFD write-tracking migration/snapshots
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20210129101407.103458-1-andrey.gruzdev@virtuozzo.com>
 <20210204150140.GC24147@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <a466a442-4558-4b8f-c936-b3c20c631b02@virtuozzo.com>
Date: Thu, 4 Feb 2021 20:30:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204150140.GC24147@work-vm>
Content-Type: multipart/alternative;
 boundary="------------6F77C9BDE11CA5E9FD7FC1FC"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:205:1::22) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:205:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Thu, 4 Feb 2021 17:30:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 115a8504-6a93-439c-8b52-08d8c93292ad
X-MS-TrafficTypeDiagnostic: AM0PR08MB4435:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB44352C723CD8D9BFD496AD069FB39@AM0PR08MB4435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wncjrGKPlDIYXtThX3QJQDNM/Ctlp7sHNipbtRsiVOawPFp4fYfniHvfgvghiwPP8NAYDp+2Bou/NFslSau6I54XiWM1yszJi5TbctLkcjpEE6FOPztZsscPh7hGHtPP/s6zsen2Zn8mH+ddIdtOVvzdewjDfTfbpimIiq5/H8wPUDql6sLbEIyF1jTjQmAAGIuEzuFIERCOj0TZ3ZPtLpx6W4zeGHsYp3X2KULDXt9/BYVS6qD1MGAk6WUxMXk/SjgXQ2RR1xeglH+bk4ah0Qja4dpkkP5jh+56o2QXiapHPaPLIeFMaIqdCr0hVVBb4Tf9ucXnLCbg9cl/ugEmA5oU/1UQmdAgy2y4g9BNikb5e1ov1KGAo9xzA77DzD8YnKk3Q+/PVel+rsbvctSedqdexRfoQqTdXbXQrAtFqXh7n+KLGopyojaI464/qcX5hbvn8vmCUSB/SpdDknkQG1EnNW6EzPwxDaI5XW4ZOVaEoNDDe8c7CmWEadPNZCKe6EeHXXsBP1EEw7O8VxMMgVhc3OoZ4Zaukhnzl7M4DY5RFiwT6ItE715TY2SyzgyJgYoINRixE1kGBj46WT4u89F3VrAv2glSDgcqJTxeRltlP1Tz++Mm7RJ46vdVd7ap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(346002)(376002)(396003)(366004)(66556008)(478600001)(16526019)(66476007)(186003)(33964004)(2616005)(66946007)(4326008)(52116002)(86362001)(8676002)(54906003)(8936002)(6916009)(36756003)(44832011)(16576012)(83380400001)(31696002)(316002)(2906002)(53546011)(6486002)(26005)(31686004)(956004)(5660300002)(30864003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1FNMW55Q2dDeGxLR2t2NENicHR5dzFIOEVQaHlDK0Y5Y0ladzYyVXkxYzA4?=
 =?utf-8?B?U0lQYU9wamo2aC9CUDl3eUZNL1llRjY3cVI0dG1GdlVJa3BadE9IaVg4ZWcx?=
 =?utf-8?B?aUtpeWtka3lZOWhrWEhUd243MkVWSWI5STlpWnoxdVg5bzgyWGJFWCtrS3Zw?=
 =?utf-8?B?Y3lkRXNESWhYZkE2aENnZjR6Zis4Y1NLa3piTzRDcU4xdWVVeGptaEdweDkv?=
 =?utf-8?B?UE5IbllqSFlYK3lrb0kxbTBzRG5xc2hwVVEzUE1SclAramx5Y1pQQWpvL0M5?=
 =?utf-8?B?YTdEcTM3VG1zVWxIUDZraFNSSVZGUjQ5QnZRaVBSTmE1OGZNbHcxQmxYdXhi?=
 =?utf-8?B?RHhkMGxCRm5OSENWNGRESUtySm9nZlpFV2o4d0F6UTdINFVscmVlUmNGdmdJ?=
 =?utf-8?B?aThJUitIbEhLV1F5T3JCQ3VOSU5tVy9BTFFQZDloUW1zb3VLZUpEamgrOWlR?=
 =?utf-8?B?c3JwZVlxdDNkUHdsUG4rL0I4aFR5MVNMNkJCN3N1UGhvU3FVWTNYdCtsWEc4?=
 =?utf-8?B?R3JCeFUrNFRkaWRERHpOQ1ZhNU5icmlzejg4MlJOSVZFQWFSUy9TSDZhTVEw?=
 =?utf-8?B?M3hidDIzL3ZTeEhWVVBIWnhnUnpuUnF3bUJKcVRzTTJEcVVrNnVTRW8zbXFT?=
 =?utf-8?B?cGRldWlNSHhyT3dualNZeUFuZG84cEVkdWJBcG1GclpTV3VSTWlOYjNBaGNx?=
 =?utf-8?B?QlcyRVlicDVPZU8rK1dRTTJVZGhmYTl6cjJqRW9heDZNdHBYUXZ1Y0Jhendp?=
 =?utf-8?B?NUNSL1g5RWdvQi82WFJveWRCVFV0bHlnUmtvNC9hK2VkNWozMXhGZ1Q1WExB?=
 =?utf-8?B?cHRZRFBESFJNeERtTk1ianlxemhsQU9Fc1BYK0NJVktvcnhCaFBxTTVtS3N0?=
 =?utf-8?B?bXpWcDlRQS85ZlhSQVZFTVRsWjMvdk9kdVk0aWN5ZHFLaXVsLy8wMEpxb3Nt?=
 =?utf-8?B?eHhnMUxkWTJWRVgvS2FvMksycW5BaU00SjhNd0tXRTRiVUh6NUFxcFNnS0Vu?=
 =?utf-8?B?SUw4WER6SlQ2ZWdOMDh6RU9YcmUzNFAwM01xTEJJdFdPSVVFMW1sR3Q3VzMy?=
 =?utf-8?B?RkgrSG5vbHBCY1J3eWY2RlAycVFybFEzd2cvS2E5OWJ4WmkxU2ZOUUZZYmRK?=
 =?utf-8?B?NHZiN2wvbzZTOTVTVHVwNWRsai9xM04rYkQ5dXlEdXdxeVBjSmxET0FnMXEz?=
 =?utf-8?B?ZTlYaEVQZ21rUTF3L3VjSEp4SWZQVjR3dVdEL0grNDZTcDBWc3UxbWdmWU1W?=
 =?utf-8?B?Nm1UcnY2ejRsdDNFN1Q4Ykc4aG9rR3I4OUNUbTRqWlN1ZlR1M0dsdmRPZDhV?=
 =?utf-8?B?NGt6VGJWRUVQaVRqMERYbzZuQ2w5UVZlZFZ0MUVKMEJzU2FxZXhsNWZ5TThj?=
 =?utf-8?B?T1loTE4vaU5HbHZEb0pWQy9FR2VCV2Y0cjJsU2NlTUw3bzJsTHEyTW5UMTcv?=
 =?utf-8?Q?l/VIfIq6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115a8504-6a93-439c-8b52-08d8c93292ad
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 17:30:32.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFeMTvHIUTt8oiouDgbUSqRgHu97fvtKgAH0tofDCQAR18i6NeCKJJ97rLVEvyt0CTkNR7DbRnI+LrY2YUAcZDCSCvU6mrDLI5hxlzMCa7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4435
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------6F77C9BDE11CA5E9FD7FC1FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.2021 18:01, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>
>> Currently the only way to make (external) live VM snapshot is using existing
>> dirty page logging migration mechanism. The main problem is that it tends to
>> produce a lot of page duplicates while running VM goes on updating already
>> saved pages. That leads to the fact that vmstate image size is commonly several
>> times bigger then non-zero part of virtual machine's RSS. Time required to
>> converge RAM migration and the size of snapshot image severely depend on the
>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>> creation time and huge image size.
>>
>> This series propose a way to solve the aforementioned problems. This is done
>> by using different RAM migration mechanism based on UFFD write protection
>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>> guest RAM content using write-protection and iteratively release protection
>> for memory ranges that have already been saved to the migration stream.
>> At the same time we read in pending UFFD write fault events and save those
>> pages out-of-order with higher priority.
> Queued

Thanks!

>> How to use:
>> 1. Enable write-tracking migration capability
>>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability
>>     background-snapshot on
>>
>> 2. Start the external migration to a file
>>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>>
>> 3. Wait for the migration finish and check that the migration has completed.
>> state.
>>
>>
>> Changes v13->v14:
>>
>> * 1. Removed unneeded '#ifdef CONFIG_LINUX' from [PATCH 1/5] where #ifdef'ed
>> *    code was originally introduced. In v13 removed #ifdef's appeared to be
>> *    a diff in [PATCH 4/5] on top of previous patches.
>>
>> Changes v12->v13:
>>
>> * 1. Fixed codestyle problem for checkpatch.
>>
>> Changes v11->v12:
>>
>> * 1. Consolidated UFFD-related code under single #if defined(__linux__).
>> * 2. Abandoned use of pre/post hooks in ram_find_and_save_block() in favour
>> *    of more compact code fragment in ram_save_host_page().
>> * 3. Refactored/simplified eBPF code in userfaultfd-wrlat.py script.
>>
>> Changes v10->v11:
>>
>> * 1. Updated commit messages.
>>
>> Changes v9->v10:
>>
>> * 1. Fixed commit message for [PATCH v9 1/5].
>>
>> Changes v8->v9:
>>
>> * 1. Fixed wrong cover letter subject.
>>
>> Changes v7->v8:
>>
>> * 1. Fixed coding style problems to pass checkpatch.
>>
>> Changes v6->v7:
>>
>> * 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
>> *    before stopping VM to make runstate transition valid.
>> * 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
>> * 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.
>>
>> Changes v5->v6:
>>
>> * 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
>> *    for write-tracking support level in migrate_query_write_tracking(), check
>> *    each time when one tries to enable 'background-snapshot' capability.
>>
>> Changes v4->v5:
>>
>> * 1. Refactored util/userfaultfd.c code to support features required by postcopy.
>> * 2. Introduced checks for host kernel and guest memory backend compatibility
>> *    to 'background-snapshot' branch in migrate_caps_check().
>> * 3. Switched to using trace_xxx instead of info_report()/error_report() for
>> *    cases when error message must be hidden (probing UFFD-IO) or info may be
>> *    really littering output if goes to stderr.
>> * 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
>> * 5. Added memory_region_ref() for each RAM block being wr-protected.
>> * 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
>> * 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
>> * 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
>> *    that choosen criteria for high-latency fault detection (i.e. timestamp of
>> *    UFFD event fetch) is not representative enough for this task.
>> *    At the moment it looks somehow like premature optimization effort.
>> * 8. Dropped some unnecessary/unused code.
>>
>> Andrey Gruzdev (5):
>>    migration: introduce 'background-snapshot' migration capability
>>    migration: introduce UFFD-WP low-level interface helpers
>>    migration: support UFFD write fault processing in ram_save_iterate()
>>    migration: implementation of background snapshot thread
>>    migration: introduce 'userfaultfd-wrlat.py' script
>>
>>   include/exec/memory.h        |   8 +
>>   include/qemu/userfaultfd.h   |  35 ++++
>>   migration/migration.c        | 357 ++++++++++++++++++++++++++++++++++-
>>   migration/migration.h        |   4 +
>>   migration/ram.c              | 303 ++++++++++++++++++++++++++++-
>>   migration/ram.h              |   6 +
>>   migration/savevm.c           |   1 -
>>   migration/savevm.h           |   2 +
>>   migration/trace-events       |   2 +
>>   qapi/migration.json          |   7 +-
>>   scripts/userfaultfd-wrlat.py | 122 ++++++++++++
>>   util/meson.build             |   1 +
>>   util/trace-events            |   9 +
>>   util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
>>   14 files changed, 1190 insertions(+), 12 deletions(-)
>>   create mode 100644 include/qemu/userfaultfd.h
>>   create mode 100755 scripts/userfaultfd-wrlat.py
>>   create mode 100644 util/userfaultfd.c
>>
>> -- 
>> 2.25.1
>>
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------6F77C9BDE11CA5E9FD7FC1FC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04.02.2021 18:01, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204150140.GC24147@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.

Currently the only way to make (external) live VM snapshot is using existing
dirty page logging migration mechanism. The main problem is that it tends to
produce a lot of page duplicates while running VM goes on updating already
saved pages. That leads to the fact that vmstate image size is commonly several
times bigger then non-zero part of virtual machine's RSS. Time required to
converge RAM migration and the size of snapshot image severely depend on the
guest memory write rate, sometimes resulting in unacceptably long snapshot
creation time and huge image size.

This series propose a way to solve the aforementioned problems. This is done
by using different RAM migration mechanism based on UFFD write protection
management introduced in v5.7 kernel. The migration strategy is to 'freeze'
guest RAM content using write-protection and iteratively release protection
for memory ranges that have already been saved to the migration stream.
At the same time we read in pending UFFD write fault events and save those
pages out-of-order with higher priority.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Queued
</pre>
    </blockquote>
    <pre>Thanks!
</pre>
    <blockquote type="cite" cite="mid:20210204150140.GC24147@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate_set_capability
   background-snapshot on

2. Start the external migration to a file
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate exec:'cat &gt; ./vm_state'

3. Wait for the migration finish and check that the migration has completed.
state.


Changes v13-&gt;v14:

* 1. Removed unneeded '#ifdef CONFIG_LINUX' from [PATCH 1/5] where #ifdef'ed
*    code was originally introduced. In v13 removed #ifdef's appeared to be
*    a diff in [PATCH 4/5] on top of previous patches.

Changes v12-&gt;v13:

* 1. Fixed codestyle problem for checkpatch.

Changes v11-&gt;v12:

* 1. Consolidated UFFD-related code under single #if defined(__linux__).
* 2. Abandoned use of pre/post hooks in ram_find_and_save_block() in favour
*    of more compact code fragment in ram_save_host_page().
* 3. Refactored/simplified eBPF code in userfaultfd-wrlat.py script.

Changes v10-&gt;v11:

* 1. Updated commit messages.

Changes v9-&gt;v10:

* 1. Fixed commit message for [PATCH v9 1/5].

Changes v8-&gt;v9:

* 1. Fixed wrong cover letter subject.

Changes v7-&gt;v8:

* 1. Fixed coding style problems to pass checkpatch.

Changes v6-&gt;v7:

* 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
*    before stopping VM to make runstate transition valid.
* 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
* 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.

Changes v5-&gt;v6:

* 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
*    for write-tracking support level in migrate_query_write_tracking(), check
*    each time when one tries to enable 'background-snapshot' capability.

Changes v4-&gt;v5:

* 1. Refactored util/userfaultfd.c code to support features required by postcopy.
* 2. Introduced checks for host kernel and guest memory backend compatibility
*    to 'background-snapshot' branch in migrate_caps_check().
* 3. Switched to using trace_xxx instead of info_report()/error_report() for
*    cases when error message must be hidden (probing UFFD-IO) or info may be
*    really littering output if goes to stderr.
* 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
* 5. Added memory_region_ref() for each RAM block being wr-protected.
* 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
* 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
* 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
*    that choosen criteria for high-latency fault detection (i.e. timestamp of
*    UFFD event fetch) is not representative enough for this task.
*    At the moment it looks somehow like premature optimization effort.
* 8. Dropped some unnecessary/unused code.

Andrey Gruzdev (5):
  migration: introduce 'background-snapshot' migration capability
  migration: introduce UFFD-WP low-level interface helpers
  migration: support UFFD write fault processing in ram_save_iterate()
  migration: implementation of background snapshot thread
  migration: introduce 'userfaultfd-wrlat.py' script

 include/exec/memory.h        |   8 +
 include/qemu/userfaultfd.h   |  35 ++++
 migration/migration.c        | 357 ++++++++++++++++++++++++++++++++++-
 migration/migration.h        |   4 +
 migration/ram.c              | 303 ++++++++++++++++++++++++++++-
 migration/ram.h              |   6 +
 migration/savevm.c           |   1 -
 migration/savevm.h           |   2 +
 migration/trace-events       |   2 +
 qapi/migration.json          |   7 +-
 scripts/userfaultfd-wrlat.py | 122 ++++++++++++
 util/meson.build             |   1 +
 util/trace-events            |   9 +
 util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
 14 files changed, 1190 insertions(+), 12 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100755 scripts/userfaultfd-wrlat.py
 create mode 100644 util/userfaultfd.c

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

--------------6F77C9BDE11CA5E9FD7FC1FC--

