Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A222A58C860
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:31:02 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1uP-0005LG-PW
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1pq-0007aT-R1; Mon, 08 Aug 2022 08:26:20 -0400
Received: from mail-dbaeur03on2110.outbound.protection.outlook.com
 ([40.107.104.110]:37504 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1pm-0004qF-Ug; Mon, 08 Aug 2022 08:26:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3CwAsJaE0RJ+ELmQ4pqx5ZmtQR0K4LNTMewIgia40qbDXTy6/btygorJRCO5FHtOFMP+Ir9ntI3/s4QvUaDw5X9m/FXupgvLz2+iY+jU2zw3opw7e2njm6ecOrifsOwn2CxFDSoXowpYOntqbGqoYYDArO7GL0IEJhGgOpUzMan0Av3ZbsnO0M10mAfP3uv4VigMLjAobn49agmfylOuq3c3zGMzmajRtxTtjdI6+NXIYo355jr+5dqfkkVPUmmxyY56Q4aiCTaUJaFVoYBYFazjF6AsuEBV30cr7dbj3UfJiQ2g7NUtlo1s6f9ye8f2cDIa3qeZQYoK/HKh+XOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWvae9NAIjgfoGBj14VRygjQw0bb3zqWmSW1svRobS8=;
 b=gK2uBvxbni8vLMvx8ynGcgkmr6QC19ZCGBB7n+Ln4NGwXjIUYqx1htSw/g02My3nYYlASQCncMG2EbSZYarcOP/zAvFS/wIWC1RZWmSapxLjI3RJwaUNv7ACzvdwjq4MO6mK1/NNwYR30tEwQ+DH+v2HlIm5VuJZwIIBA7PSUddjVJjTWngH1mVlD3+4tqoi/lcO15AUe9ryM6DZFCo2076lk9GftRG7WsBR3hGbvW+lPBtYUP+sfR+3kd6sIvEtUiRUyrgoPU6tkvzrqwAuGhelrxWvBWk0OLUcUXNMmiB7LPsJjweQSbU7ZKiB+kMhsIlv9ht+jQfHK3/+PTMMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWvae9NAIjgfoGBj14VRygjQw0bb3zqWmSW1svRobS8=;
 b=GnQmkazeCiKjkX7DNqn1sr1d7uDb8Q33/yXF+HPvx+uG2ZeRavNaxvPGMj63zEzFClWCzY5Uyi2tbH3wrJPAjC7Av1vhfaI6afh1qo2FxwF6Wmhq17XSumNKOQsn/pgLTj7kEhgp4Ffu5u1aeu527F6am8fw+QFOPX47eUCfSYiIE/zJDWWdCuDEU3/S/TXlbXknLdA29zlx21svS3nDBkZaqX1DmcMhLtX1ZWgZJkZzxDamJPpIRZ0y8t43JfvDuUsH8hQdV2KFe3EPXgSvd8GUGFYDQ1cuuujGaZEwVJB8q7wyIrsOGtVNOwJsBwoAwKvCqrIbtou7XdMrbDpzng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:26:08 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:26:08 +0000
Message-ID: <4f3f44c4-d53e-b7be-a4eb-f41bc9255052@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 9/9] parallels: Merge parallels_check_fragmentation to
 parallels_collect_statistics
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-10-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-10-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0138.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::16) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9411967c-4648-4200-0675-08da79392bdf
X-MS-TrafficTypeDiagnostic: AM8PR08MB5650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPTQPGjsAaRMUM7T6QChZesqR2XxshKV2v478BH8YCoZ+ehQVbclB15qzsRe3ukwqPl4BaKrtn/c7zZmEEt6QnBGsLvstCOKydxEEtkNlUm03iv/MuieLZRIzWY75hO5bFjrsBXbxuaNF+Zs6+F/T95vVGvJ+e+ij2dy0Nc8KQrykBJGx/fgkzAnVZBpxzaD7ddXMX1cvOQrasjSX+OksC7knGEw6qKhnVuPUONBSDQX8y190d6wygnGi/GHRCYZ176nmCjfX2UZSSzTKIVjkzLn2wYPndsksdIbcfwT/a6quZtWZViY1xED6BS8If/5DrmalQymdh3DCTRNJ6J74m8LzCQbjvqQna7eCy5gsg9qXIveTZwIQdEU7ncEHv8oM/kwXqejU/4ywi602RK1ZwNy4fj8pz044Wet/qUjr9CH/cK+akjrvaMSS2eXFowEGuhQLKJq6Ubp9GqJOLPAUZ+oEfeE/eQzXRqR7FWZLOsnwjWchlGyfKbyFE39xcgT7ej8cnc5i6IztXMinUo+trq3Dqpc7PVGGVp1bXoj2nVbMgOhyhwYiR9SUerOcnWjWP07zyCgBa3zPBDOcW5i0oJ76C+8Tnx3e7dfiCcMgX/gm2GDj4hltc2ChcSOZ5oJ7KzcUFo5L1Rk/MUfDZef3DSkcnbXOzkfByFbZZRI+WeMl0iX0fPWOogK9mCvoXeltpRr+jbnutwMl9becGycPumeFjzjBA4njJPYm9aWepOsuMi76epOcYZvgoPsKa+2749cpzg478KY1w2n2x+/beouDKbJA0UJF4uuTyiyVYZ1l/OSEiGMgvur4I58CWH+4j3nRV5njBcvnunEXwDET0ecx+sOMz0tDOVaSisAYqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(83380400001)(6506007)(53546011)(41300700001)(52116002)(8676002)(66476007)(66946007)(4326008)(66556008)(316002)(186003)(2616005)(26005)(6512007)(86362001)(2906002)(36756003)(38350700002)(38100700002)(8936002)(478600001)(31696002)(6486002)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZqMFU1SjhXUTdUdVNsUVZjaDB0elZ2d2NFRCtRdUZjMEdCbGt1NndlNmpn?=
 =?utf-8?B?RkdlQXNsQTJSLzRQcG9kN1dlS291dForOURBL3NqRGpYR1J5aENTZGpIeHpJ?=
 =?utf-8?B?aHFNM3ZqTFlEeGxncDVMZTM5MU9MMEdUMDBhREtKNzZNM2t5Q09obkxHWm5C?=
 =?utf-8?B?NFVSa0lvS0g2RGVTdld4N1FPK3Qvc3lpZ0orQ3RvN1ZVNHFkRFZ0QzcxMEtQ?=
 =?utf-8?B?dkVQdWh3REFTMVBoV3MxUzNCYUZMbTNrU1ZzdzFUdVNBcXo5ZURWWi9RanpI?=
 =?utf-8?B?Wmw5eldnZTluWk9sVzNwQzZ6ZUhSako2cHZ5aWhWQTFaeTFoUWlQcFh1V3NX?=
 =?utf-8?B?NThjTGQ0MERKUm9vN2FQQ09QRDhZQXFLWExUdW5nNFlVakhPUlB3UlZXMU5a?=
 =?utf-8?B?TE5XTXZVWVRhUWhYTW5VMHJ6STlsVXJ3ekkxN1VEUUxNQmZFTm1PSGlTZnQ2?=
 =?utf-8?B?VFo4c2FpOFFhWWh0NzZtUFo2aWc4elZsMUIyRlNENlducFYrakJsNWkybHI0?=
 =?utf-8?B?SUJjWVgvc20zK1pkRnBIaWNmNEI0aXJDS0dCempQYUdFcHNrSXhCWUFTa0JH?=
 =?utf-8?B?VGl2ZDN0bnRJWks2aTludHVrMEdCejhmL0plUG9JL2Zmd0VoMGdTUklpYUZC?=
 =?utf-8?B?UnRBQlZ5MXZ0a3JIMVcxT1ViL3lBcDh3c0Jvb3ErSUI2akcrRlArYlBLTElP?=
 =?utf-8?B?anBObHA5YnZQUFhBcEZ4cmJMdGZNeGIvOVRTYzZ2YjUzWXNyS1NmTEdtcWl1?=
 =?utf-8?B?aXdDd2xtQ3hlNTNtSjJGRUNtdXFaK1NuOXlBNHVURG1BcEhtUGFmbmZnWThr?=
 =?utf-8?B?ZjZpWlFkRDNuaTJRMVh3Q0o4d0l5Q0lnbXdxV3l6aDBGTktnNHk0ZG41ZmFq?=
 =?utf-8?B?WmxObng0Yzg3eUo1LytpNmhmeDBBY29CM3NyaEtLM3RtSUJmb0JSQ2p4WWRY?=
 =?utf-8?B?VEpxU21zK0RTVCtIMFZJeHQ0UVRIZEtpSFZlTytGZFNIT0MzMVRJUnlVR2tj?=
 =?utf-8?B?NXlmN2lobm5JY25LaFNBMEx5aXBtVGdVUVpudlpnTjRMRUIyM2hLL3VmTmJW?=
 =?utf-8?B?ejVZZ2ttQ0lUME5iK3FDSFRZUERGR2FRV3BFN1dkdk9GczhBY2hSTFZKdW5L?=
 =?utf-8?B?SGtnOWxaK1ZvVGR3UFIzVHdZVWFQVkVnYWpqSmlwN1pkaHpndEpXTk51MlNv?=
 =?utf-8?B?SXVtZmZab0Y3QzZXd3BKYW10UkNPcEdoWGtSalpheFNMWWExZWNyZFQwVU5W?=
 =?utf-8?B?TGhnQmNUQUtNbXZra1QycDkxL3RCUEVUMUEyUmR1OEJ0eGV4SVVJVUozV29R?=
 =?utf-8?B?eHhyb25QNEpLbmJyb01KaENIU3VSVndxd2xwRnlXS1J2emg3VERVbEY4Zjlt?=
 =?utf-8?B?WFN3UVpZNjV5MjB4Y3JPYWlGY09yb25wcVRlazFDTlVrS0MweHpVTG9UVjBO?=
 =?utf-8?B?U3UrWDM5eDllUE1uUURSeE85eEc2S3BPZ1J1ZXJqcWZlY0hkSUZMU09ObW1q?=
 =?utf-8?B?aHV3ZHVyVGY3MkRVS2tjZ1JmMEZzb2RmU1Z2U0QwdUoveUMyR2YyOHJDek5z?=
 =?utf-8?B?N28yOVcycmxxQy9ueHc3Rk9QK1hTYytHL2JSaWg2NlBDVXlZNjZWQzVwNEJj?=
 =?utf-8?B?dTdkaTI5cCswNXRqS3JTM3ZJd0tybzFteU5MeUV6WWFScEdrbVJMWUtkaDAr?=
 =?utf-8?B?T3FjaEpaMlV3SzRmOHo5N2hlMmo3UWJmanNyL0pwanhHK1RzUVEvS3IxeWpR?=
 =?utf-8?B?ZGNyekVSb2N6NTJWb044TnExSEkvVEdLYVBCeW9sWGZOckhKOGJScXp0blBR?=
 =?utf-8?B?dzdYZjh2dDNSM3RTOHROZkRHS21qL1dKNVdLZVBJdkkrcjhpc3BSeVNlR2RZ?=
 =?utf-8?B?Z2doWTZPQWJ0OGZQZ2lyL3ZKdEdQVjhNbVRHcUZ4b2djRUxSUktBOXFUcUZV?=
 =?utf-8?B?SWFCY3BBVmx4b0E1Y2VjdkxWdDJwT3U0UnNPbmJWRWtseG1URmVhUXRSOFRW?=
 =?utf-8?B?a2VHV1AxZnAzdk1qKzZZdFJQQXhYODMyVTR5dEhmOTlPdzk4bkRtTDF0VXBa?=
 =?utf-8?B?UWl3NFk2c2ZOSEtMZ0E5Sk5zMEorTkEwa2x0am1iVkV1c3ErcldwdFFZQU1v?=
 =?utf-8?Q?eG1UYOaOGm6rfrxnof2swJwB0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9411967c-4648-4200-0675-08da79392bdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:26:08.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsPoDsP9Y0BoXINR4xC59C/y4y0fQgvSZgcYxmdtIV+rHLv2a3mbyVepaGIsk/ZuwHS5UiE4QaizZHQ5Y5T70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5650
Received-SPF: pass client-ip=40.107.104.110; envelope-from=den@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 08.08.2022 14:07, Alexander Ivanov wrote:
> Frgamentation is a part of statistics so it is better to count the statistics
> in one function.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 31 ++++++++-----------------------
>   1 file changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 38b1482e81..11597c5dc4 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -530,13 +530,16 @@ static int parallels_check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static void parallels_check_fragmentation(BlockDriverState *bs,
> -                                          BdrvCheckResult *res,
> -                                          BdrvCheckMode fix)
> +static void parallels_collect_statistics(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    uint32_t i;
>       int64_t off, prev_off;
> +    uint32_t i;
> +
> +    res->bfi.total_clusters = s->bat_size;
> +    res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
>       prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> @@ -549,24 +552,8 @@ static void parallels_check_fragmentation(BlockDriverState *bs,
>               res->bfi.fragmented_clusters++;
>           }
>           prev_off = off;
> -    }
>   
> -}
> -
> -static void parallels_collect_statistics(BlockDriverState *bs,
> -                                         BdrvCheckResult *res,
> -                                         BdrvCheckMode fix)
> -{
> -    BDRVParallelsState *s = bs->opaque;
> -    uint32_t i;
> -
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
> -    for (i = 0; i < s->bat_size; i++) {
> -        if (bat2sect(s, i) != 0) {
> -            res->bfi.allocated_clusters++;
> -        }
> +        res->bfi.allocated_clusters++;
>       }
>   }
>   
> @@ -591,8 +578,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return ret;
>       }
>   
> -    parallels_check_fragmentation(bs, res, fix);
> -
>       parallels_collect_statistics(bs, res, fix);
>   
>       return 0;
please squash this and helper creation patches. There is no sense to have
this as a separate things.

