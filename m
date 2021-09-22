Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD734143B9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 10:27:05 +0200 (CEST)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSxap-0004AX-PI
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 04:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSxYM-00034I-E3; Wed, 22 Sep 2021 04:24:30 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:14401 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSxYJ-00035w-Nz; Wed, 22 Sep 2021 04:24:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku7Hg9s2L1KZbwL2l5SyxzVk5PgXs62swi9DKxgesyEcbW2gx54LK3yqajh5BVwcchgKOe58+9R3E98VBMxjIwbX6rcZLX+7OxKdYCJequ2Uc9vkJzhclsN8MKmUM6amGhKcpKheGS8ZYdb1ZkRC7k9In+0jd0eEiKLELV9vwp7WB/7rYQwY4mWbGMk5tY7J/jzIoilikRXhrLUy6fsSQAukMfPa2Krn+OTfGnOz9h42JFpNfyqKHOKL+SP2vPbSQTT3viUEWFKxsuPr9CIwF15lPlGggt9abKhCFC9QpF7ppmZBVJaq78wJ7gm7sPTurUmtZl06vdH4XP5m+MG+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0zihjrzbG+c+yEWLnNui4jjQ6BqTJPLu3cBKgqueSJA=;
 b=V70i/R1VZQ4FnzUAKpWBtAGSQde3y6HsuojoD7spC3/+wqNyLxA2vbk/7ECtwbZviQL/YrsPu+apB3GK6y5t61EODrtktI2fvs6MZnBYOaS7RfsZ0q7URx+RUzAxNiXNRu42mIvEE/rqGpnHVNzjxXHgqVvW5TemK1vZfBOjd1iDmU1XtUKJ5dTAlPZfitcVt3R5s6MeD1/PSOziFu1KOdeETkl1pgcSFnS3LtXsZer/1WatWjhVlvUrKDHAldiwQgjih3SUXTgh+0QCmUgTpa/IkbzN1ZWFKx9vGuL90B7lg+HmqBnPDNbbnT8/FLGI7U6DSvKGidVeaoFStp4u2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zihjrzbG+c+yEWLnNui4jjQ6BqTJPLu3cBKgqueSJA=;
 b=wQqv0ZfbnA8XdxjPuOcHZhKfrspUvnF8KtMsxrPIiX6yW4pj8KItJU1Ien8FYlx1aq0QEQhhDXyAzls3VAxhRMpEGyISbKpqOWH/H5uXxlYCMgCH8BIhqs/GB+nfBkuxx4kXdkRiSZzXfxsWmbJAAuKKXxnGJEaQGjUe5OatUCg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 08:24:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 08:24:23 +0000
Subject: Re: [PATCH v7 00/11] qcow2: fix parallel rewrite and discard (reqlist)
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b5045c7f-9d0d-37ec-fa2e-52e95f21b433@virtuozzo.com>
Date: Wed, 22 Sep 2021 11:24:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:207:8::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 AM3PR07CA0142.eurprd07.prod.outlook.com (2603:10a6:207:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 08:24:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11752345-1c32-483c-5e0c-08d97da26217
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720F2BE2609C500F5F7B870C1A29@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdAqdriMqm53aqmBq8ZIrZ6yc008ZPxQlgcRhD9TKu5qS80hBzKrsWxJkWATjn6NaUn7hgw1YbaNvL8gQ2p+xCfhb/g7rjvHF7YmeRX18e2YBGd4eWInytBDFpKbruORTok753AWKtZyRA0ac6RmBaBKLXlUvFUl2QhjQJmMYvZ4fPUGuvwMKUAg9G+66glUQOyCiFNq+8hWan1wkCTMXqHTBe1sHPiWFrYbTJCH6IHhwWnDDHenDf308rhkjAM9SrXST/d4VAd/l3I/rfHgCpr2cbzeojUVgORVCtnM0302jF+Bt8tfcRUSZ48zM+FYfM6EiyK3pQyw5XqdNsvI6DCPU4VtQ4XgErOqSeaRCDkxkOP94T/7x93tKUVkHEFS40x10WIM4aRAoRbMw0uzKx6GY8+BstjCAD3zXDsNrUptrJr92g3yaoVsxvStzj89xzuu3/X1koSaxA77g7upbd3Z6B19JvfQtUbj4Ki3FUB7hqUR9GxUOi5S78WP1uKU7jB3d8tabDdikC28FY3LHjNwYEjBvJ0/2edigrVkWCKFXGdGGNhMgxGEO3rwR2b3zJcjBPP9lY1d8aVzk+Dg1v62BG2g3wxqbZVjRAdfPgTIuUm5rYu6iGgabV8Y07FKL+UolPkPrD7iDT34nZn7GZikYg2O2pA0upsLw6Z/32D1bMPM+Z5d8rH9GaBu3wEFrIXHwa8icxxxFYXQOSNV0xViK/9CiZS+GukK/sBxK/agAbCIkl3BfHsuYTQsLP7+mHG6kv1Yx0OCDsejT+I7hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(16576012)(36756003)(956004)(508600001)(31686004)(6916009)(316002)(186003)(26005)(83380400001)(2616005)(86362001)(8936002)(8676002)(2906002)(4326008)(31696002)(38350700002)(38100700002)(66946007)(66476007)(52116002)(66556008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHA2YllQb2NIaGtYeGoyd0dQV3drTnZ0dHZpS1NiYytycXl2K0NkS1pld3Iz?=
 =?utf-8?B?Q2FjRS9pVEdrb2N6ak5zS2Nhc3RwLzh4NzNBRWh1bDVaN0paUWcrVzBkeDdz?=
 =?utf-8?B?SzBvUkF5UFNPL2l2YmRjL3QwaCttMEorOURkMXhidmVwTk9Bc1RWcFdQbDJa?=
 =?utf-8?B?Y2U5blJFS1JZcVpRdWViM0pGY1V2NWRNUGE4WHRvZTk0L0R0bEV4MWxHQ0Fr?=
 =?utf-8?B?a2RXVW80TEk4akxHQ3FGTSttanMvbFlTcllydHVhNytzZzF5Q1QwSWJTQmVl?=
 =?utf-8?B?VjVjWDVIbmVneXVOUGx2Z1FQTU1aTmZENFhoNG5yZXoxcVFERjNZcThXNHJI?=
 =?utf-8?B?S3hNejcyTVZaeWFxdzdhQkdUZ20wSE9hckgzMXNxZEM0bU90Z29pMlpJRVp0?=
 =?utf-8?B?NEpwQVhXdmszZjdvOE5KVklydkQzYXRYcEFBRjZVckU1bG54T2VuZXZrdzF6?=
 =?utf-8?B?ejY2Q0xJRjA4TkFBQ0dremFJMzV4aWVxbWRkek1WMHRSRzUvbFZZZDNtUXJn?=
 =?utf-8?B?djlTOERBcG0yTHNXdUY0WGhlL2VaUGZtU1B1dXgycERFVXAzU0ErV1ZzNk9Z?=
 =?utf-8?B?RXNzUVRxZzN3RzB1a1FJcnBiZWNkSEJmSGZIeVlqT2xNT2RMOWFJbm5hamZN?=
 =?utf-8?B?dGFPSDRnUUF4dGJpd2RicVRQdUxTeE5NYWhwS0FvSEhScGRhUXJLNnZKclBK?=
 =?utf-8?B?RnBzZU9RaUtiTS9WUEI0K1d5VUJWcElRaDNGTkVTbmlJbHZLY3VUeUJ6a1l2?=
 =?utf-8?B?SzlPcTlQbmRSWUQ3RnpMRys1VFhidHN2MDNxY0ZsZTZQUVNZMHcvaGd3Q3BW?=
 =?utf-8?B?TGlLcjFMTDR6bGJXVngrWEdoZEFOZzhrTUZnLzFxYVl0aWdUbC9KT1J1bnVM?=
 =?utf-8?B?dWpaR3NiaEFiVUNKTDVpd09UVjRsQTFJekVqUDZsc3haZUdLWnpjSUpvcFpJ?=
 =?utf-8?B?K0tFL2lUQ0tRZ3BCekVicGhabWdYYzg2dXBQZVc4cVhKZ2YySkJ3UFBRcGF6?=
 =?utf-8?B?c2NzeDJmRHJ5bjRVTlZYTlJQdmFoUUFMVWU5c2IzdnVJYVNPM0Z0d1pOLzFa?=
 =?utf-8?B?V2dGUG1pcmM1Vk1jQ3gyelUyMmZEcVk3U1NhR0pYNzVVdGFSWHdJNDlFSjRn?=
 =?utf-8?B?YWVFaWM4anoraktDei9vNVZ3WUdNOWllWW9lcm11Tm9PTGxERExFVG9ia2tH?=
 =?utf-8?B?Wm9Ka3R0eW9GaTdhM3diNDdiSVRXNWpyZWwvVHNQdUhkalBiblRlVURnczJH?=
 =?utf-8?B?VzlyclhDK2xqUmtOZ09DUTh0N3lMRE4wWDA5cWtrNnp0dGpIYUg0eEUrOWFI?=
 =?utf-8?B?Wks0alZWSlFqVUFBaXliMC96VWU1OFUzeU5US3J5M3NSanlReURMSDJXQng5?=
 =?utf-8?B?U0ZFejVNZE9EcUlPZlFra09sRHUwNVhncFc0NEwvUHAvNlpZd0tLMFB0dkdR?=
 =?utf-8?B?eDVYWER5UDQzWmU5MmN2bGxtdHBBM2J1YzgzNHViOVkwWEdZY3k4cjQ1UDMw?=
 =?utf-8?B?Zy9Cc3diajg1Mlp6bXZLc2RNWXBMUFhvY1FqWURhSHhuT21aWkVQU3Jha2hU?=
 =?utf-8?B?V3Z4ZEJzU3Y4djdnRlZjRjRQSFIxSHg0Z3UvNVJidTdkWlJsOU5YbWdnY04r?=
 =?utf-8?B?UjdtcVhFWnRHdWl2elkzRVh1NzZmK3BleGpaN2ZoK0w3Nm9UWUVZeVFvejU1?=
 =?utf-8?B?WFZJbkYxdHFkZCt5cG9zalhTQkZZQzdiZjI1MGJYSmxBNTU5RStoRDdxNDVl?=
 =?utf-8?Q?jlxi5+nUPsDZM6xHPQ9NEKsAzTuoq/njgwxvhwl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11752345-1c32-483c-5e0c-08d97da26217
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:24:23.4444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZiVewTW8mJjZ9z1QP5JUL+RrbjJKv+KlXbH5M7pWoLXwAlpcH7m8wWETFDGJXIfSRjdjg3UvdTH4HU4JUHSVChYCFbfU4YPRz7RLYtZHZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.20.131;
 envelope-from=vsementsov@virtuozzo.com;
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

Ping.

Hi Kevin!

Could you look at description in cover-letter and 07-09, and say do you like the approach in general? Then I can resend with reqlist included and without "Based-on".

Or do you still prefer the solution with RWLock?

I don't like RWLock-based blocking solution, because:

1. Mirror does discards in parallel with other requests, so blocking discard may decrease mirror performance
2. Backup (in push-backup-with-fleecing scheme) will do discards on temporary image, again blocking discard is bad in this case
3. block-commit and block-stream will at some moment do discard-after-copy to not waste disk space
4. It doesn't seem possible to pass ownership on RWLock to task coroutine (as we can't lock it in one coroutine and release in another)


04.09.2021 19:24, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> This is a new (third :)) variant of solving the problem in qcow2 that we
> lack synchronisation in reallocating host clusters with refcount=0 and
> guest reads/writes that may still be in progress on these clusters.
> 
> Previous version was
> "[PATCH v6 00/12] qcow2: fix parallel rewrite and discard (lockless)"
> Supersedes: <20210422163046.442932-1-vsementsov@virtuozzo.com>
> 
> Key features of new solution:
> 
> 1. Simpler data structure: requests list instead of "dynamic refcount"
>     concept. What is good is that request list data structure is
>     implemented and used in other my series. So we can improve and reuse
>     it.
> 
> 2. Don't care about discrads: my previous attempts were complicated by
>     trying to postpone discards when we have in-flight operations on
>     cluster which refcounts becomes 0. Don't bother with it anymore.
>     Nothing bad in discard: it similar as when guest does simultaneous
>     writes into same cluster: we don't care to serialize these writes.
>     So keep discards as is.
> 
> So now the whole fix may be described in one sentence: don't consider a
> host cluster "free" (for allocation) if there are still some in-flight
> guest operations on it.
> 
> What patches are:
> 
> 1-2: simple additions to reqlist (see also *)
> 
> 3: test. It's unchanged since previous solution
> 
> 4-5: simpler refactorings
> 
> 6-7: implement guest requests tracking in qcow2
> 
> 8: refactoring for [9]
> 9: BUG FIX: use request tracking to avoid reallocating clusters under
>     guest operation
> 
> 10-11: improvement if request tracking to avoid extra small critical
> sections that were added in [7]
> 
> [*]:
> For this series to work we also need
>   "[PATCH v2 06/19] block: intoduce reqlist":
> Based-on: <20210827181808.311670-7-vsementsov@virtuozzo.com>
> 
> Still, note that we use only simple core of reqlist and don't use its
> coroutine-related features. That probably means that I should split a
> kind of BlockReqListBase data structure out of BlockReqList, and then
> will have separate
> 
> CoBlockReqList for "[PATCH v2 00/19] Make image fleecing more usable"
> series and Qcow2ReqList for this series..
> 
> But that a side question.
> 
> Vladimir Sementsov-Ogievskiy (11):
>    block/reqlist: drop extra assertion
>    block/reqlist: add reqlist_new_req() and reqlist_free_req()
>    iotests: add qcow2-discard-during-rewrite
>    qcow2: introduce qcow2_parse_compressed_cluster_descriptor()
>    qcow2: refactor qcow2_co_preadv_task() to have one return
>    qcow2: prepare for tracking guest io requests in data_file
>    qcow2: track guest io requests in data_file
>    qcow2: introduce is_cluster_free() helper
>    qcow2: don't reallocate host clusters under guest operation
>    block/reqlist: implement reqlist_mark_req_invalid()
>    qcow2: use reqlist_mark_req_invalid()
> 
>   block/qcow2.h                                 |  15 ++-
>   include/block/reqlist.h                       |  33 ++++++
>   block/qcow2-cluster.c                         |  45 ++++++-
>   block/qcow2-refcount.c                        |  34 +++++-
>   block/qcow2.c                                 | 112 +++++++++++++-----
>   block/reqlist.c                               |  25 +++-
>   .../tests/qcow2-discard-during-rewrite        |  72 +++++++++++
>   .../tests/qcow2-discard-during-rewrite.out    |  21 ++++
>   8 files changed, 310 insertions(+), 47 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
>   create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
> 


-- 
Best regards,
Vladimir

