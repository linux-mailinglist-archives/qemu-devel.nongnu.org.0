Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB42C7B4F
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 22:16:08 +0100 (CET)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjU3D-0000eo-5J
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 16:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjU1O-0000AN-VZ
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:14:14 -0500
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:3205 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjU1K-0004TM-Vt
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 16:14:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbmmMFpx+cvTVakrQ1tXmMIDaRpz12KO+tDErq+486kwcWQfdTSKj5+2i/sfSGVdVjTdancfJEi7bcvncrnxVNThfxIZSYz8xiQANhOOMeeaxTZ7tcWeImkLYiBDAB+6SiTZ2c/W8y29cVSV+9c3WmJ11rH0Pe/fjQl0tu+VP2T7ZzXGLpSB9aiZM8jvxnaibmvSK6YyZmWDHVIp2BlHJH1A2NF8azr27zGznNyEwPe/UOPjhcQy4Lt3Qucdcj29Di5wsQAacfFjMQ8r61GZmLROgiZ1xl8J7my+/qbqLB/lEjlU0VscltbxYIxh9lR33AjT7+oAMgl8qfA9fLapvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZdC732OmPGhE8u3L/vkK/RpwjT72KXVlP2vpWDxFF0=;
 b=h0oiCzU0/Iu+0pIji0W/TOHSm+Ee3TfewPvWhBzfDafUUU+TRCcMmhBoeqRJOd7lupD1dtfY3ma5zvUX6wLWs0F3egKD64B7GlUKHDw9sPGodnuYWdFSowf2ZL/XKtBQy3+K0K2fkx3cmSZkGSYKjPcfImsdoWELeaLRaRFAl+xJ3FvgTan3JRlntR3jv9Ztj6E8Xmt4VjstNSxTT6X0d0fZwfMRN19OMF0C/F1l3lwGBpudbb8LCvw2ov1J8JGDn1ZzZZ58gXnSx2zS+vpNU0DJuoj9yb8uTBGoXf/dvx7P3mC2YlQmEDAzNBDdzxe2IO2pLGzwTDQ6AI1umTtcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZdC732OmPGhE8u3L/vkK/RpwjT72KXVlP2vpWDxFF0=;
 b=ifV5LEcT1WvtBxDjPsrnvzYMIC7KtQl8I/5dm+Fk6cFyhS8ksOmIsS6DeNupkfSJy4XQI3OMKomeySAxv2NwUqcSDamN2JV84Sfj3MZOm50UqWBs5teMGIpucpKID4gLt3h8dn6qkJ3hV46XZNPbDCfnis+jxbVWAIdzNmOrIrg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5037.eurprd08.prod.outlook.com
 (2603:10a6:803:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Sun, 29 Nov
 2020 21:14:05 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Sun, 29 Nov
 2020 21:14:05 +0000
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
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <f0fb8488-7d86-d6f9-947d-9455eb135970@virtuozzo.com>
Date: Mon, 30 Nov 2020 00:14:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127214949.GG6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0101CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::39) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0101CA0071.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Sun, 29 Nov 2020 21:14:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef913238-260b-46a8-75c0-08d894abb40c
X-MS-TrafficTypeDiagnostic: VE1PR08MB5037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB50379B5E4715C87086B53FE59FF60@VE1PR08MB5037.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9M0hqWHb2QLgFl+a1e6+nK8ZR8CNwP9ygbFfVWsjvBPKG16+TzkhCVBzGwOWTHrUgfDDBiAvYB6HP3ZoyIfFEfcFBhyz0/3dgP1IF0ZY5Q9YGQEwj0WKvHnYp3/P68FR61bJU+1CxieYPvhsPOIiviEbGW8SLAdKMch581uW1KZIQ04oDYrPFEuXSz3OZ3MFL8j8J+tcuKaWFds7pUiGpgHTQjPuTMmFQYQboot/8fq7P96rRaesHD65CgB43SGPN6gpw4shmo7TtAy7F3ZA1ZSJF3ivgUkVHC8gfxO0asHqzvs8+ZLNZ5Pazhwulq76U6B+f34Dsjs7BawMMasjQ5wNToY+S0ZapSERmTRHqQ/8vkqFxslloC47zq83offh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39830400003)(16576012)(8676002)(5660300002)(30864003)(16526019)(956004)(54906003)(2616005)(316002)(6916009)(86362001)(26005)(53546011)(4326008)(186003)(83380400001)(478600001)(66946007)(52116002)(8936002)(6486002)(2906002)(44832011)(31696002)(36756003)(66476007)(31686004)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnRZOCtuSm9LUzBqcTVaYWxsZXk5QzdFUnMzT1NGS1pOeGowNVdZYlFlVm01?=
 =?utf-8?B?SHliNnVOb2ppVXkzYVNaV2hHdlBVV0ptaFVaUmJrRlVQWEVlenNLUWVjblVO?=
 =?utf-8?B?UzdwU1JlVU9pNlNnQkZCV3I2d1J4SWtnanR1OWtLSG10L21NRUV3VmhvRi9q?=
 =?utf-8?B?WmtLalJUdENZMS92MkJGUThaZkMyTWpRM1R6LzVteVBDTnpvMGFYTkNva1NO?=
 =?utf-8?B?QThjb3J4NWdyamUzcFRuNUZSSFZWaTFMK2l4ek5kSll1Z1psU3N5SS84MzQx?=
 =?utf-8?B?UkZEVHpCVzdGdW9xYTRNL0k3b0xhajZRT2lubFZSaHUzYjdxcHk1aTlCaHFr?=
 =?utf-8?B?OElNZis1RndYYllBZFh0bUtzSVY1SCszS1UvZnpVVzgyUkFqTmg5V2s0Tmlj?=
 =?utf-8?B?ZE10K0dFUW9CRzB3ZkM0WS9XMWNrTzJLYXpsQnJYbUlxYkJUclpFVmRtY1Y3?=
 =?utf-8?B?Rjhsdnp2aStZMWp5ZWJvSGtmd2VLZzJudTBTVFM0T1RQbWxFdU1MT0d3ejc0?=
 =?utf-8?B?V0pMVVBONVB1WGxtUHJRUHc1NTVSeTZMRjNXc1h6TmtRRzVSZGNQK3B2SmNy?=
 =?utf-8?B?RDI2VWNCUlJadDNKZ0pnQ2dsU0d6bkh6V1hCNGlDRmpTY3FmeElBSE5GMjBy?=
 =?utf-8?B?aDlrWTRlZy90aEd4QTVSVzlmcmdQUTZwT1pIL0IrSVhNeXZvQ0JCMzdlYzRH?=
 =?utf-8?B?dElRTkoxaENPd09GR3BmUlN4K3VzdUF0RVBmT0w0MEU4amhuNTlvK1YvSDRo?=
 =?utf-8?B?OGpIT0VWVGh0RjV0R3kvaFIwZHlnNlF0YnErSlYrRGtJUjM4Rm9lTFVSeE02?=
 =?utf-8?B?QlVYblBjeEExTUNaQW5URXF0cGpqSS9GUEJkTXZ3Q1RtalB5MDRxTkpEeHRr?=
 =?utf-8?B?YXhsTjB3ckhUemVxOVJxNjV5a2hnMk5neXdibmYrbUdmdE1EMXljdlVKTWNB?=
 =?utf-8?B?dS8xM29yUmtFZFExMkxJR1hwVzYvRkJ2ZDZhOGt6M1dVNncreTV6RWluOWly?=
 =?utf-8?B?SWdOQ1hSaElSazMyUC9Lc1pJai9BbjVpc0pJMmNFaDhLMWx4TXBWeHhpU1hZ?=
 =?utf-8?B?R0tMZHlwYTJnRTV1a29oS1RsMWxZMFdIdnpBQ0RGVStnck1XUVFVZXEwTTVC?=
 =?utf-8?B?bVo5c3JsZVhrbFdiT2NRQnZzNUZIUkYwbjJGZ2FDR3BZRzBqRVpwUmRYMy8y?=
 =?utf-8?B?SGZCbmZyVHIxclhRT25NNEdoRkFWL3ZFSWFrdUhveWRZWEV6QmZzUWNLRGll?=
 =?utf-8?B?Y2pXaEpqdHpmRGtjMWRZUU42ZWFHcjhsaGN5bFlBb2RWSHQ5MVo1K1kydzho?=
 =?utf-8?Q?Q+XO+QGJAsZAI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef913238-260b-46a8-75c0-08d894abb40c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2020 21:14:05.5108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLWce2rhmFrS7xBBzGcF2I9jXx1QIq7X7TUrsXMiV3UHBnFyyuRrWO40TEQrKh3lcCPXPp3+FuI+btwpDR0PsAKZR8fzH92GHBd7jpNFkrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5037
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

On 28.11.2020 00:49, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:31PM +0300, Andrey Gruzdev wrote:
>> In this particular implementation the same single migration
>> thread is responsible for both normal linear dirty page
>> migration and procesing UFFD page fault events.
>>
>> Processing write faults includes reading UFFD file descriptor,
>> finding respective RAM block and saving faulting page to
>> the migration stream. After page has been saved, write protection
>> can be removed. Since asynchronous version of qemu_put_buffer()
>> is expected to be used to save pages, we also have to flush
>> migraion stream prior to un-protecting saved memory range.
>>
>> Write protection is being removed for any previously protected
>> memory chunk that has hit the migration stream. That's valid
>> for pages from linear page scan along with write fault pages.
> 
> Thanks for working on this version, it looks much cleaner.
> >>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/ram.c | 155 +++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 147 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 3adfd1948d..bcdccdaef7 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1441,6 +1441,76 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>>       return block;
>>   }
>>   
>> +#ifdef CONFIG_LINUX
>> +/**
>> + * ram_find_block_by_host_address: find RAM block containing host page
>> + *
>> + * Returns pointer to RAMBlock if found, NULL otherwise
>> + *
>> + * @rs: current RAM state
>> + * @page_address: host page address
>> + */
>> +static RAMBlock *ram_find_block_by_host_address(RAMState *rs, hwaddr page_address)
> 
> Reuse qemu_ram_block_from_host() somehow?
> 

Seems not very suitable here, since we use rs->last_seen_block to 
restart search..

>> +{
>> +    RAMBlock *bs = rs->last_seen_block;
>> +
>> +    do {
>> +        if (page_address >= (hwaddr) bs->host && (page_address + TARGET_PAGE_SIZE) <=
>> +                ((hwaddr) bs->host + bs->max_length)) {
>> +            return bs;
>> +        }
>> +
>> +        bs = QLIST_NEXT_RCU(bs, next);
>> +        if (!bs) {
>> +            /* Hit the end of the list */
>> +            bs = QLIST_FIRST_RCU(&ram_list.blocks);
>> +        }
>> +    } while (bs != rs->last_seen_block);
>> +
>> +    return NULL;
>> +}
>> +
>> +/**
>> + * poll_fault_page: try to get next UFFD write fault page and, if pending fault
>> + *   is found, return RAM block pointer and page offset
>> + *
>> + * Returns pointer to the RAMBlock containing faulting page,
>> + *   NULL if no write faults are pending
>> + *
>> + * @rs: current RAM state
>> + * @offset: page offset from the beginning of the block
>> + */
>> +static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>> +{
>> +    struct uffd_msg uffd_msg;
>> +    hwaddr page_address;
>> +    RAMBlock *bs;
>> +    int res;
>> +
>> +    if (!migrate_background_snapshot()) {
>> +        return NULL;
>> +    }
>> +
>> +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
>> +    if (res <= 0) {
>> +        return NULL;
>> +    }
>> +
>> +    page_address = uffd_msg.arg.pagefault.address;
>> +    bs = ram_find_block_by_host_address(rs, page_address);
>> +    if (!bs) {
>> +        /* In case we couldn't find respective block, just unprotect faulting page. */
>> +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
>> +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
>> +                page_address);
> 
> Looks ok to error_report() instead of assert(), but I'll suggest drop the call
> to uffd_protect_memory() at least.  The only reason to not use assert() is
> because we try our best to avoid crashing the vm, however I really doubt
> whether uffd_protect_memory() is the right thing to do even if it happens - we
> may at last try to unprotect some strange pages that we don't even know where
> it is...
> 

IMHO better to unprotect these strange pages then to leave them 
protected by UFFD.. To avoid getting VM completely in-operational.
At least we know the page generated wr-fault, maybe due to incorrect 
write-tracking initialization, or RAMBlock somehow has gone. 
Nevertheless if leave the page as is, VM would certainly lock.

Hmm, I wonder about assert(). In QEMU it would do something in release 
builds?

>> +        return NULL;
>> +    }
>> +
>> +    *offset = (ram_addr_t) (page_address - (hwaddr) bs->host);
>> +    return bs;
>> +}
>> +#endif /* CONFIG_LINUX */
>> +
>>   /**
>>    * get_queued_page: unqueue a page from the postcopy requests
>>    *
>> @@ -1480,6 +1550,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>>   
>>       } while (block && !dirty);
>>   
>> +#ifdef CONFIG_LINUX
>> +    if (!block) {
>> +        /*
>> +         * Poll write faults too if background snapshot is enabled; that's
>> +         * when we have vcpus got blocked by the write protected pages.
>> +         */
>> +        block = poll_fault_page(rs, &offset);
>> +    }
>> +#endif /* CONFIG_LINUX */
>> +
>>       if (block) {
>>           /*
>>            * As soon as we start servicing pages out of order, then we have
>> @@ -1753,6 +1833,55 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       return pages;
>>   }
>>   
>> +/**
>> + * ram_save_host_page_pre: ram_save_host_page() pre-notifier
>> + *
>> + * @rs: current RAM state
>> + * @pss: page-search-status structure
>> + * @opaque: pointer to receive opaque context value
>> + */
>> +static inline
>> +void ram_save_host_page_pre(RAMState *rs, PageSearchStatus *pss, void **opaque)
>> +{
>> +    *(ram_addr_t *) opaque = pss->page;
>> +}
>> +
>> +/**
>> + * ram_save_host_page_post: ram_save_host_page() post-notifier
>> + *
>> + * @rs: current RAM state
>> + * @pss: page-search-status structure
>> + * @opaque: opaque context value
>> + * @res_override: pointer to the return value of ram_save_host_page(),
>> + *   overwritten in case of an error
>> + */
>> +static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
>> +        void *opaque, int *res_override)
>> +{
>> +    /* Check if page is from UFFD-managed region. */
>> +    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
>> +#ifdef CONFIG_LINUX
>> +        ram_addr_t page_from = (ram_addr_t) opaque;
>> +        hwaddr page_address = (hwaddr) pss->block->host +
>> +                              ((hwaddr) page_from << TARGET_PAGE_BITS);
> 
> I feel like most new uses of hwaddr is not correct...  As I also commented in
> the other patch.  We should save a lot of castings if switched.
> 

Need to check. hwaddr is typedef'ed as uint64_t while ram_addr_t as 
uintptr_t. I any case UFFD interface relies on u64 type.

>> +        hwaddr run_length = (hwaddr) (pss->page - page_from + 1) << TARGET_PAGE_BITS;
>> +        int res;
>> +
>> +        /* Flush async buffers before un-protect. */
>> +        qemu_fflush(rs->f);
>> +        /* Un-protect memory range. */
>> +        res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
>> +        /* We don't want to override existing error from ram_save_host_page(). */
>> +        if (res < 0 && *res_override >= 0) {
>> +            *res_override = res;
> 
> What is this used for?  If res<0, I thought we should just fail the snapshot.
> 
> Meanwhile, res_override points to "pages", and then it'll be rewrite to the
> errno returned by uffd_protect_memory().  Smells strange.
> 
> Can this ever be triggered anyway?
> 

Yes, since "pages" is also for error return, if negative. If we have a 
problem with un-protecting, promote the error to the loop in 
ram_find_and_save_block() so it exits early ("pages" guaranteed to be 
non-zero). In outer routines retcode would go to qemu_set_file_error().

>> +        }
>> +#else
>> +        /* Should never happen */
>> +        qemu_file_set_error(rs->f, -ENOSYS);
>> +#endif /* CONFIG_LINUX */
>> +    }
>> +}
>> +
>>   /**
>>    * ram_find_and_save_block: finds a dirty page and sends it to f
>>    *
>> @@ -1779,14 +1908,14 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>           return pages;
>>       }
>>   
>> +    if (!rs->last_seen_block) {
>> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
> 
> Why setup the last seen block to be the first if null?
> 

Because ram_find_block_by_host_address() relies on rs->last_seen_block.
Pss is not passed to that routine.

>> +    }
>> +
>>       pss.block = rs->last_seen_block;
>>       pss.page = rs->last_page;
>>       pss.complete_round = false;
>>   
>> -    if (!pss.block) {
>> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
>> -    }
>> -
>>       do {
>>           again = true;
>>           found = get_queued_page(rs, &pss);
>> @@ -1797,7 +1926,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>           }
>>   
>>           if (found) {
>> +            void *opaque;
>> +
>> +            ram_save_host_page_pre(rs, &pss, &opaque);
>>               pages = ram_save_host_page(rs, &pss, last_stage);
>> +            ram_save_host_page_post(rs, &pss, opaque, &pages);
> 
> So the pre/post idea is kind of an overkill to me...
> 
> How about we do the unprotect in ram_save_host_page() in the simple way, like:
> 
>    ram_save_host_page()
>      start_addr = pss->page;
>      do {
>        ...
>        (migrate pages)
>        ...
>      } while (...);
>      if (background_snapshot_enabled()) {
>        unprotect pages within start_addr to pss->page;
>      }
>      ...
> 

Personally I prefer not to modify existing code. May be adding to simple 
calls would finally look cleaner?

>>           }
>>       } while (!pages && again);
>>   
>> @@ -3864,9 +3997,12 @@ fail:
>>       rs->uffdio_fd = -1;
>>       return -1;
>>   #else
>> +    /*
>> +     * Should never happen since we prohibit 'background-snapshot'
>> +     * capability on non-Linux hosts.
> 
> Yeah, yeah. So let's drop these irrelevant changes? :)
> 

Yes.

>> +     */
>>       rs->uffdio_fd = -1;
>> -    error_setg(&migrate_get_current()->error,
>> -            "Background-snapshot not supported on non-Linux hosts");
>> +    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);
>>       return -1;
>>   #endif /* CONFIG_LINUX */
>>   }
>> @@ -3903,8 +4039,11 @@ void ram_write_tracking_stop(void)
>>       uffd_close_fd(rs->uffdio_fd);
>>       rs->uffdio_fd = -1;
>>   #else
>> -    error_setg(&migrate_get_current()->error,
>> -            "Background-snapshot not supported on non-Linux hosts");
>> +    /*
>> +     * Should never happen since we prohibit 'background-snapshot'
>> +     * capability on non-Linux hosts.
>> +     */
>> +    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);
> 
> Same here.
> 
> Thanks,
> 
>>   #endif /* CONFIG_LINUX */
>>   }
>>   
>> -- 
>> 2.25.1
>>
> 


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

