Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75273784A9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:56:53 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3an-0006Tt-0P
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3ZU-0005jM-4P; Mon, 10 May 2021 06:55:32 -0400
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:49249 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3ZR-00082l-8R; Mon, 10 May 2021 06:55:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G02n/2qTRvEqVpwJqM8MULOXxGisifsj8Y1WYQAnZcZtBV8EPQ42yn2LlOoAy5LIfKC9cAHi9+CNpESkFogUaIQ174xot399rQxi8518+aLqo4LX1ODEnd2dvyhqzLuGQRXbqOBQTAhxtPByVo1NI5p7jUX+H3l1PJYehXOq31h7dr6pEoXfSL0wlU8tNwbrjbUR3nZJxJPINfd3kVtyy4c7z1QWb8CrfpT5x/cNTrpgjcpZAev09zzIERBg5Y3XjkY4p2F11lAgpKCu2in0xgAbKjuuULfZncWPMPGOYdzsNHDwlugmhfxYYTNxtw9t+3jXLLDE7+1Csijk5EI94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFofr7EvAph31/iC08jNEUszIa1/28q91+mf84EBFe0=;
 b=Aukn7MBw+bTjogvZjKJAAtcX5o+/AnaXVi0MHatJhrX4FMHZn1KYA0Avr24KixOzARu4TEGsM4JwEkIfxnsmUm+/rwv2Mh273oNgJieHWBvtNUI0PX0/MRB44LZA9gX9vKz/Li4/ejlcP9YYdAC8BRFR9za16SN63+8CbwPiTSvJQtJHnRBFpfMb1ADUeYOqTmS5CMCe0lQW0DX0LfKma8T56EyuLfO0QtzPGIQNURaZ8rBVkFvQrtK89XpgDPioXMczGcX69zKrwNRKt/Zc5LRXzTSbExpzgI3rK/tIjUNL9vD3DFrQ9Qu3Q2pZPdM+Gc0PVV2tiyjEFYWlkw9+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFofr7EvAph31/iC08jNEUszIa1/28q91+mf84EBFe0=;
 b=pmVgtl89EF0ZxSsTiDEwrIdfmwvCTxuzQ0QmtWKGG6oKAOmkhOoMkucQpJEAdTqpLq/ZlEhJxBFP8CGaSocc8gXjHuY4C3D99kJG0whAHxbXsycm+yeFOZNlPiQaoK3E+fEX1JRR7c5cPu3uvCYUARwXj7Z6KMh1Lc/o03OTR0o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 10:55:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:55:24 +0000
Subject: Re: [PATCH 0/6] block-copy: make helper APIs thread safe
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5d5cbb4b-e558-ec95-466e-b576e1caecc6@virtuozzo.com>
Date: Mon, 10 May 2021 13:55:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM0PR10CA0099.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM0PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 10 May 2021 10:55:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cec382ea-8bdf-4196-4bbb-08d913a21d59
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447760BF9B8EB6864C84219C1549@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV6IVw2Qec1OvNDpn6PLplvApyVSQyCdVysilqOhA7U5XVum2+50ubSx36SrF4kFMgF0q9bX2WbrhPkTETevQZcN0VC3fybG8tt3ud9kiJLvot6YUbfvH/ZWTV8TI0a5VXkSGTk0/LXFl/Bd8i0F0RUbCbGZz8DrRkFujdBKrkIrXGNys/Kk/Ic53C6FLJO2YE/KXSsvvb/+oLKUXnIt45GNHtuz5OYOYlWQ6Cuxp8zYbKDBGU+M21bMWZoXpB1ZnuMBPvwgJlIxFA000CUprON2BHPuJkE67+whTyt73GSOwHZdPHePrA2g5C6QNgi3bMmyie9ipjxLLJKq9fdQl/xti4RDqpHglPLgZW4t8fAh3DpZVgVw2PqCGsgT31zj4d9BFBCj2v2UiCdJa/RngE8RFiOYap3pFoBg29GySQWSgN5N0tag7j4u1JQxGRWFnlIuWFftoIy3CtWj59VLKQF4zp6qnrOT2p2j+qKLn9Az9F7XaPWucQPMXhh28v3W2shcP6dfQXrM9OQu6uMzUsiRLH0cJF7aNl2AEekiqPhTb0Y9aQp9B+nCZkqxegO1j6aDFaqQqTprjXkFfb7hjYLpF3RdQKKwr5OBc/wNLm+2UpcVbuaaXaSbhoidPoGrMI8yh9lq9/Cdd/0kslZfn7xVV0ULxWRUq2ky4OzSE9hej6CZMXitUQpxmFtw8e5UfN40TQLTEtS1InVJJBONcEjmQPMFCc1YTanoUQpCVJj71Fb8KPHkIw4B77AoLB9TRF1Tp85Dv0wFgwtAS9zcpZ7ji2Ctu9JRYXEwG5aRKAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39840400004)(2906002)(8676002)(66476007)(66556008)(8936002)(54906003)(31696002)(83380400001)(26005)(16576012)(316002)(6486002)(52116002)(86362001)(38100700002)(38350700002)(478600001)(966005)(66946007)(956004)(2616005)(5660300002)(31686004)(36756003)(186003)(16526019)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHNSMTQrZE5jNytqTnVzbFJnYkMrVEVNNU1WQWlLaXVXMGF1dWVJek9Yblo2?=
 =?utf-8?B?Z2wreDZka3hQU21UdFgwUVIvaW9YeDNLZDZydklNclI4Nm8ydHZVZkRXU0xi?=
 =?utf-8?B?UXEySHBLWWJ1cS9hMkI4NFczU0NNUUVGTVhneTk3bXIwc3ZKRmIrMTAxaEJx?=
 =?utf-8?B?c3FvWHdNUWRlZkhJSE5scEppRDFDdk94bE9NSVE5azZkNUNvRHZvMGRWU3Bm?=
 =?utf-8?B?RzFUSk9DVWVqTnNueUMxTW81YTVCb29Fak9wUmdlbFM4T0N0K1ljcHNkUUdq?=
 =?utf-8?B?WVc5ekFyUzNKRFI3anlKSXJTWUd0OVdxSXcvMWtVbWdCazMzSkFkSUhyQ0J1?=
 =?utf-8?B?RzJkWFhlTVpqWDArYzFkbXp2SSs0WmdRWkx0OUJvWG9wWnFUWHEzSytrOC92?=
 =?utf-8?B?MHdXR0tyQkxpMWlWTlNIYy9OQkRvM0VveFppbFV3RFR2Y3RBSUtoUHFTRnhn?=
 =?utf-8?B?ejA0MDEyU0d1TWFFeTdLa0FYTWhxMm15c0JyMDZ3ZkVIRkR3NHJ6VnFFNGly?=
 =?utf-8?B?cFkvUk94QlhYOG5Oc1ROaHJ5SGtRVGtFVmZIRTBBK1hPcjZKT1laUzBXVnVS?=
 =?utf-8?B?TTAxV3h6ODU3a0pOb2hicnhUZWlLL1JlcDBYdVc3UU9QaW9ac3VxUmhIakxE?=
 =?utf-8?B?c2h1SDhzMWJQS1VjTlBWMVJKZHJLYU9SaDdWandWUnUwdmR5SG8vQ3pUMTNQ?=
 =?utf-8?B?aGhDSjA5T0cvME8zdUlwcDZNRHg1WGsvcWU0cXZVeWgyb3hSTXZ2NjlyT21l?=
 =?utf-8?B?RFJ4aVNCOEIySytlS2xtSXZxa0wyTmROM3VqNURWc0FCVjZWbEViazRCZkxS?=
 =?utf-8?B?dzNzVVJINTh2QTBCUG1aTmhPQmZFYVRVWkxYOHJsMDJQWllzaWlzNHVVOTRr?=
 =?utf-8?B?RWh1cS9SY2xyOE8xZWN2ODdnTUxrWFVzRUQ4bklLSnpWNlhGQWNTcnEvZ3Az?=
 =?utf-8?B?c0Fhck5NdzVLUDF0OUtjSzVIVTI2amNQT0FuSGh0VnE2bFh2WEY3RWJBMmUv?=
 =?utf-8?B?UHRLaGlhdk5CTlJOQTd6aE4xNm5YVm9XNHAySStYdzZJV0t2aUh0K0l3N0xS?=
 =?utf-8?B?dmhqSDNsNks3ekN6dnBEbytjTHlSZmp1TDExY0R6MXlPdjA1SVhqVlpRbXc3?=
 =?utf-8?B?ek1BYWtNZzF4cVhrdnhmYU9VOXhSaFRwRHJkTWl5TDBiYU56bDdkVjMvQ2RC?=
 =?utf-8?B?STdORkN0eklpbHdPbklHdk54aXRkRERxTjhkVHlSa0tza2l3TlpiK1VZZURv?=
 =?utf-8?B?M0JsaXNyMFUwZDk5U2xVcUUxTGVqT1ZoTC96UHJRTXV0UG53TWFXLzk3cXNR?=
 =?utf-8?B?cnc1RVFnb1JmMGhXaXI0R3R6RUdIY0xDTHdTU2pYdEVYcWtuZmF3Zm56ajRS?=
 =?utf-8?B?Z0ZPVkZHUTg0TGhsWi9aR3FBREd2bWlaN0NWdEJBV0R4eFFsNzRkWFYwQmdm?=
 =?utf-8?B?NXdwRWhlR282U042WUZFZlRxSkhPbUErdVY5WnA5RWlFMnlzUGpZMnRvQXdv?=
 =?utf-8?B?VzgxL0FlL3lPYmZSZHJxbEhWQVd5aVJGQ2pTQzR5UUo0Y2JQUXF1b0FzUzc4?=
 =?utf-8?B?emIxaDF4YXd2RHZFV0ZacUVRVEZGWXNrU3FTdklIa2YwUUdCNjRibXRRTE4w?=
 =?utf-8?B?ZHZweUg1QU1ua0RWVERmY29iaGxXMmZOQnNsVytTK1ZnRTI4NExXcUxDL0hZ?=
 =?utf-8?B?N3ByMHczcHRHQ1hjRlBSZ0UxVUFQSEtKZXFic2xGVWNmNStpWVpUamRVaFhG?=
 =?utf-8?Q?ZHH33oyI3xTZt5mwJPKv3DOjchF3Z9Bgkxw3mMi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec382ea-8bdf-4196-4bbb-08d913a21d59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:55:24.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AWyRFZyg6D7sXQdqUjPuwj3YnlFMCAkPkrTEF3h3FDPjjnFCG9qor7ce4gaekPB3Er09M61hmliyuarHpKbjkIfGkUy0op6nEXnlipB5z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> This serie of patches bring thread safety to the smaller APIs used by
> block-copy, namely ratelimit, progressmeter, co-shared-resource
> and aiotask.
> The end goal is to reduce the usage of the global
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.
> 
> This serie depends on Paolo's coroutine_sleep API.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
> 
> Patches 1-3 work on ratelimit (they are also based on the first
> ratelimit patch sent by Paolo), 4 covers progressmeter,
> 5 co-shared-resources and 6 aiopool.
> 
> Based-on: <20210503112550.478521-1-pbonzini@redhat.com> [coroutine_sleep]
> Based-on: <20210413125533.217440-1-pbonzini@redhat.com> [ratelimit]

Seems, patchew failed to parse your "Based-on" tags: https://patchew.org/QEMU/20210510085941.22769-1-eesposit@redhat.com/
(and tries to apply series on master)
I think, it's because you placed "[...]" comments on the same lines.

Interesting, will patchew see, if I just duplicate tags here:

Based-on: <20210503112550.478521-1-pbonzini@redhat.com>
Based-on: <20210413125533.217440-1-pbonzini@redhat.com>


> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v1 -> v2:
> * More field categorized as IN/State/OUT in the various struct
> * Fix a couple of places where I missed locks [Vladimir, Paolo]
> 
> Emanuele Giuseppe Esposito (3):
>    progressmeter: protect with a mutex
>    co-shared-resource: protect with a mutex
>    aiopool: protect with a mutex
> 
> Paolo Bonzini (3):
>    ratelimit: treat zero speed as unlimited
>    block-copy: let ratelimit handle a speed of 0
>    blockjob: let ratelimit handle a speed of 0
> 
>   block/aio_task.c               | 63 ++++++++++++++++++++--------------
>   block/block-copy.c             | 28 ++++++---------
>   blockjob.c                     | 45 +++++++++++++++---------
>   include/block/aio_task.h       |  2 +-
>   include/qemu/progress_meter.h  | 31 +++++++++++++++++
>   include/qemu/ratelimit.h       | 12 +++++--
>   job-qmp.c                      |  8 +++--
>   job.c                          |  3 ++
>   qemu-img.c                     |  9 +++--
>   util/qemu-co-shared-resource.c | 26 +++++++++++---
>   10 files changed, 155 insertions(+), 72 deletions(-)
> 


-- 
Best regards,
Vladimir

