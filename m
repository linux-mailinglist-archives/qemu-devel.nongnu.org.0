Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8D2C7B27
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:28:21 +0100 (CET)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTIy-0003im-GV
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjTI4-0003F1-NJ
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:27:24 -0500
Received: from mail-db8eur05on2130.outbound.protection.outlook.com
 ([40.107.20.130]:8160 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjTHz-0005yN-Cd
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:27:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HedY+9XtK8ptaYcms/1Eq3KCF37z1PX4aEn9DcsGIkykdudR4nzFHUGB2Ua7olg+jYV3WXcTi5zdSB7eygvmV49uaaFUfoj6axHGlx//UKOpgqo2CuaFDUwqqV6B2TICdXaMudSEX8O0p1BhIYndAXmLvD9H5mFJdtfOZq3DiKCgba5t9b84kp2xkejigYg0jGW02Tcwqh6LaaWP4Fz0ZRy4QkJu4WtrcloqrEqaRCVJVDj4aHEUpvf7v4VPjC+ddVNnL09/Vq15e6n8Wv6CimhaeLcBEILZZu9pptf6B4UFs0bGDBeGq9cB66nqr3BsGQBplZaXdc+PLXQFgBgsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heVVIGcqk1rG84tQH7FvPZKjuXiuuJJWnujraqqdOQQ=;
 b=AXKcJzHMt8iZEMhLmxMxgZ2yZZIUOCcvxYTHBYiLnPqvMrHXgevF/+/KChBzbD4cqVFGwRS3fYxm5DxvegSVPjXICVHVlGEbk47HlrynpKGse7SeULetlmHAFW3OVF+klAnyR2B+6yF/AnuKp5F9blZgEnlWohfNzgu2PIsEQf/OYOMPjsQNtSMDZvp5V7UupNMce02j0lUGOErYTO8mVxLv0kcwxhnWCusJvHE4XUizY3AqvwAuBamC2/hKO24KciU5fzLYtDIMEwc0DIdpEoSL1cbOUX1lWBgexuFjdv6QcgCYF0GJXl892YNPjw0Guh/PxY4+nu36oUnmxJgrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heVVIGcqk1rG84tQH7FvPZKjuXiuuJJWnujraqqdOQQ=;
 b=fldE6LUTg1GG0g4R0lN9ALFPKjhT9BuMv3yGHOKjmCWCv9nYO4Zwl2K5gLXHQfK+LTbR7AQrIG9qF3Wn8OVhYBGQ69rTmpHP4Q8MMvq005Lc86fa0FbCFj9tvWO8bmbp5b8h7VHiaupODiqOecnK9r9JatIx4cG/EalV+qQGVzM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3534.eurprd08.prod.outlook.com
 (2603:10a6:803:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Sun, 29 Nov
 2020 20:12:12 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Sun, 29 Nov
 2020 20:12:12 +0000
Subject: Re: [PATCH v4 2/6] introduce UFFD-WP low-level interface helpers
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
 <20201127210400.GF6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <bfd5afe2-3c4c-8c5b-a984-5c8bdc502a33@virtuozzo.com>
Date: Sun, 29 Nov 2020 23:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127210400.GF6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Sun, 29 Nov 2020 20:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 350dac9f-b932-413b-3ca3-08d894a30ec7
X-MS-TrafficTypeDiagnostic: VI1PR08MB3534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3534F724F62018CD5BE648119FF60@VI1PR08MB3534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pL2SEt/IC31jkqk6Dp6gjRpP1i3HIB0CxgspISz9Ndw6w55uTEUIWjiADvFTNHhS6rONRcRqc9Zq86aMZOEMW18tBydE1NFo+9YHFjxoQgYrK4/4hvip70/T+6BzEry1DNY+CxRJVvdf1kvze03lg9zEL1wEWd24cZ7OWvTXVBaStr3oVuKwn6so3K1AM+Q7xUBeRFEacow9+sAi8ho59zCEr+ldsenCO7xSQqhJLRe7d4Jg4E/X8CgOkPXkTwzTQrecDyxVNnPUAQfe5d+REplMQBNfxmgRGGpKf4WK8+PufQJv6TGfxTX6cxm/D5Rv4qmM+rUKb2BZafFtPg5wsEdoYFg40Ef/XzwgULxB/TT/5ug2T0GK4ucNDFNfh2nx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39830400003)(136003)(366004)(396003)(44832011)(83380400001)(36756003)(53546011)(86362001)(26005)(316002)(52116002)(54906003)(6916009)(16576012)(31696002)(66476007)(66556008)(478600001)(16526019)(8676002)(4326008)(2906002)(6486002)(956004)(5660300002)(30864003)(186003)(31686004)(2616005)(8936002)(66946007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1QrMzUrdFBIWUluOFplYXNHenNBVzRhOVFnVldKT1VsVEc3Q1hHbldBMGJO?=
 =?utf-8?B?bG50K1VzUTdMZDRhZ1pBbndETmJVNExxMGFaWnl5bjk0emJ2U2JIdzF0L0Nx?=
 =?utf-8?B?QTFKU2NlckUvTmhVZFdlVnRhUnRXVVVzZ3owQzFUWkx5MDZrdlpwZGhNTGZW?=
 =?utf-8?B?R0Nja0dmKzRoNEFFWDlleGJRelc1Zi8vMGV5WThKejhBMlpyRGwzSHFXSmpP?=
 =?utf-8?B?OWlUMlkzOU5jQm1GWmhGWVpYMmxNb2hWTndqZkR5TXBLYUdMenNaWWtYYml0?=
 =?utf-8?B?V0laZEZvS2p5NzFVcnQ1YlA2SUFHWVF3ckVualA5K2kxa1VzdjZ2U0g5YkRJ?=
 =?utf-8?B?ZmV0K0hPMCtvejRXNkZGR3lidTRZdVJ6cGdRSzUvZ2txNVlpYW1JcDZEYTc3?=
 =?utf-8?B?UmVVbkRWUlEybkdWTmZJeVhseHJ3KzJJazB2RDhLaDhKR3UrcGV6NjBXN2ZI?=
 =?utf-8?B?aUFvcDIyVnFtSC9hWVdUc0lETHFHT004SDFCNmxmbWRNcG5uUG83dzIrWEtn?=
 =?utf-8?B?dFc5WXY0aGdKUmdpSzV3R21IMVI2TEhldVcwNmdRRWNoTTZaY3RiK1NCMmlj?=
 =?utf-8?B?Y0ViSW9DVURQT2h1bndNUjdoV3REOCtJWVJsYjRsenRYbVI0QWpmYjhkT3Fz?=
 =?utf-8?B?VDQvZTRTN3VQSUlnRnJWbk0vSWhSUlFkNENiMDUzTUZNTENocVV2Qm9yeEdW?=
 =?utf-8?B?bVh6Y2x6U2wvSnpYZG5lZVRnTy9Oa2hHeWpEV2pDVitaRmErMEVVeS9LcHNl?=
 =?utf-8?B?d2VvOGxnRXFBRWR5eHpnSFdJNll3WVFVK2Rydlk2Vlo2azJNOWZFcWRlREJl?=
 =?utf-8?B?NXAwMjVXR2IvQWdBUXpnMUFHNEUrcmFxS3I2N25FYy9SMzRDVzRlTVREYXlG?=
 =?utf-8?B?MnBzSGJBc1kwNDJiL2JtRGYrUGZNSWljclVaSXBweVp6V1BoT0djQlJIeDF5?=
 =?utf-8?B?bm16ajNnaVpaRlZSWGNxcG5BR1RYUDZTUXZacEVzek1zbVI5NWk3ZDFlTGZm?=
 =?utf-8?B?c3E2cXdzRXo1dGNpM3JJdjk3ZVcrQitwdStmVW5MbGxFd1RibXBBbmVKNU9W?=
 =?utf-8?B?ODNpNmVmV1RyVklCWXR2NUVxS0RzMzFzc2Irbkx6QlVnRjNuM3NyeHNaMkV1?=
 =?utf-8?B?MytxVjU3RHhJUkU4TkY3aU91M2JMS3I2UkdiUytzVDRtRytSd3krckZMRzU5?=
 =?utf-8?B?OS9XT1pMOW9DMTFPcmx1OVNRV3VLeDJOL0ZNMTF5YzJxY09VSmJHSlVHbkJr?=
 =?utf-8?B?QXdoT1NLeU1pVjEyRkE0T3RlcG1kV25sb0lNK2hmNmZwWVpmN2Y4TnQzbytL?=
 =?utf-8?Q?0K1tPH+XzuLu4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350dac9f-b932-413b-3ca3-08d894a30ec7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2020 20:12:12.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iDRSCS68hGzb/R7ji2RJuHQS2JjTVU2pZYLACL6f+/L8Z1dlUNi8oy6ep5M05TRBugUBmW/nGxNnXIWWgFhwD4KfZYo7RIKum3KlcbiOcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3534
Received-SPF: pass client-ip=40.107.20.130;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

On 28.11.2020 00:04, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:30PM +0300, Andrey Gruzdev wrote:
>> Implemented support for the whole RAM block memory
>> protection/un-protection. Introduced higher level
>> ram_write_tracking_start() and ram_write_tracking_stop()
>> to start/stop tracking guest memory writes.
> 
> The whole patch looks good to me in general.  A few nitpickings below..
> 
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
> 
> (extra new line)
> 

Ok, see.

>> + */
>> +int ram_write_tracking_start(void)
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
> 
> May need a rcu_read_lock() here to guarantee safe access to
> RAMBLOCK_FOREACH_NOT_IGNORED.
> 

Yeah, really better to add RCU read lock here.

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
> 
> Is info_report() by default printed?  Change this into a tracepoint?  Please
> refer to functions named with trace_*().
> 

Agree, I'll change to tracepoints.

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
> 
> Accessing the global var seems an overkill to me.  I'd simply return an error,
> since iiuc if we gate the capability bit well, then these paths won't really
> trigger at all.  So it's just to pass the compilations.
> 

IMHO it's not too terrible, but really not needed, since won't be ever 
triggered. I'll remove error_setg() call.

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
> 
> Maybe too harsh - we can return if it's invalid.
> 
> Meanwhile, better rcu_read_lock(), as well?
> 

Yep, RCU lock, I'll add. Why too harsh? Just a debug assertion.
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
> 
> Use tracepoint?
> 

Yep.

>> +    }
>> +
>> +    /* Finally close UFFD file descriptor */
>> +    uffd_close_fd(rs->uffdio_fd);
>> +    rs->uffdio_fd = -1;
>> +#else
>> +    error_setg(&migrate_get_current()->error,
>> +            "Background-snapshot not supported on non-Linux hosts");
> 
> Ditto.
> 

Aha, the same.

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
>> +        return -1;
>> +    }
>> +
>> +    api_struct.api = UFFD_API;
>> +    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
> 
> This might be too strict if we want to reuse the codes with postcopy to run on
> old kernels that only supports missing.  Not a big problem for now; we can work
> on top.
> 

Aha, ok.

>> +    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
>> +        error_report("uffd_create_fd() failed: "
>> +                     "API version not supported version=%llx errno=%i",
>> +                api_struct.api, errno);
> 
> (A few strange alignments... won't complain but fixing would be even better)
> 

Mm, yes!

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
> 
> My understanding is that hwaddr is for guest physical address space.  Here
> I think either uint64_t or "void *" may suite better.
> 

Agree, uint64_t will be better here.

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
> 
> Same question on using hwaddr as above.
> 

Aha.

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
> 
> It may look strange if uffd_protect_memory() can also unprotect stuff...
> 
> Maybe rename it to uffd_change_protection()?
> 

Yes, this name is better.

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
> 
> Shall we spell "tmo" out?
> 
> Thanks,
> 

In the comment? I think it's ok.

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
> 


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

