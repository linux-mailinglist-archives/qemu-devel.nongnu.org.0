Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EF36B003
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 10:54:12 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lax0N-0002Qo-4w
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 04:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lawyj-00015a-5c; Mon, 26 Apr 2021 04:52:29 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:9381 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lawyf-0001M5-EG; Mon, 26 Apr 2021 04:52:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOgefOZCRXzkcSxA4qhYj5tVepsWjGJBR05uwR6c9tTBqsXG22zRFbIC+RnH0JydCm6pssOBJFSgfSxZ6FAnfDmOB2kI3q9/ci+TToIvaRjKAX5F8fpMd+rYIHgnUy8lMIDAMrPUETfpyxFzhpmd2fjbwvrmrVpMM+4ZV1q7W8CExVlPLemmnpSHPuKWqx9U/f/NEpElHlRFmUgHh7ZHgNRikielWAE2ActXwM90KEM+1vsyptitNYwtYufWcb+eaOvQD48aTtA/VTRQ0oIxVF6IPa/NxchdNSDCWeRSbx8tN3Lmqo7LYBW8/3l6cawEoVYQraiLEiiX8FgA6g8C8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+YC18MoHke0NXsA951ONQKwCSoMInPmEEiZamShgU0=;
 b=OGNF062iiaZnB7d9Tuk3OGZI4OaFpTVkROwInZ7ARb5xJ69y6OC8vRzVNVOun/wumc7vUuLTB1fUlU3Rq0AKCvA7aypVxGsZi3VFjG/974oYMoYgjU7DyBOqEAK36S85AMVwzgZvD/bc5X4T7k4NY8t8JQAPxMAh9zghE4k7u9bpF4VwuPWd1ilbwUl0hR2LF+mbpl5wtYWDa+NAsPtgQIKVkhb6YLv60ygSholiHM4zzt3F47GOBu1oqPLYvpZlMeWz7V1HuqDH5zB5P9vbktpkILe5p5FobrukQ179s7lYHzifQLc/u7/L5qEI2i7PVCzx81QfBe3h39hkF3iHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+YC18MoHke0NXsA951ONQKwCSoMInPmEEiZamShgU0=;
 b=LTlHKKP4ensaqkOXAbKRkQThsh4Kds6gG6hVd7mphqyzKycyQBmglaVqFloGGkAe4O41dWr85zyBTQdE5Zx6ijgCkoxoEH32AW8dkuM9DNK/UJK2rEXp9SqAmGEcAEZf+YbIsNv60s70cYxLGE9YU3j7oKPebDDryIwNU2L56d8=
Authentication-Results: euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3288.eurprd08.prod.outlook.com (2603:10a6:209:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Mon, 26 Apr
 2021 08:52:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 08:52:17 +0000
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com> <YIKc9pCDmN2FRDV4@rvkaganb>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5124ba67-4f99-2446-ec80-bc98ad3caf05@virtuozzo.com>
Date: Mon, 26 Apr 2021 11:52:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIKc9pCDmN2FRDV4@rvkaganb>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM4PR0902CA0023.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM4PR0902CA0023.eurprd09.prod.outlook.com (2603:10a6:200:9b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 08:52:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65e4d00d-c088-4320-0469-08d90890985c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32888B1D2F22E7EECD01903BC1429@AM6PR08MB3288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvGc6uHaxESj4gdYkHedHGj7DLWK60SFB9khApn30vzH11044h4nq1wdI/aHaDpcz4Q6f2mLOY/Xa7C/SAuMVD6QL8l2LcLR4oAnk5NdHEF1h4+UbbeRYU2VzMlHxbTGhVlSsoDRmF3PD4Z2n65HGAWiSo4hy2jgR9PRdeVYbzmIoemJ/4UMAbTN+L9AFP62yaeXjPzF1o1m3XLW1yMgQcTbnExOPhfnUZ/T01mysjkw4v8zUi4MxKwp2J8K+Gc/zGKabEsR2smqFtdjnfIwUVsWV40fO0gry6B0EYIsRlvzskiXOCj4WzUh40B3/RqF47AJZnKBStHqQGpxvhr5iLkkDDjKLMLHiD3SamvilZqugxHvzxESpY3WaciXArPIIrHLtF4dHsdKKoB+vKodJfasGtH9recK4D3Fi1v/b81xJEFLOWOnAMVsvFwSywUI4JAUel8ykvDdABA/4bCDoiqnN+M6/wMFfUO/za34Jcm0OjZLEHUDielpMpeg52JHe+/9CoWyAnU+iL71AmReYURwqgIXMv6yTWKNK4S1943lNsHARaZAqjwavUXBT6UsSsZptcBanEca5Lrp5XHFVyUaIs+X0hwNkkaZal+d/SDRDnqyKirgjq2UPFhWEaNHr5IQSCAlewGjSO1gjYUv35ZNiXkY9TtEdFhjpNBb5yh0FwkdtIdLw4520/05eeiQ+04h8Y+ot880hFuaomikQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39840400004)(31686004)(31696002)(86362001)(16576012)(478600001)(2906002)(8676002)(8936002)(83380400001)(186003)(16526019)(26005)(956004)(36756003)(6486002)(38100700002)(38350700002)(66556008)(66946007)(5660300002)(2616005)(66476007)(110136005)(316002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzMvUmt0WEJRWks2QksvaEZLekd6N1Q3WUFDckpVOUhVejU4TTJ4Z0NYamRu?=
 =?utf-8?B?cUNPRzZ4WmtrdEZyTFZ1QVF6cnNvMVU1ZjcycEhTdC9zVWRldENkeFBwNWR4?=
 =?utf-8?B?QkVBa0poeTc4YWs5Y1lFanY0V1dLNmhocERlZzBJL3cxS1FTUThNMHRxZ3dr?=
 =?utf-8?B?ekdDUVE1LzJ1ckR2WlpoSkh0bWxieXN5ckxnY2JwMmxHQmRvNFRVMGlUYzkr?=
 =?utf-8?B?UmpHZlMybWVGLzR0L251SDF1ZURsU3pGVnZ2c0ozc2ZPMEc5YXRwckI1VTBE?=
 =?utf-8?B?elFQUlRDekZRcTVsaE83VDE0WmVtV0FNaHdadHRZQmtJOHdtdnJMZUhab2pE?=
 =?utf-8?B?QU82K3ZRK2VlSktsa0dMSFFJZ05mUVpleUdZRXk1SkZJdDJvU05QdmJqRVpC?=
 =?utf-8?B?UHRxb05sUjlFTWNuRVlKYXU4UTE1U1ByamNBOW52cFA4VjRQZ0NCV0dqcndx?=
 =?utf-8?B?TzU4ZW1lL0ZyYThZQzAwNk5XVDBWZmtkMExuTTFqKzg2UVJaakltSVBXTjhx?=
 =?utf-8?B?Y001VUJwelFkd0ZTSlA4SDVIQ3FKRFhPbEg2N3gvQ3RZbmpPNFQ0amhMeEN5?=
 =?utf-8?B?RmlGTXU4L2sxQXdEVEF3bjBCdWlYa3M0TXJRSEZBRk44MnpCWGU0SFhrd25P?=
 =?utf-8?B?ZnRCc3l6aGNpTjNsWEI0NXNUQjlsWHdtYXZiYS90c3lZSTVhMUdTTUx6cSty?=
 =?utf-8?B?M2I1T0w0TWhSY25ZSmtLUW9XckpIanVmRjBYSG9YYUc4d0ZOK04xNnZwT3hw?=
 =?utf-8?B?Zyt1dlpPRnJoZTIwYXpIcGlNdDR6Qnp2UE12eWdXQytZL1lNR3k1MXNBWERM?=
 =?utf-8?B?VkpYWk9zaFd0Q0ViTnBYSGx4KzEwSkdCMm9UN1RrVnBRN0cwNHdGMXI1dHNT?=
 =?utf-8?B?ZlRaVGhHR0VvditscmhlME5KNi82cmxLSDhFTjNld1dENzFQdmk3bjl4UmNC?=
 =?utf-8?B?M2tpNnhoUVFkSTd1bSt1bEZlOE02Z3ovTlB1d1BXK0YwVFpnandUYTZPdnhW?=
 =?utf-8?B?bHNObVA4a1krN0Z5V0I3MnpVUHR4Tk1MbnU1eUdQMzRjeS80VWRCcUxhWXBo?=
 =?utf-8?B?a3daekE1SDBjNTZtbGxDSVdKUlY1WE80b0dlUFVaOEcvQUhrL2M2N3gwNm13?=
 =?utf-8?B?UmdTRjBOb05DTkFyQlFDRmxGV3N4b05UQjFoMGRkbnRjWXc0T3dqK1JYbjRm?=
 =?utf-8?B?akdLS0gwd0lEZTY0RlNFTXZyV2h5OFEzaWEzR0YwbnpnalNCNlhJQVJLeDZV?=
 =?utf-8?B?cTdLTFBQM3N0VVZJS3dKMXNRUE5sb2R1SnBhcFc3bW1xS0g1ZUMwRnVEeVN4?=
 =?utf-8?B?cVVVMkh2V1BQZm5QZStrTC9DblVSTlc1RUdEbTBGcnZuaDh2bWVRY1VLZDJO?=
 =?utf-8?B?UzZDeVlPYmpOOXoxWnpJVWM5VWYrQVhGU2VuV1pQYUtHSVZyZnNYdis4bWRz?=
 =?utf-8?B?aWdFSkJaVzZMdXpqbktTRjhIc3lSSFhmZGlIVkZub1lSTEFWUDRSaUNHTzRR?=
 =?utf-8?B?WHpZN2ZOZHVlVFJEOHpjS3NqS0RXRE9GY095ODBjT2hxYmV2VFFwdUxvWWZk?=
 =?utf-8?B?ajB4RFZEdlF4SmxWQ1M0ZzZEaXlvT0ErZzJrdkZYdTJnYml0c0U3OEF3VjRI?=
 =?utf-8?B?OE05Z3hIZ1J3M1ZEcWZYR20rL2d0dUpOOVFNa2VvbytIa1RHenlNaUNkT25r?=
 =?utf-8?B?RW5qaE1EbmRJZ2h3UHN0VjN2OG9MSmNSQ1pqcmo0TTZDaXJPUXNIb3dWMHNZ?=
 =?utf-8?Q?DPYc2OUTcLmJHin4YabA1FPZGBZOqCBVn2knKB1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e4d00d-c088-4320-0469-08d90890985c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 08:52:17.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp4/0ylW/uuhz8cA9dKx9VC2IE/hLl5vJ5BcwInv1T+pGdQzNLagPn0tUH03EheKptTh2ZFBRheOmK0UEtdkGmvM1rjjpoTBn/slAhzlTRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3288
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
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

23.04.2021 13:09, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> With the following patch we want to call wake coroutine from thread.
>> And it doesn't work with aio_co_wake:
>> Assume we have no iothreads.
>> Assume we have a coroutine A, which waits in the yield point for
>> external aio_co_wake(), and no progress can be done until it happen.
>> Main thread is in blocking aio_poll() (for example, in blk_read()).
>>
>> Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
>> which goes through last "else" branch and do aio_context_acquire(ctx).
>>
>> Now we have a deadlock, as aio_poll() will not release the context lock
>> until some progress is done, and progress can't be done until
>> aio_co_wake() wake the coroutine A. And it can't because it wait for
>> aio_context_acquire().
>>
>> Still, aio_co_schedule() works well in parallel with blocking
>> aio_poll(). So we want use it. Let's add a possibility of rescheduling
>> coroutine in same ctx where it was yield'ed.
>>
>> Fetch co->ctx in same way as it is done in aio_co_wake().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/aio.h | 2 +-
>>   util/async.c        | 8 ++++++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/block/aio.h b/include/block/aio.h
>> index 5f342267d5..744b695525 100644
>> --- a/include/block/aio.h
>> +++ b/include/block/aio.h
>> @@ -643,7 +643,7 @@ static inline bool aio_node_check(AioContext *ctx, bool is_external)
>>   
>>   /**
>>    * aio_co_schedule:
>> - * @ctx: the aio context
>> + * @ctx: the aio context, if NULL, the current ctx of @co will be used.
>>    * @co: the coroutine
>>    *
>>    * Start a coroutine on a remote AioContext.
>> diff --git a/util/async.c b/util/async.c
>> index 674dbefb7c..750be555c6 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -545,6 +545,14 @@ fail:
>>   
>>   void aio_co_schedule(AioContext *ctx, Coroutine *co)
>>   {
>> +    if (!ctx) {
>> +        /*
>> +         * Read coroutine before co->ctx.  Matches smp_wmb in
>> +         * qemu_coroutine_enter.
>> +         */
>> +        smp_read_barrier_depends();
>> +        ctx = qatomic_read(&co->ctx);
>> +    }
> 
> I'd rather not extend this interface, but add a new one on top.  And
> document how it's different from aio_co_wake().
> 

Agree, that's better. Will do.



-- 
Best regards,
Vladimir

