Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35A6829E1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:03:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnTq-0005oA-PS; Tue, 31 Jan 2023 05:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMnTo-0005nZ-Pf; Tue, 31 Jan 2023 05:03:08 -0500
Received: from mail-am0eur02on2114.outbound.protection.outlook.com
 ([40.107.247.114] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMnTm-000889-FK; Tue, 31 Jan 2023 05:03:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzzBieWVpBram+V7+2Lxtdgcx78xGUe4HgVJiiWpnrvV7fYWBsu/3j9yH81RyFQDUf//n70uZPMld0qOpphWqH8qGnCcS2+JKNtzdptWNnxUKZypIWBJVasHBCF06JKT0j/qcZXbkK/3EYr9ECCpYlDsRWRaDf2kd1xUrhPEMxWJ9tOt9CllaYq+NNlO52R2RVvdXLEmOqfsLMLfWjtEBy7qobZXAVnK1ISxkbSIlBQ3NGUsmaSydGDwzVcXMsbeED//jKLSUaSAdMNwWQMvPDIeWxKhA6FznctO+Bre8o3R5MmzqzMKfJczqhLWo8z/cvuNlfrE96ou52RUyESr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0bSEFxDA+5lq3MQ7py1V9XvEax913EViQMTaHU4ymk=;
 b=LmeeuwADYq1p6FWMXxpT/BqZpA4pPnwIA3zs4+lSWSeyBNDBe3yszZ4qjcD7ama11egzCGqrdIKiDuoAkiLJ9Dfk6E0MmJjo4szgDMYLlN1bPX6LTCeUCDxa73w0/hkt6Byw1NluJ8KnUlMb7lH9MzW+C4JVkzmhlnkM3g2016emZD1LSpz7BwSX7bes+1EmeyqX8psfm3aJpuG9/GcwF/d7Nf1/MkQ+P6nKGh1DxlZyZJzH5fOVA5NH1E/L42H76V4N/mYhd0LRmZtrOmygjuwWp+IXuNsxnWGsmew1oOgW28zsFvuXWRzCZbaXxVVx7aIgnyxkY9SRGXYKYwDj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0bSEFxDA+5lq3MQ7py1V9XvEax913EViQMTaHU4ymk=;
 b=TbE8YslBio11WxSY4NJ15H/Rnc6P0LagtN0brvzFqjyZeqnIQh/zBMHutD0EOF6P9ZCrUgaOYYFDKE0trlBub9FcHgzUBj8FCUx+99O1/ulw4XTdHR4iFEnJ3a7thhidYO6CKQbctc304DeC1JFx52Gcl7JmcRK0SbMzfL5L6Wtj51rVK/WEKtR/W4sy4vHgTvjF9V4oOMdis9xElOQ4aeQdNOFPMLiEaccxhM+6aJ4d31kysbO4/qydj+jfyHAgsHvdfuaVdPVBZiS2giLNTp1HmTcrx8KY2Nkuqs/9r+ri0d0JCM9IeCHHhN3HeNyb/zrmSP9qyHLgQRAcf0RZxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV1PR08MB7314.eurprd08.prod.outlook.com (2603:10a6:150:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:02:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 10:02:55 +0000
Message-ID: <ed2aa31b-278b-aa67-1132-7cae72f5c51f@virtuozzo.com>
Date: Tue, 31 Jan 2023 11:02:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/5] parallels: Split image leak handling to separate
 check and fix helpers
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
 <20230112150149.1452033-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0002.eurprd08.prod.outlook.com
 (2603:10a6:803:104::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|GV1PR08MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 375571ce-8f7d-43c3-6136-08db037252d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErQ6hGRartilU2rGSUGDKe6i1xMfo2Y85aaXskmC7YVWu5VqIyujSAAvQW35C2/cEQKukeGn2N7rSz1DCvOlClBMRwbD+aSdM9em3u1RWVtneDLBsa4JLVtv2cPpav87Xp/uMKRySNGc/9GB4t/5K5bBKwU/10YZILhT+hj5TYaCb4AAy5rgyKWwW+yM4G7ZPskPr+XxT+Jr2+jVeh7gg8NSyF6Y8k//1WczbHHWVeW3/utp+mWTKEICXbN/Yh3qVuLAKp8PoW9w9/JvSzPOl43tydO+rjK/u65HZsVSAznBtn8i8kO34ZiNiEXVqs3kY1cOfcGf+y0EM6HGP5491AyHR9WFTEOLVlWeD2OC6ay+P/CN4KwnU7QyJnJRbQm+wVkhmNgz9lcxpEIr8+jhBNfX5Lt6s6cn5PzQvnAxnErwjHR4mL5l7tvIB4KFyYTUb+zkz7xKul63wn4YctwLTEk2yrpONGwE7qlhkhoIK7yJrbQvQk63StnWJY5dFFILSjW1mm1KP2Gai+MVKP0GDzJuNy1w0l82saj530x6Azj+WdAuNGVDAI+e9y0wQHCryuS1mQxHvgrn1A1d02KhUOVXK56HRcPFvYZEeyVpw3ebtc185EX0K+5eaP+0NYWCItheKZ6FkiTUvp+mUxwAzVlg//lVfBiWSznnhHaXF61KBo1XgRqOcfiC4U1z3mrh+xI97hhV6V3Ed+t/gcGK3ZFjXgmvME0iEgoAzcOkTHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(451199018)(83380400001)(4326008)(316002)(41300700001)(8936002)(66556008)(8676002)(66946007)(66476007)(26005)(53546011)(6512007)(186003)(478600001)(6486002)(2616005)(86362001)(6506007)(36756003)(5660300002)(2906002)(38100700002)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHkrQVVwNHZ2VzRJeDJpTTZLU3dKcEtTZ29KTXR2VXN6Nnh3dk1RSTVHTDZh?=
 =?utf-8?B?bG90YllxNVNZbk1OTi9naEtORlgxMStvRlg0Z1c2TVFqZUFDZm5yOWYvUnR6?=
 =?utf-8?B?Tk85MU0wV1BYSmtncms4OEVHT1RmL3dTTGFXSUI3ajNWTUxUNXBrRElxa1Js?=
 =?utf-8?B?enZ3eU1ML2hSUDdMQVdBUTFVQ3R2dnNCTHpDWi96WDNGMTAwaFVUSHd5THpa?=
 =?utf-8?B?RS9TMDBOVittZEdHekZoRk51TmJxcThYcE5ld0M1VUxvZlpGOXEwV1B4TTl4?=
 =?utf-8?B?dHVwK09xa0puTlRBTUVNM0gvMHc0VmM2cVFNdEc4Tmw4VTE1eE1SdjFRalN2?=
 =?utf-8?B?ZmxrdHQ0d0d0bU9nNGphVHJJdFdQdlcxTktCWDlySW1DbVdFbWQzMnJlQjBC?=
 =?utf-8?B?RVFHVytKR0JGcTg2cHBsTU9pYnNqT0h6bjlkalEwQ2kwZlVVSVJaSFZYT2Vs?=
 =?utf-8?B?YVpla21mVjZhYUE4QlVUYWxmeEx4Z2QzeXpSdXIrMytnNU5qcWdyWWFYa0ZD?=
 =?utf-8?B?UVE4Rmg5R0NMT1pVZGhaamphcE5vZExJMjROT2F1bEdKYVZ3MGxzeGtWVDls?=
 =?utf-8?B?QkIwK2pLME5jbGJFODh0UEhKVW9mSE1iV2EyeERMYldVNVZjU2ZDNHBKbmR0?=
 =?utf-8?B?cDZ6NlFpOG85VFVQN244MjVyckxTWEpYSS9yTmJJTS81aHBnVnJaTDBBOTlC?=
 =?utf-8?B?d0o2OWlyTXZ3TEg2OVoxbE5Ba0tWSjZmdXNwWFp0VS9jV3kwVEE3ZUhuY1d6?=
 =?utf-8?B?c3JyRDJCRGh5SXJIc3hTVHpiby8yeC81VEc1YndSY2RlRk9HVWxDVEhacHFv?=
 =?utf-8?B?SUVFMU92VFhPaENwUzZYUHFwaDR1NUl4c0dhRjRRaE5veGdRcWRhbTFhWlIy?=
 =?utf-8?B?ZkhIZ216cnd4UHpFaHRNckdKa0IxdGdwZDA2em5VNEtuZlZWRG5XakFRc0d1?=
 =?utf-8?B?MHJ6VVlneVFlL2YvUzN0OG1oUUtnZHd0SHRSWVNvWmZXNjdzWHVDVEhvT2JU?=
 =?utf-8?B?Szk0b3BuQWYvNmcraEpGb290UFRSMHNHRFdZc3hKSDMwb0lYekxWdEM1QVVZ?=
 =?utf-8?B?emIxQ3c4aFVpK3MyK1V6R2tySjA2RERFV2FPTjNOZmpoV1d2dGVMYmNYdklj?=
 =?utf-8?B?SHZCYmM1TkhkV2ZCdTdicjdLaGtQS0JGWS9rK2RZS1ZMTkJrMmJRQmRiVVcy?=
 =?utf-8?B?UzhKYWRyYkpOSXhVTXlFN3hSRVlnYy9rNFY2UGdtaHNLek02czhwaEVpNUpQ?=
 =?utf-8?B?QVA2QTFZaDBXOXo1NmV5S1RQQnEyek56eS9uNy83d0VtYmNka2Zsd0w3M2ZG?=
 =?utf-8?B?VldTL2pyVVFBZkJRU1I3Tk82M2NWUExkbEtkL2lWUmFBaThPcXQ4S2F4bnlH?=
 =?utf-8?B?WVl5R29RSEduSTljUk1mdkgzNTRuYlQ3OC8rbFdobUtyc0J0REFNaG9JZ0hG?=
 =?utf-8?B?N2RYYmNMNW1mSzVBdkp5c1MrWE93WUtpcHRZa2pVNklNRHp5T0ErU3lRWjdq?=
 =?utf-8?B?bklteFg0YlZLNFpSQ0JUY3ZoSEpIZTlUY0xrZE9QZ2Zvd1F0YzdEM2RnUHYv?=
 =?utf-8?B?TjZ2NmM1UjhyS2lIOE0raVZ4cWswT2RlLzF4L3dYd1B5TmVldElNMFFZeWY3?=
 =?utf-8?B?TXpDcGxqR0hUbjJkaENGa1ViRmVyb0FXaGxabUZ0TitQNFRUYVVnZEVhdDB2?=
 =?utf-8?B?aEhDQVR4dk5iSXNNRkZlMitvZ0Y2N0w4ZGNlRTJ5STNkakk3bWR2V3NWQmlp?=
 =?utf-8?B?cWg1UmJORWFvbklFa2hPYkwramlRVDgrZzVYY242R2k2ck51ZmdDbExtcjIx?=
 =?utf-8?B?b1dpcDBaS0hxRkxNdEVFemZLSm9SQ3Nvd2FObTI3QmoxUGYxbmNFZkhrbjRp?=
 =?utf-8?B?T3pFQlUwNkxEL1h1T1ZuYkI4elA1YUt6N1Jwc0pHdCtlSXBCc2daeHhzRUNz?=
 =?utf-8?B?KzRSVHQydHp4bFY2QU51Z0VjRG83UUFUeTFaNzdhalNINUt5K3NFWEJ1WU5l?=
 =?utf-8?B?bmorTitETVUxV2Z4cldTMUxlZGxKK3l1dGg2bkJGZUVnSlZUcktQcHlTVUlX?=
 =?utf-8?B?UXpIVy93cGFBNTU2Wm01Z3o2dFJXdzhNcUh1MkVMb2QyVnB3bkNKRmJVQVNY?=
 =?utf-8?Q?cKPx7A2mWCVXv8/YVmAbBvVns?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375571ce-8f7d-43c3-6136-08db037252d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:02:55.5554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKTmJhijet1qQ7WFRL0m9qk1zYzRlxNnyIqj4XNHJq9RmpUh2Rqla2x7Qe5H7JbVuBWtly20DrJH9CPqOu20Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7314
Received-SPF: pass client-ip=40.107.247.114; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 16:01, Alexander Ivanov wrote:
> We need to fix leak after deduplication in the next patch. Move leak
> fixing to a separate helper parallels_fix_leak() and add
> parallels_get_leak_size() helper wich used in parallels_fix_leak() and
> parallels_check_leak().
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 88 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 61 insertions(+), 27 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index ed2cf27abc..da1e75096c 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -475,21 +475,53 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int64_t parallels_get_leak_size(BlockDriverState *bs,
> +                                       BdrvCheckResult *res)
> +{
> +    int64_t size;
> +    size = bdrv_getlength(bs->file->bs);
> +    /*
> +     * Before any usage of this function out-of-image corruption has been
> +     * fixed. If the function returns a negative value, it means an error.
> +     */
> +    return (size < 0) ? size : (size - res->image_end_offset);
I'd better use normal 'if' here and will add an assert that
'size' >= 'res->image_end_offset' on success path.

> +}
> +
> +static int parallels_fix_leak(BlockDriverState *bs,
> +                              BdrvCheckResult *res)
> +{
> +    Error *local_err = NULL;
> +    int64_t size;
> +    int ret;
> +
> +    size = parallels_get_leak_size(bs, res);
> +    if (size <= 0) {
> +        return size;
> +    }
> +
> +    /*
> +     * In order to really repair the image, we must shrink it.
> +     * That means we have to pass exact=true.
> +     */
> +    ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
> +                           PREALLOC_MODE_OFF, 0, &local_err);
> +    if (ret < 0) {
> +        error_report_err(local_err);
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>   static int parallels_check_leak(BlockDriverState *bs,
>                                   BdrvCheckResult *res,
>                                   BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, off, high_off, count;
> +    int64_t off, high_off, count, leak_size;
>       uint32_t i;
>       int ret;
>   
> -    size = bdrv_getlength(bs->file->bs);
> -    if (size < 0) {
> -        res->check_errors++;
> -        return size;
> -    }
> -
>       high_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> @@ -499,30 +531,32 @@ static int parallels_check_leak(BlockDriverState *bs,
>       }
>   
>       res->image_end_offset = high_off + s->cluster_size;
> -    if (size > res->image_end_offset) {
> -        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
> -        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> -                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> -                size - res->image_end_offset);
> -        res->leaks += count;
> -        if (fix & BDRV_FIX_LEAKS) {
> -            Error *local_err = NULL;
>   
> -            /*
> -             * In order to really repair the image, we must shrink it.
> -             * That means we have to pass exact=true.
> -             */
> -            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
> -                                   PREALLOC_MODE_OFF, 0, &local_err);
> -            if (ret < 0) {
> -                error_report_err(local_err);
> -                res->check_errors++;
> -                return ret;
> -            }
> -            res->leaks_fixed += count;
> +    leak_size = parallels_get_leak_size(bs, res);
> +    if (leak_size < 0) {
> +        res->check_errors++;
> +        return leak_size;
> +    }
> +    if (leak_size == 0) {
> +        return 0;
> +    }
> +
> +    if (fix & BDRV_FIX_LEAKS) {
> +        ret = parallels_fix_leak(bs, res);

you have changed semantics a bit - with a error here the message
that we do get leak will be lost. I think the code is to be restructured
a bit here:
* move printing above this if
* fill leaks_fixed inside this if on the success path
This will be much straight forward

Den

> +        if (ret < 0) {
> +            return ret;
>           }
>       }
>   
> +    count = DIV_ROUND_UP(leak_size, s->cluster_size);
> +    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
> +            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
> +
> +    res->leaks += count;
> +    if (fix & BDRV_FIX_LEAKS) {
> +        res->leaks_fixed += count;
> +    }
> +
>       return 0;
>   }
>   


