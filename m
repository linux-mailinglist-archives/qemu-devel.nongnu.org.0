Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86543B2C1E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:07:24 +0200 (CEST)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMGZ-0003Sr-EK
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMEr-0002ZB-Os; Thu, 24 Jun 2021 06:05:37 -0400
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110]:34689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMEj-0003IQ-8G; Thu, 24 Jun 2021 06:05:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtZG4dW2MS56w/uRK61keJQcV0WWFHS1ElJ5+zkTOUazoqojmpvrWwTbmdfYLMpa58XFo3zau47iFrpw5zp2Zf7hogLwviVRuSVVuQx+yGw0Q7sl/VHM+52wfjSopx9gknK0HolUd1Tt5xnSx7kyUMPyI5WeDoaOjVqIgtMqKUGW9TL22Y8eRWzPVIGgX+9FegIeEeolrUuY7ZipCmHVTijpcw8gCIzcY3qqMPd/2swm5Pq3Zjrlp7G9lrjaTE1iAasJjhfYy7UVfhYFdZNx/Hn0FkMLTPMZSubiyuUorzCXPs1a6WKlmpgKpsVY3ppcaC2w5xE712cacvNyFmZHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u52htEfhjxW2/a53bfUlrrY6zz4XqB2TG7OkVL/kcyk=;
 b=W0d6kCLKjOqgPEialqIE7jKa2PsJ/TXhjCfUjP6pSz1hKX5UDxqkV2irG9Xeh8S7vqKSPD1dLSuI+iKhShHfu6YYvMn4QKuUKFwRkA27XXC5TgmB33KNti90/LFNyfq5VwEf7Xqmc6DETnqxhH9+gbGTJ1DYThNr7QBSiMUB4GiUVYS89VF64KYEkowwnR0WEPxVuymMr6NykPY7WCnWoRc8UFNJTj4KJBVW8gU3dGcnm1SWKz6M2GrP0YRvuULeW0HkvPuQZHpSVywWPSacpdSi5EW7X9/Ymc9lobso6/CD7GnJlchT1Tl/4xghY+N1cLD3YcGFz0AJrY+iHSomJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u52htEfhjxW2/a53bfUlrrY6zz4XqB2TG7OkVL/kcyk=;
 b=RZXp/gyJdTBbkYRCd+8lJKCooIN2t2L4yhhghkhVpEa4FLPKY74OeaRu6uYJ9w/CEAuH02EcWu2n3dibM7n+lfIy21yK+gqLXC0p/TagQu6C/Suu8tGfaqri3oF1J+FKPmguQVztj2z2Nj2ABlc03JJiRwrsn7OTjwy+dB4+Seo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3445.eurprd08.prod.outlook.com (2603:10a6:20b:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 10:05:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 10:05:25 +0000
Subject: Re: [PATCH v2 2/6] block: block-status cache for data regions
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6796cd47-6a05-69e3-fa75-1fb25d7a6931@virtuozzo.com>
Date: Thu, 24 Jun 2021 13:05:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210623150143.188184-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 24 Jun 2021 10:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdbb1c8-6473-4b5a-2663-08d936f795e1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3445:
X-Microsoft-Antispam-PRVS: <AM6PR08MB344522A22943B1DA1385E757C1079@AM6PR08MB3445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjicu8L/5nvKOWUUj+fU9ah5oiVrk3XvDRlVNDZaRj4lgDpt0t10Hg7PL8F1qOuHHDozCVQLWEE8pd5pw8GFMnqzCflI5BxHswAcFXTXAdlqoZoGGgLjgF63k1cL6DE165Vh2547rz03ryKF++Lnv72KSCQLFzuF5PSk49gt2NzLyV8FkTMoAt7f1dFt1ziVsVJk0ukpD3QShmmKKCo6PpbJiyEMJs9qLo9n8NgpJG5/upOPoptWp6/igOF0sShzYoCS74s/tX4ouB1Cq1sjuBgWpue6KdCUCm8KMyTZ3LvtCBDDqH3kPbHMN2BwqipRzypqo7dBbtx0vnW8NteANLnlOJgna1Yr3qB3KMghiQX0lOFdt9UPFjzwuSjJs8IFLC2YU5IdTJHe1cW9V+EYrzASLTfhcUnHMAm5x3e38Veb1bemcljifctoxz8X4HRYi09NWHljDDV3z0onPEHsI82F6lXW1WwCjMfSyNaWg11Aw0880MnBjvP8gtOQDmTY5yUf7AjpWsKDPYhtYPuSfvEB0jPULX+VB0tkm6Tt/YS0rOt0kOXug85bHvV900yQYLxbSutgxax39o0P1ii+o43Vnqcl+aHdIc4DWDn4J0r5FVvnLsLhvkpsVUkVysuyYuOlDM+hUwKSiiAsUpN74xCxTeINgtVdtsolB6WsqE6G0ylrrVAC1Ezv9yxXj/FjdrWvNsPqqxJyyz8Umhs2oGx+v5pcJXHy3c5ib0LGS3HTKIxNA54m60wFDU8clzFT6mMHond9bezIzH3W3VVCW08gpbWmFcbMSHtL6SuzMuIEWohPlShAJ6Yl4z8OUNHPEKKy8bbiJhtz3tmV8TEFuzl3mwYB6gp8R5h2c3EJATeXjNoa3Y1Z8IdjRuwWY2hYwAURC3BqgIrecRcaRvTy7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(376002)(396003)(54906003)(5660300002)(16576012)(2616005)(31686004)(66476007)(30864003)(956004)(66556008)(8676002)(83380400001)(38350700002)(4326008)(38100700002)(8936002)(66946007)(16526019)(6486002)(186003)(52116002)(36756003)(31696002)(86362001)(2906002)(26005)(316002)(478600001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZobmUyeUhSSkhoVGNnaUt5QVVZOXJxQzlaWnF4UmNNakNrTEdESHRSb3k0?=
 =?utf-8?B?WHBEcDd4aHVyblQraWlKaGJiZHJ3M3JFT0c2YU5kWjFnZmZJTk9KTHkzdlBE?=
 =?utf-8?B?K0FIS2JlWXhnQkNhN0lTUjZTOWdLOUM5eG0zenlzWW5uYzZ3dEJqZ0pZU2ht?=
 =?utf-8?B?MXB0eEE3Q29MZ1l6UWdOd2xvY3dXMEdPS1dNWnovUmc4QTFIMzIvaXlNU3pE?=
 =?utf-8?B?ZEVweGt3aDlDK0QzRWR5YkV2Y3RVM0tDOStucGRJWUZRM0tBbEs2clcvUzJR?=
 =?utf-8?B?MGFIeFJqY2NvQkxxcyt5NEg4NHdCdWprWkVSaWV1RlJDVkFKcE5wbThXL20y?=
 =?utf-8?B?b1lhQmJWZGJBc1lWWHpLSzdNaE1rM2hxZElKSmZ3TjkxN1ZJMGtEa290cS9H?=
 =?utf-8?B?Y1lEUmltbW5wT2IrWTZoc0hXanBSemp6T3prclNxcDNLZmtXam5Jb2I4dGYr?=
 =?utf-8?B?RmtNVTcxbDdqRE9xNk9qWXkvU0NiY29qc0Q3SnFmTjluQnRtdzN0VXgxaVpQ?=
 =?utf-8?B?OHZrUFZSWGY3OGZaQkNYYnl3ei9LK0QvYkZXWkFBQ0lTcFpBMDc5dk9HSWQ3?=
 =?utf-8?B?cDdVaVZ1cUtXTTJndzBsejNuMUV6ZXh2WlVkWkFGN0FVZjFQa09xdStWV25l?=
 =?utf-8?B?YTc3QjkzV3ExSEphN3pYdGRkcVlVQmVPaWxkTkZ0QW1sSm1oWEI1UFQvQkpp?=
 =?utf-8?B?WC9WOTRSVFdZUVBNOEw1WTlFSmJDQ0Z4bGNRMDFoOW9obEswNGltc2RVN1F2?=
 =?utf-8?B?ajljaHRkd29YZHJEeTgxQnZ0NnVvbVhCZTZqNGVIdVMycTFIMGpablVmVVBS?=
 =?utf-8?B?TXI1SjNuSVFUZTNGeWdsMTNCdWhFVGQ4bDd4S1NmaVJtdXZkVm9hdTAzQUlk?=
 =?utf-8?B?ZmIwelNVQ0N2K004dUtJL1JPK1cybE9teGNSaDIxdDJVbEpuMmRnZi9KTnEx?=
 =?utf-8?B?NFpaeWJveERPbVBwVWNIcDdoOHZieGFiUTdsZmozVTJ6RWRQbkVXTzQ3Vkxz?=
 =?utf-8?B?WDRybzhUbHpJSklqb0xxK1IrVmFKSEJFbTBWb0NPdC92NlJ4VDZzbTdYeW4z?=
 =?utf-8?B?ei9aN2NNODhwNDNRbFVOeTRhVmF4ckdmRU13aDhQa1lhdmg3dkxyLzZqQVFY?=
 =?utf-8?B?QjAvVlBiazJqSkRXVUFqUHlUZnM1c1phcDc2N2wxVHJZYXcySldocjVPWGdz?=
 =?utf-8?B?d1FtNktKckdVdTZYUVhYUkQ2bHNYb2FjSUZBMUg2cU42bUZGM2tYdHBkQlM2?=
 =?utf-8?B?NlJXN3VHWU5pTXVra3NFb0VWeUczUlo1a29pWERnSXpUOU11cmpXQVNjTTh6?=
 =?utf-8?B?Z3hVR1V6ZTRhNDQ4VVFkcm44aUNaamR3Q3NWbUtEb3AvR0ZoZlJadDNPTkVh?=
 =?utf-8?B?a2ZKa0RzSEg0bk9xYm1DcHVOVHIwSmNpMVBmQ3ZDY2dGSCtQcHNVejk3MVFz?=
 =?utf-8?B?UmZaRkJzRzd1UWpKa29aT3BPaWdCakJUR0dGVWtPSXI5dkhDT0JIb05yK3hS?=
 =?utf-8?B?d0ZyVjljSVN0K0RZU2FJYmw2STRWbVJxU1J0UzllU0N3SFNJbi9jeTBRSHl3?=
 =?utf-8?B?cDNab3pzOXJXaHI5c09LRGd2YTRsTEVhNnA2blRBODVybTgyb3JlV0VxZVNC?=
 =?utf-8?B?ZndTdTZrbFBHbVFGZWdDNEh4bzI3MHpqSmZUTnlwVW5CVG93NUFFOVlOUmR6?=
 =?utf-8?B?aGJkYndIQU42YzBUUk1yS213Q1MvUWpXc0t5TWhMOG01TUhZcWhSWE8zcmI0?=
 =?utf-8?Q?P7cYQzpvdduiBEmo7+JX96tdIujvl40WuyeMeJ5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdbb1c8-6473-4b5a-2663-08d936f795e1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 10:05:25.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCK5+aftJum2T4ARdZNCBkxmFFuvP8q2XShTi70WX3xeddPuokUWM2GpRCXl0GpOCdvlY9YghlW3yxsFx+tqcb7cfZdZCYKGX3F+4ri6/8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3445
Received-SPF: pass client-ip=40.107.21.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.06.2021 18:01, Max Reitz wrote:
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

I'm new to RCU, so my review can't be reliable..

> ---
>   include/block/block_int.h | 47 ++++++++++++++++++++++
>   block.c                   | 84 +++++++++++++++++++++++++++++++++++++++
>   block/io.c                | 61 ++++++++++++++++++++++++++--
>   3 files changed, 189 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index a8f9598102..fcb599dd1c 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -832,6 +832,22 @@ struct BdrvChild {
>       QLIST_ENTRY(BdrvChild) next_parent;
>   };
>   
> +/*
> + * Allows bdrv_co_block_status() to cache one data region for a
> + * protocol node.
> + *
> + * @valid: Whether the cache is valid (should be accessed with atomic
> + *         functions so this can be reset by RCU readers)
> + * @data_start: Offset where we know (or strongly assume) is data
> + * @data_end: Offset where the data region ends (which is not necessarily
> + *            the start of a zeroed region)
> + */
> +typedef struct BdrvBlockStatusCache {
> +    bool valid;
> +    int64_t data_start;
> +    int64_t data_end;
> +} BdrvBlockStatusCache;
> +
>   struct BlockDriverState {
>       /* Protected by big QEMU lock or read-only after opening.  No special
>        * locking needed during I/O...
> @@ -997,6 +1013,11 @@ struct BlockDriverState {
>   
>       /* BdrvChild links to this node may never be frozen */
>       bool never_freeze;
> +
> +    /* Lock for block-status cache RCU writers */
> +    CoMutex bsc_modify_lock;
> +    /* Always non-NULL, but must only be dereferenced under an RCU read guard */
> +    BdrvBlockStatusCache *block_status_cache;>   };
>   
>   struct BlockBackendRootState {
> @@ -1422,4 +1443,30 @@ static inline BlockDriverState *bdrv_primary_bs(BlockDriverState *bs)
>    */
>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>   
> +/**
> + * Check whether the given offset is in the cached block-status data
> + * region.
> + *
> + * If it is, and @pnum is not NULL, *pnum is set to
> + * `bsc.data_end - offset`, i.e. how many bytes, starting from
> + * @offset, are data (according to the cache).
> + * Otherwise, *pnum is not touched.
> + */
> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum);
> +
> +/**
> + * If [offset, offset + bytes) overlaps with the currently cached
> + * block-status region, invalidate the cache.
> + *
> + * (To be used by I/O paths that cause data regions to be zero or
> + * holes.)
> + */
> +void bdrv_bsc_invalidate_range(BlockDriverState *bs,
> +                               int64_t offset, int64_t bytes);
> +
> +/**
> + * Mark the range [offset, offset + bytes) as a data region.
> + */
> +void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes);
> +
>   #endif /* BLOCK_INT_H */
> diff --git a/block.c b/block.c
> index 3f456892d0..9ab9459f7a 100644
> --- a/block.c
> +++ b/block.c
> @@ -49,6 +49,8 @@
>   #include "qemu/timer.h"
>   #include "qemu/cutils.h"
>   #include "qemu/id.h"
> +#include "qemu/range.h"
> +#include "qemu/rcu.h"
>   #include "block/coroutines.h"
>   
>   #ifdef CONFIG_BSD
> @@ -398,6 +400,9 @@ BlockDriverState *bdrv_new(void)
>   
>       qemu_co_queue_init(&bs->flush_queue);
>   
> +    qemu_co_mutex_init(&bs->bsc_modify_lock);
> +    bs->block_status_cache = g_new0(BdrvBlockStatusCache, 1);
> +
>       for (i = 0; i < bdrv_drain_all_count; i++) {
>           bdrv_drained_begin(bs);
>       }
> @@ -4635,6 +4640,8 @@ static void bdrv_close(BlockDriverState *bs)
>       bs->explicit_options = NULL;
>       qobject_unref(bs->full_open_options);
>       bs->full_open_options = NULL;
> +    g_free(bs->block_status_cache);
> +    bs->block_status_cache = NULL;
>   
>       bdrv_release_named_dirty_bitmaps(bs);
>       assert(QLIST_EMPTY(&bs->dirty_bitmaps));
> @@ -7590,3 +7597,80 @@ BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
>   {
>       return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
>   }
> +
> +/**
> + * Check whether [offset, offset + bytes) overlaps with the cached
> + * block-status data region.
> + *
> + * If so, and @pnum is not NULL, set *pnum to `bsc.data_end - offset`,
> + * which is what bdrv_bsc_is_data()'s interface needs.
> + * Otherwise, *pnum is not touched.
> + */
> +static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
> +                                           int64_t offset, int64_t bytes,
> +                                           int64_t *pnum)
> +{
> +    BdrvBlockStatusCache *bsc = bs->block_status_cache;

Shouldn't use qatomic_rcu_read() ?

> +    bool overlaps;
> +
> +    overlaps =
> +        qatomic_read(&bsc->valid) &&

Hmm. Why you need atomic access? I thought that after getting rcu pointer, we are safe to read the fields.

Ah, I see, you want to also set it in rcu-reader code..

Isn't it better just to do normal rcu-write and set pointer to NULL, when cache becomes invalid? I think keeping heap-allocated structure with valid=false inside doesn't make much sense.

> +        ranges_overlap(offset, bytes, bsc->data_start,
> +                       bsc->data_end - bsc->data_start);
> +
> +    if (overlaps && pnum) {
> +        *pnum = bsc->data_end - offset;
> +    }
> +
> +    return overlaps;
> +}
> +
> +/**
> + * See block_int.h for this function's documentation.
> + */
> +bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
> +{
> +    bool overlaps;
> +
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        overlaps = bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
> +    }
> +
> +    return overlaps;
> +}

this may be written simpler I think:

RCU_READ_LOCK_GUARD();
return bdrv_bsc_range_overlaps_locked(..);

> +
> +/**
> + * See block_int.h for this function's documentation.
> + */
> +void bdrv_bsc_invalidate_range(BlockDriverState *bs,
> +                               int64_t offset, int64_t bytes)
> +{
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        if (bdrv_bsc_range_overlaps_locked(bs, offset, bytes, NULL)) {
> +            qatomic_set(&bs->block_status_cache->valid, false);
> +        }
> +    }
> +}

Same here, why not use RCU_READ_LOCK_GUARD() ?

> +
> +/**
> + * See block_int.h for this function's documentation.
> + */
> +void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes)
> +{
> +    BdrvBlockStatusCache *new_bsc = g_new(BdrvBlockStatusCache, 1);
> +    BdrvBlockStatusCache *old_bsc;
> +
> +    *new_bsc = (BdrvBlockStatusCache) {
> +        .valid = true,
> +        .data_start = offset,
> +        .data_end = offset + bytes,
> +    };
> +
> +    WITH_QEMU_LOCK_GUARD(&bs->bsc_modify_lock) {
> +        old_bsc = bs->block_status_cache;
> +        qatomic_rcu_set(&bs->block_status_cache, new_bsc);
> +        synchronize_rcu();

Interesting, that until this, synchronize_rcu() is used only in tests.. (I tried to search examples of rcu writing in the code)

> +    }
> +
> +    g_free(old_bsc);
> +}
> diff --git a/block/io.c b/block/io.c
> index 323854d063..85fa449bf9 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1878,6 +1878,9 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
>           return -ENOTSUP;
>       }
>   
> +    /* Invalidate the cached block-status data range if this write overlaps */
> +    bdrv_bsc_invalidate_range(bs, offset, bytes);
> +
>       assert(alignment % bs->bl.request_alignment == 0);
>       head = offset % alignment;
>       tail = (offset + bytes) % alignment;
> @@ -2442,9 +2445,58 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
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
> +            if (bdrv_bsc_is_data(bs, aligned_offset, pnum)) {
> +                ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> +                local_file = bs;
> +                local_map = aligned_offset;
> +
> +                from_cache = true;
> +            }
> +        }
> +
> +        if (!from_cache) {
> +            ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
> +                                                aligned_bytes, pnum, &local_map,
> +                                                &local_file);
> +
> +            /*
> +             * Note that checking QLIST_EMPTY(&bs->children) is also done when
> +             * the cache is queried above.  Technically, we do not need to check
> +             * it here; the worst that can happen is that we fill the cache for
> +             * non-protocol nodes, and then it is never used.  However, filling
> +             * the cache requires an RCU update, so double check here to avoid
> +             * such an update if possible.
> +             */
> +            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
> +                QLIST_EMPTY(&bs->children))
> +            {
> +                bdrv_bsc_fill(bs, aligned_offset, *pnum);
> +            }
> +        }
>       } else {
>           /* Default code for filters */
>   
> @@ -2997,6 +3049,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>           return 0;
>       }
>   
> +    /* Invalidate the cached block-status data range if this discard overlaps */
> +    bdrv_bsc_invalidate_range(bs, offset, bytes);
> +
>       /* Discard is advisory, but some devices track and coalesce
>        * unaligned requests, so we must pass everything down rather than
>        * round here.  Still, most devices will just silently ignore
> 


-- 
Best regards,
Vladimir

