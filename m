Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5592C4249
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:42:06 +0100 (CET)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khvzh-000350-06
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khvyQ-0002Sr-ST
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:40:46 -0500
Received: from mail-eopbgr130130.outbound.protection.outlook.com
 ([40.107.13.130]:31328 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khvyM-0002DV-KQ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:40:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTjKlUyWv+fBC2MewJU6KpEwjHshcXGffXNhZNO39Rtex+9VtbWlON/TCZxnr9y/xbDqiqv4+VKVqScDAU/3zJtZVCGpw0PB675o1mKrOO+mwEJqWqJ3iYDVK5LR6fECw2X5TLaBPfh3FuvPlSA5nuKzP2h2dRXWm5GGRW2WgpuRaZNxf7fm68kR/K3nwCEwn+1liMbiqqW3abotcw9fpfLaUYooKCfiX8HQ+/PSXFgtUm3OYjqbsxwOlnh2WWUbFxtuG0E2xUXA/MUS4w6m0qBHiH0j/Mohrv1Xe2gXzm+PCJZZhkkJ1g8oYOeWmdYMs3W0SNwOL8DEOXkm7iDrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di1AE3RlUCuJLggJ+pQImRWZLRbtiSBoQnUZWoEmwMk=;
 b=jFnt/Pmih2KTrhS7tnvR+6mT8gXra2rfsi2Oe03qTGdaItf5Ecu16kC+AoES9qdwEsCbyYDQgYV3v5G8PI1wi/phi7BcducwMNk92YjV6fKWgV1wPiIeJy1jJPhuk4KgxeWJCiOvFwncbHDKL0Rs87fv/H/VT7STthmC6nzNsY3bIfbEPM1a8vVN4uQOU4zuOoUrHD3/rsOmOJvgEfHLNSde2rkPvJiKSW4rd0uA2qPrEjlFteS0HFglTyA3NLD4aW9ebIQf5cZH6Fsoxb0Edi5pvEN+IqAFh3lNc+09IzRplP8GGqF2c/7RkXLkeQsnA9dnKsG78bqQs7t1GZSd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di1AE3RlUCuJLggJ+pQImRWZLRbtiSBoQnUZWoEmwMk=;
 b=NRQE4HCFnhnrQAVhykUadhNJLx9yzF/sSwvx3gvx961FLwZAd1NIjJFrxzvVwaGqg7Ms5NSRLQdI/3e6N2wcpxDW9HMThsOK1Hm5xK8Lq30ykUsd/+ieWqFYCtfSj/XXpyjU1aqxTXdA9qIukr7lim2tPAAkapzaNxq5V2SvePw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2608.eurprd08.prod.outlook.com
 (2603:10a6:800:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 14:40:37 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 14:40:37 +0000
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
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2d755397-4053-c883-3832-5d475c88b546@virtuozzo.com>
Date: Wed, 25 Nov 2020 17:40:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125130825.GE3222@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0108.eurprd03.prod.outlook.com
 (2603:10a6:208:69::49) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0108.eurprd03.prod.outlook.com (2603:10a6:208:69::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Wed, 25 Nov 2020 14:40:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf900b64-91d2-4534-c88c-08d8915012e6
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2608ABF702DFE29CD4343F139FFA0@VI1PR0802MB2608.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7x5dEIYOnqGLc46iNrsayPIeJP7mYDTPdhaISw9y3t7uASVnuqdSqEjbGPXMEgUUdH5JNCKSIn10RYljOPzeTQsyz8H78RYZNmCkdCg9MPe1ZPOnXNhTLjawWSHbtpX4YhqH4dbu8faam59Ke81QeSf5wSJcQbpAOai+3dciW6EuSH9IcG1kC0v49GMoiU8jERCiT2LRFhoIyQy6SXX14o1MkW3Nhveguei0OGHpXfZBVF4hLjaw/zEJ41vpi/iaz2pmNuC1B4PwRMqsbsRcu+8V3kfvm3s48sv//uulWaQroXt1L77kX5B63c23wnY5RiE2GVUTdvEzX/OwocJHzUWKVIRoxC7lOz44PCAAOEeIowrrlvtURpSTJb/RnP2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(376002)(396003)(31696002)(26005)(54906003)(8936002)(53546011)(2906002)(4326008)(66556008)(8676002)(186003)(16526019)(66476007)(316002)(5660300002)(16576012)(2616005)(6486002)(66946007)(44832011)(956004)(36756003)(52116002)(6916009)(83380400001)(86362001)(478600001)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZU9PT3k4WElRN3ArNU56MEhUTm40am5HY2FYRWRmRGlYbEY2YWgyQitiblQv?=
 =?utf-8?B?dURpQU9ZVmhIaWxDTW8xNDVwLzg2aC90QXRrZWlHWlZ4ZitSUkJ4RGZsUHhM?=
 =?utf-8?B?VHNRK01uUlZtQTNHMVJQc1B1ZFRubnZ0UGJkMHpZNHNSb1NZM3RCRG9oQzNB?=
 =?utf-8?B?UlUrWHB3b0VJQmR1M1JhS2lWVlE0Sll6UTY1SWMzSzFhVlJ3RGJmelhKVENH?=
 =?utf-8?B?ejR6WlJ0UkpYdGo2TmNmWXROVEg1UmNNMk1GTW1QU0pnWnZVMVVNZG8rVGto?=
 =?utf-8?B?WjZxOHAyRFZhUzV2NWUvNWFSUEU0SEppWVU1ZGJVZHJMOHB4MGtzcjZzTVNZ?=
 =?utf-8?B?Wm0yaWhFT2d0WGdWc0U4Uko1a0RVUzZUV0xGRzRHV1Bvb2pPVzJkTlpoWWdp?=
 =?utf-8?B?SG90UHlyVXhLaEZIbWdKS0hHSzZCcG9EWjVmdGQ4bWowUmFXd3BhVktFS3Yz?=
 =?utf-8?B?c3V3Vzdwb1BSaGNyaTM0Z3ZaOEJMamFDVDU3UW1RZ05QRlNBYXlQSlhJQU0x?=
 =?utf-8?B?WE1iNVVMcDdNMktrOEdpcndZWW5kbkJVZk96Tms5L1BreG1oY0w1Vllveldi?=
 =?utf-8?B?aVVBMTF4VlFCYk5wZy9TZnFDMW9LeEkvOE5kdC9BeTY4MHI1ZjM5c0FwZURJ?=
 =?utf-8?B?a0ZvdXBWVXUxeU0vR3RGeW9EMlcyMzBiSDl5dTdnNnVtMlJNN2lSTGZBRTdS?=
 =?utf-8?B?bUM4elJxckhVTGRBRVo5c25aVW9kRHZGNVFMMERGbVdRbWthcHdQWmtCMkRZ?=
 =?utf-8?B?MVI3bytwN3JVcjlNT09jVFpjNUVpbmczSWhlUzVza1lZa0MvTFhWU1ZVRDRn?=
 =?utf-8?B?eWlkd2t0dlc0MXZsRllpOTNRWVBZNksySnBKTnRLZWFsWkdITDdzSC92TFF5?=
 =?utf-8?B?MXFiLzkvOGVaNnpNR2xvM0o4RmRscTVWZ1NtNEV3S2Ewa3pNZmdPYUE4ZkYr?=
 =?utf-8?B?R1k2RjNodHRpNnhJOTAybmdHUjlVQ3hOdUZnYnpsbEwzOTJWVk5xOGg1T2dp?=
 =?utf-8?B?cmFaZlNqNDEyT1lSVjl3bmx1ZVBnazVOQWFGSGlvR1JZY3RXV3VPWHltbG5J?=
 =?utf-8?B?NW51UkxseGFTelNxMlhDa2hMSUhWVmRtSE1wV21yY2tYcGtmMVhtNWo5MWxC?=
 =?utf-8?B?VVpWcUw5Y0JJVDZuc1JaSW9uVEcvZjUxWmlWYTBuOU9rTllUT0g3c2RCNTdq?=
 =?utf-8?B?YkVQZmREVGF3b2Q1NmVRMjlrb3hKelNQcU5DdVlZdUE2ZGQzMGZlUjZZR3ZY?=
 =?utf-8?B?cUR6ODBoM21meUxoaWxJRWpqMXBjdjVDYkdwdjA4TjJMMUt3bEE2TXFZc0dr?=
 =?utf-8?Q?p8hbDDoRm46Fk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf900b64-91d2-4534-c88c-08d8915012e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 14:40:37.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQxyfWe7pJOxRBokplcuuZxKfL8KFf8dUWDTyJyeVxOXEn8kdHoYsKrcrsp8aUPcSdJ9S2IK0BC3p2fCohzxh68issvoYsLohK+f8Ui4e8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2608
Received-SPF: pass client-ip=40.107.13.130;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

On 25.11.2020 16:08, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
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
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/ram.c | 124 ++++++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 115 insertions(+), 9 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 7f273c9996..08a1d7a252 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -314,6 +314,8 @@ struct RAMState {
>>       ram_addr_t last_page;
>>       /* last ram version we have seen */
>>       uint32_t last_version;
>> +    /* 'write-tracking' migration is enabled */
>> +    bool ram_wt_enabled;
>>       /* We are in the first round */
>>       bool ram_bulk_stage;
>>       /* The free page optimization is enabled */
>> @@ -574,8 +576,6 @@ static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
>>       return 0;
>>   }
>>   
>> -__attribute__ ((unused))
>> -static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
>>   __attribute__ ((unused))
>>   static bool uffd_poll_events(int uffd, int tmo);
>>   
>> @@ -1929,6 +1929,86 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       return pages;
>>   }
>>   
>> +/**
>> + * ram_find_block_by_host_address: find RAM block containing host page
>> + *
>> + * Returns true if RAM block is found and pss->block/page are
>> + * pointing to the given host page, false in case of an error
>> + *
>> + * @rs: current RAM state
>> + * @pss: page-search-status structure
>> + */
>> +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
>> +        hwaddr page_address)
>> +{
>> +    bool found = false;
>> +
>> +    pss->block = rs->last_seen_block;
>> +    do {
>> +        if (page_address >= (hwaddr) pss->block->host &&
>> +            (page_address + TARGET_PAGE_SIZE) <=
>> +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
>> +            pss->page = (unsigned long)
>> +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
>> +            found = true;
>> +            break;
>> +        }
>> +
>> +        pss->block = QLIST_NEXT_RCU(pss->block, next);
>> +        if (!pss->block) {
>> +            /* Hit the end of the list */
>> +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>> +        }
>> +    } while (pss->block != rs->last_seen_block);
>> +
>> +    rs->last_seen_block = pss->block;
>> +    /*
>> +     * Since we are in the same loop with ram_find_and_save_block(),
>> +     * need to reset pss->complete_round after switching to
>> +     * other block/page in pss.
>> +     */
>> +    pss->complete_round = false;
>> +
>> +    return found;
>> +}
>> +
>> +/**
>> + * get_fault_page: try to get next UFFD write fault page and, if pending fault
>> + *   is found, put info about RAM block and block page into pss structure
>> + *
>> + * Returns true in case of UFFD write fault detected, false otherwise
>> + *
>> + * @rs: current RAM state
>> + * @pss: page-search-status structure
>> + *
>> + */
>> +static bool get_fault_page(RAMState *rs, PageSearchStatus *pss)
>> +{
>> +    struct uffd_msg uffd_msg;
>> +    hwaddr page_address;
>> +    int res;
>> +
>> +    if (!rs->ram_wt_enabled) {
>> +        return false;
>> +    }
>> +
>> +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
>> +    if (res <= 0) {
>> +        return false;
>> +    }
>> +
>> +    page_address = uffd_msg.arg.pagefault.address;
>> +    if (!ram_find_block_by_host_address(rs, pss, page_address)) {
>> +        /* In case we couldn't find respective block, just unprotect faulting page */
>> +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
>> +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
>> +                     page_address);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /**
>>    * ram_find_and_save_block: finds a dirty page and sends it to f
>>    *
>> @@ -1955,25 +2035,50 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>           return pages;
>>       }
>>   
>> +    if (!rs->last_seen_block) {
>> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
>> +    }
>>       pss.block = rs->last_seen_block;
>>       pss.page = rs->last_page;
>>       pss.complete_round = false;
>>   
>> -    if (!pss.block) {
>> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
>> -    }
>> -
>>       do {
>> +        ram_addr_t page;
>> +        ram_addr_t page_to;
>> +
>>           again = true;
>> -        found = get_queued_page(rs, &pss);
>> -
>> +        /* In case of 'write-tracking' migration we first try
>> +         * to poll UFFD and get write page fault event */
>> +        found = get_fault_page(rs, &pss);
>> +        if (!found) {
>> +            /* No trying to fetch something from the priority queue */
>> +            found = get_queued_page(rs, &pss);
>> +        }
>>           if (!found) {
>>               /* priority queue empty, so just search for something dirty */
>>               found = find_dirty_block(rs, &pss, &again);
>>           }
>>   
>>           if (found) {
>> +            page = pss.page;
>>               pages = ram_save_host_page(rs, &pss, last_stage);
>> +            page_to = pss.page;
>> +
>> +            /* Check if page is from UFFD-managed region */
>> +            if (pss.block->flags & RAM_UF_WRITEPROTECT) {
>> +                hwaddr page_address = (hwaddr) pss.block->host +
>> +                        ((hwaddr) page << TARGET_PAGE_BITS);
>> +                hwaddr run_length = (hwaddr) (page_to - page + 1) << TARGET_PAGE_BITS;
>> +                int res;
>> +
>> +                /* Flush async buffers before un-protect */
>> +                qemu_fflush(rs->f);
>> +                /* Un-protect memory range */
>> +                res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
>> +                if (res < 0) {
>> +                    break;
>> +                }
>> +            }
> 
> Please separate that out into a separate function.
> 
> Dave
> 

You mean separate implementation of ram_find_and_save_block()?

Andrey

>>           }
>>       } while (!pages && again);
>>   
>> @@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
>>       rs->last_sent_block = NULL;
>>       rs->last_page = 0;
>>       rs->last_version = ram_list.version;
>> -    rs->ram_bulk_stage = true;
>> +    rs->ram_wt_enabled = migrate_track_writes_ram();
>> +    rs->ram_bulk_stage = !rs->ram_wt_enabled;
>>       rs->fpo_enabled = false;
>>   }
>>   
>> -- 
>> 2.25.1
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

