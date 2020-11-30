Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F72C8E0D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 20:29:58 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjos1-0005wV-7H
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 14:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjoqG-00058B-WF
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:28:09 -0500
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:44258 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjoqA-00020r-Ri
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:28:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yky2oucrsO3xlzKkRt8o7MJQTOgKhbZqP3ZbfmjhXG1yetx9/TmlZD1OVBzJsIetlfj8cp2uuSam80dnAZH40nbvgpzjrwEG1DVoZemvTT8PTC3HZWyb4py1dr0sDert0QDU7YDGFwsVlB9VNaCfUejJm/4CPVNx4uMJtGVZHZrgkpqV6CzPayjuKAfkbI2Z2ftPif8EmZWK4apfMGex7sqtswxj+foc7ECkI/rR191L6RGN6reBcU2HkGB4OzXtncQlyPWr1pNuYiCJX0tdUzjlJvHEvPeb7TAGRLk7I6P1vGJjwLQv4Mvt3AvnztugHNmQX0kYmvxLZxf910maxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoskDdk8RcwN537DhIvlI1pEP+D4Mh5LTEJq0rK2bzU=;
 b=nnNBFybNAgkl0lEFwEl8lFEzq1sL+M6L2LhBAdslr9ZkldC47VEqJvfqP+BU46wnH2xgAes83Umf1zD2fm0B4d/J6ueD4PSgRuE4ygJcJdDRafWS8f/GovwzQZdpg3SDI4WCdnHi17gtZmE4+sYsoeA0PY4ix72D0A4A5vbnsEuH/kfNkt2oXliK3t9fuwVR0vmREog197x3wO2LS2iZ6fmkOgnEKsjWF6zNORNQ8GtzsKkwzZYMlPnRelsi2EFTJeUpPHTaRDzO6JKgP22fy3dkGkrhqVJ6sOX7MoH6QEhURln1vUbWgXk0J/XrS6yhyBYWod51gYhziLnVU8PImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoskDdk8RcwN537DhIvlI1pEP+D4Mh5LTEJq0rK2bzU=;
 b=D2NPej3LjP4JfhMQX1ZP/fe3NZt3eB8AXJexk4jy6yLlAukjAvGaG5goBJJN8AEC9+6HUc2CC7Ixmey6dDKwmlgHbYyuh6AG1B6c6XdQRqNP2gyW3OGLZ/OHLlZp0shO8N058cvPc0QV4AlVKaLwIfXe1VEXT2oxQ432VMPuvRw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0801MB1904.eurprd08.prod.outlook.com
 (2603:10a6:800:81::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 19:27:58 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 19:27:58 +0000
Subject: Re: [PATCH v4 3/6] support UFFD write fault processing in
 ram_save_iterate()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-4-andrey.gruzdev@virtuozzo.com>
 <20201127214949.GG6573@xz-x1>
 <f0fb8488-7d86-d6f9-947d-9455eb135970@virtuozzo.com>
 <20201130163221.GB3277@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2e89b0f9-d6c1-8fb2-4dfb-0eaf85e0bdbf@virtuozzo.com>
Date: Mon, 30 Nov 2020 22:27:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201130163221.GB3277@xz-x1>
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 19:27:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eefa1f4f-9895-41ac-6c4f-08d895660b7d
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1904A38082519150F3456DC79FF50@VI1PR0801MB1904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QY9ovtBCNM+zwT2lrkPSVwseRKpP4a+YTAUHPYisB4RR/PSx96B8dqw+dNJohTsALXimpnPwSBfitzR4OGXbEmwVCak6dp3lBqAn9+aZtxaneNZnbH+DKRWygtcnN+l0z2U9SvJ19SRmHLSLQY3LV3en2lCAjbWfbAqk3P7y0chKi32IvBt06htiK0Q1PX/K0TvCLQmm6f7ZYxtaoURAC9cL0ky1aBflsEum0OokPAV61OCmI0wQl7lhEkM96LKQOfu2W/VBWFGr7gDQSeqFiEycka4jQ+ddCwFAXNbde7be7IOrMe5gt65Ofrjzs99ZwDciXhxJ+cgIhaiDxWaLDpG5OMilrv13mKa+bqxKoXr0ZhIXBboGEhfBEpjnJPp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(5660300002)(52116002)(66556008)(31686004)(36756003)(66946007)(66476007)(316002)(31696002)(16576012)(53546011)(6486002)(956004)(2906002)(44832011)(4326008)(2616005)(26005)(6916009)(186003)(8936002)(16526019)(54906003)(83380400001)(8676002)(86362001)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlNSTENFNVZDMERxK3IybFI4YnhkMGNzTng4eFNxdGZtZ3lITFlESzFldEZR?=
 =?utf-8?B?djIwbkRMbkF5eFlML2NlWGdhb3dXSUh6YWp2L0xQbWROek14TUJ5MzA5VDFX?=
 =?utf-8?B?YWtPUk1VWDhXaHhvcmNOUzZrbktBY3dOcHk0SHRDZnU5UyswZG1uTFB3cFo1?=
 =?utf-8?B?NDVLbldTTGJ3eDJEc1FPd0NUbFJPTTJIUzZGUi9ETDM0aEk5cnFLeUxEU0RO?=
 =?utf-8?B?OUU0REtZT2ovMENzTG1TMlNXczFHQWRYQndaMXJQWHNvblVqd1lhYkJScWoy?=
 =?utf-8?B?bDQwNFdQK2ltdTFaTG1Sc0ZFN3pidGRSN1o5eURoNXZqZ3FGWVRwK1RaOVlU?=
 =?utf-8?B?bzJnd2ErZWNpN1dVNi9PZlVRRCs2UGU5RXZsSjV4ejFjWFdrOTFybTNUa0lv?=
 =?utf-8?B?THEzQ0N0ai9FSnFPTzF2ZWJDUjVaYlFsbHNpQVFCQjJwU1pFSUNkWkdNeUtB?=
 =?utf-8?B?ZVZ2RU1QM3p4TWdVWURsTytaTnJRRjF6MjVRN0xBOEVTVVhoVHRtY1M2dFFz?=
 =?utf-8?B?eEdnc3ppUXdYSms1QzFaRTV5TXhWeEdrTTJ6N0hnOHhrTms3V0p4QU5kZWVj?=
 =?utf-8?B?aU9INThYdnJsSTJPSmZmak9heXFobnlTc2E3cGkrWlZtdXgyTndza0lNWVUx?=
 =?utf-8?B?S090b1UzVE1YME5wSmtRc1o1Yk9jM2pOTzdNV0ExSHAzZ1c0SElhc2ZCOVd6?=
 =?utf-8?B?a1A0SHROYkZqTnlSK1dzRWZXT2t5c2VmMFd4MUFMRWM3dzRodnRHR2ticVZi?=
 =?utf-8?B?RDRHUkE1ckZRUzdzSFZiUzRqTlBoNjA0bS9oUEVQenI3WFpjalIvRzF6ODVt?=
 =?utf-8?B?WTVQWnJGZHc2THU3RjRVSTQwRW13cTRkOUEzYUZHdEdGVEVLYmpaN0xKb2pr?=
 =?utf-8?B?YUc5SHA1Y3lKNk9IZWZmMXNJYzE5UTZtdDhYdU1FZlBQRVhpVkdyc2lzNG1Z?=
 =?utf-8?B?c1ZZaEFYOGxuOEx1S0xjbUtoVE5naEpuQjBPeEw5WHhsdFp0M053Q3lpVEtD?=
 =?utf-8?B?bGZacFo5TlFUd0I5M0N0M21nY3plMk9KQTFKSDF1VlY0NzVGY0FLY0ZtbVpE?=
 =?utf-8?B?a0piR0w1RW5yM0k5WmpmY0dwcXhqZzVWNTVGNHZOQUk0dVZXV01VWXA5T0Jq?=
 =?utf-8?B?d2x2cGJJQ21YSm9FV1lCbzVNRDZQS0pJb0JSYUMvOTN1STVLeElwWHV2Sm1N?=
 =?utf-8?B?SDJLaTRwL0Q2Q242WlE2N1lIaldxMnJ4a1RJOEM2TWlHaHRmNVQyODVlRzlx?=
 =?utf-8?B?YngrTjdoNWc1RmZ6cGI3NmlGNkR1SUE5dms4RjFmMTUyL3BSSnVFY2swTm9H?=
 =?utf-8?Q?l5PRY27lqv/OypxqQqlTyH+m9X5ZG0HhBg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefa1f4f-9895-41ac-6c4f-08d895660b7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 19:27:58.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWPoEqWbzB16pC3aPS8y605rYtiSD+rtbC9td0mosL2BJaA9rztRh/sd/Rg9/zk3CNYv2nccTQdvlHkwFe3tUDjJdysudQ++U0TcE7IAbtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1904
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

On 30.11.2020 19:32, Peter Xu wrote:
> On Mon, Nov 30, 2020 at 12:14:03AM +0300, Andrey Gruzdev wrote:
>>>> +#ifdef CONFIG_LINUX
>>>> +/**
>>>> + * ram_find_block_by_host_address: find RAM block containing host page
>>>> + *
>>>> + * Returns pointer to RAMBlock if found, NULL otherwise
>>>> + *
>>>> + * @rs: current RAM state
>>>> + * @page_address: host page address
>>>> + */
>>>> +static RAMBlock *ram_find_block_by_host_address(RAMState *rs, hwaddr page_address)
>>>
>>> Reuse qemu_ram_block_from_host() somehow?
>>>
>>
>> Seems not very suitable here, since we use rs->last_seen_block to restart
>> search..
> 
> The search logic is actually still the same, it's just about which block to
> start searching (rs->last_seen_block, ram_list.mru_block, or the 1st one).  So
> an internal helper to pass in that information would be nice.  Though that'll
> require rcu lock taken before hand to keep the ramblock ptr valid.
> 
> No worry - we can keep this and work on top too, I think.
> 
> [...]
>  >>>> +static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>>>> +{
>>>> +    struct uffd_msg uffd_msg;
>>>> +    hwaddr page_address;
>>>> +    RAMBlock *bs;
>>>> +    int res;
>>>> +
>>>> +    if (!migrate_background_snapshot()) {
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
>>>> +    if (res <= 0) {
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    page_address = uffd_msg.arg.pagefault.address;
>>>> +    bs = ram_find_block_by_host_address(rs, page_address);
>>>> +    if (!bs) {
>>>> +        /* In case we couldn't find respective block, just unprotect faulting page. */
>>>> +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
>>>> +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
>>>> +                page_address);
>>>
>>> Looks ok to error_report() instead of assert(), but I'll suggest drop the call
>>> to uffd_protect_memory() at least.  The only reason to not use assert() is
>>> because we try our best to avoid crashing the vm, however I really doubt
>>> whether uffd_protect_memory() is the right thing to do even if it happens - we
>>> may at last try to unprotect some strange pages that we don't even know where
>>> it is...
>>>
>>
>> IMHO better to unprotect these strange pages then to leave them protected by
>> UFFD.. To avoid getting VM completely in-operational.
>> At least we know the page generated wr-fault, maybe due to incorrect
>> write-tracking initialization, or RAMBlock somehow has gone. Nevertheless if
>> leave the page as is, VM would certainly lock.
> 
> Yes makes some senes too.  However it's definitely a severe programming error,
> even if the VM is unblocked, it can be in a very weird state...
> 
> Maybe we just assert? Then we can see how unlucky we'll be. :)
> 

Yeah, seems assert is a right thing here :)

>>
>> Hmm, I wonder about assert(). In QEMU it would do something in release
>> builds?
> 
> I guess yes, at least for now.  Because osdep.h has this:
> 
> /*
>   * We have a lot of unaudited code that may fail in strange ways, or
>   * even be a security risk during migration, if you disable assertions
>   * at compile-time.  You may comment out these safety checks if you
>   * absolutely want to disable assertion overhead, but it is not
>   * supported upstream so the risk is all yours.  Meanwhile, please
>   * submit patches to remove any side-effects inside an assertion, or
>   * fixing error handling that should use Error instead of assert.
>   */
> #ifdef NDEBUG
> #error building with NDEBUG is not supported
> #endif
> #ifdef G_DISABLE_ASSERT
> #error building with G_DISABLE_ASSERT is not supported
> #endif
> 
> [...]
> 

Ooops, didn't know that, thanks for info!

>>>> +/**
>>>> + * ram_save_host_page_post: ram_save_host_page() post-notifier
>>>> + *
>>>> + * @rs: current RAM state
>>>> + * @pss: page-search-status structure
>>>> + * @opaque: opaque context value
>>>> + * @res_override: pointer to the return value of ram_save_host_page(),
>>>> + *   overwritten in case of an error
>>>> + */
>>>> +static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>>>> +        void *opaque, int *res_override)
>>>> +{
>>>> +    /* Check if page is from UFFD-managed region. */
>>>> +    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
>>>> +#ifdef CONFIG_LINUX
>>>> +        ram_addr_t page_from = (ram_addr_t) opaque;
>>>> +        hwaddr page_address = (hwaddr) pss->block->host +
>>>> +                              ((hwaddr) page_from << TARGET_PAGE_BITS);
>>>
>>> I feel like most new uses of hwaddr is not correct...  As I also commented in
>>> the other patch.  We should save a lot of castings if switched.
>>>
>>
>> Need to check. hwaddr is typedef'ed as uint64_t while ram_addr_t as
>> uintptr_t. I any case UFFD interface relies on u64 type.
> 
> For example, page_from should be a host address, we can use unsigned long, or
> uint64_t, but ram_addr_t is not proper, which is only used in ramblock address
> space.
> 
> I think it's fine that e.g. we use common types like uint64_t directly.
> 

Now I also think we'd better use common types - mostly uint64_t 
directly, not to confuse anybody with that specific type descriptions.

>>
>>>> +        hwaddr run_length = (hwaddr) (pss->page - page_from + 1) << TARGET_PAGE_BITS;
>>>> +        int res;
>>>> +
>>>> +        /* Flush async buffers before un-protect. */
>>>> +        qemu_fflush(rs->f);
>>>> +        /* Un-protect memory range. */
>>>> +        res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
>>>> +        /* We don't want to override existing error from ram_save_host_page(). */
>>>> +        if (res < 0 && *res_override >= 0) {
>>>> +            *res_override = res;
>>>
>>> What is this used for?  If res<0, I thought we should just fail the snapshot.
>>>
>>> Meanwhile, res_override points to "pages", and then it'll be rewrite to the
>>> errno returned by uffd_protect_memory().  Smells strange.
>>>
>>> Can this ever be triggered anyway?
>>>
>>
>> Yes, since "pages" is also for error return, if negative. If we have a
>> problem with un-protecting, promote the error to the loop in
>> ram_find_and_save_block() so it exits early ("pages" guaranteed to be
>> non-zero). In outer routines retcode would go to qemu_set_file_error().
> 
> Ok I see your point.
> 
>>
>>>> +        }
>>>> +#else
>>>> +        /* Should never happen */
>>>> +        qemu_file_set_error(rs->f, -ENOSYS);
>>>> +#endif /* CONFIG_LINUX */
>>>> +    }
>>>> +}
>>>> +
>>>>    /**
>>>>     * ram_find_and_save_block: finds a dirty page and sends it to f
>>>>     *
>>>> @@ -1779,14 +1908,14 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>>>            return pages;
>>>>        }
>>>> +    if (!rs->last_seen_block) {
>>>> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>
>>> Why setup the last seen block to be the first if null?
>>>
>>
>> Because ram_find_block_by_host_address() relies on rs->last_seen_block.
>> Pss is not passed to that routine.
> 
> Ok, but it's odd - because that's not the real "last seen block".
> 
> So now I'm rethinking maybe we could still reuse qemu_ram_block_from_host() by
> providing a new helper to do the search logic as mentioned above, which could
> take a pointer of RAMBlock as the 1st ramblock to search.  Then
> ram_find_block_by_host_address() should pass in rs->last_seen_block (which
> could be NULL - then we'll start with the 1st ramblock), or ram_list.mru_block
> for qemu_ram_block_from_host().  That could be a standalone new patch, then we
> don't need this slightly strange change.  What do you think?
> 

Mm, need to think about that..

>>
>>>> +    }
>>>> +
>>>>        pss.block = rs->last_seen_block;
>>>>        pss.page = rs->last_page;
>>>>        pss.complete_round = false;
>>>> -    if (!pss.block) {
>>>> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>> -    }
>>>> -
>>>>        do {
>>>>            again = true;
>>>>            found = get_queued_page(rs, &pss);
>>>> @@ -1797,7 +1926,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>>>            }
>>>>            if (found) {
>>>> +            void *opaque;
>>>> +
>>>> +            ram_save_host_page_pre(rs, &pss, &opaque);
>>>>                pages = ram_save_host_page(rs, &pss, last_stage);
>>>> +            ram_save_host_page_post(rs, &pss, opaque, &pages);
>>>
>>> So the pre/post idea is kind of an overkill to me...
>>>
>>> How about we do the unprotect in ram_save_host_page() in the simple way, like:
>>>
>>>     ram_save_host_page()
>>>       start_addr = pss->page;
>>>       do {
>>>         ...
>>>         (migrate pages)
>>>         ...
>>>       } while (...);
>>>       if (background_snapshot_enabled()) {
>>>         unprotect pages within start_addr to pss->page;
>>>       }
>>>       ...
>>>
>>
>> Personally I prefer not to modify existing code. May be adding to simple
>> calls would finally look cleaner?
> 
> Let's wait a 3rd opinion from Juan/Dave or others.
> 
> Thanks,
> 

Agree.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

