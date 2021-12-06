Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743746A6DD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 21:28:50 +0100 (CET)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muKbR-00044j-ED
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 15:28:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muKZH-0002IA-RR; Mon, 06 Dec 2021 15:26:35 -0500
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:14080 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muKZF-0000GP-0b; Mon, 06 Dec 2021 15:26:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGQ6jcN3fzAhqWIiI0f2PNup0B89yz5SNPBtbTpyive6YMB0BV58YdFH0VhBRxtyvEHlffajiL6Xe8+NfdyspktcrPtH0/reXeMW1DQl/AtHarnf/fDVbvDQ74x/NURit9d0reVmFsukh2mH0BoVO8kSHy/6jjjvt+w4TvUq3WmO25s/5iBp7RUvDWxXGAWQi4SAlqYvW7iZ0PTRnjmiVPRgRUW1EoYUSzS6aLD7ajm87c68B6Lq59pF0uLe5ds3M52hGKtO4kjKbE5twvLQ9WXmc397QP/3icT2+WmWlz5MKnnM6S5G0k3ozy7MTPKvaLCHVtWykYxn1ZhYA2r1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB6yjwdosnslvIGdfVihnZDZugnjV+utwbVz3Nuk8o0=;
 b=Z/9+fNXwEH8ld0S2+VlaK6sL1MFQUaGW4ukWpqk6KONX7T2QgqW/h2ZL4ZUYpgbBy5lWTsI41UKwlbQigToraRN+TbTFQk6TzmL51ESqZQwK2LIFx0ogZRexTFlzaXllbhLGSFfhktFTbN2/CZyLlPSIhmjpVhRhoiKkeFxrNQJUiv98WuFvLu0aS5+JpjsSv+UpfINTqGI/emtdjxCa+59/VrMS+ioimPHkQJIM9Rq8eIlHu5uBgDxY+VR2t2mhpjgIjyzdoC4TTrRmJ2eMGf/zMoUl6tc8ikEgRbOkF3b30EMVcGKZwQlfKeH5hg8oIadNSdfdpOz8LPGwaOqZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB6yjwdosnslvIGdfVihnZDZugnjV+utwbVz3Nuk8o0=;
 b=N5Q66SGYQ0AL+d5CU+likgdIWoUAVp0lIUKZ+hRoIOIGa83Y+9vIegiNMhKchHCfVpvDQ8hMFrKkZIYP22kDLG0cJH3MRck0BLSchWwT5d2scvZTMOE0WXpQlr4RJot7ZkvgyuHBhmrwaj/4PDuX0DhNYP/GHDCH/3VS44tG2iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5571.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 20:26:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 20:26:30 +0000
Message-ID: <68d4742a-bcc4-df26-41d0-ece75eea58e0@virtuozzo.com>
Date: Mon, 6 Dec 2021 23:26:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] iotests: multiprocessing!!
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <CAFn=p-bsY_QWNoRWp928_dwmNyXXcDQ7Bi+0P9ObAsxGTYyiBA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-bsY_QWNoRWp928_dwmNyXXcDQ7Bi+0P9ObAsxGTYyiBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0361.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::13) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0361.eurprd06.prod.outlook.com (2603:10a6:20b:460::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 20:26:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c64b78-9ea6-4695-ef38-08d9b8f6afe8
X-MS-TrafficTypeDiagnostic: AM8PR08MB5571:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5571593D459DE9FE56C398FFC16D9@AM8PR08MB5571.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxUR/1YjHQEUg1nDUr06AYjGETlkeip/O9Bc1vlW2MAefImulJaKpMYqRy9iQ/blC6VtgasEdQQA4rF/rk8rya4IOGNhIYxAdiv1xkUhqhjzghO2FqtAuTqsTXypJqM5O8A1NO+XU+lvnXvapY7l1NnwQxxQ+7I89LM6HU0U33tmLD0Sn74UZJI4VO68s5Lv2d1YsFOv2hJ0DjnsgtV9Apmf4A/Q0z0ifLfVOzDfvjPqJoBEQhUfq4YuNVTvxquHC3FyvMt3sUefDsNO3KoJz4Zuq63PQoJcQrAG8z2d3AUCNWYI5ltS6tZZKpCNXsV7R6/VaJmnKYW/cR0+idCqWk6502hDDEKk8xQfIljXYkYhy8Dh9TOqN+q4ax88uMJq76t0Fumcy55C7TbUiPR7zaXkQhHn8bDKP1G7L9IfWx2g1ICNJpIed9F3TbxEQD0kEjjYXYpQmuJyhcqzVgG4bg1KNHxiEhI/iS7himOAl1p++sfEBC07QQwtCBQ3ICalWqAFCE82sIFZ8yGQ6f9H6do0v5N+s26WReLAY5yjpQjg3VI4/AKA/lgaTu7kl+olFvuwHyAfAKkS2pnWnPuh8d7iQ63uIf0hbcgibj4TfXA2Y92sN946ubBjxc7LF7cyJG0uBdgPk2B6M9lsy308yOv550z8+GgMyIJgpv1E/4fQOlliknjiemnKWnRn1mjTIjt3NA4FoCSQNUTIGgAyu/WxwNPpgLXix2jz1vdmN5217l7GqUyl4PVFPaIVydCxQtrZ7RyCPDvk9mKKqRd75w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(86362001)(2906002)(316002)(52116002)(31686004)(54906003)(8936002)(4326008)(8676002)(16576012)(5660300002)(6486002)(66476007)(6916009)(26005)(31696002)(107886003)(66946007)(66556008)(508600001)(186003)(2616005)(956004)(38350700002)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUsrZ0hQNUxudGx1anArZ253YXpjQVNNQkY1dlNmL1VHNElyZ3h4T3VQbjVq?=
 =?utf-8?B?S0UxQUdOUWpTZDlkVmxCNGVrcURkall3WE9uYUZwN21hNzFTbnBKeGk1Ri93?=
 =?utf-8?B?Wm9PQSs5Y25oMEVXVkY5R3BWdmtEL2JZUUdpQWhBYXFsMmJ1V0hpUkMzRG9a?=
 =?utf-8?B?V0JDbzRuS2tEVjcrVnBsVkJWL0dKbXlmZjgzWG9HOXRHQURXV3dtMW5OZWtw?=
 =?utf-8?B?YWZFMWdZQnlyOWE4RXUwZStOVjZkZnEyM0ZwZ1R0cVZDSWtkZEV4S0FXMm94?=
 =?utf-8?B?dVU3SWJMVVp4VkZFSDBYS2tPazVYb0ZoZW9Ca1dtM1c4b3EwQzUxZzkyV2sw?=
 =?utf-8?B?TE5qNlQ3WmZXRXFkaFpJWGMrY1ZpRUF4eTJycTJCc3Jiai8xM2hDZElRWWhJ?=
 =?utf-8?B?YXhuZEhrQUdjbVFGQ0p2RlFORi8rR2xnRURUTnNhOGN5QU0zR21BelRLeG03?=
 =?utf-8?B?bEZWbVU4NFlkRTA4WDNQdDVFOHdwNDVTOHZneVFMWTY5Q1hBYU9FeVNIU2Ni?=
 =?utf-8?B?RXBLQ1B5Y2hncmRFS1RNanVGVmIxN0N5anUxZXc1WFhNR3lhK1QzRG9TWXd2?=
 =?utf-8?B?dXR6Rk1HdnV0RThFT3d4N0ZOZlgweEpMNTY4ZGQ2MmYyQ2lFMUNJYjNNdHVD?=
 =?utf-8?B?djhWTmYzb011Kzh3OG4yNlN2YXY3bE5abHEyQXYvbTZhcHVSNWZwaHgyTUlG?=
 =?utf-8?B?d0p6Y29uejFhK3RrWTNLaG5lSEprbFlvU0Fpdk9XVmwyTXNpT1hmcklhcXZ6?=
 =?utf-8?B?UkFiOFVOZDJnTDdyOEJFdnljaUllNkpaTWVHcEJ1Vm5LY1FmUzUvdkNWckt3?=
 =?utf-8?B?MDV2Y05UcWtHcHVUUk82eGFTM3hFckc5ekZHcC9aY2U4TitVK3A3WnFod0FT?=
 =?utf-8?B?cXFUTWJWZ2dNaStuY2FzdGxjNWVHZ1EwS3h6YnMxMTE5UGRoZnFQaktPYVhY?=
 =?utf-8?B?MFFNOTBMdXZmWU50Sythc25jRDZLYVM4UlI2M1E3cDUzdmtmVW5XUnRkVVBj?=
 =?utf-8?B?Q1JOV3ErMStLZG1DdkdSbk5vcG5oMjdyYzNWY3g0Y1VkQkkvcE5XTzArY0Fp?=
 =?utf-8?B?R0p1ZEtwSTVlTjlVZXBHcUZqSGMwN1dKQ20vc002OHRYUHlCUHdSRFpDc2ZE?=
 =?utf-8?B?a1VlTnBaWHFrRmZQS2xqdEdSSlk1NDNrdUNoLzJMd3BVRWVNSGozWUlFbnlt?=
 =?utf-8?B?QmNTSXhJOHp2eXJjY0poam1HelVKZ1pVcWpFZFcxRjV6eEFxV1dPWmpVQ0Y4?=
 =?utf-8?B?V2k1K2VFUmpyVW95MjYxVkpIZGY3OURaNFZBVjlybnh5RXhLNmZIVXczOVlC?=
 =?utf-8?B?a3dLSlowMjlCUFJKVGh4VnRZU2JtQTFVY0themZra1ZpOTBJUVNsQWUwUm9V?=
 =?utf-8?B?Tit6QUUwNm16REpxWnVabk9mMXF2c3F0RXQzcU5uNS9TWlArUTRnN0xxbFR0?=
 =?utf-8?B?TGFlUmJSZFpyenhPUHkrQUl1ZTNveGFNNkMwbEE3cTU0TW1QMTNHbStENW5q?=
 =?utf-8?B?L0pYSS9iWmxLVGFVNkJRdHpjMnA5M3JzK1kxNlViN2oyS2tQUVl0cVZYelFP?=
 =?utf-8?B?Q1dyTVlBMWlGNEcyNkQzZm9LSUV3WGxac0lXYTl6LzJsQ3BkUW9CSFVBWlo2?=
 =?utf-8?B?SFBHakEwdm50UVFQcXNlZURnL2E1NFZ5OFVqWmJnZXk1emFmTk1USXZDVWNB?=
 =?utf-8?B?ZllGRS8vQ1p3ekhsaUlLb3U4OTZwbXgzNXlKWW83RnpXS2xDTWJydCtmUnZa?=
 =?utf-8?B?VkVKRmN1Q0I5Z2tQeEY4Zm1aMGlmdmdpWmsyaXBXV3RtRklGaTV5MXllbDV4?=
 =?utf-8?B?ZnBVNWRaU0l6ekhmdDBkUnA4MXlYMGx3Y3BtRm5WS2pBUWJ0VStLMEQ3cnAv?=
 =?utf-8?B?TlVsU1ZEaUEvVU41VjBROVVrWVA5VkptSFg3c1lGQXNBYTl3MXorNzRsTmY4?=
 =?utf-8?B?MHhXc1dwSEk5a2YyOTNMaFBEa1pvMDJmR05mci9MNlROcnQwTmZueHNTSStM?=
 =?utf-8?B?elpVWURiY2krYklya0lKY0lxRHl0NEtjYXNoSm9Jem80U1ZBWEFaZ2R6TXMv?=
 =?utf-8?B?dWZwUys3S2pQcXN5K1pEQlVkMFUyenppL2drMXpIalFEMEphdVBRZDJpZkND?=
 =?utf-8?B?S2dmRFlGdnFYcHA2UmZwdmJFZEYxU1BxcnlWOGRaU0JBZ0ZLNWdlanJwOXR5?=
 =?utf-8?B?NENBeWtDMXNYYVJvU0FNd0hJSU9YOHVBZVRTT1FiOXV1NUpxY2xjd0dYUExQ?=
 =?utf-8?Q?1k629nF8OKO+MVClOarbuaQWC1Z3bP7rYgr46rM3R0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c64b78-9ea6-4695-ef38-08d9b8f6afe8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 20:26:30.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Y0n0uC4YtQaLq24sQFujgeyNyUjdtOn486W55/fQ2tQA/BYUGfA+xg0JYaHdmGALzSVvnXLNxTNUQ1Um3pe/dB2SB3Jvu2atUYKIMdoK9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5571
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

06.12.2021 21:37, John Snow wrote:
> 
> 
> On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     Hi all!
> 
>     Finally, I can not stand it any longer. So, I'm happy to present
>     multiprocessing support for iotests test runner.
> 
>     testing on tmpfs:
> 
>     Before:
> 
>     time check -qcow2
>     ...
>     real    12m28.095s
>     user    9m53.398s
>     sys     2m55.548s
> 
>     After:
> 
>     time check -qcow2 -j 12
>     ...
>     real    2m12.136s
>     user    12m40.948s
>     sys     4m7.449s
> 
> 
> VERY excellent. And this will probably flush a lot more bugs loose, too. (Which I consider a good thing!)

Thanks!)

> We could look into utilizing it for 'make check', but we'll have to be prepared for a greater risk of race conditions on the CI if we do. But... it's seriously hard to argue with this kind of optimization, very well done!

I thought about this too. I think, we can at least passthrought -j flag of "make -j9 check" to ./check

I think, CIs mostly call make check without -j flag. But I always call make -j9 check. And it always upset me that all tests run in parallel except for iotests. So if it possible to detect that we are called through "make -j9 check" and use "-j 9" for iotests/check in this case, it would be good.

> 
> 
>     Hmm, seems -j 6 should be enough. I have 6 cores, 2 threads per core.
>     Anyway, that's so fast!
> 
>     Vladimir Sementsov-Ogievskiy (3):
>        iotests/testrunner.py: add doc string for run_test()
>        iotests/testrunner.py: move updating last_elapsed to run_tests
>        iotests: check: multiprocessing support
> 
>       tests/qemu-iotests/check         |  4 +-
>       tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++----
>       2 files changed, 80 insertions(+), 10 deletions(-)
> 
>     -- 
>     2.31.1
> 


-- 
Best regards,
Vladimir

