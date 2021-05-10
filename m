Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2923784B6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:07:48 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3lL-0004U8-1G
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3jx-0003Zb-3i; Mon, 10 May 2021 07:06:21 -0400
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:23189 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3ju-0006Ee-Ef; Mon, 10 May 2021 07:06:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTEoFJYHNpaJPapRZhN+NASQDmSVnJDa+bNPJVB8e3YSDvge8wkU3ULLTzmVLQWmGk65VzYo1qkZVWqEQ+tehhdnZwJCJP4Hplx/jaqA9cmgn3syGiCuBqJQld4wDg2No4bJoXXzYFVbGliLjXePl3fci9JchfEtHoO2J6MMdrJn1JZDlohXGhjQApyo1Zr2k22D+0SCALHTzfriy+7gd4xXL7wILoQ8uSJwDv0FK136fjpxFFUh/9mixr3QhUMsGb9TwYtArBC7f6r8DhQtJIC07TbNsjOFA+cXTeKwjgSxFcUsM8lRkSdT/0A6h9nnXpRohh3g53YCzq86qCCH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WjW6K/mMV3X6PobcrZ8bNemQDYI00+t2Ojdppl85Y0=;
 b=cY4FjWo/kQEl0BVgAb1+d4LBwkQMpSlGXRIU7CaqWnd1/9A1gslGQv6emCJJ3t84RhrKoO356rURkN0RxwZCbjkPkjcRKvhcUcBjUr/pbzNh/QlVFQjBAddmZAZhITj50zeetpLBBjd5dygWem3PeT92im/wDtUUnCHFRHnM8zwwYZJeqDLJqj0TCZTWhNSqvsnwWgljkv54U1WezaNmbGvC9C4g8+LJoBlXrfQaBlfs671C+S/5t1M0OLNayDcQMxiuB7TCqQOpkAiKLUvD53+NXwScQpq5HTUFUQ+MRLIU4ycxkm6OGpXQttNRVQrQ6U5RT8u3U191btPQLyXVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WjW6K/mMV3X6PobcrZ8bNemQDYI00+t2Ojdppl85Y0=;
 b=kfalKVpPGlOVi1ql6HXm+e+U++AP5BaRBjGTQGBGYarKJYHM5CAm6Y4smkEY273QZwnFUiNYoV8xougycDeq56hit2BcWedxvNo69lRqploMAkODeoLQzmQ9b5Clo5icXd+L1cHhoqNyqfUko63ch2XjB78hUUAzSRCm3iFKF8c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 11:06:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:06:14 +0000
Subject: Re: [PATCH 2/6] block-copy: let ratelimit handle a speed of 0
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cde97e00-0d57-b1f3-6172-be3e283c13ca@virtuozzo.com>
Date: Mon, 10 May 2021 14:06:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4PR0902CA0007.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4PR0902CA0007.eurprd09.prod.outlook.com (2603:10a6:200:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Mon, 10 May 2021 11:06:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b0a6b5-ecf4-4421-2c04-08d913a3a0a9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-Microsoft-Antispam-PRVS: <AS8PR08MB653373BE1107906E899542C0C1549@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJbyVSqPLS0Eb8kGaCvsUTMSDlzL48Eb833ZYiWVysKjB18G95orm5YRlk9lhUUYgozq/eNds/vRNBggyUt29a56u+JGHQzmcM6b0dPDid+v8V2NYW9rrsBNQ06yz2/zTUnmrO2zDlw8/FU44MSeJPR8FkN+XHsYMrUE88PdmWUVIqOjMOJoQ6xvwRMLNf4ylhp+yyW2o4Pji7Txs88+SyGc+aCVThKLPgXuep7z1hERovh7efkjYiZlQBDt0Z59Xyy92pKIW59ZsA4MQlcw5z1uH0x77sWWF1M7haUc+1lmbSK3S/j9Ci0xtJBVRwiMLhUq6GFWE+cai0VVXixNMCmWodsJr0zGqBfxUmT3ohhiKDN+i4JdFTy4x40nJ+YNt3SHmUDAXe501QWGjKLb4r6xWJZ/j+SeUXQrmu1+q7ugxlv6i63+39lo0GGXd9BEk2cawpoqDLwotTI9BAFLMckgpxOP4+6JVheKIjznqmf761eD2VWz9KfukCKKayKqvaHeLPm50OnFVYmGdwZ26hmCVm4n/B1SvrWXK3yAKQEyKrC02ulNaiilnpMFPI9t2QjhWA4G1CRg13cZ2fAcIqOp81y4/y8kCNkSzEaAbl84H4qVYBgW+gXVhUrqcy6AyJ4VkZFrc2UwKhDbey2/fFGrUkTI4gpvJeea/o/t3E50Q++6LxvRd2jBblCF5o7wNNunvLKzPXfvN1xseHwshtv4IZKOofB8LVsL+d3flHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(2616005)(316002)(16576012)(8676002)(956004)(8936002)(2906002)(36756003)(83380400001)(26005)(54906003)(38350700002)(38100700002)(16526019)(186003)(478600001)(86362001)(31696002)(6486002)(5660300002)(66946007)(31686004)(66476007)(66556008)(4326008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkNUS0ViWEdjR2pPM1Rla2VtUlRKUThRaVhnOUFGaHdta0xYbWZkYmRiakZT?=
 =?utf-8?B?ZThVMGNyMkI5RFlvMjE0YmpYMVBnY0lodXNvSVdjemE4a0UxTDFRZTNUQzZS?=
 =?utf-8?B?YVNEWUkrSU5LUWxYZVFSS2ZmN2NHb1hLNDdzbVNQWFpiQWFOZlRJdDBLSG55?=
 =?utf-8?B?WjFOdGFnTGVvYmtPVHdvRFF3TGM4dVlDMUwzMmt6dXBsSHpKOUg1R0VZNDAv?=
 =?utf-8?B?M0pXYllRNUJjeXZiWi9wWUJmU0RrZWhpbjVWd09QeE0zbjFWOHVBbXlSdW9y?=
 =?utf-8?B?N3FaZGZJalF4YlV0ODZLVzRKeTB2NmkyV1hqY1pxVVhtUE4xR2dJR0lBRnIr?=
 =?utf-8?B?aHNOV3FrZEFkVVlWSmVMWmd1SmtVYytQZENQcE1iVjZKVElIaWcyck1vVEU5?=
 =?utf-8?B?czZCa3g4MTVnUmpLL2tMeUtyaFdMRFM1dllEaUp1WDlBL3ZkOU4zUzNYdmVD?=
 =?utf-8?B?aGwzcDRxOGdGN1QyTnJkRk93dS9GWm9RZzlmL2pEbTd1UWFYRkEyNnR0REs3?=
 =?utf-8?B?aE5zZzFVNlk5Y0x0NUpsNjRWMm56TUdjaTRzZUU3WHdyZG41TEdhN080OWcz?=
 =?utf-8?B?TzVwNnBkSHZtTC9WM0h2SElPVXJYR1E3N3pzREtPV3ZJM0pSTGJSVFNnTzhs?=
 =?utf-8?B?eFBiZ0JPV3hFMmk3QVltMjBvV3pPWXZNbXBYQ0o5L1BvQ3RGY1ZkQngxNlEw?=
 =?utf-8?B?UnZZUEFUWXRNc2ZmdlNHeEtyc1dyQk4yQStSUXExM2RZWTZqWUh0YWZ4OUR1?=
 =?utf-8?B?MVp6QmdoZnBNcE1TN21BaHZLOWxtUHlzdVlsN1hBR3ZoNjZqSmg2djkyTEVy?=
 =?utf-8?B?UFprYzlvWUM1RDZteWkyN1IvbmFNMlJkY0hZMjJDYkx2NjB1djRkYWJoZGZB?=
 =?utf-8?B?TFV4Y0tTeUM5ajhOeVVoeHdoMTRObU1QK21wU21obE5VOUNBQkRBdTJDRDdn?=
 =?utf-8?B?bk93b3M1L2ZSc2t6bmZiUGM4LzFhL2JzaERUUlNwQzVNL0R2SCtpZTVHY2Nm?=
 =?utf-8?B?WVRYR2xUZStDeHN4aWxadUZJYU4rLzVJeVB4S1dNcnJGSDczUkFQcnZSclVm?=
 =?utf-8?B?SVRITUh4V2xBeFRRR2Q3SElRZHl0U3FwR0ZlQU1hUFdiblIrQlptdmREN1Bk?=
 =?utf-8?B?Tmxsd01WVUpwdVdqSnFCc2lrQVlyTmtFcmZNWmM1dlllOVB1bUZweTY1bDk3?=
 =?utf-8?B?L0ZjeTE0MEFobkx2N0VOWU5TN2VETjQ4M3hTZ3g4RU5HUnMrVjdURkl1U2xM?=
 =?utf-8?B?SytIeVBuOTZFOVRVZGwyZWJiNzl2VFBZRjFYQXRwNkJrRnM0ajIxVnlJamdi?=
 =?utf-8?B?NHFMV29URk0wVWdzWFpvWkR4L1JQVG9TS1QrQU91YjBmOXo0Ui9rRFhVNVl0?=
 =?utf-8?B?NXpLeVZteTE5ci9vNFYxMDVYY293dzdpWkdyMUV2SkZzRXR5aXJSVHZtc2J2?=
 =?utf-8?B?QStyYjZRWlo3a1Y2dFpyQ1IrVmRZSDk5anJEeWlEOVJEbTFFYXVmaStnQ01N?=
 =?utf-8?B?WTB4U2J5ZlJ0N3pQV1JkeGhLSkdrYzRGaXlTcEdKUzdxNCtaTzlZMy90MUYz?=
 =?utf-8?B?ZHkvVndRTkxLdVl1NmFQMmYweVFSMnk2RTM5dlNhdS9MOEhSZ1huR3F5MXJU?=
 =?utf-8?B?MGtwMzhJRFIzaG9qTTcyWDUvV09mMDA1YTdEZmVGNkVCT1MyZDVLdnUxVGVF?=
 =?utf-8?B?bkd0cWgxbW5rbGV0OWorQ2NJT1hmUk5scjkrSUh3YmpPcDZtOUJ5YkxQTkp0?=
 =?utf-8?Q?QLOKTMJboGxv4M9PtRX49FqdSx5sgc/CKdhHxv+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b0a6b5-ecf4-4421-2c04-08d913a3a0a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:06:14.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miLFfV2Zosj85mh6VN+6DCMOypwdLcf1ol7TCyFFKXOl8IjSVFPGkV9JZf7vzLS3HULGHCI/YVVqkHuf1uGw2CzuhOsrSRjjeMqUkTm5W1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 28 ++++++++++------------------
>   1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index c2e5090412..7e9467d48a 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -113,7 +113,6 @@ typedef struct BlockCopyState {
>   
>       SharedResource *mem;
>   
> -    uint64_t speed;
>       RateLimit rate_limit;
>   } BlockCopyState;
>   
> @@ -619,23 +618,19 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>           }
>           task->zeroes = ret & BDRV_BLOCK_ZERO;
>   
> -        if (s->speed) {
> -            if (!call_state->ignore_ratelimit) {
> -                uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
> -                if (ns > 0) {
> -                    block_copy_task_end(task, -EAGAIN);
> -                    g_free(task);
> -                    qemu_co_sleep_ns_wakeable(&call_state->sleep,
> -                                              QEMU_CLOCK_REALTIME, ns);
> -                    continue;
> -                }
> +        if (!call_state->ignore_ratelimit) {
> +            uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
> +            if (ns > 0) {
> +                block_copy_task_end(task, -EAGAIN);
> +                g_free(task);
> +                qemu_co_sleep_ns_wakeable(&call_state->sleep,
> +                                            QEMU_CLOCK_REALTIME, ns);

indentation broken

> +                continue;
>               }
> -
> -            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
>           }
>   
> +        ratelimit_calculate_delay(&s->rate_limit, task->bytes);
>           trace_block_copy_process(s, task->offset);
> -

I'd keep both newlines around trace_, as all three calls has no relation to each other..

>           co_get_from_shres(s->mem, task->bytes);
>   
>           offset = task_end(task);
> @@ -825,10 +820,7 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
>   
>   void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
>   {
> -    s->speed = speed;
> -    if (speed > 0) {
> -        ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
> -    }
> +    ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
>   
>       /*
>        * Note: it's good to kick all call states from here, but it should be done
> 

With indentation fixed:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

