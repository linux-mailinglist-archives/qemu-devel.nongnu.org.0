Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3405B09FE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:22:28 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxop-0001tv-4R
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxiE-0005ys-NI; Wed, 07 Sep 2022 12:15:39 -0400
Received: from mail-am6eur05on2126.outbound.protection.outlook.com
 ([40.107.22.126]:3113 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxiC-00085L-8y; Wed, 07 Sep 2022 12:15:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5myYNm6FMke1PAkIOjlrc/wpdPI3/wbmFT+8LVO7iio31XhV+46ANa21xe6N+npf5WM27fKOTtTmZE4H4KWnbOmct+IgJPX8BDjRauzb36sJTYkx1ZUNdj+ixSEs1sYU2cEwixtgTJcmB9Iy49o/pVoepmtKrtA0RC73EBZoGmMebXFocuM8IFP5sSwWLgJzIek4f973MPnlJm+nMdAktBJqOEunU5adF7gtoTxOtPt3K7L4ZCrdmi2n68QhwzcaxocL0pjxC6dJ5P1pyolrKO1TcKes7TPIbrLfp8FxSyLSE9H8Z0dm21LxyvOe2LmvynrgmF+D1qm7fxBJzWpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=di8l8RGB8RZE7Q1UHXxt2vfDkvzrxUksj/qdDpdcN3M=;
 b=XTiqtMvX3p5AA8A9uCBhgSD9P4G97F7XIe9l9IRt4WcuOwXIaYjwDiqVnffmnUH37ROFQMsO2wdKIjXW8TqLzF27OhCHHOEJZ7Ur6lv1SWQonfmfFVjRvJPDprm59xPg4jMJhEOcpfomb4j05fActG1pPkUCyyj5gfFTcS3a6iIDCCmA+wL1m2FoRJO9BGD8yiQcsrikymRIqeDZBZRAJe6r7JQSBtjs1XeJLcQyyzRU6Qqc1ZXxqhS63WmlFxuXV4XiM/b5a7py8KOvcLOKMwrmta0udOGUAxzEgGG+obVjKGkwjTroYAeaHMqOK957s19fByS3ZdIuQaJQ9kL6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di8l8RGB8RZE7Q1UHXxt2vfDkvzrxUksj/qdDpdcN3M=;
 b=JZmMHAMtD9BGOaEYvWeliXPkNactlSjMHj0Gv3HeAbCkDzTZLZg4Y8G40V6FRbd6Jud6LPrXqDbLYlgynq4kEaRwt+PU5HCEVtXb+xn4gdQYlGK0JdKAOFGdPRpM9kv7w93P1rm1LNR4ZH6TflLxoo+p8icA/FJ3XJDCPglMKeU3csubSW273V7qEPYMnX7cfwLu5UO3XDtW8Bm5iVD13IoClLOMnNDEvv/TK8J/51yq8ucdZWI5j2t7zZrieThE85F0Lz+ZSeqg/cPlflzINkiBs2J3YJouP/e8vlGaX+WrD7JIf5B8WNUldACVxwQFm2JIpiVsil6Yzp6ECOblPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 16:15:27 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 16:15:27 +0000
Message-ID: <5434cc56-d7a0-318a-bf88-111014ae5c89@virtuozzo.com>
Date: Wed, 7 Sep 2022 18:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] parallels: Create parallels_handle_leak() to truncate
 excess clusters
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0129.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::31) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6af7bfff-8c75-466e-cee5-08da90ec2d60
X-MS-TrafficTypeDiagnostic: AS4PR08MB7429:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tv5YvLoU0uylLWcrPgrDHul6+vVNNIhXMEEkwfwFiPMkualgep8rbugR/khUV5XN5RlhbE2e7Vf7RBXsZZv5bRksyqo/bBDlXVEQBO0LncG65WGxG6jWoinVGg6SYmFSax1n58CdOQinsgYFsXGy6TaMzPkvc+SQEW+9A8aNfzvCNb21J3Zc7bTqzb0jnw2dQp3A6IVOZ2EOIzHny4ndeLgMxuO20l4tBdh1iq5yyQykZGYsbazaxWALzIhWj9qPC8Ap11AKU4wxe5SFS5OOxg9vwraaSGPV/4mma0R2eWGv5JvIlOMLalKQG6UCSluJBk2wcadQ62IJ/ZP+U6bKRV/WZvMt4BJ4IiZ0X5StOI6Gxwxhhn28zTW3NZXoGyo9+3g1/KsoEbkaIpMznYr7RCOEOqxHP2bjtfG1M3Sdn82BOvkvvbWytKeQn6YIVhf5NZzl4CJ9KgoZNFp3eXeZej3bTfe3ilXjqMtwih7m5UCVjgjEJTQ3fPcyVY0AQ3kfSyRaa6NQqeQ1Hrp2nTjoLiKzKcxnHwjUFdS9A+Opw2kOb/j60eLiE0FdyB+hYlGs1/ayNE+Xacb2DqkRh5dasi5hAQCFHTftgrZM5NT/qKrpkMTToeqhhCeDfomtOnOaIpQBwsZOe7ikvERZcjjpnLgAOisd0HJlkeKeQ7YMald53gqjAttEgpAyLk+disyrR1Qw9q7mai/qMBVAJTlT+tlGdVFs0yyaO/9Ne5fpfotK9N9poHKtTVK1T4DPuYUA5JOo9Hh/0lgfPG9v/phczDSeSmmWhSuLpP/WzvwrAjcjuvwDRJPBwzL9QqWMlegtV0ikp5DCUXxXY9FtSyKmoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(346002)(136003)(39850400004)(376002)(83380400001)(31696002)(186003)(86362001)(38350700002)(38100700002)(6486002)(31686004)(316002)(36756003)(2906002)(478600001)(26005)(8936002)(6512007)(5660300002)(66946007)(66476007)(53546011)(4326008)(41300700001)(52116002)(66556008)(2616005)(8676002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWpxVGcxd0xoZlRna244aXFHSFpaNXBXRXUvNFpLYTJENVFkcGQ4RnZJNERQ?=
 =?utf-8?B?OW1Yb1FrQ05oZWc4YW9ST2RqMVgvQTJmbFBaQ2t6Mml1VGFueU1nQUhFN240?=
 =?utf-8?B?dS93NWROZW5Ea0hrV05OUGk0REs2OURLVW9WcDMxS1F0VEtrVFcrejZPejlP?=
 =?utf-8?B?QXc5VFZxWThRc0N3cG1xVWduTzdOYzM2WWdzcVZnSk5oTGVDNGpraGNJOTla?=
 =?utf-8?B?dTg4N0pyNjV5b3hNSCt2bUpEZHNzK1pUeFhlTGc2M0hISGNSUGZXSVFlU3pU?=
 =?utf-8?B?YUp2T1p4T1dCdUZUbEp0dDRQVUVLWFpwMmdMYjQvaE1ITno4L2dTcVNVZTZq?=
 =?utf-8?B?b2c2NW5QeWVkTCt3WGk5NFUwcFBvM3RpakJVeHNFMkI5bWcvZDJRQ3hKdG9m?=
 =?utf-8?B?bEtlbjRuMkJRaE9lTmNkQXpTZDUzTzc1dFVNenN5c0NjcG1hSGZVb0dSRWdJ?=
 =?utf-8?B?VzFuKzBLcVE3akh1TktSLzJiZDBWUUYxVnlQV1ROL0dtcUVFMXdCUHpwZkho?=
 =?utf-8?B?dFBobFlqc1QyNzFNanhRK3BNOUVRREo3Mit6NlgrVU93MDNZSUx0MG5sbTd2?=
 =?utf-8?B?YTE4MjJzeWhnWmFSUjVnQ3llY0xCVFJzdTBGdU8rSHBFTU9GN2duck4veWhs?=
 =?utf-8?B?OThHVkdyZHJvZ1pzL2dsaUkrUVp0Nm9VU0NKcXFUa2ZqNkVlNmZQb3VtaWJv?=
 =?utf-8?B?ZDFreUdqcXAvQmo2QTBDaDhuSTFsc0JFcXR2UjQvdi8ydlRHQzU0bnArOThE?=
 =?utf-8?B?M3FzUUcvWUNMS2VXVHlrc3lTY3A0MGdGaVNzVStKZzZHaHhuYVoxLzJMeGxv?=
 =?utf-8?B?OTBLci9RSy9Qd2crZDBEeHRQdGNqRmVCc3VZUkpxbnlxa0lvTXJVV0RrMU1t?=
 =?utf-8?B?NXE2THRuR0cxTDhuZW1CMlRLbUsvV3hJTklsTDdHSnlZTmJxYXBqdXZqTHE5?=
 =?utf-8?B?MlBWVzdMbENIdm8zNzhTdnBTUjBGTXdGZklyQmJLa2gvTTU0VUIxcUVmWUp5?=
 =?utf-8?B?U0xjcVlGeUJTbUhXSzE2dUN2Y1JlRlZLMTU5YVRxZEdlKzRvSDJHVkN6Ulg2?=
 =?utf-8?B?SXpiK1MvYjNBNXlBSlQ3SlBES2xhQjRia3VaSnVJTS8rUU1PMktSN2pQZnpa?=
 =?utf-8?B?c1l0UWNCRUx1NitITVMvWFpmblFmQlNZWVh0TDFNWTE4Q3FocXpXMTBLSEQv?=
 =?utf-8?B?bFB3ZEpzMmFmaWVwbEhPRUlBYTZZQnpTNERBUmpXWjdlait5azE4MjJXYnFt?=
 =?utf-8?B?OE8vWHFiK1QweEd5U1U1SFh5ZktUVlhmQkdialFVdmo0eWNrUDhZa2ZnOFlp?=
 =?utf-8?B?L082eExwTjNqWEQwWkhoeXI5WGpSYWhKTFpJcTRnMG9RdHhnckY0ZEFaYkRV?=
 =?utf-8?B?WFlzQWxSbVJadE1TU0N6OFRuekVlVWNBSEFMVHVoQi9FSjBESjJkNjJWTWNu?=
 =?utf-8?B?RDJqQ1FVVTVWSDV5THRBTWJhZW1xQmtHdGN5SEJCbHBOWngwSS9wNmhlaGww?=
 =?utf-8?B?Z2dIZGxyamRraGZjRXNEQzhVbE5PM25tM3V4WVNyWXoyNDh1NkpoR1RSR041?=
 =?utf-8?B?TlJDc3p3dXgrSnM3MDFBYVd0dXNxM1BVYnE5OXZUYXpaa0N0cXRJYUxnOFA0?=
 =?utf-8?B?MVhldjFKSGlTVHFOQ0JvYUtNZHMrYkpyK1JHa1E2NVJ6N0kvMW1BcXlEU0hy?=
 =?utf-8?B?NXJuWGppSDF3UkJmK0RhZVU4aUtZaC9hYzk5ek4wa1o5ak15ZUMvcUs5VXpz?=
 =?utf-8?B?OW9oOFdOMHBJSGg4S2hYZVNhd2dSeVNMZUhUM2lYNmFCVmNLSkRVcm5yY1FQ?=
 =?utf-8?B?ZjVtU1dBU1BkODF2RWJRdHgwSC9oYXIrK280d1JWVFI4Rkd2WThXcU1sWVdM?=
 =?utf-8?B?cEY5U081c3puUlhIZURBbVBXZDh4M3ZSaGoxLzNhcUlMQmRKMHAwR2VBL08v?=
 =?utf-8?B?aGQwSmtzWVVxWU5TZFZkeVNSWnZpU0dxK3hhVmhQL1kyQzgrL0tkYTBuZ3hq?=
 =?utf-8?B?akV6eVpldUNBY283bVBLRXROMVVmdHl2S2FMTUVzZGd1emsyV0pmTHlJSElL?=
 =?utf-8?B?Q2g3Z1ZCWW5wUnNvUVA3Q0NHRUNkUzJ6emxrUGhtakc1MW5LS2Y4VnVEdDI1?=
 =?utf-8?Q?6HRFRgBB/YS/Wyxvp0gL8Zffu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af7bfff-8c75-466e-cee5-08da90ec2d60
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:15:27.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3rElLVoZFoZviEdnaT1Gf7RC84LYfgMk8N2hna20IginMl7o0sh1UXVHvMwN8ILBckiHRJRUMNqq7GSESEfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7429
Received-SPF: pass client-ip=40.107.22.126; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
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

On 9/2/22 10:52, Alexander Ivanov wrote:
> This helper will be reused in the next patch for duplications check.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 65 +++++++++++++++++++++++++++++++----------------
>   1 file changed, 43 insertions(+), 22 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 7b4e997ebd..dbcaf5d310 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -475,37 +475,23 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int parallels_check_leak(BlockDriverState *bs,
> -                                BdrvCheckResult *res,
> -                                BdrvCheckMode fix)
> +static int64_t parallels_handle_leak(BlockDriverState *bs,
> +                                     BdrvCheckResult *res,
> +                                     int64_t high_off,
> +                                     bool fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, off, high_off, count;
> -    uint32_t i;
> +    int64_t size;
>       int ret;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> -        res->check_errors++;
>           return size;
>       }
>   
> -    high_off = 0;
> -    for (i = 0; i < s->bat_size; i++) {
> -        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > high_off) {
> -            high_off = off;
> -        }
> -    }
> -
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
> -        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
> -        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> -                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> -                size - res->image_end_offset);
> -        res->leaks += count;
> -        if (fix & BDRV_FIX_LEAKS) {
> +        if (fix) {
>               Error *local_err = NULL;
>   
>               /*
> @@ -516,13 +502,48 @@ static int parallels_check_leak(BlockDriverState *bs,
>                                   PREALLOC_MODE_OFF, 0, &local_err);
>               if (ret < 0) {
>                   error_report_err(local_err);
> -                res->check_errors++;
>                   return ret;
>               }
> -            res->leaks_fixed += count;
>           }
>       }
>   
> +    return size - res->image_end_offset;
> +}
> +
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int64_t off, high_off, count, cut_out;
> +    uint32_t i;
> +
> +    high_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > high_off) {
> +            high_off = off;
> +        }
> +    }
> +
> +    cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
> +    if (cut_out < 0) {
> +        res->check_errors++;
> +        return cut_out;
> +    }
> +    if (cut_out == 0) {
> +        return 0;
> +    }
> +
> +    count = DIV_ROUND_UP(cut_out, s->cluster_size);
> +    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> +            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", cut_out);
> +
> +    res->leaks += count;
> +    if (fix & BDRV_FIX_LEAKS) {
> +        res->leaks_fixed += count;
> +    }
> +
>       return 0;
>   }
>   
I do not think that we need this helper. See the note to the next patch

