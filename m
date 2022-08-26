Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5665A282B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:02:06 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYyL-0006vI-8O
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYur-00044c-1K; Fri, 26 Aug 2022 08:58:29 -0400
Received: from mail-eopbgr70099.outbound.protection.outlook.com
 ([40.107.7.99]:53950 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYup-0000A7-76; Fri, 26 Aug 2022 08:58:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aac5dei2I5+pJ1H4SEqiFWExvrXm5wLMBow3Sl3KeGZBFYQrEF158vIs/R2QQOcmrJgEot7hAo9q+fWNSgDoPFijHaIvJMmZOLAN6LxY6uarqyD9Umj/ESIkCjr763Jxu5lE2TQhr3pQytjvlIAANc2i4JWgUlt2hVYq8cXiV4L/n3861RPaoO6ryiHkBzUr2RvlpBVIC+CIfAN5vhub4Uko/m8Zk2Rl+g1123WXOaauhAkp2m3gfwrs1Ew7XJvllAbHx6R+fTD0q8KS3y0N66aEtZF2XxfZ51ysJQzMTXG7F97xNflQuzCiJnfZvewxqO3nWLRwtf6Uiqz6j7LCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CCIPQdqV3o3KNMTUivrimIQ176D/VqgGgYvh1wzYsA=;
 b=OUqFL0A2jc04NVIrochdSzYr2Ha9SLtvbu+yQ6If+8N37XKF5jPa9DhV3L6LKXkKn3Ud9Mmg0CRJZwdTS5uRXQswIxWwfUCKcax6Kzj/zK4A+3x1andKGWHof9dAZNHuKaPHS1FW60fj1UK2doxaJgu3JR1vVhTj0DybpBhGR9dsfZTBXPGZ5QGw3gopZ8FBGZExhezsC8VlXrB0h8mPdI68pa9b/h1jmkiAV4bR2+VXAy2yZrkL3ph4Oako1ZhTapxU+pYjjqE2IgvVwDgitqMFeA9K8SMLN6Syt8lHeckNpbX/ByP43OnPRGqXSuFOq76mBKPewLFrtKvbjsywkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CCIPQdqV3o3KNMTUivrimIQ176D/VqgGgYvh1wzYsA=;
 b=h5pp9btltksUjtWaiGPCrwh/Y+xXw3m67oCpMop+u/NoVH9uMCXbbqrco3VHTjieJO/hPvfnLf0H8d/Eohz7/zhrsKnmN2PjQtSNEO4GSkC6OH3OQfU2GRB2qzoRExTCThtQZFbQvaAQgH5rsdxG2veOeCglU1MdvEZKp683RfTTu6SKBDX4Z6odYxrqGUjKvBsc84lHLUEM6fbQ2xJMDHWh2Ee2Cws3wRup2MWTNvOnGtckP4eplDYD7b7m9ECPrCyVLlBZfpGmrNQ1jbr9wpw1HFF1CQw5UzIuicamJ4SLBBwoSHlwPaFAT2uoVwgI7ZBS1UAKYPojI8iP+Ybwtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB6905.eurprd08.prod.outlook.com (2603:10a6:10:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 12:58:21 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 12:58:21 +0000
Message-ID: <f3af604f-2c67-224c-b80b-b3a42cae42a2@virtuozzo.com>
Date: Fri, 26 Aug 2022 14:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 02/10] parallels: Fix high_off calculation in
 parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220825143109.176582-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0210.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::34) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3981273-1721-46fd-133f-08da8762a7ad
X-MS-TrafficTypeDiagnostic: DB9PR08MB6905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1yaJ5iHmRRwgKQCmXMyr6NvWEIuykw68ESfKLCk+KKketTyS/RXxn05f/VUCHFKL3TlwN4dFAMZtVm+j9BUHKWYqhEZzghR6ojkZ/jTTkaD/mQbJeGfdOff3YurQYIdCTQmZu6Jg7dPOaZjz9VJ9NTTEIdLwLAWJrHsGiikOGrz2ClcH3ZjFitOH8fE0LOg7R8vGYzhMKytZZybiMrAnZEpYht/oKB1BK3FOROR3NAPqjdoIkqcys6993Fd5TC85uthXvbjHZIfH9jd6XCjyMDYMevVrwNtZi9ZfBv5VE+zuh7Dca3P2ol29cIJwJGXBq21PmkfIi2AWmYkH8AALIbzjFkX4IsQ+CXuVSy56fbOEKpta+8pbdCWDjrdn24vbkJLNxq1xYGbgnGjS3dyyd9cMDZIX+crKw842ZRltmpZG47ZCYqaTyfT4TU5l+MhxCMoIspcGPaJiRuo6L+7y798vUqza3P0PyscSqRNraRcg2RjNXUH63kn3KBzeYrtZQRkLeTX6dcl/PLTRG99Uy+Oa8dcZx2tmmY+tLcUrqrBI14xqfxzwaWPO7Q6mFd4NF+AuNSi11KSF5iKeXmeuF2NPx2nzKZDKeIvNeChMMzkW57gkDSf6+fJfv5MPY+Pa9tQGahCcVnh/bLt6dblmuU0Bh+JrHygxk8eQsllw7hhJUn1A5qI5/jSofpxRTt0iEpsSquecKroIjXP9YTWpp3Iec3hYI0jT8N6AhqrUwH3t4qhQqwz7eGsa4HvOyMsIPAoxLKDzDoViQ1UKwuDPrqJTD0ABjq9ZmVasG46XlZf+ppv/oCm2XhMnV/kHHF5OfYDh8/fagI/jzu6SQDReA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(31686004)(36756003)(2906002)(53546011)(52116002)(6506007)(6512007)(26005)(41300700001)(2616005)(83380400001)(186003)(38100700002)(38350700002)(31696002)(6486002)(8936002)(5660300002)(8676002)(86362001)(4744005)(478600001)(316002)(4326008)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhiM1A3RklGaXAxcEJvMFJVUmQzNFJLdEFZbEZqekNuYnRiRWNMQ3hXcGMw?=
 =?utf-8?B?a3B2SkNTNWdYK2UzNk5tMDBHYi9DWU1pb3VRVnB0UmRFNGpNN0lLV2UvRm5K?=
 =?utf-8?B?TWZHcEVYdHk1NEpWV0VlYWN3YU9RWlk4UFBzbTdvalBPcFcyTVNaQjI3RTg0?=
 =?utf-8?B?QThlZk9nak9yVHdvT01zUXA3UEJuQkJsRW5SWG5oR1JQMmFYTEorTTN0dC9p?=
 =?utf-8?B?ZmlnWUxreTBxZVpaUnlaL3BrQnQ2K1Vtd0NwNmp2cjhIbTB6endXcWZKaFZN?=
 =?utf-8?B?a1BEVnlaQm9JUjRtaURycDczZ1NNZkI2R1FyUGNNUXZVMis3Z21iQ2xIeWEv?=
 =?utf-8?B?SVZEYVN5eFRHQXNNQTJGcnFmbGdOR2tNNlkybzJVaUdLa1BBZVlqU3hyaU5H?=
 =?utf-8?B?N3B2Z1VDUStKNjA2aVlyRzFzTnZsTVprdkJxMFlrV3JzKysxYnJQL0k5ODF5?=
 =?utf-8?B?N0JXLzBYK0doRzRhRVZuTWl0ZlkzZWNSckZ0VG1YekhoajVOcWZaaFh1d2l4?=
 =?utf-8?B?aVJlSU52ZnJiKzBFS1p5c0kveDFYaDZPMnNObzMzNGE3YldlR0RvbGZJL3Q3?=
 =?utf-8?B?Wkd6cEpGYXZlend4SlRMZ3NNc3FXbS93QVA4M1JraVB3MmZSZCtyN1E1MDB1?=
 =?utf-8?B?aG16bVNoeFpwRmZRY3V2MmdBaEtOc2x6Mzc5Z0ZZN3JnV2dkSHhKZEJxSHRK?=
 =?utf-8?B?dktwYjQvenIwZC9aZk5vQ2YvV0hIMkJvZTRqYWpXbW1CMU1LTTg4N1phNDBD?=
 =?utf-8?B?NEEyYnJiNEdaL04zVHdpM0RseTlzaUx5RTNjTjkzRHN0MVpoZWh4ank0SXN6?=
 =?utf-8?B?eEpyWkxHODUybUJmellPVTJVVnJoTzhwVis1M1VhUUMydktvYzU0c2RSM01W?=
 =?utf-8?B?VER1YXNZTWFzaHNYY0g1eFYrVldjbFRoQ0dqUHhHVExmWUJxb1QyUm90VDND?=
 =?utf-8?B?NEEwWlVudVBzdXFvTU5JRnJkODF1NjNYNjFqOGR3RE9xTFJRWFRzaXgvaEFS?=
 =?utf-8?B?dktKTjBjb0RvS1lJRjFPSTN5dzZ3SzBaNGF5SDR1VVB5azRLZDJoODRMOVMy?=
 =?utf-8?B?ekFrenpock5uVXFteE1vRit5YUF3S3FKa2E2SXFmMDdLR3lXRGtkb2VJNDk4?=
 =?utf-8?B?SzdCLy9tKzRmSko3VFRjb2NtMDVxVjk2Y1g0U0k0Z29mMWQvZlJhQkxlV1Va?=
 =?utf-8?B?ck1vU2dJRjg3VTVNL3F4TzFKWElIcFRLZE1UcFQyUmU2T2hIblVqSU1lWGdF?=
 =?utf-8?B?VHM4WXNKZE1TUXlsYUZ2TDllYWZPYWZtTjBzUDFzSU5wOVhuK0tiQ1JCQjlB?=
 =?utf-8?B?WWVFcy9hdHlKcE16L25tMDRkYUdXR0ZZS1gxb2w4WUN4WGROcU9QcWVtNE0x?=
 =?utf-8?B?VjNLUE9BS2NlK25zVnk1UWFMemNMY2VQU0JDNVA3N1pCYlZScTRLa29zWU9Z?=
 =?utf-8?B?RWllbU1MZEorSTM5RjNOSzFkUW9vMnlxWk9sbHM4VDQydkV5eUFjbW1FVGtn?=
 =?utf-8?B?RVA3VVhQNFlqeDJQdU9kaVFEdHE4cVVrcGZIVk91K0xHcU9ZaUdrY0N0eGRR?=
 =?utf-8?B?MEtmUmFoazc2b2Jva050ZGVIWjF6Z2dkcExvTEVycDhTZmRtdmRGVSttZW5K?=
 =?utf-8?B?ZERIMlBGZ1g2K3ArRmJCTXRCUHJWMUVweGtpSFlxTW9rSDZXMlZhYnR6eHNI?=
 =?utf-8?B?RDdwME9IUVpxU2ZqNHE1QjdoZzc2SElJY0F1SS9wUXhiUTNvcWRXQkw4L2xV?=
 =?utf-8?B?M015NHlqRkpUTFNrRmxxczB1dUFaL2ttRVE3cXBHK3YzemJpMDVBSkNwZ2Jk?=
 =?utf-8?B?NHhQcTVTSEx0ZlR5b3puMjZFNXZUdW5tZlN5Qk15dW9yUTBGU2pFcVRWNUJH?=
 =?utf-8?B?Y0NsdVFtV0NEcm02QjBjK0JYZkxNOE9sSUFBZmxnRUZqQkxrdWFrU3pGVEdL?=
 =?utf-8?B?b3UvUENEYldPemh0MGc1TExWTm8yRDI5TThnYUk2VnhHMnZ6ekYvaURyQlNL?=
 =?utf-8?B?OU1Wd3M0aThla2FSYTVwQ1hLZkNPdnp2a2Y2RTc0dG5wOExuNGl6VlhzYlZI?=
 =?utf-8?B?MStBYjNEbTY2eTE4cEZMWkloajQ1dzY5OXNicUhLSzE0cURtRFI5Uk9LYmtQ?=
 =?utf-8?Q?aO2VijzUtICYn79bNRqPkl154?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3981273-1721-46fd-133f-08da8762a7ad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:58:21.7122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndtjhEVXVBdCYYeFJ7FnbVG0e/i+33AiKqhsxtsHCbF+fDYv+Md0KAdZOoFTcgd29xiS+2M+dlw19HwYYhF6ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6905
Received-SPF: pass client-ip=40.107.7.99; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

On 25.08.2022 16:31, Alexander Ivanov wrote:
> Don't let high_off be more than the file size even if we don't fix the image.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 93bc2750ef..7e8cdbbc3a 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -460,12 +460,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
> -                prev_off = 0;
>                   s->bat_bitmap[i] = 0;
>                   res->corruptions_fixed++;
>                   flush_bat = true;
> -                continue;
>               }
> +            prev_off = 0;
> +            continue;
>           }
>   
>           res->bfi.allocated_clusters++;
with string length fixes in the commit message (more that 74 chars)

Reviewed-by: Denis V. Lunev <den@openvz.org>

