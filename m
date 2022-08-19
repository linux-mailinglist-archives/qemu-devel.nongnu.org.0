Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A2599C48
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 14:56:26 +0200 (CEST)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP1Y1-0007Yi-MF
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 08:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1W2-00060n-LB; Fri, 19 Aug 2022 08:54:22 -0400
Received: from mail-am7eur03on2133.outbound.protection.outlook.com
 ([40.107.105.133]:6560 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1Vv-0004gW-H8; Fri, 19 Aug 2022 08:54:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvRuApXVVRhAlpSG0mescAB9YVJfnt4dlOA9P6qbqAuviZTtGFu1fGWeah9Ou0zNDjbjNoEMKoNdYoxveHk5rZMS16vMIvdHsloJYX6lQLuChB7O9HMjQmx6K4suI5INLPEUBo3vxIKQ8jRmfhqYTUIBCPT2k9TzV9ytj3zwnLgmyKtFLy98AySj6p0kNhVmjoR6iCT0ZBqJzudOCnLLSk2wr6IF2Nw+TjetOQjTwukyaWoSZ3ONGXIv1bXSSHdT0W88tjB2AqYCbZK3hWUflNbDGYc60/zfsJtHNtFRBicMymkYez9gx2rWCjTDTvDXPcn7UsXOXHzAEvM/r/67lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/34Oxm5UnIAGh+FkLiPuZSJzvFftXJ8yj/72PFlBAmo=;
 b=JcYX+IbV4XoFGdma/cCMWuLKNgyGDC0CWUHtqIOzGqy0jB4haT6GuyP1Q6luBZ5PJPrTZd/3RZ8/sfUEQ11eXQRed6TDxa/tZYmfZdjzIg4FAQi/bKeucUNc82ez6HT6EX6swySD/MjiaL1so5lJDQDPtqpjG5Dn/vqSo4CYYc/MP06UuFGqit3L7eDuDEDVQKqfsF3CZNI6sUOnH+UJnfZU85ADG/V7tmVFvbg/sOA+XSQh3TAjfT8NkcBmRaNitUcb1XQvWUNELrhaUnirXPbXbFPG/pG+Yd2ictKLHXj64hym/mifPGB0xVoJL1p2ThmnzO4xHX7hnHFxAEwQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/34Oxm5UnIAGh+FkLiPuZSJzvFftXJ8yj/72PFlBAmo=;
 b=HW8f7rIAenE6EMsD8Kwaudy4pp2iomzK4XgU4w0yZMCX23IaGN3vi9o/4DcuMMNC0aMvRoU4xXMXorqFldPYEt3BKm1Ejp3FGRLsju1KLYGs2x9iou4cC69YOJ/R7GsSOSRJMP7gcyIspaptSmNPp8wIu/ivlRAd3EebA2+A1QSlqGlKwd5JMyYVw7WLjFXwtlg9JALAGzVk5IOQcjlyAs27CTEH+eaMAsxkCzhTMQhDBPm+8NYVX+DzvjoEV6p/1BnlC1+6uEp3/YRu1ucrfwiFvLy3/kskQqWTW1YXMZMYIX4bi4H9e6LWZwK1YbbET8Ydd400tZ58dN1XSTcjOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 by AM8PR08MB5860.eurprd08.prod.outlook.com (2603:10a6:20b:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 12:53:59 +0000
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7]) by AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7%5]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 12:53:59 +0000
Message-ID: <59558d71-4453-2019-946d-c552923ef5ac@virtuozzo.com>
Date: Fri, 19 Aug 2022 14:53:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 9/9] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
 <20220818151456.2118470-10-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220818151456.2118470-10-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0602CA0021.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::31) To AS8PR08MB6946.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d22bff60-05e5-499e-0f7e-08da81e1e252
X-MS-TrafficTypeDiagnostic: AM8PR08MB5860:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFVKxBzaBktJDm67ybCKzni+7Qyju0odRMBn4gxtXkycQ/xhyfo86zfriyxq7R9kgrouJMmwD5O/zs4QSBsgLO57dLtWtVS85MgM5lTHwMifBirlQLzTxX/yrSM8PuePShy6+pl5+J3HjfTkFY9A1BBVs97xMUCODG/uxps5bIgUAhPiJEooj7VyIu+lyeWEJMwvvySMRJiJXQe2zyRagCPhrI7wJNhbK/PukjHFJTNgOVgosErlmPTfQttKGyVcOL+UKSb9ipHiVKvR2WNdsoR1PBDQ+LQovrViZR34J6vi2lvijsAsVnavwt6jH1vEIVL3lZXbE09/8VduCvWt/kz4P5xGGgWj0RZUJxdBSr3r4JDLx0mqpRRUQ3jIrZ3L5dl8YFyxI489mVwP/uo+Vk1fS+4Goo6+c6Ntpx2YS8B3a38tiJZFnRUz87pPbkI1jBnMntVz3uAl9c77EFJKDEk/mBi8fVNU5zjZZhrwMk5mp8DlxkrTtXB/zn2omgymEqm6qXxS20MklUWJa3Lqs3fLiA+115KLoXKaIeDPDgonVcmDQGAJ4mCts1ftjeMGOALStYBCepBr1x4FPlwV4R/7DZE/kMy029az6UjLqDYWfJ4NXsCf0SbAWudNmEDxgJsjEl71kdD7s1IiuAV405KXgNIXMA28mYJ+1twcgifqqop0rZtdjzD8SFGUykQeQKofaI0gDoAgXQOvXbmchO0ziMOexVOrR5pjUuLmueh13cgge51PvMSzAsCONQgo8SKq6mWmfr0cQzPJFY4+tz3KhUQQYcJApu1eY3Nefye4/ectg0pQFbSLyFVXi5OBU2JVRDAEq+3YhC1Ioq//3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6946.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(478600001)(41300700001)(66556008)(8676002)(4326008)(2906002)(66946007)(66476007)(86362001)(6486002)(31686004)(31696002)(36756003)(53546011)(52116002)(316002)(6506007)(6512007)(26005)(38350700002)(38100700002)(2616005)(186003)(83380400001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9HZWhHOTdjelRHZmloQ0ZBdldHcHgvOUZrc0drUEdEOHRWcFd3UVJhQW9C?=
 =?utf-8?B?TVJqUkd6MmNYamlwY0JRMm9LeHoydzVRSzFqL1VVQldlRERGd21GU1QyeTcx?=
 =?utf-8?B?ZDZzOUZTY2NhbDdIUGVyM2NoR2x1NFBjdGg4V3loclJONGpvMVJTRlR6aTZn?=
 =?utf-8?B?Mm5iREVBNUx0cHY3anRQTlVTQVVXTGsrY3hIR0ErVjk3a2thQmlIVURiVE8v?=
 =?utf-8?B?ZVkwaDFza2pKQUs3S2JBMFBhZGZZVSt2RElQNFdkVlZJelpQbUxCczVoY29a?=
 =?utf-8?B?M0U2L2J3TzYzUjlWTDN5WkQ3MGNKaWZSbUlvanFmVCtwQmVNYXJXVGZZWnZY?=
 =?utf-8?B?V01OYVZYWjk4bkpISDJ5anpQZUxURUNoRFFoMmU3cmNHZlk5bFBhbFBaSFVs?=
 =?utf-8?B?a0xJSHU5K05ibFZMUWpIQUNVVzMxVmFWMkhwdlJuL0laTDd1aXVYOVQ4Qlp1?=
 =?utf-8?B?a2N5cFFLQk8xZG80SFZ3NW1yMWR1bXM1RmdTYjFHOTlKNG0yTUI0My8zSXhq?=
 =?utf-8?B?NlUwZHkvZDRiaXA2WkNsamtjRHE5N2UrMDFKdVJZT3l6NnNBeHFmd2U0bEpU?=
 =?utf-8?B?UmE0RWtaN3JrUVhETU04Y1VKdUFmUUEvT0sxRXQ0Wkxma3Z5cWpWV0EycFkx?=
 =?utf-8?B?YTVWbEdGMzdUZ2ZJL3RsU0xLMkpySHFiTVg3a3ZqcHM5OGQxV1BoT05vQTZl?=
 =?utf-8?B?YkFFR2srMVVOdWxwSmZFQ2ZPbEhrWEdyWm5ONVIvbmgzbHJIeVNQUUVxRnpU?=
 =?utf-8?B?aXQvei9VK3c4Z3lVczNMZHlxWjJCVEdCZkRXM1JENE1YQmZsYjJDNTA5TFJs?=
 =?utf-8?B?cjNmNHl3dU9wdFcrbVpHMXEwelJLbjNkMGdPVjlFNmR3TXF4TDRsY0dORlpa?=
 =?utf-8?B?b2VtYkF1ZkJ5SUQzaGhJL3FadXlzVjRKNlJCeDNqdTMxV1I5YnpXUlFpdWhj?=
 =?utf-8?B?WFFhN1krejM4MEpxaWR0WlpuRUtTVjVYa295Mm1HYzJhb0lPa0phK1BYc0JW?=
 =?utf-8?B?UDIvbUg4cEJFaU1NaVdsVWMwWEZEZVdBTEdoNkoyd0lrQVd6UTdVRGV1ME5t?=
 =?utf-8?B?K1lKRW8yckRuTGs2Q1hucGxpYXRrY2VoMmg1S0xHdnErSkpvTmg5WkY2YWNx?=
 =?utf-8?B?RWR6Q21ScjhUc1AydzREdTlYemxiVVNuZmticzBTOFBMczFwcGJpVzBDQy9t?=
 =?utf-8?B?bVFDRWZQRzZNRnZJQnpzNnM1U0hCWnd1bXFIV0MycG1oNjdSNU5IdFBaNk9P?=
 =?utf-8?B?dkV6OTZIeWlpdStwWVM3STVDRDd4a0Rxd3ZuOVMzRE9iaytNc2ZmQ2EyU1lB?=
 =?utf-8?B?b0VRQkZWTHUxd0dxdDcrY0puTXpNSENxa2lnWE9LakNYSW5rYUo5azh4eW1S?=
 =?utf-8?B?MzB2Q3VhaHpSdkF1NEJjdXJha0IzRzlTbFN1bm9MMmhJZDlYQVh5WTE0VVRQ?=
 =?utf-8?B?VkhrZjRHNllqM2hYTCtYRFVxeDNaUkowVlk5ZFZOY1doM2t5VmMrZ3dQN0Rs?=
 =?utf-8?B?TmJ5eUJNclRXYVRaVjNxU0RRQVhlSjBHaUtac21pSWdQdzU0NGV2M3puTUlz?=
 =?utf-8?B?UGVOb2ZDSDdoZnk0NG9ENTlPZS9sWSsyNDFwaXVQRmF0MXZ4clF6amVmQVIv?=
 =?utf-8?B?QW1GdnFXRGp3NGdKYTVkYkFsWWRheEp5ODQ1RCtLUHI1ZlcyOGhQTFU5RjVn?=
 =?utf-8?B?cHN1Wm80SVJ1N2pjWklaZWx3NnhyNk16T0UvaFRiWkltUjRFTHpJR0N1Nnlu?=
 =?utf-8?B?c2dPdUVhUldsdnB0MEpzSEppKzgvK0FEL0lIbUVXTnVEck04Y21jdUZLOHpl?=
 =?utf-8?B?OUk5UTFUS0RmSWVHZTRHbmxEOHdaQkNneW16RkpkMjd3ZDE2UU8vNEFOM3ox?=
 =?utf-8?B?enBScXBlUXpyQjhxckdTSkhOUUlHRW00RU5JZ2NHWlNZT3FBVFlzb2pScFBV?=
 =?utf-8?B?M2RNNkdLMUoxdDFYdzdocmkzSEx2b2swYUFhbEpZM0RHaUlEemY0aCtkdXBW?=
 =?utf-8?B?djBPa0psNnFtOENLTXJ3K01xYlhCV0ZlQ25OYkhrQ0tkS3RZRFJodlh2eGla?=
 =?utf-8?B?RlVIS0kzRk1XSWFDWFpqVXBmTmFhRytqSkw2aW5sbWtkcHBPRTVMb3VEblJD?=
 =?utf-8?Q?Uk0Lzif9OCycCQ+6EmZqj5KAf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22bff60-05e5-499e-0f7e-08da81e1e252
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:53:59.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmCuQu+UWbuopQpA6kPcftclTwbbaoIw26LhmTqnWQpzXO3P0QCvCbLuG//mTH3+SsDH40qYjmRWhV35JFIU/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5860
Received-SPF: pass client-ip=40.107.105.133; envelope-from=den@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 18.08.2022 17:14, Alexander Ivanov wrote:
> Replace the way we use mutex in parallels_co_check() for simplier
> and less error prone code.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index f19e86d5d2..173c5d3721 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -563,24 +563,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       BDRVParallelsState *s = bs->opaque;
>       int ret = 0;
>   
> -    qemu_co_mutex_lock(&s->lock);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        parallels_check_unclean(bs, res, fix);
>   
> -    parallels_check_unclean(bs, res, fix);
> +        ret = parallels_check_outside_image(bs, res, fix);
> +        if (ret < 0) {
> +            return ret;
> +        }
>   
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    ret = parallels_check_leak(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> +        ret = parallels_check_leak(bs, res, fix);
> +        if (ret < 0) {
> +            return ret;
> +        }
>   
> -    parallels_collect_statistics(bs, res, fix);
> +        parallels_collect_statistics(bs, res, fix);
>   
> -out:
> -    qemu_co_mutex_unlock(&s->lock);
> +    }
>   
>       if (ret == 0) {
this check is redundant from now on.

>           ret = bdrv_co_flush(bs);


