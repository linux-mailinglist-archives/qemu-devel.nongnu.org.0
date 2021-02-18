Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688331EA3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:10:08 +0100 (CET)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCj4I-0007YO-Pl
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lCj2Z-00070f-9j; Thu, 18 Feb 2021 08:08:19 -0500
Received: from mail-eopbgr40099.outbound.protection.outlook.com
 ([40.107.4.99]:11115 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lCj2W-0004Tp-1m; Thu, 18 Feb 2021 08:08:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhnsZ6rvf/IydSMkJ/5dMIs5UoYNiW8N+KT0IlvwzyQv+Hao+NwLl9qeXw++2mrNuz/4HRS0LmRCEeLGol05Aw0OeexiR2rfLjbkLr/KOyu07evpxGMyKlQavGzoA/0kAnbRIx8vqOx2N4NrsHUHLyvfbL2XCwNBYsLAMznFyN5SwKQjbOgHYGupdVSItgdmuDG0KT5PhwLd1WD4WLpSAQyvzcr9V/lqWWFfhe8OHv5UHY4ZO83W30qwekq7RVVahRmoW9vd+7NWZahwuEo9JDQmoEltvc3c4UYO6xpvanx+lD1rWDw96cJ1NCbtndlDvTnIDEVgJYzpYZYQb/WmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17VrufJyr5jMtrUXJi4GFdp9aVFiBN+PRHdMfUXc34s=;
 b=JWYxyyTSt7EDeHaEBGSEx8zJ0xUJiI8ZUB11MQx2POHx0rrnOurm6R8vJ2L7QF/wCwWxWrR6BvsPXg114TC8WR9WpVnjmCsE3189YynuDBnPsiYaOgx4lMfXKAiG1FA0K4bH2apSU1DTXpF2kPJfh6g4xL4iMWhJ7ulC2sM2aWO+7f3TgC7zmFEUPy/08s70oLo/KVXRdJNA36Drp9L8ts1YjHFzbEHBQsKBcYaAj82FUEn9BM5LFtdSEfygSprhz1sEPcIb9lY2clhu2RGuyfWEfmWVn83z+/aQMZpihiuh93w4cpcGi4IV+mbx7fiSQb+Tu/sQTq/lOqfQxbDJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17VrufJyr5jMtrUXJi4GFdp9aVFiBN+PRHdMfUXc34s=;
 b=tCfmGT0RVj/RqIOxxtF/SxdeDd5yyqQfJbOTc/S3l8h0bkI1UczIgqTHmTJx7CjB4lZGAClm3waALv5d7ZoebKusntenr2ukgJUrQn0EJGWT5+y25P2FT2uTgg14A46YV+tLgvTVCTqHwV22ta8+4tAzzKHtWsFEx52jIsHxo8o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 13:08:09 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 13:08:09 +0000
Subject: Re: [PATCH 1/5] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-2-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <b2f72c5f-d474-d99b-b90b-6fd1b32a3e82@openvz.org>
Date: Thu, 18 Feb 2021 16:08:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210216164527.37745-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0PR02CA0126.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::23) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 AM0PR02CA0126.eurprd02.prod.outlook.com (2603:10a6:20b:28c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend
 Transport; Thu, 18 Feb 2021 13:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3489ec4-1384-41a5-a075-08d8d40e3c7d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374B68CBA0984D7F8042D71B6859@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:14;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cAHZaYAZ30Cm2f2pOjo17d6QxPCXsUU9J/dKS9SDWEZ+6Z+CyX3fGuhRvvjaI/iUjaZ/X+rfrDHC7Di5Rn/bbyrO54Gj45QzuOiDsB2JjTjjJCIXdmL6Ds+WB/cfnmlygDIPIHWU72sbwtmH5T5ohIR5B9UFIxqbek5C2YgDz0HsRFfYvD83NeBErUBEWKRUmR1eKBwyC0YGuufi4UmUfQlOkNOXxThnuA8h/xBU3YZAYdkB1Mpkigvf78inZlplojDzizE5vtOfe7f1YbE7RpFo0/nTeVapdkcb/uGk80roLDH7LsN3trRVP2wEs69O0WpchZ6QItxmpbjfCZUt/Gg6zifL8A6EUv0i76AI/McK4UmB9rJG8EybIGse+625Tej2FeC2N5wRO4mvkEAyQPRRWmLFBjwQBZF1ZbE8I94xjf1qUZH/k2OliK2zRrpfd4slBw27SYDACks2eIE/mXxGMakn08j1QPe3qWR8oraUh757fFRhkg5bcN/7682fNemDme5FPKoUUTH9D0XBS++EY2kHmEiQBmm1/dMEEkQ/woAizvt5ObRbAFdL7qUYEbMrW31Wct8EhdW5Ek2Ts5wxnN/igwpmjBBUfmGB2iI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39840400004)(2906002)(6486002)(8676002)(4326008)(8936002)(31686004)(16526019)(42882007)(26005)(186003)(478600001)(16576012)(36756003)(66946007)(52116002)(2616005)(956004)(66476007)(31696002)(53546011)(83170400001)(66556008)(83380400001)(5660300002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2p6R0FCWFZtU1BadGJLN0FlRGJicGlnR3NTRG5MMXpyYjBCQlRaRTBZUTEx?=
 =?utf-8?B?Nzg5bCt5MGJVa2tQb2hXR0VoY2RLbFRlMTBtaU8yYktBWGhLUGN3dTFoMVky?=
 =?utf-8?B?M3JJaHltQXZ5Zlh4WC9uQk9SM3BBbmpIUitQd3VuRDJvSXZjMGdaLzFwbTZr?=
 =?utf-8?B?bHltTEtSRVAwMndpRk5taDZIQUhIc0xFWmVubTFETjRuUVBEdWVYemw0aW5j?=
 =?utf-8?B?Ti9XbGNCSWh2dHhFSm1La1I5WkE1QXZmSmxLTS9FQS9lbTJ2NHQ3VzNsT2NT?=
 =?utf-8?B?cGY1VUNiRVN4SUxST3ZOR2ZzQnFSTTA4enVRZ0Y1N2pjNzgyVmE2WkVzMUVm?=
 =?utf-8?B?MFltdzQvbUlLcWRVWEI5OGJ6VC8zS3locnhHRHk1MDEvZHgzTWc5alRNT1pq?=
 =?utf-8?B?WitxaEV4VlJLQXJIOHl6NFQ0NHhPWnVwcW8vcnlSaTZkOVdLSVdTdHdsV1Iv?=
 =?utf-8?B?UFJycGpmNkFQYmMxc0lDcEN4bFBDWEN1UjNtb1Z4UHY4dXFESVNHUlg1R21z?=
 =?utf-8?B?MDlZOVVlei8vZDBkU2V3TU4zamNzcUI2TUU5U3FEalk4RDZnZmlNUVhGSjZ4?=
 =?utf-8?B?cVdWQjdYWDM1SXZydlNpZnBMdlJrU1RiSS96TFVsUm50NG9jUlRTV3U5U3J6?=
 =?utf-8?B?QUZQMUtndUEwRmxOakh6VmlabmFlQVhyTStHOVBmUU9GZU4zYUEzalFqdWYy?=
 =?utf-8?B?YStHQ0hmMVoxZFFtWXJlNzRwWHo2WUJOVUFLYlYzdVhzWDJzaU1iZ1N2N2RG?=
 =?utf-8?B?MVAxRWtuQzlwd0o5alB4ZURMRjVhWTdqVmk3b1JtNU9YZ0VSc2s4MXFvTk1P?=
 =?utf-8?B?cHRDenVSU0VJeGZFWFVzQUMyV0F5NFJPeEUyVWxpYm9sMUhhZllXalRYQjl2?=
 =?utf-8?B?TStrZkVTYnE2c2huWXVrUG5CNlJWNVVXOEg0NDYwR0lZc0VMYkx4akZUc3lI?=
 =?utf-8?B?MUo1enJoaVA0b3RWSkZwbWxhOWV2ZXE4WWJkak9KZ3RSNWFNU3diaGVTenBv?=
 =?utf-8?B?VGEwaXpDYk1TRUZVK2lKMkVLeW5KRWxCMVl3WGpGQ2dTZVJsOHVITng5Mm1K?=
 =?utf-8?B?UHU4eHJWaHBJRVp1SjdjRUNNQjFnQVd2bEdPVVc3cjBoR09MZlZmTDREZitY?=
 =?utf-8?B?UUFReE5xeExXTGxzeC9kVHQ2TEZNUktyNWEzM1praFNTVXFiUnBsNVlxeHpE?=
 =?utf-8?B?NjlpZXE5bG4wKzJ0QnRCZTRxOVptSGhYSXJzWFFWWStyMHNWWm11WVYyb0Ry?=
 =?utf-8?B?b2tNWlNxV1JvMVBqMDRLRVN0dnB5WHZ5Nm45OWRjdlNSUTZ6RkVhOHJla1E3?=
 =?utf-8?B?djZKNXRjdjE5QTRsWUJWSkV4aUV6ZWdtZjlKRkxhOFhjQ1grL0IvSUhtWUNn?=
 =?utf-8?B?WW5uUExFOVl2bDdEUUNyWUdJaWdYY0tTL1pKU2RyOU9ZTzhaT1ZKeE9wZHI1?=
 =?utf-8?B?K21vR2pXSHpWWkg3TVNBd1BTUEdzMlRnT2owSnNjUUZ1VDRrZUZmZ2M5KzB5?=
 =?utf-8?B?YU55b0VFY3R5eUd1WmNTWUtxU1hDK1M1ZUZEQ3FxRG1ucGxLZ1kvT3Y0Y21E?=
 =?utf-8?B?NFZmWWVaK1FnRGw0RFp0YWUvOHlJUTF6VGdJVGNVSDI1K041djB2U0xyK3cx?=
 =?utf-8?B?cGlabmQ4VmdDcUg3dWV3eFh1VlJnaXlVT1QvRC9IOGZVcHkwV1ZDK3lvbTBK?=
 =?utf-8?B?MFpxeXZjOTUyVVNoNHhMUDZpeGI2Nmd1MlRYbktUc0RYS3E3VGdFeGFiR1VB?=
 =?utf-8?Q?s5EC+og4c1/dJeGMha3XK24ZhB/OQzERIJaKb/p?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: a3489ec4-1384-41a5-a075-08d8d40e3c7d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 13:08:09.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyUkX8XlGwt4Smym/Z3K6qGq91wHv5AQF17uerVwR5LLU1FZBeF5bYtnraFr7Hbod+rCeiqZwR6B5iU6veI56Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.4.99; envelope-from=den@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
> Rename bytes_covered_by_bitmap_cluster() to
> bdrv_dirty_bitmap_serialization_coverage() and make it public. It is
> needed as we are going to make load_bitmap_data() public in the next
> commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/dirty-bitmap.h |  2 ++
>  block/dirty-bitmap.c         | 13 +++++++++++++
>  block/qcow2-bitmap.c         | 16 ++--------------
>  3 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
> index 36e8da4fc2..f581cf9fd7 100644
> --- a/include/block/dirty-bitmap.h
> +++ b/include/block/dirty-bitmap.h
> @@ -57,6 +57,8 @@ void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
>  uint64_t bdrv_dirty_bitmap_serialization_size(const BdrvDirtyBitmap *bitmap,
>                                                uint64_t offset, uint64_t bytes);
>  uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap);
> +uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
> +        const BdrvDirtyBitmap *bitmap);
>  void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
>                                        uint8_t *buf, uint64_t offset,
>                                        uint64_t bytes);
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 9b9cd71238..a0eaa28785 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -726,6 +726,19 @@ uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap)
>      return hbitmap_serialization_align(bitmap->bitmap);
>  }
>  
> +/* Return the disk size covered by a chunk of serialized bitmap data. */
> +uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
> +                                                  const BdrvDirtyBitmap *bitmap)
> +{
> +    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
> +    uint64_t limit = granularity * (serialized_chunk_size << 3);
> +
> +    assert(QEMU_IS_ALIGNED(limit,
> +                           bdrv_dirty_bitmap_serialization_align(bitmap)));
> +    return limit;
> +}
> +
> +
>  void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
>                                        uint8_t *buf, uint64_t offset,
>                                        uint64_t bytes)
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index 5eef82fa55..42d81c44cd 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -278,18 +278,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
>      return 0;
>  }
>  
> -/* Return the disk size covered by a single qcow2 cluster of bitmap data. */
> -static uint64_t bytes_covered_by_bitmap_cluster(const BDRVQcow2State *s,
> -                                                const BdrvDirtyBitmap *bitmap)
> -{
> -    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
> -    uint64_t limit = granularity * (s->cluster_size << 3);
> -
> -    assert(QEMU_IS_ALIGNED(limit,
> -                           bdrv_dirty_bitmap_serialization_align(bitmap)));
> -    return limit;
> -}
> -
>  /* load_bitmap_data
>   * @bitmap_table entries must satisfy specification constraints.
>   * @bitmap must be cleared */
> @@ -312,7 +300,7 @@ static int load_bitmap_data(BlockDriverState *bs,
>      }
>  
>      buf = g_malloc(s->cluster_size);
> -    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
>      for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
>          uint64_t count = MIN(bm_size - offset, limit);
>          uint64_t entry = bitmap_table[i];
> @@ -1303,7 +1291,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
>      }
>  
>      buf = g_malloc(s->cluster_size);
> -    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
>      assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
>  
>      offset = 0;
Reviewed-by: Denis V. Lunev <den@openvz.org>

