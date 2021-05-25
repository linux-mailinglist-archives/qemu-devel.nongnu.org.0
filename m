Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C679838FF08
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:26:45 +0200 (CEST)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUGq-0002B2-U7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llUFn-0001Ix-4Q; Tue, 25 May 2021 06:25:39 -0400
Received: from mail-eopbgr00102.outbound.protection.outlook.com
 ([40.107.0.102]:2046 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llUFi-0000Hh-P3; Tue, 25 May 2021 06:25:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH447Vdhchh+q3Ir+e5J7xVyVssxtAyQ6/c8Lv2izycbDBejl769vpeHsuTclduhGP0JQGqEZkGHjo+E472e0v7vR0HQRX6YjJDC86sFxuwKXFcchheUVjIMaRyF1EPxxjizdBJNOmVQlrEeG3n4EKZUrG46xaflsrmWkRMecXu62BBRFZ1NFFsCadLs7ARleRGfYPkkVRNQyHjK1WDWXSu7CDzsOIOLEeq93gmW98/YEQ14LAOkp8vhrRq0Hni8klFolreS0iPreYUCnFEeYHhNbYOuvyKV9y9rgzSwJvPn4wvKCHwVUABM0Er9yEz0PE40KTFKEjWnZ7NMfVf8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXuw17zQEh6Emon4q7yWhJVPciHbw7jqUY8M4Hp5w8k=;
 b=T0pBTqp32bkehRLZZNsbpNbTMcr1HBy/M9VNJOTUoM+fBTl3sUzj2jzx/GMyq12pCSAzRh1kCqR4LX9fHzfi/qurFmasuP74rkQtCIxb8/EpT5TlAbAHj0YbsHhrkt8aOv0Kiw0Thg0Kv7lwwxwmmKHZBBXyOo3/AqFnS+MBxze5AxzC7ibyZTmkKqRw2Q8II6Wp+EagzlTuY+ziV+Sa7BYJObz8/CuM2ULom5l0S+UC4IJE+jgdewOUCtbXnlT5LPMVABhKKfp0yHqFlTTDi5K8FzI/7SKLRuDCaMipubXIIfRVTQ7Ggp2CeRKCOsgC3PgFCn9b4yPXkjjMVTRl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXuw17zQEh6Emon4q7yWhJVPciHbw7jqUY8M4Hp5w8k=;
 b=Jqfe2EhDilyjJFK8Y/rnLdwZFxvYLhtFSRuGtaGZBWAKZOv0aKpMIpSZQ/2tE61GEOAo69dk7NrewsShS+1d/iuaewwihNE5KPMUS/yIuHHQYeK7XGw50ZXxSG151pYpF9C1/5QWIJaha+A+meot87XHr2CZRhQ7zH6VfUpJ3Xo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 10:25:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 10:25:30 +0000
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
 <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
 <26cc90a9-756d-902e-3559-81cc01439e24@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fae5f204-ceb7-722c-ab02-4a1671c52624@virtuozzo.com>
Date: Tue, 25 May 2021 13:25:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <26cc90a9-756d-902e-3559-81cc01439e24@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM3PR05CA0131.eurprd05.prod.outlook.com
 (2603:10a6:207:2::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM3PR05CA0131.eurprd05.prod.outlook.com (2603:10a6:207:2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 10:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a90968ec-95c6-4479-d4c3-08d91f676bed
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4021207EFA10BBCD7FDAE536C1259@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXgmItk2/n8M3zUlTkRVgw/P37U7EHtMmUzg7EL35oSW59cSwx/TIQo0PEwQ5MOjmq5ZTNgeffgkLra1iuRxIEYgctOHGeTKn5CvI3FLNQLS74VUR2x59BcBswlmsG+lyYQ2FM7QXDVu6sskRJV2DMTPHmJA3mnt6TPYLN/dq9CIFftjjU4ytQ5y3cVAmEa0YdhSwg8KmQi9u3zvu8noNiGkyfAiPA1AD3u//SmMRl3oBBQEMgC5C3ZEWA7VsIzsFdNW0O+8BB805w7dKsVI+b4QeLmuwmbMKM7jG1ILSNsHAdOoAk9jEAfZoYDrauerxg1WjRZStkRKKLlcbs/ePvfZLyLSsaP4njpYVDlLeatyoaqERPG7U8m2yt069MwElaBhmPQyD8v5K6PnD64PJtNTqU13pxZK1l+j9lqCUwoALtH6kxRDCVpBQYmWBxm/1es5QONUatP4AGnLkslv4FXUsJupq5LT3u+KE1t2HKG/oQF7/OU5tfSqZu+dg34ela5JNxT0manYeyhDOMvjUYBbtCbuYIL704koYKJjDkBA1bpcP5VsN+aospZPpkZFSb4HX5b2IykUec6DXEtphregkN8bwiLvEUIs3aImh7UxyIAZS2f9aOMqOmEH7+M38JTS7Ht3TG1W/Xv3YABLQQmcnP8gZ8exCPhDt7h4w/RECr9G1BKVw3kJoRSboR8IUcKiJXC2WCGj12kUZlcttw1/2geEY4Sm9lvo44xq3R8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(136003)(346002)(366004)(396003)(39840400004)(31696002)(8676002)(53546011)(316002)(54906003)(16576012)(4326008)(38350700002)(8936002)(26005)(38100700002)(52116002)(2616005)(2906002)(31686004)(66556008)(66476007)(956004)(6486002)(86362001)(5660300002)(478600001)(83380400001)(16526019)(66946007)(36756003)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXl4dWZGSTQwM0FYSlYzdzlnb1JBUzYvNmtETm04NVd6N2ZpM3V1ajZCRlFO?=
 =?utf-8?B?em9GOUJCTTgxWXRGUVVBaEMvT1gvcmlReVhTK3E1WXE0eG5sRkVPYnhGNnk5?=
 =?utf-8?B?VTVQR2MzN1Q0Z0YrS0pNQTR3NVBZbUtGckI1ZlBIVEZLS3cvSW96OTVFaHp3?=
 =?utf-8?B?TlZIdGtBY3YrZSt1RW5QLzFodUpENUVSS3kyeUR2dWdBK0FNeGdITDhkb1hy?=
 =?utf-8?B?bTFtSU1zdjhDaS8yZU9hZmc5aWZBQTRKRkZxWEZmaGhqdVZYV0ZOZ1oyYlEy?=
 =?utf-8?B?QW1ZeE9XU2JVZEJVajduTGo4Uk1jVkkybGlYU3ErVnJvRm82eS9KVS9jZVBJ?=
 =?utf-8?B?TmIrbEJJdlJDcnE1RXVYcEo2ZElYeXN1VU9KSTRDZ0pSdU1oNW5Sbk5ROVhH?=
 =?utf-8?B?Y3NPMzlhUGRvWGlJVlpoUVJoZXVGZ3ZveDJNcUNsMDVTMGlSTFdPV05JMVA2?=
 =?utf-8?B?Y0VQb005YkNtMnFuMVhkR2ltMklUbDdsWGllTVJuTUlZWTJRcG9oS2NMVmJT?=
 =?utf-8?B?emZicHhtc3hEK2h2eDQzT2sxYTFLSWlsNjVQZ2EvMkVQSlZGK2NVWU81SEln?=
 =?utf-8?B?aEVlbkxNcytNdDM0MHQveFVhUmpBcHJhWU1PeTE3d1FWam5jZys5U2hvOGJ4?=
 =?utf-8?B?Y0ZIbTdRSEJsRERrVU5HWmRLNHhHaUppSHQvWUhWTFl3MU9vY29VVU92c01k?=
 =?utf-8?B?bVlXY0Z5M01jMGFKdjJrWkxxQ1l4Unc3Q2llMTJXUkl0MFZyTldaNUx1VzZQ?=
 =?utf-8?B?ME1DZ280QVlZaDVYckRjMmxaUERHWXg1bHVsdFhaa295Zy9YY1REeG8rNUZV?=
 =?utf-8?B?c2xoMytvQnlyK25rVktQaE5NVEpUSEZrQmlNTXU5RUg2WlZEMExkaWdqcFQ5?=
 =?utf-8?B?MGsvOGpRL3ZKbUw2Y3pLenhEaUpjZXl5RGJWM0plamNWNlZRSDdKQ3k2VkFN?=
 =?utf-8?B?LzJRakdmczJJeENxaXYxYUVwclNEeGdCYmpQK2toM2h6TG5IWGVzTjdPd0dz?=
 =?utf-8?B?cWsrV2hpOGd2WFd1UThQUEJqd3NXYTFTUUxjQjk4Rk9NcDkveXloUFJ6RFNT?=
 =?utf-8?B?blI4QUlQSVorbkJ0ME90NTdIMHdZdXZxUERqZFpENi9kVUZ1SmhDSTkvQnh3?=
 =?utf-8?B?YzI5enBBMFN1cGVtS2U5Wk5LYkFsdGlQdmt2UDVYSEZ2UlU4MEdZMi8vR0tK?=
 =?utf-8?B?cFZEWTg0ejBlbks3NTRvMUdmd2sxZ1l6NEhHVURRL3FNbXhmUDNyVWZua01F?=
 =?utf-8?B?Tno3SXlGT0NkMFI2U1RNK1NaN3pLU0VlSytBM1ovV1ZFb3JETUtRbUNNTkk1?=
 =?utf-8?B?amZUVUdCUEhmUWN5V1B5WFZQRG5VMTNQb3p0TFZqKzk5TlVpRUNIbTZyK1ZV?=
 =?utf-8?B?N3RXYmhHRG52dVdybWQwdEZSTjN2VEErbGM4NDE4VTZIYm1UN1ZDekYwRmtF?=
 =?utf-8?B?dVRxRGhLcjA5enp6YVJ4WWhpS0tjYm9kM3dHckJJWllabzhFd3pXY0lvbGxH?=
 =?utf-8?B?VXdCWHdkM3BwOHJ3dmJvTmRCZ2Z3a2lOVUNEZ0Rxd3BwcVlXY0hxZVk3QlQ4?=
 =?utf-8?B?NVFuSW5nNmxmWll1Y3hGV3NSRzNEL1ZLWDBmd3NoNlRQZ0RzQU9DM05wNWpM?=
 =?utf-8?B?c3hrUmp6RERiZEFtRWowa24rbnJkdHAyM1ViWHJDSUpwbXFEdkFyekxGODdx?=
 =?utf-8?B?MDh2UmhSTVIwZk9meWZDcmhxdlVGTjU1MzlveGxRWEsyQkdvamZRSlNLMG1W?=
 =?utf-8?Q?emS29lo1tFnMPJ+dKem5CG5FGX0n6d9BS2/8l9j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90968ec-95c6-4479-d4c3-08d91f676bed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 10:25:30.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv5k1BvKs3an9NnT754eg5NhPjxhiJbiZSxcxavdNA17X8ZUnAcvV7BSZO/7tNY7kEJhSHzZGKmB7aNpwiVLXAzWcI0tS0yG61/hnM0lYrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
Received-SPF: pass client-ip=40.107.0.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

25.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 20/05/2021 17:19, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> Because the list of tasks is only modified by coroutine
>>> functions, add a CoMutex in order to protect them.
>>>
>>> Use the same mutex to protect also BlockCopyState in_flight_bytes
>>> field to avoid adding additional syncronization primitives.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/block-copy.c | 55 +++++++++++++++++++++++++++++-----------------
>>>   1 file changed, 35 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 2e610b4142..3a949fab64 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -83,7 +83,7 @@ typedef struct BlockCopyTask {
>>>        */
>>>       bool zeroes;
>>> -    /* State */
>>> +    /* State. Protected by tasks_lock */
>>>       CoQueue wait_queue; /* coroutines blocked on this task */
>>>       /* To reference all call states from BlockCopyState */
>>> @@ -106,8 +106,9 @@ typedef struct BlockCopyState {
>>>       BdrvChild *target;
>>>       /* State */
>>> -    int64_t in_flight_bytes;
>>> +    int64_t in_flight_bytes; /* protected by tasks_lock */
>>
>> only this field is protected? or the whole State section?
> 
> I guess you figured it already, here there is only in_flight_bytes because in next patches I take care of the others.

Honestly, I don't like this way of introducing thread-safety. As I show below, we should protect not only structures, but also the logic working with these structures. And simple protecting access to some variable doesn't make much sense. Critical sections should be wide enough to protect the logic. So I'd prefer introducing all the critical sections together with the mutex in one patch, to have the whole picture.

> 
> [...]
> 
>>>   }
>>> @@ -213,11 +219,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>
>> Looking at block_copy_task_create():
>>
>> First, !bdrv_dirty_bitmap_next_dirty_area() doesn't take bitmaps lock, so it's not protected at all.
>>
>> Next, even if we take bitmaps lock in bdrv_dirty_bitmap_next_dirty_area() or around it, it doesn't bring thread-safety to block_copy_task_create():
> 
> The simplest solution here seems to protect bdrv_dirty_bitmap_next_dirty_area and also bdrv_reset_dirty_bitmap with the tasks lock, so that once it is released the bitmap is updated accordingly and from my understanding no other task can get that region.
> 

Yes, we just need to protect larger areas by outer lock, to protect the logic, not only structures itself.

> Btw, out of curiosity, why is bdrv_dirty_bitmap_next_dirty_area not protected by a lock? Can't we have a case where two threads (like you just mention below) check the bitmap? Or am I missing something?

Hmm, don't know) Probably it's a bug, may be not. We need to check its callers.

> 
>>
>> Imagine block_copy_task_create() is called from two threads simultaneously. Both calls will get same dirty area and create equal tasks. Then, "assert(!find_conflicting_task_locked(s, offset, bytes));" will crash.
>>
> 
> 
>>
>>> -    /* region is dirty, so no existent tasks possible in it */
>>> -    assert(!find_conflicting_task(s, offset, bytes));
>>> -
>>>       bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>> -    s->in_flight_bytes += bytes;
>>>       task = g_new(BlockCopyTask, 1);
>>>       *task = (BlockCopyTask) {
>>> @@ -228,7 +230,13 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>           .bytes = bytes,
>>>       };
>>>       qemu_co_queue_init(&task->wait_queue);
>>> -    QLIST_INSERT_HEAD(&s->tasks, task, list);
>>> +
>>> +    WITH_QEMU_LOCK_GUARD(&s->tasks_lock) {
>>> +        s->in_flight_bytes += bytes;
>>> +        /* region is dirty, so no existent tasks possible in it */
>>> +        assert(!find_conflicting_task_locked(s, offset, bytes));
>>> +        QLIST_INSERT_HEAD(&s->tasks, task, list);
>>> +    }
>>>       return task;
>>>   }
>>> @@ -249,25 +257,29 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>>>       assert(new_bytes > 0 && new_bytes < task->bytes);
>>> -    task->s->in_flight_bytes -= task->bytes - new_bytes;
>>>       bdrv_set_dirty_bitmap(task->s->copy_bitmap,
>>>                             task->offset + new_bytes, task->bytes - new_bytes);
>>
>> Then look here. Imagine, immediately after bdrv_set_dirty_bitmap() in parallel thread the new task is created, which consumes these new dirty bits. Again, it will find conflicting task (this one, as task->bytes is not modified yet) and crash.
> 
> Also here, the lock guard should be enlarged to cover also the dirty bitmap. Thank you for pointing these cases!
> 

Yes. And then we'll come to most of the logic covered by mutex, and we'll not need atomic operations. And nothing bad in doing simple operations with variables under mutex, it's a lot simpler than bothering with atomic operations.

> 
>>
>>> -    task->bytes = new_bytes;
>>> -    qemu_co_queue_restart_all(&task->wait_queue);
>>> +    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
>>> +        task->s->in_flight_bytes -= task->bytes - new_bytes;
>>> +        task->bytes = new_bytes;
>>> +        qemu_co_queue_restart_all(&task->wait_queue);
>>> +    }
>>>   }
> 


-- 
Best regards,
Vladimir

