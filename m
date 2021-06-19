Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C63AD9E8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:06:32 +0200 (CEST)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luZk7-0000ew-7u
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZiJ-0008DL-RD; Sat, 19 Jun 2021 08:04:42 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:9156 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZi6-0001y4-Gc; Sat, 19 Jun 2021 08:04:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSVKSZXXzn8Hh7hzc1T52yBVH8/y0AHLb9j7QzIenIHGJKyBFOZF+guoEHcTaqKjlePxSv9Lpm+lkxbfCeY3JSagAtrX7JT8/U1gG/jqTFaQKAEasVVN4tGMrs8Ikf+CdJNFV8S3eUtZlWvp8mWvo97OTea0X5N11fDVFQWdl8cSHfpmWgmPjjtT86hZMnXAX3yMzzYPnAQgvVPp5X3J2dBcGH4l3fK6kbkGoe1uI6B//96A5pTRkuTCHwFgAki+L63wY3AwX/vB9SRKU4NSGFeWRs2oD6orxEpINOonV0IHUpbKFd2WeHn3ipRATfHSK6FXWBd/IlJ/jvKOf/ZKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S2ZYW1DNCTRmFesdxjItOcpQQOl/DA00/DhlX/y28s=;
 b=OcL+XP8lowL6Uzhg/JHZjFQXNswb6LUZ3EJpLXK6Ymq++PfHsDjO002/xaxnCWmyH69swtvgWNS/cEsr7Q8z9o+DORJ9bzjlhF4o1Qju96qZjFMTwd4EwS4irN5FO81ldPemKvZCiO8oZHsRSW/Yzb/GOP3bLbEp+6CgQH+8VoO/oIorwNqbvsCxdjIwG6vN4RtCoI9UJKE2tuzGgrzaJ60J7So8ek7ZBZ9vlV4sUDlQ5P9HiZxI62XIq6GuwO2vfflWXBUPxA3tXd1W+G1Plf9xw6AIOLzEGlQWLz0cuaB8A3lnSlDf2eZ02pBHWigp9i7jCi9ieuo+zEpcjjbh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S2ZYW1DNCTRmFesdxjItOcpQQOl/DA00/DhlX/y28s=;
 b=RABh6dzVABQFh0+pZZohtsU9GTxf5yAshMUCM+Ty8OaK+z/nmMHkobqzJjt2eMtLLNQ8mNRXxS5ec55rMLYGRMNK+IORSjBP0OBkUHYT9bDPUegaSVFnYLM99/vrIXVtMJCTbHo6tCT+LsceYH3G22pO7C0qk0Aclm5PUKIcAF0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Sat, 19 Jun
 2021 12:04:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 12:04:21 +0000
Subject: Re: [PATCH v3 2/5] block-copy: let ratelimit handle a speed of 0
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
 <20210614081130.22134-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <44481643-603c-df07-83d6-f0c33fd86e6d@virtuozzo.com>
Date: Sat, 19 Jun 2021 15:04:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614081130.22134-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::31)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Sat, 19 Jun 2021 12:04:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ec52f77-9eac-4f36-8f4d-08d9331a5f53
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4023F7D04D134C8EE3761240C10C9@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJexc2yWz1avZLjESsdKyXQpi+wB2v+KYmcK3QA61FJdB1jKhplyRbxbaJq8lTMmjebpU4V13LeTvTbc+9HhNfAUuNzeKxSenZdHdGyYyYfcMTqdIioclcURquImGqR1mKm1KfCiCUF6emgWLshh7eqDkhFwC5OCVhyUAf2onizSzkHLExhVTlsnVnGfc7kHSyCiB/wWINC2gWQLnKbrj+rW9+KMgnEE6ni4aDLJJ4vJEM4auoVBCyDHbRpj17ROKC8LT5t/zVW6Lvo912MBr9JCM/igd2XrFdZgnyo1VMe0QEK2IkyQKzhKntoj5uLJ7nG8GramNctcZtox9+vSPrTshPt+GrnzuT1abfNSUk8VCTTxcmEd3tOSqk2jRkOZv92rtZl+YVkshzRhSXH0h37OQL2p8nQn9MdKGIp+7BM94DLE/o2htKj2sRdkn/4+P2wgWTzmeuN8HHDlUtuar7yrN4FdqpVwhgMNMKJxvu7nlhaKdd297+wIEYc5o28Ze7hwfP4AHYostas2egwb0PwdsVhnOB6ZwEFxil5caDbsgPv0lGLOLSShnl+jWjuCeikA3E9ygk2+EozH5MJ0SiVLi7vJ1azWCkgLFI6h4o7U8BNQmN5Bsx9KLEPjzsAJEKQEXm0ys6E0hMQnRpxz1s+cEuI5kaiPCq0jH90mWBF4Y3T1ytHFYF3ii1XfPKQ4rxJLdrZ3y+JCkW/YjNX2Czd+2kQZBDHQLHrkN0090Y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39840400004)(8936002)(16576012)(316002)(5660300002)(4326008)(31696002)(54906003)(86362001)(186003)(16526019)(956004)(2616005)(66476007)(31686004)(38100700002)(66946007)(52116002)(6486002)(36756003)(478600001)(66556008)(38350700002)(26005)(83380400001)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE5TSWxFd2xTRDBOVXVPb3UyYU8vNG9JTDA2U0RyVGs1dlRSS0F1UUl2ODZT?=
 =?utf-8?B?YnFCMm5wcy9FakhNRWM0OU5JcHBQUTFTYkhzT2Voc0tnVWFkenAyVXo1YUp1?=
 =?utf-8?B?Y1VWMVpRQUxvUEhST0pudTg3WHlYdnpPa2RZejZYeXpBYi8yTXVPbU5Kditp?=
 =?utf-8?B?cnF2Zk84dGI2Yi9EYSttTmhzem9TZUZsTjNBNytyckdPVDFFYnFTMlZYVTI2?=
 =?utf-8?B?UU9yTVRvTWkwcm5ZRit0Tlp1U0R2TEJidTZsdjFSbWQ0aUNxZUU4T2tCYURN?=
 =?utf-8?B?VW40OXNwNndyWHVnZUFHR2RLZDdYY2lrV21oZUlEY2NGdUFrV254UGlxbnRl?=
 =?utf-8?B?ajNydnp4aUM0QlhVNnBqUWREVUhtTHQ4Z3U5RU15RS91c2JRRUdRaU8rS2s0?=
 =?utf-8?B?Y0JyRkF6bkpsQmF0dXE5RktydXNlQlZPcGtsQ0F5OVN2YXMvWjBXdXczRnkz?=
 =?utf-8?B?OWQrdTJ5NjJLY2tJTzdyT09MMjZoaElqSUR3UDloUU0xRlJXV25LaEMzbkZT?=
 =?utf-8?B?RVdlcnpLRThPNGZiNVRMZW9FZGpWUzg5VTJLTzNFZW5laEVObEFxUXFEV0RP?=
 =?utf-8?B?bEVmWFlBN3VCaUhtNUdjSWtvREcxZGlhcEY4TDJwaDErL1Fkb1hvb0tJTklM?=
 =?utf-8?B?WlhvNkhDekdCYklleXp0ZzVROU9pVm1RWEttL0h0OXNrZVNEWTV1Yngxak1T?=
 =?utf-8?B?K3AzUkRXam1RUXBPSm5TNjMxdFpaTVJBdGgzNWt2cTdrTjg1NUsxQWRFTml5?=
 =?utf-8?B?MklMaFg1Q2hjNll2WFVTamNGaVVITDRkdzV0WmM1ZFhER0k0Sng1cmVEZHAz?=
 =?utf-8?B?ektjdHZwYmZ1VUZoa1Y2RjFHOTlqbFU2SUtsbXpBNktBQVdqSmx1dW5NNEM1?=
 =?utf-8?B?OFFNQk16T3J0QWNoOWpYeXZ4dGVQQmgrUzVCY1ZJU2wrNGtlM00rYjNBalBm?=
 =?utf-8?B?MlFmcU1nR2h1eitGczRKYzhnVS9tV1ZDMFgrc29wWlBhNE5Mbi9BSmJzV1g1?=
 =?utf-8?B?cWhDU0pxUGdTOWcvSEtoSW1WT2l4Sk5KODdQNUR5elBBNU01SWVyaENXenJQ?=
 =?utf-8?B?UVhOTG13cjJqZXF1azRPbjlyUlBhNWk1V3hJTWYrMDY5KzhDdTZOaC9iNjF3?=
 =?utf-8?B?cXRyY0Z2Ny9OTmNYaWRWTHB4amgrbTE0MWMwVTdXWm91VFlOekRXY0VZRmNn?=
 =?utf-8?B?azV0MmEvSlcvcHNJNG03SU1HM2ozZjd6OHRDWFNOVUhBYWNPdUlqdnBPMlhE?=
 =?utf-8?B?SkhaRkNnS1l4Z00vMTJ1OG9oK1J1cEVsdDdBTGNSeTZtMVRYMzA1SUR0Z3ZU?=
 =?utf-8?B?eEo2NUpaVzhhUmpnR05iK013QTc0M1lXRlpMSHkvdTJmNG9xQ1Y3ekFSODNY?=
 =?utf-8?B?S0VtUEVJTkFWTXZzejB5NW55b2VSZDdMY2doYkx2b2VZUXdoOHpYNmxVZ0F1?=
 =?utf-8?B?ZW9NMldzMjFzaTJLclJKQ1ljaGN2T3NKcXdCU1hLY2hKRFJMZ3FCc0FjRFpk?=
 =?utf-8?B?K3lId1NNSmRHV20zNHhValZscUxIWDR4WjlialQybXFQblpldmRJVTJoT1hx?=
 =?utf-8?B?U0VkSDRSeEpHVjNDaURuY0RDaXJWWmxUNTdrei81MDVuY1REREpKdnkxWjJ4?=
 =?utf-8?B?cjZ4OHVwam5DN0JLc1JnSzNCSWVDUUtTUXBDaEx5U3N5dTVMcXd6Uytyc3ky?=
 =?utf-8?B?Rjh2YWcvTUVYTHJXVmhTNmcrL1JJWU44RFYyTlZ5akhQa2FzNjUxb0xzR3Nr?=
 =?utf-8?Q?5Tm2flx2B+GBwCBjnDTDkVbtisP7y12W/BypfaR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec52f77-9eac-4f36-8f4d-08d9331a5f53
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 12:04:21.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lm2dO5b2nHCp6dHSweHH/TyLrE+atsS3+hr4U0ve9Qr0TlxCXP8I96FcFUJI+UZE/5J1o7Ng/LAYqUyY4cCoMokhTbVULm6MvsHomWN6cKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.6.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 11:11, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-copy.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 5808cfe657..943e30b7e6 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -114,7 +114,6 @@ typedef struct BlockCopyState {
>   
>       SharedResource *mem;
>   
> -    uint64_t speed;
>       RateLimit rate_limit;
>   } BlockCopyState;
>   
> @@ -647,21 +646,19 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>               task->copy_range = false;
>           }
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

Indentation broken. Can be fixed when applying, not worth resending

> +                continue;
>               }
> -
> -            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
>           }
>   
> +        ratelimit_calculate_delay(&s->rate_limit, task->bytes);
> +
>           trace_block_copy_process(s, task->offset);
>   
>           co_get_from_shres(s->mem, task->bytes);
> @@ -853,10 +850,7 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
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


-- 
Best regards,
Vladimir

