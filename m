Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E692CAC71
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:36:26 +0100 (CET)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBRp-00054g-G9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkBNy-0002eu-LQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:32:27 -0500
Received: from mail-eopbgr150101.outbound.protection.outlook.com
 ([40.107.15.101]:4582 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkBNq-0007Uk-Pf
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:32:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqeCuprT5CB9Qylqw7JoTFKfYsloksjOuLiyjZ9c3nXjd4U1gBdpR7POB7m4gcJJolGLyigeRIs3RB+i4wKP6WKFovA/uINugDiBPbbk0+IfqREOr8gUGJ0jlTJN4vZh61hmYFGYo/95gGATqev1pzYFfC/UDyqPmoRplVpts59jwjC78HA5RcRYI2dnatw2ojkLTU9VOEa39nhgt86wYOakaDm6nK9LmxzGe6d4vcHOP6seyJrkIMJGt6HWzXwdE/Fgfw+88umiHAid3kkd4gBCekP8oAAoLMsyGb0DdYC8CSzILmpVNmBuKVlt2EMgjHyQPZCajkzOPzvDxeRuIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFXk5VL6/VR+N37P05uqBSp3ueXhWT3ovPWYufiKKk=;
 b=Nm1Rfi7AjYs+r8bxZKbIKgTimVmZI6rxWTAz6QrdEB3UHQ+ker+4CqvcjCeWcbYdyuub7oJn0D3THzDhl06VXpWV17Cs7nbE9sQgQ2ZKnsI68YkQrsmxI/UhePDbsoVzRr07yT609gG55NaHA/+CM11xW8tpNcvz7+GLFUB4EwTIMStIA9R0e08P2PXTiJAiPPt8SAjj81yMytU17zO6mvYJTc39P1iElWS39NSTnCN/a0T+8a0Bw2533Ezp3oN+tU8VeSzpL0/zyK48A8iQQK8ZP1m+b6/spHrQTEyGCWWKUTeicDl6gIYtrmlwE3c4pEI1h7kOIT9YMZSX0LbPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFXk5VL6/VR+N37P05uqBSp3ueXhWT3ovPWYufiKKk=;
 b=jDrYHhkiNZdu0EiTQR03cbn9GpFSJ6wEm6JKTDZ9ILsM9ogL3Bt2Pqv/NpYUh+e9XXzophTVo+L7lWrx7SrljjtS6/Fv8F+5Bxut3AXIDaZVQ5W4iWKR3FN5ABkr199ZMFfwQCs37+DVWSl/0+hl0gwhdcJ+u1LsYUwgPpU2Mk4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3680.eurprd08.prod.outlook.com
 (2603:10a6:803:79::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 1 Dec
 2020 19:32:15 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 19:32:15 +0000
Subject: Re: [PATCH v4 2/6] introduce UFFD-WP low-level interface helpers
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
 <20201201122417.GF4338@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <6d636bd9-6497-a0ca-ce1a-9498600e6ca8@virtuozzo.com>
Date: Tue, 1 Dec 2020 22:32:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201122417.GF4338@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0302CA0034.eurprd03.prod.outlook.com
 (2603:10a6:205:2::47) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0302CA0034.eurprd03.prod.outlook.com (2603:10a6:205:2::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Tue, 1 Dec 2020 19:32:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6bbc625-de89-41a5-ee17-08d8962fce93
X-MS-TrafficTypeDiagnostic: VI1PR08MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3680A85D8C35BAACDAC886A69FF40@VI1PR08MB3680.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVTs8tbvrQ1L5DPzTRLTazoxokcme7YnsnsQTYvCXEk4M2d9Q1iM9AhKvL1e4MOzJkGbp+ios9IYxCWs9+h2SJ4OUggMVsF+yKDRc8gCD3gjLm9rUB+nV/VPjxjj2pc4JeGmZo4bASJMsKD7pMWj4zMSA89wLaanCKgl9CmR+CVR2m9ZOlI0Zb58rs1LeLdX9NCy51S6F5gQs4DsIqnFxCZhfia/nVgXCh5BmYVMhjVbWB5tug4cj9G1njpLVWGw3MHUaht/S1sSE35ap5n/FkyRwod+8FTdfChS6KxXmiBzBgs+F22SQL3oROR1LKCYEJznITJ4lo/kiC9b3fcKlHaSw50ggfBWOUywZgICtkyGBvtrdmBlj5LRjAuZRgtH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(5660300002)(83380400001)(4326008)(31686004)(6916009)(36756003)(16576012)(8936002)(6486002)(316002)(54906003)(86362001)(16526019)(26005)(2616005)(186003)(44832011)(956004)(478600001)(52116002)(31696002)(8676002)(53546011)(66946007)(66556008)(66476007)(2906002)(30864003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkZ2RTJsZmxYNTJXcjJYWFB1V0lyem9vL3JsbGhpSGpkeWg4RGN6d1dqWFRi?=
 =?utf-8?B?bmNRc3VFNWtOQnJuNmVyOGVvaEl4MjNhYXNsajd4bTBXY2dEQUtwd2Fib0Jx?=
 =?utf-8?B?bE0yelZLQVVhL01OQTZ1cVdMUzNYMnVVVDZUeUQybVBjcHdwdFBXcHNRZnBw?=
 =?utf-8?B?b0ZJYTdjb3I5R3NiRTlRZi9QMTdyb3dWclB4Y2F5TllHUFh5L1lER21OVTJx?=
 =?utf-8?B?aEZmWVk2K3NDU2t2Uy9KOWlMWXhPakt2YW1oVlF5eWM5YnB0TStSbEVLWlhh?=
 =?utf-8?B?WEJxVjVPZFRPZ2piZ2VSNFcwUEMxOC8xMFFoclpWSWtqR29td3diVHZ5Ty83?=
 =?utf-8?B?R1R4SEQ2LzlFWURZLzJ4VjFUVUFDallvSXZQMDkwdW5teVdWNVdyTlpTVXU0?=
 =?utf-8?B?THNRNVR4cjRMWUx3RnhUY1ZzQVRONURCWTRjeG4rZDVBTy9zN0FGN3ZRaGQx?=
 =?utf-8?B?UGFBTXU3VlhuOEtzR1p4U0FlQlU4TUQ4RDZkY1FzUzNzUEZrUHRQL1FrbFFQ?=
 =?utf-8?B?Q00vNFh2RmFZOVhvbmpoSHdFSmpINnZUS0FSZkQ2NWFhUldlcGxVOXRoSXRR?=
 =?utf-8?B?MmlnUHhlRm92bVh2c0gxaHI4dVJ6ZXo5KytsWjQ0VS92Z2VDaVkvSXVYbjl4?=
 =?utf-8?B?UDkzOEFWKzNYSzBRNWNEVlpMa1pSN0xKaWxkSlRMTHF1QmV1MG5Sd21Pc0lX?=
 =?utf-8?B?MjBHTS9CaWhhbUpSRlVRVTd4VTh4dllMdDhHTTlxRXJ5c0pMUUhjZDBrWGMz?=
 =?utf-8?B?SXZJOXRZNzQ4R0hsTCtQVjZvY1NaYm8xb3d5VzN4cko5TExLWXVPbWYzN2pM?=
 =?utf-8?B?L0p3QXRnQTE1WE5LcDlVbUhhWE5ZOXVmVlJLMVdkR3dnSlJwUG9XdnV5ZEJN?=
 =?utf-8?B?REJvUi9NeXppbzlCQ3RBaS9aZjlJWWZsN0RqRDBFZmJ0NDJGdGViWnMrL3NU?=
 =?utf-8?B?VXpTN1cxMEpwTHRyNGRKdEJOUzltSWFKTVhVVVR4K0tZMWc5ZXAxNzBxenRE?=
 =?utf-8?B?a0J6N0pIOTMxektrVWFGTkRhNVpHUlBIMjZaZWRIM2hlWWRNK1FaMzdacUI5?=
 =?utf-8?B?VTljVUZmS084ME4wOEszVkRyalNIOUFScXpxMTg2Y2Jia3A4V1R3QnRqdzQ4?=
 =?utf-8?B?Q3RGbG1QN0V2aGIyb05FVXVLOUFCcVpuQ3Z1MnMzRFllN01hbkswZ1dwa3dt?=
 =?utf-8?B?bTRtaWovdFVEVGZ1SGMzL1V2WGRyaGZnelFUUmgrT0E0K04yamtPUGUrTi9E?=
 =?utf-8?B?QUtjZGdTT3BocUJRcER4YU5vV2kySTlaTjF2eFFBR0tMOUdRQUJuaWRuVGpF?=
 =?utf-8?Q?ezqGwKXxqWcbk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bbc625-de89-41a5-ee17-08d8962fce93
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 19:32:14.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qdrhWjN9osgZOsWtOQKmgPWha2Y0ZVn8SnYUWw1iDN9cy2XyJLDG9j6LFZ/rkUeW5JZ6cujsEYt8fTscej0AwQFVhiIwuBebZJxzNiZhBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3680
Received-SPF: pass client-ip=40.107.15.101;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 01.12.2020 15:24, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> Implemented support for the whole RAM block memory
>> protection/un-protection. Introduced higher level
>> ram_write_tracking_start() and ram_write_tracking_stop()
>> to start/stop tracking guest memory writes.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   include/exec/memory.h      |   7 ++
>>   include/qemu/userfaultfd.h |  29 +++++
>>   migration/ram.c            | 120 +++++++++++++++++++++
>>   migration/ram.h            |   4 +
>>   util/meson.build           |   1 +
>>   util/userfaultfd.c         | 215 +++++++++++++++++++++++++++++++++++++
>>   6 files changed, 376 insertions(+)
>>   create mode 100644 include/qemu/userfaultfd.h
>>   create mode 100644 util/userfaultfd.c
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 0f3e6bcd5e..3d798fce16 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -139,6 +139,13 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>>   /* RAM is a persistent kind memory */
>>   #define RAM_PMEM (1 << 5)
>>   
>> +/*
>> + * UFFDIO_WRITEPROTECT is used on this RAMBlock to
>> + * support 'write-tracking' migration type.
>> + * Implies ram_state->ram_wt_enabled.
>> + */
>> +#define RAM_UF_WRITEPROTECT (1 << 6)
>> +
>>   static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>>                                          IOMMUNotifierFlag flags,
>>                                          hwaddr start, hwaddr end,
>> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
>> new file mode 100644
>> index 0000000000..fb843c76db
>> --- /dev/null
>> +++ b/include/qemu/userfaultfd.h
>> @@ -0,0 +1,29 @@
>> +/*
>> + * Linux UFFD-WP support
>> + *
>> + * Copyright Virtuozzo GmbH, 2020
>> + *
>> + * Authors:
>> + *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> + * later.  See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef USERFAULTFD_H
>> +#define USERFAULTFD_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "exec/hwaddr.h"
>> +#include <linux/userfaultfd.h>
>> +
>> +int uffd_create_fd(void);
>> +void uffd_close_fd(int uffd);
>> +int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
>> +        bool track_missing, bool track_wp);
>> +int uffd_unregister_memory(int uffd, hwaddr start, hwaddr length);
>> +int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp);
>> +int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
>> +bool uffd_poll_events(int uffd, int tmo);
>> +
>> +#endif /* USERFAULTFD_H */
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 7811cde643..3adfd1948d 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -56,6 +56,11 @@
>>   #include "savevm.h"
>>   #include "qemu/iov.h"
>>   #include "multifd.h"
>> +#include "sysemu/runstate.h"
>> +
>> +#ifdef CONFIG_LINUX
>> +#include "qemu/userfaultfd.h"
>> +#endif
>>   
>>   /***********************************************************/
>>   /* ram save/restore */
>> @@ -298,6 +303,8 @@ struct RAMSrcPageRequest {
>>   struct RAMState {
>>       /* QEMUFile used for this migration */
>>       QEMUFile *f;
>> +    /* UFFD file descriptor, used in 'write-tracking' migration */
>> +    int uffdio_fd;
>>       /* Last block that we have visited searching for dirty pages */
>>       RAMBlock *last_seen_block;
>>       /* Last block from where we have sent data */
>> @@ -3788,6 +3795,119 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>>       return 0;
>>   }
>>   
>> +/*
>> + * ram_write_tracking_start: start UFFD-WP memory tracking
>> + *
>> + * Returns 0 for success or negative value in case of error
>> + *
>> + */
>> +int ram_write_tracking_start(void)
> 
> Please split this stuff off into a separate patch; just make this one
> the userfaultfd.[ch] and then a separate one for gluing it into ram.c
> 

Yep, I'm separating it now - userfaultdf.c and ram_write_tracking stuff, 
they go to different patches.

>> +{
>> +#ifdef CONFIG_LINUX
>> +    int uffd;
>> +    RAMState *rs = ram_state;
>> +    RAMBlock *bs;
>> +
>> +    /* Open UFFD file descriptor */
>> +    uffd = uffd_create_fd();
>> +    if (uffd < 0) {
>> +        return uffd;
>> +    }
>> +    rs->uffdio_fd = uffd;
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        /* Nothing to do with read-only and MMIO-writable regions */
>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>> +            continue;
>> +        }
>> +
>> +        bs->flags |= RAM_UF_WRITEPROTECT;
>> +        /* Register block memory with UFFD to track writes */
>> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
>> +                bs->max_length, false, true)) {
>> +            goto fail;
>> +        }
>> +        /* Apply UFFD write protection to the block memory range */
>> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
>> +                bs->max_length, true)) {
>> +            goto fail;
>> +        }
>> +
>> +        info_report("UFFD-WP write-tracking enabled: "
>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>> +    }
>> +
>> +    return 0;
>> +
>> +fail:
>> +    error_report("ram_write_tracking_start() failed: restoring initial memory state");
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
>> +            continue;
>> +        }
>> +        /*
>> +         * In case some memory block failed to be write-protected
>> +         * remove protection and unregister all succeeded RAM blocks
>> +         */
>> +        uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length, false);
>> +        uffd_unregister_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length);
>> +        /* Cleanup flags */
>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>> +    }
>> +
>> +    uffd_close_fd(uffd);
>> +    rs->uffdio_fd = -1;
>> +    return -1;
>> +#else
>> +    rs->uffdio_fd = -1;
>> +    error_setg(&migrate_get_current()->error,
>> +            "Background-snapshot not supported on non-Linux hosts");
>> +    return -1;
>> +#endif /* CONFIG_LINUX */
>> +}
>> +
>> +/**
>> + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
>> + */
>> +void ram_write_tracking_stop(void)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    RAMState *rs = ram_state;
>> +    RAMBlock *bs;
>> +    assert(rs->uffdio_fd >= 0);
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
>> +            continue;
>> +        }
>> +        /* Remove protection and unregister all affected RAM blocks */
>> +        uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length, false);
>> +        uffd_unregister_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length);
>> +        /* Cleanup flags */
>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>> +
>> +        info_report("UFFD-WP write-tracking disabled: "
>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>> +    }
>> +
>> +    /* Finally close UFFD file descriptor */
>> +    uffd_close_fd(rs->uffdio_fd);
>> +    rs->uffdio_fd = -1;
>> +#else
>> +    error_setg(&migrate_get_current()->error,
>> +            "Background-snapshot not supported on non-Linux hosts");
>> +#endif /* CONFIG_LINUX */
>> +}
>> +
>>   static SaveVMHandlers savevm_ram_handlers = {
>>       .save_setup = ram_save_setup,
>>       .save_live_iterate = ram_save_iterate,
>> diff --git a/migration/ram.h b/migration/ram.h
>> index 011e85414e..0ec63e27ee 100644
>> --- a/migration/ram.h
>> +++ b/migration/ram.h
>> @@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
>>   void colo_release_ram_cache(void);
>>   void colo_incoming_start_dirty_log(void);
>>   
>> +/* Background snapshots */
>> +int ram_write_tracking_start(void);
>> +void ram_write_tracking_stop(void);
>> +
>>   #endif
>> diff --git a/util/meson.build b/util/meson.build
>> index f359af0d46..c64bfe94b3 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -50,6 +50,7 @@ endif
>>   
>>   if have_system
>>     util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
>> +  util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>>   endif
>>   
>>   if have_block
>> diff --git a/util/userfaultfd.c b/util/userfaultfd.c
>> new file mode 100644
>> index 0000000000..038953d7ed
>> --- /dev/null
>> +++ b/util/userfaultfd.c
>> @@ -0,0 +1,215 @@
>> +/*
>> + * Linux UFFD-WP support
>> + *
>> + * Copyright Virtuozzo GmbH, 2020
>> + *
>> + * Authors:
>> + *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> + * later.  See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/bitops.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/userfaultfd.h"
>> +#include <poll.h>
>> +#include <sys/syscall.h>
>> +#include <sys/ioctl.h>
>> +
>> +/**
>> + * uffd_create_fd: create UFFD file descriptor
>> + *
>> + * Returns non-negative file descriptor or negative value in case of an error
>> + */
>> +int uffd_create_fd(void)
>> +{
>> +    int uffd;
>> +    struct uffdio_api api_struct;
>> +    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
>> +
>> +    uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>> +    if (uffd < 0) {
>> +        error_report("uffd_create_fd() failed: UFFD not supported");
> 
> Please include the errno (or strerror(errno))
> 

Ok.

>> +        return -1;
>> +    }
>> +
>> +    api_struct.api = UFFD_API;
>> +    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
>> +    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
>> +        error_report("uffd_create_fd() failed: "
>> +                     "API version not supported version=%llx errno=%i",
>> +                api_struct.api, errno);
>> +        goto fail;
>> +    }
>> +
>> +    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
>> +        error_report("uffd_create_fd() failed: "
>> +                     "PAGEFAULT_FLAG_WP feature missing");
>> +        goto fail;
>> +    }
>> +
>> +    return uffd;
>> +
>> +fail:
>> +    close(uffd);
>> +    return -1;
>> +}
> 
> It would be great if we could find a way to share this with
> migration/postcopy-ram.c - this duplicates a lor of
> request_ufd_features.
> 

Now I'm changing userfaultfd.c glue code to support also the postcopy 
requirenments - adding functionality to query UFFD feature support, glue 
for COPY_PAGE/ZERO_PAGE IOCTLs etc.

>> +
>> +/**
>> + * uffd_close_fd: close UFFD file descriptor
>> + *
>> + * @uffd: UFFD file descriptor
>> + */
>> +void uffd_close_fd(int uffd)
>> +{
>> +    assert(uffd >= 0);
>> +    close(uffd);
>> +}
>> +
>> +/**
>> + * uffd_register_memory: register memory range with UFFD
>> + *
>> + * Returns 0 in case of success, negative value on error
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @start: starting virtual address of memory range
>> + * @length: length of memory range
>> + * @track_missing: generate events on missing-page faults
>> + * @track_wp: generate events on write-protected-page faults
>> + */
>> +int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
>> +        bool track_missing, bool track_wp)
>> +{
>> +    struct uffdio_register uffd_register;
>> +
>> +    uffd_register.range.start = start;
>> +    uffd_register.range.len = length;
>> +    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
>> +                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
>> +
>> +    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
>> +        error_report("uffd_register_memory() failed: "
>> +                     "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> 
> PRIx64 for mode as well.
> 

Ok.

>> +                start, length, uffd_register.mode, errno);
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * uffd_unregister_memory: un-register memory range with UFFD
>> + *
>> + * Returns 0 in case of success, negative value on error
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @start: starting virtual address of memory range
>> + * @length: length of memory range
>> + */
>> +int uffd_unregister_memory(int uffd, hwaddr start, hwaddr length)
>> +{
>> +    struct uffdio_range uffd_range;
>> +
>> +    uffd_range.start = start;
>> +    uffd_range.len = length;
>> +
>> +    if (ioctl(uffd, UFFDIO_UNREGISTER, &uffd_range)) {
>> +        error_report("uffd_unregister_memory() failed: "
>> +                     "start=%0"PRIx64" len=%"PRIu64" errno=%i",
>> +                start, length, errno);
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * uffd_protect_memory: protect/unprotect memory range for writes with UFFD
>> + *
>> + * Returns 0 on success or negative value in case of error
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @start: starting virtual address of memory range
>> + * @length: length of memory range
>> + * @wp: write-protect/unprotect
>> + */
>> +int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
>> +{
>> +    struct uffdio_writeprotect uffd_writeprotect;
>> +    int res;
>> +
>> +    uffd_writeprotect.range.start = start;
>> +    uffd_writeprotect.range.len = length;
>> +    uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
>> +
>> +    do {
>> +        res = ioctl(uffd, UFFDIO_WRITEPROTECT, &uffd_writeprotect);
>> +    } while (res < 0 && errno == EINTR);
>> +    if (res < 0) {
>> +        error_report("uffd_protect_memory() failed: "
>> +                     "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
>> +                start, length, uffd_writeprotect.mode, errno);
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * uffd_read_events: read pending UFFD events
>> + *
>> + * Returns number of fetched messages, 0 if non is available or
>> + * negative value in case of an error
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @msgs: pointer to message buffer
>> + * @count: number of messages that can fit in the buffer
>> + */
>> +int uffd_read_events(int uffd, struct uffd_msg *msgs, int count)
>> +{
>> +    ssize_t res;
>> +    do {
>> +        res = read(uffd, msgs, count * sizeof(struct uffd_msg));
>> +    } while (res < 0 && errno == EINTR);
>> +
>> +    if ((res < 0 && errno == EAGAIN)) {
>> +        return 0;
>> +    }
>> +    if (res < 0) {
>> +        error_report("uffd_read_events() failed: errno=%i", errno);
>> +        return -1;
>> +    }
>> +
>> +    return (int) (res / sizeof(struct uffd_msg));
>> +}
>> +
>> +/**
>> + * uffd_poll_events: poll UFFD file descriptor for read
>> + *
>> + * Returns true if events are available for read, false otherwise
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
>> + *       negative value for infinite wait
>> + */
>> +bool uffd_poll_events(int uffd, int tmo)
>> +{
>> +    int res;
>> +    struct pollfd poll_fd = { .fd = uffd, .events = POLLIN, .revents = 0 };
>> +
>> +    do {
>> +        res = poll(&poll_fd, 1, tmo);
>> +    } while (res < 0 && errno == EINTR);
>> +
>> +    if (res == 0) {
>> +        return false;
>> +    }
>> +    if (res < 0) {
>> +        error_report("uffd_poll_events() failed: errno=%i", errno);
>> +        return false;
>> +    }
>> +
>> +    return (poll_fd.revents & POLLIN) != 0;
>> +}
>> -- 
>> 2.25.1
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

