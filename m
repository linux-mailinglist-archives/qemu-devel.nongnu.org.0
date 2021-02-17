Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F7531D5CE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:43:22 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCHUX-00063R-4i
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lCHSt-0005VW-Ee; Wed, 17 Feb 2021 02:41:39 -0500
Received: from mail-eopbgr80139.outbound.protection.outlook.com
 ([40.107.8.139]:37760 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lCHSq-0003fW-BD; Wed, 17 Feb 2021 02:41:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGQ32MFIbDDtMYpcWt1lCfMtHr0VEFS+5yFvs6omO+zvycckcq/qzdgi1HnS087SWKv5DQSkqXrjLOrJFPZvimxJH1NekIecHIz3yhG1F+hY/b5Zco1Id52IsW83tq/zZKmBFsM4/LScWssZYbDeO1H05v8Ne0uJ4yn6X7VICo7LSxP8SwW1iixxQIc8ztK1sXrCiNkg4HVCYk+qvMYyZz4RE8QgIP5Dn2pA4OUqODfpLvu/V8esO4K1n+70ZZ3CIQmKmb5IAN7ZEah458wP70C8esRCDj152uIVyzLxm6AXWTAidutE95FJwWyVzKSv23eetrF5VrNuG6PMO18GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DoiddHiJPgk3f2B+54DnaVTYijZDoCPpNxNyBgi3Qg=;
 b=EeyCXBvedk74yJSqfPUcN8bnfa6rnJ+09NZ8ZXcP6FFZ26c5wNvU4nXze67AamTXj07cd8sCSnRvRwED61cZ0MujvWDBrLfM2T7Vcfex3MfChsROlBrAWCnHLFYFufSE3vWGwT8+JNl8Fq9my28+uhIvG4VG8QQUZAqr5bPw81xS6969e322+VjFCLmH6VShUR1Y69cO98uZpdYVeYx+DK47z9HLbZH4I89BcoB5RZ6uwB80c/y74OD/iJXnjr7Yb7ZuS39TTx/Fmla1e1DVkg9QtVYfgh1MUnNTl5S+GSaPFiBN210FgrjpjfTJpMbrPl8hJ+MBnNuY8Gx2yNfPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DoiddHiJPgk3f2B+54DnaVTYijZDoCPpNxNyBgi3Qg=;
 b=qRuB2kqm55cjGQz++oy7R/F4SLz6vEWbRnTF41YDRCyihRh3of7NrGqJrQaMBiC8e0rXP5/MMkwvttvVUrGIMzY0G4sd/18ZCNCwZKsFsY0rIfn1R7di8rXE+mzYin4nXb14TXU4x4G7e55wUI8MtUCi2onybSAcNBWJ/w1w+Fs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 17 Feb
 2021 07:41:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Wed, 17 Feb 2021
 07:41:29 +0000
Subject: Re: [PATCH 1/5] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-2-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19dd0e4f-c18b-16b7-4806-e404c271df22@virtuozzo.com>
Date: Wed, 17 Feb 2021 10:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210216164527.37745-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.52]
X-ClientProxiedBy: AM0PR02CA0170.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.65] (31.173.87.52) by
 AM0PR02CA0170.eurprd02.prod.outlook.com (2603:10a6:20b:28e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28 via Frontend Transport; Wed, 17 Feb 2021 07:41:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43b505a-a197-4e1b-2054-08d8d3177011
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46007F441D2075E0BCEB04DCC1869@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:43;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/q/HrgQ6oGbGX/fkg754NcXs6LV9S2mw2HONegsN2jf5rutfC1nBXY3rPQObiA8KhRxLxZ0OUHzl5KilrR+i0ThfdTwlWQIRboS1HAGuYSbEHKdRKeNv05T0jrMCeL3rcxUHsHHQeG5WFkz9hjQsOKQP2SK1jgMiyaC5CMZtyn166++Utqtkc+8d5YyaT43/oIbO6bQjZp3ml+zVBU1bB+4w+fnb6rc1rWG/q4MT9TN4k2pozZSwQnt0DGUTzndAw9Yi7hewK6nkaK9MMmNm5Ilm9/iIVaWMn2Hv6dnIGCxUtGunoHeZF3Xhgs/OC78SMg1TUUbhSn8bfYhTG1dImgQKGTlGfl/Gb4bnQTpexLrzpJYufgbOsKBohPkBdUN157JDzCuUYgGsEldayZN3BXr7jGnJVcuRcFFhOLLiggJSpEFt33S80xiWI4MJX5wTaLq0ToVbZ48Vc+sQws9Ep7T6s5CRrQsmqETI/6bYxeGwOZu8Q4SqzkWE4+iyGcx4pu4bHMIYitGze2RG3qD+xiIfhPIVuFAWBNUpwrvVX93ouN5AkPYVhjza9TuxpFitQYZWtWdOtIgZBRCyWq4uXAEatqjEyDX6YMCLCaEV+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(376002)(366004)(136003)(66946007)(16576012)(26005)(31686004)(31696002)(66476007)(8676002)(2616005)(83380400001)(4326008)(6486002)(8936002)(66556008)(6666004)(36756003)(86362001)(478600001)(6916009)(186003)(52116002)(2906002)(16526019)(5660300002)(956004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NXJHaGJuUE5DcGg2MmpBNVZ2RFBHTDUwUUNwZjMrb2pCcTFBcm41Mm1GQ2F4?=
 =?utf-8?B?SnVWL3hPS3kxMGxzUzZGekFiY2ZUdkduK0FZQUpNNVNSSE14b1dFelhaOGQw?=
 =?utf-8?B?anBzSXN2YjlGWlhDOXp6Y3JyZEhMZm42QUo1YXZ1Z3RLeTJWZkQ2K0g5NklZ?=
 =?utf-8?B?UHRXeStacGZQUU1aK1BKdWQ3YUZXOVNVQm5sRGlwc3c1YTIydHVJSjBudytH?=
 =?utf-8?B?RWh3dStWMm84V3ZEZXJZU2xDNEtTQmNpazN0MGh0eVlTTzhyMlMwRitMallI?=
 =?utf-8?B?Y09GbjN0dE1CWEhDdWFKOVFFdGxlcmhKMDF2YWthTjFxbEhzOWRVNXNRTTNq?=
 =?utf-8?B?Z1I5RzBoQ2IrVXl3c29yRUZXRjB5S1FWRU05WWFaUVlCYXJLdVZ0RnE4SStN?=
 =?utf-8?B?cndLdk1TaW9XTmRYTGtzczg2ektRcmN2M3MvcFUxT2F2ZUx2OHhpaXd6eWNG?=
 =?utf-8?B?YW9vbW51MVFlTG5ocGVlS204WDhpM3FKVlF0Y1dBR1VTTE8rRG4vd1VoT20r?=
 =?utf-8?B?OUppcTUrZzFuSkNTSnpZRmgxOWNlaFdWekExanhOV1crUU5jUW53YzRraTM0?=
 =?utf-8?B?ZGNKckk5dzlIaWpyNGFpOVdYV1VQR3BRSjdJdHJwRkZ1cll1WmxZUzQzb0hU?=
 =?utf-8?B?UW9pQUdxWkxJVnVuK3VTTmpBZ1VIL29rc2dRelMxZXRvTmpRbWJtaXlWYjJ4?=
 =?utf-8?B?MHUzMWFxSVlYQmJxNHJGU0tMeXZRNUxNOERMK3dYaHFkcGo2K253aVVvUXFr?=
 =?utf-8?B?aXpDcVhzTm1KcFBEMUk2czN6L3ZValdaNllqU1dhZlhnR2lRZHRiS08yak1s?=
 =?utf-8?B?bFZEemEvdG9ka2dTMUg5bm94d2xvRzRGNEFUaWpqcjlPbTBwR3QvOExBVGdS?=
 =?utf-8?B?Wjl4cnBUOS9UMXE1Ry9CcjVVSjBiMGlZa09TaU9MdHVUMURGeGttcXhxdk9Q?=
 =?utf-8?B?YUl1N01vbnBwWUVLVjF6VFo0ZDVNUlFaZGcxOVpEZ29GaExOZzdvYUZscWlJ?=
 =?utf-8?B?ZTBXejhKSFUzZTVBNVVYemI5ckJHNkdrcTI4VVpxVVBpclNnQVc3UDdNa0Mx?=
 =?utf-8?B?RzBpMUZZVnBYK1Q1S2tLN0lURlhlckZZeWwyRVBIMDd5bkJTY3BZK1M1VWpC?=
 =?utf-8?B?NUcya2lIZ2c3akdUYmg0U09ITjdDMUJSSSsrbFgySjFRTk41dmN0QzYxa04v?=
 =?utf-8?B?OEsyLy9OWk9mdjVFdW5ydFhZU1QrSW1DVkcxdmJ6WFN6aVlaNWVmclNOaU1K?=
 =?utf-8?B?MGkxMzhoclg4eFAyc2YvWFc2Y3ZncEN5SjlOQzlvaTBDVHJrMjlVK09zQzly?=
 =?utf-8?B?Um4xN1h4MUN5TGw0c3BvM1NBTVZTUFJTZGYrbURxSGVYTmRKVFRNbC9vaWtV?=
 =?utf-8?B?cWhpOVMrRkNPMlBBMXlGR0dzcDFzVmYvZCtjVjhXbVgwVHl3ZXFCNElzaVNk?=
 =?utf-8?B?WGlUVG9ZVndTWWZ3MHhDam82QWJncXNPUUIzckh4OTJKcUFyL0pML2wvYUcz?=
 =?utf-8?B?OTdrR0k1NjdGSlNXbWlwTDlpOUJEZXRFZ0RLdTZZcW5MT0RJK3BMZ3h4OC9I?=
 =?utf-8?B?Mmk5N0xYd1dlVjZTM1A3OHBOaFVJZlR0SlRacWEyZ21lc2taVjNSaUV0eVdR?=
 =?utf-8?B?b2dCdW01clArZVNnUkNFSi9aQU9ELzdmbDY4b3VUdFF0b1BQazV0K0FhYzVO?=
 =?utf-8?B?N1VoY05GWFJIWW93ZWpzV0RPWnlVSFRHS2ZDYjNIdHNxS0Nrb0I2TDJ5MEQr?=
 =?utf-8?Q?d6n11xb867iOibLnHd2j5yql/KM5fv9XeR0xRj0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43b505a-a197-4e1b-2054-08d8d3177011
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 07:41:29.2596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlHp8mmFhWHMOu+aIZ+zZ0LaHzyQLyhLvrbsdkcn+lw6jJ727whEjUrzrwedQbUvM6DN3lapmCXnLZzos5DIzLFy0RdyCdOce1MjhW9xFuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.8.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

16.02.2021 19:45, Vladimir Sementsov-Ogievskiy wrote:
> Rename bytes_covered_by_bitmap_cluster() to
> bdrv_dirty_bitmap_serialization_coverage() and make it public. It is
> needed as we are going to make load_bitmap_data() public in the next
> commit.

Not we are not. So the last sentence should be changed to

   It is needed as we are going to share it with bitmap loading in parallels format.

I started from sharing load_bitmap_data() function, but than dropped this idea.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h |  2 ++
>   block/dirty-bitmap.c         | 13 +++++++++++++
>   block/qcow2-bitmap.c         | 16 ++--------------
>   3 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
> index 36e8da4fc2..f581cf9fd7 100644
> --- a/include/block/dirty-bitmap.h
> +++ b/include/block/dirty-bitmap.h
> @@ -57,6 +57,8 @@ void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
>   uint64_t bdrv_dirty_bitmap_serialization_size(const BdrvDirtyBitmap *bitmap,
>                                                 uint64_t offset, uint64_t bytes);
>   uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap);
> +uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
> +        const BdrvDirtyBitmap *bitmap);
>   void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
>                                         uint8_t *buf, uint64_t offset,
>                                         uint64_t bytes);
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 9b9cd71238..a0eaa28785 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -726,6 +726,19 @@ uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap)
>       return hbitmap_serialization_align(bitmap->bitmap);
>   }
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
>   void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
>                                         uint8_t *buf, uint64_t offset,
>                                         uint64_t bytes)
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index 5eef82fa55..42d81c44cd 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -278,18 +278,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
>       return 0;
>   }
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
>   /* load_bitmap_data
>    * @bitmap_table entries must satisfy specification constraints.
>    * @bitmap must be cleared */
> @@ -312,7 +300,7 @@ static int load_bitmap_data(BlockDriverState *bs,
>       }
>   
>       buf = g_malloc(s->cluster_size);
> -    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
>       for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
>           uint64_t count = MIN(bm_size - offset, limit);
>           uint64_t entry = bitmap_table[i];
> @@ -1303,7 +1291,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
>       }
>   
>       buf = g_malloc(s->cluster_size);
> -    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
>       assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
>   
>       offset = 0;
> 


-- 
Best regards,
Vladimir

