Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B9323ADB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:54:38 +0100 (CET)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEroT-0006Sv-QG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErlw-00049b-PF; Wed, 24 Feb 2021 05:52:00 -0500
Received: from mail-eopbgr20102.outbound.protection.outlook.com
 ([40.107.2.102]:39955 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErlu-000122-U2; Wed, 24 Feb 2021 05:52:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEn6gWm4bhetOBFVIjIdCT89VtFjRAc+IvxFodResUVNBhRGprAB0rVI2h+oC1zHCieiBMFnCTIEJ7vEHyOzj9iwZY3hPGZMGwa9bXYTvNUkiFn6a9lXS4uMH/AmQYGYzuyywf0sYu6crkr+L6dRy1UY4yw3tVfV1/+m70MYsI/vWs5RbWT9yMmF8BGmDXtvoq3sJgxY93mhtGvjj2+RnUug0S2pB42ODtf58qHRiLlTnh0g7ZntNfQG+vgHMWnCZ3iCVmYOsHIeSeroiHI4750wz0T0thB7fKUvwNYVrs6eFMqCWWIY9KKp0ngDIzQHstJ+7p9ueaJK9tg8O9omXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/fHZVp1JvG4ukz1IGSy11XgEXpJJQpvqhvLGZt1Q0A=;
 b=hpXraMsZax6l6DUPBXj62aOoNnzRTEiTy35hAWxDapK3MQe5b6xrUSLgESuetuS1O2eeKQrDye29Y3kDVnri2NBTk4n75I0toJenlNS5JJbCl0pJ93ryJET6RTKGdDuNbvubbmc3jIt1r3iyS54Ph8b5MILdTIv/tvH+R4vAuY7hEceS7LpAHLWI7nRIdQRA78q/b6Rszqg/ziDueL12rj8HxUT1DOdWTssXAAXy29cDiZo1diRn8bkvB22NI45wf5TVBsnFdYLyi+0X43adkWlxT5FuhJAGcTdTHgILF+RSqhwm4iSXiY0moe+WRnjCuT6Hx/DZVGYXfq3ms1JPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/fHZVp1JvG4ukz1IGSy11XgEXpJJQpvqhvLGZt1Q0A=;
 b=YiF2lTjsqSYq8+sM6hybspzxhhKuJJ69x8SsOhqNW6zCc5hi+4/qNq58+W8qs1SnXcgf2K6UlhrrhH4lV3jboiqUCq8JKcLLOGd7NUY85cxxZRYNQQUruyMyiAkmNpsWLt5aodeRF8lICNgRl4HnVmQOHAZzu+Lfw9IlH3cOyXY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Wed, 24 Feb
 2021 10:51:55 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Wed, 24 Feb 2021
 10:51:55 +0000
Subject: Re: [PATCH v2 3/6] block/parallels: BDRVParallelsState: add
 cluster_size field
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-4-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <0f316f09-558e-db97-7bbb-9d9db33eb300@openvz.org>
Date: Wed, 24 Feb 2021 13:51:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224104707.88430-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.8 via Frontend Transport; Wed, 24 Feb 2021 10:51:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b84db2a9-9549-4336-c769-08d8d8b2339b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471402058E833642FC75C97B69F9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5yVZJBLXeIEyVqTl2dCTLYqkqTKAEICQMJDSrrZD5zswnl771mB52ThIdJRlS4xXaR0nLzRHY56T+BMtksnTF1S4qDqqOnuVZnuap1p25hQhub4dWunMJmgnUP+WJTsLm/Bo1VrnMXzdv4+m4q0RliRF6n73fbxfF0xlNjzxba67Qc5dRG7ciOLAn2FPFP9sjl+WuA/ghds899t06F17agmX3x1G8oHCXE65t8XhK2zvWMPMMUOtnoUg46FKDZBw+Nh8rMDUlMuUQ9QD4gJ8mDnZ4/VUJsAZlLYZcp91thDWnVXmxVBIgLe7KODCArHJ8ASTzmi9NFApFIa2ert60YwqkXde58VLjdRDBL2mnDnslsqJX2Ao2D1fCRN+dnXVlYlG1oKzV3koXP9MwKZi/vrI2VPwaK78SvIyziq9RXKBie0WkjARFYu0b7UcrSe8e1H6qGTDK6zTg4QMC8UWiLDOhnUrpYwHSGVE3ok/+yO07+Zh54zesYZciZo2NXYjZiYDU8ZSZGSZsFmauFF/Bvm2AakPvsDKq2cxv1qlQG/IY6MW1JRIwQvsZzcWyU6IzDwyzt1KT/5ZI10LtrF0280bBMNckbfpmAZi2pm7HI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(366004)(396003)(26005)(2906002)(53546011)(186003)(956004)(8676002)(4326008)(83170400001)(52116002)(66476007)(31696002)(66946007)(16526019)(31686004)(8936002)(6486002)(83380400001)(2616005)(36756003)(5660300002)(316002)(478600001)(42882007)(16576012)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzhBTXh0a1pRbDVVaDBmbmx3VUcxSWpYTDIvRHZxaU43c25zRmk4N1dEZlNq?=
 =?utf-8?B?bU5hL01Bc2wyUVdLRzhuN3Mxd0hwdENqM3ZKbEVzN2hxY25idFlpZUhRNVVG?=
 =?utf-8?B?UDBTZEFYODlFcVl0TitIZTQvaytLU2w1UG5Rb2w5U1hlSHFkelhIWkdyTmVG?=
 =?utf-8?B?NStSQ2Q0VjFZRjVKSTVER1lnTFVQSWtoSEVSZUwzMDMxMmVGdFE5ZHZ3OTZ4?=
 =?utf-8?B?MmV0WE1KU1MwZFJwVGNUUDMvd2tOY3QxdUFndlNzbDg1U2wwdHZDSXB0TXZp?=
 =?utf-8?B?ZEpKL2Uzc3NwRjJ5VWlmamwxanovMUF3Q1FZWGI1Y1c3QVZYU2oybTFIWGo3?=
 =?utf-8?B?NzNodnhKeFArWVRaSncyaW1UY1dUaG9VaWJ6QjJoZVp4RmhPWEE5UVZHQk5y?=
 =?utf-8?B?MEFxdUV4dTFseFNsQkRKcG10TnNraXVEWm8wYUtxWFFKQ283MGFVMEF1RHJC?=
 =?utf-8?B?eVA2cmpIcWlkdGpYWERWSlhjRERoUWwza2hTaFg0alRkc0RvODZpSzhJSXZQ?=
 =?utf-8?B?MFlPRW00QW9lSVdvc3VUWisvNnB3UURTNDVlWmMxY3RMdjhvT0VvMmVKZDF6?=
 =?utf-8?B?WjYxM0JSd3hHWk1BbExGanh4ZWtEM0hRWmNnUlBhUXdnUm1hN2NlR1ZKUmZU?=
 =?utf-8?B?eGMzWDQwUmF0NWY4OVhWVk56clliamVxMHhtSUxVODJoQVRxUEFPYzlUc2w1?=
 =?utf-8?B?VndwcVFoMVR3eDFtZmlEdVUxK25lSlc1WWRjUUFjdmFoV1MyWjR0NFpWQkFz?=
 =?utf-8?B?L1JjMjI0TkQyc2ltTjlCYkdTK3d6RXRCbEJBSGFFNnhLRW9MZVdxWkVPdUFt?=
 =?utf-8?B?N2dOUVQwejlUM2diU0V0RHBYQWUycG1wRkdmck90d1BPYTBuamxOaVFYRHR4?=
 =?utf-8?B?MXVwT3FJRHhlRW5IRDNiNUZHcnpjYTNJMUppSWVPY2E3NFNBYk1mY09TYjFj?=
 =?utf-8?B?OCtjNXFBY1JiS2prNmhJeEZPenRWNWxUaUtVQUt2WXdlZyttTEV0V2U3WDdH?=
 =?utf-8?B?SHV6VjJ2ZGRtNGFudHBaalp6bXhPUytaNG9YS1IzUlZYeFlhQ0J6SmhTaDc2?=
 =?utf-8?B?OU5LWkswczFMOUtZVUdRbjRMUE5FWDJZbm9zYlVndjZVaFZ3eWt4NjBOZnVP?=
 =?utf-8?B?V3JycXZoMXlpT1dTUFlTc2FDbmNOQS96SFJabTdMNks4bVpLZ2pJV2xnL1N6?=
 =?utf-8?B?TDNrY0pRVHp0bTkwaktjOVNnZ1RsOWZiei9DRUtORHBOWjdPY3I2V0xXVEdi?=
 =?utf-8?B?MndUYlRMck54TndqajFzZytoWjlQa0k4N3Nva1dyY3oyUmpsZjBLWkdCaUFI?=
 =?utf-8?B?WWd2NGxpUExISXVRY0dIcmVZaXFjWXk0Z0preGdzTjlCeWN4cXdwNVU2anFB?=
 =?utf-8?B?Q09iNHZRSjF0OHl0MGxhNUZMRWR2TVZwdmoxZnRTbkNtRkNHak81Ym0rM0Ux?=
 =?utf-8?B?cEFzV0orTDFSR095aVgyNFF6SW1wRnl0V1BvT0ZNKzBHSDhta1g5ZCtrb2ZG?=
 =?utf-8?B?V2VlRldsNGlFeHhTOExpNGxJa0FKc3poSFFDUUFraVdFSEVQUjV3YjB4Yk9y?=
 =?utf-8?B?cmhNSHcyd2MxRCsvSGhyYWFhd1dvT3RmamZsTGgzMlBsb2x3cCsyVUVEVWFR?=
 =?utf-8?B?RllFUDdYK1UxMmo3NitiVDByd3cvWUl3QTBqMmg4NEVBdjQ0eWFEdEg2NFdY?=
 =?utf-8?B?QUVyMzI4NVQ2OFFNeEdacjZsa05TblJVN0NuTllDbEl2YW05a1dTcHNxTDU5?=
 =?utf-8?Q?TeRK6/OUWtMKJqbspPUtTETkmq/53UzC+hZGnyB?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: b84db2a9-9549-4336-c769-08d8d8b2339b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:51:55.5570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ft4B0kxidxnZx0G1bX1H8LvBV9iQ4RD2RA9pcN6PH96miP8UXoYbhBRonx0RGJfngrzn+Uq+AQVmzTK59VkWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.2.102; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to use it in more places, calculating
> "s->tracks << BDRV_SECTOR_BITS" doesn't look good.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/parallels.h | 1 +
>  block/parallels.c | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/block/parallels.h b/block/parallels.h
> index 5aa101cfc8..9a9209e320 100644
> --- a/block/parallels.h
> +++ b/block/parallels.h
> @@ -79,6 +79,7 @@ typedef struct BDRVParallelsState {
>      ParallelsPreallocMode prealloc_mode;
>  
>      unsigned int tracks;
> +    unsigned int cluster_size;
>  
>      unsigned int off_multiplier;
>      Error *migration_blocker;
> diff --git a/block/parallels.c b/block/parallels.c
> index 3c22dfdc9d..9594d84978 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -421,7 +421,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>      int ret;
>      uint32_t i;
>      bool flush_bat = false;
> -    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
>  
>      size = bdrv_getlength(bs->file->bs);
>      if (size < 0) {
> @@ -472,7 +471,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>              high_off = off;
>          }
>  
> -        if (prev_off != 0 && (prev_off + cluster_size) != off) {
> +        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
>              res->bfi.fragmented_clusters++;
>          }
>          prev_off = off;
> @@ -487,10 +486,10 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>          }
>      }
>  
> -    res->image_end_offset = high_off + cluster_size;
> +    res->image_end_offset = high_off + s->cluster_size;
>      if (size > res->image_end_offset) {
>          int64_t count;
> -        count = DIV_ROUND_UP(size - res->image_end_offset, cluster_size);
> +        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
>          fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
>                  fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
>                  size - res->image_end_offset);
> @@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>          ret = -EFBIG;
>          goto fail;
>      }
> +    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
>  
>      s->bat_size = le32_to_cpu(ph.bat_entries);
>      if (s->bat_size > INT_MAX / sizeof(uint32_t)) {
Reviewed-by: Denis V. Lunev <den@openvz.org>

