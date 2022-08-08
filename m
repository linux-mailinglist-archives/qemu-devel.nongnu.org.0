Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEA58C891
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:47:11 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2A2-00051k-GP
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1vh-0006Yp-Ua; Mon, 08 Aug 2022 08:32:24 -0400
Received: from mail-eopbgr20126.outbound.protection.outlook.com
 ([40.107.2.126]:8193 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1vg-0005eg-3V; Mon, 08 Aug 2022 08:32:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/mj//jOmoMMRbnnPUOThWAAsLGlisEsTntBazyE1CmvAt1mkHbKvUXVTHiAfxXzTcrBvLXFxRoOgkgxW5l9/pvzAsq2XIXdavRbe4t8aht1qsR/bFFFEP+XGCNCw4SdV8mn7DVjVFuMW0LNDmDnTjdyfj3gSgncfnaTgxAINiyz4M2YOqGdnaI/jSHW++O9ZZMtTQzP4ftb29C+2lsD3PnSv9TPALrKK9XciKa2vKwXw8WdfWHz7q+i+E+5RHycaTulWuqgZEF0SeHPqX1GI4TSElWHrBxUgnV8ig9mxklIzYvn7q2kGgm0X1iptFNFaQlUMxorHn5fef8ZN2g9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGrDWbyst476P2/+oUWRCqSc8bpLSNiRr7uMpOCjxuA=;
 b=HJDkqDYs2EDtzylP2rAnpL04H91D5qv62biTUK3pRU0IiQFtr0ytwMN5hIouIzrpeteNw06cH4/fP16oAiwdVINXF4+3kaGjd2fcxyO7QldFiOgh7YlTxb/6b5UrSmBX2o/lF7M/HjWccjEj7n7jebYx4h6X5Utpwp4e71Jgu6AXasEti8pIr1lxeD6zQVg+oj/OIU7+bzMZN/pyOfx5vCGoUzUe5XKjMyNHUBsDI/2hpE+sla1pnjH7AEgFdc2/pkpkoFEDmA+tToYCkwhooAALDBRljRXizzycL1wZkL4M3DmybLfIqHOIHcsSLK5JgWoK3tJ6iYbhOOI7DF/F+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGrDWbyst476P2/+oUWRCqSc8bpLSNiRr7uMpOCjxuA=;
 b=ZPFbV4Oc9QydqTJfIE+QCGmJOH+elDcBuKQSNSUwVR74Y8W3cwBqY0obuxPxM+Rq9ru9Rn6c/VXZuHY/+qSqIXbl+p5pub4KnCnPUEmYt0uH43nCkRa/e7qkN5cOJJRecErgGE7CvDqU957zlBC6kMVPgNfK6/HqZLK5q3+ExVwvmz0EqmF/9sWIjGpBphQ6ULtzadHjtOAch2OWR7LXw/38y/A+JVFyeaLgF3bYJALFIX5vygCHLX92je4d2DKT/ZzfFOVIktQgMyOuKHYCuBqgKZ36WiXOl4ToyTwNYqUaDFDNsEsUs/B1lvPW0q6bUyPYWWFhgI8bFJiTUvu0hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DBBPR08MB4475.eurprd08.prod.outlook.com (2603:10a6:10:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 8 Aug
 2022 12:32:15 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:32:15 +0000
Message-ID: <57ef467d-c8d9-7a52-3cf7-8403f4b28710@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/9] parallels: Move check of unclean image to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0070.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::23) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd24e989-87a2-4ff7-c59b-08da793a06bf
X-MS-TrafficTypeDiagnostic: DBBPR08MB4475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRrWI4ywPG1Ndo5sCwxeKh/vcfFNOEiR0It+x3diIfjIKx/PLAbdhPygw4kR1SeHZTFf7Ot5ZX5nTj2ByO1uqEjj0+6S2YxgSSlLBLEDIpW2667Vqf36hO4ZhpdzrBwdUfsmALJS7os5IPfgvExlAInMZWo2Dkvng6yEXoL4rZlCBrJSJFVzQVKI9ZddLkwgcSNyR7BZTup7VTYw4dQr7A+0Q5ocKYiqZKxHvJBjRzh+FuvSe5EUPAbgiV6suX3DUGv6v3lFj1qxWo2iEWKU+BiwGoL5TeBd6CQPisMQ1efRDppZ9y8GfA3sk9L8vVtBB1NUsOZ7aHcMl/mIE3LToatPjTa7yfOgoMy/dCgTR0s3SF7RdKaZLarAnxr1b6a/+QfKyQgr5I0/lJbb9jW4bmxNhiUrmE1ay028ty1SSQBjRCASjiBNQ0W+kV+fAYskKJ+DNvWD5fgy0yvEpjHLD7mS19EZaPZ7kui7IesNL7KylNnu9cvl0im69pbq9U6/t9l1Qp/sxfeoYw5PwRiGdfDpFHrw/OrVACjHWHtbX8rT34rZz+UlSEecnHgQYvnWhYoWsHwhU5geiAJZu2ASq4jP+D9VlrW8sDWbC7d7OR9fvtFiZVLxNOiRwcH/WKz5EC+TDxf+AEXGNyNczgvkXlSjeyiquDZsNAKYC8RjwBdjrtnh+hsAs3QHvUQKGDUkyZlqEpLNaI9dT8SL6Y1A7XWcOnoAxsPPl+gG8WohOdEQSGgOpM7yLc0kTvTgjMPRkA/FmwSV/3yKPsTHpWr7eLh9ruSqfL9XR1pa7HGOTA58prd/RgPYNYzqwCTaIunYL2MEaf0l4rP2Ks55CyKOf2fu/er8tNM32T2qYW1RLmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(83380400001)(2616005)(316002)(186003)(52116002)(6512007)(86362001)(6506007)(31696002)(26005)(53546011)(41300700001)(478600001)(8936002)(5660300002)(31686004)(36756003)(2906002)(66946007)(38350700002)(38100700002)(66556008)(66476007)(6486002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhxUDljVTRLb01JWFhtTk5EVDZTS3RSMWkyMFJ1Zzk0R0I2RG9rY24vMytN?=
 =?utf-8?B?VDgxOHp3cVJqSExhd21Ob1BDLzRpUTFTT2ROK0lwK2R1cVVkbUVJd1NJeCtk?=
 =?utf-8?B?UnlxNVpQQzN4ZUlTZ2ZZbis4UGlnZEtHUXhiRXJxMWowTW94UlJ5Mjk4VnEw?=
 =?utf-8?B?UDlUWjdPc1lNRCtIZ2hQYkFtOERWYjlzVWVsWXcwSWpNaHhsMDg5WWpod1Jl?=
 =?utf-8?B?RUIwNGhZMnEyUEhRY29NcmlvUkI2YzdkSHlwMEVNNFozRXBqWkZUcWd6Tmhj?=
 =?utf-8?B?aFY0V0tSNXVUbmtXdXBhQTU3dENYTTh2V1U0aHVuQnFaTFc4aW1mRGpaOWxu?=
 =?utf-8?B?Ry9ON2pwM1NwMTFXZGx4aGpoU1pRc2NjSmVQWFhyMDNMYVlFYUZHUzIrWE8y?=
 =?utf-8?B?cWtZYmxEODBRTnVsZ29uV2JYYmpPOHlyWkttOXBKekxIWVAvdWJhVTkvN21Z?=
 =?utf-8?B?YytaY3pQbWFpaGo2WEdCRGRxMXV5cFFhRDIwSXBZS01iUTVKWXAxblFFRHdU?=
 =?utf-8?B?WEJySlM4dUIzWXVDKys3ZXk0Z3lUMVliWGkvcVhDdWdvbmlXTFRFNUg0Snhq?=
 =?utf-8?B?R25jeU9DSThDT1JHOXNmd0NiQXFBRWdIc0tDVlRiNHZqeTJxNEwySXVRS1l1?=
 =?utf-8?B?OFV0NnJLK0hlNEZEVTJYY2svc0c5bElvOWVqUlk5cWl5YjlvMWZmemNFMkpR?=
 =?utf-8?B?WHZibDVjTUcwb3BFZTJIdVJhM2c0K29FZFBqZXpSUUpKQk4yMnpRamo4SklI?=
 =?utf-8?B?Zy95cGNIYzNMUndDcmo2eUh0ZEZ3WUI0OVFUZDJzU2I0cXBjSDk2eDRjK3dl?=
 =?utf-8?B?Z3RhSEZ4RHVRY0xTdFRXQU93N1Z5Y1JzVVFjY1ZUZlVzazNYZlhZekxLY1ha?=
 =?utf-8?B?eWdwQi83bzVxNFF5dDN0THNyWjJlYy9TVVdkR3hyUlhHZVJrb09kQmtrV3ZX?=
 =?utf-8?B?OEZENHJRNXYxOUhhY016bGtwcCtacktjcjVWUXNiUW9LSDB6Njd0Y2h3REND?=
 =?utf-8?B?aGd2eGlGNEpyUVhzdmRKQzhUdGJsS1dhWWlTREJGakwxeGdZY0hFTXZ5N2tX?=
 =?utf-8?B?b2E1RWxPRlhHbkE0RHVMbUZCNFlJL0tacmVyS3k5eUVZemR0MU1ibmdZTmZm?=
 =?utf-8?B?cmdUaUloWUY2Zk9UcjRvU1N3SWlndXcwdHhmSVcvM3dWSVBDTHhXVlRJVzBK?=
 =?utf-8?B?QVpNRWwxNGpYWWR6cTJYREkrTkxXc0VIU3hmaGhYSnNiUU5uNzNMbVI2VGt3?=
 =?utf-8?B?UjFrcUxzT2ZXcHRTS3UzSWVpdVNIVUpSUGVINVN0enFXbEFGVUdCN1ZBR1Bq?=
 =?utf-8?B?ZU5QTTVxQkhIQTFtdHhIa2srRUx6RFlCaXQ4dU93QlRkbUUwTGhJNVllREsw?=
 =?utf-8?B?WHdVM3d5UWJkWkx6Y1pKWHRaQjhzU1JmcWV2T3hYKytUajZkQlUwNzJxY0VB?=
 =?utf-8?B?NWtGSk4xMG9SMXl6Nzd6YnVQaXJDNitDYUlteDJuSnZhRTFKS09Za2pySkUz?=
 =?utf-8?B?T0xNWGpocUNZRXpsbXI5bTM0bzNSZ0VjLzFjZkVpbDl3WWwzQkk4dkcvMkZ3?=
 =?utf-8?B?TXBsZFBlY1JLaldyWVNFWjg0RDE5bldSR0dGTUYrdUFqOUF3Z0lyUHhJdXAy?=
 =?utf-8?B?MnRYdmRJdUMrV0NOVmkxV2FGb2lxbks2blBZQUdYMjFHWkdlTFNLUCs3L2lI?=
 =?utf-8?B?dCtZNDJkWUZNajhRdU5QYUpOSVVJbU8rTlN1RTE5SmlEWmZZcUc1YTJ2ZEww?=
 =?utf-8?B?VTNVUlVDdHFOME5wdkVRdGpOVHZCbG03QXRGajdBQkdxOW5EOU5JaXU0c0Z2?=
 =?utf-8?B?ay9YYmRKZE42Q0tNSXIrcDB1cnpOMWpuQXdyTDN5VHJLUFFCazUvaFNBNmp1?=
 =?utf-8?B?MkVqcWhpbS81dTlnUks5QjRvN05Kc05VZlNHU1dIcG5JMXZuY0Nxa0hRQWhJ?=
 =?utf-8?B?dWxienZ0Mnl4SEsrQ1ZnZG9jbjVzRnVSMzBmOFA5azJibzMrclVlWThXaEV4?=
 =?utf-8?B?Y0t2RDNNbWM4N2FlakRpR2p0ejZQakdvays5SHJydmhUZFZBTXVvTzZVai9V?=
 =?utf-8?B?c1E3WjBSUXc5MWdLNDBPVXRPVzV1b2tZcUlQVHByeG5qYit5MjNxMjRuaXBQ?=
 =?utf-8?Q?oTgKdMdtuk5PsmJArKIDp/Erc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd24e989-87a2-4ff7-c59b-08da793a06bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:32:15.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1afEoQYqzeEBbvPdbBTpjuULZ7B9puqbah27zLQBLPbNIEXaNGFTWPBiOjgpqNCg8pXY1SWX+DYRru1Zkr8FDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4475
Received-SPF: pass client-ip=40.107.2.126; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

On 08.08.2022 14:07, Alexander Ivanov wrote:
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..108aa907b8 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -413,6 +413,23 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
>       return ret;
>   }
>   
> +static void parallels_check_unclean(BlockDriverState *bs,
> +                                    BdrvCheckResult *res,
> +                                    BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +
> +    if (s->header_unclean) {
I'd better revert this condition if we have moved code to helper.

> +        fprintf(stderr, "%s image was not closed correctly\n",
> +                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> +        res->corruptions++;
> +        if (fix & BDRV_FIX_ERRORS) {
> +            /* parallels_close will do the job right */
> +            res->corruptions_fixed++;
> +            s->header_unclean = false;
> +        }
> +    }
> +}
>   
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
> @@ -431,16 +448,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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


