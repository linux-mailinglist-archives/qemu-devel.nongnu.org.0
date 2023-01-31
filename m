Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735D68319D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsgI-0006Ln-6p; Tue, 31 Jan 2023 10:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsgF-0006In-R1; Tue, 31 Jan 2023 10:36:19 -0500
Received: from mail-am6eur05on20706.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::706]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsgD-0002mQ-OT; Tue, 31 Jan 2023 10:36:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XymE0dtF2+EftGtKsCzUwbukinYjqWxOzGIkx6JI3KjwbQvIlcKm+7uucIp5xfh/HS1MMdVeJwr8w+qe+IFFViKbRX3YXolzRk9OXVaAk25AodYmEdYRx8pAOdD+BPmmkE0YzEwTj9wxC1+pnd0YKrzD9lp3KmasUG7Ott0+TM+X+VE3DeKFwZdoPeMsvjj8HEf1fBN9TsjHS6RvyiOxXsFZ36Afi3lqQ6wAWxu547xMEm1Hd3h8cqBw0uqQW7Y04Pi6vZo7d3/0nRt4smzW7zsY5VzU3OR87i30QrT/UrI+oB5n9r/pPYicEF3oKACfiFazD5jCa4eHQOtiKy/XCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMONCHT9vgnF/7f572PhvukPBiBbyLc4O0u48AJgbkw=;
 b=VLAoaTWNUchg5luDdUWTLGecxF0vGecvpwyAkMGgyosk5mKrI4r1UJtLiAajE9YpdURfDwRa1cWqIPnPpwM+tyL7kOH8Hw0OzQ5K8n6x9XZOuZd48/2P8GbHq+42SQ/92TESTgmCqQtFwDdEvWmWuFvQliBx3StZC+3wt2hn3WcnLVJwybdculRO2IphJYVTK18j0dnakDXdBdD+QCVFkmbxiJO3oA7d1ZvdDoIXJmCaPPFgZtitGnl6OETP0DVt86bC4AeUgj7KKQrFFK/k3aqhbgiuLkOWW+v+S9VQC9yI0nhYNIStdpKtLvSe4BQhc1I3zhVJct0Vtee3vq6RLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMONCHT9vgnF/7f572PhvukPBiBbyLc4O0u48AJgbkw=;
 b=wLeKC333NQuEnPhkL9l66L5SjAF9///GBh6Wr0+rvpJ6U80SwRXnpaktr2ER/TDnyverudA03MvpilzWSXtilc/UYIR4j+xWhQErygJvu0KvcUqltmPjBAGUDMeAossska6Nl6p2h/u8amRzUUlG/WZBq7kJELGV0kGitu+77+OHeTkInWxy4XSXM4jtYQlKfzGLN5GRr38E5Z/r06JQ/LgbvAcihp5+drW576LfvdYurTdzfF3QLTg7envOlHG0G+sY3AuQ54L5mCVdPojwGEhd5wodccNfUcctPve6SLvtJsqrnLq/Qs8OtJsxW4JkwpDwYMNcURF/2H+Z+k/Seg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS1PR08MB7587.eurprd08.prod.outlook.com (2603:10a6:20b:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Tue, 31 Jan
 2023 15:36:14 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:36:14 +0000
Message-ID: <289ff2ed-fce3-0fa0-917b-7e009d904aff@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 09/12] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
 <20230131102736.2127945-10-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230131102736.2127945-10-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0271.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::38) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS1PR08MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f508ef3-75a9-4c4d-15b7-08db03a0e30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Jk4EHHMylT3FuQ+CC1NmKj5tG1mp25bV7QLgGf3GKTm/npAG+CHmVtSwVrXWvfbgRnvsbaTOU3o/OMZuo5X//+YCfY6opDolpAMwBMVe4aLWwOWnrrMUTNJcaDD3x/3TBtxkkXw4un9zQNqY8cPa8Qtne7jT/COrXK0ZjbR40G/9ZVsAwPuIgAf83QVyEV7Stc4FsMbPCyVrQte3OuZt4OabBU6dEtU9oZWTM/woZDG4hKTPEgUSo7CleWQkIUGS+g51xXpjJHNjB6Ed3weD4/KiseuQaOOcnuDJ5OAalh0cxTp6yzKoLTs/LwBIK5XAVm2lxkVa2KYW8BweP8zuBZ1NL0PniO1F+VcxDUqrFdV3BtLdt3967zvBe1RWtV5E7YzCV4YIpUcmf7HR8VVaSn/Qqa1NT3NvXuUvpxR+jgAISFW3cvoyfM+7KyyG8c5QPPdWYh9HUryNvQUfLnpAqO5qYJEbKl66ZGGVPA6Fuq/5UY5prj/T6Lo97PHfAQaFjWF9tRkEgyU3ShTm7uKYufsQT9/6vwWtja8daYqj3XtZBFHjZI4mzC7IDRyrQRmkhitQ6MFYqI7hFN+xy74E6Ewz9i0yCrPyPQkHpS5vxsMh5Mzpv/XR2ElkHOUMdilD/L49f8PK4RcSmsgdGZLf9liIzFZrgHK9DEpH6SFfgmSzorTxuql+8V8OzzUlA6TJRoLYEO3hGLmxVYcLvPZfR4nSU2rFtfS27f5gAwd4SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(451199018)(5660300002)(6512007)(26005)(478600001)(31696002)(2616005)(6486002)(38100700002)(186003)(86362001)(6506007)(53546011)(36756003)(316002)(2906002)(83380400001)(8676002)(8936002)(66556008)(66476007)(66946007)(4326008)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNjOENmZXY4UXFBUCtwR2dnS3FBcHFIVndHNEZWWG1FYmhqa04xZkRYZEFl?=
 =?utf-8?B?WHZlRXNxcHFBbHVQVzdVcWxYV1BZZHFUb2x6cEtwRDh0R0V4VGtDMlcvQk94?=
 =?utf-8?B?dHpXVWxLSFF2SmZ1blpZVGo2Q2tpMHlHWmU4TFR0M2RyQXF4MXJSVkl4Rlhw?=
 =?utf-8?B?OE55Szh5U1J2eGJBR0N1Z0ZvY1lBZjNRMVZSUnErNi8ra00xMURabSthWHZG?=
 =?utf-8?B?UFdnNGlNclZMakJ3cTA1endJdTF3ZUdVV2tjZGh6Z3lmUnNuZnBqUHFPNCty?=
 =?utf-8?B?ekNQeDR0OHBWMzIrNEs4NW9QbmpQQW9haU1jL1NqbDZMcTNXT05JSnhRc1hm?=
 =?utf-8?B?VzFHUXQ2SUZ3dGhVbXRxaitDY1pMcUJ4bXZiL2hueEdyczNjQnNsam9NdVhy?=
 =?utf-8?B?MnVKWHE0ZTZnWlpIOVF4RUMrK09vSXFOOTRzOFo4UVEwUUVsN3NBR3lqVG52?=
 =?utf-8?B?WFZvMzFxdkJTNXRZMjhER29OTVZ6QUNiOXkvMnR6aUk5c0JuYkQrN00rTlpi?=
 =?utf-8?B?enpHWVpRK1RJS2VJMHdNNHliU0tKdzh3c3IwczNRVWlrS2xrTEt2dVJjYUVH?=
 =?utf-8?B?Q0NKa3hoa1FsWDN0Mk1wWlo5VzhndnhFTFR3M1AvbmJvcDVUUDlCbktYeklw?=
 =?utf-8?B?bFFOWXZnNFFtZlJrRzVqdFFTM204UWx6MkJ1RlVnem80QmJhNFA4SkhiN0Zy?=
 =?utf-8?B?bnNtc1R1TUNRV2xLZGgzRmthVGFYUWxLM1hmK0ZOQXRhLzJtditMUjJrOVBI?=
 =?utf-8?B?eEVadkFNQ0ZwTzUvcGVhNTJSOVFydHJBSXA4Ynd1MEZwZ3dYK20rTm1KcXNE?=
 =?utf-8?B?WXdhcVJGOEM3azVnajd2c2RKd2N2MkJYdXEwYThISFNXYysyamh3Q2lES0s1?=
 =?utf-8?B?L1ErUThuSEQ0UTNrQ0YvMkpNam1ZYkk3UjVDTXVsNzNma1JKTm5YS01NQ29x?=
 =?utf-8?B?VENrbGx2ZnY2MXFhZ25QUlBraTI1ZmlWQ0pXSlIxd2h4UUFob2luc1R2SERn?=
 =?utf-8?B?V1hYZUNZTXA5UUNjSlJENFRwTVlERE1CQVQ3RTBEam1vRUVlcDRDRkdYRUVJ?=
 =?utf-8?B?QVRzQ25ZVVJzQmRINlA2bVF0QUpiN2xaR0tySHFFZnVUNFlNSGVWQnNsS1pE?=
 =?utf-8?B?MDlRNDlKQThOYjVNUUpVMzUzaDdKdVJrdUxSTGRNc2RDL0FQVkt4eS81NUxh?=
 =?utf-8?B?K050b0VNYnRIVWtCYU8vSktoMGFIUmI2OXNaMUJreTZjQWNYMWpHcG1YWlRi?=
 =?utf-8?B?NlRCdGFIZ1VINk5xME9NNXlIbVZSdDlGWUc0MFROSGtjVDdWZmFPN1VlQ3NC?=
 =?utf-8?B?d3lkRzhBeU01NHZtRDB5OGNLd21qbTJ0cGt5Zy9UamVJWWRJWk0reGVTOFB3?=
 =?utf-8?B?NEh4UlFpQzFIYlVqeGIvNU0vdGc4eGFERXZaRHdJbG5zYndxME5wWVJKODE3?=
 =?utf-8?B?V0Q1UFVabStuRkZEaXA1bUJvR0ZwTHhPY1VEVGdYZjYyMzFFS0tnSFVpQVoy?=
 =?utf-8?B?clp6aTBZbml2UitKRzJJLzBDOHIya0VJSUJjb2M5WWtKUjFQMkxBdEhFUEtD?=
 =?utf-8?B?SVA1LzdMd2FVbmZVenNaZklIKzdyU3hyOTVoZGJiYnd0Z1hCK3NteFNmMUxL?=
 =?utf-8?B?eWYxN29ETUZpSkFFWTdNcFk0eWkvRzlmMDR1THdrY2dFUC8xa0RuQXovdmZL?=
 =?utf-8?B?VUlZQVpXeVp1U0lERUNpSngyK1lWa3h1alY5UE50K3hkNTNNMTlSNFpOVWhI?=
 =?utf-8?B?YkFnNXFmQS9CTDY2cjVuSXZPNTdHVThLcmdxL05QSzBONzVoTU5yaENXWXBW?=
 =?utf-8?B?eHFuMWxKb0txN3E1ckVrakZucTVTZmF5TUVqZW9zak1JNVpRd2NCMklldE1B?=
 =?utf-8?B?eFhzN1gxZHArNk1yZ0NhNlRhSlpIU2FyRjlpVDd0NnlhTHl1WmEyRkxMNm03?=
 =?utf-8?B?S1hnRkxqeGJrWWJydk5DZzdBUHBpSGt5TXR5WGN0ajhQZHJ4alFPazV2ZmhU?=
 =?utf-8?B?ZGhMN21yL09yUVpBN0dZOUQwenlNV3pVckhSWW5uQStNZXhWdUp0dmY5bTBa?=
 =?utf-8?B?VEVJS1l2bWF3OHg2VTJFczExU0QrVmJsbDdpa3R1d2NvYTg5ckNGNk10dTVP?=
 =?utf-8?Q?eX0yOIxMQJ6lXRyZa6Uv0mvNV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f508ef3-75a9-4c4d-15b7-08db03a0e30e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:36:14.3621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79MjUYC5YzSwpxZS0s7C4FqSout0lQV4ptE1+4nnuLBIxioOW+U1VSoDEVWNUtF5TFOGIu8hv32SLLNNNbIJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7587
Received-SPF: pass client-ip=2a01:111:f400:7e1b::706;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 11:27, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 85 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 50 insertions(+), 35 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 7382c01191..eb39db53ec 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -480,14 +480,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off;
> +    int64_t size;
>       int ret;
> -    uint32_t i;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -495,34 +494,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return size;
>       }
>   
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
> -    prev_off = 0;
> -    for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
> -            prev_off = 0;
> -            continue;
> -        }
> -
> -        res->bfi.allocated_clusters++;
> -
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> -            res->bfi.fragmented_clusters++;
> -        }
> -        prev_off = off;
> -    }
> -
>       if (size > res->image_end_offset) {
>           int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
> @@ -542,12 +513,57 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               if (ret < 0) {
>                   error_report_err(local_err);
>                   res->check_errors++;
> -                goto out;
> +                return ret;
>               }
>               res->leaks_fixed += count;
>           }
>       }
>   
> +    return 0;
> +}
> +
> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> +                                           BdrvCheckResult *res,
> +                                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int64_t prev_off;
> +    int ret;
> +    uint32_t i;
> +
> +    qemu_co_mutex_lock(&s->lock);
> +
> +    parallels_check_unclean(bs, res, fix);
> +
> +    ret = parallels_check_outside_image(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    ret = parallels_check_leak(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    res->bfi.total_clusters = s->bat_size;
> +    res->bfi.compressed_clusters = 0; /* compression is not supported */
> +
> +    prev_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
> +            prev_off = 0;
> +            continue;
> +        }
> +
> +        res->bfi.allocated_clusters++;
> +
> +        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> +            res->bfi.fragmented_clusters++;
> +        }
> +        prev_off = off;
> +    }
> +
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>   
> @@ -561,7 +577,6 @@ out:
>       return ret;
>   }
>   
> -
>   static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
>                                               Error **errp)
>   {
Pls no unrelated changes

