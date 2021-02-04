Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C230FB8C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:34:46 +0100 (CET)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jSn-0000hg-OX
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l7iUZ-0004J6-4m
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:32:36 -0500
Received: from mail-eopbgr130138.outbound.protection.outlook.com
 ([40.107.13.138]:33731 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l7iUS-0002vL-Ck
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:32:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFEraEyIAhXqtapfVSc900OBPys8/iN4zePpa+TnuLLUP/4DP2SkD/SioxHx3bE1ygJKrH9SdYy6WilAIRZ/UJ1mT+qLdlRKuwJ/1x1x46I+uWFWKroZ2kt6C13GqT0Y85mKBTOC6vYjwPz+iqa4WSrGPOAztqXplDav5/tagBs+1rZXGXWmT2LvEzm9hDN9Uu9o/K3YfNR7yCBraSZJiBz2smz0Fc+55a/nCHvT9Bs5x5bvqOd1lSzx8wZ3al4Tmnc/amGBfbqYbYdpJB7WNKxvUeI9jFhVlCh83VkMTruG2W/DLkzA/09crgQPfColxlK/BLVOoliPEGFepOnNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEOOvmrp1INasrYCfUZla/UmozDFCElVZRjR6iOtSO0=;
 b=IqgmAIz2nSCfXbxvNMbjEratB6nn0/7B5Tuh8aHvhGeYI17u2J1g/KOFVB3y+UIw4PHgkmdE9eXoOTv43HEbxdhUlDc8jNKxPb2fuDMJCVtxqXNtcymuuW/G3Xh11j4/qerfDjqxnwsy9j0VLm1m8wuJ9+cFwHG2dVVPD+fzb3IV5G/Br08r3DUlphbsS+bbu6ZraTUZfj+uhczfPYRQ1w1PG60CGAmy2+rzMnluZOuAPmXQQ7jb8wwfF6YQYGbEVumLSYz+Qy9MMOuVROsW8xxEvJROpMXpWHdv5JPCW+u0qjeq+fRyq2zM3x1Hoiug/0eG1u8P2lL8xKMjFO2FIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEOOvmrp1INasrYCfUZla/UmozDFCElVZRjR6iOtSO0=;
 b=uhxNLWX9fDaG//MKArbE9IIfN9rRqaoDyPqtA+abNb2cdaD9ihH6k+78NQR+EwYazMJIKJpNRFoN0GNuq9VP3Mt/xeGYpKLlHUw+M9Vt9iDAvEsXnKzI/NfqUH/NfL2QbSkDTOkZeJrSUKmok1Se33LemIY/ghzty24iNUBKU/E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB5297.eurprd08.prod.outlook.com (2603:10a6:208:18a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Thu, 4 Feb
 2021 17:32:21 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 17:32:21 +0000
Subject: Re: [PATCH v14 0/5] UFFD write-tracking migration/snapshots
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
References: <20210129101407.103458-1-andrey.gruzdev@virtuozzo.com>
 <20210204150140.GC24147@work-vm> <20210204165320.GA4276@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <1296df10-876e-04aa-3432-de4a40caca9e@virtuozzo.com>
Date: Thu, 4 Feb 2021 20:32:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204165320.GA4276@work-vm>
Content-Type: multipart/alternative;
 boundary="------------9B2CE4C7D3556AF32BC2D721"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:205:1::38) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:205:1::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.13 via Frontend Transport; Thu, 4 Feb 2021 17:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 535265ec-0755-41b6-956e-08d8c932d3c2
X-MS-TrafficTypeDiagnostic: AM0PR08MB5297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB529729DBB8ACA489FAC12D309FB39@AM0PR08MB5297.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjSE4upBvZkc/UgV+E9EjufshfqSjsSvgohHUWJvOeMIwgayQSGMU1643PKXi53kDwRm2W5/R9ED6e5g2XGqikfcl3/uObCuws4ze3ML/uHes78KO4fsZOjdj5g/OLPgoHpFxeWE83JlAWw/p7lIqBl3/yCxU79NC83weAtGiJzXdn/M/BQZUCqRHDrsOxjCUoj+l6mDiQrqJG1NmIalaOIjV+buiAVy1dqAE+lQzGS97PpjEYVZAh+qVqHZAUAfLkDF/4OKf/ovkEZPTlEaVf2I3MuFFbtpp6jiA3zYraqYVUW8jeuMsOjByjZJ9KwccBm72uGcWfghlVtbYRNjycaTtWMYSKeQjf07pJcdB0uR2nYZCyNvgk1mp1XImV+V22bhu2VQjMPzhMNBKlaKLq8K9G9gW3hr+SOrlVUrnQikpvAdUMegoHzYi9tdrtFIhnmVOvdeszq3+h3I8EUP3/1ucvrZh5VVIVpKNUmBKf2RmCmo1ihc8himCWPHJ27UFkXI4mtBR0t/AXODlO7cfUONb46xgQy8mQ/zvr9jLRimvbuSPNBCBR5fybwncJtMjeH41dfDry8yzdZdkf5zHoIw2vQuPZRxnJjsKQhGDOYU77BIcSv/UdPOReBKsLKd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(346002)(136003)(376002)(31686004)(30864003)(8936002)(478600001)(956004)(66476007)(52116002)(16576012)(316002)(66946007)(16526019)(53546011)(5660300002)(86362001)(186003)(6486002)(107886003)(6916009)(31696002)(54906003)(66556008)(2906002)(26005)(83380400001)(4326008)(33964004)(44832011)(8676002)(2616005)(36756003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVM2Z0xaT1JGeDR3SkorTnFCcVhCenZRcWFjSkdRLzJvaURFeWVWV1JUU2pr?=
 =?utf-8?B?cmZjL1kvYjJFejdDWEJKekQxenpMZUxOamxlU0VBUGhtcE9BVDNsQXdXanBE?=
 =?utf-8?B?VnNaU3ptQm1JQ2VmUzh4TTNwT1BSVzBKMEl6d3lqTUdONWJQSUJ2Z1RyN0Nr?=
 =?utf-8?B?eEpKZGFzVEVTR0JnTU1tMFAvdnltbkV1VGpTdzVwcEVxQ1B4Q0o0SHYzVWh5?=
 =?utf-8?B?M05wSFBpYWN3VEp2aUZKNGJJempUdXE2QVh6dXNtK3YwOXlwaHdxUDB1U291?=
 =?utf-8?B?WHBRTUc0OXpNNnJUMi9XcGNwUnBKYldGSmQ2YmFmRUdqbld5TktQLzhFNHk0?=
 =?utf-8?B?UUFCV05BZ1NSV084WjFrUGRaZnVMcDJCRGtVRmdxQnV5dUdWZElIdnRmdS9L?=
 =?utf-8?B?Vm9DWXVhV1lJcjlwdThXZnNYUk10bm1LUUFsTlFzcldneEoveVorNEVOc29F?=
 =?utf-8?B?ckhTRm9ZMk5iSTVSUmtzZHZDWEZLUUdhc3RXS1NqV05zRXU4VHR5UTBvd2Jt?=
 =?utf-8?B?RTFKZElqM3RrdWdxRW5xNVJoSWo4bGZmOUlob292V1BOaWhPRXp0dThQSjVu?=
 =?utf-8?B?ZUFQUFNuUWU0SlUxN1V2VXc5a2hxOXhJVE9hU2kwV3FIZDZaUWZZSlczakx3?=
 =?utf-8?B?Q0NIdTExcm9FOVFJaTM1Q3FhSVR6NVovL0J2Q1J3NTEwbTdpL1p2bFVxL21v?=
 =?utf-8?B?UVo4Mjg5U1F1bVR6R3ZnNThEYUo0aE1OSmdMWE9lcG8wMXVXVm1SM3RpK2tn?=
 =?utf-8?B?aFQvbDhaN01xWkhBbkZidXRVUGd0VGgvVURHakdCZWR5Tno3RmwxZEdpQnI2?=
 =?utf-8?B?TnYrMDdRSGl6b1VIUFg5NTZhaURwdDZTN2ZTKzRJZTBBMTV4a0NHZU1JTEdv?=
 =?utf-8?B?Nm5TQi9uUWIzMi9pak1RUmFVeDkyUXQzaitNeUFLci9mNVNaV3dkY29DQWdI?=
 =?utf-8?B?VnZERlBmUEFiUnhaYWUyTjhCa0loZi9rMkhqalJhVWtkOG4yODVKTmtNdmFm?=
 =?utf-8?B?TnZlUmRZUVI0T1Q0NXl5QXdMMDBVbmxOeVltTGpPQWx2enhmcFB2U0ROV2Rm?=
 =?utf-8?B?dXFGc3lBNVV1SDNud2l3aGh0TUQ4Q2JZSWRyaDFtMlJPdzBsUSs3b2h3aWFQ?=
 =?utf-8?B?SDFKb2FOY3dtZzhQSWtaclZBV01UZlNhQVg2S3JNWFZnb3dWNWFHT2tpRko5?=
 =?utf-8?B?UU9BS1FzdFJJOUZzR21VN3ZxSnZ3R0tNNTZkMVpxWHN2VDQ0dXdBM0MzS1dV?=
 =?utf-8?B?VmpSZWFZWVFGdjFBZHdVZjRSeUJUU3Z3WGJueEljcnEyZFB4ZTEzK3VTaHZJ?=
 =?utf-8?B?WEhJOTZCNEdrS011dzhLMzRTUTVNbWRNanJLVjd3dWY2WXRsQUUxVjRVVko0?=
 =?utf-8?B?TVU4NkFpbmRGdnkwdUFIa1BkTUxiZkVzYm1rNDFIbFljaEdxK2o5aDhPRlhi?=
 =?utf-8?Q?IiiqrdHQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535265ec-0755-41b6-956e-08d8c932d3c2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 17:32:21.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3UEE9G1IaZCVhZjy1UJow/fylYRk1zRM5Ow0jKQfuM4CXCR4Hw7punA7O5/p0MZOeepSWsyAAgP5nkL14/txXOgBCpK5IQKsH+Nm8286bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5297
Received-SPF: pass client-ip=40.107.13.138;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------9B2CE4C7D3556AF32BC2D721
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.2021 19:53, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>>
>>> Currently the only way to make (external) live VM snapshot is using existing
>>> dirty page logging migration mechanism. The main problem is that it tends to
>>> produce a lot of page duplicates while running VM goes on updating already
>>> saved pages. That leads to the fact that vmstate image size is commonly several
>>> times bigger then non-zero part of virtual machine's RSS. Time required to
>>> converge RAM migration and the size of snapshot image severely depend on the
>>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>>> creation time and huge image size.
>>>
>>> This series propose a way to solve the aforementioned problems. This is done
>>> by using different RAM migration mechanism based on UFFD write protection
>>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>>> guest RAM content using write-protection and iteratively release protection
>>> for memory ranges that have already been saved to the migration stream.
>>> At the same time we read in pending UFFD write fault events and save those
>>> pages out-of-order with higher priority.
>> Queued
>>
> Andrey:
>    I've fixed up some 32bit build casts in the pull.
> Please check them.
>
> Dave

Ok, sure.

Andrey

>>> How to use:
>>> 1. Enable write-tracking migration capability
>>>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability
>>>     background-snapshot on
>>>
>>> 2. Start the external migration to a file
>>>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>>>
>>> 3. Wait for the migration finish and check that the migration has completed.
>>> state.
>>>
>>>
>>> Changes v13->v14:
>>>
>>> * 1. Removed unneeded '#ifdef CONFIG_LINUX' from [PATCH 1/5] where #ifdef'ed
>>> *    code was originally introduced. In v13 removed #ifdef's appeared to be
>>> *    a diff in [PATCH 4/5] on top of previous patches.
>>>
>>> Changes v12->v13:
>>>
>>> * 1. Fixed codestyle problem for checkpatch.
>>>
>>> Changes v11->v12:
>>>
>>> * 1. Consolidated UFFD-related code under single #if defined(__linux__).
>>> * 2. Abandoned use of pre/post hooks in ram_find_and_save_block() in favour
>>> *    of more compact code fragment in ram_save_host_page().
>>> * 3. Refactored/simplified eBPF code in userfaultfd-wrlat.py script.
>>>
>>> Changes v10->v11:
>>>
>>> * 1. Updated commit messages.
>>>
>>> Changes v9->v10:
>>>
>>> * 1. Fixed commit message for [PATCH v9 1/5].
>>>
>>> Changes v8->v9:
>>>
>>> * 1. Fixed wrong cover letter subject.
>>>
>>> Changes v7->v8:
>>>
>>> * 1. Fixed coding style problems to pass checkpatch.
>>>
>>> Changes v6->v7:
>>>
>>> * 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
>>> *    before stopping VM to make runstate transition valid.
>>> * 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
>>> * 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.
>>>
>>> Changes v5->v6:
>>>
>>> * 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
>>> *    for write-tracking support level in migrate_query_write_tracking(), check
>>> *    each time when one tries to enable 'background-snapshot' capability.
>>>
>>> Changes v4->v5:
>>>
>>> * 1. Refactored util/userfaultfd.c code to support features required by postcopy.
>>> * 2. Introduced checks for host kernel and guest memory backend compatibility
>>> *    to 'background-snapshot' branch in migrate_caps_check().
>>> * 3. Switched to using trace_xxx instead of info_report()/error_report() for
>>> *    cases when error message must be hidden (probing UFFD-IO) or info may be
>>> *    really littering output if goes to stderr.
>>> * 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
>>> * 5. Added memory_region_ref() for each RAM block being wr-protected.
>>> * 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
>>> * 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
>>> * 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
>>> *    that choosen criteria for high-latency fault detection (i.e. timestamp of
>>> *    UFFD event fetch) is not representative enough for this task.
>>> *    At the moment it looks somehow like premature optimization effort.
>>> * 8. Dropped some unnecessary/unused code.
>>>
>>> Andrey Gruzdev (5):
>>>    migration: introduce 'background-snapshot' migration capability
>>>    migration: introduce UFFD-WP low-level interface helpers
>>>    migration: support UFFD write fault processing in ram_save_iterate()
>>>    migration: implementation of background snapshot thread
>>>    migration: introduce 'userfaultfd-wrlat.py' script
>>>
>>>   include/exec/memory.h        |   8 +
>>>   include/qemu/userfaultfd.h   |  35 ++++
>>>   migration/migration.c        | 357 ++++++++++++++++++++++++++++++++++-
>>>   migration/migration.h        |   4 +
>>>   migration/ram.c              | 303 ++++++++++++++++++++++++++++-
>>>   migration/ram.h              |   6 +
>>>   migration/savevm.c           |   1 -
>>>   migration/savevm.h           |   2 +
>>>   migration/trace-events       |   2 +
>>>   qapi/migration.json          |   7 +-
>>>   scripts/userfaultfd-wrlat.py | 122 ++++++++++++
>>>   util/meson.build             |   1 +
>>>   util/trace-events            |   9 +
>>>   util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
>>>   14 files changed, 1190 insertions(+), 12 deletions(-)
>>>   create mode 100644 include/qemu/userfaultfd.h
>>>   create mode 100755 scripts/userfaultfd-wrlat.py
>>>   create mode 100644 util/userfaultfd.c
>>>
>>> -- 
>>> 2.25.1
>>>
>>>
>> -- 
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------9B2CE4C7D3556AF32BC2D721
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04.02.2021 19:53, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204165320.GA4276@work-vm">
      <pre class="moz-quote-pre" wrap="">* Dr. David Alan Gilbert (<a class="moz-txt-link-abbreviated" href="mailto:dgilbert@redhat.com">dgilbert@redhat.com</a>) wrote:
</pre>
      <blockquote type="cite">
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
      <pre class="moz-quote-pre" wrap="">Andrey:
  I've fixed up some 32bit build casts in the pull.
Please check them.

Dave
</pre>
    </blockquote>
    <pre>Ok, sure.

Andrey

</pre>
    <blockquote type="cite" cite="mid:20210204165320.GA4276@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
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
        <pre class="moz-quote-pre" wrap="">-- 
Dr. David Alan Gilbert / <a class="moz-txt-link-abbreviated" href="mailto:dgilbert@redhat.com">dgilbert@redhat.com</a> / Manchester, UK


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

--------------9B2CE4C7D3556AF32BC2D721--

