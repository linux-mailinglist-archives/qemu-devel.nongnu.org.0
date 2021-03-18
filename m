Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024DF34095A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:55:55 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMv05-0000N1-WD
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMuw3-0005GR-OJ; Thu, 18 Mar 2021 11:51:43 -0400
Received: from mail-eopbgr10118.outbound.protection.outlook.com
 ([40.107.1.118]:53646 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMuw0-0003ap-Md; Thu, 18 Mar 2021 11:51:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEjGDFXsGlbw/pQgS9Vb5h8fghb3LB15hBo0qoajQnQfVwkHKAY9XU1WhhmwbjsVVbez424MFXDsq7YW/OjLmedU3XJpmod7OK5ThqbT4pFJoGrDAHVWI/10VyvM7UxYItRM9uygSuXJVOTrxwYwSwDmQ9MSXOcgag2wIeEw0U9FcZ7f9XHJn8hUcdJJJ1D2ANd2wn0PHl83B3GcxOrrGI7Me5wsN+h//wScuTlnldU88hRGOrrsmkh8prdEgjn600EnLsoEIq+EMr8b4VpsybDuhgduFIiEOKVmKISLufX+AufRNsUdw04pcNBYeqIcs4nUK0hi58gDfSOZvOfSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zxov9n+3YJ/eFoqmTcJ6T3tzHOYYQdoodM4Xhf08Xuw=;
 b=AuQSJCf/0UR4LrWLycV2Lxgf6/3Z5W67jtWHnr5e+sY8N6ryYv+5+CrSeam7vpq5uY6O8YUIJyKBmosuuSsX3DytmWux5L3G6/dICKJWn3rJeBvGzI9dSp3G259sVcfAZoD58QYZ0T2/tkH0UEqn5oo7mHaK/ilhyaM13YsMOPvKNUuFoAsGEnkpAQjhkblaSu1TIomLUpZkZmGa8vLuIpolVNj6uz9ZoiuYLu2N71omMHrIhKlbSYhwedt22o0rtaEO7w2w5uH1MiTMvsV0WbyyFzy/9w5WfprArLrt+hZ7encG/256PokVwi6yx6F299eqx0hM6MVrHEzwQt0A7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zxov9n+3YJ/eFoqmTcJ6T3tzHOYYQdoodM4Xhf08Xuw=;
 b=ElzJ6Ag52QT6Bf5bug9X+4STJiaW9BUP8QrmU2KVxbApLbw7Nljsdq0OmMERrVgStv5MneQxDah2o7Q02SJvAlRpO7Pn2eYxF2wFZ55AxeE4XFYcunFS0Dj5J+fOTQAT/Fzeqd7wf5gVFY2AL5bFLeb3aGZjwjNlw4V/D6Nlpgo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 15:51:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 15:51:37 +0000
Subject: Re: [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
 <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
 <93cd353e-1b9e-4f42-a404-1db0d1972cbb@virtuozzo.com>
Message-ID: <75d9925c-2826-9877-fd73-70b600338067@virtuozzo.com>
Date: Thu, 18 Mar 2021 18:51:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <93cd353e-1b9e-4f42-a404-1db0d1972cbb@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:207:3::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR05CA0141.eurprd05.prod.outlook.com (2603:10a6:207:3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 15:51:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c80562f0-d6d6-480e-173f-08d8ea25b685
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631E27FBDFD75ADC69A2C08C1699@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhBsPRxsZEvcRzwVbt9QqCuTAYSK5dcOxQMKKpavzin4/sPoE+EYJ6Q6PP7GDsXSzN4FnMbc8koBiNzOuXzNMK0fIFUvx0zbybws7anLGHtMkhPOFJvLpgZk5I35Dwb0v86tVQnvtXXppcmPH4tDYYpVfMBN3+OBeAVEJuhsNMW24RwUCpUcgYL1pwMHIwHRuBYtavRylz5YEL55DGuzdu3WZif7/JFovz/mLL7r4XYbUKzBYVBMwI9YgUgwaEESDsPtYCTnL+0uqnGkTPwMayZo3rky6UBZ2kIb2TS2+0CqvR5B4qIlL2hkEzn0Y1AA3VluiIrblb4lcG4LPqDCltAkIVs78dLA7NXlFKBk+CZZTgx9LJTrvZYC/UXFI9Ky3/WewSnYY0K02E5JvxD5Q6o0DXxbM0oVnKj4F05qHVcM2Pw4J5ok0yZtMHCiDt3H6Zbs/nDbBK9jnJtbqPD0MozbzI0732x48a30Bd8tQDtmJTe8IdFVIBNu88Xw4ZFLM7MfNdsWgCRQcT++9TuSYPPRlRSiI9AEgiCLk3M1nIdNPFOkU64aLBfaxeDHViyZgELPteAsj0oZ/+W2unvqWLeRlYS/13EzHewe9wkCGvp4mPJrqNsJso30tH0DMboZpaxwIUVchdKPw97U7tXh90qVQsRDBzk3oHuQaziM5cfoMUHCk2I0fDW0OGop5Lfh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(346002)(366004)(136003)(376002)(66476007)(66556008)(8936002)(66946007)(52116002)(83380400001)(36756003)(2616005)(956004)(316002)(16576012)(31686004)(31696002)(8676002)(478600001)(86362001)(26005)(186003)(16526019)(4326008)(38100700001)(6486002)(5660300002)(107886003)(6916009)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T20waFpacU9BT1cxYWk4TVFqdHFPRWRTREtUK3JYOTN1NkRjZEFzdnZKUW1E?=
 =?utf-8?B?ZUJHMVF3VmJzWGdFRDdTY0NoZUpvUUdzTEc4UGh1dUk2cmNJSURFdjJRQVFE?=
 =?utf-8?B?aXBxMzI4cXRFSVJLR1FBQ1dNZWZDeEhIQktxK2ZkYkJuMmpzZWppZFRNeFc0?=
 =?utf-8?B?emNtTklGUVMyZUFva1RqbXlqVzVNOWw1aHpUU0FLOE95RytZelowQlordXZt?=
 =?utf-8?B?T1YrVDBzMEpKb2pOUE9Jd1pDeSt6OEorRlFxV0xXZTZLVFR6RGluMFpTNEdO?=
 =?utf-8?B?SE93MnVmQTVRb2lMbXZsNXFYUXpOMkdWSmtwZWlybFNzcWVMdHhlaFR5eW9C?=
 =?utf-8?B?Y3NaRm5XUEROY3huREJzMTlzMjdkSVRiVE5KQlUxK1lUZDBWY1J6Kyt3clNM?=
 =?utf-8?B?Rzloc2ZBVEtvZUFDZlk1K0Z2YU5ySytCTnNWbU1CZHVXR2VYVWlvekNhcVAv?=
 =?utf-8?B?MFFtNWJsVWlSbDlTNys2SmREOGxwcDVCY0ljb0FaTkhFTDhPRW1zNWVhQmZ2?=
 =?utf-8?B?bWgwemdQR3o0TkJHckdraWZ0NEVsYjVLcXpZSlpQQ293QVZLWmhhQ3pURTMr?=
 =?utf-8?B?bjc0V20vT0FKT2xFVXJLZWhsZVRCczhHYnhzTS9TcSsrelhBb2QwSzgzSG5I?=
 =?utf-8?B?VWVrRkxDNnlWYzRwSFA3TUxFb3Z0cVI3VCttMFQ2V0duS1cwdDRtOS9nMFly?=
 =?utf-8?B?eEJVeFhxSmVHQ2ZWcWovcmxxME91dzh5dHBuWXNPYm1zYTVZSXNnSkNtQ05W?=
 =?utf-8?B?aURXd0NLTTVHRE9oUmZGdmZRdjJEYmppd3V5SUVaR2cwc05JYzFmUFJvLy9M?=
 =?utf-8?B?eHBnZUNwMXExaUxSangrZkdIK1NhaHBXOGxkb1JEZnlQYm1YMGpMN2I5UE9p?=
 =?utf-8?B?YzhjeUd3U1VuVE4rbTZod0d1Ymw5NTZpKytCSTRoelZjT1pZeHpZM1RlUE5J?=
 =?utf-8?B?Sk5wQzkvYWNSenRyNFQ5blY0K3V5SXhWS042OVk4VEo5WWVYK24xVFAwOWtV?=
 =?utf-8?B?MUUyeWJmc2VjQUJXVnNSNlVDSVFmNmt6dWRyblZ2NUdLa0NqdDN2N0kvSlpy?=
 =?utf-8?B?N0ZJVzAweUttN3hDa25HTnlOYkRnanNKbGNyanErTDUvVGxuU2lXODdRNHZU?=
 =?utf-8?B?OTdydUdQZ2hLenNzRGhoNnBTQys2RW9hVTk0R0tsdUo5WGpJU2dqaFRKdkxa?=
 =?utf-8?B?cVdtUFJYN3JzdW4rdUhacmtuS1R4c3RTY21nNVFMZUxVVng4U1RIdldCbkZG?=
 =?utf-8?B?SWErRUwvdEZsaWlLRWtvV1IxYlpiQlIzdEd2MllSOEdzYmJtdXB6ZzdxTk9E?=
 =?utf-8?B?QlJNa2JObDFXUmJxdG5FZ0I3YThWc2loenNBMHJaR1NhdVhhZTJzc3JacjMw?=
 =?utf-8?B?eHJSQS8zN0tSdGRVamtlcytDb0ZVbjA0ZEZrb1QvY09tbXNCSFMrcTBKT01Z?=
 =?utf-8?B?bXdKT2pGZVhsTUZzbGdFRmxBdW9qMEJBSWIwdFFwQ09MZVl6YmtuL1JIdVdn?=
 =?utf-8?B?Y1lVbTJEQmdraUlzL3VpNFF2a2JUeStKanZlYmdiVEl5bENTWFVJMWtSNXhy?=
 =?utf-8?B?azBoeHN0TnNiNTdmR3pwSGl5SWdtSDk1eFNURVo4Mlc5QkNXZEZLT2xXdCs5?=
 =?utf-8?B?YkVkMXUrNlRCYVJhcWZJeVdLSFNMd2k0STEzTGRVa1dBSDViZm1jMkh3VTJN?=
 =?utf-8?B?eGp4dUhIZFVrM0dCUzg5aDVyd0Eya1hRcTdCaVlHWThKRU9zbzFhNmZxb2lR?=
 =?utf-8?Q?INRo/6lRzZn+4NLODYoZcg9KwDhYC3boSRGkPUd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80562f0-d6d6-480e-173f-08d8ea25b685
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 15:51:37.0736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJz6T5s77OQkDg59Vp5pG8ZCrOJz4V3H5m645DZKPoHvctAUCjUuDNx8q4q3lW5PTH4rjBXSjuox4TAt8aqve56nHvjCikbCRTuLzIkvGlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.1.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

18.03.2021 18:37, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 18:24, Kevin Wolf wrote:
>> Am 25.02.2021 um 12:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> Hi all! It occurs that nothing prevents discarding and reallocating host
>>> cluster during data writing. This way data writing will pollute another
>>> newly allocated cluster of data or metadata.
>>>
>>> OK, v2 is a try to solve the problem with CoRwlock.. And it is marked
>>> RFC, because of a lot of iotest failures.. Some of problems with v2:
>>>
>>> 1. It's a more complicated to make a test, as everything is blocking
>>> and I can't just break write and do discard.. I have to implement
>>> aio_discard in qemu-io and rewrite test into several portions of io
>>> commands splitted by "sleep 1".. OK, it's not a big problem, and I've
>>> solved it.
>>
>> Right, this just demonstrates that it's doing what it's supposed to.
>>
>>> 2. iotest 7 fails with several leaked clusters. Seems, that it depend on
>>> the fact that discard may be done in parallel with writes. Iotest 7 does
>>> snapshots, so I think l1 table is updated to the moment when discard is
>>> finally unlocked.. But I didn't dig into it, it's all my assumptions.
>>
>> This one looks a bit odd, but it may be related to the bug in your code
>> that you forgot that qcow2_cluster_discard() is not a coroutine_fn.
>> Later tests fail during the unlock:
>>
>> qemu-img: ../util/qemu-coroutine-lock.c:358: qemu_co_rwlock_unlock: Assertion `qemu_in_coroutine()' failed.
>>
>> #0  0x00007ff33f7d89d5 in raise () from /lib64/libc.so.6
>> #1  0x00007ff33f7c18a4 in abort () from /lib64/libc.so.6
>> #2  0x00007ff33f7c1789 in __assert_fail_base.cold () from /lib64/libc.so.6
>> #3  0x00007ff33f7d1026 in __assert_fail () from /lib64/libc.so.6
>> #4  0x0000556f4ffd3c94 in qemu_co_rwlock_unlock (lock=0x556f51f63ca0) at ../util/qemu-coroutine-lock.c:358
>> #5  0x0000556f4fef5e09 in qcow2_cluster_discard (bs=0x556f51f56a80, offset=37748736, bytes=0, type=QCOW2_DISCARD_NEVER, full_discard=false) at ../block/qcow2-cluster.c:1970
>> #6  0x0000556f4ff46c23 in qcow2_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/qcow2-snapshot.c:736
>> #7  0x0000556f4ff0d7b6 in bdrv_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/snapshot.c:227
>> #8  0x0000556f4fe85526 in img_snapshot (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:3337
>> #9  0x0000556f4fe8a227 in main (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:5375
>>
>>> 3. iotest 13 (and I think a lot more iotests) crashes on
>>> assert(!to->locks_held); .. So with this assertion we can't keep rwlock
>>> locked during data writing...
>>>
>>>    #3  in __assert_fail () from /lib64/libc.so.6
>>>    #4  in qemu_aio_coroutine_enter (ctx=0x55762120b700, co=0x55762121d700)
>>>        at ../util/qemu-coroutine.c:158
>>>    #5  in aio_co_enter (ctx=0x55762120b700, co=0x55762121d700) at ../util/async.c:628
>>>    #6  in aio_co_wake (co=0x55762121d700) at ../util/async.c:612
>>>    #7  in thread_pool_co_cb (opaque=0x7f17950daab0, ret=0) at ../util/thread-pool.c:279
>>>    #8  in thread_pool_completion_bh (opaque=0x5576211e5070) at ../util/thread-pool.c:188
>>>    #9  in aio_bh_call (bh=0x557621205df0) at ../util/async.c:136
>>>    #10 in aio_bh_poll (ctx=0x55762120b700) at ../util/async.c:164
>>>    #11 in aio_poll (ctx=0x55762120b700, blocking=true) at ../util/aio-posix.c:659
>>>    #12 in blk_prw (blk=0x557621205790, offset=4303351808,
>>>        buf=0x55762123e000 '\364' <repeats 199 times>, <incomplete sequence \364>..., bytes=12288,
>>>        co_entry=0x557620d9dc97 <blk_write_entry>, flags=0) at ../block/block-backend.c:1335
>>>    #13 in blk_pwrite (blk=0x557621205790, offset=4303351808, buf=0x55762123e000,
>>>        count=12288, flags=0) at ../block/block-backend.c:1501
>>
>> This is another bug in your code: A taken lock belongs to its coroutine.
>> You can't lock in one coroutine and unlock in another.
>>
>> The changes you made to the write code seem unnecessarily complicated
>> anyway: Why not just qemu_co_rwlock_rdlock() right at the start of
>> qcow2_co_pwritev_part() and unlock at its end, without taking and
>> dropping the lock repeatedly? It makes both the locking more obviously
>> correct and also fixes the bug (013 passes with this change).
>>
>>> So now I think that v1 is simpler.. It's more complicated (but not too
>>> much) in code. But it keeps discards and data writes non-blocking each
>>> other and avoids yields in critical sections.
>>
>> I think an approach with additional data structures is almost certainly
>> more complex and harder to maintain (and as the review from Max showed,
>> also to understand). I wouldn't give up yet on the CoRwlock based
>> approach, it's almost trivial code in comparison.
>>
>> True, making qcow2_cluster_discard() a coroutine_fn requires a
>> preparational patch that is less trivial, but at least this can be seen
>> as something that we would want to do sooner or later anyway.
> 
> 
> Actually, recount of cluster may become not only because of guest discard. So correct thing is rwlock in update_refcount(), when we want to decrease refcount from 1 to 0.. And for this update_refcount() should be moved to coroutine, and better the whole qcow2 driver..
> 
> 

Or I have better idea: we can fix only the case when update_refcount is called from the coroutine. As other cases are already broken, as they modify qcow2 metadata not taking qcow2 mutext.


-- 
Best regards,
Vladimir

