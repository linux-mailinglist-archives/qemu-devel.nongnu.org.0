Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75818341D0A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:39:49 +0100 (CET)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNEPs-0005s7-Iv
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNENl-00055s-Uy
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:37:37 -0400
Received: from mail-eopbgr150103.outbound.protection.outlook.com
 ([40.107.15.103]:40414 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNENj-00007h-6u
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:37:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX5udNYmyRzVUKUkIk+vju0Ume017c4m2QARjNzr2DYbCfhTKmMFA821XJcSCfSqf2EbFnRXK5oenNqUYOkKOsxm0wf+jMIzrAao/QZleIcgcWanMf6hGCNPCy4SvBvAyKPx1AJdXEq7zCGGBkKAZkvUq7dCoBYDlEEcNzNF9Sa2h1iyrfnOf5I0/vxjKvo4vmkSf2FnsWP/ujxKRWeDF7lp85OfzciBgy+oQ1sPbnMcjqzygVQdJCGUgxWT8V7qGIbZXHx62hRgvoHFbEUgKq77zR/CH9IhSSLZcSOGqZYxClMBNhzFXFsUF3Qst3zksW8QbMSmFg8BrEdLEaHxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xh173/o1UF3+8WC0f3DcuM+YXklarNGVe/GZwTtiDs=;
 b=OSxGGM2XjPjHerSNGIZY3rR02bk01ltZfxEgh6JkB8914Bg5bOSvf+e4PrCHB0IwyqmWyKYwlnN6sqKbTaK5C1/QvNvtn9P0pPk8AAvC7fkOizjs1GA/VYZpnP8kHXrm69kxLm9U+EOrHq0QcmbLbVtS+QFIkBNFBcDcraWAyZMrh2hCBOsnzmrmQpxEBWH78yr8LXG3XjoYkThSn6R5gatq4fD2BZ5fEUv7UUqwBYouOT32riDX0y413MDXbLHu54s93HI7xXTjHaCKKmJ0Y15U7C2BYX87HN3cHibmzKK71jl3yPSfpnBuHqEHG9XuPhx4KoMKjaZVc/0Q0DmqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xh173/o1UF3+8WC0f3DcuM+YXklarNGVe/GZwTtiDs=;
 b=CEoz87U7eiRpwjfGoYeFz93Vxmg1G1RJL5blxp1NubWjmixyZz9lWNqZuhplTmG30i+9tQoH51cuj4xoQ5GLz+k7JSkH28ATJEx3K7wx2Bh6QU1iNOmZ4OV8GP2KyXhHTKzGn1y/GL93BuH11KP5R9OXIGEBFSr9V4BI75s6vvU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB6401.eurprd08.prod.outlook.com (2603:10a6:20b:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 12:37:28 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 12:37:28 +0000
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
 <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
 <a40d14b2-b10c-83bf-bdd5-48a465dac67d@virtuozzo.com>
 <7a83e101-ea14-df93-3cbc-014279637d2e@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <abac66d9-7c5a-b186-ec41-2abc9e724ac4@virtuozzo.com>
Date: Fri, 19 Mar 2021 15:37:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7a83e101-ea14-df93-3cbc-014279637d2e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR08CA0032.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::45) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR08CA0032.eurprd08.prod.outlook.com (2603:10a6:208:d2::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 12:37:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b3c920b-6808-4f45-7621-08d8ead3c1db
X-MS-TrafficTypeDiagnostic: AM8PR08MB6401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB640177108DB16B1EF9FFD86A9F689@AM8PR08MB6401.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9J0uYUqUuhEN8ENA24rgz3snR0eFtQkVZxmOT6mLNoM5uAJt8E+8uo3Bw4Qylp0MWBbRZA49gH2l1IozPW91V4JQ4zAP+MpRC5JJejz5vNpVyAVPseSqC3OsFo/tz0X/rkzOpWK+p9L2IzTGEjXRftSLWVFVfkScDygBB+cdM7o7kDez9dYCY70KYQKj9bJOlpRbNE6n0M2GB+CPV6fQY6rx8Urz8aycjWC9t2jJehe+S+nLgDwDZNwxUFRGU6FWBrhYfBnKVGCRNIM0JILsa6Oyn5sjSur/7CvosovZ+u3cj5myLRHpA5MVmeT9QOtlXtTDJqvGlNwTduNt8vgLVFhBRwZGqgpz9XdUsVKLu7YJBmwYUz1IMYdTmAHmON6hBCcIju9ASRH9VSn/U93MDjlJHX2+uapjJ94/zO6WcKytrKJKnIz/daJPq1+Ex6jNGGLAnHES8If0yx4FnUHsO/0jHUdtRCgae1X4hUCzVn9oX7r5NWGFZUHSqiYPu9SN8W+7Gr4hzvQmV2sUssmonSxLyxc4bMZco7ztlpJ/ZD6v15dRlf0fjn0YTP5Zwqt4LaUACF8mhL0vWJZXhPmz4oV4KcXoG5/Rdw/WpKzMfgbpKv+X1BGLc2Nxd/53SByTrRhrIoj7z+6mzG7OwPbPiCyFEBTVPQ7QnUOiRkiCFLAVgIEf9sE8xINiKxJi0QsJbho8U0QvJ+CILFrqtiVfIOHQwDphRo/dv12cUeWlNYbxivxN60yK6E+q+IguTeG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(136003)(396003)(38100700001)(2906002)(83380400001)(52116002)(4326008)(8676002)(36756003)(31686004)(53546011)(26005)(478600001)(966005)(44832011)(66556008)(2616005)(5660300002)(956004)(86362001)(316002)(16576012)(8936002)(16526019)(54906003)(31696002)(186003)(66946007)(6486002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z251SGcvZll1QWppT2x3MmZsaXgrZHRoYmk1eWFyOGc4dms4NmFqT0FhdnVT?=
 =?utf-8?B?RzA0N2dwL3AvdFNZM3FiR2hLeDlpK0d2eVNSb0dYQlorMUNCZC9iZmE0MHlo?=
 =?utf-8?B?TFdiTXFVZzNuQW8xd0tPZWRnOGZPUS9vTXVLbCt2NjVORWViZUZ3ODVxM0Rv?=
 =?utf-8?B?NHpiQWk4WW9UMzU5azVURVZIOHZZMGgvQzcwNGFpZ3EvcGdaTFhqdmp0UmdO?=
 =?utf-8?B?aFRrOVhZYWxYYTM3SVMzU29tMlo1UUJvazJ5RkVXNFZIdkhva1RJZ2t1dkJG?=
 =?utf-8?B?YW1XNm5lb1NnTVVvaXd6YWdsKytMeHFlZ296QUFKMWV3em1SbzBNUFJsSHhP?=
 =?utf-8?B?TkJBUkhLY2MzOXVML3dLQTJKelYvM256aXplNTA4OXZCQ1hIZEVXMjlDTkRq?=
 =?utf-8?B?cWsxeWFQdWFwTDUrYlA5bk5nelBzdVlxVW52YUFaSGo3M21NdGdEbkd5KzAv?=
 =?utf-8?B?TlBnZUhmaVpLUUNLTXlZU21uUGFRc3JLd3IxSit6SlI1eVl1SVlzSHg0VVI5?=
 =?utf-8?B?M050TDBnR3F4VFZSNG9VRGkxSmJMeUV2UEhrTEpWRDdVUlFLUkZzNG5jVkVM?=
 =?utf-8?B?WVNGdUxQZkpXZzN5Y2ttQU81b1JKSjI1UWtpQ2YzWWNOa2NkVTdZcnNLNzFu?=
 =?utf-8?B?ZSt1L1JQVlYyVTBORHJOczN2M3c5UkY3MVd0SjRSb2dWZUE1QWkrbDdzaCtN?=
 =?utf-8?B?cWVMNDFUTUkwNlQ2WDhLTE5mZkd5RHVjOHZDUG1SbzBEaUhreFJvVDUrYlZi?=
 =?utf-8?B?cE8zazZVRVg3bERuZjBybWdUcnF3YnQrZzEySk55SkorSzJwUFdvSFlTRDdM?=
 =?utf-8?B?c05sTkxtZWthSzZwT29zc2lkQURtWVFnTTdVNzhHSjhTc1VHeTFIZ0dXeTVx?=
 =?utf-8?B?cXZ4UHRhZ0REZXdZTkQzNHBQb1orZVNSWXNjWURCN0JTeGVCQjhSWVFXeUdM?=
 =?utf-8?B?RmwwVlkzQk5tRDBOeE1QZ05kUmh2VDRkZVBvRkRuVjdQamd3MFlYeTFzNkpV?=
 =?utf-8?B?NjVBQmFOWGxYOVNlc281Vng4aWlhRk9BbXJBNTZiM2pXa0l1YlBVd080ZVpY?=
 =?utf-8?B?RlMvamxIOGlxeHlpblpGRjlkWC9Ha2ZIc3F3NkVnMTRVTzE4QU1nK0NwZG5y?=
 =?utf-8?B?OUh6WTY5dDIyZTEzaVkwdkczUVRQSzgrTjkzMGdKektCaXdnK2pyL1BLWkFM?=
 =?utf-8?B?ZXBiaFJJODArcStpY3haM1ZucDNSZ0JKVWJnUkxoaU1XMTJJaSt3YjR5R0Rq?=
 =?utf-8?B?S1ZQKzM3V1FyUGRFV1prclZ5a1JkT2JicVhMaUVHZTNzTjNWVWlyVEw2WnVP?=
 =?utf-8?B?OFhDQ2NwTkhuZC9RNU5PbHJHODdONVA1RGR3aGFHcHg4SEpDQUpOQ2x3Ujdv?=
 =?utf-8?B?S1dycDVHaVRISnNzZG41aFoyc3RkMFNlWUFCTVArSDZFR0NTQXAzM1NTZjBD?=
 =?utf-8?B?UjlMR2o0NlZUTEdFTVRIanNQVTdqRTVGL3lWM25mVGk4V1A0V0tYYWdhQWtl?=
 =?utf-8?B?SXVTWVZML1dwQlYzU0Y4aFhIN1pQelQyY1BRYld0b0VOSEJsOTl3aHdrQXZP?=
 =?utf-8?B?dTdEVE42V0MvUFZZTkVkRW10MXE3YlFVQnRsYzZ4dXBIOVhtZm1KTG5JSDgy?=
 =?utf-8?B?R1E3UjBFaTlSdnVQL1JEdEZVRlhRQXcxS0pMZGh0OHBzK0RBRnpORE94WC9J?=
 =?utf-8?B?MlE0Q2JaNy9Hbm15V2pFYUROTHVhTFg3aVN5TWowdnAwQnNXUm0yK0tjVmV3?=
 =?utf-8?Q?FVAZTrh0WR18I9xJIeBH7iqouLoxSmBzcVWPR3+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3c920b-6808-4f45-7621-08d8ead3c1db
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 12:37:28.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYQY4ijl/Udp60QlquPW5eIN7ZmQCSvzWmyhwjAia/efVfnmg/+n7Vy4uXVi4aaeg6LS2UcK2M77TPAahoMLwktiI6LtxZ+oPtz/yTxL898=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6401
Received-SPF: pass client-ip=40.107.15.103;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19.03.2021 14:27, David Hildenbrand wrote:
> On 19.03.21 12:05, Andrey Gruzdev wrote:
>> On 19.03.2021 12:28, David Hildenbrand wrote:
>>>> +/*
>>>> + * ram_block_populate_pages: populate memory in the RAM block by
>>>> reading
>>>> + *   an integer from the beginning of each page.
>>>> + *
>>>> + * Since it's solely used for userfault_fd WP feature, here we just
>>>> + *   hardcode page size to TARGET_PAGE_SIZE.
>>>> + *
>>>> + * @bs: RAM block to populate
>>>> + */
>>>> +volatile int ram_block_populate_pages__tmp;
>>>> +static void ram_block_populate_pages(RAMBlock *bs)
>>>> +{
>>>> +    ram_addr_t offset = 0;
>>>> +    int tmp = 0;
>>>> +
>>>> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
>>>> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
>>>
>>> You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE
>>>
>> Ok.
>>>> +        /* Try to do it without memory writes */
>>>> +        tmp += *(volatile int *) ptr;
>>>> +    }
>>>
>>>
>>> The following is slightly simpler and doesn't rely on volatile
>>> semantics [1].
>>> Should work on any arch I guess.
>>>
>>> static void ram_block_populate_pages(RAMBlock *bs)
>>> {
>>>      char *ptr = (char *) bs->host;
>>>      ram_addr_t offset;
>>>
>>>      for (offset = 0; offset < bs->used_length;
>>>           offset += qemu_real_host_page_size) {
>>>      char tmp = *(volatile char *)(ptr + offset)
>>>
>>>      /* Don't optimize the read out. */
>>>      asm volatile ("" : "+r" (tmp));
>>> }
>>>
>> Thanks, good option, I'll change the code.
>>
>>> Compiles to
>>>
>>>      for (offset = 0; offset < bs->used_length;
>>>      316d:       48 8b 4b 30             mov 0x30(%rbx),%rcx
>>>      char *ptr = (char *) bs->host;
>>>      3171:       48 8b 73 18             mov 0x18(%rbx),%rsi
>>>      for (offset = 0; offset < bs->used_length;
>>>      3175:       48 85 c9                test   %rcx,%rcx
>>>      3178:       74 ce                   je     3148
>>> <ram_write_tracking_prepare+0x58>
>>>           offset += qemu_real_host_page_size) {
>>>      317a:       48 8b 05 00 00 00 00    mov 0x0(%rip),%rax        #
>>> 3181 <ram_write_tracking_prepare+0x91>
>>>      3181:       48 8b 38                mov    (%rax),%rdi
>>>      3184:       0f 1f 40 00             nopl   0x0(%rax)
>>>          char tmp = *(volatile char *)(ptr + offset);
>>>      3188:       48 8d 04 16             lea (%rsi,%rdx,1),%rax
>>>      318c:       0f b6 00                movzbl (%rax),%eax
>>>           offset += qemu_real_host_page_size) {
>>>      318f:       48 01 fa                add    %rdi,%rdx
>>>      for (offset = 0; offset < bs->used_length;
>>>      3192:       48 39 ca                cmp    %rcx,%rdx
>>>      3195:       72 f1                   jb     3188
>>> <ram_write_tracking_prepare+0x98>
>>>
>>>
>>> [1]
>>> https://programfan.github.io/blog/2015/04/27/prevent-gcc-optimize-away-code/ 
>>>
>>>
>>>
>>> I'll send patches soon to take care of virtio-mem via 
>>> RamDiscardManager -
>>> to skip populating the parts that are supposed to remain discarded and
>>> not migrated.
>>> Unfortunately, the RamDiscardManager patches are still stuck waiting 
>>> for
>>> acks ... and now we're in soft-freeze.
>>>
>> RamDiscardManager patches - do they also modify migration code?
>> I mean which part is responsible of not migrating discarded ranges.
>
> I haven't shared relevant patches yet that touch migration code. I'm 
> planning on doing that once the generic RamDiscardManager has all 
> relevant acks. I'll put you on cc.
>
Got it, thanks.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


