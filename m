Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBE3FD632
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:08:20 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMEF-000329-93
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLM9J-0005gE-2h; Wed, 01 Sep 2021 05:03:14 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com
 ([40.107.22.116]:30592 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLM9F-0000pk-Tn; Wed, 01 Sep 2021 05:03:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkOPX0zeWX3ZSP9c5LczNbAiaxuUtOLp35cLjmicnasdfc38CX92aAgIdIdt7gkaatjqfNy6PhDbmgMVWqUI0m0FLv32MRWFOinmFxMcAOff6c4sUMyUWFpiEqTzfGoaS93dyef4AyAu5J/W3f+hY4FNxrbpMvJBbFMNg+eAgIyn4/xIBmV8ATbCIqZCyLyYByqEkM4677T1wAiYX25CbFKqbvLWQUgeZpVQu6sK9vaOTPGdpSf2IRpv02d1vJJG5UQ7yfpAT4i0ZJI4IObWcQXha1TVCe0VyeiegXbWBJD6H0lk46GRBGnfg9q7HApFdp4BJtgjOQqi9VSns2cNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ccnMjr2Hsv4yB+lcCZrTrWaLhdcaZIPCT9QObALe7T4=;
 b=K8sMUJvvrXtUcPjmP5aykzy3ZJ0n1ox6xbt0Neuq1BK8ZaFrWjvYoBSIyVbphVrgaxYdEHwVGj0SL0HVpeDSqKGcng2pnepk24LUY54iQ8xLi1tBiP5Eb5TcYlR1rUaAjO27woBeCVYgpKmMzmQI+9gKiDX9KyU+hooucjc1b8ONUTY/QJTWH6TDG8IjWngrv6nesJ3SQLDFI2d5KwHX9l0r22daFc9MdIB/0szFMKTD5wnL5tqPrg/kf2aqapd1nOcV0X031NCaMGat8rsFG9b3n13rDnUwHhw2GrFMIZm3zxsSSgMceRdMqLHabBPsxG4FhyZACoDaAExHXrfYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccnMjr2Hsv4yB+lcCZrTrWaLhdcaZIPCT9QObALe7T4=;
 b=R+P4lea8bqJM1YbALY/jYpaOnYYD787Ausxm+UIzT04e51mMBfL2pnmCZUABu/tVKkzmlpVWA9pY2tyB5tD0yvHwaYiAFKEbdp+28tKGctoCgtAqwCpcnkYQXGtN5zqc/v9V/MJ919lLp1b/EnuuMeSx4TcKDCYYQexUGUBlFwA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 09:03:05 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 09:03:05 +0000
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, rjones@redhat.com, nsoffer@redhat.com,
 kwolf@redhat.com, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
 <81fc3d16-b357-5a8c-45f2-682ddf253590@virtuozzo.com>
 <20210827184503.m3lbpz56qs6mpjla@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6cd6ae22-991b-b3ab-029c-22cce8365761@virtuozzo.com>
Date: Wed, 1 Sep 2021 12:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210827184503.m3lbpz56qs6mpjla@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.8 via Frontend Transport; Wed, 1 Sep 2021 09:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52b69df6-f59d-45e6-4da4-08d96d274f78
X-MS-TrafficTypeDiagnostic: VI1PR08MB3309:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3309DF5C0D71A31CEAECA37FC1CD9@VI1PR08MB3309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LnMT7nrKqHHRIy3P8yOBHStDZUkzgFPwwVFioyLrbqdKT1asaN5wUVqVBcR8Yu06kV9GZf69OLLADlc5m91lpgbjLGR3QkE3Me4314/NRJhOZu+yqeD1kzwCPDI8TOBWunqNua7LbYQ4tRQ0DFjGtI0B57PkefsE3IuNqCxPggBANWQqXvZ3L8D9pYpStjG1BY2R/Ti5+MAeEbsDDQrh2tk6ZrH9zNy2dz/uK6ua/bKDeXD7mSSjiWv+DDEv1EqpI9eFEQ8M/qZH+p1EcOe8Wj/DuQTJCbRXyNtNusDBZQFPVg2/YdJYt3RujH/2gX6vqROanbiAe/88WvQOQ+ux3y7oT7VpTVPYoC0afqmdX1AZp9G1dbFe55cfhB62ElFawWLHv+5mIdM66lgxqC1zS4Qqg1VcbF1QJDyLXRlsEyjFMwCpaey/VWTlv8xmuZU/Mxr78S1HAHAEr6eJmHHTWy1sVRITqmoZZCDD1haRBKEtGpFL8OtC5O9WJK2ffrDfmIIgIe+bnI0iSnLrKPWbnibBKGdZwALddjqVhtLanOZ/p7RssvSe5NzhBkyfQYKAu7jaRRE2V/T0WQWJK/JYvIMgPH2vNT+owxhVzMrrzGmvE+GRVld6+DVYLjMj/7Y4EPuyBvb0oJ1v3rLtBNW8ACEvi3drN0TqwoC57U8Zf60E4HRUD8bcuP85s8AjLk3A/wq3TcwD5OYV6tp3O09yMciYqkKcz9GIFFhPxOxvSKFa6Q/lrlPOWX15dZ4o/VHMdMxO9x820woKOuMy6o6rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(66556008)(66476007)(83380400001)(8936002)(66946007)(26005)(52116002)(186003)(316002)(16576012)(478600001)(6916009)(4326008)(2906002)(5660300002)(36756003)(956004)(86362001)(2616005)(6486002)(54906003)(31696002)(31686004)(38100700002)(8676002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhZM2ZRa2JvaDZUMExYZVl2L21XM0lUMmlKdUo0NnpuUE1pNXU4ZzZ1c2NS?=
 =?utf-8?B?a01rV1FjcUUwR0NuU20xNUdwZXV5S1RGd1Q5KzNheU9hUHBHQ2JWMFNVelY2?=
 =?utf-8?B?Z3Z3TW5HajUweStyeG5SZm9yL21JY2IzTWJkcDlMWEViZ1VYRHA2UzNNTnZW?=
 =?utf-8?B?RUpiWVYrb2VXZnpja0QzSHdYN01NQmVvTXcrMW92bnhwSHZJWU1ybjFsZlpJ?=
 =?utf-8?B?M1JVS2F6eW5ORzlYMk9YZkw4eXlWTkZJZk5lQkRiaGNmQnZmOXJmZmUrREtG?=
 =?utf-8?B?cGQ3bmg4bm1pTWJWaDZOcm5UVmFmSTVQUUVlU3pSNFlocjlQbHJBOUE3Q3dp?=
 =?utf-8?B?S1c4Ukd6dXVTRGNOTnlKVFI4RGFteFJYc2p2bEp3Smh5djlBTE1zQW5JWUJo?=
 =?utf-8?B?UzVFOGlTdGNtMUNFZ0k1TFpwTlFTWTZWdUZoZHF2eGRFQXErc0dsVGlBNG5E?=
 =?utf-8?B?TUtQTDJac3hqRTZwK1kxTy8rdTBtZVZlZjlOdjlBMmFTREtCRWQrUmVqYkZP?=
 =?utf-8?B?VVdnMDliU21TMmR5OGdOdHdxa1J4UExXTFpCUlVDZVltN21kYUxSc3hLTXFN?=
 =?utf-8?B?eitUc2JadW9kc3hucm5lL2dwZk56TmJPa2EwYVUzTUZRckJoanEzMVBWUXBX?=
 =?utf-8?B?cUI2VVh2M1Y5T2s3Q1Zyc1F6aXdsM0E3aXhRWS9nME9RbEtIejQwTWZzTit2?=
 =?utf-8?B?d29PZFlhZ1FKd21ueDdPaElsODgzc0JaOGlva0dtaExPaFFuRFVldmQwN2ZR?=
 =?utf-8?B?VWttTHp1SVNZUUFUekR6cW53Nlo3SFdGWVJLRDJiRnRNK3hWbjBJL1FRdDVT?=
 =?utf-8?B?N0FKQmkvTENOMjQ2SVdhZk5ySFUrRmszUmZMVEZuWEZXNEgxTDBlblRlOWJa?=
 =?utf-8?B?WXA3U1ErRFowUDYwSVl3QVN6NnJqZjJUSDV3eUdreW5KanpRd0dPYmlobjFR?=
 =?utf-8?B?MXRnNEFrT1pQT01acE1Wc1BMdUpPNlJPNFRVUGdrQnBZbHpqV2JZZ0RjSnNT?=
 =?utf-8?B?SXllSjJvRVJNRFJpTDNsV2xNcUJpbkV5UmYxanNBMUx2Y3dSd1pWS2ZJTDY3?=
 =?utf-8?B?RFU4YmVSVmJ6SU5WamJMUnRXTjRuSi94ajlJdU5aaDhwdTFKWXZFb1czRTNx?=
 =?utf-8?B?blVNT2pJU0hVOHVLdzZ5cFdMYnNtWERyRU1jTTFMSFVVQStjVHh0eWlwbUZ1?=
 =?utf-8?B?aG5VVkNMcEYxOTVkdSs5dEIyUUIwV1hxRnBoUkYycDhjRW9kQTRFc2wwZTgr?=
 =?utf-8?B?Y2YxU2FjVHJydWJQY3B0Qk45TzYrWTR2UFZiVGxGV1VvUkRCdFNTaTk4LzNu?=
 =?utf-8?B?ZkdpeDhuNDhHcFNnR0ZTNjFYU2taWTNqdktncmJobDBiN1p4RExMOGl4VTl0?=
 =?utf-8?B?L0x3UzVjdnJpMXFMUE5mNDhoS1hic2dMVHFjZmIwVS9JSGZxYkZEYmc0dm94?=
 =?utf-8?B?OHFncFRlcE9KQmlkTytUN0wydzlheWxsc2Y5QmkrWlFYQ2VjQjVNTTExWTFJ?=
 =?utf-8?B?KzB6NjBDNWozU05IL3hVVDdzdG9DSnhVYnJXUjF4aDlRSlI1RDlBQWRHNVhs?=
 =?utf-8?B?b0hmL0NkZjh0RjV0dXNndUxPaXZRZWswV1AyNDlXQ292by9YT3lRZUM5ektu?=
 =?utf-8?B?Z2QxVlpNeFNOWUxHU3JjM1ROME5IcVNnT2Z1QnBWRjU2a3h6UW9ieUFSN2FK?=
 =?utf-8?B?YW91TENicEVhNUFFczhhY1orTkR1KzdwRXBlbzJWMnIzODFnam9QS2NObUlR?=
 =?utf-8?Q?zvlzPrwB97Z/Qs+SpqjKxnRXYKCr/0KdY++EyBm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b69df6-f59d-45e6-4da4-08d96d274f78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 09:03:05.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv978iMF2XAcPOzIeiQtzUgl9kkaA977dhiqSRKoK36KrSf/sWnwKxzBYsRibcEPh4u75hl5OFZoox9gtclBoZt3/xrjejE/eRz5TzeMevE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
Received-SPF: pass client-ip=40.107.22.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_NONE=-0.0001,
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

27.08.2021 21:45, Eric Blake wrote:
> On Fri, Aug 27, 2021 at 07:58:10PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 27.08.2021 18:09, Eric Blake wrote:
>>> According to the NBD spec, a server advertising
>>> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
>>> not see any cache inconsistencies: when properly separated by a single
>>> flush, actions performed by one client will be visible to another
>>> client, regardless of which client did the flush.  We satisfy these
>>> conditions in qemu because our block layer serializes any overlapping
>>> operations (see bdrv_find_conflicting_request and friends)
>>
>> Not any. We serialize only write operations not aligned to request_alignment of bs (see bdrv_make_request_serialising() call in bdrv_co_pwritev_part). So, actually most of overlapping operations remain overlapping. And that's correct: it's not a Qemu work to resolve overlapping requests. We resolve them only when we are responsible for appearing of intersection: when we align requests up.
> 
> I welcome improvements on the wording.  Maybe what I should be
> emphasizing is that even when there are overlapping requests, qemu
> itself is multiplexing all of those requests through a single
> interface into the backend, without any caching on qemu's part, and
> relying on the consistency of the flush operation into that backend.
> 
>  From a parallelism perspective, in file-posix.c, we don't distiguish
> between two pwrite() syscalls made (potentially out-of-order) by a
> single BDS client in two coroutines, from two pwrite() syscalls made
> by two separate BDS clients.  Either way, those two syscalls may both
> be asynchronous, but both go through a single interface into the
> kernel's view of the underlying filesystem or block device.  And we
> implement flush via fdatasync(), which the kernel already has some
> pretty strong guarantees on cross-thread consistency.
> 
> But I am less certain of whether we are guaranteed cross-consistency
> like that for all protocol drivers.  Is there any block driver (most
> likely a networked one) where we have situations such that even though
> we are using the same API for all asynchronous access within the qemu
> coroutines, under the hood those APIs can end up diverging on their
> destinations such as due to network round-robin effects, and result in
> us seeing cache-inconsistent views?  That is, can we ever encounter
> this:
> 
> -> read()
>    -> kicks off networked storage call that resolves to host X
>      -> host X caches the read
>    <- reply
> -> write()
>    -> kicks off networked storage call that resolves to host Y
>      -> host Y updates the file system
>    <- reply
> -> flush()
>    -> kicks off networked storage call that resolves to host Y
>      -> host Y starts flushing, but replies early
>    <- reply
> -> read()
>    -> kicks off networked storage call that resolves to host X
>      -> host X does not see effects of Y's flush yet, returns stale data
> 
> If we can encounter that, then in those situations we must not
> advertise MULTI_CONN.  But I'm confident that file-posix.c does not
> have that problem, and even if another driver did have that problem
> (where our single API access can result in cache-inconsistent views
> over the protocol, rather than flush really being effective to all
> further API access to that driver), you'd think we'd be aware of it.
> However, if we DO know of a place where that is the case, then now is
> the time to design our QAPI control over whether to advertise NBD's
> MULTI_CONN bit based on whether the block layer can warn us about a
> particular block layer NOT being safe.
> 
> But unless we come up with such a scenario, maybe all I need here is
> better wording to put in the commit message to state why we think we
> ARE safe in advertising MULTI_CONN.  Remember, the NBD flag only has
> an impact in relation to how strong flush calls are (it is NOT
> required that overlapping write requests have any particular behavior
> - that's always been up to the client to be careful with that, and
> qemu need not go out of its way to prevent client stupidity with
> overlapping writes), but rather that actions with a reply completed
> prior to FLUSH are then visible to actions started after the reply to
> FLUSH.
> 

Reasonable, I agree

-- 
Best regards,
Vladimir

