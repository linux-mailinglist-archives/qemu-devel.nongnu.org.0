Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE356831C9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsp5-0005LM-UY; Tue, 31 Jan 2023 10:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsp2-0005Kn-Od; Tue, 31 Jan 2023 10:45:24 -0500
Received: from mail-db8eur05on2072d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::72d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsoz-0005R7-U2; Tue, 31 Jan 2023 10:45:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXdWdjrKnwDGFEZWkW70qlV2A97J2SEbH+OqNIbf0NbV8aL9qksFZyKhOgugZRvvMPOreLrKDswnW8Y9A8dyWJ9tMm62ByzCK4ak16EQd/wiONDf08RvovIEzzWyjQNuF/6yKzoJ1VG7JuSElKJNV5j78SLSbU8KqP7PwXaWQ5/AV/mIKDcwWhEzz29j5QbWgNwsbNeOSV1QY32auZbBLLQ5J7CE6ofSqd7pjk/KmfFP0eTzT6DM6zu2qRL04it022/R3zW9ltRvXZHk0FNNX3OJvyLIIzWFcQoZBkugGK7n8vHkGPkwF8F7awVKeSZbVjf5qU0lfIpYcHFZEc8uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zt+o4D8CY48fUdUIxNOxeaqIEWhS6ueFnaih/4l7Ws=;
 b=ewo0nCXEfGveL6cEr6RQG/dXGzElfh5oQIXlc+HrraOUkjEBvjPNXzR+KfLwKx06qzjzPvVec7JEMjFp6A38Ed13vYaktwZTmUe9I3t0Vtz1EHJe+Folln8ITEkn4IV4wo/Lwtg5DrvFiw+l5om//3u9AqFSxz4GeQbaNhrdrr8nWWQ+QWVb5auQZ/RoJbtN6oFzg9/B4sqFWQavHF1i4hLxr3ZLquugz7UWUymAEVk4RYI13INFHbpestme9YG4NsOBJUqTPBtj+gbzISUS6xgznsRwcSXMZiAGKOtrSFzNgbyZVwjgpqPx/RjiM5tXV3U7XjDDKUvrJogbSmMEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zt+o4D8CY48fUdUIxNOxeaqIEWhS6ueFnaih/4l7Ws=;
 b=Lu9MMKj2bDhNdbNFM10xEz95KczA+pbM1kC9VpYTDmBNBP80M3ZfTpE2E+wC8gTpAtdHnXd9MG1dvztgQ1K9VXpYuWEmuyxYhGfFhqrCK7sAzVOmGjzIjFNkP9G5LqLgzi40nt6LKYzgRLKFarbY0xOdXZeQBDny73zWMWnuzfaRVdCKnj916o4TIlAllH0/I/du4YbWj8IbT17c9gGkPY7nuQgjiD6cm/VvdrhkOO30Mve7U6l4/ArTJrFkHl3fehw61ffuTUqnJghtZntRsqG5di+dO4N+LQ8E1Yo8evIEt16cTZ6ufsKKeStW4NYBj1ceC6nguPi4TmajZ1y4Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAXPR08MB6704.eurprd08.prod.outlook.com (2603:10a6:102:130::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:45:11 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:45:11 +0000
Message-ID: <d3a981c4-8fe6-3b1c-31c3-ab4abf319e8d@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
 <20230112150149.1452033-4-alexander.ivanov@virtuozzo.com>
Content-Language: en-US
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::12) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PAXPR08MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e44259-215a-4eac-8c7b-08db03a222da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYQmgMrnqx+r2GmxAqHbxbvp8JzZErouggpD1NrUUU8P2PhHRQ2k/RxAyNLS5cp3XL7ozhEHTPAEBj7sD9OFvjWJcBfsI4CuEyEYPidl76/YiEYKSGZG1W5y2Zpt/q34/yJv3EFlGArCZTy2CreGwqh720E6x02FDshV+1WQrS8Ualdn4r5JvigClDGX37l6+nRCXKe70qSwsmkNnb99hO4nJOtK9out3XcvyGElmXawzChcqOa3yJtUoV0ZXmujRAQVGb07XOwdN+aSCBMUeNEW4FVFz+6xUMCdL0woibUN/0x906K0esYFcIJAw7q0e9nYlX1UQ0Pf5zx4SOR/Al64gtbWG7WXelMEwrIClnJOlKtknDcHoOPAh466DonRQkKdMsKzGAWX8TWXV9oGf3Y2CJys8GhslxTFgPRhz/4m8qTSjgP9xpn+ppOvYDqkLTzub3HUl3QLE4pUk9uwiIBovDJV3LJ+Tv2JoLZWmcWg03IXQ1Ua5oAca1QouR30y2bX9YLOrco9wMCcmV4opk3TpnEiM4E/pVNWM2KiEsQCKin44E5M5uuy+nHzr7qE48zmvam7Z/qjDJAOo10P506jVkpG4HaM5TERlgGewPmeQTwTivzDdV+yKAjq5c/hRtGQDUdtLsnBfCivswa3cmm1hYMzyJ5wSFC/sfkd9dSUyokoqqbdcsuyDfRJpKlFokHdUBQAqIVVnIFs8fdj171SoKMFPw5MuG/oHrlRAsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(451199018)(86362001)(31696002)(38100700002)(2906002)(36756003)(5660300002)(6486002)(478600001)(8936002)(4326008)(66476007)(316002)(66946007)(8676002)(41300700001)(6512007)(186003)(83380400001)(26005)(66556008)(6506007)(53546011)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFBTThpUEY0ektBbWozS2ZlY2xLTWdHcHpCSGp1Qk9Geis1MmplUTFQaFcw?=
 =?utf-8?B?blMwNGJlNzB3WmxUbWM1b1B5NUtxVUpkekNzSjU5UE1OVVJLSGd3dUZxL1pF?=
 =?utf-8?B?OWZVK2ZMZ3lQbkFjdm9hNkpDT3lrM3dTWVk4dHg5NXlrbHIwczdVdkFOMHNl?=
 =?utf-8?B?U1JLQjM2bDM2NndDNGV6VXRNNk90ZEpiTnBEZlZoL0s0NGpjYVZqV2IyM1g4?=
 =?utf-8?B?SXdqWDFTbVBVbVdFNjMxQjVINWw5TFRKanh4dXlkRGdXdjZiTWkxQ2hCeUYr?=
 =?utf-8?B?S1B3eGJQMkwxS3A5alNTbVdNa3lXb2dZOXU3TmJtTTNQZ1M4M2RzTTVhZGo1?=
 =?utf-8?B?TUtiS1RNK29LRWVOY0hVeExzTDBTdlJVNXZwK3pQbzRQdXZpQ1pETnJOaVNw?=
 =?utf-8?B?cG4zZS9sRTRYQjNka3ZtYnVTRlU0RXJ2cVhrU2pFZC9ib1BPN3hFTk9TR0Zt?=
 =?utf-8?B?aDBNUmtDYVhCaG9FZnJnS0dGbmh3bGNEV1V0SVJyN3dtYVJRY3IwdzVoOTJ2?=
 =?utf-8?B?WG8xT3BiNWxadDJ2MEd5a29INXZuUWNPWDdTc1VFZUhybk9zMm51OStlaHNh?=
 =?utf-8?B?LzBBbmxWNUg4by8zMnFUdXZGOHFONjF5N2xPL2xvcEc4eXg4cFlIdVRLVzdK?=
 =?utf-8?B?bEYxYzM3aDg3bTk0MkxSZ3VRZGRQaE4vOTd4MitzUzJ3N2xmaUJFK3hYb2s0?=
 =?utf-8?B?UDVHd25TdE16eUU2TUZpTTZvU05CL0hQM05WZk1UNHlqNy9KS1B5V0o0a3Az?=
 =?utf-8?B?a2dQZ3RHTHFCcGI3dlpieUxNSFhRS1JYTHgrSDhBdVdmUnA2REdpNzZtRFNj?=
 =?utf-8?B?M2U3WTZjMitBQjVzQVYzb2tydGlDNWdRSzB6MFlKT0VqVVNKWllnMUk4RHVj?=
 =?utf-8?B?SmlhdmFUN3hlRjc5bkpmcWZtRlpSTFhKbzkzOXJrdGgyUm5BSWVkTU9NUG8x?=
 =?utf-8?B?MGNlcFNieC9Fc01OVExHUnVxbWNvL2xUZDhFOUFPTDY0bzVEWUg0emxOSlpk?=
 =?utf-8?B?Vk1kMXZXbXV3MG1WUWtybkt2MDg5OVgyMTJzS3RBcHJaZHBxN2MrZTZUbWs3?=
 =?utf-8?B?U1FiVjJ5ZUxDMGgwVVRJK3doVHJKVjlQbHBOUXlmbTN6cmROUExFMEwvSUxJ?=
 =?utf-8?B?c0hJK0hheEJuYzdGbVZtNDVBZXIvU3pwVkpNY1V1ZzFZKy9DTUdwQ2ljRXQ5?=
 =?utf-8?B?OHIvWDhvazk1SW5xVlBpV2tpaU9DRVdjOW1FZHB1aFI1R2Fzc09aZndPY3Qx?=
 =?utf-8?B?K2N0TzVaRTBQeHpIc013VEwrdzJzT2ZwUGVvU2k3YXBCcWxiTktGMEtBMVJN?=
 =?utf-8?B?RCs3RHRaYlNESVZrd0JlbjZTZkVBWks0ejNrS1N0WkE5L1YwQzJZWnBsNVl6?=
 =?utf-8?B?ZFozdTQxaWVLbVJ5KzhoQWtNUWxDS3hmdTVVYWF2UEt2SUdQV29xdkgxSVF2?=
 =?utf-8?B?OE9ocHN3WlIrTHRuRHJ2MEhtNWhkZm84Q09IUWFtN243cDByeEJQNlF3b0VJ?=
 =?utf-8?B?QjNzMFFLaFZtZTlGSzdnSHpKNy8yYXUyaXNtaUwrSjQwaUpLQWRaVFdjaXBM?=
 =?utf-8?B?MWloUVhJcktSdzhHNlRoSWVwelplaG1rSUxoYWY0cldSUFYxZ2QzM1BxQnoy?=
 =?utf-8?B?Tm5Wc2NsSkpndit6QXNjZzgvRnNYYVd0b2VWYitRdlFzVUhCZlhHTXpSU1N1?=
 =?utf-8?B?TFpCdGdYRmphOHA2bzUzYzhodklycGNXMVZ2K0syaU91SStPQTJEeE94VHEx?=
 =?utf-8?B?eEFiejlTTlZpRFBKZUtNcmk4ZU1iNEJrdVBRQ0tVQXJHSnprbTAxODRLend5?=
 =?utf-8?B?em1seHA2d0EvN3R6ZWZQUGlCVDRKd2lnZVJpR2xIZExWaVlIL2lZRTdTVVRV?=
 =?utf-8?B?NWxRR3hGVE12QllCNm9oQ1dVNXRXb2tyMXN3UVNOTFhVREMvUGpxYW9PUmZm?=
 =?utf-8?B?bUtwM0NlOXVzcTBCK0FaZ1RhTzlaT2lBVzlUSW4vWGZEaVFzMGR2MWdYMlBO?=
 =?utf-8?B?Y050Q1UzMXR4cTdYTFJ2YVMyWWozNnJOV0JDc1ZxaTN3ZHZxV1FaYTUxOGFr?=
 =?utf-8?B?cVV1RytEaE4wRUlXMHB0TFMybHNwQ20rWnhjeUs3RnFSLzhwbCtUNlV4TFdi?=
 =?utf-8?Q?MRF4C3y7Z9ayxJ6PMIEkawXdK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e44259-215a-4eac-8c7b-08db03a222da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:45:10.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIA6qEJOrxLyIfXaOXa3h9zjZdfOP0r+sbJ8IzYOjSiZM2U4LSZZWfEFK/fN8f5Op1Al3P/X/QnvISD6KILwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6704
Received-SPF: pass client-ip=2a01:111:f400:7e1a::72d;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
> Cluster offsets must be unique among all the BAT entries. Find duplicate
> offsets in the BAT and fix it by copying the content of the relevant
> cluster to a newly allocated cluster and set the new cluster offset to the
> duplicated entry.
>
> Add host_cluster_index() and highest_offset() helpers to deduplicate the
> code.
>
> Move parallels_fix_leak() call to parallels_co_check() to fix both types
> of leak: real corruption and a leak produced by allocate_clusters()
> during deduplication.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 168 +++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 151 insertions(+), 17 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index da1e75096c..73e992875a 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
>       return MIN(nb_sectors, ret);
>   }
>   
> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
> +{
> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
> +    return off / s->cluster_size;
> +}
> +
> +static int64_t highest_offset(BDRVParallelsState *s)
> +{
> +    int64_t off, high_off = 0;
> +    int i;
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > high_off) {
> +            high_off = off;
> +        }
> +    }
> +    return high_off;
> +}
> +
>   static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>                               int nb_sectors, int *pnum)
>   {
> @@ -518,17 +538,9 @@ static int parallels_check_leak(BlockDriverState *bs,
>                                   BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t off, high_off, count, leak_size;
> -    uint32_t i;
> -    int ret;
> +    int64_t high_off, count, leak_size;
>   
> -    high_off = 0;
> -    for (i = 0; i < s->bat_size; i++) {
> -        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > high_off) {
> -            high_off = off;
> -        }
> -    }
> +    high_off = highest_offset(s);
>   
>       res->image_end_offset = high_off + s->cluster_size;
>   
> @@ -541,13 +553,6 @@ static int parallels_check_leak(BlockDriverState *bs,
>           return 0;
>       }
>   
> -    if (fix & BDRV_FIX_LEAKS) {
> -        ret = parallels_fix_leak(bs, res);
> -        if (ret < 0) {
> -            return ret;
> -        }
> -    }
> -
>       count = DIV_ROUND_UP(leak_size, s->cluster_size);
>       fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
>               fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
> @@ -560,6 +565,122 @@ static int parallels_check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int parallels_check_duplicate(BlockDriverState *bs,
> +                                     BdrvCheckResult *res,
> +                                     BdrvCheckMode *fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    QEMUIOVector qiov;
> +    int64_t off, high_off, sector;
> +    unsigned long *bitmap;
> +    uint32_t i, bitmap_size, cluster_index;
> +    int n, ret = 0;
> +    uint64_t *buf = NULL;
> +
> +    high_off = highest_offset(s);
> +    if (high_off == 0) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Create a bitmap of used clusters.
> +     * If a bit is set, there is a BAT entry pointing to this cluster.
> +     * Loop through the BAT entries, check bits relevant to an entry offset.
> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
> +     *
> +     * We shouldn't worry about newly allocated clusters outside the image
> +     * because they are created higher then any existing cluster pointed by
> +     * a BAT entry.
> +     */
> +    bitmap_size = host_cluster_index(s, high_off) + 1;
> +    bitmap = bitmap_new(bitmap_size);
> +
> +    buf = qemu_memalign(4096, s->cluster_size);
> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            continue;
> +        }
> +
> +        cluster_index = host_cluster_index(s, off);
> +        if (test_bit(cluster_index, bitmap)) {
> +            /* this cluster duplicates another one */
> +            fprintf(stderr,
> +                    "%s duplicate offset in BAT entry %u\n",
> +                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +
> +            res->corruptions++;
> +
> +            if (*fix & BDRV_FIX_ERRORS) {
> +                /*
> +                 * Reset the entry and allocate a new cluster
> +                 * for the relevant guest offset. In this way we let
> +                 * the lower layer to place the new cluster properly.
> +                 * Copy the original cluster to the allocated one.
> +                 */
> +                parallels_set_bat_entry(s, i, 0);
> +
> +                ret = bdrv_co_pread(bs->file, off, s->cluster_size, buf, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                sector = allocate_clusters(bs, sector, s->tracks, &n);
> +                if (sector < 0) {
> +                    res->check_errors++;
> +                    ret = sector;
> +                    goto out;
> +                }
> +                off = sector << BDRV_SECTOR_BITS;
> +                if (off > high_off) {
> +                    high_off = off;
> +                }
> +
> +                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                /*
> +                 * In the future allocate_cluster() will reuse holed offsets
> +                 * inside the image. Keep the used clusters bitmap content
> +                 * consistent for the new allocated clusters too.
> +                 *
> +                 * Note, clusters allocated outside the current image are not
> +                 * considered, and the bitmap size doesn't change.
> +                 */
> +                cluster_index = host_cluster_index(s, off);
> +                if (cluster_index < bitmap_size) {
> +                    bitmap_set(bitmap, cluster_index, 1);
> +                }
> +
> +                /*
> +                 * When new clusters are allocated, file size increases by
> +                 * 128 Mb blocks. We need to truncate the file to the right
> +                 * size. Let the leak fix code make its job.
> +                 */
> +                *fix |= BDRV_FIX_LEAKS;
> +                res->corruptions_fixed++;
> +            }
> +            res->image_end_offset = high_off + s->cluster_size;
> +        } else {
> +            bitmap_set(bitmap, cluster_index, 1);
> +        }
> +    }
> +
> +out:
> +    qemu_iovec_destroy(&qiov);
> +    g_free(buf);
> +    g_free(bitmap);
> +    return ret;
> +}
> +
>   static void parallels_collect_statistics(BlockDriverState *bs,
>                                            BdrvCheckResult *res,
>                                            BdrvCheckMode fix)
> @@ -608,7 +729,20 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               return ret;
>           }
>   
> +        ret = parallels_check_duplicate(bs, res, &fix);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +
>           parallels_collect_statistics(bs, res, fix);
> +
> +        if (fix & BDRV_FIX_LEAKS &&
> +            (res->corruptions_fixed || res->leaks_fixed)) {
> +            ret = parallels_fix_leak(bs, res);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
>       }
>   
>       ret = bdrv_co_flush(bs);
I would be more happy if this patch will be split - helpers creation
is better to be separated from functional changes.

Den

