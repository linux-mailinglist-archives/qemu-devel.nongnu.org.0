Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B92C4816
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:14:50 +0100 (CET)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki0Fc-0004N4-Im
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1ki0Dh-0003LC-3h
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:12:50 -0500
Received: from mail-eopbgr80118.outbound.protection.outlook.com
 ([40.107.8.118]:64326 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1ki0Dd-0007rU-FU
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:12:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1UORqA445NWspwuJj4k2N+Qf6njD42Em0pKAyP+kvwliLoucWOjeO4y53ndrXwOSVNorHLXHCRmBlcMQ4QxYxfKgc0cjdm3SS6GgAOF/XDQv7+ownE1/3r73ymW2oY/QCl20lGia9OvtzOZjLnP++aKApVWS/olCnhrushqcuJw8PmxMKj8hX8AOWB5GuHVOO9Ae2wy2YeedRUyGVRPmmpFhXIuQ3+5bCKIxNhdLWJHddie8n6Oh8bhE3fPxH2T8zxh2SlUOVnXKzZBb8+w5mxmWDKrUFpljz2uLm5ahlHpFUXK6hEEEJHCX/zUma++v6SdAOwFv7BqP5xwJPThlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7tpx6Jr0c3RvQjgtLki588Ew0Q/3RbE5Jo+rON7qBs=;
 b=EljQKfswoEXGLCn1UmeM4YbmHMtoUsujHj6beP79w+Wj8Ul2MILV+o5abIoJO8ZWX8aSsNFb7xJt9c250T8DUTvUp2gx6r+FD7hAWs0bfgseOPkWJUcuONqXCQB0MeNfnmidM2rnUfZbpdxD5gbyiEjDdpchEakjX8ZXo3pp3IHFG7dQ6cZrMpEYgAGsdWc/QuDpWiuODXsiYWZyBv2ugpmt7GvKOkLftOhjcKvwQ6XF0vOtWyX86TqPKG8++eGAaXzgxV1KhQwK/Ws0R6peGqE2kf/zt1eZZ+w5EcecEZY3L65P+qWrZXHfJf46snpOCG/kd0MkTY61NCD/lxoPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7tpx6Jr0c3RvQjgtLki588Ew0Q/3RbE5Jo+rON7qBs=;
 b=pI+TfhSbkZyqPzzLmw+C1UykzoEVLWzYtJlpeVSPtwyJwjCinsZFzUrxpbTfDpteVzF5Tonwp8NT14hQa+wlxiIButyIfq1I8NF8SYabJaGb7DmAchgZIdoHEa4bflMXZLcVq1sRU2vh9hl3q5V2B2MxwQibT0HJ++XYuLpcHLM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0801MB1741.eurprd08.prod.outlook.com
 (2603:10a6:800:5a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 19:12:40 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 19:12:40 +0000
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201125130825.GE3222@work-vm>
 <2d755397-4053-c883-3832-5d475c88b546@virtuozzo.com>
 <20201125184155.GI3222@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <54805a6c-ec6e-b55c-f6a2-15cbb7e68e35@virtuozzo.com>
Date: Wed, 25 Nov 2020 22:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125184155.GI3222@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::16) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Wed, 25 Nov 2020 19:12:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a9dbc3-bf3f-4e06-47b6-08d8917613ee
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1741DAD6EAC5F35AC7E986199FFA0@VI1PR0801MB1741.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJYRGBf+Vpqctuw+jF9zWqQ/DsN8BNSnmyfb+gGoVZfiZG4otUa5D/RrhfbJIRykbgsM5lVjmWAjz6PU0fSwFXnHf6A7bFwtJOlNcd2qGfTALinmVIFOmAFU/bQ3VvXSKGy5Z+0i+qg0nGxg4ZqXOuZ4qGg2ff+LzO5fIcq4g6+82O/iZsAKn46i5unBn41iswrG5ITQMKtr1OxwyoXsot6v1SRjScCH/u9At/Ac42nG3wtzyLG45k8VOKNR6dD6ln8+bksU0yjeNSw6TCD2Wt0YJ3uXkbDf7KaXJt61vcBJhtUsf9qPtgTBK2b9/JP/F9gahrFHzk9EbGSWL2UCWjzd+GFOW/gBID9IuZcleXyc6q/+CD9//pApXidly/zE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(4326008)(5660300002)(83380400001)(66476007)(36756003)(316002)(66556008)(53546011)(956004)(8676002)(66946007)(16526019)(186003)(54906003)(16576012)(86362001)(6486002)(26005)(31686004)(52116002)(8936002)(2906002)(6916009)(31696002)(478600001)(44832011)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlQ1UzBGNm52OHZNR0dhai9pUzNnR3JFVkZqMDdjbm8vT2JGMUpLYlBDY1pW?=
 =?utf-8?B?VGt4bnF1SkNEb2Z3MzRtM2Y2RzRPandHODAvdzFXQXJkdGNaK080VmorL2pk?=
 =?utf-8?B?a2oxcERWTUlxTmxNMTQ2VGR4WkNzcXpXdE1yejk4R1ZlRkF4c2FwNUQ5Zkc3?=
 =?utf-8?B?cGJOdEcrZnVQY091VUs1bW9NaUJaVUJTQnZZL1IzRWxoK0FrZFIybFhLYjFO?=
 =?utf-8?B?d096YVd4dnh6cEJmeHRVMDJIdjVWd2ttQm4vZlhUeXc2TjdJREVyZHVnNlJ2?=
 =?utf-8?B?ZTlHZ0w1RXVxNEhZcldkd20wS0tZMW9IaVlSOG1ZKzBkZ04rclN1cUlocW0v?=
 =?utf-8?B?T0ROWUFyRlplNUwxemhTU0s3aDlHNGVhSGR3dDE2R1lnK2U2c3E0WWFrNjgz?=
 =?utf-8?B?MEFlWE54T2Z2bDVoVTBCYWhjbmZMNEV1V1g1cGNBU0Qxc3M1N0NyU0p1RW1l?=
 =?utf-8?B?OXJDblphN1BTZWFOckNpUzdDdFN2a1FWNEZoak9nczM5YkdIQ3B3SEN3b01u?=
 =?utf-8?B?WlVIVi9sYmxoVGxIanRTN1B5N25uTHNFTjRBdkRkTzZ6aWVyU0Y3cDMxMmQ5?=
 =?utf-8?B?bFd1RGFia1BsdFd3OVNFTTlEWVltRUorMisyOXJJOTBqMWpna1B3SEtjQ0oz?=
 =?utf-8?B?WEFLOWdXY0tJRjU0K0JmUWpKaUxqalFaT0hDTi9MSTBHdFFyTGxkT3AwampP?=
 =?utf-8?B?RkUzbmxXdmxNdEliUm9lTExtem1jejU0dURqV3VLU2ZVUnRZN1NRTmEwWStS?=
 =?utf-8?B?NllRSzlubFpNV2l6MFhaZmgyTi90SkJpQUIwa2VBTlMyYUlIT0l5MkJ1Rk1U?=
 =?utf-8?B?S3N3M2NLNmpqWkR1MTNtN1ZTdnhOZHZVNjVuc0FDNzQwQlB0RWJ5VFc2TWVG?=
 =?utf-8?B?QUJOMVdLMHE2Y0hkdzNjUFEybUp4NUtBNEhsV2d4UkRYZktWMXg1UUYwbktD?=
 =?utf-8?B?MVNHOHZNVHlHZ00xaWNrLzJzRnZ0NUlRRU1GVkZYdmJ5NE5WbTNPVTZQWU9k?=
 =?utf-8?B?OE5qeURTTWhJb0lrZmd2WmpzV25maCtYMFQ2THJtVzVEQVAreWFseUdyWjJt?=
 =?utf-8?B?MzlKbTRvMUZ4Sk9oc2M3ampxUExKQjFhMHVPY2pvRGhBWW53TEQwYUU0ZE1U?=
 =?utf-8?B?ald2eHdORkt3R1Y1dXJyS0VUOFUreFhPQ3hUamh4WUJuMktpNFhoNmhYR0hk?=
 =?utf-8?B?SG9IUDFkMHQvWkYwRGlvd1F2NGFVOTY1WkY1QndOdE52SnBQeEFjOWNkRzNR?=
 =?utf-8?B?dnM4T3ZkeFlRQWp2ek5MY1R0Y05iSWd5Um5mWUp2TWdZZFJpMnh4eHREbm9n?=
 =?utf-8?Q?VnhmqnYwXHBlHScBHObwdZvjyiFGAvt7K/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a9dbc3-bf3f-4e06-47b6-08d8917613ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 19:12:40.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +E9hiLhn/nAqotbmV9mjVVjG1B+5tKxTK/Bs+OGN0LWkE1j/1e/dE8rKMJZ7B/AtmuHVE7T1YWck/pYVchuuX5JIzjo1KyY6f6WU99BHXBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1741
Received-SPF: pass client-ip=40.107.8.118;
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

On 25.11.2020 21:41, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 25.11.2020 16:08, Dr. David Alan Gilbert wrote:
>>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>>> In this particular implementation the same single migration
>>>> thread is responsible for both normal linear dirty page
>>>> migration and procesing UFFD page fault events.
>>>>
>>>> Processing write faults includes reading UFFD file descriptor,
>>>> finding respective RAM block and saving faulting page to
>>>> the migration stream. After page has been saved, write protection
>>>> can be removed. Since asynchronous version of qemu_put_buffer()
>>>> is expected to be used to save pages, we also have to flush
>>>> migraion stream prior to un-protecting saved memory range.
>>>>
>>>> Write protection is being removed for any previously protected
>>>> memory chunk that has hit the migration stream. That's valid
>>>> for pages from linear page scan along with write fault pages.
>>>>
>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>> ---
>>>>    migration/ram.c | 124 ++++++++++++++++++++++++++++++++++++++++++++----
>>>>    1 file changed, 115 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>> index 7f273c9996..08a1d7a252 100644
>>>> --- a/migration/ram.c
>>>> +++ b/migration/ram.c
>>>> @@ -314,6 +314,8 @@ struct RAMState {
>>>>        ram_addr_t last_page;
>>>>        /* last ram version we have seen */
>>>>        uint32_t last_version;
>>>> +    /* 'write-tracking' migration is enabled */
>>>> +    bool ram_wt_enabled;
>>>>        /* We are in the first round */
>>>>        bool ram_bulk_stage;
>>>>        /* The free page optimization is enabled */
>>>> @@ -574,8 +576,6 @@ static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
>>>>        return 0;
>>>>    }
>>>> -__attribute__ ((unused))
>>>> -static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
>>>>    __attribute__ ((unused))
>>>>    static bool uffd_poll_events(int uffd, int tmo);
>>>> @@ -1929,6 +1929,86 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>>>        return pages;
>>>>    }
>>>> +/**
>>>> + * ram_find_block_by_host_address: find RAM block containing host page
>>>> + *
>>>> + * Returns true if RAM block is found and pss->block/page are
>>>> + * pointing to the given host page, false in case of an error
>>>> + *
>>>> + * @rs: current RAM state
>>>> + * @pss: page-search-status structure
>>>> + */
>>>> +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
>>>> +        hwaddr page_address)
>>>> +{
>>>> +    bool found = false;
>>>> +
>>>> +    pss->block = rs->last_seen_block;
>>>> +    do {
>>>> +        if (page_address >= (hwaddr) pss->block->host &&
>>>> +            (page_address + TARGET_PAGE_SIZE) <=
>>>> +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
>>>> +            pss->page = (unsigned long)
>>>> +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
>>>> +            found = true;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        pss->block = QLIST_NEXT_RCU(pss->block, next);
>>>> +        if (!pss->block) {
>>>> +            /* Hit the end of the list */
>>>> +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>> +        }
>>>> +    } while (pss->block != rs->last_seen_block);
>>>> +
>>>> +    rs->last_seen_block = pss->block;
>>>> +    /*
>>>> +     * Since we are in the same loop with ram_find_and_save_block(),
>>>> +     * need to reset pss->complete_round after switching to
>>>> +     * other block/page in pss.
>>>> +     */
>>>> +    pss->complete_round = false;
>>>> +
>>>> +    return found;
>>>> +}
>>>> +
>>>> +/**
>>>> + * get_fault_page: try to get next UFFD write fault page and, if pending fault
>>>> + *   is found, put info about RAM block and block page into pss structure
>>>> + *
>>>> + * Returns true in case of UFFD write fault detected, false otherwise
>>>> + *
>>>> + * @rs: current RAM state
>>>> + * @pss: page-search-status structure
>>>> + *
>>>> + */
>>>> +static bool get_fault_page(RAMState *rs, PageSearchStatus *pss)
>>>> +{
>>>> +    struct uffd_msg uffd_msg;
>>>> +    hwaddr page_address;
>>>> +    int res;
>>>> +
>>>> +    if (!rs->ram_wt_enabled) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
>>>> +    if (res <= 0) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    page_address = uffd_msg.arg.pagefault.address;
>>>> +    if (!ram_find_block_by_host_address(rs, pss, page_address)) {
>>>> +        /* In case we couldn't find respective block, just unprotect faulting page */
>>>> +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
>>>> +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
>>>> +                     page_address);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>>    /**
>>>>     * ram_find_and_save_block: finds a dirty page and sends it to f
>>>>     *
>>>> @@ -1955,25 +2035,50 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>>>            return pages;
>>>>        }
>>>> +    if (!rs->last_seen_block) {
>>>> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>> +    }
>>>>        pss.block = rs->last_seen_block;
>>>>        pss.page = rs->last_page;
>>>>        pss.complete_round = false;
>>>> -    if (!pss.block) {
>>>> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
>>>> -    }
>>>> -
>>>>        do {
>>>> +        ram_addr_t page;
>>>> +        ram_addr_t page_to;
>>>> +
>>>>            again = true;
>>>> -        found = get_queued_page(rs, &pss);
>>>> -
>>>> +        /* In case of 'write-tracking' migration we first try
>>>> +         * to poll UFFD and get write page fault event */
>>>> +        found = get_fault_page(rs, &pss);
>>>> +        if (!found) {
>>>> +            /* No trying to fetch something from the priority queue */
>>>> +            found = get_queued_page(rs, &pss);
>>>> +        }
>>>>            if (!found) {
>>>>                /* priority queue empty, so just search for something dirty */
>>>>                found = find_dirty_block(rs, &pss, &again);
>>>>            }
>>>>            if (found) {
>>>> +            page = pss.page;
>>>>                pages = ram_save_host_page(rs, &pss, last_stage);
>>>> +            page_to = pss.page;
>>>> +
>>>> +            /* Check if page is from UFFD-managed region */
>>>> +            if (pss.block->flags & RAM_UF_WRITEPROTECT) {
>>>> +                hwaddr page_address = (hwaddr) pss.block->host +
>>>> +                        ((hwaddr) page << TARGET_PAGE_BITS);
>>>> +                hwaddr run_length = (hwaddr) (page_to - page + 1) << TARGET_PAGE_BITS;
>>>> +                int res;
>>>> +
>>>> +                /* Flush async buffers before un-protect */
>>>> +                qemu_fflush(rs->f);
>>>> +                /* Un-protect memory range */
>>>> +                res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
>>>> +                if (res < 0) {
>>>> +                    break;
>>>> +                }
>>>> +            }
>>>
>>> Please separate that out into a separate function.
>>>
>>> Dave
>>>
>>
>> You mean separate implementation of ram_find_and_save_block()?
> 
> No, I mean take that if (...WRITEPROTECT) { ..} block and put it in a
> function and call it from there, just to keep ram_find_and_save_block
> clean.
> 
> Dave
> 

Got it, ok.

Andrey

>> Andrey
>>
>>>>            }
>>>>        } while (!pages && again);
>>>> @@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
>>>>        rs->last_sent_block = NULL;
>>>>        rs->last_page = 0;
>>>>        rs->last_version = ram_list.version;
>>>> -    rs->ram_bulk_stage = true;
>>>> +    rs->ram_wt_enabled = migrate_track_writes_ram();
>>>> +    rs->ram_bulk_stage = !rs->ram_wt_enabled;
>>>>        rs->fpo_enabled = false;
>>>>    }
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

