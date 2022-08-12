Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2C591265
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:42:40 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVrz-0003C2-0e
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVoz-0007fS-Hp; Fri, 12 Aug 2022 10:39:33 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:37159 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVov-0007px-Tr; Fri, 12 Aug 2022 10:39:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOHHVIQeZywcd/fluyCX2VzoPrkExVJ5iCRlZmYLkAhPQOGMXM1PzxM8CFonlvXqVNHzOo/gFiiex91l423BfDrRkt6g7mOxcUvlIOgMqMMowjjbAfICvv2PElk5EyqYhA9nZs5T5vdKFhXNNLl71RTxwMbfU033ViluOuqtEcAOEkMZsO5QnlOr+Pr2NWL3qrfiMH/0IEQ6fJ6cOJ+IhW+gqPf7jYM/PXAp3PTCDadMrbkjGYH/0zsCFKfjWclMvrcpokLFXGVcXZAbB4F7iST71z4vIZNDy5Yc5c3JtTVdDBy7F5NXsJPPi1OhInT0BUy7uM4ulyJz6tBITL8Eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRaNibhOR8tmTxpWnbOGKZscOGx0LCIzpU/e8jFXNCI=;
 b=PRbJikL8NGI6aGyHBQ6um3gEmrWgiCG3NoNNPDo15D8jgPxoxQer9++NmE6HLcntQmF6kfOopMd1ynpWR46xE5zRpihJfIAZZHewAstN3rrlMqwNgZGuyyHHaKySxAp0Cx4A3Kj7Dx3shDsJGpBpT1XA/Fa5xjZxeii/yX1I3GN0M2VdrrNic3I9ERwCQZDt0uXzK7rwfXh5dKr/exhiqNGrs40rMdLxqfJxaeA8NmBera+ATqdm/eGf3zIr6YLJJXyxPRVeyuRMM5sUW2Jw1ElG8U3ALEuOu/lkgKRk3K0kKzyl0mdfhDNJWje4FCeQEUb4LqgmSBHdczCE1M3vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRaNibhOR8tmTxpWnbOGKZscOGx0LCIzpU/e8jFXNCI=;
 b=yUN1QRiBKjuEYtNHTqXe2/CocWBgmYMXVG7mWQw0m32s+YeDXpL89s1uMwqaMO75VMgdljibPphVVOOqCY5OWggI3u3zUrC1frF6ccSphlkXVJwJR71FTjBBCuoX5HQgBc2bHPNqQE10jq3CSC//bQdwXxF6P9dCZmcNVCxGK7vrvuW2bufo442W4bLeeHeWQ5w4FNss3g3oLR1AI8mRc1CjT7voS2ZJsDtcyvJtcP4wlKU1MBlm4QTzgwd/uWWKyP3sCGloOiD9YuHmfgECI5shv3DvUWX5iGES7TJU/zHKgPcY+Egl9Xb2BaZM3vXjCorJJ5FYL7glNZqWyF2UPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM5PR0802MB2403.eurprd08.prod.outlook.com (2603:10a6:203:9f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 14:39:25 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:39:25 +0000
Message-ID: <0a37bb60-57ca-abdb-f4ea-1cdfeca8d8a3@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/8] parallels: Replace bdrv_co_pwrite_sync by
 bdrv_co_flush for BAT flushing
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0061.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::14) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5571e1c-1125-48c2-7e4b-08da7c707445
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2403:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddA9EuxuxmhxQDlK88oAuPdXE+N4d3AVREmo2gB5iK5Qv2wv6RBsH2PpvuEdd6B6b31UlhxBJXl2vMgNJY0pUjMwOC7iGSy5BB591nrHgzXR2uoYG7kGmqurifA0g/ny/my7zxOXA8TmLZ+BoU36LPrf4fJBjlYxtbJZPwC+1j+I9vPTELQJvB7dY9HhexCesTDNgpIiLgsQva/XBT/fpqFfLYvpHaHr+GgRXEwy/rooEjMKkSATMvJ8RY9sQlCpL1yP/hnwxPLZkXbUMh0z+Ej6kUyYepz4u9jCwWGEemaq1RhCsouc8ApBim2cPKh9GTHl166Y99k0hS4ANlfuATmbQwxwd5cK15ng2XJ1FxHfqNAk5fo6XhNEFykYvrXTn2ybY8AX0RdaAsUkzRrBj4vYNlaH26zr28Vi2+ez8OrPz+MTgIe8+EJuzCaK5XZkvnO+K+g341i39H1bV7O9MhOCO8ZMG9DNJlojCaT4M+DgXJ4HtzzfGh9OTWtWKXty0moCijJJVLAbtbCCppv5ngB8uRFkxdsDMv31YxMISqLS8iyhzJmJaJRiNIn656kxVmyhhOfJyeYW4J0PsCN9jXp2Q1a5pKkLte4DK4ZPPR/e1CmNQ2h4hOjxs6xnLKqjAdLx/e8HbqPkTBu5BNMVVWy8LnnxbntQFzGcMpr7iqf9pwkJYWUbGr8OGTWWcFpXNnmmt+k/pmzqq6juGz8bIiGLm0QgbTz24PSkbrc4UvMz/9bUgLB76CBT0NKRYhP3kU2FRDVdxx3WbnhqgmnjSvFyNHhJ4L6oo/P6IRHn8D2m6FYPrnDLMCvmYPbdTlad
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(83380400001)(26005)(52116002)(6506007)(6512007)(186003)(2616005)(53546011)(38350700002)(316002)(31686004)(38100700002)(8936002)(66556008)(8676002)(66946007)(66476007)(4326008)(5660300002)(6486002)(2906002)(41300700001)(478600001)(966005)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhJNkpyQWtOejVya1g4NXhlSDZ5QVlzVmttQlNXMURuRzBrbWorYWtZOTBE?=
 =?utf-8?B?MTc4a0g5YVVSQXVyTDI2alhEK3c5bzJURE84NVo2Z3QzallmRjJoMTVyWjRp?=
 =?utf-8?B?MGMvdC9DcWZrd01meHRPclRzVFUxelhmUExHZE9ZMlRQYldxTTNaZ2VoMEkz?=
 =?utf-8?B?U084bWR5Z3dia2ljRmU4cFlweHAyS09kbW1PM01reDdPcWFSWXdVOUZzaFk3?=
 =?utf-8?B?dys1NmNYR2RSTkdXTkp1MU1sYTMvZ1BkL0RLSVVVQ3NWWDRaczBCT1BNMEdE?=
 =?utf-8?B?U0VjYTVGanlWV3ltU1NIeVh0T2NHN3ZWYmt6VDM0M3BOR1Y0ZDhaemEyM2xU?=
 =?utf-8?B?RXVOV3dNaFRmd2VZeStLb2NhcWxaTkM5c0diNlVYdG1Fcm9vb3FiSGRJVmQ2?=
 =?utf-8?B?elVhVHhUSU1obUJONmx2WTZ4UXJMU2tqdWJGa3ZhTDYzTHBkbndGZ3pOTnk4?=
 =?utf-8?B?NWhtWllNN051cGtoUzM3SlJxdDhnSXlHNnpOOFlsZFk0YTZ4d0tHaUFwcmky?=
 =?utf-8?B?dDdITkprSmsyUStqYXFjNGJ0cW9sQXFsU1BsZnpla0h4VGcxbXM5Q2RqVHJ0?=
 =?utf-8?B?RGNaMXhRN2JYNzF0T0lhNSs4ZXBBblk4Y1VxSEdySHFNWjcvUytVUDh2NFh2?=
 =?utf-8?B?ZVFQelJ0NUFDWUx3NTJqVTRsSUtoeWsyaG1hYzhkMGw5ZGpDbzYxNUtJM3hM?=
 =?utf-8?B?Yk5SRnVqWnVGbTc2OVdMRG5ObGRVOEFPMGd2b3FNa3Z4ZENnQlpKYVpRQjhs?=
 =?utf-8?B?cHU2TVFwbVU4Q3ZBb0s5Qm1yMWJ4VTI5S0hoa29RY05xRHI1N3BpV2RyZmx3?=
 =?utf-8?B?RHlzV2NLcy9xQnJGOEY0SllWa2ZSNjhkUVNEeTBzUEtoVGVwdW1WRSs4ZzZE?=
 =?utf-8?B?ZGRkOTU5YnpNZEdSMUZIeWltMkFlQXVib2NCc2VDbFJaZFJ0NzYyT2dOdFhr?=
 =?utf-8?B?OW5QSEROcGRJakExZWZvUU5vS01QZ1F0YWJhYzlHeEFSbzAwaXBWQ2VQeVhE?=
 =?utf-8?B?aEw0cDVPMmxDL1hGNHNjbGlMRlpuemFEaDBOVG5hVUVMb1dTR3gxY3JNc2RE?=
 =?utf-8?B?TTQvRnVIQmtNeVUyQTd5aDJxQS85SHNwQVF0UDlQMkJCUlhNekdNeTNVV3lJ?=
 =?utf-8?B?bHUxR0VrVGdVWWtyOWljcVdtMFJSWGZjWm9aMm5GOW4yN3Y4TVpKTWM0cHFh?=
 =?utf-8?B?bHZ1a3Y0dU52ZTd1a2IyenNaUnY2ZkFWMUYxaHhpZ1NxNnBZYW00NEJsSXhn?=
 =?utf-8?B?MHFWaGxzTkx1THU0Q25mTXVKNTVoZWsrelJ6dGJQbW9oMnluRThudThKSElE?=
 =?utf-8?B?QlZuVGkvN2ZhMjQzV29FQU9zU3ZQR0VRRHdlMzRwYUhqS3p2UXk1cGZUdGU5?=
 =?utf-8?B?elEySjlEcnpqRkdmVDBVQVk3TitLVkxmZTV3bVM3NXJkT0d0c25NWHhMTWxx?=
 =?utf-8?B?RU9FU2liczBraEtOa1FvRk4xamk4SUY4bUg0Sm5weXZGR3BNcGNxcjZFOVNU?=
 =?utf-8?B?STN3SnhJZ0NMYmUvZ1pRTHNNVnhyck91bWhVSVV3cDlYUUJkdi90QVZFNWRo?=
 =?utf-8?B?bG9uclpJeVg1dWUrMVR4OXF5MjRLNnNrQXVZb0ViK3JkV05jZkkyNld3TE84?=
 =?utf-8?B?MEtmVUFVcU93RzJFUjI3L1hPZjZTa1pVVEVDYk50eVE4UGpzWjNFOTc1NHR1?=
 =?utf-8?B?Vmd1V0d2OWwyb25ubTFUT2FvaGtGR1M0eS9pWlVtSGY5V29XRHNyNHRrTjlx?=
 =?utf-8?B?ZEMzSjcvYlIwL0tVK0RqZ1Mvc0cxNnhwTGhTUjRGd25GTU1zU0JBRm1WaFpz?=
 =?utf-8?B?U2NZak1iNTNZZktCckNZSWFmbmtQdVNmODNkNCtEL29pZnEwWU5tTjRIVnBP?=
 =?utf-8?B?WFg1bmRPSS91a0NBSzlybW1vU1ZUVUxKTThIU0NmS2tPQXkzNHAwY2MzQUlX?=
 =?utf-8?B?MTNHRzFPZFhpNzBPYzhkVGRkenFPQmVYdmVrd3hZUmMxeW1zdXE5RjNMZnpp?=
 =?utf-8?B?UnMvamdpRTA2dnIwTFdIUXRMVENWcytIaWxwTUpGRHhJSjNHd0JPcjBVaVR4?=
 =?utf-8?B?MTdqREptTEV3UXp3UklTZUlldEhLaUs0SXpKdUprcHpVRWF6ZXZQb3h3UHpW?=
 =?utf-8?Q?GWCi8wsyuTDzgoGhPjyokhyF0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5571e1c-1125-48c2-7e4b-08da7c707445
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:39:25.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGPk1ub4z0et+YAX20YHuXcGOoGTiIJN/oCgxTKnZi0gAJPEV6Sz5a9aBi2LsobVfrJL1vVWn6r5lzEAy6z4OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2403
Received-SPF: pass client-ip=40.107.8.91; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Use generic infrastructure for BAT writing in parallels_co_check()

On 11.08.2022 17:00, Alexander Ivanov wrote:
> It's too costly to write all the BAT to the disk. Let the flush function
> write only dirty blocks.
> Use parallels_set_bat_entry for setting a BAT entry and marking a relevant
> block as dirty.
> Move bdrv_co_flush call outside the locked area.
This is not correct too:
- with a lot of cases inside parallels_co_check, which will be split to
   smaller functions, we would like to avoid writing BAT once each
   stage is complete

Thus the comment should look like the following:
"BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces."

> v2: Patch order was changed so the replacement is done in parallels_co_check.
>      Now we use a helper to set BAT entry and mark the block dirty.
Same note about changelog as n other patches.

Side note. I like Linux kernel a lot and there is a good
guide in. Please look how commit message
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

May be you could spend some more time on commit
message.

With a better message:
Reviewed-by: Denis V. Lunev <den@openvz.org>

> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 7f68f3cbc9..6879ea4597 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -428,7 +428,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       int64_t size, prev_off, high_off;
>       int ret;
>       uint32_t i;
> -    bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -467,9 +466,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
>                   prev_off = 0;
> -                s->bat_bitmap[i] = 0;
> +                parallels_set_bat_entry(s, i, 0);
>                   res->corruptions_fixed++;
> -                flush_bat = true;
>                   continue;
>               }
>           }
> @@ -485,15 +483,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           prev_off = off;
>       }
>   
> -    ret = 0;
> -    if (flush_bat) {
> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> -        if (ret < 0) {
> -            res->check_errors++;
> -            goto out;
> -        }
> -    }
> -
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
>           int64_t count;
> @@ -522,6 +511,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>   out:
>       qemu_co_mutex_unlock(&s->lock);
> +
> +    ret = bdrv_co_flush(bs);
> +    if (ret < 0) {
> +        res->check_errors++;
> +    }
> +
>       return ret;
>   }
>   


