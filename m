Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A233B9CD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:09:17 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnuG-0000fj-0k
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLnsm-0007Kb-Cf; Mon, 15 Mar 2021 10:07:44 -0400
Received: from mail-db8eur05on2113.outbound.protection.outlook.com
 ([40.107.20.113]:4102 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLnsi-0002jp-So; Mon, 15 Mar 2021 10:07:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEAgyzCd0oEmXV8FSpNDjvw31Q9qGtulgMHlfoaDOrsZWcmpHSEFJnyGitRcFF2zbjR3z1wAo4x8w6M3SySjoZmsxLsD7JcA2BR3FgRWfzNGR43lYqAHIIdNnFWJKchiUJehwpCd6uu8hSnJ7MbdA7n0Tl7T+t0Kc1VuKq+MCdtAVHnc5kxLJQF/eZPGA+m3roIXvaFsXFiKcq0AcvhgYGwvQg1XJe9JN2tOkLqGmPKRx7hRbnEDwhDzmpr2CWZk2bLbLji2QphMvt2zO+QCmOMmLj4qJRCQ9+5C0noGZqd2FjRu79qyNqmv6YsTKX9kD3evVpY8QrwdFqLpFMS0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr/CjVrDERT01000vAgbWe7P4GX0udrZNgJRV6h3uak=;
 b=PwuLX/B97VSKn5T/S/UIhU54I40a2URSSl+PzH/b3nBdkoch0gyRmQN3uL70kJ8H/7qDEGcp49NlUeTczEUxT6Y7S6WDGZKWIOqsaP7cLRhPhEBSe+kZMNuWh78skhkPCPcI+hIWMDyNLoB4RVxWsxZl8O2etH9eguUuklmsKuXHI6JY3343/LBnuNmm8PuUWaKQiE9XKOuEQVBkTivrFNDONXgZnT5DGw073OoMt8qP706G7KnwkZrmZJmRs3JLD6EqrKdzWBi7xftmne00ZucHrLUUuV0622VBSBwx80nCopqCDuZzquGQVVzFrApuIFs+KTT/kqLu3aYCgnZbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr/CjVrDERT01000vAgbWe7P4GX0udrZNgJRV6h3uak=;
 b=nGF+xzdUaC4vXl90nwCw84KZLQ1wKWfGhB3ZqqvxI8nmkcXQPOGt5QsbJpfjiO+1sosYqZvzRvkOLvQ+zXlFOdDVcJwofhlnfojzYIS7hhgPinT2AU/dFhDdDHlsNhEI1anSWl1S2FBbmNtEmGXTEuSVdOCNHe970/TxqG/RkCs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:07:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:07:30 +0000
Subject: Re: [RFC] nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, Max Reitz <mreitz@redhat.com>
References: <20210310093232.519585-1-rvkagan@yandex-team.ru>
 <a1d202b2-ddb6-e173-c0a7-e3199b641499@virtuozzo.com>
 <YE7ybMq7YdkSrFco@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2d3dd146-63f4-6276-f9e0-2fe6208fb1be@virtuozzo.com>
Date: Mon, 15 Mar 2021 17:07:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YE7ybMq7YdkSrFco@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Mon, 15 Mar 2021 14:07:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cac5310-cefe-4369-517d-08d8e7bbabb0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381A203624C05375F16EE9FC16C9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6Ft6Rhc8T8AimB5CCSv1SNjpAN2hCymldIyFtI2j6aHX39lHJ97Ll5dX7TaSWqNykWZBfuY30M8h1BTBcJHg7oCQdjn4xU1XYNOFfzqpMSNO80DxPUW0CAsFKZeg11DOreZNuv7nILhBSiYCqTYUB2TItdDiu8D4O7iGaZPIeJTo8hlXhs0GgNHnbCwOAdYjq9ViKPwodljNX5Z38KTnV5H5k7ojf9E/jmsHa+BV7PmhzOOVldnuOA3w3B5aKmEoi7WIjpzzxDCSIxVyl5QOIaFjwPpiPcXYG0O9+0CPhNoX3ZJ8lok55axudhdkCJN2SWKhaYdjuSabNm+pF2euwJtJwx6ag/38ctZ/Vfeig9LDjPJmLjJTnqYX7K2ftzGr+gkOEAsKBv2zxkUmyIuFtPoT6Gpyv5TGFgaDR3mbzKPBN5LCMGW5zHXVibo2CkBhirZrxaWAyFcBwLzd9OEIfrqPOBk0G24nEMPoDFNLvUXucFeCKCh4fnrcZnHp/cmLpurL8KFQoCkySO7zu4C0S1IoWVhA2TInajybOfZGJKv0g4A8ZTbLP2aCF7/fB7pm+V81CrNmqUmlwoeoa+V8m2als2N3Xe3s55fipVwCQ9LDtkNk8WWgEhAPMnLyXa72TD0guB1RgKGo3+ABwzQ4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39840400004)(136003)(6486002)(2906002)(52116002)(16576012)(110136005)(66476007)(8676002)(16526019)(66556008)(86362001)(316002)(31696002)(8936002)(66946007)(31686004)(956004)(186003)(2616005)(5660300002)(83380400001)(36756003)(478600001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFEyNnBMNjBFN29yRWNNd09ocXZhaGtDUzlETXN0L0gvaVVrMUd6K01RM3NR?=
 =?utf-8?B?L2EvaXRQVm5OZnZ5VkNZdEtOMlZjcXJTMWVRYUJJazlEK2hhYkZteHpQNUha?=
 =?utf-8?B?V2JCNXZndHBlQVZFQm1GdjdwZTVzYTY3YjZNZkxaMCtSdzhYVGV0RHBmOXVM?=
 =?utf-8?B?TVg3YnllOFJJeWU3OG00QkFWeXl1YXdBSEJsWU9xaGFjNWdkYXN2NU1NRSt5?=
 =?utf-8?B?MzdVVEtyU2JidHdHUnFvNUxCRGc2K0RmYzZMV2FUSHNKS3M1KzdSeFNCRnBx?=
 =?utf-8?B?emU3YzZHRkx5aVJjZ1oxckVNOGZzNzhGSmllZGdpazNKYkcvV1RpSGVvR01n?=
 =?utf-8?B?SWFWdzViZmVacTY1WmVVa2RTbmtXQTVFb0NpdE14OFEyRFZmbWZHT21BUHQ0?=
 =?utf-8?B?VkluMFJMam1FSlpGNUN2VXVIVWdmR1BzdjVpWVc4cXBjVU4yWjEwK1JQNWJL?=
 =?utf-8?B?SEdZSWFPQytVQjF1cTNRdDVtT2NZU0xUcnhsenc1dkhqV2pBenJUaGRJVzh0?=
 =?utf-8?B?WFd1WUFVYXdYMXJzeTJ1S1pHdWloQXlvUncybGdDb3YyNlJScFRpOTVwY1d3?=
 =?utf-8?B?dC9XaktTQWJ1ckZ0WXBITHJwZC9OYjc2K0ZCeEpJMnlzcU9oYnh2UjVsRG15?=
 =?utf-8?B?ZXZNR0NIQlU5eUxBcVZuRWZrWHJPVUNCREh5U0M3K3ZJYmNlNnlOcEs4YzBk?=
 =?utf-8?B?NVZJbW1ZTG01SVB0TDNYTmwrSTNnRTFRMmRkVGd3NTNRb3ZSNHl3VmFnVHFl?=
 =?utf-8?B?dkNTZTNRTklrRitvUys5a2xWc3U3bE5sL0psZkFkZEFoVFRZTy9tMkZQbmdT?=
 =?utf-8?B?QWI0V3l3VjdtZERrOXpPTFVzZ1lYTkVYUUkvTkdWOEpSanVvYnRGbC85M3c5?=
 =?utf-8?B?d3lwMzExNThZYjBsK3FvTWh0RHVsbGdNaWxSdThleS9yV2pxRG02dkR5c053?=
 =?utf-8?B?Y1Y5ZWFYVmRkR21FQThROG9mZk9UOXpnbGJCK01DM3g2TDd1N0VUdXNhb0M0?=
 =?utf-8?B?TXZ1Z0pxWWtaUGJETFJzMXNPZk90aHVvT0Rjd0R4UGxMY2pISm5lcUZvN09q?=
 =?utf-8?B?M3hDVGJZYnpaaFR6RGh6TjlGY3FuMFdobStObmRuSis0ZzRqc01CQzg3Y3dE?=
 =?utf-8?B?MDYyWHUyV0JGUFNYUUtLWkFoUUlRc09ZcU8wZCt6VDdKeGo2N2o5Y1N1UFFa?=
 =?utf-8?B?eURieGdpWlZaNGlOUjFjcFRYWEVQQ2toUW9zMWVXNzVVNG1UTHo4MFUrYm9X?=
 =?utf-8?B?c1lnaFZLMEx1WU5XYjIzRE5zcmlrTFVFS0RvYVp6S0lDZTBlVzRGaE5ab29O?=
 =?utf-8?B?c0kwREprVnhPcTVPTFVEMVJxMTZrK1Z4MjkyNjF5TGQ0MUltT0NhQzRaMXJ5?=
 =?utf-8?B?azA1VnFDTjQ5UEhocWJpUFU3cUdlQW1UWHUwaUtPM1dlcnhLdit4bTgwKzJu?=
 =?utf-8?B?K2phUXBHaE9vKzhha3FLNDJCMnV4SGkyTjI2c1VyenI0QlRwemlLUHlNVjY5?=
 =?utf-8?B?YWlDNkIydkt6UXh2K2V0U05SSUdYdExXSWt0N2d4M1VLL09WUXI5Z3cxNDhv?=
 =?utf-8?B?SnMzc2FKdVRxMVZvS1Z3UmJSdG9MT3I0WG9SU1dwdkxRVklWMVZOejZvNkxz?=
 =?utf-8?B?d3kvblUwTmZBcmh0NXh5c2NXWm9yZ3puZlZ1NjlGM2NxZWp2SmdjSW1CU1Fk?=
 =?utf-8?B?cjNzQndJVEdZRXJPazJTR1Jtb2NiUGkwLzZicS83TEdOcTVhdmMxRHlWMlVH?=
 =?utf-8?Q?uyepX5s4NkO2iJnyOiQvLAVZJy/rE0VrH1zfr8K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cac5310-cefe-4369-517d-08d8e7bbabb0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:07:30.0953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSCafJPPErTjYshQXcDECGCLrxn6zZZybkkAC5M6TjTKUwq/tUd9xEYx6WxvrDBZksR+fMMrbmuccbpWZXSLhh3OB3v90Rd0GCh+3LyZMvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.113;
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

15.03.2021 08:36, Roman Kagan wrote:
> On Fri, Mar 12, 2021 at 03:35:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 10.03.2021 12:32, Roman Kagan wrote:
>>> NBD connect coroutine takes an extra in_flight reference as if it's a
>>> request handler.  This prevents drain from completion until the
>>> connection coroutine is releases the reference.
>>>
>>> When NBD is configured to reconnect, however, this appears to be fatal
>>> to the reconnection idea: the drain procedure wants the reconnection to
>>> be suspended, but this is only possible if the in-flight requests are
>>> canceled.
>>
>> As I remember from our conversation, the problem is not that we don't
>> reconnect during drained section, but exactly that we cancel requests
>> on drained begins starting from 8c517de24a8a1dcbeb.
> 
> Well, I'd put it the other way around: the problem is that we don't
> reconnect during the drained section, so the requests can't be
> successfully completed if the connection breaks: they can either stall
> forever (before 8c517de24a8a1dcbeb) or be aborted (after
> 8c517de24a8a1dcbeb).

The sense of the drained section is that we don't have any inflight requests during drained section.
So, all requests must be finished on drained_begin()..

We can continue reconnect process during drained section. But requests should be completed on drained_begin() anyway.

> 
>> This is not a problem in scenarios when reconnect is rare case and
>> failed request is acceptable. But if we have bad connection and
>> requests should often wait for reconnect (so, it may be considered as
>> a kind of "latency") then really, cancelling the waiting requests on
>> any drain() kills the reconnect feature.
> 
> In our experience the primary purpose of reconnect is not to withstand
> poor network links, but about being able to restart the NBD server
> without disrupting the guest operation.  So failing the requests during
> the server maintenance window is never acceptable, no matter how rare it
> is (and in our practice it isn't).
> 
>>> Fix this by making the connection coroutine stop messing with the
>>> in-flight counter.  Instead, certain care is taken to properly move the
>>> reconnection stuff from one aio_context to another in
>>> .bdrv_{attach,detach}_aio_context callbacks.
>>>
>>> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
>>> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
>>> ---
>>> This patch passes the regular make check but fails some extra iotests,
>>> in particular 277.  It obviously lacks more robust interaction with the
>>> connection thread (which in general is fairly complex and hard to reason
>>> about), and perhaps has some other drawbacks, so I'll work on this
>>> further, but I'd appreciate some feedback on whether the idea is sound.
>>>
>>
>> In general I like the idea. The logic around drain in nbd is
>> overcomplicated. And I never liked the fact that nbd_read_eof() does
>> dec-inc inflight section. Some notes:
>>
>> 1. I hope, the patch can be divided into several ones, as there are
>> several things done:
>>
>> - removing use of in_flight counter introduced by 5ad81b4946
>> - do reconnect during drained section
>> - stop cancelling requests on .drained_begin
> 
> I've split the (somewhat extended) patch into a series of 7, but not
> exactly as you suggested.  In particular, I can't just stop aborting the
> requests on .drained_begin as this would reintroduce the deadlock, so I
> just remove the whole .drained_begin/end in a single patch.
> 
>> 2. 5ad81b4946 was needed to make nbd_client_attach_aio_context()
>> reenter connection_co only in one (or two) possible places, not on any
>> yield.. And I don't see how it is achieved now.. This should be
>> described in commit msg..
> 
> My problem is that I failed to figure out why it was necessary in the
> first place, so I think I don't achieve this with the series.

nbd_client_attach_aio_context() reenters connection_co. So we must be sure,
that on any yield() of connection_co it's safe to enter from
nbd_client_attach_aio_context(). Or somehow prevent enetering on unsafe
yields. So does 5ad81b4946: it prevents entering connection_co from any place
except two, where we decrease inflight counter. (amd we exploit the fact that
nbd_client_attach_aio_context() is called inside drained section.

> 
>> 3. About cancelling requests on drained_begin. The behavior was
>> introduced by 8c517de24a8a1dcbeb, to fix a deadlock. So, if now the
>> deadlock is fixed another way, let's change the logic (don't cancel
>> requests) in a separate patch, and note 8c517de24a8a1dcbeb commit and
>> the commit that fixes deadlock the other way in the commit message.
> 
> As I mentioned earlier I did a patch that removed the root cause; a
> separate patch removing just the request cancelation didn't look
> justified.  I did mention the commits in the log.
> 
> Thanks for the review!  I'm now on to submitting a non-RFC version.
> Roman.
> 


-- 
Best regards,
Vladimir

