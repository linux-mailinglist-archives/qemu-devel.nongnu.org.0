Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A6339285
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:57:21 +0100 (CET)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkAA-0000ST-TB
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKk7H-0005h0-Em; Fri, 12 Mar 2021 10:54:24 -0500
Received: from mail-am6eur05on2124.outbound.protection.outlook.com
 ([40.107.22.124]:58624 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKk7D-0006RV-Mo; Fri, 12 Mar 2021 10:54:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdgtN6L7y/UBtr1qyyEeqmoJR8Rfaz3elqYtQ9gH1+2uolm5vAjYnYcoBEtFZf4ET6+i0cMVB7HxqnFgePS1mzE0mFi4ybPSx2U0hZXaa3+CdPzm3K+SmZGgt3xHLpe8gzWGFjOI06/SzxTduAhy1nP2uTKYPZOlRVn0sH88S3uDC39RHCQ4R4iBzo0tyV4NWkkd05FbRpRT8DW5gxTpWpfodoHnvhiapdLqUB9pIiitZu/FqDqWI7Ml5an7FxBqYsoVLvLnyUJbufw0ND2bKj4wTFgE/IP2bS0SDz1EB7S1DAy9xJ2DAVwU+w0lpmFsfQNuwOtabs+XBaOVq+gbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvJ2NwRCt7+3pWF9KQiMDzKkLD7ga+s9HDx0+6D1iFo=;
 b=Qd9iUQUWLFduAUR4EBs1vIiOVrR/RUl1IfoWwLqUJVHdLPv0Y7LBTi5MG3daPUjYyi4pF0TVkUvkGHzKP7GYZrTX5foe3WteKfHWzljUuzJe7gm3NRRWFhTsgFx+gxrKBVPfe7C0J0MVjwMWjwyYEJefvLaTNL5ym17ZUXGQzGDzPWuaU6rePzi+lOn+jKVO0RecNFozgLnR1wy7x89Axf0gKc/LJKiKMkTmm98JaXQem/0d4/pE97MdYvwuoB8uNCLahmIDqP2umu2XaUA14Na8MqAIRZb6fTS2XPhjKuXEHPbVP1MGnfD4/PsnKlgQDmzwL6QJW/tBFhUTMLVLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvJ2NwRCt7+3pWF9KQiMDzKkLD7ga+s9HDx0+6D1iFo=;
 b=nrr43+bUJKoHcGHZZytBHY7yLDzqg7eGj7JfpaaHIUNdXVvF31tMWSuvEVB42w60j/JB/1Z2wy9XkUvpHWu4qEcNE6oInMjvkUrj+B2+PFPz+HLZEh5zN2Xqq4seKSrkEkEBzjfSTzyy05/ZR/C0fmoBtBV9rAcVmlrHV9nNzmw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 15:54:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 15:54:11 +0000
Subject: Re: [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
 <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <669c302b-c6e5-f54e-5f11-8fc22ed983e2@virtuozzo.com>
Date: Fri, 12 Mar 2021 18:54:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:208:14::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:208:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 15:54:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b35add2f-0fc4-40af-6e06-08d8e56f142d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4021F9C506976CB945705F3FC16F9@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45xib4oQ+mD6SMdDtth3LlcP4zP5VaJ8dJz542Nf+RiiYck7m5vFpY+FfQIfM7ctoUjPFOPJpvZse8k+SOEl1gigFLXEiDaKvN/FAY98ipn7T5laW2CYvvTg49CFTX2cJ78dvuSjXJE/sj8qetltbRMLF8cyTCEQsj6YG2Y1EUTa0FdfSRxJMgnRVoWOoP+okEWB/pEKGRuB7Id2bMBUcimnlXdp/Rqe2ghEZMZDwxbNiMIS/9NP/VJ//2iBDe+esVXMcNHY4VkhVf+GXcbIIyVYjMOagqMsB/kTvzlS3xiSa8mjfJv8JfB+xwJh02J7FBoeb9c//IJDzMHXHLyVtxbxxe2lceqIEw1mMpVj7les4oR7jj9ygWECdHcQVbBakT6xKzaGGl6g/mNUj1UOpzs639jVvu7P/QdvQUYMx4Kdq+6uMGo3zyM6f1C0Xz9zr7XBqy/1sxGImXhNyh/oRWjdSUY4/DQKUSJjXOdkyc6OOmuJNSbFhoWOfonwu//x9ksSXZNzUZSJrLLWSjuygQebhTaAq1xWpj7FF7NW7bzsMJpCQhLsG40/BpznMpIb88l9+09KhaNeQtx+8pEJKNG1N275yprhL/uICPr487c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(376002)(136003)(346002)(16576012)(4326008)(31686004)(36756003)(107886003)(2906002)(956004)(83380400001)(2616005)(26005)(186003)(316002)(52116002)(5660300002)(16526019)(8936002)(6486002)(8676002)(66946007)(6916009)(31696002)(478600001)(86362001)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlhMamgxUi9vM0piK1g1bnUySVByakFhaHUzUnM5blg1SXNYKy9yQjA2RnZn?=
 =?utf-8?B?VjlScTdxbmtHV2RYeEhqY2pKOXF1cW1rN0ZwWkpNVHEvTjhVdWlwT2IvOUcr?=
 =?utf-8?B?TXg5N1FXb2pCSTdYaC85SFVBVmxjc0IxbmVzS0ovZGEzeWFSY3JSaVFJa2Yw?=
 =?utf-8?B?SWh5NzBTQ1lUNDg2clR3eS9jdjdxZys0OGY2WEkvNXpOUUUzSGRnY3krRHo5?=
 =?utf-8?B?K3lVRXZrOVkzUHY5VHJWNnBSeElQY2FXeElGN0I1WHlNeThxYnZFbFQ3VE9O?=
 =?utf-8?B?L0RlVEcrcmUvMWJWVnRFSStNc2EwaFNMZ2ZETkNzZTluVXhoa0RqZ0NWMFM0?=
 =?utf-8?B?VXc4dWhOTUgwdHZlRUdabGJWKzgyV3B2cGZxL1ZETEtvV1U3QUtpRkM2STdX?=
 =?utf-8?B?V0wzcTN4YlZBcTZ4TDJ4b01KeFU4NXgzYkZMeEtZcytFa0tYTDBWaGJkeDll?=
 =?utf-8?B?VWcvemNqN3dER0JibXBSL3lqVSs5VzBzSkZMR3pVbG1sK0NYOVYxYjZxUUtM?=
 =?utf-8?B?cGZTYUoycElXeEJvbzZaRy9oN3FPSHRXRTE3WExmWmhGREFhcXdVanpBY1BM?=
 =?utf-8?B?VGpVZ3A4Y2pXMEZDUWFKeFI1M1l2Wk9mZE16UW9UUmJZU3dodnBJS0RrZE16?=
 =?utf-8?B?M1Fldk5kVkZOZy9BZTVvdVVtY0ZPdWozV1NWUEhOc2VUczR1Yk9Ud3Jnd1cx?=
 =?utf-8?B?dlFWbXdWbHIzMTdlY2MxRzY4VTk1YkpVeGozYitNZ1UrOThYMDdNaDM0cFE2?=
 =?utf-8?B?am1udFA1cjZOdU9FRG5jcHpDVGR6WFkzZG5Udm53K09xSndQN2UvTWsrcmR4?=
 =?utf-8?B?SUNqd0FvR1ZwRktIQ0VEMURYYnFUMm9wWkg0Z3RQNldIRVU0dHR2UDZ1em56?=
 =?utf-8?B?eUw2S1VhUFowWVN5aFA1dERHOHJjRW5xY3dQcHYvWE5zTXRic0RxSGlaUDV0?=
 =?utf-8?B?Qld6dWdSZEY4SEJiVE5FNGYxWDc4MllheFhsQmJaa05Nc3ovSHVmQ2NLSk5D?=
 =?utf-8?B?M0JRbnJialJDbTNEYm82d3MyQnkvb0tDcG42S0QvUExyR3ljL2lpVkRuTzVp?=
 =?utf-8?B?aS9kOTNmczIxMDc4Ry96VkV3eVphWEE0RGhFY1ArRno4WldGb2RQZmQyVGhV?=
 =?utf-8?B?UXVUSWZIQk5SN3hhU09HVm4rZUhUaUQzQXFMUFEvRzgwS1hnOHYzWlRlUjlC?=
 =?utf-8?B?Wkh3VjFRMGp6OExDSWRkS0lTQTNqYUs1R0NoUXVpUmxXYzJiN1VobGxjN09m?=
 =?utf-8?B?WXhGZWsrUmw3Z3NLY1Q2TDBmdjJ6cm5vR2xiR0t5TkFIUmpVV1lvTHVQek45?=
 =?utf-8?B?RExzUjExSXd6OGpidko0a3lzS2hkSDZITDU5RUJlUDBrT1VVeWUwb0RaSUZE?=
 =?utf-8?B?QjBBL294aHQ0emFsTXd6VWpOQ1hCZzFHZFdhT05hU2RnZ2JsRXB4Q1RzMFBm?=
 =?utf-8?B?czlVbEkyektJWU5FVjJFMVlaQlJjNUlOK0ZYYklZU1YwZTRVWFR1OHhxRjNh?=
 =?utf-8?B?d3R6bEV0SytYcEJtQUM3Y0pHTWV6a29BWjVpNWkyeUtzUW1YTGoxQk05bDhX?=
 =?utf-8?B?RVRncklnOGhpTDlPbzlTNzhVWDVVTzV0MFFxL1M3dVZGcE5wWk9OVXNnRk5k?=
 =?utf-8?B?eWx6bXRydk1NeFZGejhDTVhJTzdIUlZCRHE3VFpkaHhJU2NjSDFxdnhYcHpn?=
 =?utf-8?B?WkxsZVBXTmdMeGhHbi81NUpCM3JzZWV4VkZBQ3pYV1pmeEx1anVGQkNWWGJ4?=
 =?utf-8?Q?MHKy5MOOeeRIllwNQocbVU3b1WIND+4C0XBBm/x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35add2f-0fc4-40af-6e06-08d8e56f142d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 15:54:11.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV6UChVjF9wKyvXx99LegO04KI6MpbsSjRmNuvGLLmtcZSCobsJHoXIc7uPJkCPG8JtkdQkUIibKaGDs3adWTskQ1xbTdVL5+AqpWzkqa4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
Received-SPF: pass client-ip=40.107.22.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Sure

> 
> True, making qcow2_cluster_discard() a coroutine_fn requires a
> preparational patch that is less trivial, but at least this can be seen
> as something that we would want to do sooner or later anyway.
> 

Thanks for help, I'll try your suggestions and resend.

-- 
Best regards,
Vladimir

