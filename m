Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4F591277
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:47:46 +0200 (CEST)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVwu-00006E-Ey
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVrb-0002bH-4P; Fri, 12 Aug 2022 10:42:18 -0400
Received: from mail-eopbgr60120.outbound.protection.outlook.com
 ([40.107.6.120]:61626 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVrX-0008JQ-T4; Fri, 12 Aug 2022 10:42:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkKOGxIXp+A9jOAs5OQXawM4ZnZCBy9mGkvUHVvuvF0foF8omQJSmlMskdMLT8XL1XAUQnX2nREyFieTMzsdAvzh8OYoyN85qMkkSvHWowz1CUEvRA4bh9dMi8dX7dUCdnX7Efzw/Us1EBV69tdbvWD72Mnhy0clsB4I6Uj6y7Gt5bv4UOb5CqG6o57EbSWR2biOQaBUF+0307JpJl5mwlSMOi+5KVM0tkNKrCUojCtvSQKWh1e7u+0xgju2kL+Es++kn1p+10WCzsDAQt6carMAXoA3YbFJjfZy8d9sqnfF7U5Yyu/iSRRbkS09KkOuzi484TBaRyiuOaz4bQxxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP6UorE7I401x+Md7vttZuIc6F8iOpWD2F2PvoVUBAY=;
 b=VNShGs8Ihqki7xlQcQpboctwukrDWYtTsNDMjTyIl/v0a9kMD6tjs5sI/SekHgyM7nyjpSkg0u3/tI10tcE49rZi0RNiaVXIC01I+hXBDl9j9zhKF57+/3udqA2vsQxq6SHOCvQyjp+TomxIxocxWj2IhbObeRC/EU4r1k4CjgDl1ZtBiEb61xJ+7atVRI9Hg7H3jRmy5PHCiipZJiec8vmPiqp36K9+w9Z4EWeuVR6YiXn0riTKSTStazSFWkEGNk4Uvmdeju8Yh9edOJk5RYy0okTJ50e6YVKbt5XyP8m3rxEIzAwO67G2UAcsksuSIk4UUlWvaz6QU+Do+G/spA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP6UorE7I401x+Md7vttZuIc6F8iOpWD2F2PvoVUBAY=;
 b=O3THqlUObH3fMk10OM6TdpO0nnJSVlJeSVQLz22CtVzYyXixvE6j4xFHXpiH/hL24j8aNsD28AIkJFsl92eVyUr7edBPWXyivgUKEQJqSpNxpBfRSI/Odxl8qblRN0RAR7AdzgOj1402bw4YlvJy8BK2BnSO4hhhJwd0iUCzXgN4IdAvOUSDBvjRugk8thrGs/R9smzs5PIIYGRPCX4MuJZu8VQg/gZfZgzsA0Q2tWoZPFblJUs8PFA05dt9+vgCn/kFJaRZljnWbi8JxvW5EoAwbnCuF+XZwxeFNMeJVPn+dyA414QBoq8r4bTvQqlpUxBV21qFLT1EWQEIBWhnTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 14:42:06 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:42:06 +0000
Message-ID: <344efdcf-42fa-ec3d-25a3-ff06da9e7d76@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/8] parallels: Move check of unclean image to a
 separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-5-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-5-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0075.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::28) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14fbec72-bbd1-47ce-43db-08da7c70d449
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZC5tf/jwuoNNjLhPMUH0wOGe84pYaXFP+sBULS6cIGLj+IR3Ezj5OZ4ZD+GN2LmLhkGN3O5lJPL/JsnWh+h6hNZEnATkTnGTWihC2qFvM2ok99SFuNz6P+dxuToq+qNI4LiUBz7HC2xTMQHS42yVEp1Cvjx7gTMokJ+ZQUhu/wV9BZ3qsSf73g782rPMk9hBiaUM9gmKL/BfYjBIWbnLNmwtcmsRbEgQtysgXDho/E5cKi1E4maTPzfb+5kEE3vH0afZusiARPKwgVublVQnXEgWx1G7vHLD4HadBv/uhepDqOlKKYikJCwZrcWy7Rqw8K994B6oW+kW9LrmlYTPhDNoAsR2OUbEFCPCfnxZ6FlkSU4Yan9ZnfyDQG8JPeyRXv0P4MpUVY6mIDXPxb4fjWzvWh0lFArlfe65pxRf+wKXfqT6OlMlWT73VEKPo7o1pzwNptFAtDlqEHS7N7M6bn5HHklX8FN3sWxuoFp7YpX1HYdm5RNDurgIEiSStjXaKdifwFZOzDgm1ZQMPwTMPlfjblnmR1QIDvVC3mUQfhqZzyq9u1hQjvuO4oXvcu/7WxBTw1i4ISPOXKaTCkWhxpnz2AbtP3eY0XaIKt+QehoGD8KUg95/7r7JtrR3GmrLwLbL63KmJpDKIy/Uv6WD/p+jFyUxFBLPBa+1GWIt4P0wtWvvGIh/lVzOE9Tm/2r5aDqJmU1C1Z48P3WlVwebCgBQQEN8l4PnaJ4o1Gqy0/Ia7BC0WmTy74NvndVo3Mib023C0SJmDjQH6DWs12AQlss2t0CRcUj2l0QXppWi5cqYevbBzP8Ek+nnv2fGvrXR4qI/y6VvjokC8z5JFKy2PL5aiJsjMfKxAno4ZnHEJ+SlHs9ObH9OoOFlElO97la
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(31696002)(53546011)(36756003)(86362001)(31686004)(83380400001)(52116002)(6512007)(186003)(6506007)(2616005)(478600001)(38350700002)(316002)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(66476007)(4326008)(2906002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmsxaTBiM25OYnVDajd0YUJIUjNoK0I2WWJiWGMzL1hVUWVxa3QweUVDWXAw?=
 =?utf-8?B?bStZclJld2dPOVpEeWJFSGorckgreVI1VHB4bnYrNGsrY2RpUmhXZi84b2ow?=
 =?utf-8?B?STd2MGFOWjhEZjN4ZmhGZ1puZU01KzBXdFlHaDJsMDZYZWNkWlJTTDdOWDR4?=
 =?utf-8?B?Z1pCaVBBV1d6WnFDNmltbXdZMHhsVDZtS2NqM0owZnVERTJMeUh6REd3bFRy?=
 =?utf-8?B?WG1ySTRtRlZBcW04QVNCVWxqcytDYm8yaHFuME5sSHRWa3FoMGNyVTdHbGpK?=
 =?utf-8?B?dVpoZElwOHVjc0Y2bnMzVWg3ODhYZVd5SVl0Wi9HQ24valhjMWpJMVdjVFpr?=
 =?utf-8?B?NlBoUkhNWnNZU2x1YnNsVzhFblBkNEJJNndReXEwS1JTYTR0R1dYSS9aSGpK?=
 =?utf-8?B?NlJSMkNTR2MxUmlEeFkxVDM2eTdqMTUyTkFubmNYVGhmOUJvbU45Q1BVa3Rp?=
 =?utf-8?B?WVFZTHN5eS9GY1p0UVhhZi9yU2hGRmVya1YvczhMQW9ya0NTWE00VmhhQ3Y0?=
 =?utf-8?B?VlBPOWY5ZDBJWjJZcUVvU2x0MFQ5ZVdyNG9UcFZ4ZTExdXA1Q0lBcHBJY2c0?=
 =?utf-8?B?QTR6bWFNTnoyNUFqa3Jqa2tKNXJ1NFhRT05zcm1VaXQrcDFxd2xLUTk4cmlB?=
 =?utf-8?B?VlFjaE1wU1dxV3FWMXF6RzJ0T0U0TUFCNWVaOFdsa3AzMklyU2VRcmkvTHBj?=
 =?utf-8?B?RE9oYXBuQVEvaHY4SEpUNmZzRXQ2THRqazNjWWdQR1VqVzNGTHB2TGJqY09P?=
 =?utf-8?B?UUpESnl5YkNyU2xjWHlkbm9GTGY0ZXlnQk9Ga0FXZTAySXdPUDIzenVqb1o1?=
 =?utf-8?B?bFNoNVU5eVVneWovQ25Fc25uZU54eldtVmd6UnVYdGV3eFl1Vml6Vmw4MGdJ?=
 =?utf-8?B?bVR2VWVhZkg1ZHpwQzZ4U3JxMlBsaU9NNXpxNmhwbHJQN3NsY05ZN3gycHVY?=
 =?utf-8?B?UUtaQ0o3NWRicm8raU56Nk1EeGRiTDJNbjI4SEpicFo0STJ6ZENLL0FBMW1w?=
 =?utf-8?B?ZFBkdkNHUURzRVBac0JGbU9CSitRa2FXWFJMVllKWWZSYS9lNmwyUVJqTTBG?=
 =?utf-8?B?Y1I2UmxmRC9zZXhFcGcxTm85VjF0L2ZOVE1FMTJxV0R0RFlSNjFKUWpuTUk3?=
 =?utf-8?B?SithRXBSQkZSa2VLSERka3ZEM1RJYmR3UmhlaFJ3cWpIYzhnNFliNHRXR1VY?=
 =?utf-8?B?bnhQTmtLR0p5NW04VVEwZjlpOHpQVis5ZG5nRFhTcGViYTl5VFpFdFRlbGV1?=
 =?utf-8?B?S0NJb3VZZTN1VEZvRkJxK0FVMmxCbXdidlljbHd2WUJCYUx3amZwMnBIQWxW?=
 =?utf-8?B?UW1xNVVoNWRRTzdMWDl0bGN5d04zankwTmZMV2dwZnZQWHFlZ21xckkxaXU1?=
 =?utf-8?B?TmFQaVNEdXJBV1I2QUJBMjhxeUVtVkFkdmw0bTY3RTlPWXEySEtjQ3NCbUVm?=
 =?utf-8?B?QkUzZ1A3Kyt3Y2YyWlQ3VEhqaHVweUFXTjJSRW9Xd0RsTzlxZEJuRU1LRXVm?=
 =?utf-8?B?T0FxYVhWR3VuK0dFcEVNMkZ4SnRZQWdIWDNURTV5S2hEaVJDQXhxY2dPbmli?=
 =?utf-8?B?anFGRFNGSDcrM1lmWURhNkFyeVpxdWoyYjdJbzRLQUJPNHV4cVBFZjFGM3ZP?=
 =?utf-8?B?KzJ4K2xCQlVLUGpPc28yazR0M2pKZVVkTldiQm9UNUliMGZ2L1ZTWHVaK3VV?=
 =?utf-8?B?YU1qbWxHK0pESjVCWmpBUFV0ZFhRczF0K3NKWUYzNE5lMjZJMkFFaSs1aERN?=
 =?utf-8?B?Mmx6NjRnaEkxcTJZMDBianFqVXNtRzQxWDZ4Z3EzU0hNNnE0dit0TzQzVW56?=
 =?utf-8?B?VFlZbjJHKzNGbWNNc2c0V3lTdVd5OUVxTnF5bjZnMXFsK0FKeGEzZndEOXc1?=
 =?utf-8?B?OVlNdGtDMGJrRmdIN0R1SFRlTjJRNkRXVDJiVmw0WExQdFFXTC9QRFYrZHFC?=
 =?utf-8?B?OGRYczhBVXNBclBRMkpzaDdTR1AvM3pGR1p1WDNVTEF3TUlpZnRYWWEyQVdv?=
 =?utf-8?B?T0RZTEhuZVBXbHJ2MmxxckxOUGQyMFF3clV6eFJXQVo3Q3BURmpkWFk4bFp2?=
 =?utf-8?B?YUtLU2UvZXlydk1KdFpzdEZTbnIxVUhLRmJkeE81NDZvaGJTTmswdzhLWDFL?=
 =?utf-8?Q?NbYHZgY+v4loJ1nhcahk7VyLR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fbec72-bbd1-47ce-43db-08da7c70d449
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:42:06.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/hxJCTaDqklmBh/ih5Zs340kAjmYhzzuqnDAge1xZx7KSx6QtN+tnPGwToiyu39NpxUKcRpw9+MY1SjXL/CCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.6.120; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11.08.2022 17:00, Alexander Ivanov wrote:
> v2: Revert the condition with s->header_unclean.
same comment about change log as previously

And commit message misses motivation part, why we are
doing this rework. What is the goal of this change?

The code part is clean.

> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 31 +++++++++++++++++++++----------
>   1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 6879ea4597..c53b2810cf 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -419,6 +419,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
>       return ret;
>   }
>   
> +static void parallels_check_unclean(BlockDriverState *bs,
> +                                    BdrvCheckResult *res,
> +                                    BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +
> +    if (!s->header_unclean) {
> +        return;
> +    }
> +
> +    fprintf(stderr, "%s image was not closed correctly\n",
> +            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> +    res->corruptions++;
> +    if (fix & BDRV_FIX_ERRORS) {
> +        /* parallels_close will do the job right */
> +        res->corruptions_fixed++;
> +        s->header_unclean = false;
> +    }
> +}
>   
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
> @@ -436,16 +455,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>       qemu_co_mutex_lock(&s->lock);
> -    if (s->header_unclean) {
> -        fprintf(stderr, "%s image was not closed correctly\n",
> -                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> -        res->corruptions++;
> -        if (fix & BDRV_FIX_ERRORS) {
> -            /* parallels_close will do the job right */
> -            res->corruptions_fixed++;
> -            s->header_unclean = false;
> -        }
> -    }
> +
> +    parallels_check_unclean(bs, res, fix);
>   
>       res->bfi.total_clusters = s->bat_size;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */


