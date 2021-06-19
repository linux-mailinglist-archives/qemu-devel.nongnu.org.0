Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EC3AD960
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:22:10 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luY76-0000hJ-Vl
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luY6B-0008Qq-Tm; Sat, 19 Jun 2021 06:21:11 -0400
Received: from mail-eopbgr40091.outbound.protection.outlook.com
 ([40.107.4.91]:58409 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luY63-00036h-3a; Sat, 19 Jun 2021 06:21:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK3ZbPB5Gb9ZflTXjWQDUt2ohI/MwtepLbHB4dPk30XuNP/dFB0F9UmK2V7/WDRslyY4S7M00BP8Uu8+l8GGJWNsA6cJWyDe5h2EHEJ6x2hsU4bnZqsomCE+8GflAAo0qr/mGM8tXSaTCtjPtkefjtQhXkaK9qntgewoW6IVuqKXekfDR4JzkpeQzd5gN71M46K+G3nGZQU4JWHVLk9O4ZoPg4YklyKAHFsqqErFMIO336oB2QmGY+AngehtWm7BisxoeQrngCzWLLi92+TQfudUdOdw7cLj0+txGAQHRmRf4GxtFx5Tf5+MCtqcJ4Z+r9aEju5iutByW1BUUcMoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yhiCXOyAOGtSvdfPSH6zd4uWfay6G0ufJ/B+LelHq8=;
 b=cnfrhyUHrP0QUxyjfwotKEwt7ee6SkfM4xlhiIAUpXpyj/MHLdk0d447yChIEc0PEjF/oNtzVf12Xr3G2apMYosXa52DwTeiD22Ncap2DPHaedAMhhrVDjPLV7LfUhE2i/eDweqCOrFgHgbvWN3z2nOGUfQtIe8RWj6paG0RGsWktNxgCZsPrDINvVm+0a14RioC0vgGTrptcbMqHOIlx1qhxyyMp6m94jP+mJzKvqBwCQ75+8/kuFemlFuDvb31V2QUKOhlAGrsuR1/cfU5ONSoz/nk6JsiX0B9srX+cZn4+vMH/cjLC1zigG8Wei/UmIQvxzKEni4MmFHHlj51ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yhiCXOyAOGtSvdfPSH6zd4uWfay6G0ufJ/B+LelHq8=;
 b=f3hbLMLbIXFvvL8WuioUfq89PUrawZ6kBxpiZrMpmJdCSQgPLMD2wBbBeDrXgr3Uza88WSS1PIHGurdbkhkBZGgCuJmbr8jDaNRRcR2BhHGObiBLTXfeR7W/YZQkLXNnvRQkfBldd45qlSCMIlLCTi3P5v1u0Tc3gSdLn7GIegE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Sat, 19 Jun
 2021 10:20:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 10:20:59 +0000
Subject: Re: [PATCH 2/6] block: block-status cache for data regions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <65bd55fc-00ab-e254-e6ab-ad1b283f8702@virtuozzo.com>
Date: Sat, 19 Jun 2021 13:20:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0370.eurprd05.prod.outlook.com
 (2603:10a6:7:94::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0370.eurprd05.prod.outlook.com (2603:10a6:7:94::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Sat, 19 Jun 2021 10:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc5ef45c-da7a-4155-1119-08d9330beeca
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1905:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19056AC18D87D85014C36009C10C9@AM5PR0801MB1905.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfrSeCtoBRUgXfKpylnLalW5FSvTM28VroqcwtMZdFy94Fh3ztN3l5U38wi4z4wWiac5pv9IP+kfmoshzNpVDuDizfLg8WWZR2+0dXy9uDY+8iKSBCWji0PJoSfwNPZ5qPVq6Ozpf6NrWRgC6DYvIvrVUbsf5aXsQMWX6v+TN9kabE39PEmGTU3KdOyEEN+iW4ui70CZ0ZR3nkBh1/WrfJs9P+uOuKRmR46TFhVx2bUtD+QsFqkTuq3hCz8PnKBqG8wxKAJXA4QzWXA0vL/72B3UtNK3M2ZrQlidQU4Pkr02vJFxJnp8BA8ZOWOnvNUyMJ0UfgMOazf5NQJbNqfiCSS0ryGhGAgGsdtbfzAN1rqOhFIahu0Oziq8r715Ff8tZkVzsGHxwKmP5Rn44CoJLM+kBDYy3BugH/VuWQZ65ZfDI64HIrgpHDFqW0GDPnXUi4zvG0b/gbc8nYRFbUg5XBA8RBa3DVhq+nGjt+zuygMDCkkbmDb/m8K+82yiVlUbzr7GvUQg3skTJmHFbbs/VEbK4gOKOVmC9Bk5gp7QdulKNpz4yrVB/WTe0MyRX1SmtVKXmnpaSsfh67mVbHsMPI/0YQXcgxdPPp3a+1/N63E0dGmohV9LMYHHJdfw8S8dxmtm0vuVnjCezEO9NmeXuHJsTtHoss8stU+g3Go0VD0j4+OUSYbgzZXA6fk3j0h36rDmnf6r5ocnQFW6elAx2yG0+Dq4cMOkTnUnSD9ut27lxcBWgL+qPJPK0asFF2TlruccjLi4ei2LvC9rxsFvwxpvCDAetnVtkGwt9o4vb495K+Pb6vYDL55V9FA0gISiFioIhawL2bEQSbAGeQVqLJoIJmoBPPxxuFytrRtW5dti8ElNS0pDWsSReBvkLIhp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39840400004)(376002)(366004)(66946007)(8936002)(38100700002)(66476007)(86362001)(66556008)(966005)(38350700002)(26005)(8676002)(52116002)(16576012)(2616005)(31686004)(316002)(83380400001)(4326008)(31696002)(186003)(478600001)(956004)(2906002)(36756003)(16526019)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzFoamxqdlphdWpSQ1JpWFZyN2I0SHROWHg5R1M5N1NSdnJnKzNnUDYxYXF3?=
 =?utf-8?B?MDRCRld2QitpSGtHTnMrODdpZFlhbkExVEhiOW5JZCtxLzZJSUFHUDVoMU8z?=
 =?utf-8?B?RWRoclB5czMrVlp5VzVXRVFabXQ3T3hkeWZLcjVtZmxIdy9oL2NSWGhxc1ZL?=
 =?utf-8?B?aVY4RWtNaFdUWkc3WUtyV2hzN3p1SHBrQTdUWVhoZ0dDdC9nb2tXU0FpaDVz?=
 =?utf-8?B?cUhHYmtYZzN5d3c3RzlVZmlCaEZnY1B2VVFuZ3E2b2t1RERLejd0SjJYYVlY?=
 =?utf-8?B?aXVHdmRMM0k5QlZoWnlxdk94NVBrcDg2bUVFZ015MlptbE9ReUpxdHhsTTBx?=
 =?utf-8?B?WVIwNk9DNXpoZVZVWnRwMXVXMGwvN0Z1Q3lGNGwvZzhiY2tIU3B6M000VDlE?=
 =?utf-8?B?V1k0bGxoZWd2aXhUQ0JjZk5GQkhlU05ZeGFHSFN6SnFPWkwwUXlvQlRabjE1?=
 =?utf-8?B?c2RjV2pBek5UZE9lZkJpM1pXUGNzYzd5VFc0SHZnME1QUnVmSFQ3bWw3dXlC?=
 =?utf-8?B?a3BCVWhUb1hEYVdCa3lYKzUxQkROeEZHVE9mZzFqL2NSNkdTWmVJTmVpeXRW?=
 =?utf-8?B?Yk8xMzBGTG9Jd3A3czR4ZlpJb2RvU3IwelllMC9UdDBUdW1uRitjcFM1RC9G?=
 =?utf-8?B?cDlCTnVmdUFYdExLVDMycithd01WRHgzTitIVG5QY2gzRzlqL0VHazZpRjU4?=
 =?utf-8?B?YWJ0elBxNTRnUFhsSm9RQzNYVmg2dURoU3czM0tSWjVzOU9TRjlaZmY1Wlpu?=
 =?utf-8?B?OVJ5QzlHaXdlWGo2SHpXbmlRbjdvWFpQQ3RMMU9ESVhoOUJmZGRXTWozTGdQ?=
 =?utf-8?B?V0Z4VG9LVmdEY0oxcHhIL2phSW5GUmFIT3JqQXkzMU1JcHJvL2dGQWV5MS9C?=
 =?utf-8?B?RGlYdFVrYlFrWW9zZFpSQnJKWkluTmVwVVlvR1JXS3JDczhjOHZ3bVlZWkpC?=
 =?utf-8?B?YVgyS25RMGpuSEdHWjB0eU8rUTR1QzlKNXZkWTc1N0Naa21qb0UvY0huSDlN?=
 =?utf-8?B?TTF2QnFGVHk1TDh6cGIvSTZoeTNGMk1CL2VlQ2Zyc0MrMjVZMVU0WDgwM0NB?=
 =?utf-8?B?UnNxb0FvekZobWxDRmFnV3JwY09jczRscGpHVDdWeXdsVC9hT0hsK3JjSVUw?=
 =?utf-8?B?T3A3ZnFOTjRJRWgzQWkvTUsyRGNUbkNGdStvU2VCQlNkcWF6N0Y0NWZlaEEw?=
 =?utf-8?B?WGVDQlpkdXc2UktiTEtmSnozRFFzaFE5NzVpNVRWa25TSU1jeDMzQW1ROE80?=
 =?utf-8?B?Q3hXTmRBZWRNclhsd1k0L1Z2UXhLSFRpSkpWc21nYmFsdjRWbTUyMVcrbENG?=
 =?utf-8?B?UjNGRDBqcXQ1K240QzVVSktNN0NSc08yUDNybHl2czR6VDZ5SjJES1lvVmtI?=
 =?utf-8?B?SURaS25mYVVoTmpWeFJCbWxGaG5ESEJrR0xrbkkwWmhER0FLZTdKWGpZRzVO?=
 =?utf-8?B?dGxFRmhRVnRZY2hyQ0JKUFAwM2dETWZrSGNMb3QzRmpkQ3VpSHdXMEdlNlIv?=
 =?utf-8?B?YTZDVFZNR1MwZC9PSTQ4WmxFcWNyRVBqQkk1VEpxNnJtSUpJR040MFRaZkVL?=
 =?utf-8?B?VG81OTVYckJtK21uNEtxZkl0VStFcUs5cGhaajRTcjNFYzRteGV1OXBrZGNM?=
 =?utf-8?B?V3BvVW5tY0l1UEw5RWo1Qzh5bnZvS2t5bUlHb29EdnV3em14UXU1S29pRndq?=
 =?utf-8?B?WXpzT1kzajJZOUwxUEVkWWpNUm5OSkFQS3ptaHBiRXVGUktESlVqYmE4OGw2?=
 =?utf-8?Q?uPqKqVKn2asFaExKB1UCOkr7sfebzdde9OzhKhV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5ef45c-da7a-4155-1119-08d9330beeca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 10:20:59.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4ovXyAdHel/eVn0pCUI1hOTFrbmz0maewEdHpE5fmuqr4LrOHPmTWZ4uPt9UW4crJSvET0Nvmn8yL4uUv4qC1D2kvJ0HfaTexq4wHkUQ1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Received-SPF: pass client-ip=40.107.4.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

17.06.2021 18:52, Max Reitz wrote:
> As we have attempted before
> (https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
> "file-posix: Cache lseek result for data regions";
> https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
> "file-posix: Cache next hole"), this patch seeks to reduce the number of
> SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
> main difference is that this time it is implemented as part of the
> general block layer code.
> 
> The problem we face is that on some filesystems or in some
> circumstances, SEEK_DATA/HOLE is unreasonably slow.  Given the
> implementation is outside of qemu, there is little we can do about its
> performance.
> 
> We have already introduced the want_zero parameter to
> bdrv_co_block_status() to reduce the number of SEEK_DATA/HOLE calls
> unless we really want zero information; but sometimes we do want that
> information, because for files that consist largely of zero areas,
> special-casing those areas can give large performance boosts.  So the
> real problem is with files that consist largely of data, so that
> inquiring the block status does not gain us much performance, but where
> such an inquiry itself takes a lot of time.
> 
> To address this, we want to cache data regions.  Most of the time, when
> bad performance is reported, it is in places where the image is iterated
> over from start to end (qemu-img convert or the mirror job), so a simple
> yet effective solution is to cache only the current data region.
> 
> (Note that only caching data regions but not zero regions means that
> returning false information from the cache is not catastrophic: Treating
> zeroes as data is fine.  While we try to invalidate the cache on zero
> writes and discards, such incongruences may still occur when there are
> other processes writing to the image.)
> 
> We only use the cache for nodes without children (i.e. protocol nodes),
> because that is where the problem is: Drivers that rely on block-status
> implementations outside of qemu (e.g. SEEK_DATA/HOLE).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   include/block/block_int.h | 19 ++++++++++
>   block.c                   |  2 +
>   block/io.c                | 80 +++++++++++++++++++++++++++++++++++++--
>   3 files changed, 98 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index a8f9598102..c09512556a 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -832,6 +832,23 @@ struct BdrvChild {
>       QLIST_ENTRY(BdrvChild) next_parent;
>   };
>   
> +/*
> + * Allows bdrv_co_block_status() to cache one data region for a
> + * protocol node.
> + *
> + * @lock: Lock for accessing this object's fields
> + * @valid: Whether the cache is valid
> + * @data_start: Offset where we know (or strongly assume) is data
> + * @data_end: Offset where the data region ends (which is not necessarily
> + *            the start of a zeroed region)
> + */
> +typedef struct BdrvBlockStatusCache {
> +    CoMutex lock;
> +    bool valid;
> +    int64_t data_start;
> +    int64_t data_end;
> +} BdrvBlockStatusCache;
> +
>   struct BlockDriverState {
>       /* Protected by big QEMU lock or read-only after opening.  No special
>        * locking needed during I/O...
> @@ -997,6 +1014,8 @@ struct BlockDriverState {
>   
>       /* BdrvChild links to this node may never be frozen */
>       bool never_freeze;
> +
> +    BdrvBlockStatusCache block_status_cache;
>   };
>   
>   struct BlockBackendRootState {
> diff --git a/block.c b/block.c
> index 3f456892d0..bad64d5c4f 100644
> --- a/block.c
> +++ b/block.c
> @@ -398,6 +398,8 @@ BlockDriverState *bdrv_new(void)
>   
>       qemu_co_queue_init(&bs->flush_queue);
>   
> +    qemu_co_mutex_init(&bs->block_status_cache.lock);
> +
>       for (i = 0; i < bdrv_drain_all_count; i++) {
>           bdrv_drained_begin(bs);
>       }
> diff --git a/block/io.c b/block/io.c
> index 323854d063..320638cc48 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -35,6 +35,7 @@
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/range.h"
>   #include "sysemu/replay.h"
>   
>   /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
> @@ -1862,6 +1863,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>       bool need_flush = false;
>       int head = 0;
>       int tail = 0;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>   
>       int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
>       int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
> @@ -1878,6 +1880,16 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>           return -ENOTSUP;
>       }
>   
> +    /* Invalidate the cached block-status data range if this write overlaps */
> +    qemu_co_mutex_lock(&bsc->lock);
> +    if (bsc->valid &&
> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start))
> +    {
> +        bsc->valid = false;
> +    }
> +    qemu_co_mutex_unlock(&bsc->lock);

I think this fragment used twice worth small function, like

block_status_cache_discard_region().

That would be clean and avoids duplication..

> +
>       assert(alignment % bs->bl.request_alignment == 0);
>       head = offset % alignment;
>       tail = (offset + bytes) % alignment;
> @@ -2394,6 +2406,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
>       int64_t aligned_offset, aligned_bytes;
>       uint32_t align;
>       bool has_filtered_child;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>   
>       assert(pnum);
>       *pnum = 0;
> @@ -2442,9 +2455,59 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
>       aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
>   
>       if (bs->drv->bdrv_co_block_status) {
> -        ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> -                                            aligned_bytes, pnum, &local_map,
> -                                            &local_file);
> +        bool from_cache = false;
> +
> +        /*
> +         * Use the block-status cache only for protocol nodes: Format
> +         * drivers are generally quick to inquire the status, but protocol
> +         * drivers often need to get information from outside of qemu, so
> +         * we do not have control over the actual implementation.  There
> +         * have been cases where inquiring the status took an unreasonably
> +         * long time, and we can do nothing in qemu to fix it.
> +         * This is especially problematic for images with large data areas,
> +         * because finding the few holes in them and giving them special
> +         * treatment does not gain much performance.  Therefore, we try to
> +         * cache the last-identified data region.
> +         *
> +         * Second, limiting ourselves to protocol nodes allows us to assume
> +         * the block status for data regions to be DATA | OFFSET_VALID, and
> +         * that the host offset is the same as the guest offset.
> +         *
> +         * Note that it is possible that external writers zero parts of
> +         * the cached regions without the cache being invalidated, and so
> +         * we may report zeroes as data.  This is not catastrophic,
> +         * however, because reporting zeroes as data is fine.
> +         */
> +        if (QLIST_EMPTY(&bs->children)) {
> +            qemu_co_mutex_lock(&bsc->lock);
> +            if (bsc->valid &&
> +                aligned_offset >= bsc->data_start &&
> +                aligned_offset < bsc->data_end)
> +            {
> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +                local_file = bs;
> +                local_map = aligned_offset;
> +
> +                *pnum = bsc->data_end - aligned_offset;
> +
> +                from_cache = true;
> +            }
> +            qemu_co_mutex_unlock(&bsc->lock);
> +        }
> +
> +        if (!from_cache) {
> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> +                                                aligned_bytes, pnum, &local_map,
> +                                                &local_file);
> +
> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID)) {

You do cache the data for any driver that returns DATA | OFFSET_VALID. But it's unused for format drivers (which may return OFFSET_VALID of course).

I think, here should be

if ((ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID)) && QLIST_EMPTY(&bs->children)) {

> +                qemu_co_mutex_lock(&bsc->lock);
> +                bsc->data_start = aligned_offset;
> +                bsc->data_end = aligned_offset + *pnum;
> +                bsc->valid = true;
> +                qemu_co_mutex_unlock(&bsc->lock);
> +            }
> +        }


Hmm, also, new additions may worth a separate small functions too, so that new object gets a clean API:

bsc_discard()
bsc_get()
bsc_set()

or something like this. I don't insist.

>       } else {
>           /* Default code for filters */
>   
> @@ -2974,6 +3037,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>       int max_pdiscard, ret;
>       int head, tail, align;
>       BlockDriverState *bs = child->bs;
> +    BdrvBlockStatusCache *bsc = &bs->block_status_cache;
>   
>       if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
>           return -ENOMEDIUM;
> @@ -2997,6 +3061,16 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>           return 0;
>       }
>   
> +    /* Invalidate the cached block-status data range if this discard overlaps */
> +    qemu_co_mutex_lock(&bsc->lock);
> +    if (bsc->valid &&
> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start))
> +    {
> +        bsc->valid = false;
> +    }
> +    qemu_co_mutex_unlock(&bsc->lock);
> +
>       /* Discard is advisory, but some devices track and coalesce
>        * unaligned requests, so we must pass everything down rather than
>        * round here.  Still, most devices will just silently ignore
> 

Overall, seems good to me.

-- 
Best regards,
Vladimir

