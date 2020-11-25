Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FE2C481D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:19:02 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki0Jh-00063K-Rj
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1ki0I0-0005W6-59
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:17:16 -0500
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:28642 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1ki0Hx-0000Rx-Hv
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:17:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHuyuK88am4+kNLFffUXOftL7MolOlk2legUeCrpde0heQqAiP8RBUB8c+U9w3pRGV3oX64qkda2mO5dRA8Wk/3Q2o56wE+7a3+RLdbhbmDgV/OtQxmFZEqj/UgYwAqG8b5adN/E1KGSKLIgknMpEDvsHWGZ+E4ibS4mUmzNIY6/xDZtq+d/Y8QTuArXkDjqVETymtUtw5EQ1y8V1d01h/Z089fWU+SjGEknP0OF2l3LaenhfE3Uga206KWPdUl8kdQXnPQneq/vjetrxw/PCIj8/38AXnGH+EAAC+KIQUA1TAipmhqw5UHYmQXx37Hnfg0ooJaJ9FV48XwnjLjwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0vzAwPq5+xD3dj+2p8UTJMc3k3Yqy7N7Dx2Qp0JUoA=;
 b=WAg2bV0zOZQiMRHhw0TPVUZBJP5whftAiYAfERrJq3k7SdsIqQmCsm3L77jF8QT0Fc+r2nLP2Z7FxaJkVof8rLvtirOTeFo4JeDsTNpKwUQyzRr5C0WGmWSJRmIxJ/R7biyrSqKLCR3srKLQO+1lo/89UPL+IUY/OCwzMYUqTmOxBCerzHaFtol4R28uPx8yTYvQ6MRn7LfQ10YXHEVYIfTdBF0kZllb4UjnDK5shWUbQE/tXtNwW9oFLjxijKy3LjvV6TeRz5aXMFjudjtx39gD/jM+VugFM/9w2+Y3XZXzp8JXKg+t3CvCHei8MpgPeaWIHecCBPfqpQBj9jAM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0vzAwPq5+xD3dj+2p8UTJMc3k3Yqy7N7Dx2Qp0JUoA=;
 b=jqark0FrNVC09ju9taRmMlw1LP+ABU5NHy6Jq7NbFJXSax+FvHYzeoK1CZbOOGqTJtdlCveWDsnVjtKNvb+jwRjNgLd42UZ8J1r2vRGloluFZ3OYCvR4uwzQYQerSCKiUccvErYVGMg0j83PYnhEhfhp+yEos3iKsQgG0NCIOLc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0801MB1741.eurprd08.prod.outlook.com
 (2603:10a6:800:5a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 19:17:04 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 19:17:04 +0000
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
 <20201124175712.GM3366@work-vm>
 <24483c0d-107f-427e-87b1-f4e039bfe486@virtuozzo.com>
 <20201125184307.GJ3222@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <dcbe822a-83fd-bdac-5a8c-27450eeba357@virtuozzo.com>
Date: Wed, 25 Nov 2020 22:17:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125184307.GJ3222@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::19) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 19:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9070f15b-ba7b-4ef3-fa25-08d89176b167
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB174196C1D4DD46F1B94F95F49FFA0@VI1PR0801MB1741.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YeLj/1Bd+42wmcv9zSfKR0fKaPxL0sfzYLtUmRupbkk3QSrxNuwjKTWNaF5rwKRKM25521uaoCJr9Zs26VZu+HDal3E78bv8Bh83sBT0fPbU4HUMzkqyRhKk+tFuHtRwB1ROYDMI4igFc8B7eb9kPAN3+fdtYl9wmDto7FShVF7H6tYBGg6Q73Bu7aXFSpvjb79uld9LcRW+tmLBXKH5sYyge/svdDmyayC/MlxuhvBT/oKzhDulsdfxQktpFmyL5XRwMiapki592r9I5YR2vncWFIKhawTT0n1BR0yNB2QwH9/G5jUNRGRypPcQG42VWlHuTREo9H8yOHQDaGJEo8Y/y0Oam0HDp/LYEyrAL46bP/5ue8x17YZtV8N7J+o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(4326008)(5660300002)(83380400001)(66476007)(36756003)(316002)(66556008)(53546011)(956004)(8676002)(66946007)(16526019)(186003)(54906003)(16576012)(86362001)(30864003)(6486002)(26005)(31686004)(52116002)(8936002)(2906002)(6916009)(31696002)(478600001)(44832011)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1FOWHByUnphaFZQdjJEYTZlellxeUMwQmJpWGJVOWFnMGV5c0dWTEQxSjV5?=
 =?utf-8?B?UDJiRzhqUzFBSjdMVGkvLzdiTVRwT1lxQmRFcUtYQkJGYkNRQTVxYUhaMHVR?=
 =?utf-8?B?YUlJOVhuMkVMQ093alh4SDFqa0NnblZMeWdYSXJ3T3BydnNqdFcxN3k3dVRP?=
 =?utf-8?B?R1JGT1dEdmF6OGhDSC9NSExtc1VTcDVrQy9CQlNEQjlpT2lFVWhCQm16cHBY?=
 =?utf-8?B?Mm1aNzJkRmFZblJGSG5heFRrdnlLVlRoU2tXOTZrSFRVM29IOWMxdlRscU91?=
 =?utf-8?B?SXZXSk1OQ0x0Y2ZVN0xFWHhtRW53MHhwdy9rS2pmWDRPUUdva1VDajJJb0tD?=
 =?utf-8?B?ZlRhQkZyQkIzbkZCbWwyTFU4d1Q1R20yYzR2RWRhYXNzdHdVV0ppSTN1ZDY3?=
 =?utf-8?B?YW4yQ081L2ZpdGVyWE5qdzRVbDlTWC9VTThjdkN0SDk5TmNDdi9rQXJwMGpj?=
 =?utf-8?B?eEZMRXdYdkNkQWgvalFXZkRHNFYvMi9Ua2RxaklTTHY3ZzVvcTNEejU3bDZw?=
 =?utf-8?B?UzJyK2orMTQvSVRzUS9JemhvYTZQRkx6aURHU2lFdENtSTF4dkVaUTE4N0Vr?=
 =?utf-8?B?S2kwRTB4b3NxN0tWSzdQMTkrSzhMREl1aFFCVjI2YVhsUko4L1V4RStqTVpQ?=
 =?utf-8?B?eVhlMjZUMHQ3Nyszd28rTEtpRGQ1RnhpUWVUbnhMYkY3U2NWdXhuYnpNNE81?=
 =?utf-8?B?S2d4SWZld1JubFc2UzlXNVRNTmFWRmw3bTM3OFlDUDBLckVINWZhQkVNUytC?=
 =?utf-8?B?eC9ram5wYmRTbDhxVXM4YzNRYkpNdlIzUzlvNlF5THc0dVd3QXA2V2wyVk1i?=
 =?utf-8?B?T0RYcHYvVXhDY2E5U0NYZWNOTnpDMHBuZmsyc3IzWHZnczNBdVh6U0pmQk5Z?=
 =?utf-8?B?K1JxbGZSUmZpUnF1RGQxVTA0VzhtZFdiZEJYeU1jTnJMV2IzaEhRclNwUVBF?=
 =?utf-8?B?YmFmUW4zVS9OUUNpYkFaUThBSzNPMmFjK2M3NmNRL2krL1JIcWRad2Y3ZFN2?=
 =?utf-8?B?TkNUSTJLVDNpYTJQVEpNSytNRlhXQ3IxNEphbHlOU3pVdmVRdTRURFRGWEFn?=
 =?utf-8?B?T1VGZ3JJNFBxQi9jTzJsb2R6cHlleS9ZdzZ2UWE0OGtzbHl0RUJEZkxTMXZ5?=
 =?utf-8?B?UUhkR0VCVXpUQ2JlVFRlTElCeGtqODJZQU5jZkZCdmJqWHlGZkRpRDFocFBi?=
 =?utf-8?B?ajFMOU85SEJDUkp4QkpnMHZoNzJGNUF2UDFkczEwYlF2TXc2UG8wbFFYQXZB?=
 =?utf-8?B?ZExSUEkwTmRtOWlEMUJTMDJFZEVUUW5OdUJ3WURYZ1VnSkozQlVlNGJxQ1F0?=
 =?utf-8?Q?+RawOTBjsqBvK6lRoldVFlKkTP3sy7EfMu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9070f15b-ba7b-4ef3-fa25-08d89176b167
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 19:17:04.4363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oxIDDeRVoK5EYKe/xdjqMwbne2jSq6gDSegRewRf0kj+OkJ1A4/UAMJVg3116RTX9nQplZzBtbgpo+Z9yLepEL/55Z3N/uXBuC8qTMNpao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1741
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.11.2020 21:43, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 24.11.2020 20:57, Dr. David Alan Gilbert wrote:
>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>> Implemented support for the whole RAM block memory
>>>> protection/un-protection. Introduced higher level
>>>> ram_write_tracking_start() and ram_write_tracking_stop()
>>>> to start/stop tracking guest memory writes.
>>>>
>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>> ---
>>>>    include/exec/memory.h |   7 ++
>>>>    migration/ram.c       | 267 ++++++++++++++++++++++++++++++++++++++++++
>>>>    migration/ram.h       |   4 +
>>>>    3 files changed, 278 insertions(+)
>>>>
>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>> index 0f3e6bcd5e..3d798fce16 100644
>>>> --- a/include/exec/memory.h
>>>> +++ b/include/exec/memory.h
>>>> @@ -139,6 +139,13 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>>>>    /* RAM is a persistent kind memory */
>>>>    #define RAM_PMEM (1 << 5)
>>>> +/*
>>>> + * UFFDIO_WRITEPROTECT is used on this RAMBlock to
>>>> + * support 'write-tracking' migration type.
>>>> + * Implies ram_state->ram_wt_enabled.
>>>> + */
>>>> +#define RAM_UF_WRITEPROTECT (1 << 6)
>>>> +
>>>>    static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>>>>                                           IOMMUNotifierFlag flags,
>>>>                                           hwaddr start, hwaddr end,
>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>> index 7811cde643..7f273c9996 100644
>>>> --- a/migration/ram.c
>>>> +++ b/migration/ram.c
>>>> @@ -56,6 +56,12 @@
>>>>    #include "savevm.h"
>>>>    #include "qemu/iov.h"
>>>>    #include "multifd.h"
>>>> +#include <inttypes.h>
>>>> +#include <poll.h>
>>>> +#include <sys/syscall.h>
>>>> +#include <sys/ioctl.h>
>>>> +#include <linux/userfaultfd.h>
>>>> +#include "sysemu/runstate.h"
>>>>    /***********************************************************/
>>>>    /* ram save/restore */
>>>> @@ -298,6 +304,8 @@ struct RAMSrcPageRequest {
>>>>    struct RAMState {
>>>>        /* QEMUFile used for this migration */
>>>>        QEMUFile *f;
>>>> +    /* UFFD file descriptor, used in 'write-tracking' migration */
>>>> +    int uffdio_fd;
>>>>        /* Last block that we have visited searching for dirty pages */
>>>>        RAMBlock *last_seen_block;
>>>>        /* Last block from where we have sent data */
>>>> @@ -453,6 +461,181 @@ static QemuThread *decompress_threads;
>>>>    static QemuMutex decomp_done_lock;
>>>>    static QemuCond decomp_done_cond;
>>>> +/**
>>>> + * uffd_create_fd: create UFFD file descriptor
>>>> + *
>>>> + * Returns non-negative file descriptor or negative value in case of an error
>>>> + */
>>>> +static int uffd_create_fd(void)
>>>> +{
>>>> +    int uffd;
>>>> +    struct uffdio_api api_struct;
>>>> +    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
>>>
>>> You need to be a bit careful about doing this in migration/ram.c - it's
>>> generic code; at minimum it needs ifdef'ing for Linux.
>>>
>>
>> Yes, it's totally linux-specific, I think better to move this code out of
>> migration/ram.c, as Peter proposed.
>>
>>>> +    uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>>>> +    if (uffd < 0) {
>>>> +        error_report("uffd_create_fd() failed: UFFD not supported");
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    api_struct.api = UFFD_API;
>>>> +    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
>>>> +    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
>>>> +        error_report("uffd_create_fd() failed: "
>>>> +                "API version not supported version=%llx errno=%i",
>>>> +                api_struct.api, errno);
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
>>>> +        error_report("uffd_create_fd() failed: "
>>>> +                "PAGEFAULT_FLAG_WP feature missing");
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    return uffd;
>>>
>>> Should we be putting that somewher that we can share with postcopy?
>>>
>>
>> Sure, maybe to util/uffd-wp.c + include/qemu/uffd-wp.h.
>> What do you think?
> 
> Or how about a userfaultfd.c somewhere?
> 
> Dave
> 

For userfaultfd.c I'm also ok.

Andrey

>>>> +fail:
>>>> +    close(uffd);
>>>> +    return -1;
>>>> +}
>>>> +
>>>> +/**
>>>> + * uffd_close_fd: close UFFD file descriptor
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + */
>>>> +static void uffd_close_fd(int uffd)
>>>> +{
>>>> +    assert(uffd >= 0);
>>>> +    close(uffd);
>>>> +}
>>>> +
>>>> +/**
>>>> + * uffd_register_memory: register memory range with UFFD
>>>> + *
>>>> + * Returns 0 in case of success, negative value on error
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + * @start: starting virtual address of memory range
>>>> + * @length: length of memory range
>>>> + * @track_missing: generate events on missing-page faults
>>>> + * @track_wp: generate events on write-protected-page faults
>>>> + */
>>>> +static int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
>>>> +        bool track_missing, bool track_wp)
>>>> +{
>>>> +    struct uffdio_register uffd_register;
>>>> +
>>>> +    uffd_register.range.start = start;
>>>> +    uffd_register.range.len = length;
>>>> +    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
>>>> +                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
>>>> +
>>>> +    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
>>>> +        error_report("uffd_register_memory() failed: "
>>>> +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
>>>> +                start, length, uffd_register.mode, errno);
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * uffd_protect_memory: protect/unprotect memory range for writes with UFFD
>>>> + *
>>>> + * Returns 0 on success or negative value in case of error
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + * @start: starting virtual address of memory range
>>>> + * @length: length of memory range
>>>> + * @wp: write-protect/unprotect
>>>> + */
>>>> +static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
>>>> +{
>>>> +    struct uffdio_writeprotect uffd_writeprotect;
>>>> +    int res;
>>>> +
>>>> +    uffd_writeprotect.range.start = start;
>>>> +    uffd_writeprotect.range.len = length;
>>>> +    uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
>>>> +
>>>> +    do {
>>>> +        res = ioctl(uffd, UFFDIO_WRITEPROTECT, &uffd_writeprotect);
>>>> +    } while (res < 0 && errno == EINTR);
>>>> +    if (res < 0) {
>>>> +        error_report("uffd_protect_memory() failed: "
>>>> +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
>>>> +                start, length, uffd_writeprotect.mode, errno);
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +__attribute__ ((unused))
>>>> +static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
>>>> +__attribute__ ((unused))
>>>> +static bool uffd_poll_events(int uffd, int tmo);
>>>> +
>>>> +/**
>>>> + * uffd_read_events: read pending UFFD events
>>>> + *
>>>> + * Returns number of fetched messages, 0 if non is available or
>>>> + * negative value in case of an error
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + * @msgs: pointer to message buffer
>>>> + * @count: number of messages that can fit in the buffer
>>>> + */
>>>> +static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count)
>>>> +{
>>>> +    ssize_t res;
>>>> +    do {
>>>> +        res = read(uffd, msgs, count * sizeof(struct uffd_msg));
>>>> +    } while (res < 0 && errno == EINTR);
>>>> +
>>>> +    if ((res < 0 && errno == EAGAIN)) {
>>>> +        return 0;
>>>> +    }
>>>> +    if (res < 0) {
>>>> +        error_report("uffd_read_events() failed: errno=%i", errno);
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return (int) (res / sizeof(struct uffd_msg));
>>>> +}
>>>> +
>>>> +/**
>>>> + * uffd_poll_events: poll UFFD file descriptor for read
>>>> + *
>>>> + * Returns true if events are available for read, false otherwise
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
>>>> + *       negative value for infinite wait
>>>> + */
>>>> +static bool uffd_poll_events(int uffd, int tmo)
>>>> +{
>>>> +    int res;
>>>> +    struct pollfd poll_fd = { .fd = uffd, .events = POLLIN, .revents = 0 };
>>>> +
>>>> +    do {
>>>> +        res = poll(&poll_fd, 1, tmo);
>>>> +    } while (res < 0 && errno == EINTR);
>>>> +
>>>> +    if (res == 0) {
>>>> +        return false;
>>>> +    }
>>>> +    if (res < 0) {
>>>> +        error_report("uffd_poll_events() failed: errno=%i", errno);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return (poll_fd.revents & POLLIN) != 0;
>>>> +}
>>>> +
>>>>    static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>>>>                                     ram_addr_t offset, uint8_t *source_buf);
>>>> @@ -3788,6 +3971,90 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>>>>        return 0;
>>>>    }
>>>> +/**
>>>> + * ram_write_tracking_start: start UFFD-WP memory tracking
>>>> + *
>>>> + * Returns 0 for success or negative value in case of error
>>>> + *
>>>> + */
>>>> +int ram_write_tracking_start(void)
>>>> +{
>>>> +    int uffd;
>>>> +    RAMState *rs = ram_state;
>>>> +    RAMBlock *bs;
>>>> +
>>>> +    /* Open UFFD file descriptor */
>>>> +    uffd = uffd_create_fd();
>>>> +    if (uffd < 0) {
>>>> +        return uffd;
>>>> +    }
>>>> +    rs->uffdio_fd = uffd;
>>>> +
>>>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>>>> +        /* Nothing to do with read-only and MMIO-writable regions */
>>>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        /* Register block memory with UFFD to track writes */
>>>> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
>>>> +                bs->max_length, false, true)) {
>>>> +            goto fail;
>>>> +        }
>>>> +        /* Apply UFFD write protection to the block memory range */
>>>> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
>>>> +                bs->max_length, true)) {
>>>> +            goto fail;
>>>> +        }
>>>> +        bs->flags |= RAM_UF_WRITEPROTECT;
>>>> +
>>>> +        info_report("UFFD-WP write-tracking enabled: "
>>>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>>>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>>>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>>>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>>>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +fail:
>>>> +    uffd_close_fd(uffd);
>>>> +    rs->uffdio_fd = -1;
>>>> +    return -1;
>>>> +}
>>>> +
>>>> +/**
>>>> + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
>>>> + */
>>>> +void ram_write_tracking_stop(void)
>>>> +{
>>>> +    RAMState *rs = ram_state;
>>>> +    RAMBlock *bs;
>>>> +    assert(rs->uffdio_fd >= 0);
>>>> +
>>>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>>>> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
>>>> +            continue;
>>>> +        }
>>>> +        info_report("UFFD-WP write-tracking disabled: "
>>>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>>>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>>>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>>>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>>>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>>>> +        /* Cleanup flags */
>>>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Close UFFD file descriptor to remove protection,
>>>> +     * release registered memory regions and flush wait queues
>>>> +     */
>>>> +    uffd_close_fd(rs->uffdio_fd);
>>>> +    rs->uffdio_fd = -1;
>>>> +}
>>>> +
>>>>    static SaveVMHandlers savevm_ram_handlers = {
>>>>        .save_setup = ram_save_setup,
>>>>        .save_live_iterate = ram_save_iterate,
>>>> diff --git a/migration/ram.h b/migration/ram.h
>>>> index 011e85414e..3611cb51de 100644
>>>> --- a/migration/ram.h
>>>> +++ b/migration/ram.h
>>>> @@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
>>>>    void colo_release_ram_cache(void);
>>>>    void colo_incoming_start_dirty_log(void);
>>>> +/* Live snapshots */
>>>> +int ram_write_tracking_start(void);
>>>> +void ram_write_tracking_stop(void);
>>>> +
>>>>    #endif
>>>> -- 
>>>> 2.25.1
>>>>
>>
>>
>> -- 
>> Andrey Gruzdev, Principal Engineer
>> Virtuozzo GmbH  +7-903-247-6397
>>                  virtuzzo.com
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

