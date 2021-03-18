Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4134090B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:40:47 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMulS-0005Cx-LF
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMuid-0003Zb-3q; Thu, 18 Mar 2021 11:37:51 -0400
Received: from mail-eopbgr00122.outbound.protection.outlook.com
 ([40.107.0.122]:1662 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMuiZ-0003go-Rx; Thu, 18 Mar 2021 11:37:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBwuW+F/91X4km8pZpP3gl1gb6B4cxpwvznFG+0nOTtBKQioXa3Q4GryhVAdMWpqLE0zDt8HkoJiNBrVQI5NjiJWmzzIr/xRgHuwDl6FYP0mR3OFebARpXXrSQ86W39t/51p4wfMgphyjm/N/PZ7SdxzogSksp9qI9SoOuRNqUwpfYzonNE9b2/mJqLORokULG2YR9MaeZIhS/ab95ZZVlruo5TismP1T4Kh4w9w1I0NSYOVznp49658ECb1moc9TSIg+feWN3+GnJQXKgPOhEWJNXRWqgs7glNlAAv+yQx+RBIMypEpXlJzANh/70xCmkDzb/c4JwTjWkwi3cVsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCxct72LIkhFrQcSnA40/QqpDVGjE0c3OH0cPCYQrIk=;
 b=AuoTnZt7Sgtl0yjbIiQ0ZFDzlMJOsKqEozdzZ6BRahaOBDEmVAiSCX7UmJ4MdOu73/BnpxKB+znj5KG54atS9LVBacyNIfHRuzeRdNe3GCRdlS7nagTDs8dRbjlWqLzrNFIESFgWHsTokFWzSipg45s/mUA3ifuM63KQeNs7cSVYKT5v/O9o6e+eAj/FvYbEX+kXFJBK1I/U0wWooj15q4PiSfcBWpBShyJ4wmeXkUt9HpUU3nddAjgYr+eb/WfZIcSb8bL2iUuz9KRQZ3ERQCdEfP99f4Fl3MfLS8CwDS9zNxanfQ3sXEHW7sa0d75lR4f3O+Oyi6iFSFdnqYef9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCxct72LIkhFrQcSnA40/QqpDVGjE0c3OH0cPCYQrIk=;
 b=kXd1IiBhSBFYFUgmr7IjomsxMI00V0q6ijH7KA5BX/km2/dBqNrllR51PU7wzS7+oJh6xsgU4m58ql03QYpCXA1hVKV9w6wmhnXaatUu3QyjW5MVXRNMPSqbSNauo4cOsli+poKofWT/eMme8CkznCql9EG6FQao+gI/Pb/U1qY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 15:37:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 15:37:43 +0000
Subject: Re: [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
 <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <93cd353e-1b9e-4f42-a404-1db0d1972cbb@virtuozzo.com>
Date: Thu, 18 Mar 2021 18:37:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:207::33)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:207::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 15:37:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0afa7bd-e6e9-40bb-b4f8-08d8ea23c5cd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB629487A2CF3E87949FA22622C1699@AS8PR08MB6294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cuAcOZ01YCQZv4PDBQHyinzNp/FEWZkczDxscmNxyeVC+mJ9b/FJFhZg9TJAcvvkbfdzKegBd9U3xcqF+o6/xkQXu7Z4C9CCcrhEH0sD5vg2dMNqrFvAlebyVn/Zyd4WvYoKOYUC5eDGkvR9YnCr1uhRelZCeejTM8/NvXYTVjS7iYOx9IxWDjlYZzaQJ8umJIT3q7UsDbXrvATey+ogQmys0V9/bK4IePxq2QYHLT+mz8IsYlW9LVFazbYxFiPJue3jN4ZIi8EGV9kN+dCzwC9/ziENwLs8rPL7MADb7nnhzJxg+d4a1HlfGws45uzvwq9ejV5CVDPfPRLZslnBz4B6EZ8bN7BuO4qN+tdcPsotPasJafzbLuejjsLQmSBSGxo9WWmagYPf4s3AHJ2MgBf2Ptr3jlT38kl6EQ7lP+OEqUBMf89F6szTSQvu57xo0tADw2SweiHAZFd3CTY5ujqqoGIYSrF8mPCDsY1Pf4/xbbHi3r1U+RNUXx3WhPBBNX+OWMDeAEwZU07fUI5wgi7ctggOLiYOi4OKNB5x86I2VqFfAJQs8bdE6CfpVuWK21+oVhE9/+DvU3amFSFiRQazIyogxd6kumaWI0taPBTSdsJfWzgLeWNzLrqGElPjO8tjQ6yB2Mn9VN6HSJiD3iPWrInq4TGK3z1OFBcwA15nIRk3vqvUfZZSp3MYN7G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39830400003)(136003)(86362001)(6916009)(66476007)(31686004)(38100700001)(5660300002)(66946007)(6486002)(8936002)(4326008)(107886003)(52116002)(316002)(31696002)(36756003)(186003)(16526019)(478600001)(26005)(8676002)(16576012)(956004)(2616005)(66556008)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWZBRWdOcVlLdGp3STFSaUZ0NTluUmlic2RJdUQ1Q25NU0ZNeStGaDhQWDBK?=
 =?utf-8?B?bjBMUlJuQXkwbHhLcjAybTJuYVhMbU5WRU1OWnhxV2M5Vzh1UkllMW5rblI5?=
 =?utf-8?B?RS8ydW9COTJtQzNhbEZTTmVnekU1M1pkWk5vUjZFaVc2bEVvSzB5VVZ0U0Qr?=
 =?utf-8?B?Q05OMXhoZlBqbEIrczREaGtnNEtPaXAvTkVKWXFXeTVCcDlCY1VFQzg1aDM5?=
 =?utf-8?B?SSs2c1dlMGwrZDk0UmJDdlE2R3NDYmVKUUNpaUpHL09NOVhLRVJJSEh6WEpW?=
 =?utf-8?B?RDRBU2M0SnlPUVhOUGE5VWxaUEgvNFJDcEQzeVlKaUhYZnVyVkJuVE5sdlZX?=
 =?utf-8?B?SUV3TzZRTlhHVWNpQ2tqL1h1MVBKWEJxa0tmVkZoYWwreGd5WjRIeUJKR2tB?=
 =?utf-8?B?akNwVFk4Ujd0Q1VNQy81Qm9yWEUyRG04UnpXRUNDMHVkcytONklJc1R5cTU4?=
 =?utf-8?B?bisyU0x4aFcycmxSeHRxTGQya1hhQVZHdU5zQkxraDk5Y0REc015a3dRSVZj?=
 =?utf-8?B?SFJJdmxOdFI5WXRmQmJieXJIdW1vN2Rnay9rbDhDVGcwbFdJTjlSUVRqblB4?=
 =?utf-8?B?RDM5ZG12QkxndGRqeGFCTUVGcDJLVGIxWktFWElrOWpzNzlIci9wd3FzK01t?=
 =?utf-8?B?eUpIYXVTYUtUd21RN2daY2VSNDFaL0FzWDBFdHM3eUFacTdBL3N3Z092T3hx?=
 =?utf-8?B?R09Ra0g1NDJpMG45dXFtWi9OOThYOUd4Sm1vZ1hWK1VDbU0rOHBwWkhaZ2Nn?=
 =?utf-8?B?ekJkVG15Umlyc0dTOE5oVi8xc2liL1ovQ3lTYVZOcFNpN1F0d1Rvb1Q3MUN0?=
 =?utf-8?B?by8xQ3krcTZnck1uVnNMMVlZWEpEaFRQL0xiVlZsMHdSSWpaTjFwcGdmWFor?=
 =?utf-8?B?WTA3SlIrN25iSWJMNVhibHNiOXlqSGhHdWhlRC9CV3hHQThQenpBWHpPTzQr?=
 =?utf-8?B?S3pJTThjUFR6TGI2cnpSUjQzZ0xhTG5XVjFuaXJ5S09YQ1BXQWJwb2twQVVP?=
 =?utf-8?B?SmsveWNBQUUzT2hkUVpoUi9IL2lmN1ZSZjAzZkFxQ05VTzA2czN0b1RxejVv?=
 =?utf-8?B?ZzNGakRFY2FtYXU1TjNLUkhBL3gzRWQ1RnVlM2U5RnlCcjR2YjhJbEcySDc1?=
 =?utf-8?B?MTFBWk5YR0diWFkxb3E5NFdndTVMdjdPdVdQcWF4K0VSTkFLUU45MTg4aS9a?=
 =?utf-8?B?NHdmNWF0Sng1aWxLQi9GcnJmVDdUZzJIbC84b2dUcWhXclVxQUFyaEdnUUJw?=
 =?utf-8?B?dFoxTG51VUV2bG5ZcUt6bzlKKzVJOXRjYTFGa0huNTAvUWhpaFYzTHV0N3pP?=
 =?utf-8?B?bDh6Ynl2YXkwTWhMZ3ZZSFdiQ1FCeVA3VXF4NnI3cGdpMVh1QnI3Nkxta3NZ?=
 =?utf-8?B?eTRIYlZpYmJHRXlJK2IydlI0SDJhTzlKVjlrTU9xQVFabjNLcG1rZittSzRo?=
 =?utf-8?B?cXJqdEVoQkZxdEUwMUNsaXAvdVJQV25wUy9Yb2dvaC9lM1AySlBSS0dMVjJL?=
 =?utf-8?B?cTlURHRuWDdtc0VhbVVzSmh3YmpqNWQ2L3IyZGlNa0VaSVp5aXlwU05GRVNp?=
 =?utf-8?B?NCszcjNoaS8vOUcxTTl2U2NoY050NFBtdzRyMlhFdVJZa3dNdVpXNXdzYTI0?=
 =?utf-8?B?Tndmb0U3Z0k4RXZXQ3NFTGwxZUdLajNGRENzdWtQVitKZUJ1Rm5vcE43VkpF?=
 =?utf-8?B?WG10MUF5ZEI4UXRtZjVHOVh2S3ViRHk1RnlRdnFSb3g0Z09VeElCRm53K1c3?=
 =?utf-8?Q?LCSfVBJn2gh1msn+0iOUB7m/cZcvIAYZyVnf2O1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0afa7bd-e6e9-40bb-b4f8-08d8ea23c5cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 15:37:43.8244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne9M29TIwGlPzHI590yp0MNNCZelFVfpfhKvXZ0MPnyXO9KuXmsBW8JPU2Pc5WZm0Gb3PQafqTsG5R51ZtGa5gx6ujmI99PDoO//uI/7+k8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Received-SPF: pass client-ip=40.107.0.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

12.03.2021 18:24, Kevin Wolf wrote:
> Am 25.02.2021 um 12:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all! It occurs that nothing prevents discarding and reallocating host
>> cluster during data writing. This way data writing will pollute another
>> newly allocated cluster of data or metadata.
>>
>> OK, v2 is a try to solve the problem with CoRwlock.. And it is marked
>> RFC, because of a lot of iotest failures.. Some of problems with v2:
>>
>> 1. It's a more complicated to make a test, as everything is blocking
>> and I can't just break write and do discard.. I have to implement
>> aio_discard in qemu-io and rewrite test into several portions of io
>> commands splitted by "sleep 1".. OK, it's not a big problem, and I've
>> solved it.
> 
> Right, this just demonstrates that it's doing what it's supposed to.
> 
>> 2. iotest 7 fails with several leaked clusters. Seems, that it depend on
>> the fact that discard may be done in parallel with writes. Iotest 7 does
>> snapshots, so I think l1 table is updated to the moment when discard is
>> finally unlocked.. But I didn't dig into it, it's all my assumptions.
> 
> This one looks a bit odd, but it may be related to the bug in your code
> that you forgot that qcow2_cluster_discard() is not a coroutine_fn.
> Later tests fail during the unlock:
> 
> qemu-img: ../util/qemu-coroutine-lock.c:358: qemu_co_rwlock_unlock: Assertion `qemu_in_coroutine()' failed.
> 
> #0  0x00007ff33f7d89d5 in raise () from /lib64/libc.so.6
> #1  0x00007ff33f7c18a4 in abort () from /lib64/libc.so.6
> #2  0x00007ff33f7c1789 in __assert_fail_base.cold () from /lib64/libc.so.6
> #3  0x00007ff33f7d1026 in __assert_fail () from /lib64/libc.so.6
> #4  0x0000556f4ffd3c94 in qemu_co_rwlock_unlock (lock=0x556f51f63ca0) at ../util/qemu-coroutine-lock.c:358
> #5  0x0000556f4fef5e09 in qcow2_cluster_discard (bs=0x556f51f56a80, offset=37748736, bytes=0, type=QCOW2_DISCARD_NEVER, full_discard=false) at ../block/qcow2-cluster.c:1970
> #6  0x0000556f4ff46c23 in qcow2_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/qcow2-snapshot.c:736
> #7  0x0000556f4ff0d7b6 in bdrv_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/snapshot.c:227
> #8  0x0000556f4fe85526 in img_snapshot (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:3337
> #9  0x0000556f4fe8a227 in main (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:5375
> 
>> 3. iotest 13 (and I think a lot more iotests) crashes on
>> assert(!to->locks_held); .. So with this assertion we can't keep rwlock
>> locked during data writing...
>>
>>    #3  in __assert_fail () from /lib64/libc.so.6
>>    #4  in qemu_aio_coroutine_enter (ctx=0x55762120b700, co=0x55762121d700)
>>        at ../util/qemu-coroutine.c:158
>>    #5  in aio_co_enter (ctx=0x55762120b700, co=0x55762121d700) at ../util/async.c:628
>>    #6  in aio_co_wake (co=0x55762121d700) at ../util/async.c:612
>>    #7  in thread_pool_co_cb (opaque=0x7f17950daab0, ret=0) at ../util/thread-pool.c:279
>>    #8  in thread_pool_completion_bh (opaque=0x5576211e5070) at ../util/thread-pool.c:188
>>    #9  in aio_bh_call (bh=0x557621205df0) at ../util/async.c:136
>>    #10 in aio_bh_poll (ctx=0x55762120b700) at ../util/async.c:164
>>    #11 in aio_poll (ctx=0x55762120b700, blocking=true) at ../util/aio-posix.c:659
>>    #12 in blk_prw (blk=0x557621205790, offset=4303351808,
>>        buf=0x55762123e000 '\364' <repeats 199 times>, <incomplete sequence \364>..., bytes=12288,
>>        co_entry=0x557620d9dc97 <blk_write_entry>, flags=0) at ../block/block-backend.c:1335
>>    #13 in blk_pwrite (blk=0x557621205790, offset=4303351808, buf=0x55762123e000,
>>        count=12288, flags=0) at ../block/block-backend.c:1501
> 
> This is another bug in your code: A taken lock belongs to its coroutine.
> You can't lock in one coroutine and unlock in another.
> 
> The changes you made to the write code seem unnecessarily complicated
> anyway: Why not just qemu_co_rwlock_rdlock() right at the start of
> qcow2_co_pwritev_part() and unlock at its end, without taking and
> dropping the lock repeatedly? It makes both the locking more obviously
> correct and also fixes the bug (013 passes with this change).
> 
>> So now I think that v1 is simpler.. It's more complicated (but not too
>> much) in code. But it keeps discards and data writes non-blocking each
>> other and avoids yields in critical sections.
> 
> I think an approach with additional data structures is almost certainly
> more complex and harder to maintain (and as the review from Max showed,
> also to understand). I wouldn't give up yet on the CoRwlock based
> approach, it's almost trivial code in comparison.
> 
> True, making qcow2_cluster_discard() a coroutine_fn requires a
> preparational patch that is less trivial, but at least this can be seen
> as something that we would want to do sooner or later anyway.


Actually, recount of cluster may become not only because of guest discard. So correct thing is rwlock in update_refcount(), when we want to decrease refcount from 1 to 0.. And for this update_refcount() should be moved to coroutine, and better the whole qcow2 driver..


-- 
Best regards,
Vladimir

