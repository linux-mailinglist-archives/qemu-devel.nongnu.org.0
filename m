Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784225912A1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:08:45 +0200 (CEST)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWHE-00023O-Al
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMW3z-0005nb-3v; Fri, 12 Aug 2022 10:55:03 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:39521 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMW3w-0001qE-73; Fri, 12 Aug 2022 10:55:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YObR12FLG90/Se1BME6R2/Kplo8HW5c6wfP0gk0KGn6HwBfK7AhSLOGJFOFZVchNE4uEzehjMcOn/6xZg8nXtdUXnUDdvm5KmV21cB6thMWDTZKyhL3eMqlpdHKyDE1lPYQGEDep79hfvehF8KeCY2BJU4hvaL5px3ZYhWyUHKWAKB1VDdzoo7KALhuispRSLkJkiUXqmY66wElqtl5E6bGgOlBpxpOREAZMZ8Rd5fgTjgLYcKnsQB7wTX1uEczYb/K+/Q4SSsM0UZTTEs/NLslEvUFjR5s4jRtdlnEyt1vV5BkPi6QlJeNZQA6N/7p1RJGqW3gCRVr7ddVWh5zf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFgppDztiaEE1E9VuZWyW+DBp6MA6fdWnDh18ljv3Z0=;
 b=QohV7lOs3ko5l8c+yfvSYPiOnjkrLufKo68tepHjBhooJPYT12jAXC7tqtR99L+bqRo47LvODXr0kTUwP/yJJ8kHF3bbX4LVUYvCoDuPQA0shRCYS96hPycSNUViN4ZJRGZtoGke73WI8YEfNmS1mKj1ieM+RJh8U93mAC7kyjbofDKvFxsBP2Rbnh+ConHp732Gz5yLe0iVSHYzEnS6w1Xi8uCPqIPilRiy5HZ5qSO3CdLibPe8kTWWBQcs7sNoQ83RB9DHyeZaaUqqesXMcsiMQUd9x8oPF/TFd7UAidStHeF5LzmtsbN+5CGOylxHpzj1IPJbYCpi3UvoQJSG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFgppDztiaEE1E9VuZWyW+DBp6MA6fdWnDh18ljv3Z0=;
 b=gNjwp8CsbeS/3mevno2RL+2tMfCrKoyL/+rEn8cE+Dz5IIZ65alDgMxYbApgm65NE1GBnUCbAM8lu7i6DaPluiRphLLMd1prh4WHz4yaWEYH/hcgvLTw6CcpydXln2IRlhG6uy977O7t8bOXQVlrW2lKB4QtxQ7PwxG907kYRWhuUhZvQoM3DkKEVyjU7FH+2xY4eHoZe6TGa9V2k9VPDGH6UAY56EsWGQfBesFutWAUe5WhnoPnEoMsahgvVlqPGVVYrYGmyrThZ8xg3V9LXRgBPache/XyuIc4TB01XcdvbtzaED+MfKSqN7CFYXhkLQCLq9IS4jJqoYaehxYm4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VE1PR08MB5053.eurprd08.prod.outlook.com (2603:10a6:803:10e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 14:54:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:54:55 +0000
Message-ID: <30224617-d292-0410-dcff-2312dfa83f17@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/8] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-9-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-9-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::41) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4c06a3-c37c-4e97-609b-08da7c729ea3
X-MS-TrafficTypeDiagnostic: VE1PR08MB5053:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9d2KHC+byWidITEDmrFoPeJ3Y8eZ399EtKFtDVSNnrNcyblMy/5YimvHRx1i0Y2tWU8ByPsquY/m7/7SCfUv3W8cumdzq7mduNDAIUz9T1s6heE9qNDtCQuE4HS0+T8ephQ4lW26X6b3cXK3Fbf8+VA1y4yauKg4Fn3HuxBwGg/2+w2BRPkCGDIxNPweR2vklsvG6/S0pLKezs2Zy/YxnprEKjDax+p2DZSij5yFscPbh52iIsaz446EFLVpWyWu4APomtaVKEOUAWHOmJPilcF6cmxWAfkQt8c09sxrvHxt3kfF4IWB25mCkExsMV66i15Eeo+9BrsQHsFaS6cesyBTDvb3kR5nntgMegSsTnda15iTtXBcuZipCAmEOXuzgZQSln94oDYpM2BVXAVQZSrqwcazW3VcZ87GY7aMDSzyj4eKo2A6Dl8IjZEmulRJ86Wet9edPvQTgA4r/omfzGbSUHfmpSgpTF0+BV2Y3r2FPGcOTKIv+hCUbD6zHkIPpPZt67e6Y8D3vmfrZRvn3RfOfclX22o51dMxEQldpwPlIpmn12xj1TzLJWYLQGpS3VVn0DZmFHTZPne4MstMdDfeE0Ltc51E+POlI4LaB78VHYd8OzOm97BcEBs1Yim68lscWjgg9FzwfmTEYET/QFcMP7X4s7Mic6ANyqDS7sfaE3s8zjdf+eqwPW9VLWSLJp3+TKJTvvlcQ0FAs2veioU4lFZ9gmeAKjeoTmbRUWXux8547K7QcPQ3d7vcD0WRm0kcVjHUf0iy82ucNvreGQ1wUocmhp5HkPfzvZbQv0XfZpYuw+eUPhgimv1sBpVIZoTCxNLcK/Bc/qT6kE5YqX6BCy93pHhqbYYKKu6Ax/a1YVjgNWsXF71lOG9G0fVt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(2906002)(52116002)(36756003)(6512007)(186003)(31686004)(53546011)(26005)(83380400001)(41300700001)(2616005)(38100700002)(38350700002)(5660300002)(8936002)(478600001)(6506007)(4326008)(6486002)(86362001)(66476007)(316002)(66946007)(8676002)(31696002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWZFMVJ6WXk3dlJxVjJhK3Z0YlNBZGJKN0ZlM2JlRjdvajNNZC95VDcwai9m?=
 =?utf-8?B?VUJucy9ZMmNSZmtYME5TdzZ3MktvRzUyOU9VSWw1ZzBtZnZOcHpBOEkxbWlJ?=
 =?utf-8?B?dW1SYzQrSFlMbjQzWm1ReEJUQXl5WVkvK1hoVHpoWnl2U3Bsa1YvRXNJY0R1?=
 =?utf-8?B?NVpnT1VlMy9WR1U4WDc5U084K0Y0bG9kRkQ4UE1rTnFqK3lCOUU1RllMbFFx?=
 =?utf-8?B?UGhyWVlCSzdnRzFKbkNuZWxrVGkwR2hZOHlvSGlRL2dPMWpwbGhyY0tDWGdp?=
 =?utf-8?B?V3hoLzYyNVJ0RU5ScXYxNzd6d25EVW1QLzFackErWEFzeGNZSGdOWmlkZmU4?=
 =?utf-8?B?ZjBVZExud2FVK0NXRzZTQ3F0amFndm1DYUgxcExvTWgrWnpSSVZPcjJCSWxp?=
 =?utf-8?B?MkdQU1hqUkwzK01hR2txbEE0cmQ0V1d0TWhialphU2ZaVjVXc0VvdkpEZVVw?=
 =?utf-8?B?ZTdWdlQ5MDh1S1VBUzl5aXgzQnlXRFQ2V2pHRWtoNE1vVS85MUlNdEhMOHAz?=
 =?utf-8?B?Skd3K0h2OHpiK2ZrUnlEaHhpN2lDbWEvTXNiOTdhZjVKN3BQSUx4eHFsQkQx?=
 =?utf-8?B?N3lUbFhDWlFoRFBFYTRsQkFyZlI0b2NDMVNWQWtEczdLUU1mZnh2QjhBNk5M?=
 =?utf-8?B?MzJFb2ZSbG1mOWNrTlBVVkN3SC9SYUI4SklrdFV1Qk1tbzhFVlI4azJpSVhk?=
 =?utf-8?B?b2JHOWgrREwvY2NxSW9FbzhDM2l2d043Um83eTRvS242RDBja3E4VS9Ba2s5?=
 =?utf-8?B?c2cwam5INWxySytPWXdjTEpSVkZQWTJEckR4aGt2bW9hRG9sSVlzNGM4VnVV?=
 =?utf-8?B?UlZMUjZlTG8xVDlXNHM1a3IyTFVQNEM2WUtCbmZzZTBYdzdKbWl5R05TVHNT?=
 =?utf-8?B?N1prdlhIVmpwdUFYRnhxM0VyUUR0UjRiMlpDL1BjbnUxZm1NNXVwVmY0aFpD?=
 =?utf-8?B?SUJMWTRKaFhKM3EraE5nODdOdmZyUUUvdlZBSDd2TEFxQmd2aXlQWG1rNXp5?=
 =?utf-8?B?RnlBSVJuNU0zcmpGSkc2WFJwSnJTZ0Rma3hua2lXN3FJenJwbW96RGgrZFpO?=
 =?utf-8?B?QUlkdUpZdjhMYWNtMnNIdzVYY1hjenNpd1BvZFhjMEVqMVY0MHhYMXZPazUr?=
 =?utf-8?B?MnVsVjhNNWt6TG9jWFdRck9SdkYzSkRkVENQNENaNzlqYVQzczcrVHJQbFRs?=
 =?utf-8?B?R1FjR29FZC8rK0pPdFhTMjNpV0x2eDFVL3Z1NnJyZXBTMkhTMGxsNThRS3F0?=
 =?utf-8?B?VStjTFRzcWtpdm14a3ljWFR1NStkNHJSMkpIeUVPV2hEWm5lejYxU0FXazdD?=
 =?utf-8?B?eTJyL3VTVEZHQ3Q2cmRaVjVOUzhPNDEzVmtJby9NSjROYU03Ui8xYzVOblQy?=
 =?utf-8?B?a1hlSWRCeXZ1aWpqalA0QktINVJ0NXZFMGdyaDlEL0VReHNBald2VnJBbDNV?=
 =?utf-8?B?U0xvSUJWdlFreUEyTUpWRlVqQ0RLYy8wb0k4M2d0Q21nVFNNUjZabUJsaHpW?=
 =?utf-8?B?aUJhMWRzaEFQL2RuMXRlWTFZWk1hZ3NRNU5JVVd5WTI4R2w5ZkQ0TkQ0ek9y?=
 =?utf-8?B?QzRCdWxkdjZNZEh3ZE9xdm5zYXdzQzJlLzl5Q1dnandOUTNlSnFqQytWcTlj?=
 =?utf-8?B?a1c3U3I2M28yRXBhS1JDcmJyQWozaUluV2lXalpJL0FUMkpxRlFYTnUyL2tt?=
 =?utf-8?B?YlhlZGZiS1dEaEcxeDhvZDQ4TDBtdjdvM3EvNmppZ09uQ0xVSVdmOHd5NVNP?=
 =?utf-8?B?Q2EyUlNEaWc5am1jYUZvSHR0QVNPOE1YbWI4MkRmWUkrby82NjJKdUp6MkVI?=
 =?utf-8?B?eWQzSDhsWHhhbFREUW85WlArcnZWTEo3YlpFc1FlWWFRSmFDQ2ptSUR2N29t?=
 =?utf-8?B?S2VFUVJKT29pdUlBUjI0YWpGd2pBbzgreERwdjV0MFcza2FlbWswejgyY3RY?=
 =?utf-8?B?eFhkNnpmemZPUURBWnBFNWxmaDJaL0tpWm5yWVJUbG9jam5YRTkvSHBMUUp6?=
 =?utf-8?B?K2dMb0ZtbjR3WlB3b3RiNk42em1KNnhySGpRSW5LSXFMQUQwaGVzcTY5WVZI?=
 =?utf-8?B?NVl2eERRamV0RmFyb3RyTFVJbFBBQjlnQ0lUOWtmckJpMTN4QjVWVXdNd2Fk?=
 =?utf-8?Q?x7qQ+K4NXu0/HKKTPrwB5D+ID?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4c06a3-c37c-4e97-609b-08da7c729ea3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:54:55.7220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GX1D4MwaLQfPE389uSm//34dj+3VfLYpufv5yxGliB+lMzgqAbuwqBA6L0vQfkfde2PRjfN5cbGQJMeW2J0eYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5053
Received-SPF: pass client-ip=40.107.21.102; envelope-from=den@virtuozzo.com;
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
> Replace the way we use mutex in parallels_co_check() for more clean code.
I think that "cleaness" is the same, but new code would be just shorter ;)
or less error prone.

> v2: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index d0364182bb..e124a8bb7d 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -553,24 +553,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       BDRVParallelsState *s = bs->opaque;
>       int ret;
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
>       ret = bdrv_co_flush(bs);
>       if (ret < 0) {


