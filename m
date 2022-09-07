Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA55B0952
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:58:01 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxRA-0002Ea-1T
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxN4-0007Rl-4n; Wed, 07 Sep 2022 11:53:47 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:36837 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxMy-0004Gt-L3; Wed, 07 Sep 2022 11:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2b1OZ3K3k8HhtGyPOVIpuEkNRwJauiIsevfbV0MmQUae3RQNfoOb0fdE6BHdK4SgV2XvhWjP/T5baUsE9WPnHq6Aa6yhgxyrboNAtyIYrSVISomSJrgfjwlSUcxqcpF3K0e8OgCVOtu6C5cv3NubOBRoF4qCNz0pDC20Gn7EcFSLg58dSJJGmUNj3wzCTVHviR1QpUYl01N0S8PeJbHFvAYtGeCDaKRa2tYWVyKxLcolqEh6KO3Lxdg/g7N2XVsBuuLL0qqHMLf0UNYs9ZgK54eF2eA2V5FUx9v254hec9/cb9oxopEunQaCYTwjS/Pq958kS1PBl++5bx9vWMLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jcq7HNVvRyhtAaKh6ooJYE6JQdvPlD5010y7Oi4dpfE=;
 b=gLNicBrtHC32vKGbXJYUG13SbF0eSv0qSNRrVX6Bup9Xx4yEhd/ShgXtl68oc/ZJ8FLRF/uAojqy/ExsLPprQHmmpAQQNh4ix3QVDcSpwS3nFt/mFtm06LKYyMB64wsrmGLhv+l0ypU8oljlHZ7lzB9pL4e4tC/PK/qEbBFcghfB6bthawkpCpVshYOZxiFshvUChAugTSea+FQiSOtBixqUHc6+O9VwvlH3umnu2wSX7zP7PoKwiza6AmJnaicgeQI1tuKmzihWsoMDHUoO4wDMbohe5+SUVzhSi8xhfjMMq0hKFlvplMtvpXhASlX78VW3QpQ0woMYY5MfhHsvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jcq7HNVvRyhtAaKh6ooJYE6JQdvPlD5010y7Oi4dpfE=;
 b=Si6WDtR+S0/jOenaxpoOxuTL9sSvhEjBgYtVVQbXKlonZuJJLWaZNp6KmcpMdDus40mJKqPSPHzC5Z5qeIhnmiXduYhihJLQRSSR3dBsVtnPgaiq6u75CM0WRZAC6PZuZotXs0Xim199kDKlRTycArL+BZYsWs+adKFetb4KaLxyWohUeJhA6jCFdO5EEcq0TDPO7ouUw0le9r5NlhhS6XeK0yFiZqOP6PUkrN8ZDZenND5ixFYZ5wbi7UWu7uwZfx6eFIo25GYT7cMMVmVC26sfDztY7Rnpjd/5ksOl4MNzHAqdvz7YuLfhTAD4kjeJyCeR0T9honF6ql3WXgIdLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PA4PR08MB6079.eurprd08.prod.outlook.com (2603:10a6:102:ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 15:53:34 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 15:53:34 +0000
Message-ID: <e448f7c3-982d-804e-03fc-d8782fe3f9cb@virtuozzo.com>
Date: Wed, 7 Sep 2022 17:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] parallels: Image repairing in parallels_open()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-7-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-7-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0181.eurprd09.prod.outlook.com
 (2603:10a6:800:120::35) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7440d986-b2ac-48ee-3e61-08da90e91eb2
X-MS-TrafficTypeDiagnostic: PA4PR08MB6079:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvQ3A/SovHuyDIKTR8nPsBIFEuEp+e/HRyXJarU+EP+g++MA5Si0iKiDA+nsILTl0P4O93O1tUreSnD4FInmwo4L5BncGXHG2OnCP48OxMwcGK4OOCO21Yq3ySzhfmuAL58cIEUnBwYKiHssqotp8geqR43lvqCzqkGkzHNZP6G84Lo/W9mZyqRGujGFuM4Q6+R5ykc2S1TLC2OiaWWOybm22j9YO0xJZRxnkgckeQaKK2/divoSA5Ejilp9crgZBDMt8o/1K+GDp2lQHvrJ5xEzrerNc6Wq29J3F6qSx51lPh9KRl48PhtughsEd1Ez2B3/IerSKx7uDTzLAy57yibniw4Q1r1/1qDM2t44qDiCZjxSD4f0vXUEwIbZSgcuAvwHgCf/2bca+lQ8VeMgQpoJ445bPAgYLvRMfMRRpxPXwag2SjPHR4kmNVsfzTuICwBU5oF2CDuKjmbUd0O68wZkAWG33x0gs+JPzsSat9nyT65cLYf8rVo9lbuWV65tBfHe0j5wv3RfxXw5pzFXtTpXiXF5pftSFY8bXeuR5XLD01DrAFQ8QVhsBnL+sy9AdjaAykfIGlOi81tP3xemUo8MGTnY9jRfLK20jvtA6r9cxSMYJ3tXgdQayT7OMJY4L2KRuFgl8b42qkvAhksqgcCVJnT55IR50EQRcWf3h+sex2g4de2/t2ucbkW1BMzeadRgmGBdOkbj47wKhaMk7rAEBW2rrEAkO5xpxhS54xGSXg0ET1mGiPvt+hFWaTdGDml4kcVZABwuwvgmZdDcXRkzFchgzA/xpQwESpSWwzcfnPh54bzq14ghkRqkVtpxqBRaAI3+lCVmHlfxe92/+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(39850400004)(346002)(36756003)(53546011)(52116002)(38100700002)(26005)(6506007)(38350700002)(6512007)(316002)(6486002)(41300700001)(478600001)(2906002)(31696002)(86362001)(4326008)(5660300002)(66476007)(8676002)(66556008)(66946007)(8936002)(31686004)(186003)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzdqeTdjMC81dmdBMDlrSGI1U0xvSzR3SEhNSTFPZGQzREV3MExLY3dTT1A2?=
 =?utf-8?B?VkE1ZEU3LzQvbEx3NGdsYzFKL0dTOWFZRDhsK0pDcUs3YmVVRnNTWnF0Wk9N?=
 =?utf-8?B?T3BJcnZYRWI5MHA0R3d2ME1HWFVZdTBsaDE3ODhTOURZNmtqU3M2eTVJeW12?=
 =?utf-8?B?UG1CZmJGcTZ2c3JnVjFNZllYSWtsK1hQWTg1dlRKRjFNeHdWcVVvdG1nbkpL?=
 =?utf-8?B?Tk1yam1CdEZQY1Zya3llUXR4OVdFWGtqWTJ2V2VCS29JRmpZZHlXc0grZTZJ?=
 =?utf-8?B?RzUxbEFhZUlUYzBNbVAwc1hGNWUxV2ZQSDl0aFpGdXJTWTNyZUU0UUJxMGtz?=
 =?utf-8?B?VXZjQ3ovWHFNaHJEUkY5amR5T3BEc0JZNHJsaVR6cFRlQklBbmR1ZEl1bDUy?=
 =?utf-8?B?MnQ0QXpBc0hocTczdllyNDZqcUNSVjRNMWtvU2gyZDZXZ2hzSmZ3VUE1b2Zi?=
 =?utf-8?B?Ris5T3NQTFVpZllHenFGbjY1ei9VMC83MzdubkxjZkliVjdjdjZkL0YvNnNL?=
 =?utf-8?B?aDY3L3JMZk1GZXdIUU02ZFQ3RnNwbjJ3d2UwYjdqejhmR3RJZnBKaGp2VzNq?=
 =?utf-8?B?dU96MFlYSDhIZHFWMXpoWHBjSWF0RjdLMG54RUFkSFFmS0lRdkp5SS80d0dj?=
 =?utf-8?B?TUJvaGRHVGMxNVZhZ0VSNjZlQnliZFRvS2ZVMXBiWCsyeUs2QjdDTWZaZUVS?=
 =?utf-8?B?TnJINHcxMFBxNHJZTGg0Wml6b1BIQ1FoOUsyQitwL0dnTGMyTWVuWkN5WlRN?=
 =?utf-8?B?UVNZcm9obVFqckpScEhaQnA2VTNmQ2w5Q01DNlc3SnR2YUtmemdJdmovUkUv?=
 =?utf-8?B?QU4xOXZsaFRyUkxOUEZybG9BQnFvUENoakFZZSt1b1E0T0VmZTZXYjkzb3Uz?=
 =?utf-8?B?VUxFejAzVGlMb0d2dmJ5SFE5b0d2dytBQUxQOHVvQ0tvRkFaUStvVHFNWS9F?=
 =?utf-8?B?VmIzN3ZKcXlBWmVXb095Q0dSb0NZYjI0ZS94UmRMTXJvbXBtRlNIVWN3T01G?=
 =?utf-8?B?dzdzNW1UcXozS1MzK0FKY2pBVHJpc3huTmxhbmtWdVE2OFV3VVZTdE5zK0lv?=
 =?utf-8?B?b245SzFLZDZZT3NZV2VOUGM3ck5KVUl2Z0Uyc3dGMWZXcUFZMkVsZ2NpQ2or?=
 =?utf-8?B?ZHloUlBJVlZZUGlYQTZhRjZLZDlQRmJ4Skc5QktUeEUxMXhNUldYbjdHSFEw?=
 =?utf-8?B?aEhQSEZ2T1dsWTRjcWo3MUYycGtjTTBMRDJNYkxXZnJuM3NHdDVnT1c4WmJT?=
 =?utf-8?B?ZWhTN2laMmFWV1NtMzZ1RFZrTUplM01WZDRUcVo5Qm4vOWJ1YUw3OHFUMVFm?=
 =?utf-8?B?Z0w0L2UzRjdpUXRQaEpMdXJQdGVoWVo3STllRG5tRmtMak9ZcjdmUXJsZzY3?=
 =?utf-8?B?dktQc3JNbDZPRENFc3JhYlNITE9oQkowRFNqRUQ1a0pLTGZ5QkZQeHFGeW1t?=
 =?utf-8?B?YXB5dzBlT0xPRXBDZ2laaXNURGxLdHY1akhzYmhud0dKZ2I4NkV5ank3czBs?=
 =?utf-8?B?ejEvYjVDTkdFS2JQeVloODdFOEhjMXo2OWhLUzhraHlDZzliMEg0TnpDVWhR?=
 =?utf-8?B?TW5XWlpZaDVSOG5OUDI0eGZMQ1NtVnNRdGZTenM3UHUxMlhuSnRkQkJWdVlr?=
 =?utf-8?B?bGx5Z1lkMjFrZGdmeHBVRnhWMmU2VW10cHRzK3p1dGJ4TFRWZnNFUEdxMjND?=
 =?utf-8?B?R0p2SWZHUmNlOHZzQjFZc1FUcGlOaWtkYzB3cGRzdjE0UXJBYnRnc1cxTUJn?=
 =?utf-8?B?ZUlJNlFQWVRmV29wR3ZnRExWWGh1Tk55ajQ3Uzk5SHZyYlZ6SzQ2OFNaYms0?=
 =?utf-8?B?S2piTzk3SDJISlNKUlVSM1FXRlhEL3VKb1R4UndlM2hDb2FKNFFIQWRzNm9x?=
 =?utf-8?B?SzhXTDkyNmJyblFwYzJYNWQ0NTYwV2hBYndxSElQS0JxS0FiRG13cUd4ckZY?=
 =?utf-8?B?QnJON1A1QUpuVzV5dGxSM01sZ0Ftc1ZSaUlONjNERS9SNWRJbHZZaCtxL0JS?=
 =?utf-8?B?ODliRnJ0Q3p5S2Vpa0dWNjdtbVNaMUcyczJjdGJGaW5UcS81MnNyY0VRYUNs?=
 =?utf-8?B?SkNBdlA5WTh4WnN2dDZ4YjllNHorVEtqZHB3RWdWOHV3RDc3SG9HOW8zVzNY?=
 =?utf-8?Q?8pPUnU/oWBlYgyNXJXDoiFqF+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7440d986-b2ac-48ee-3e61-08da90e91eb2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:53:34.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE7WsxheIyZJwKFGC5EtVaIhqha/Dn1yIvEJkV0bUrjXLKOF/584gH8wsWSxFqdXPce2JW+lhV8sZRQfeSFb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6079
Received-SPF: pass client-ip=40.107.0.116; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

On 9/2/22 10:53, Alexander Ivanov wrote:
> Repair an image at opening if the image is unclean or
> out-of-image corruption was detected.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 95 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 65 insertions(+), 30 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 08526196da..a7c3af4ef2 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -735,6 +735,18 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       return ret;
>   }
>   
> +typedef struct ParallelsOpenCheckCo {
> +    BlockDriverState *bs;
> +    BdrvCheckResult *res;
> +    BdrvCheckMode fix;
> +    int ret;
> +} ParallelsOpenCheckCo;
> +
> +static void coroutine_fn parallels_co_open_check(void *opaque)
> +{
> +    ParallelsOpenCheckCo *poc = opaque;
> +    poc->ret = parallels_co_check(poc->bs, poc->res, poc->fix);
> +}
>   
>   static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
>                                               Error **errp)
> @@ -947,8 +959,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   {
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
> -    int ret, size, i;
> -    int64_t file_size;
> +    int ret, size;
> +    int64_t file_size, high_off;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -1027,34 +1039,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->bat_bitmap = (uint32_t *)(s->header + 1);
>   
> -    for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i);
> -        if (off >= file_size) {
> -            if (flags & BDRV_O_CHECK) {
> -                continue;
> -            }
> -            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> -                       "is larger than file size (%" PRIi64 ")",
> -                       off, i, file_size);
> -            ret = -EINVAL;
> -            goto fail;
> -        }
> -        if (off >= s->data_end) {
> -            s->data_end = off + s->tracks;
> -        }
> -    }
> -
> -    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> -        /* Image was not closed correctly. The check is mandatory */
> -        s->header_unclean = true;
> -        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
> -            error_setg(errp, "parallels: Image was not closed correctly; "
> -                       "cannot be opened read/write");
> -            ret = -EACCES;
> -            goto fail;
> -        }
> -    }
> -
>       opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
>       if (!opts) {
>           goto fail_options;
> @@ -1116,7 +1100,58 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           error_free(s->migration_blocker);
>           goto fail;
>       }
> +
>       qemu_co_mutex_init(&s->lock);
> +
> +    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> +        s->header_unclean = true;
> +    }
> +
> +    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
> +    if (high_off >= s->data_end) {
> +        s->data_end = high_off + s->tracks;
> +    }
> +
> +    /*
> +     * We don't repair the image here if it is opened for checks.
> +     * Also let to work with images in RO mode.
My silly $0.02.
Also let *us allow* to with in read-only more.

> +     */
> +    if ((flags & BDRV_O_CHECK) || !(flags & BDRV_O_RDWR)) {
> +        return 0;
> +    }
not enough, We are not allowed to make changes with O_INACTIVE.
The check in this case should be postponed till O_INACTIVE clearance.

Very specific note. header_unclean is allowed in O_INACTIVE.
The image could be opened at the moment on the other
host!

This should be clarified.

> +
> +    /*
> +     * Repair the image if it's dirty or
> +     * out-of-image corruption was detected.
> +     */
> +    if (s->data_end > file_size ||
> +        le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
I dislike this. There are detection conditions above
and I think we should respect them adding the flag
'need_check' which should be kept in the BDS to
respect O_INACTIVE.

> +        BdrvCheckResult res = {0};
such assignments are weird (not portable for older compilers).

> +        Coroutine *co;
> +        ParallelsOpenCheckCo poc = {
> +            .bs = bs,
> +            .res = &res,
This is strange, why not to put BdrvCheckResult as
a whole to the ParallelsOpenCheckCo
> +            .fix = BDRV_FIX_ERRORS | BDRV_FIX_LEAKS,
> +            .ret = -EINPROGRESS
pls add comma on the line above, This is common convention
as in the case of addition one more initializing field you will
not change that line.
> +        };
> +
> +        if (qemu_in_coroutine()) {
> +            /* From bdrv_co_create.  */
> +            parallels_co_open_check(&poc);
> +        } else {
> +            assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> +            co = qemu_coroutine_create(parallels_co_open_check, &poc);
> +            qemu_coroutine_enter(co);
> +            BDRV_POLL_WHILE(bs, poc.ret == -EINPROGRESS);
> +        }
> +
> +        if (poc.ret < 0) {
> +            error_setg_errno(errp, -poc.ret,
> +                             "Could not repair corrupted image");
> +            goto fail;
> +        }
> +    }
> +
>       return 0;
>   
>   fail_format:


