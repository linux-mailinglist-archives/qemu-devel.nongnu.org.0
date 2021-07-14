Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C93C8971
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:13:41 +0200 (CEST)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iS4-0004uK-Bq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iMN-0004Nr-GL; Wed, 14 Jul 2021 13:07:47 -0400
Received: from mail-eopbgr20113.outbound.protection.outlook.com
 ([40.107.2.113]:19522 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iML-00028m-Mk; Wed, 14 Jul 2021 13:07:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+S9HZjR6V07FsBaf6tlQYc8Aws7+JQ9EHOVNoPgDetLMDyD3APsTRzUNXKU3a3a/HKAZxkC0m9mQs/FjyWEP/hfVMs2t6Km/M0L1zGRxE8dqBS32smjUhkikw3EMdQkoRXNxt2hYINrj5ouEcjv3V2/ZBCq46OXWOuqWfJfUEdUe0Oo1uC1+e6irJbDHp3KB9LbZrwXoQLKyXNZpyANqjct1q6S/lUQLt+XSImGp4aI3sQXl2+Sb5zlouCg8sbsr5ACRzwhrRHQSl+SFmF4ttU9PqzXVaaHDnAp7fjU8SGiRxIJxRjLpgq/uvJYoMyEU+GebAaR5DgHFNtypRojXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7oviaUCFwcwF5CdbddBpkb3J+UvO5G1Imw/NiuIFU=;
 b=CtVI/DtfX53j4seZI3Oe8PHXP18sHKZWbXbyQ+R+IwyvaEfj0sFC2lR/09Baxd4sJ8h6COWa9QjdCd+DHRqEMVPI9X1veD5ddCNEriq2Z42Eba5Rlms7pzvdLZGkd3uWYdsezyW/DEbvHWX9p+2DoUUoV4RzrcAh3sXyBtz5b+MZHU9zr6OhCxwDWJ+t5CixnD603SCqrWy2Yqyq4xr2EoDlF9xhAwwGoafzxQ3zV8TziwKwtc4+2gLdwZX0UemgclWj34H4i7BPdbOl7ytWbEjNpnYmVkVDCH9T75GyzhSKIAVOouoJpMCYDLahM0gaQYt8Ptt1oQlCt2SvU+XuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK7oviaUCFwcwF5CdbddBpkb3J+UvO5G1Imw/NiuIFU=;
 b=my9sBY+50xqNJQL8qXr6F2+5uy983FS6yG56DZTog/uQNFMe+0RLszkEHQvuZOmIlFfH61ywXtQeMTUk3+AK5zaNLeJEkW2uPjBZpEUF2miHVB+1142IN2LUDUyZ9P9t+FLJHzMV/Uv0MUFm075eBY0RN4dsacafimMh51tM87k=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6055.eurprd08.prod.outlook.com (2603:10a6:20b:293::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 17:07:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 17:07:41 +0000
Subject: Re: [PATCH v5 4/5] block/nbd: drop connection_co
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, Roman Kagan <rkagan@virtuozzo.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
 <20210714165916.102363-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8ce6ced4-4c1b-01fd-e83f-9114aee8627b@virtuozzo.com>
Date: Wed, 14 Jul 2021 20:07:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714165916.102363-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 PR3P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Wed, 14 Jul 2021 17:07:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20778ae3-1e45-4454-c750-08d946e9e3fe
X-MS-TrafficTypeDiagnostic: AS8PR08MB6055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6055EF17001028109373BCC6C1139@AS8PR08MB6055.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: too1N/WTR8i8ohPi8d6OSf+VEJp+1nWhQA9Nep5wg+MX1K3JmJn5GDZmcE2YCcsFDljAom7QUtSVxLHnvAHm0M61mYve2QqQr2J2reUnG8Hk0Jro6tK7kq6Lg603d9DEAZ/uw26LJaZ1RRGs/RL5R3pkwMmc5nyeij/1l7f4Im22mpnvY0/kLfjX95ERTpJfK3xnGkhzkXgsobquVoVclBFsiRbln3TqG3juNK1A697Csy6YqA7bBgHO0alTWAqdR3ET6WVJeV4LQmQWRkCSXO6Uud8LRnTpK3xDR3KfodYORmKt/6wP0dkOQEOMa1LR/YNGo0qLABG0/s528CFTzbZ4/ZHWMA2WRlTNB2+3/m7WZ4Dhr/CkEatJdvBil/GqES/kFRdLrAxw8SEx1ZZuDGNoNTd8luZeilZ8WrVk+bvxa1tGbeO5NFYRvPtuCLofjum5QraS7NuPAnBKNsWyJlghWDqkmy0M0RYILBeWe+ZH1DWf9TutPCHDkACp3YjtnegGtCd7n3/Hiew0E7cIaoYTSLFerp/4gTkO64AXgN3tt95GfBzlWTJJZ/1hOH0EvSA+d759PHSgxy0rpz5Woh1vCM9wBAzo2mmtt32/ZEQu2C69L6r8gaT7q+976cXS26dTnrgTjhk91ctTAUH6QRqNCXPKaWi3YXRwuLTHLwSScXoS8iXw9c1rRPJwG1iSHfH3WcU4AGxdy0OLsbZznQ5KTQs/EQQGoZhKdDvf20SOYxaQZxIfwga853PaKAGDmXxzMhQSPvcjUs+YFDODYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(346002)(376002)(6666004)(107886003)(66946007)(66476007)(956004)(66556008)(2616005)(8936002)(52116002)(4326008)(6916009)(2906002)(86362001)(8676002)(478600001)(5660300002)(31686004)(38100700002)(83380400001)(16576012)(38350700002)(31696002)(316002)(6486002)(186003)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RndGpRcHVJTC9WTm9kYm9TVnlCVnFRRGgvK3FHWVRSUzBLbnRlZjMvUHdv?=
 =?utf-8?B?K1RZTXdZRmlORmVBd1l4RFh1NWpZTlNqT1ViRXlaaXNETEp4WjZRV3VVL3dY?=
 =?utf-8?B?aVR1azMzYlRGRyt2VjR2eDUyK2xyWFpRRkFwNXRVbVh2VEd0K0hwZ0hNV21T?=
 =?utf-8?B?bmNrU1VoTmk5MC82eHNsUXJ3Y2trK0tIYUc2SlFvSTdLN0trS2oxbFFaNWs4?=
 =?utf-8?B?aDA5aTBWRW11UEFDUjM0RDJTWHhkd2FvZnNtdDBvQ3NvNzUzalhudFlWR1dR?=
 =?utf-8?B?MWw4bHVzZHhRdisrYjZyUWtxdzQ3cjBxRlVXL3laRGJodjBqcVNMd1ZwK3Iy?=
 =?utf-8?B?SEt6VVA3RG9iK0VoNGhVVDhJdTV0S2ViaXdObFl0MTlwOFZTcVdHZ09KbmFj?=
 =?utf-8?B?VFNMWUVabHEwK2xtUW42dUFOMDM5NWROakVkSHUvY1lDSzV6d1RUTHVtSVEy?=
 =?utf-8?B?SERBTFowZFYwT0pwcC81VjFNQ2I3bFRrbUdaOXQwcnhnZmp6akFaT3U0RE9P?=
 =?utf-8?B?a3o4Z0tkeGJJRytzaXNwQkpCNXpxZDlpanBYK2x2aUFxWWR3d0dpVktsejNk?=
 =?utf-8?B?a2ZZaXVWcVJod1FkQWpNeThXTHFqZ005NVpna1BlaG13d3hCbjFFUG1zSlVC?=
 =?utf-8?B?Vzd0bWVvZVhZcWhjdmRhcnZQWkQzY3pmejhOZ3RzUU9QdkU1YnZTSEJ4amo0?=
 =?utf-8?B?eHR1V21hbFNTdHMxYmhoTnkzWnhjQTRNT0VuRHRoTysxMUtTQWZXZ2M5bjFS?=
 =?utf-8?B?UWZPMmV0UXU3LytjR2V3OE45M2xOQnhCRGt2OXIvU3F2dldMdXk2ZWhiUUh0?=
 =?utf-8?B?NklxQ2VIdGhkUUthejV4MzRMSHNHbW5BdWFOZzVnN0tJSGxnZHB5cngwY09B?=
 =?utf-8?B?YnQ4UUFYQTFIbE1IemNvWDE5Z3ZHWFdsYWkyUXFaYnpvVElPMTVMVlZRV1BG?=
 =?utf-8?B?V1lYdXE5RFdEWXNMcXo5MzB6S1BtbEJzOS9uVjBpYzBHbzhMUHc1dWFITVBp?=
 =?utf-8?B?QVhjZUFCbFY1ZHB4RnMrMkdEWVQrSklCVzlVbzk1b2VZRnVsY3NXQlM2aUUy?=
 =?utf-8?B?QmxzbTcvWGlOS1lYaGhKOUZRMnpFMTJ1WS9UbkFRTkcvVjdVYStKRFV3UGRT?=
 =?utf-8?B?SFI1dnROaGdPWGFuV2xtQmRSTmlYbEtSeTFBcENvdklBeitFWWdpc3VXaHhn?=
 =?utf-8?B?UmFQbU5mVjVXc3FsMTBUYi9qSWZ5NldqZlFJOWUzZG02a3Y4alNtdlpLNkgx?=
 =?utf-8?B?K0p6ZkhQbFlsMEdETG5HeTgwditWOUVtNzNLcXlnTVg5aFFVY1g5UW4zam5t?=
 =?utf-8?B?MTRyMG9zdXRDdGMxY09qVitlMzVDck9RcHBKNzA2SXNjR2VJWGMzRHJoVWhJ?=
 =?utf-8?B?alRTK1FXWW9DcmZiYk9acjZQNmRlOUNzUUN3Z3U0ejl5dGsyYlNzbWNsRWhN?=
 =?utf-8?B?MVkzOWZXRGtyTkdjd0E5dXE2bm9pTjgxRmNHQlZrWFpNRmd3ckRCZ05LMXJ4?=
 =?utf-8?B?Skx5eE8zRHNnVmNHQzQxOXl2cEs4NVNWa1JLMSs2U1lJVTFDZ0RjM2p6S3FD?=
 =?utf-8?B?aHJuVzZyUURXLzRVYmxsay85bW9aaGdScW1tdStDZG1zNWtUdldMZkdnNWhu?=
 =?utf-8?B?ZzluZGtJU0ZmMHQzbHVaa2xEM3ZwTjlkN21Fakl5M0d2ZmJ0TWNkUTdDNVdY?=
 =?utf-8?B?TE5tRXBqUXp3bG56ek5LTjgyS2pYNCtneGVHcFFoZE11T0x5bzRHeXQ3V05j?=
 =?utf-8?Q?w2+zuA4AVPkyR9D23aNjkVRuZdkEVnkWWR16NDe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20778ae3-1e45-4454-c750-08d946e9e3fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 17:07:41.6822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCTDPaO9O5AVKo+IVoqmIqEDXmfRxPMknMwBrg7zf+/CsESiG+UsNX/o5dglMsX0O+Rdos/08IsR13e/mMnx78+uUgHv1uwH6Z7OWWGREk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6055
Received-SPF: pass client-ip=40.107.2.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

[add Roman}

14.07.2021 19:59, Vladimir Sementsov-Ogievskiy wrote:
> OK, that's a big rewrite of the logic.
> 
> Pre-patch we have an always running coroutine - connection_co. It does
> reply receiving and reconnecting. And it leads to a lot of difficult
> and unobvious code around drained sections and context switch. We also
> abuse bs->in_flight counter which is increased for connection_co and
> temporary decreased in points where we want to allow drained section to
> begin. One of these place is in another file: in nbd_read_eof() in
> nbd/client.c.
> 
> We also cancel reconnect and requests waiting for reconnect on drained
> begin which is not correct.

And this patch fixes that.

> 
> Let's finally drop this always running coroutine and go another way:

Hmm here is missed something like:

   go another way: do both reconnect and receiving in request coroutines.
   The detailed list of changes below (in the sequence of diff hunks).

> 
> 1. receiving coroutines are woken directly from nbd_channel_error, when
>     we change s->state
> 
> 2. nbd_co_establish_connection_cancel(): we don't have drain_begin now,
>     and in nbd_teardown_connection() all requests should already be
>     finished (and reconnect is done from request). So
>     nbd_co_establish_connection_cancel() is called from
>     nbd_cancel_in_flight() (to cancel the request that is doing


-- 
Best regards,
Vladimir

