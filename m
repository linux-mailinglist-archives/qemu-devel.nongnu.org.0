Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5845B08E9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:44:05 +0200 (CEST)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxDg-0003QR-Fc
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxBb-00019q-03; Wed, 07 Sep 2022 11:41:55 -0400
Received: from mail-vi1eur05on2094.outbound.protection.outlook.com
 ([40.107.21.94]:47936 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxBZ-0002Oa-Bm; Wed, 07 Sep 2022 11:41:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqiNezocdO2zLuK1QYh88D0ZhLlFI9Xmq7ILqrkKG5dmW2VxJOn9aWZrFuwl7Caocn0ctn7KGDH6reeIipzqtEcrOsVE262mMXP2RHOjCvhvtoTZtCkXKzlWTNXh5m1UCw01SOtlGvX4NqF+6gS0/m+Q/lnVP1Lg61idFh6XbvGefEcAHluqnKQO52PAXd7tcc8Tcd3UZ+E2nFQ1jAdC/xXYOjCVvQEHG3xIj7dxM0pQsxulGU/2USXvragihIqSPUl0lU8SVWoGqkp5gRH8lzBEKuZtTvbOl92NRkDaPvvtHgKekJ58q+vL6SI3+KA4TSNtyZ2ttCWDZvZNagO4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z0WWH0z9pIcropaVBYooBIxe3ox/i9Wfm50nzCtero=;
 b=fCiJ/5Hp3nknbScdF/L81JAq0IQ72WhQysPFRqDfF078gXynMFaKNv9Mz/MhPTvCfAonJ+aTCx5PnTv5H3Oq1RxgcQkJqajwE9VuXNHKh/3u1mZ/lcSs+wDl5btIVYZYVR55Yd8Xp9mGEi3Rla15x6lTyrrRtUNdzTTcXmYMJYsESPH3FFcit3CuAZd3XSJ1yOLiL7VVbXKtiNTXJB6P1ASCKwbPwBRwN8DqwvanX5RoW0SSeF43c0QijMjQ6jBnMtTqHx48DfkIPKuwRmou2JLA4PEQBn6RAOIGobPB+v/qfoaoY1MY0cgzg7O9RU6LgL0a7RanEHKIXPINEDy8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z0WWH0z9pIcropaVBYooBIxe3ox/i9Wfm50nzCtero=;
 b=MoywJJsVOdd78fApVv3YGkeDO99mBcFYPabY+esLs6aB/NUEELAOtcoOaYXtHxn3ys2u56DOtvtAek8RfZNJe8RJzZYttC+XnkaR1b9HI+Ey5JKWdEqVzFl5x1DC9vINrwt/Tn8AGvI+ApMJ6ORfmiVgxy58kjBQyLuhhnfUjBmOz5Ma3E6GeBfQl9HRfPe/EX8CjZ7CVyas+ge9KctiXB9SdlHhTIiejmFMlQg8UZC1zh2KLlLjQl9stNowSZcKCnyoVVbXfy2Vxg48rKcBvwkSZCpILZ3BpqJTzs32bVJIHlyPzHZEsqAAGLIbaFC1El+Sd3whzHqeHZM1UwuSQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 15:41:49 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 15:41:49 +0000
Message-ID: <661d7c13-90c1-b645-05ea-bfe07109d00c@virtuozzo.com>
Date: Wed, 7 Sep 2022 17:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] parallels: Replace fprintf by qemu_log
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-6-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-6-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0167.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::24) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43465288-200e-497c-073d-08da90e77a83
X-MS-TrafficTypeDiagnostic: AS8PR08MB6200:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C24qMvP2SR1b1NE9owvCdjtlT0M4r3SKaS58hyvj/ZqvORhoMHe4k+op4Gpzcp/vaptQHqt6wGpeHIZHsBcpuW1+S3jV92Ps4hGt7X0FSbU7lUit5h9/xdiYqAbnmn16IWIvSXDJEyD3tBHaJNrofWQQUbKM4DWrPdIeQrFRDWLU+uzdgpMMl7RFwPyE1qoziaeHWwtQTDz+XbojwIS9HTYJExsW3NvEFlPJW0cgDy0EWMOBiCI4KXL5aULfU2D++vtiWCkGMAjwFko7IHgmneRabHqrD/4MEQjCBG3sVmfQpAhvoxk3tHgGZuWyP93Kk0lsf/dQFiTDpkTgugtbvXUI4LuC0JGpTz4zzF9DYFqqTJb67o3A5tSk5D5+pS54Rs5AYiGeMVyVdQwBEnjMly/gwm6QY2vy0IJl4UbLAcYx87PeW0/1n7EkLer/HIbi/RcE54eMzZa8bauV1EXmZGAx5GKF7mt7y1kwz6LkANmTwI7+80/T00NBIlP00mwyPdj5YKf7Eg8QFm6v08hf6SChYZomTNL5GWU4MB3Is5kPtRG7Ai8WeJnrrgiVXCqOICkHHTGeOjVqnn9rDbtaumsPGO/Hi6S4DZELtd3aNEP69KVjL3qcVBmlSXFimf3ZPISyZaqf2wJ0rG1tM3ClP2xNhJ3+3hBXKj/yc1cNtoc5vr6J6Upn4k+DxczePj1hK/c9rKDG+HvOkcm6oayv9xPq7Qa8i9icj+vTR+F8dLkltsBIBSiTUW+mtUARHCU69hVIh25t5VAN+aCv6BZ2975mIjs8vF+ag4LsAmdHwb9QHeY/i4zhUGIRTcgR3j+FyCk62fZRQrQj99IK/ONXUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(86362001)(52116002)(186003)(2616005)(31696002)(6486002)(478600001)(41300700001)(26005)(6512007)(6506007)(38100700002)(38350700002)(53546011)(83380400001)(316002)(5660300002)(66556008)(36756003)(66946007)(8676002)(2906002)(31686004)(8936002)(4326008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWlZYTVqRXhDNWxsQTJUQ3dtdHBaR3NsakluaUlqODExUDJya2VwZ281S3Yz?=
 =?utf-8?B?WFVMSXBvRENjM2xPVStjb0h6UXFYcUR3QzJsbWFwOEVEUW1Nc0d5RU5oLzhk?=
 =?utf-8?B?MGUrcW5lZW9qSUFmdjBKNmlsVjhYRTVYRU4wV2JUV2xocUdDb3hYRmF4WXJn?=
 =?utf-8?B?SmtiTmQzVXF0NkFPNUJPTC96U21UT21xZVpaMUcrbkpPek5TaDY5ZTJhSkxU?=
 =?utf-8?B?RDExNndGZDhPZ0lya3dsUFNISUdUc2h1UzRsTEdWWHpCZE9yU3gxMlV3RVgv?=
 =?utf-8?B?UnkyYitJWlVteUx6eHhrVGZWd1h6WHBBN0M2U0tqWnZSelpvL3FnM3FBV0Rh?=
 =?utf-8?B?L3RmRmFRZSt0d0lVWHpNcnM2YWhaQzE0Z1ZSbktNSVBtWDhWN09CN3dCTEln?=
 =?utf-8?B?U2dlS05VWkdabXo2WTR5RVhNMjBmTWQvTTJweFkvTGlIQkZpdlFiNHlWYjlu?=
 =?utf-8?B?MythVVU4TlZZTVB6SFhBbG9US1RFWG1hR0g4aEw0ZHhsd2RLMkNaYTRpTitu?=
 =?utf-8?B?MzFwRGxqNlViVlE2RllaUXdwODJtdHh0cWNkRjBOdUI2NVIwMlRHNFRubDNi?=
 =?utf-8?B?K2ZnNXJiQk1SU3Qwdi8rTVNmT2U4YnRoeXpDTG1wendDTk8xVUJVQnVLb3FR?=
 =?utf-8?B?L0JpemxDQ0dZdDk3NHd5eEhSS1pDS3hudDZNM0FRR3BpRUY1VVJlbGFocDRH?=
 =?utf-8?B?RURVSkwzQzJ6MzdsUWlEaitDUjBnNVI5UVBpWjFaL2dkLzBPMEIxSkxsTHFG?=
 =?utf-8?B?bWh0blMzc2hUNEk1K2tSN29MZXNlaFJTN3F2VUtLUEVzeSsrMFgvOE1HNjk2?=
 =?utf-8?B?OVk2ZjZFYlBiblRsODg4U0kzMjVEVnIwSkVNY2E1NG1SQ2VCUHhBZER6a3Qr?=
 =?utf-8?B?elhpYmtpdlZmNjdmOHl5VTdSajU1TWVZVXN6RVRTRERMV2pOWlZZVUM3Q3hB?=
 =?utf-8?B?NVpGV0Njd2N5czAyZzRRcFFhSUdKTkpsaEsrVjBFK2ZnYS8wT1JsUC9RenBN?=
 =?utf-8?B?Q3gyM01pQXQ5ZGxsZUR6TXMwcDlHMVhCaWw4amRRRG1NamxYV2s0MVlsZzds?=
 =?utf-8?B?Q1NFQ2twTjZ0T2I4d2ZuaW1JM3ZqaDMyc0hOWkZYNkp5ZFNnUlVmM3RCdWV4?=
 =?utf-8?B?R1NqWk94MzN4aVZpTmxuWjJndld3V0FqVGZ3M3hEY0pUL3RZNUFhQXVEOEJI?=
 =?utf-8?B?WXRBL1NsYVk3bnJLajQvalVsQUZDcERwcjFoR2kxTTJwckxndDh5cTkwWk5q?=
 =?utf-8?B?RlhrMnlaUjA3MU16Y2lqVkdYQ1Y5RjYwZk5UKzdOOEhFN0t0aThWd1BiUHpF?=
 =?utf-8?B?c2VEeXFCenVMd1k5K0R0U05GRUtuY2l0QzJxN1VJWlc2ZXlJYWZpaWpXamtl?=
 =?utf-8?B?K29nQ0cveEo2VnZJY0hwUVVCZm1Pd3RqK00wMkNPRmc5VWwvTFkrRmtrckhR?=
 =?utf-8?B?Rk9jcHM4Y1paSUR3ZVdTVGRQcHhYRGJwWW1aa1lwb0tEN0V3ZEtBeXc1N042?=
 =?utf-8?B?YzYwZXdBNGhNVWg4byt4Y1RKbnE3MUhtTUFyNEtzelk1VHY2WXNycGNlMjJG?=
 =?utf-8?B?ZW9INFNlaXJIVlE5Wms2VUpKMGFOdjFHdFVxODUxRXQ5NVlRa29HY244Y2dS?=
 =?utf-8?B?RDlUb0Y5dmVQaUNoRHM5UzVEWWt4Q295YXppbDNkU2JwSWs5YVhSZzFNL096?=
 =?utf-8?B?ditVREpSVGY4ZEZBa0hzRFFFNEN5c1BqS1poWXdFcHREcytaNnd5ZUtua3Zt?=
 =?utf-8?B?c1JOVHFMbkx4S0U0dG54bDljM2VJU3RrQVFrTng4dUc5YllsZVlGakdTU2s2?=
 =?utf-8?B?b0cwYTZXOTJRL2E1T1Q4cjQrcnpLYy9oRlk3eDdzVysrTlpYZnBiM0VwaVpR?=
 =?utf-8?B?OFlXODRaTVlSaHR1Q2s0T2NEa0o5VUdRY2pQQnRHT3pXOElEbzdHS2xIVnRD?=
 =?utf-8?B?UHVoTWo2b2Z3TVhXMDNvWjZ0aU1teTJacHlpNHNEQlBuWU1EaTBBazFkSGxa?=
 =?utf-8?B?aFJ2WThmTm9PZCtFRVc5VEJmM3VvQmU3aGU3K21Rckd2MHU4TlQxTkIraFZm?=
 =?utf-8?B?c2xNQlZoL00zRjdkLzkwQ2E4bmRWcmxrWVRRZ0h1VGRWTkQ3d1RGWTNndCtQ?=
 =?utf-8?Q?GMQIKZg5R/px5Xb/Uh25vLAXi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43465288-200e-497c-073d-08da90e77a83
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:41:49.4848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKycb9kLC0qXSOsxhr+itAwVudx9xnFeJFotDX58t5FkiuCMy7U/i1WPPELZGx17BtKRBlIN+XYhVpcrTfUixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200
Received-SPF: pass client-ip=40.107.21.94; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
> Use a standard QEMU function for logging.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 688aa081e2..08526196da 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -42,6 +42,7 @@
>   #include "qemu/bswap.h"
>   #include "qemu/bitmap.h"
>   #include "qemu/memalign.h"
> +#include "qemu/log-for-trace.h"
>   #include "migration/blocker.h"
>   #include "parallels.h"
>   
> @@ -448,7 +449,7 @@ static void parallels_check_unclean(BlockDriverState *bs,
>           return;
>       }
>   
> -    fprintf(stderr, "%s image was not closed correctly\n",
> +    qemu_log("%s image was not closed correctly\n",
>               fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
>       res->corruptions++;
>       if (fix & BDRV_FIX_ERRORS) {
> @@ -476,7 +477,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off >= size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> +            qemu_log("%s cluster %u is outside image\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
> @@ -549,7 +550,7 @@ static int parallels_check_leak(BlockDriverState *bs,
>       }
>   
>       count = DIV_ROUND_UP(cut_out, s->cluster_size);
> -    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> +    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
>               fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", cut_out);
>   
>       res->leaks += count;
> @@ -600,8 +601,7 @@ static int parallels_check_duplicate(BlockDriverState *bs,
>           cluster_index = host_cluster_index(s, off);
>           if (test_bit(cluster_index, bitmap)) {
>               /* this cluster duplicates another one */
> -            fprintf(stderr,
> -                    "%s duplicate offset in BAT entry %u\n",
> +            qemu_log("%s duplicate offset in BAT entry %u\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>   
>               res->corruptions++;
formatting is broken. next line after qemu_log should be indented with 
one more space.

I would be happy to get more detailed motivation, which should say that 
once the check
will be called during normal work, tracking of the check MUST be present 
in VM log
to have some clues if something will go wrong with customer's data.

Den

