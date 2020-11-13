Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4372B1F22
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:47:59 +0100 (CET)
Received: from localhost ([::1]:57932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbIs-0001ul-6s
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdbHR-0001Rz-It; Fri, 13 Nov 2020 10:46:29 -0500
Received: from mail-eopbgr140103.outbound.protection.outlook.com
 ([40.107.14.103]:36449 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdbHO-0005QJ-MS; Fri, 13 Nov 2020 10:46:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAL+COjcC3vtkt5yRXJQvJaQPTwMWlPOkTdC6PujswWovFyVne8kse+1ZwLuavQyyt4GLetnLZbMBMb5xa/EDXlk4PCc8WuuDRLCHEKXpvSYvoQ1q3BbXuYa+0B5KTKVQSWdZwBjCrX0aWQ3uiWUX54y0u07kvJMero+lgi5kpU8YlsyRt9sw9xkjtMSvvlNeH2A5E6A0AmQk9ykZQGQga8sC1KHbI9xbOmfpw4PLW6P2dBQMurzkVJ2ZjUVPhq81GnBF2RZz036qlh2ekk+PHpTsM0auXoFiqFZXu466I3jB3jnNmnUzjM1m0a0FeZUrzUfUf4rIuTiWQzcQ7Z7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCQNW7HAK61Rcg0DsuZ6IkLSdffA15lrEnKR50yEB2U=;
 b=Corvu9asWwp8Xwhgemp7bLLhll57jiuo3rVuQtl/K9kLbmgD+196c1s8pFpxGtc+a3l4tkjBwxMrIrOLuFjCcUjdeBVlkFPBBi0aNAgTBelSFRndFb2HSncMt+yE/lyHoHVKnNvwCvlp+e1NL/bMNlWA6xgGsgBeA3JfZWmGjDJGCWIHTpOXdE0hM3JHo/K3glHUxI46I/28KZGKAyF5zNYYjVBYJRYPJwgWIqZlF8CfJcR1YCJlOUsk25jYStBKOvA2/b+0VEQQWZcka+nncFulpyg4P3LANQ1UW8w3iJzPcg9Q9aqWt2uIG6H6b/dmFvuwTcCtByzc6lzjxsBx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCQNW7HAK61Rcg0DsuZ6IkLSdffA15lrEnKR50yEB2U=;
 b=k2sbWu+5q0qX5Mk3BCtX0Wn+gGippRRNzVKflXZFhlozegtl3y+alVIlU7XJWQzaaVzyMZ+Qt939/j1Cwognz3Lj4T1O5Ys9pUdjtsEDLJQ8zBzUNYZn1RR8AzyMx/zyjbSTS6Toi0zn5BnNx58xRm3vAzhtVS6wDuCc9BhNr/o=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 15:46:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 15:46:19 +0000
Subject: Re: [PATCH v7 08/21] block: introduce preallocate filter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, kwolf@redhat.com, den@virtuozzo.com
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-9-vsementsov@virtuozzo.com>
 <78e540df-85b4-2a5a-7088-ef77eb7b5ab7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9e9eb0de-aa74-92d3-cf5b-b116bd087104@virtuozzo.com>
Date: Fri, 13 Nov 2020 18:46:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
In-Reply-To: <78e540df-85b4-2a5a-7088-ef77eb7b5ab7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM9P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.71) by
 AM9P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Fri, 13 Nov 2020 15:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45fedbdb-fa05-424c-049e-08d887eb43a8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151D9C81FAFB29CEB141FB1C1E60@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LmWZnyJ2QnaKy+TSjKzAVSvN6m4ni21D624bcLfJC6Au2LfkK9t7ohiAjkaudmLEOtnS+D17+Vg8FFBb9XsNMysCTliMguUB4NLkilX9R5ExFA6Yz1OeueS8O4Wc3oRoNL9r4/IGikP4rIc3CYGVS9A9UuPbr3XlbSnLmZY3+rpAM0/KMERABU6x746J+30tyqYQtvwoohfHF7lypTf9UYq1Ym/8jk0xLxLB9lCcVFAN2dWY4Ms5deGfmISCQkVn/gpKpqUBlXj4rRCxQpU86slB/6kqPHq49Bwy2Ex2SIzk1VKq0bj0fYbOUr5ylojXoOJXHMRDwb51EI6/LED/fq9Dys1aFJiuMcEjM9rXtuHUvIQpOVUW3szywpWwS7x6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(136003)(366004)(66946007)(53546011)(2906002)(956004)(316002)(31696002)(8936002)(107886003)(6486002)(52116002)(26005)(4326008)(16526019)(186003)(36756003)(66476007)(86362001)(31686004)(16576012)(66556008)(8676002)(2616005)(478600001)(83380400001)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: kiDlyWfL03sRaZfNkk7SRfUNF3Y4Pd8C/ERwuEbGM5kgCIDbZ5s+EZVe3SEF5jtzHRfoUksEVUxP7/QTKf4OU55pOpeDyseJVurz97LdbMRFgdjQpQRD7nyFOKjPpdZD9nMcF1Zq1j7BYw9kykxxWtXjfUFORaqgy8H3Mzfxy0fY3PWQdB6rJkFaBVyxyaebGxWKL0jZbd2K7PhnK4vrVt+IZ1SJgWzkRDyhs2E1Dn+0F9ELtvOQuaHYXEazacbcNs+4U6C5OUwFkxZHGPIghxxaRe14Ym1eG2+gu0WAf9lMWo4vV4pDSNt9qvuCIgIeJi57S6Qh/5S5hZz5vgvAX8LFONjFvAYHt+IZFv8Igm8SkNi6OBb3jZHJAtUy7wYlWrat0FT6UrShDRN0vZN/N2C4yUwrRt90N8LkhXnmQ1a0e2Edw1hr6cvK7MPE3PcaW0Fde4xjVRfHQWefNbqpdhRwTAMRi3nyh7qybxzW1BWm31PqfnS0dZY7GuRi17aTqd5GkA4lH1RkibGwAfnoz0TzLNdw/DGy5aFXEfPoY235eEyow8IGqyALGUZOSqMk96LeUy2CtHJBggxY/2Mb8zYHSkNfpItTw6B0I6KtWEYEySCRuWqlkCkIAkWZOVa09yEoObCaeNLjjDJwjHPAgw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fedbdb-fa05-424c-049e-08d887eb43a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 15:46:19.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty5qkbf5owPCy36No2/LSKaoiM21i6HT1Pf7BPBmM29xwzm4p3gOIqdX3tpVn/ZQGCqGpSWMK2XaPpC6z7N5H8MkcvK4TXwzyT5d+dwXsdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.14.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 10:46:22
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

13.11.2020 17:32, Max Reitz wrote:
> On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
>> It's intended to be inserted between format and protocol nodes to
>> preallocate additional space (expanding protocol file) on writes
>> crossing EOF. It improves performance for file-systems with slow
>> allocation.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/system/qemu-block-drivers.rst.inc |  26 ++
>>   qapi/block-core.json                   |  20 +-
>>   block/preallocate.c                    | 559 +++++++++++++++++++++++++
>>   block/meson.build                      |   1 +
>>   4 files changed, 605 insertions(+), 1 deletion(-)
>>   create mode 100644 block/preallocate.c
> 
> [...]
> 
>> +    if (end <= s->file_end) {
>> +        /* No preallocation needed. */
>> +        return want_merge_zero && offset >= s->zero_start;
>> +    }
>> +
>> +    /* Now we want new preallocation, as request writes beyond s->data_end. */
> 
> True, but isn’t s->file_end more important?

Yes, file_end should be here.

> 
>> +
>> +    prealloc_start = want_merge_zero ? MIN(offset, s->file_end) : s->file_end;
>> +    prealloc_end = QEMU_ALIGN_UP(end + s->opts.prealloc_size,
>> +                                 s->opts.prealloc_align);
> 
> [...]
> 
>> +        if (prealloc == PREALLOC_MODE_FALLOC) {
>> +            /*
>> +             * If offset <= s->file_end, the task is already done, just
>> +             * update s->file_end, to move part of "filter preallocation"
> 
> s/file_end/data_end/

yes

> 
> With those fixed, and with %s/5\.2/6.0/:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Thanks!


-- 
Best regards,
Vladimir

