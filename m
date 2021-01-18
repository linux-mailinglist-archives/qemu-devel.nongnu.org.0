Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372B2F9C4D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:26:40 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Rk7-0003dN-AB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1RgZ-0001BB-63; Mon, 18 Jan 2021 05:22:59 -0500
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:8674 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1RgW-0000aH-6r; Mon, 18 Jan 2021 05:22:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LePPD0tVUJ06j395vSQKefmmTNt4oLUgSL6rdjh+v6pEy46UPHleqBrY9y4lkFIGCidX6JmFCyZy8xYP7VO2upSpcpBiIRsWxGLbPTNg54IezCiJNZMTH9nkWWNrOI2Q7RZlYN2F35UHHtmT/1I4goUE6foqUah43wSVgMOc6btyCSJqpAExiYm+uxRsqCduraJDTUNPiU76PPKClnBpuPnMaZb1qS2NKlHDdRjcLgIOhnzfvfVPqfgoVUQwQuQ/ai38+l/iOw+DgXbPP539jBq2TrgMBXOpREDVNPdTNUOGquFk7wszFcDHiK4HVJoSmfJOUvdRyKlglyMs+sboyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWq/OtPOdT3rVRU9Mv8IZhhcmfua72laceTpXWHQ7UI=;
 b=g+k/ycm4Y9yVxo4i/unmaR8llCXOLIwAMYPtlPCWV5epa3+p0GhwUvewYld1z2yRK0P+BidfLBqdj/iPAVM3X+t7pnvp74uzucettDLN7J5+6dTFdvnwj/8v0grluz8KPreVGkwjMLKFsaxQvD8WP7D40UC0+jwAogFUpxb36dtt9AJcmiPMHZKlCaH00XD3B0TM3zbVbx1xxmBzPHP5Ze6+kZOfeh5G9evGI4U07Guxfuhw309IKQjyOk41ySPLglmSwt9fB93Fu7X5dbr2ggCzk7GsixiXur8APx0jlIs2qjx4OalaoU02+gXl1rDumYx4s4+vb6u19rZIv65Gyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWq/OtPOdT3rVRU9Mv8IZhhcmfua72laceTpXWHQ7UI=;
 b=c8orc/zR92phW/CPvT5NDbgtHOno/JicOysb+0R3Ti4z6fl/pe13D78cK3oU08unSUIDWUcnuNsoLwWEkPr7LUhoU8tFNDSjyPh/3xlMAMVlPzE+Z5dicOlyUvE5gQX6xqU9j5QRQKkE0WvC74eFTjHbCPB90yW9tPgZokVqVvU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3095.eurprd08.prod.outlook.com (2603:10a6:209:45::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 10:22:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 10:22:51 +0000
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1610715661.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
Date: Mon, 18 Jan 2021 13:22:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <cover.1610715661.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.116]
X-ClientProxiedBy: AM0PR02CA0206.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.116) by
 AM0PR02CA0206.eurprd02.prod.outlook.com (2603:10a6:20b:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Mon, 18 Jan 2021 10:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aaea5aa-6799-412b-5a53-08d8bb9b02ed
X-MS-TrafficTypeDiagnostic: AM6PR08MB3095:
X-Microsoft-Antispam-PRVS: <AM6PR08MB309523D3056688DAC950A153C1A40@AM6PR08MB3095.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqll+KiZ+l+eTvFnd3J95Gs2dKSbVJM7DHHcjcp2eGvSpDjx0/edxAyk3SaMHB64DTxevyYesLas9OhRyQddz8JzAcZqU2Zf+usBNM6+vjwSPGYZgqYqcT8K54rF2GA74OhyZU5Nu4lfCH1dglp8AnmBQlTLq3JeIIyFkP3wHvNHfu8M69gHp5MpjQhpggdgskGJX16y9+7E+b3+Mc/Hcljn/KMzNZjKCaCdklN/LFNcr8mcGbOdgXk+JJgDyfBF/+Ua8acC6bheH1QGIJcGgmTR7X2lhBzMJf4R+noJxqpp4CG/k5j+7HCCqOIDOf/mUF+qvibvJng8Kz+UnJeTy4Hepmx10WUmbcAP9cjXMm5stLkY0d2Ncm2cZ2Xvt72DpISx/6bUDCegZ/ZlInuHxQ7s2oLhMYjgP1WG1idOkCxUwh16PShhrRELr//U1FSITr9yUSMlonsIKL5CzTb6ri+f3Vr7Ntr9I9BPWm2qv4Vmib580SGjy4El65ktzdEnGaVZkEi3zdjb+unQTrQU734mbSs6NIPwqnQ+TyykxTYOx63KyC+DaKCrW5PkkEXutRZp5I2za+Gsg/60oj05m95AQzNEgErnxDJCoihanAVlJCr2DkYoW+T3Ve8E1SEmlf6FAlaNL6f/Gl6NhBEAStY3xrKQLr0Br64cibZXhvX+F9Y0JBsfs3bmIZdesSBz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39840400004)(8936002)(2616005)(66946007)(31696002)(36756003)(186003)(5660300002)(16576012)(31686004)(2906002)(26005)(966005)(86362001)(4326008)(478600001)(956004)(66556008)(8676002)(16526019)(66476007)(54906003)(316002)(52116002)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NzFQcHpKcndiWVAwbm1PNHRsbnY1MlZJWlRqV1hUbjZ2R3RYZndpSkZWZGIv?=
 =?utf-8?B?UXVuRjlsRklIdi83eG9aZUY2RCtCc0g4MHNFcmJFbUJBd1ZJdCtLTFVqdm1z?=
 =?utf-8?B?SytkSVBEK240T0Y3U0huNUM2R3hKVk1xaWdFWGJ0OEdxWk5COEYxSTduZjFX?=
 =?utf-8?B?aEVWYTB1Rytyc3JhcEl2cG1GMnF1L1o0eWk3NW56UUJVakIyS3hLejlmR0Vl?=
 =?utf-8?B?a0UvN0tmNTVuK1BESDh0NDBqUERpc05KUTUyNlpybkdsRGNsWDRTV0tPWElT?=
 =?utf-8?B?T2RTNmhPakFIYVB2N1dkRWdwaDVKOHJvc0R0bGJ2aE9Uc2ppZy9QQzZKa1Bs?=
 =?utf-8?B?OStwMGl2QkNOcHhTSnRxL05ZMUtWTlg4R2l2MUs4MkZFNVEvRCtzZ3kzem9h?=
 =?utf-8?B?endDbWtOS1N4Y0V3NnRNUk5vbHBZNGRYblJPazU5ejREYlNwVHk4VVVyRFNG?=
 =?utf-8?B?YU9aaGJaSE0zdVU3eVBwOWRWeHZLKzB5Wk1hM1lNR3pVY3dsZkJmRXFzejlN?=
 =?utf-8?B?ZVo5NW9RTmdXbW52QS84ajZEcFpYZG9nUzlJZGV2cG04SXplZHc2dmdGWGtG?=
 =?utf-8?B?cW5BL2x4TTQzelIxeHpnZ2R4aGllNXV4M1hWTEJ0dVE2RkpSODkzV0pGdmxL?=
 =?utf-8?B?QmpnTENNYVlPbkQ5bUtUcm85QkJNbVVPU1YrVkdwMmVGZzE5TTViQnZuNWpW?=
 =?utf-8?B?VkJCQVJ3bmFLTW51dHNSc0ptd2hYV3R4NGZXS245d0twYWpZbmJwejcxTDJ3?=
 =?utf-8?B?YjFreVNFMkpuc2s1SVJOS0w0VFcrK3BEbTVsL0Zubkt3aEp2amJ5ZXhiZlg2?=
 =?utf-8?B?QS9ENEdmOUplR05UVzl1aE5hbTh3NkxhbkZCdC9zZVZCYWlhWUFGZmlVTkdx?=
 =?utf-8?B?TFNLVVBDNlVXSVBsUUZXYVZFdUdydmp0bjNsR0kyYWhEeHJHejJobFRiVDNx?=
 =?utf-8?B?SXhxR2QyUXlnYVBtckVPT1pOa1pjQXFwbUlJQk8vUHZJak1mOGpMa0JzSWR6?=
 =?utf-8?B?NGloM2ZlcHNqd3RtTDVSd1l3Z0lKRmVKOHFLNEFNL3RRSHUzTVVRc0E3L0xp?=
 =?utf-8?B?dXJGSGVQdmtZWnljd1RiVS9kVDRqNjZpRFg0eW5uY1B6ektLQU11d1JTUmtE?=
 =?utf-8?B?S2xNbkNlNzlwV1B6R1NLV0p2ZElGWkloVkpmYjRzMEJnNzRBbnEzczJjNVo3?=
 =?utf-8?B?OG9NZzh2c0xhekZmWjdrNnVmalVBT3dVWFpYTEFGNUFYdDQrc2hBejlwRGJ3?=
 =?utf-8?B?OEFuTkhxL1lwNzAzRW9tZ3U5SE02ZnIyRjI4YllhWUJEbCs2N3J1UytMNzZM?=
 =?utf-8?Q?OR7oZ7ZzuHEZMbaV4yJniq/uocKX9RaCP+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaea5aa-6799-412b-5a53-08d8bb9b02ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 10:22:51.7519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dwzW8e1RmluGWuHgmM0LBqowbVGKlMn5Az1ukQjuzkrGVCzLg4UOy1ZRquAqgU2H4WCHJYl5pxYEQERJhruuIIE9jWwszRs3ZukcRKoiAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3095
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 16:02, Alberto Garcia wrote:
> Hi,
> 
> during the past months we talked about making x-blockdev-reopen stable
> API, and one of the missing things was having support for changing
> bs->file. See here for the discusssion (I can't find the message from
> Kashyap that started the thread in the web archives):
> 
>     https://lists.gnu.org/archive/html/qemu-block/2020-10/msg00922.html
> 
> I was testing this and one of the problems that I found was that
> removing a filter node using this command is tricky because of the
> permission system, see here for details:
> 
>     https://lists.gnu.org/archive/html/qemu-block/2020-12/msg00092.html
> 
> The good news is that Vladimir posted a set of patches that changes
> the way that permissions are updated on reopen:
> 
>     https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00745.html
> 
> I was testing if this would be useful to solve the problem that I
> mentioned earlier and it seems to be the case so I wrote a patch to
> add support for changing bs->file, along with a couple of test cases.
> 
> This is still an RFC but you can see the idea.

Good idea and I glad to see that my patches help:)

Hmm, still, removing a filter which want to unshare WRITE even when doesn't have any parents will be a problem anyway, so we'll need a new command to drop filter with a logic like in bdrv_drop_filter in my series.

Or, we can introduce multiple reopen.. So that x-blockdev-reopen will take a list of BlockdevOptions, and do all modifications in one transaction. Than we'll be able to drop filter by transactional update of top node child and removing filter child link.

> 
> These patches apply on top of Vladimir's branch:
> 
> git: https://src.openvz.org/scm/~vsementsov/qemu.git
> tag: up-block-topologic-perm-v2
> 
> Opinions are very welcome!
> 
> Berto
> 
> Alberto Garcia (2):
>    block: Allow changing bs->file on reopen
>    iotests: Update 245 to support replacing files with x-blockdev-reopen
> 
>   include/block/block.h      |  1 +
>   block.c                    | 61 ++++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/245     | 61 +++++++++++++++++++++++++++++++++++---
>   tests/qemu-iotests/245.out |  4 +--
>   4 files changed, 121 insertions(+), 6 deletions(-)
> 


-- 
Best regards,
Vladimir

