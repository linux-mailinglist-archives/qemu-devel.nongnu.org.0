Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D344B84BA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:48:08 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGut-0003mr-PG
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:48:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKG16-0008FX-5y; Wed, 16 Feb 2022 03:50:28 -0500
Received: from [2a01:111:f400:7d00::72f] (port=65408
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKG13-0002Dg-4w; Wed, 16 Feb 2022 03:50:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsKZF7kBs9RHNbfi82Z4NoStZDGMB+teeEoKj3/ohC9Nn+8O1azvb3b1KZRt2hhMgUjsfGzsjihZUqlqCXc1bmOpHWo/L65+FcJTF860xRabZ6BZm/EdJKo3uqeUG5J8LAApRqL7lAqKgmjVoTR7+t25xyix3Xjw7YG6RCn70qucP97nIk8dyps6H3LSXKit6g0HsErAPj5Q4zsoiiEq6NxfVoXL/Q0yEcmVL25RkfKw8TLz9vqOVova7nA/1uSd3h1dCmqs+7XshTV5NPm9chvBhc/VwzZu/47G6cbOQZ1nkLyLSdwNDDE3YNwffFOW8ARFOr7buiCaGyh3sijqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlsZDULGcl40bsM1MqJOiMShxnKGSByiZVJEu0DjRbk=;
 b=KJwmj8T0zbquebz0/IRSpMaSU2w1qYPYoMJp2nBYKWNyHgXmll4Km9ECGZdoxVEmGNHWz+hfTt+lGPv85iRg0lu1SPj7l33LKWF2CIFN+TtQWrf1+hDkAMCltyh/tHNOITFw6MdN7+g2z5DQSDIfErogX4gmwrJhKvrUX8dTfoEMzP+eKfFOWME+ILpX/RcCvVvxjvs8NDpdNyL2ZWJXHTKkf047XWgIM19SgVTDCLvmgIoUjp0tttJ1k7WgWrTcOzxUPYdas4MtoJSg5GHmC04V1p46x6B3bHhzvAIZi+04rcfb7AS92soksYoTG0kD3kTk88myyMacv4z1IncRNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlsZDULGcl40bsM1MqJOiMShxnKGSByiZVJEu0DjRbk=;
 b=DvwmciEzFIfVJ7tBvgkEIEO1DrUAEO+mGOKVi46VHu2+/4lKZ2vDPpGkPo9QkZXiiSayMnc/lLj/Mv6pmvtjx9XhHuLXmVIUtzzWsVKGNaxSrlnlGE2G+CVVfbyn/c/88ZmEZUPKJjebj4H/tu1a5E6Kp0pHRXbw52b+lbVn/40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2269.eurprd08.prod.outlook.com (2603:10a6:800:9e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 08:50:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:50:19 +0000
Message-ID: <99593693-49d5-b8d2-8732-4a12a1bf5841@virtuozzo.com>
Date: Wed, 16 Feb 2022 11:50:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] block: bdrv_merge_dirty_bitmap: add return value
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-2-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220215175310.68058-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0023.eurprd03.prod.outlook.com
 (2603:10a6:206:14::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba86048b-082a-49d4-8cd0-08d9f1295c28
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2269:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2269A07F679C73B140B87FA2C1359@VI1PR0802MB2269.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqJau81Uk5wksQdlp3YebwThs5OyJN9Y7pDZ3N3/jKYXy0X/YjhAzZw1Y3njTyvd3dYdqgDZ2B4T1c/R8dOjRVkGSqPDexAnmNJAAE5ytCp/j+m0yix9MoQiFoQ4nyUo1QWigOTsTxPZKlKVo1cAUH6+Svoa48JWycFCuV81ElaGAEoUDkIe2dsa9pxKWvZVcrtbG4uJPM7hBQM2KGApBUAdbupph5Zz6JUrBOsduuTLniAI8SamCbOLLG5bswqmK7V3PvBDy0yyupYZ4pZqMU/l+0yZ4aIt7JB3vEMMiy+F62eJYsjj2kikgE0NlC+/kjOS9l5D5FrgjfJjbd5F1E5wtvmlZ0u6gqiS3kvnq4++N3oZ5f0BNy9TYb55/N4uGnUxWDYoyyRpueQ4v4V/mRIJvZjY5ZGkTVkl3PMsk+6K6fGeHoJsRft/UuCN3H/l3EM9/ccf3nQlMSe0x5DQtZKFN6Cb1tegssCtTl66uTvEf7XIoY919Rz0xfJvnd6mOGmgid+/txd95p3Zw/NGK30ljtJWIUbOH/mFmvP1XP/Wxsugq+nWnvW5emuN2M15uu/p04GTJM80dZYDDni2N0UkdfIC//7UcyetV8f86b8FIL2pevnY+ooz1LiObIYZvFf8x2bJiEQXemtEvZJ3ojlfEooVPTVxLlFvKvjpkLlRojeGnbVHDVf/KikDfUpjTWIv4yJ1s8mEgROT8e63Tx8KyGfWE2xpVnv6LiEOM02J2356i10d0v5XXWoZgmG8xtSAnt8aUOEq7r4e/SaTkSLIOpCFDfwXEWBEKUM9cz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(2616005)(38100700002)(38350700002)(2906002)(508600001)(8676002)(66556008)(66946007)(31686004)(86362001)(31696002)(52116002)(36756003)(8936002)(83380400001)(186003)(5660300002)(316002)(6666004)(26005)(6916009)(6486002)(4326008)(6506007)(6512007)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXoralJHNy9RSGVJRTlWSzEyOTRadDNCSUxwNEVJRG8rTXJyTHYvT2V4Wml2?=
 =?utf-8?B?TkI5czYxU1ROYXJWYVA4OFM5UXBMZHRuWVc5TDgvWmRzSy9Fdmw0SkdGNTlq?=
 =?utf-8?B?Z1RjMUZhUnFONENlRVEyY05QMHlwQWFMelNNY1dISk1SYnoxUk9hRnFqbkFk?=
 =?utf-8?B?TGk5bm9rWEpEeVpxOXFNeE5jc0FUNitqckhPMFFjekNucUg3aHZ4dFl1VjZX?=
 =?utf-8?B?dVdrM01EdXN0bHZWUVVnbXQ0cDdxZHJvU0J1aUtHelB2MHlXeEN6ZnhKdFpE?=
 =?utf-8?B?dmdrY0F2WDQvTG9PZFZOc2prRDROMjIxQlJmeDZXcEs1b0NxTnNjMisySmNx?=
 =?utf-8?B?S0l2SEVWWGdpOEhLdlB5M3F4WDMzLzhMZmtRWGtoMzl1TEVidk9uSmxSc05R?=
 =?utf-8?B?R09meXVBUDJCZGsyc0hhYkFZK3JEbllXUlZEQ0xHNkVjdEJ0YmJma3ZpT3Bo?=
 =?utf-8?B?VEUwMXBsQ3lBNE1vQ3hlc0gzdnJXYnBHQ0hKdzVUUjVmcW44VU9US3Q2UDU0?=
 =?utf-8?B?ZU4rSGd0WjZzc2poM2FwZ2FqY20zVTB6SEZjZHVmdDFIOU4xMDVBbkwzTGZS?=
 =?utf-8?B?YnFTdUd1ZDNJK1NIM3hpWkM0ZWtnUDNyZXdiMHZYMytkbUZHZXdGczQvRVVR?=
 =?utf-8?B?bnd3QkpmZjJkeTBveXZBdWV1TzBmaWNWQTdKdE1PUXNiRjVrOTFTbWJ1NC9V?=
 =?utf-8?B?VitLa3g2aFZYKzAwV0lCUmJrNCsxcWlFbWhBcGNIWXQ2NnFmNVV4U05lblpJ?=
 =?utf-8?B?ZTcycVZ0Z1psVFFEUzNKS0Z0R0ZRdDd2Nm1lYUVqSFJzTVpwKytVQzVwSHFh?=
 =?utf-8?B?NTYwdXh3dFZ0eTVuZjkwRkZ6U2txeWFSK3dZVmxFUnRJOVlqR1FMdko3UnVF?=
 =?utf-8?B?eUlPSGJWRWh6ck51MHFSMmdocHo0aHNUK09zNFVuSjdmYmRaeDNERHNoNm1z?=
 =?utf-8?B?VHB4ZUE3ai91NGZqUk1lOVpUVzgxLy85ZHhEUnQxR2g0a0h3Vm8zam5hTWZG?=
 =?utf-8?B?ekJLaXVpeFFWWW5CQ1ZQU0hSckJ5U1pLSThHS25CaUJlNHFsdHA1d1VjdGR2?=
 =?utf-8?B?MDFOa3JySlZsbXo2L2Y2VkZQb1U4V1FPcFlOdlVvOW9nWWV2SHROVzdHY2dP?=
 =?utf-8?B?Tno2bXpIMk9ncmVvWFRydXArcTZMd3E3Q2xEQWI4bmRreEpFWElURDVSanRE?=
 =?utf-8?B?VWZRZXZxekxTVFAwZjduOG9uUHF0TGRtWmQvVXdYcDJtYjdMS1JNL1NyWDhL?=
 =?utf-8?B?RmJxVXhhSGpSMzVSaFo0RUZQcEVwS2Q5eVNpSytWQU1kaEpPVFpGTjJaYW5x?=
 =?utf-8?B?eGJIMjV4elEweGNvczVEdzV3OGs5Qlczanc4YnRZbXhRM01vMjFmRVZjUUsy?=
 =?utf-8?B?V3BjQlpqU0U4VGVyVUdXK2NZZ21UcnpMUDBiTTh0UitvSEtXNDkvYWF1MER4?=
 =?utf-8?B?SThRMzUwZlVBaFJHbk0wOThoamRadDRtV1JMZ1dOVlhpcm1mME5ZczRtb1pM?=
 =?utf-8?B?ZVA4c2tTaklwdnhIWVljWVpZY0JTMFo3YnJvOTYzUXNqVmNRV3NxV3dadzND?=
 =?utf-8?B?Z2l1TXJKVlFQWTNsVjFtelpDMjJlYmcvL1BucGxqS3c4bXphMGMxa0pPNGd6?=
 =?utf-8?B?djZxbXBlWlQvcjJ5L0diUnpwOVpJdWhjWFZidTEzc2FNNE91SUhLNHh3WGlo?=
 =?utf-8?B?TzJvU0ZnejNESXpmNktlMTB1Y253YUhldDNLVEN0UVlQbEFza0daS2pQU1hT?=
 =?utf-8?B?cU9CaisyRVU0aTFhTUZRbGFrN0E4dmpxWmZXd1dpbnBhNEtTRlJIOXZqZ0hI?=
 =?utf-8?B?ZlhRUTdMQ3NqMEhjM1d6L3hZMHpDSVB2ZjZPbEs1Qm1JMWtrK1Q4aTcrdU4v?=
 =?utf-8?B?eklqaG0xQ1ZpTS9LWkRZcFcxeUVhU0NWdDBkNHVZMnNhUE9lM1lZZDRob2w5?=
 =?utf-8?B?Y3FOM1VLOWRkQkF6RjFNaklLZ0lzWnRObTl4SEdzRUd4b0ZuNUlSdXNTUCtw?=
 =?utf-8?B?NGpFNFBGeUw1V3l2YlZSQ2tlMm1ueVhFUmRHOG5CaWJsak1nV1JrYzNUMFkx?=
 =?utf-8?B?cXdpeTk4b2RxK3Z2dTdqdmZETmdlRFI3TVh5bHhNU2FWcGgwUHBmRGJvaGYw?=
 =?utf-8?B?emhtbm5PYTJtVWFqK0VGMlNqZXIzanZnd09HTHdnTWdZQnMzS3FmMkd3bzFR?=
 =?utf-8?B?MG9TOWtTdU5EWnBpOHpsQUVhcWJTZXFaL1Zxb2lRTnA3bUVxZmpQWDFkNGha?=
 =?utf-8?Q?g/18BymAm/MSjhSiKSS9cEuN21XE5bqaPYYaAOFawM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba86048b-082a-49d4-8cd0-08d9f1295c28
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:50:19.3781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxC6B5pL/paiDYoSHi57OLovA+4ga6MfM0BbuuQvaz6FfUa1iak89oI2lBRGcy82Et9lXXtydf7PjdONLBpmB1Bjfz6gvGsfNpGgwiBU3Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2269
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I forget that I already sent it in other series: [PATCH v3 02/19] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value

"[PATCH v3 02/19] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value" is a bit better as it adds a comment. And has Hanna's r-b

15.02.2022 20:53, Vladimir Sementsov-Ogievskiy wrote:
> Add return value to bdrv_merge_dirty_bitmap() and use it to reduce
> error propagation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h    | 2 +-
>   block/dirty-bitmap.c            | 6 ++++--
>   block/monitor/bitmap-qmp-cmds.c | 5 +----
>   3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
> index 40950ae3d5..f95d350b70 100644
> --- a/include/block/dirty-bitmap.h
> +++ b/include/block/dirty-bitmap.h
> @@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
>                                          bool persistent);
>   void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
>   void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
> -void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
> +bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>                                HBitmap **backup, Error **errp);
>   void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
>   bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 0ef46163e3..d16b96ee62 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -881,10 +881,10 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
>    *
>    * @backup: If provided, make a copy of dest here prior to merge.
>    */
> -void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
> +bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>                                HBitmap **backup, Error **errp)
>   {
> -    bool ret;
> +    bool ret = false;
>   
>       bdrv_dirty_bitmaps_lock(dest->bs);
>       if (src->bs != dest->bs) {
> @@ -912,6 +912,8 @@ out:
>       if (src->bs != dest->bs) {
>           bdrv_dirty_bitmaps_unlock(src->bs);
>       }
> +
> +    return ret;
>   }
>   
>   /**
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index 9f11deec64..83970b22fa 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>       BlockDriverState *bs;
>       BdrvDirtyBitmap *dst, *src, *anon;
>       BlockDirtyBitmapMergeSourceList *lst;
> -    Error *local_err = NULL;
>   
>       dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
>       if (!dst) {
> @@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>               abort();
>           }
>   
> -        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
>               dst = NULL;
>               goto out;
>           }
> 


-- 
Best regards,
Vladimir

