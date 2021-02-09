Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587E31495E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:18:15 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NHp-0002Tx-JP
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9NFq-0001we-LQ; Tue, 09 Feb 2021 02:16:10 -0500
Received: from mail-eopbgr150105.outbound.protection.outlook.com
 ([40.107.15.105]:57312 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9NFj-0007qs-SK; Tue, 09 Feb 2021 02:16:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AidNNzo7WsFEfX/PCgA4pTaTU2KXRr5On6LR/5kLDCDl4ZCpJwDUAGOH1p2oAVXVPdioe8mSRhywm0BKSwrw6WBFk16I3Zhj0RpkkJOgC0QWnZAUAw6650rskEmCHONdsXXXPKjxC/U+FwIWUm7AahbeY4rZaU0HqKQ4mBUFNu0xlfG7HpWgL7+kuy8dDs8VDkkyFXsUKMjc5HQxheJFmphCJYi2+A8eySjvZiLnPRdSwKnPRbrH+LlmJkti3wyR0pzs6L2wxCx927qIaTnksVpV2kFfbgr2d9FYqw/cxDPmx+Ri2qO7ggltuH3ZCGezgtWWs1dqc6P0GmBTSzI9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v2KwnFlKi/wZnuu3JkCt8DwGFkQemssGYZ2NJWV8Mc=;
 b=eQQ4gAusR5R/RAKyWUIuHQcCOfNfB5OFu/4M7+XbmKd59HkX2+kGnZ6a1Jx4dkyUtBK1ZjROW/P6sAfwwctABoVl4r2oLmP7qcwUgCTxHrAEOTaiuNBuxafU3wONCJOHx1smTurcijiCacHMJQnfUsDKMK79P9iWcpFGonomrlHc0A2yEd4JmlICwaujQiU5sMvK28mxPP0Pcwsi/AAJGKhALqCzIx9R8STfrm2PWQt9DQbohR7Il2yaiAlQnMDBBqlhdeIOzDSi+SwpwnPT4vhR+zlQTqVqcVhr/yitffARjZH1/FqyZYvvDar9mLvs2a6Y7gO5WMj48roEqqQDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v2KwnFlKi/wZnuu3JkCt8DwGFkQemssGYZ2NJWV8Mc=;
 b=JbKGjGOriF7/jCN+MY6DEqvNKIRg7sNvHBcivqmE1Ys8uziMx8JktfvWuF96htDv6Hgg7OlIwBftj/JUWU5DTqzeCu+WbOsV6kdZTRp+HknNcf5m4CEgpvAq9S3Kadu1ES4tah8qawfr63oWMvodkWHvyHL9025v7PX1JyyJdqg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 07:15:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 07:15:59 +0000
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1612809837.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <271ef73e-dbc0-93bc-a7d4-1d80e063146d@virtuozzo.com>
Date: Tue, 9 Feb 2021 10:15:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <cover.1612809837.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM9P193CA0011.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM9P193CA0011.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Tue, 9 Feb 2021 07:15:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d7fd1e-ea8e-48ed-214d-08d8ccca8cd5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-Microsoft-Antispam-PRVS: <AS8PR08MB64701A20D94CD27D5D27079AC18E9@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHzpqSVAyeCUdU9AFtu99nw+jie6sv+Ic59SqacbjaWibs3k4Kf6dz6LSIyyP8OrXO2XirR5s8to5MeYM2eRIx5dV7ymTJGojqcrNItant5Wk/kRZruiZOmCsNeTFCee0fjkiuHrIJ81Ez9MaPlfsYwN83hBCyY90iyKTY302OYq0XNH2vZNJkc62yBrgARexoDw5KQUvViaO6zTzfHXi0DGVHdoUQyphrfoFd0va7FtaKiIA0e6nckOIKizt2iDbHZ24Uvx3PJ2GQGV0csj3j2IDzNuAd4qhXeGVcHj2bBA7QD4FTYGa/zqXAvORuVsTvI2Ykfa4ZrYK/sD7gySDGQQygdVGvbIW6THF7QPpdhnE3s37B42IG1d+FMlMp59vEaV6Cr+e5tMg2kdw4gdhpByr52aWfLfE5xJEZeFb7qxKFFvL4NZp9MwWSguCfN/32nloSQb3sHpqk17zDSIKZSmyYJa6/FqKW9Sb2/W35XeI+8ZDahh63YuAWQw2iwUEGVMHLFoscmKB/fNBsNl3d4FEhapAY2TZ67Kc3RR90sQFRCHjuY81uIfHd+jZt63DcxJgx31hQjhVg+dmhJapMiq4vGNkCAspPQ0MVKJveyhhW1nH/Pako5jK1Bif7stbtnGW2Sb3Cd7UiuuM+SawS1/3cq6zof3dYCnGeavvDfD/FWYJbgzxz7GZdbB1Js4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39830400003)(2616005)(956004)(16526019)(36756003)(186003)(52116002)(26005)(4326008)(478600001)(5660300002)(966005)(2906002)(316002)(16576012)(6486002)(54906003)(66556008)(66476007)(8676002)(8936002)(66946007)(31696002)(86362001)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkVCbERMK0h5QU1PbUtkR0tXTENsOWJtRStKTjNLRE5kY2U4Q2Eza01BaFVC?=
 =?utf-8?B?amNvLzlSNjR5c1doNmFzZDBIakVMK1k4NU5IUmFRaW4reFJaQis5djRtd2dO?=
 =?utf-8?B?NjBtV09WRmhJVUlQVitOS29HdjdiMGhHbUYxVlljbkJMN1pQVUJ5bElUblZD?=
 =?utf-8?B?NmRzN3JZcXZiU3hVVi9zRTd2ckNZTC9rVGdUeStqM0xNanB3NGJYMTQybmM3?=
 =?utf-8?B?UVNnOXJ6SnJWVExPSk9raU1MZEZxMlRVQ21haFdFTXY2VGFnV3ZFUWJIbE14?=
 =?utf-8?B?NG5wL00yVDJwUDdTVzFMbUlVcXRkMjFtVGJjakxpL0hlbjEvcFR4bG9paVVB?=
 =?utf-8?B?MGFJbk0zbzdLc01tUnQ1MDZHVVE3d3dyMVlNNGJ0Tm5YdUJaNU9qOW5Gbmlw?=
 =?utf-8?B?MmU5dEJ6K0kxOVMrbld2ZFB2NmRZdFJhb3hMQXZPUm83bHRQbFUxVVZJNW1w?=
 =?utf-8?B?b05qV2pyUnNWV25PV0JVQlVYcVZzVFZOc2tKQnE2K3dRc0NhT3NMc3BEZ3p2?=
 =?utf-8?B?QzVPQXY5YS9ZMUpUb3lFMFJJS2dsdUdvTHk3SjlNM3JjeFgxR0p3Y3QzUVAw?=
 =?utf-8?B?OHNpZ1d5dkduU0VHb3VwaXB6cnZ1YW50TkdFT0RGdFRrOVFYcE0xdGhTUDhq?=
 =?utf-8?B?cit2YlBYQlpDTWdMUFMwNFZPUTR6SUZEMUE2aDI5bzFJK3hpRHdFVnRtdlJI?=
 =?utf-8?B?MjhJMStQaEc2VkZCRkorb1kxbDFnUmtGSGpmMEFFdHBOUDUvcWdGVGRCRlRB?=
 =?utf-8?B?SklaeWh1anRRTUpFMnIwL2x5eUd1cGVaZG92YWdVcWk2U2QvdjB6WDEwblM5?=
 =?utf-8?B?TDRLSEEvTHVIMTY4em1iWVEzZEFUQ0I0R3dYVysyTVRNN1hqRzhYZStBN0Zy?=
 =?utf-8?B?c0R3bjQybnIwVUR1dWx3bnU0ek42N1IvR3VwTG9xM1NvYlEza1ppbnMrUFBN?=
 =?utf-8?B?QkRUaW5GZjRMV0VVZ0hZNW9NYVgzWEk2cVFYRjlIK3VWZitXSG5jWTNqUktu?=
 =?utf-8?B?QUUzcGoyQWNza0hUTFFLenNGNzZvbVNvV25yOU1qai81YlZUZTZxLzdEVWlM?=
 =?utf-8?B?TWR3Vk9UK2l2bDFZYUpUR2FnUlVReDMzYTJXdnMyK2xmL1Fsd3Q0dnVPNW5X?=
 =?utf-8?B?L3RDOG1SS3lpSGw1dkJJbW5peDlBb2xTNnRoS3d4WGdjRHRtQ0l0Y1oyY0RR?=
 =?utf-8?B?RjFZOU9PcHBlVlVsM0gzZnI1c09kUWFHdmo3K1VZOFgyd1huWTZmc2t5dzlO?=
 =?utf-8?B?VU52SUZPbXhpQWZrK1JnQ0Q3QlVIMHBjZml3aTlaeTFFa1R3dFY4UkNPdGN4?=
 =?utf-8?B?N212UldvMC96V2ttSi95aHlSV21HeFE0UjhjK2NMcHE1SVVuL2ZUcEpIVjJr?=
 =?utf-8?B?Uy9TTTYzNzN0UjlpR3JmaHJmY2ttZDA0czVYWW03eDBFcUtmcERQM2ZmUkM2?=
 =?utf-8?B?bzZJNVNJQnF3SzNIWlFaaDI3N3ZLMTdiQmpxSjhXR0JWZDRDbmhFd28wYXZr?=
 =?utf-8?B?NjlPYjVldVVwQWdsSk1ScWdMRGdaWXpXYzBNZi9qTCtKRG40aGF1Qm5KdlFX?=
 =?utf-8?B?NDRBQ05pcmFodmFsQzl5WVlsaFlVbCtIdVZoNE4xdjZkQWxvMkdjTk5qOXh5?=
 =?utf-8?B?RHN2YngxM3hUYlBUN2tqUDRIbTFPcVNRWUJqbG01dk9Ka2YvUVpjYmdUWlEy?=
 =?utf-8?B?LzZFZ1FYak1ISVhWYTAza3d6Y0ViNzZtT1NjdElDTnlUZUNEMXBKbnU2UVRo?=
 =?utf-8?Q?Xg6snlpBvVTnrZ7vXoFGAL+x12z5VrUAvCXxHGs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d7fd1e-ea8e-48ed-214d-08d8ccca8cd5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 07:15:59.3911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0CHmEHHAJCndLfzu1pi27FOelBHuT4yqpJLYh9XNT7VEpjQsPe8azDbtOYFNFyhGAyBlRM/XtY0BbjoO55TPGjlN5kW819Sf/TAx/t6k/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.15.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
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

08.02.2021 21:44, Alberto Garcia wrote:
> Hi,
> 
> this series allows changing bs->file using x-blockdev-reopen. Read
> here for more details:
> 
>     https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> 
> Version 2 of the series introduces a very significant change:
> x-blockdev-reopen now receives a list of BlockdevOptions instead of
> just one, so it is possible to reopen multiple block devices using a
> single transaction.
> 
> This is still an RFC, I haven't updated the documentation and the
> structure of the patches will probably change in the future, but I'd
> like to know your opinion about the approach.
> 
> These patches apply on top of Vladimir's branch:
> 
> git: https://src.openvz.org/scm/~vsementsov/qemu.git
> tag: up-block-topologic-perm-v2

Patchew understands "Based-on: MESSAGE_ID" tag, so, you can add:

Based-on: <20201127144522.29991-1-vsementsov@virtuozzo.com>

> 
> Regards,
> 
> Berto
> 
> Alberto Garcia (4):
>    block: Allow changing bs->file on reopen
>    iotests: Update 245 to support replacing files with x-blockdev-reopen
>    block: Support multiple reopening with x-blockdev-reopen
>    iotests: Test reopening multiple devices at the same time
> 
>   qapi/block-core.json       |   2 +-
>   include/block/block.h      |   2 +
>   block.c                    |  81 +++++++++++++++++++++--
>   blockdev.c                 |  85 +++++++++++++-----------
>   tests/qemu-iotests/155     |   9 ++-
>   tests/qemu-iotests/165     |   4 +-
>   tests/qemu-iotests/245     | 128 ++++++++++++++++++++++++++++++++-----
>   tests/qemu-iotests/245.out |   4 +-
>   tests/qemu-iotests/248     |   2 +-
>   tests/qemu-iotests/248.out |   2 +-
>   tests/qemu-iotests/298     |   4 +-
>   11 files changed, 254 insertions(+), 69 deletions(-)
> 


-- 
Best regards,
Vladimir

