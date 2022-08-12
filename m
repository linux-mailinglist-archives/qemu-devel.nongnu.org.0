Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E825591282
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:54:06 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMW30-00047Z-0x
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVuO-0005oq-G1; Fri, 12 Aug 2022 10:45:08 -0400
Received: from mail-vi1eur05on2120.outbound.protection.outlook.com
 ([40.107.21.120]:2788 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVuL-00008r-6k; Fri, 12 Aug 2022 10:45:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erk8wrvo32axyLYjgP3rWfocnmrmfgkA617qqe/ByPvPiWAcQSlwyJAXJzfg5Qv3MJAltnz2bCZOxHcobDl8ReZVtLESa7Kt8okPdTAVs2eKa2GhTDzu4lDMY7n2nuwrNGnM6AF9HjhUu1OXqY5Oy9xZJyBfHFwSYnCqh6goUgMzgD6nqOAS+NQTBeIBYCJbpEjYwjna1It1Zq8LveSD7hIjLN3MReGYP9FkClAdQ68AqLLd7P9L91iDPXP1QIKn2Pn9kv+yYYoLl4ZADfDvYAQI0HJYlsPmTAWPG9iEaP9ah+gY71RylbrbocoXAWFcwcOBQLRpPFi8VI9KqGk7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k2hgkRNYRx5tWH88gTkIeVkbZwI1/5heAgEODifdcQ=;
 b=GbVCMYfrYTiwv0fSRKeC5BZQl5KaGdSN/M2UrMzpE7Bx4MWPWDFh8wwCmaBmgAMFPiVdBvBAvtuFSPB22SeuEDNWNG3x6B6+l7oc/y0Rf4y+xTgKny4jotdSYyIYmsG/O0fDwxvqEibN4MEc5SimENW+fO0n6AdfphQh65y9ae0l4EXibX7oy7D38yayD6EwKZiYYknzt7+yAnLRMrcZNSsOS7OqizG+SLEyxJAhM14cht1QyWMTt+yYmSKKw+VZsIDbFhIVDYgJw/0MdH0qBChZiWMul7oro83+o1WmBKK6RBIzRVeY5XRWKbF32fYWnVVAAkmP5hbzXYosSNDwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k2hgkRNYRx5tWH88gTkIeVkbZwI1/5heAgEODifdcQ=;
 b=RNhZuyBNdkUqkN/nGh3kdrxCqb1dhY0qg7LfGFqQp8BilboUglF59BuYJRyOTTLnbPnKH7qFQh2g6DDABZlJ43cc3Kv2SEK+UpNU5PRn+XgPYAM7bqQGgLbSgkWwF+irg0e4gkKImjSyFOXdLE6KmDFYJwHF/hHm1/+h0uWrfK/JhiJenG/Q4fLtVVPtg4e6klLKuRiV7Oq5hR74beOfDkDgTTaf7h+W9G/6o6kyAaRYJI6dJC4MPNzpb5plZw8qRGtA/n4Ctmds/UfWiZl6MoDsygNsUIPha45IOuvgfwjt2+G5IyYi69kabxE32+Rd47haXT7BkFHtsjOsO7WdHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by HE1PR0801MB1897.eurprd08.prod.outlook.com (2603:10a6:3:4a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 14:44:57 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:44:57 +0000
Message-ID: <b980e702-bab7-db8b-9185-5551c354e526@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:44:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/8] parallels: Move check of cluster outside image to
 a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-6-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-6-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0060.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::49) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45daae71-9862-4f82-4865-08da7c7139dd
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1897:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+SdDSOVP2VtpYfpg1D3upMB87Fhnk6K+O9ehsWIo+siPQY08+MEq+cYjIxc+Jhe4e5GbLYnHEO1hSdf7ghQQotYFJ5gGnEAi3aGir33gEzTnkB/WFvPlN4Pl9h2Po+MEdo8D6hNMLT6wh6bb5XUXRzbwHy0jsAs6j+HrKl+mVPtZNpPHBgIbjS7a0TYCJe3BVW4nQL28uw7HwOvQWZ4fqKFtGtcfqSLMIOrOnddwdVhE2X7IMSeEIBss+yb6RnEdX4B2+6SRRBKK1dAzDZJmIKNI4wsGDnGfLLSmGKlLN8rrJMIt98REJHRWw8YWPxeews8Ap5aqWW0Hmo8Cj06h8Y1iwD802qF4okGIrnClM4aeCd7Jdm8eknhcsZ13Oipwqn1jTlmKu7B6MdXmTU/tPMDtCI1vZf0iTl+/RIFQ1eQCN9qYAH7+2aQyfG0qYbA2jJHnmE1jZNgwnx5yBkODFtxJNfKJxQYTdxV322poTbOMfkptxBXjjm3ojeUFwHT1iwG6qUW09k/URJrYgincH1S74AtofZAkIHSMT97Hn/FwVxWZ36GVrTHxcXOmc6WM+A+gOaty7qQlYP710ktQcapwrkdQHLJY0KHXv4J3fazvYbF1FuXaJpMBxSRmEfQe6y2wIO5Hr37rIwByIPsVszZ4ptOJocjDkMcLDIYmaVAMG7gWVKzlpOjDbLVUPA0kfLvD+wqqjp0Zu3TaAuSRu5DTdBIdOP35ldUgQFF+J8NhzrnvnReIVYfTmxOP7kah3VP9Hz2ItB4fpjB9WxawWtMc9FcILWFE9FH29la+ragCOpZpEdPIxQexg+uHEr78uRqJnAX28OZyhw5GbasRtPPNFJYSOkFqTEen0v0qPKU9VWuJDu8w3hpoW8boAxJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39850400004)(376002)(136003)(366004)(6506007)(2616005)(186003)(53546011)(8936002)(52116002)(6486002)(26005)(41300700001)(31686004)(83380400001)(6512007)(5660300002)(4326008)(2906002)(38100700002)(86362001)(31696002)(36756003)(478600001)(38350700002)(66476007)(66556008)(316002)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVg1VDFTaURHL2JPUno0SCthQ2ZJVjFvVnBTY3ZZMm1hVGVvZ0tmaitCd3ZM?=
 =?utf-8?B?eGYxMzFkdW4wdUhmZUhQTW85ZHFLTkllRG1naU1RRE00TnlETmIzbFNZdU8x?=
 =?utf-8?B?NUdqMDNrbjBmdFEvMHRZRTZOL1RTL2Zha3d3L3h6SCtRY2NtRUREY1ljSk9r?=
 =?utf-8?B?dEdJL0g1VDNxQzMyTEhiZiswdG1iemtiUitIS0RydVpOUTcwSDRpblhqa2d1?=
 =?utf-8?B?Ny9kNDRJS0VoT1BTeGJVQ01hdGZ5V0luMW1YOU9Zd3M0Q0R0THh4SEVmUkh5?=
 =?utf-8?B?bVNFRFk1dDBDdUpTaURYYlJyL0RldFhIbXVJNnM4RkcwajJKbjFMUzlHUEtH?=
 =?utf-8?B?Tjl0eVZxTmNmNlI4QW5FZFlDUDk4MHcrWCtxZUtEaWxFZExXNzB6SGRSQk1X?=
 =?utf-8?B?WW5TRU5HVkFuL1REaEdPTmF1dDUreDNiSWJRWXA3WHRwZE50YjJvUUt6b242?=
 =?utf-8?B?ZG9lSU1UY21wZUxybENPVnkyekVrWXIwUzZMQnowbCsveGJDZ2hRRCsza29t?=
 =?utf-8?B?cWJzZXpyMXNxVFd0WDhrRSs3Tzg4VkdIaVU2M1ZrNEVsUWN4Z2FvYTFwTnFD?=
 =?utf-8?B?THFsbHkwbG9FaWtCbUZBZ0N4OFJUbjN5eC9rUjZzMTdRQmNsSzc4cjBUT3dI?=
 =?utf-8?B?bUdhZm45SXBYZDF1dGcyeWJ1WWk1RWQ4QkVtZ1FOM0I4YmhJWE9EbjBkSjUz?=
 =?utf-8?B?QnIvcisrVG1TMDhPcHd2b3Y3eFFHek1KQ3hYWmRNN2Z1cDh4SnpHT3EvWEhp?=
 =?utf-8?B?QlloQWxqeDQzREh1WVZiaWRuZ2JSMmdJclZwd0tpbHphZ2NNaGxDVXRTOFJq?=
 =?utf-8?B?M01pVUt5QjZPeW9WRWsrNXpjb2hycmVCdGxmbkJYTzlQQjRqVmxiZFVyRFRu?=
 =?utf-8?B?RlhiaURNc2xlQVJnRHZuVzN4K2doakIzd1o2am1pK1M3WVFRSm5wOWpYS1dT?=
 =?utf-8?B?UmNiZllBdlJKWnI3d1ZlRTNERzlSVksyS3ZRWnhqTmVwNlEvVzg1MUR4L1dT?=
 =?utf-8?B?VSswQVlOVHZOZ2tXdFA0bjM5Qi80YktyeDJMMjV2RzJQMVJNbHYxQTFBaHhB?=
 =?utf-8?B?MkdVakxTRXU1bldGTVorQTFuUENwd2RUMTZpYjJnNW9LZ1kwV3JHeEdWSmVv?=
 =?utf-8?B?Z25HV1JYZHZuVFFyRlorRjU5ZDdmQmJybFBHY1FnOXYxU1ZtT2FadDIzOWd1?=
 =?utf-8?B?SFQ1andZbW1lV3JFRWgreFNhSTFCN0FlbEwvMWcwS0w3cUhSazZSdmRMYnBD?=
 =?utf-8?B?MXpPcU5udE81a25IYXg1ZlJzMXJJS1k2bWI2cUY0UU1uU050QVNNcmFyQ3Nz?=
 =?utf-8?B?dUV0aDRCYmM3ZWdkVnFFdzMvZ25mc3FkU0FoZGpza1NqQWpLQmNBcWhhc3ZR?=
 =?utf-8?B?UkpibHlSWWRaZkc3Y2F5V0RvMTFHWkdZTjF5VkZkU2tmeG10YlBBMDBZeWha?=
 =?utf-8?B?LzBMdlRvRmMwM2FLc0MrU1lwSFF0Tmo0N2kwQ3lQTmtKS1FUUHNuUC94Wk9Z?=
 =?utf-8?B?UEJWSnVVaGw1WCt2VUVGOUZWMG12TXl4OUFaWmp1NXZEWjRqdFhhM000VFN5?=
 =?utf-8?B?Q1c1bk43TTVxYnRaanFxL2pPdFBYaFZNUUZqcWJhM0hVcWVqMlZRazJJKzJM?=
 =?utf-8?B?NTBkbTlKQkE4SXB6TnBzQlN1ZHdDbzVjQzFmTG81clFsQVIvRy9XdzR4YmhJ?=
 =?utf-8?B?Y3A1bkxPSU5ldXhodkxXNEthUlp3elFRZEgwa0RxSnNSeDY5WVErT3ZOZW5w?=
 =?utf-8?B?NUpmdERSbUp5TkN3MVZvLytEVWMzdlZPeEFranB4NDFIQTBrcG40K04zUTQz?=
 =?utf-8?B?Q3JvU2ZpdXVJSnhhVlAyMENMUTExL3c3NWhxTWpRNFdaUFlITmNzNzFwUE1K?=
 =?utf-8?B?bFVHL2djR3dRSFUvQ0NhKzl5cFp5THhHWU5IbGYrakhROTZSek9PUk1sWEZq?=
 =?utf-8?B?OE5zVUg1OWprblh0K29nNVRPTDl4S0lIYmhBMVRVMlJXMnlQU29GdGFnWFJr?=
 =?utf-8?B?a0gzc0JsMVlyYzRQRmNmVlBKUWxWa0NzRzBUbTJ5T3BuNlBpQ29HQWxoNFVW?=
 =?utf-8?B?Q1owY2hIbFRPM2gxQUR1aXJJMkNEdlQ0eXFGbXAwNUh6NkwrbHNkdmZvWEZX?=
 =?utf-8?Q?AJ/RWC2XzJ7rSw1jCrXezR8w4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45daae71-9862-4f82-4865-08da7c7139dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:44:57.1704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +leBn6X7U/qB38DrPn2QNtnX1KpxdkpUKSE3ae8v1MECTp8dP++Z5+oJKMsN5G4o5eo6t3zcd/eEoFZpid1f5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1897
Received-SPF: pass client-ip=40.107.21.120; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
> v2: Move unrelated helper parallels_set_bat_entry creation to
>      a separate patch.
same notes as for previous patch


> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 48 ++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index c53b2810cf..12104ba5ad 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -439,6 +439,36 @@ static void parallels_check_unclean(BlockDriverState *bs,
>       }
>   }
>   
> +static int parallels_check_outside_image(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    uint32_t i;
> +    int64_t off, size;
> +
> +    size = bdrv_getlength(bs->file->bs);
> +    if (size < 0) {
> +        res->check_errors++;
> +        return size;
> +    }
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > size) {
> +            fprintf(stderr, "%s cluster %u is outside image\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +            res->corruptions++;
> +            if (fix & BDRV_FIX_ERRORS) {
> +                parallels_set_bat_entry(s, i, 0);
> +                res->corruptions_fixed++;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
>                                              BdrvCheckMode fix)
> @@ -458,6 +488,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>       parallels_check_unclean(bs, res, fix);
>   
> +    ret = parallels_check_outside_image(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
>       res->bfi.total_clusters = s->bat_size;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
> @@ -470,19 +505,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               continue;
>           }
>   
> -        /* cluster outside the image */
> -        if (off > size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> -            res->corruptions++;
> -            if (fix & BDRV_FIX_ERRORS) {
> -                prev_off = 0;
> -                parallels_set_bat_entry(s, i, 0);
> -                res->corruptions_fixed++;
> -                continue;
> -            }
> -        }
> -
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;


