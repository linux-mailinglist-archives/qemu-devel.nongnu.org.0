Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C32D2E66
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:37:30 +0100 (CET)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmf3R-0005bn-6N
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmezi-0002T2-Bp; Tue, 08 Dec 2020 10:33:41 -0500
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:59785 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmezc-00069c-DH; Tue, 08 Dec 2020 10:33:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCZkISTSStRnh8KXFcY+O+CDca8Q2v4tu6X0QET1ZcYC5A1xSefa5C5WEmeTzm3zxwR2qLu/rDvRaPK9QJjtTwXcMUcVEDh3FNNIHIp84+DKPrOAui2513ciUCNxYMz60QhKlUrx0oIrRReLwJa07XDUvofwU+bHYmrfCPKt192u9EVhmmsSbgVDh5ARfMY2fV/V8T2h88ByEezeMU9+ePWK/paO8+UmLy3n88SamisVf0ZcuiQ/hpqhgpHhOPMfca+9JS9m9YI+JCwAHsR+0mqN4y2rIKCH6lB0uOkEhOUA/XZWh0AhJecc809x+0ome5hLR2dJ4P8jzyfNmZvzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVktBGdui+3PjQEfqZMocc2SGdZRl2f/m+LEkUsP/co=;
 b=VLkTAxK0BrDl3IXvZ2rA+/beVvPSchPDh9jP8frkTaCqcSMrTONZcwZf96JsuKzGkJlQ4MFuJEiXvl5AYAwV5WZ1mX1F0IvYt22w8btxd651LZ52Zn/CB93NrmeWPkfUbKwrBcTPr46qb7LBWb6NjutZH7LXXJe9BR49q7IsbePbEwFzo7bj2jV3NbqcCJtIMa0+LiDWa/bFLuU3owLxFJzwBe9AjC9RdQjPsbFFBBsdee26gOIqtFVymy9HI4iRlzqabzBj1a+9CNwerxMYlAYJuR+bF1llJzIhQkyq33VX2R3wv4Q1YtNyfFmLcvGI68GBT59UsKOq65IOgF4/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVktBGdui+3PjQEfqZMocc2SGdZRl2f/m+LEkUsP/co=;
 b=BMfnkpCvXq+BdmySrxkcIOSAl5d5DBNzPjuv/Z0bqTg39mAW0YgQPyG+xdBfFUfZSuHGEOBKYwh4S3S7cyO/mPbZE3OKaQscw1utQpItRo0RtxF3NstV7TrMdqYn8wmMa/896WvVtb/ybVOuX4E0aZuJQ9+viugqE+NYTpp/o60=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB4269.eurprd08.prod.outlook.com (2603:10a6:803:f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 15:33:27 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 15:33:27 +0000
Subject: Re: [PATCH 3/3] block: Fix deadlock in bdrv_co_yield_to_drain()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-4-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c8856d43-a039-6bd5-a0cf-bacc26d6dd64@virtuozzo.com>
Date: Tue, 8 Dec 2020 18:33:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201203172311.68232-4-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.8 via Frontend Transport; Tue, 8 Dec 2020 15:33:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba16921b-2cc9-4f5f-3542-08d89b8e9bac
X-MS-TrafficTypeDiagnostic: VI1PR08MB4269:
X-Microsoft-Antispam-PRVS: <VI1PR08MB426918E9F55A2F77316E4AB5C1CD0@VI1PR08MB4269.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtOu5hDgaYr/Tdly8JgAyP6XUzPfejBhGeGsN6SyWNaSh6GZwC7QZUYtFtFdgyODoqOTupYk7pRm4ihoU3AVjSZ1Ivis3y4m2G9jx1CVZ/9NqWJbHyX4fKhdj2Tm8+us+wTnakVIjVmljBeVGpF424JdmKd4CUvGpX/R+PLkuVc9RG9UDRBHJfqLCZp1GcKWlb1S3TBWwQFhz37bU+lJjLXw/YGERm1TktOnfTjfGXNhkWHNjxqOr24rl//empbaKiPvsTW73Lpy8GZk5ohjTWu/pN/dH/+JBzZjhD0oay5QN1WINjbdijsgHSSbI5P87/01SNDxFdERR8jfBKQ4l95E7imbrh7BiRcs3wLTHDrqYHH3A2Z+272uxoqiSiK90Arma6ojXm10wgEb1IDM2vT79X1d/R18zXgmE5xaE2LOEi6Jb85iZEdWY8LcvHZcYBlg2DaJ4fNnQ56PrAGtEmY2V6aIv5sKDpJ14UYWwCT+Ly1V7UoWyKVKosZWHmKIWTQgjE2u3vFCTXp+dGBBfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(6486002)(8676002)(66476007)(31686004)(8936002)(36756003)(4326008)(966005)(52116002)(31696002)(16526019)(5660300002)(86362001)(956004)(83380400001)(26005)(186003)(66556008)(2616005)(34490700003)(16576012)(508600001)(2906002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?STZYMkwva05LVWtaMVlKNDQ5N2E5UXE4T24xd2tUMEhpaDdWdVdkTEZpOE5v?=
 =?utf-8?B?RHZBVG5NWTU5NVREbXFxNm5INXkwcThQTFlqV3BIRVliT1YrZjQ4NXRtbXJu?=
 =?utf-8?B?K2xCQzYwS3RESjVMb2pjTXpaY20weFhPaUVmY3EzZkxGVlpJeGp3S0kyNFU5?=
 =?utf-8?B?WmVWMG5waUZjeGYxUzl3aEF4b0tFNHlDZ2dNYlRRN0ZCWFZMUDFpRGtmUkRQ?=
 =?utf-8?B?RTlVU0VUWHgralNuWUFEMnQzVzVTRUkrTklVTDh6VW1xQ01GWkhWVSs5MVo3?=
 =?utf-8?B?N0VSWHFKcS95aTdCUWhvT3RyU1hNVzRZajNwWGRNUHlIWjFGT29VU3FFb2xl?=
 =?utf-8?B?SnJnS01kRndRMVEwRlcxYXBBbVNPUkdQbUVxeG00ZzE4SzJjcDUvckxTT2lT?=
 =?utf-8?B?VXJmS0M0RFFhT3pLamxRbnJFYzJjN1ZoSk9aK3o3UWNhaGxubHlQNGszTGpZ?=
 =?utf-8?B?M1hIV1FvdUNnSVFMeklFQkxUMHI4UFhFSDRRNUV5aXNZNlBBRlM3M0JaSy9y?=
 =?utf-8?B?OFZsdlg5aldKQ1EwRWd6aDMrelBqbU1reklzalB4OGEzajArTitUOU52L2gx?=
 =?utf-8?B?clcvSDRQTG9SeFBwZnhIT1RHRTVKUEc2cnVVaGFmSk9raEhPMTJoZ1hqQUhH?=
 =?utf-8?B?YytxTkhBVStLNWJYTENPR1JSNnNZNUw2Mk9MSzJXUXQrdHNzQ0M5eHRrcGpM?=
 =?utf-8?B?V3FRMUttdEw0eThGdVpjVTNyWnlKcEordStyWHlhSHVySldTR0hZdHVhazZN?=
 =?utf-8?B?WDdPeW1URDFmc3dUbFozbGlRR0ZwOWJYalRhWkwrYXUxbGpESkUvQWNrQ1RU?=
 =?utf-8?B?ZmsxR09JcEZaMTlFRlI2V3hUN2x2WEtsak5jZm9YcHdIWldRaEt0L0RyZnBI?=
 =?utf-8?B?SmhvRVIvVDN1dmZIRVVEYjZ3Y0w0cDcraTRQRWdJaHRKR2RtTVA5cUlPVUJn?=
 =?utf-8?B?SnROamNWeWxYY05vemNRdDdlUWIxUFNTbGoxSXQvNnFObXFSRTZnR2M3blNp?=
 =?utf-8?B?NjY5TE01cTA4NEljb2F5N0I4cm9BTTVvMForaVdXSG53aUhIa2FmdU0xZzJl?=
 =?utf-8?B?VHB0WU8raGtIZU90bHYzblAyRjdDTTZYRVVxTGE5dy9MZGRCaVdQTlJvSFov?=
 =?utf-8?B?Q2lEd1dBZWtMWUFud2M2VE85K0RibGUyWjRmMldUd1RrSDQ1Z1pOL2NLdXNl?=
 =?utf-8?B?Q0hEL09JWW5YVVVWcld4RnAyR25EK3c4bXlMVTNPMVlOSCtaMjVhNi8ydFU4?=
 =?utf-8?B?N1V5TmJ1TU1uMHRMdlJZTEdHRy9wLzNKajc2OGhtelJJV3hlSnlMbFJGSmhs?=
 =?utf-8?Q?T/weduqHXlLUqzkoo2oO078EkUHhNvgLqE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 15:33:27.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ba16921b-2cc9-4f5f-3542-08d89b8e9bac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89/fCroqHU/NpS305yfgd6L63Uqg5rOd8m/9gM+StaKZYkSIzhQhk21p04Dd7Rcp/7hEqHLRZQ6sJoeCxHDNvwvUg/RdJuvFRorcVLnNSsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4269
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

03.12.2020 20:23, Kevin Wolf wrote:
> If bdrv_co_yield_to_drain() is called for draining a block node that
> runs in a different AioContext, it keeps that AioContext locked while it
> yields and schedules a BH in the AioContext to do the actual drain.
> 
> As long as executing the BH is the very next thing the event loop of the

s/thing the event/thing in the event/

(I've reread several times to understand :)

> node's AioContext, this actually happens to work, but when it tries to
> execute something else that wants to take the AioContext lock, it will
> deadlock. (In the bug report, this other thing is a virtio-scsi device
> running virtio_scsi_data_plane_handle_cmd().)
> 
> Instead, always drop the AioContext lock across the yield and reacquire
> it only when the coroutine is reentered. The BH needs to unconditionally
> take the lock for itself now.
> 
> This fixes the 'block_resize' QMP command on a block node that runs in
> an iothread.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1903511
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

I don't feel myself good enough in aio contexts acquiring and switching, to see any side effects. At least I don't see any obvious mistakes, so my weak:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Note, I looked through the callers:

bdrv_do_drained_begin/end should be ok, as their normal usage is to start/end drained section under acquired aio context, so it seems correct to temporary release the context. Still I didn't check all drained sections in the code.

bdrv_drain_all_begin seems OK too (we just wait until everything is drained, not bad to temporary release the lock). Still I don't see any call of it from coroutine context.

-- 
Best regards,
Vladimir

