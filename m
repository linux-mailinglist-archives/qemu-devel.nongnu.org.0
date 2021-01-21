Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD32FE5BC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:05:03 +0100 (CET)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Vtm-0005P1-Qj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2VsC-0004oQ-DU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:03:27 -0500
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:15105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2Vs5-0000HL-QX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:03:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCxZZOjWydn25maodCbLr2PzWgIbGUE9CpGpdEn31roHgJDZyNtr9hNY6HUxiYVdp+vvPVsN63CAMPzhm2c9r9OgJmHEptiDPIwuQav1dnHXDvW2aMz4k+9UYDIJHcmDFWSNsj9B1aip3SEwRSY9nTUTrYoLHbH9Mty/n8qmnzlU7Bno048roWjtfeDHX9LL9916Q5lwHTGeQg30r83WJuXGKAbs7fbgcZf538QwI00D5QIdKUzJHCLUQpi04cgFomEDRe+/DmpRF5XcO0gkQqlAGjN0Ji4fUN0tY3ZTcCQpVXd3pP70oWcQCOCqSuUXQGOLW6DuCaxIUN88EC5SUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJxJoP7Q5ReEP1xorWMl8J3N9Wo61BxLaNxysuhKwo=;
 b=krN3Js+PIcYVzcYCrMXRZyd97C7F4CSnt8kvyoyXuQzuLMjApf0+3wcB0VzDqvFzmZqrgd3LGfvBeVPRz+qksEnW2+/nBq0UJ9SCv/zA+AvAvWcam8+78Lz48QcE2ypOfxsZ0hyyBeYbvHAB7CYc2/8H6qbd9DNbpOz8QC4+cfSwSVvuuTCTVZgJkadxOdAwpIESLMR5n8wjDYhIjb1baAUON/AG8PUy6wlIQk9JVrdz5W+07+zZwm5ceW+NSnuK/LuaH+DpFfW27vjh9nt3nJ5GePcoQlICkO0QN5F7+ojAqO19Bqm5BOVGurJXIvIBMhUo+vJ0sMn/lytcIoxcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJxJoP7Q5ReEP1xorWMl8J3N9Wo61BxLaNxysuhKwo=;
 b=SracYsh3Ih4s6JLRk7z3LZZAn6Q97/rWEFYzutFl5V/F19WqgMhaHmhCquhSLJLvTPz41fmxMMWqhUgRiexLRkzq3Om2CPJECWrJOvIzZ5ZLAJUG/yTjrD3nLl6tRcHTU2W3w5YK/x73ZcOSEOVw9QZlM/Czf6O8OxYGglem2SU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4354.eurprd08.prod.outlook.com (2603:10a6:208:13e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 08:48:10 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 08:48:10 +0000
Subject: Re: [PATCH v11 3/5] migration: support UFFD write fault processing in
 ram_save_iterate()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-4-andrey.gruzdev@virtuozzo.com>
 <20210119174935.GI3008@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <46b04ee1-e474-fcd8-640c-34398f74db21@virtuozzo.com>
Date: Thu, 21 Jan 2021 11:48:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210119174935.GI3008@work-vm>
Content-Type: multipart/alternative;
 boundary="------------EE91B1735D871D2F7506D030"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:207:5::34) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR03CA0076.eurprd03.prod.outlook.com (2603:10a6:207:5::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 08:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3351edcf-392c-41d6-e2b2-08d8bde947e4
X-MS-TrafficTypeDiagnostic: AM0PR08MB4354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4354288F65F113A9739FE8D19FA10@AM0PR08MB4354.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIjR4gTqZgxSXmb64rqfmexJMOcPA1yth/SGlOl8GemCSxdKUFhL4B7QZP9o18Ijc6E/YbJTKAgWEkTd+an2dIy1gvb1zaLPRI7uJvozik10zsipcULIx0k3Mt8dK3JZaOQ2PBN4ohBwDmy6mZDRI5pWeOmIMzqat8eNtJaJLybOQA0gp77uVleLA66LiO6zsnxBoavXkqD+QDweCa7SGSKXJBQeDo9tkvRqwiVwGFQ/76BcHN6b5W4uiWw8ApK6EouCMlu33TZUn1W16KgQAnkUwBtBaUNQXeZ9wKtLoAgdjSJTX/7/FVqUSVtgN9DU4QVFRIoDXez35QTqifQ+o5MjrX0ZyZtUQvTpPk6RDUwmhC1w+mt73r6/Y0OtudX+Y7stXEerWi8/+RuaNVSNM4cSdgQFXtT3F8YLBogWTsByVEC/F7oSLz7oDmdZYuXi0dFL6biyODiZU4JLV5VY/XhSv7wGQPAs6PZdIK6oX/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(33964004)(86362001)(6486002)(5660300002)(53546011)(66946007)(6916009)(30864003)(8676002)(36756003)(2906002)(52116002)(478600001)(83380400001)(956004)(8936002)(16526019)(66476007)(54906003)(66556008)(4326008)(44832011)(186003)(31696002)(16576012)(31686004)(26005)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFA3b2E2UU5WbFRrSExkZVVrRUI1U3FWRGJ5VTJPVnJnaCtYeVRuUnJTL3Zy?=
 =?utf-8?B?WDZKNzUxREg0dFR5UHMvMWsxQ2x3cW1ZOFV1RVJXM3R1OFlnaSt3K3BmZzBX?=
 =?utf-8?B?M0dVRk1iQ3JWTSsvQVVVNkJqbXhQVU1HWXhyQXpPaHpjY3RVUHNpR003VEU1?=
 =?utf-8?B?MXVuU0RsOW80ZVEwbnhXcjJtc0NaT3NDTGlCWTRIZ2EwbnlPVE9QUkMyYXM0?=
 =?utf-8?B?TVo3WHpWNkFWK3NPTms1Nk4vaUhBcVZhTWxqWUNHTUE1N3FTRVd0Q0o1MGdN?=
 =?utf-8?B?SkpUNXYyRWlJRjVLNW8zQVZMem5DUkwwZ3Back04b3h2YmJLT0tuaHp0VldD?=
 =?utf-8?B?eGJVZHhqZkZFcjQ2RmVrd1RlNjdFME1JZTQ2OXBKRE9yV3Q0NVk5aG5LWGNN?=
 =?utf-8?B?dkFnL3NvdUFRd1A0UUhHOTVETldtaDJSMWErSUlqNDBjMjRtYTdCcitBRGNy?=
 =?utf-8?B?amtZWWtQb3M3OEIzbk5MMGNMMElqSnQ1amEwNGZ2b3VEK2xJL1BYUnV2eXU3?=
 =?utf-8?B?bS9kdXl0cDFjK3V4NDNCUnRJcDg5ZHZINWNaZUp4cGZ4YzEzRTdsQXhOQThF?=
 =?utf-8?B?Z0NidzhiQ1BuK1d0ME9lLzRkcDdYcmJrWFFwdGQ4OTYvYml4aWZIRGVCK0d3?=
 =?utf-8?B?L1dRQ29WZDhZT0ozYiszdTUxblF4djdTMFRTRWZidHZUcnk2OE8yaVNJcmly?=
 =?utf-8?B?VERGYVd0UWJiejY1dUl1aExOaUFMVDJSbVdvbXY0R05YY1BnMXJqQWw1VTNK?=
 =?utf-8?B?S0NNZGdDd0FrUGJ1cSswRG50NFc0YU9tRW8wVXQ5Mk9nMU5LSWx5bEZISCt5?=
 =?utf-8?B?K3ZmVVJSbnpPS0R5eUR4TE1UUVpQTnBSOEQwQzN5TjNZaCtoQjJZK3psSjM1?=
 =?utf-8?B?SWY3UFBnc05HRTBtWlh1MVIvNW5uMDFlRnJwaVNIUURiMHppNmNyZzh0MXRB?=
 =?utf-8?B?SWRDTVNsWnlLVE5FYjc4U1VpUFMxSlRmTWQ4MDF0UnRNUUxEL2J6dTBIUGl4?=
 =?utf-8?B?b0t2VytyU2o2SWV5ZjFrNUhCdm00MTZEcXY4WjB1QUdxTG00Sk94Y01EZ3o3?=
 =?utf-8?B?REM2SGJmSXJsdE5rUS9kck5qU2FnNEFRSW1BNnlGRTE2ZU5zdllUczlRVTNG?=
 =?utf-8?B?NWk5STlORjlBajgzd2VrbU9JSW85ZERKRno3SytOeGNXRVU0VDNTQkhMd1la?=
 =?utf-8?B?WDQrMmhJb3ZUdGsvZkNjSlJDT2pPRExkNGlKVnpXcEQzaWxDTHhkV1RSUXcw?=
 =?utf-8?B?UWxWend0ZXVtN2lWaFVDTlQrNnRMdmFyeUJ6dTZYRG5LN1dOeXNJR0lRbVJF?=
 =?utf-8?Q?uYRXd23Rka+D4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3351edcf-392c-41d6-e2b2-08d8bde947e4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 08:48:10.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XImkZO8ufKJte36z9plQFzz0pJcnG19t688x16eZ8gP2OFmafTJCn5gcwSpFHJ9YU4t/O2VZ8UsEeEM9tT/SxUfQVp+F8SMJIDlj8DOIwlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4354
Received-SPF: pass client-ip=40.107.20.98;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

--------------EE91B1735D871D2F7506D030
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.01.2021 20:49, Dr. David Alan Gilbert wrote:
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
>> Acked-by: Peter Xu <peterx@redhat.com>
> I think this is OK, so:
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> I think I'd have preferred to have kept the #ifdef LINUX's out of there,
> and I suspect using the opaque's for hte pre/post hook is overly
> complex; but other wise OK.
>
> Dave

Mm, I think it's impossible to completely move #ifdef LINUX out of there,
but I suspect all #ifdef LINUX code can be moved to a single place with
stubs for the #else case.. Suppose it would be better then now.
For pre/post hooks - not too complex, but for single #ifdef section it really
looks better to move this stuff to ram_save_host_page().

Andrey

>> ---
>>   include/exec/memory.h  |   7 ++
>>   migration/ram.c        | 269 +++++++++++++++++++++++++++++++++++++++--
>>   migration/ram.h        |   2 +
>>   migration/trace-events |   2 +
>>   4 files changed, 272 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index b76b1256bf..1aa1c6a3f4 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -150,6 +150,13 @@ typedef struct IOMMUTLBEvent {
>>   #define RAM_PMEM (1 << 5)
>>   
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
>> diff --git a/migration/ram.c b/migration/ram.c
>> index ae8de17153..5707382db1 100644
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
>> @@ -1434,6 +1441,40 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>>       return block;
>>   }
>>   
>> +#ifdef CONFIG_LINUX
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
>> +    void *page_address;
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
>> +    page_address = (void *) uffd_msg.arg.pagefault.address;
>> +    bs = qemu_ram_block_from_host(page_address, false, offset);
>> +    assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
>> +    return bs;
>> +}
>> +#endif /* CONFIG_LINUX */
>> +
>>   /**
>>    * get_queued_page: unqueue a page from the postcopy requests
>>    *
>> @@ -1473,6 +1514,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
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
>> @@ -1746,6 +1797,53 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
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
>> +    *(unsigned long *) opaque = pss->page;
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
>> +#ifdef CONFIG_LINUX
>> +    /* Check if page is from UFFD-managed region. */
>> +    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
>> +        unsigned long page_from = (unsigned long) opaque;
>> +
>> +        void *page_address = pss->block->host + (page_from << TARGET_PAGE_BITS);
>> +        uint64_t run_length = (pss->page - page_from + 1) << TARGET_PAGE_BITS;
>> +        int res;
>> +
>> +        /* Flush async buffers before un-protect. */
>> +        qemu_fflush(rs->f);
>> +        /* Un-protect memory range. */
>> +        res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>> +                false, false);
>> +        /* We don't want to override existing error from ram_save_host_page(). */
>> +        if (res < 0 && *res_override >= 0) {
>> +            *res_override = res;
>> +        }
>> +    }
>> +#endif /* CONFIG_LINUX */
>> +}
>> +
>>   /**
>>    * ram_find_and_save_block: finds a dirty page and sends it to f
>>    *
>> @@ -1790,7 +1888,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>>           }
>>   
>>           if (found) {
>> +            void *opaque;
>> +
>> +            ram_save_host_page_pre(rs, &pss, &opaque);
>>               pages = ram_save_host_page(rs, &pss, last_stage);
>> +            ram_save_host_page_post(rs, &pss, opaque, &pages);
>>           }
>>       } while (!pages && again);
>>   
>> @@ -1880,10 +1982,13 @@ static void ram_save_cleanup(void *opaque)
>>       RAMState **rsp = opaque;
>>       RAMBlock *block;
>>   
>> -    /* caller have hold iothread lock or is in a bh, so there is
>> -     * no writing race against the migration bitmap
>> -     */
>> -    memory_global_dirty_log_stop();
>> +    /* We don't use dirty log with background snapshots */
>> +    if (!migrate_background_snapshot()) {
>> +        /* caller have hold iothread lock or is in a bh, so there is
>> +         * no writing race against the migration bitmap
>> +         */
>> +        memory_global_dirty_log_stop();
>> +    }
>>   
>>       RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>>           g_free(block->clear_bmap);
>> @@ -2343,8 +2448,11 @@ static void ram_init_bitmaps(RAMState *rs)
>>   
>>       WITH_RCU_READ_LOCK_GUARD() {
>>           ram_list_init_bitmaps();
>> -        memory_global_dirty_log_start();
>> -        migration_bitmap_sync_precopy(rs);
>> +        /* We don't use dirty log with background snapshots */
>> +        if (!migrate_background_snapshot()) {
>> +            memory_global_dirty_log_start();
>> +            migration_bitmap_sync_precopy(rs);
>> +        }
>>       }
>>       qemu_mutex_unlock_ramlist();
>>       qemu_mutex_unlock_iothread();
>> @@ -3794,7 +3902,14 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>>    */
>>   bool ram_write_tracking_available(void)
>>   {
>> -    /* TODO: implement */
>> +#ifdef CONFIG_LINUX
>> +    uint64_t uffd_features;
>> +    int res;
>> +
>> +    res = uffd_query_features(&uffd_features);
>> +    return (res == 0 &&
>> +            (uffd_features & UFFD_FEATURE_PAGEFAULT_FLAG_WP) != 0);
>> +#endif
>>       return false;
>>   }
>>   
>> @@ -3805,10 +3920,148 @@ bool ram_write_tracking_available(void)
>>    */
>>   bool ram_write_tracking_compatible(void)
>>   {
>> -    /* TODO: implement */
>> +#ifdef CONFIG_LINUX
>> +    const uint64_t uffd_ioctls_mask = BIT(_UFFDIO_WRITEPROTECT);
>> +    int uffd_fd;
>> +    RAMBlock *bs;
>> +    bool ret = false;
>> +
>> +    /* Open UFFD file descriptor */
>> +    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, false);
>> +    if (uffd_fd < 0) {
>> +        return false;
>> +    }
>> +
>> +    RCU_READ_LOCK_GUARD();
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        uint64_t uffd_ioctls;
>> +
>> +        /* Nothing to do with read-only and MMIO-writable regions */
>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>> +            continue;
>> +        }
>> +        /* Try to register block memory via UFFD-IO to track writes */
>> +        if (uffd_register_memory(uffd_fd, bs->host, bs->max_length,
>> +                UFFDIO_REGISTER_MODE_WP, &uffd_ioctls)) {
>> +            goto out;
>> +        }
>> +        if ((uffd_ioctls & uffd_ioctls_mask) != uffd_ioctls_mask) {
>> +            goto out;
>> +        }
>> +    }
>> +    ret = true;
>> +
>> +out:
>> +    uffd_close_fd(uffd_fd);
>> +    return ret;
>> +#endif
>>       return false;
>>   }
>>   
>> +/*
>> + * ram_write_tracking_start: start UFFD-WP memory tracking
>> + *
>> + * Returns 0 for success or negative value in case of error
>> + */
>> +int ram_write_tracking_start(void)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    int uffd_fd;
>> +    RAMState *rs = ram_state;
>> +    RAMBlock *bs;
>> +
>> +    /* Open UFFD file descriptor */
>> +    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, true);
>> +    if (uffd_fd < 0) {
>> +        return uffd_fd;
>> +    }
>> +    rs->uffdio_fd = uffd_fd;
>> +
>> +    RCU_READ_LOCK_GUARD();
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        /* Nothing to do with read-only and MMIO-writable regions */
>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>> +            continue;
>> +        }
>> +
>> +        /* Register block memory with UFFD to track writes */
>> +        if (uffd_register_memory(rs->uffdio_fd, bs->host,
>> +                bs->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
>> +            goto fail;
>> +        }
>> +        /* Apply UFFD write protection to the block memory range */
>> +        if (uffd_change_protection(rs->uffdio_fd, bs->host,
>> +                bs->max_length, true, false)) {
>> +            goto fail;
>> +        }
>> +        bs->flags |= RAM_UF_WRITEPROTECT;
>> +        memory_region_ref(bs->mr);
>> +
>> +        trace_ram_write_tracking_ramblock_start(bs->idstr, bs->page_size,
>> +                bs->host, bs->max_length);
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
>> +        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
>> +        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
>> +        /* Cleanup flags and remove reference */
>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>> +        memory_region_unref(bs->mr);
>> +    }
>> +
>> +    uffd_close_fd(uffd_fd);
>> +#endif /* CONFIG_LINUX */
>> +    rs->uffdio_fd = -1;
>> +    return -1;
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
>> +
>> +    RCU_READ_LOCK_GUARD();
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
>> +            continue;
>> +        }
>> +        /* Remove protection and unregister all affected RAM blocks */
>> +        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
>> +        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
>> +
>> +        trace_ram_write_tracking_ramblock_stop(bs->idstr, bs->page_size,
>> +                bs->host, bs->max_length);
>> +
>> +        /* Cleanup flags and remove reference */
>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>> +        memory_region_unref(bs->mr);
>> +    }
>> +
>> +    /* Finally close UFFD file descriptor */
>> +    uffd_close_fd(rs->uffdio_fd);
>> +    rs->uffdio_fd = -1;
>> +#endif /* CONFIG_LINUX */
>> +}
>> +
>>   static SaveVMHandlers savevm_ram_handlers = {
>>       .save_setup = ram_save_setup,
>>       .save_live_iterate = ram_save_iterate,
>> diff --git a/migration/ram.h b/migration/ram.h
>> index 1a9ff90304..c25540cb93 100644
>> --- a/migration/ram.h
>> +++ b/migration/ram.h
>> @@ -82,5 +82,7 @@ void colo_incoming_start_dirty_log(void);
>>   /* Background snapshot */
>>   bool ram_write_tracking_available(void);
>>   bool ram_write_tracking_compatible(void);
>> +int ram_write_tracking_start(void);
>> +void ram_write_tracking_stop(void);
>>   
>>   #endif
>> diff --git a/migration/trace-events b/migration/trace-events
>> index 75de5004ac..668c562fed 100644
>> --- a/migration/trace-events
>> +++ b/migration/trace-events
>> @@ -111,6 +111,8 @@ save_xbzrle_page_skipping(void) ""
>>   save_xbzrle_page_overflow(void) ""
>>   ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRIu64 " milliseconds, %d iterations"
>>   ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
>> +ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>> +ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>>   
>>   # multifd.c
>>   multifd_new_send_channel_async(uint8_t id) "channel %d"
>> -- 
>> 2.25.1
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------EE91B1735D871D2F7506D030
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 19.01.2021 20:49, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119174935.GI3008@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In this particular implementation the same single migration
thread is responsible for both normal linear dirty page
migration and procesing UFFD page fault events.

Processing write faults includes reading UFFD file descriptor,
finding respective RAM block and saving faulting page to
the migration stream. After page has been saved, write protection
can be removed. Since asynchronous version of qemu_put_buffer()
is expected to be used to save pages, we also have to flush
migraion stream prior to un-protecting saved memory range.

Write protection is being removed for any previously protected
memory chunk that has hit the migration stream. That's valid
for pages from linear page scan along with write fault pages.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
Acked-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think this is OK, so:

Reviewed-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

I think I'd have preferred to have kept the #ifdef LINUX's out of there,
and I suspect using the opaque's for hte pre/post hook is overly
complex; but other wise OK.

Dave
</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap="">Mm, I think it's impossible to completely move #ifdef LINUX out of there,
but I suspect all #ifdef LINUX code can be moved to a single place with
stubs for the #else case.. Suppose it would be better then now.
For pre/post hooks - not too complex, but for single #ifdef section it really
looks better to move this stuff to ram_save_host_page()<span style="color:#00627a;">.
</span></pre>
    <pre>Andrey
</pre>
    <blockquote type="cite" cite="mid:20210119174935.GI3008@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 include/exec/memory.h  |   7 ++
 migration/ram.c        | 269 +++++++++++++++++++++++++++++++++++++++--
 migration/ram.h        |   2 +
 migration/trace-events |   2 +
 4 files changed, 272 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b76b1256bf..1aa1c6a3f4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -150,6 +150,13 @@ typedef struct IOMMUTLBEvent {
 #define RAM_PMEM (1 &lt;&lt; 5)
 
 
+/*
+ * UFFDIO_WRITEPROTECT is used on this RAMBlock to
+ * support 'write-tracking' migration type.
+ * Implies ram_state-&gt;ram_wt_enabled.
+ */
+#define RAM_UF_WRITEPROTECT (1 &lt;&lt; 6)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/migration/ram.c b/migration/ram.c
index ae8de17153..5707382db1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -56,6 +56,11 @@
 #include &quot;savevm.h&quot;
 #include &quot;qemu/iov.h&quot;
 #include &quot;multifd.h&quot;
+#include &quot;sysemu/runstate.h&quot;
+
+#ifdef CONFIG_LINUX
+#include &quot;qemu/userfaultfd.h&quot;
+#endif
 
 /***********************************************************/
 /* ram save/restore */
@@ -298,6 +303,8 @@ struct RAMSrcPageRequest {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /* UFFD file descriptor, used in 'write-tracking' migration */
+    int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
     /* Last block from where we have sent data */
@@ -1434,6 +1441,40 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     return block;
 }
 
+#ifdef CONFIG_LINUX
+/**
+ * poll_fault_page: try to get next UFFD write fault page and, if pending fault
+ *   is found, return RAM block pointer and page offset
+ *
+ * Returns pointer to the RAMBlock containing faulting page,
+ *   NULL if no write faults are pending
+ *
+ * @rs: current RAM state
+ * @offset: page offset from the beginning of the block
+ */
+static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
+{
+    struct uffd_msg uffd_msg;
+    void *page_address;
+    RAMBlock *bs;
+    int res;
+
+    if (!migrate_background_snapshot()) {
+        return NULL;
+    }
+
+    res = uffd_read_events(rs-&gt;uffdio_fd, &amp;uffd_msg, 1);
+    if (res &lt;= 0) {
+        return NULL;
+    }
+
+    page_address = (void *) uffd_msg.arg.pagefault.address;
+    bs = qemu_ram_block_from_host(page_address, false, offset);
+    assert(bs &amp;&amp; (bs-&gt;flags &amp; RAM_UF_WRITEPROTECT) != 0);
+    return bs;
+}
+#endif /* CONFIG_LINUX */
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1473,6 +1514,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 
     } while (block &amp;&amp; !dirty);
 
+#ifdef CONFIG_LINUX
+    if (!block) {
+        /*
+         * Poll write faults too if background snapshot is enabled; that's
+         * when we have vcpus got blocked by the write protected pages.
+         */
+        block = poll_fault_page(rs, &amp;offset);
+    }
+#endif /* CONFIG_LINUX */
+
     if (block) {
         /*
          * As soon as we start servicing pages out of order, then we have
@@ -1746,6 +1797,53 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     return pages;
 }
 
+/**
+ * ram_save_host_page_pre: ram_save_host_page() pre-notifier
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ * @opaque: pointer to receive opaque context value
+ */
+static inline
+void ram_save_host_page_pre(RAMState *rs, PageSearchStatus *pss, void **opaque)
+{
+    *(unsigned long *) opaque = pss-&gt;page;
+}
+
+/**
+ * ram_save_host_page_post: ram_save_host_page() post-notifier
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ * @opaque: opaque context value
+ * @res_override: pointer to the return value of ram_save_host_page(),
+ *   overwritten in case of an error
+ */
+static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
+        void *opaque, int *res_override)
+{
+#ifdef CONFIG_LINUX
+    /* Check if page is from UFFD-managed region. */
+    if (pss-&gt;block-&gt;flags &amp; RAM_UF_WRITEPROTECT) {
+        unsigned long page_from = (unsigned long) opaque;
+
+        void *page_address = pss-&gt;block-&gt;host + (page_from &lt;&lt; TARGET_PAGE_BITS);
+        uint64_t run_length = (pss-&gt;page - page_from + 1) &lt;&lt; TARGET_PAGE_BITS;
+        int res;
+
+        /* Flush async buffers before un-protect. */
+        qemu_fflush(rs-&gt;f);
+        /* Un-protect memory range. */
+        res = uffd_change_protection(rs-&gt;uffdio_fd, page_address, run_length,
+                false, false);
+        /* We don't want to override existing error from ram_save_host_page(). */
+        if (res &lt; 0 &amp;&amp; *res_override &gt;= 0) {
+            *res_override = res;
+        }
+    }
+#endif /* CONFIG_LINUX */
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -1790,7 +1888,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         }
 
         if (found) {
+            void *opaque;
+
+            ram_save_host_page_pre(rs, &amp;pss, &amp;opaque);
             pages = ram_save_host_page(rs, &amp;pss, last_stage);
+            ram_save_host_page_post(rs, &amp;pss, opaque, &amp;pages);
         }
     } while (!pages &amp;&amp; again);
 
@@ -1880,10 +1982,13 @@ static void ram_save_cleanup(void *opaque)
     RAMState **rsp = opaque;
     RAMBlock *block;
 
-    /* caller have hold iothread lock or is in a bh, so there is
-     * no writing race against the migration bitmap
-     */
-    memory_global_dirty_log_stop();
+    /* We don't use dirty log with background snapshots */
+    if (!migrate_background_snapshot()) {
+        /* caller have hold iothread lock or is in a bh, so there is
+         * no writing race against the migration bitmap
+         */
+        memory_global_dirty_log_stop();
+    }
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         g_free(block-&gt;clear_bmap);
@@ -2343,8 +2448,11 @@ static void ram_init_bitmaps(RAMState *rs)
 
     WITH_RCU_READ_LOCK_GUARD() {
         ram_list_init_bitmaps();
-        memory_global_dirty_log_start();
-        migration_bitmap_sync_precopy(rs);
+        /* We don't use dirty log with background snapshots */
+        if (!migrate_background_snapshot()) {
+            memory_global_dirty_log_start();
+            migration_bitmap_sync_precopy(rs);
+        }
     }
     qemu_mutex_unlock_ramlist();
     qemu_mutex_unlock_iothread();
@@ -3794,7 +3902,14 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
  */
 bool ram_write_tracking_available(void)
 {
-    /* TODO: implement */
+#ifdef CONFIG_LINUX
+    uint64_t uffd_features;
+    int res;
+
+    res = uffd_query_features(&amp;uffd_features);
+    return (res == 0 &amp;&amp;
+            (uffd_features &amp; UFFD_FEATURE_PAGEFAULT_FLAG_WP) != 0);
+#endif
     return false;
 }
 
@@ -3805,10 +3920,148 @@ bool ram_write_tracking_available(void)
  */
 bool ram_write_tracking_compatible(void)
 {
-    /* TODO: implement */
+#ifdef CONFIG_LINUX
+    const uint64_t uffd_ioctls_mask = BIT(_UFFDIO_WRITEPROTECT);
+    int uffd_fd;
+    RAMBlock *bs;
+    bool ret = false;
+
+    /* Open UFFD file descriptor */
+    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, false);
+    if (uffd_fd &lt; 0) {
+        return false;
+    }
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        uint64_t uffd_ioctls;
+
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs-&gt;mr-&gt;readonly || bs-&gt;mr-&gt;rom_device) {
+            continue;
+        }
+        /* Try to register block memory via UFFD-IO to track writes */
+        if (uffd_register_memory(uffd_fd, bs-&gt;host, bs-&gt;max_length,
+                UFFDIO_REGISTER_MODE_WP, &amp;uffd_ioctls)) {
+            goto out;
+        }
+        if ((uffd_ioctls &amp; uffd_ioctls_mask) != uffd_ioctls_mask) {
+            goto out;
+        }
+    }
+    ret = true;
+
+out:
+    uffd_close_fd(uffd_fd);
+    return ret;
+#endif
     return false;
 }
 
+/*
+ * ram_write_tracking_start: start UFFD-WP memory tracking
+ *
+ * Returns 0 for success or negative value in case of error
+ */
+int ram_write_tracking_start(void)
+{
+#ifdef CONFIG_LINUX
+    int uffd_fd;
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+
+    /* Open UFFD file descriptor */
+    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, true);
+    if (uffd_fd &lt; 0) {
+        return uffd_fd;
+    }
+    rs-&gt;uffdio_fd = uffd_fd;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs-&gt;mr-&gt;readonly || bs-&gt;mr-&gt;rom_device) {
+            continue;
+        }
+
+        /* Register block memory with UFFD to track writes */
+        if (uffd_register_memory(rs-&gt;uffdio_fd, bs-&gt;host,
+                bs-&gt;max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
+            goto fail;
+        }
+        /* Apply UFFD write protection to the block memory range */
+        if (uffd_change_protection(rs-&gt;uffdio_fd, bs-&gt;host,
+                bs-&gt;max_length, true, false)) {
+            goto fail;
+        }
+        bs-&gt;flags |= RAM_UF_WRITEPROTECT;
+        memory_region_ref(bs-&gt;mr);
+
+        trace_ram_write_tracking_ramblock_start(bs-&gt;idstr, bs-&gt;page_size,
+                bs-&gt;host, bs-&gt;max_length);
+    }
+
+    return 0;
+
+fail:
+    error_report(&quot;ram_write_tracking_start() failed: restoring initial memory state&quot;);
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        if ((bs-&gt;flags &amp; RAM_UF_WRITEPROTECT) == 0) {
+            continue;
+        }
+        /*
+         * In case some memory block failed to be write-protected
+         * remove protection and unregister all succeeded RAM blocks
+         */
+        uffd_change_protection(rs-&gt;uffdio_fd, bs-&gt;host, bs-&gt;max_length, false, false);
+        uffd_unregister_memory(rs-&gt;uffdio_fd, bs-&gt;host, bs-&gt;max_length);
+        /* Cleanup flags and remove reference */
+        bs-&gt;flags &amp;= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(bs-&gt;mr);
+    }
+
+    uffd_close_fd(uffd_fd);
+#endif /* CONFIG_LINUX */
+    rs-&gt;uffdio_fd = -1;
+    return -1;
+}
+
+/**
+ * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
+ */
+void ram_write_tracking_stop(void)
+{
+#ifdef CONFIG_LINUX
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        if ((bs-&gt;flags &amp; RAM_UF_WRITEPROTECT) == 0) {
+            continue;
+        }
+        /* Remove protection and unregister all affected RAM blocks */
+        uffd_change_protection(rs-&gt;uffdio_fd, bs-&gt;host, bs-&gt;max_length, false, false);
+        uffd_unregister_memory(rs-&gt;uffdio_fd, bs-&gt;host, bs-&gt;max_length);
+
+        trace_ram_write_tracking_ramblock_stop(bs-&gt;idstr, bs-&gt;page_size,
+                bs-&gt;host, bs-&gt;max_length);
+
+        /* Cleanup flags and remove reference */
+        bs-&gt;flags &amp;= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(bs-&gt;mr);
+    }
+
+    /* Finally close UFFD file descriptor */
+    uffd_close_fd(rs-&gt;uffdio_fd);
+    rs-&gt;uffdio_fd = -1;
+#endif /* CONFIG_LINUX */
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
diff --git a/migration/ram.h b/migration/ram.h
index 1a9ff90304..c25540cb93 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,5 +82,7 @@ void colo_incoming_start_dirty_log(void);
 /* Background snapshot */
 bool ram_write_tracking_available(void);
 bool ram_write_tracking_compatible(void);
+int ram_write_tracking_start(void);
+void ram_write_tracking_stop(void);
 
 #endif
diff --git a/migration/trace-events b/migration/trace-events
index 75de5004ac..668c562fed 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -111,6 +111,8 @@ save_xbzrle_page_skipping(void) &quot;&quot;
 save_xbzrle_page_overflow(void) &quot;&quot;
 ram_save_iterate_big_wait(uint64_t milliconds, int iterations) &quot;big wait: %&quot; PRIu64 &quot; milliseconds, %d iterations&quot;
 ram_load_complete(int ret, uint64_t seq_iter) &quot;exit_code %d seq iteration %&quot; PRIu64
+ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) &quot;%s: page_size: %zu addr: %p length: %zu&quot;
+ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) &quot;%s: page_size: %zu addr: %p length: %zu&quot;
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) &quot;channel %d&quot;
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

--------------EE91B1735D871D2F7506D030--

