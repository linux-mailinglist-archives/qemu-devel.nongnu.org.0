Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E30683191
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsbH-0001l3-JZ; Tue, 31 Jan 2023 10:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsaB-0001Uz-VX; Tue, 31 Jan 2023 10:30:06 -0500
Received: from mail-vi1eur04on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::72c]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsa9-0000Si-DO; Tue, 31 Jan 2023 10:30:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPYosOdRkCTRXp7wYP2zYwvcDl2BHQt8NuivTnP6Pzj0Pj/OHpGucPnps6vjnpYXOZdC3HTqUPLBVbUUzybUxQIwvO4niauIXIHyEdWvk/puv+/asiEYkUx3pKL1aez6kl3WPYJd8ylJ49Oc6Vf8hiqmpCGxcQcSGHcYdRKVBd1szygxfX6JYBnfpGZY0eJLFKQePqz6rcFKKRFOVv7VAnjzVlzz+Qi/FKz3urYIhAnuNY9MWcsSs3b1MObKlzf0OlZTojHm0kltIUG+ZS2pmQ1kuPzzGjXEgd3EVfKdaK+61xwCdwNEEvzEdoenR2jftTH4dIyW2dNKnpm/9/SyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy6rvWYgeOMFFSEuM5jsQeiMGHGhBgpHl0F3d0G+ABo=;
 b=hLVl8r4d3xV1qak3OaCvh/iMb6pOAZjnhum4OA6yAT8bMA+1zxFWj4yC0or9OSYIHeb8j4QhgAQGc3tdcrj20W5seVY+mQ0mfoESXCK89u7TaoDNutX3agCVgy7udQAx0wFsWSGzycqQDXJYq9yve7e/df8H5qYUopFAAjeAPOVYTcconzZCYuGLI6Q3pvSrCPixHrAJYQU/Q+I6d64rL+IBPGoxQBPdlPLFs+YFoUkRriUwtZIS2xeV0be1si21V1dUCfhLmauHfuI5OLp+5LIF/11lLy4lqrdgIGYvInfq4ler1eTpcjQTxb+kU1ho0OnCJORiOXSL+VJ5g/dCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy6rvWYgeOMFFSEuM5jsQeiMGHGhBgpHl0F3d0G+ABo=;
 b=oUp5/zLBeIB1zbKZXtUHL+pyWcabzQB/czRbMYyqZIQ4a3Enu7e0L6yLZgChf1AaDteoG2lflgo87upGkeValMbtEB9meiqtqGaz6MMtGGINdww7CyP0Hb1MRHImmd7tM40E0vV0GfmVDbyDF7NrOgRn4tTqRUSjvnb9cI6lgMVuMjCEi8UZTpmaD0FEtTh0LzP4oVwlk/v5r5x8uCTdyUlKoBHo/r83n5n8jwsLx/MMeYQYQ14ekYhhhDD1HL5427WZyJT8m5x2nkBv99uaC5LvJeeZjgtqL7ObNDZ3XPHhNNBpfDSOIU5jduJ5VOYU26ovCm0zIFhErQ+TZ9nOVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAWPR08MB9686.eurprd08.prod.outlook.com (2603:10a6:102:2e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 15:29:54 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:29:54 +0000
Message-ID: <87417e7f-8ad1-f867-e93f-bf25d3743afc@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 07/12] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
 <20230131102736.2127945-8-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230131102736.2127945-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::24) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PAWPR08MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bc8f47-17ab-451b-65f8-08db03a00048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7moVczrl3hVIeCBi+FbwUpIdRwTd3fmqUikHXFS4HLwiFa49xU3s4kSdRlyaNmSXPm6DQImSlaNJRG2tLesDkhpTaghcLHF3M6fT4xM8nBHNiNZo/ZUW0XZ3lK4uGAYOwbibi/21Hpr/X4DBTyDfFdNGMw9BMk+8cX0jlmN3YcozAmziLb1A4iVMPBQHZ8yhmkVOrTDMQckFXsnW+MDoCwQJz6Q7mU9kZ/R0Es/7fR68xF632NcuwZBPS1DXvugKmjo5+mCQBV755oJ7htZWiVDYY8Y62o+3TD78fN2XNHLzxO7V+YN4M6CKiu0e8s/cPkhUabwaJC6Zxn99RdqUQWJ4e/rQP8gQgQu2k8SkG+7btrcOkEI6/v81BsDXJOobDT6lH1COsFo6Dp1lcFf3CTfhiGHSAsdjHzGG/IxU2TBJhMqhef6TgUgn6WskkScCL7S8IvdoVDeOhlGhuxu0JyAnVsDeMdkxFdDlvVWqg9z/Xc4Dmhn7PkYXu3a2KszT7qEL1rOzxJ8/KKb2MCI0wGm5NZbyAX7UMxS0OljxT6MUTU+qfk2Hh+JT1NhQRnqlyMIW0JwwVv8XB5HQ67TvhwMh7V9KzoteymxH0tRoAbEXRpOEOfP+6FwYwGZjT3AFPq23g+gwMpcrwFv8jRLqbzYbXshVNubw8r/ivx0BGbgF3ba+buCRHIyOTVPiQuFzoHjGecGn5RulrpWls0YoXK89GX0pHAZH/N6CgBYS1KE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(451199018)(66946007)(8676002)(36756003)(66476007)(31696002)(83380400001)(86362001)(4326008)(8936002)(2906002)(5660300002)(66556008)(38100700002)(41300700001)(316002)(31686004)(6486002)(478600001)(53546011)(6506007)(2616005)(6512007)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVIaHJpSERXTHFSbDNHWjNoN1MvNTFZRE1oY3I3YVR6U0RNZVlhbEhselkv?=
 =?utf-8?B?blEzWlRZdVA1MVFyMC9yTSszYW1kVi9BM3pWR2RmQ2FraWdLV050bUZyekNN?=
 =?utf-8?B?TkJkbFRRTEE3TWw0M1g5STFNME91WGRMVWd6bGF3YTZ4VWdhbFZ4bTBvSVND?=
 =?utf-8?B?MlVxT1lGWUFiQ1VQSy9VZFRjYnMzemN2U1N3MTgyRkhaNVhOVTdyRWhtRXQx?=
 =?utf-8?B?RHpXb0l6TlNTSzJ3dXB6RVo5RTNTUTNrdnBwQ0thckFaYkxGNEF3SGtraWd6?=
 =?utf-8?B?c0E0OHNDazNIclRYbW1ZY05YVmNtc2V1MXFKSGVUejRkUGg1dzFpY0hwdHAy?=
 =?utf-8?B?T0kzMUFDajg3cUZEbXdTWENFQnhWcys4R2pmODFxdHZ6ZHpLYWdpbW95MEhH?=
 =?utf-8?B?M2pnNnl4RS9tOGFlL2ltT1U1RVpvUE1GY3Z0N2dNU0EwOFp3K2p5TXo0ekxs?=
 =?utf-8?B?ZVBOamVjYXBDaGZwNGcrM2Njb3ZwbmRQZEdtc09YekxJVGVCazhHQnZkdnBO?=
 =?utf-8?B?ZjkvRHZ0c2RpaTBCbmRPckNwZldPbUhxVHdVUkJGSGh2ZWQ5eWR6TWlmZGJj?=
 =?utf-8?B?WlhQdURzaVlabGpaVUFJNDErQWRsaXhzSWV6cnJ5TFpCUCtWcTVrUHZhMXNu?=
 =?utf-8?B?ZVdwL2VEQTNoTzM3Wm5sVENvdWlnUk1ubzVOU1hzbTd6cXFYZy9YTWJnWGdP?=
 =?utf-8?B?V1VMYmtQRXJYWXBxN2crM0dtRERtclBNaDRhRFdiWlFoSXVCNStWbUhhM1M3?=
 =?utf-8?B?amVMQjlnTVlWY25TRCt3MEhwd1NIVDNCdENkRDFVTkJEWHlBSWxiUTBET0Zm?=
 =?utf-8?B?WEtJdmFoc3Ixd1E3dU8rRTRXeldiTndkM1F5VndjT09GQ0RXZVduYytQV0RE?=
 =?utf-8?B?UjBYUmFjbVV0Q28rbXVCeDl6VDkzOUhNR2pnMFl5b01mZ0Y5SmMwcnF3a05o?=
 =?utf-8?B?RHBsS1B5UnVYUklYOEJ2dWg0WitnWGdiZ0JVK0p2Nnc2MVA1YmV5aDZlZGNj?=
 =?utf-8?B?M0RoQkZvOFRpUUZpbE5aNlI3YmlJQ1hkM1VjUk10Ry81MXltUC9pbUJXakZt?=
 =?utf-8?B?Umo2VVl2YzB5RlFiZURwTW1DZndYeHMwMTRzUFVjWW96cEh1djlQbjViTmlO?=
 =?utf-8?B?SmwvTUt4SHFVSWFLclkwREh0U2lkNGMvVkF4QVp0NW03R0Q1TDZXbGJ0bDMr?=
 =?utf-8?B?dHNtUVE2eUJ6RG5pMnBtRmRDSnVjRmNSdHhtaXJnNFVWcjAyNlR3dXZTZWFj?=
 =?utf-8?B?V25sWlkvb3FJM3gyRmsyWHNkejBocTNoUVdzSmo5R1VZdFU3SnA3M0Znc2hj?=
 =?utf-8?B?MTRNVEtLb2sxb011STU5T3M2L3U5QTV3a2cxbjVMU1NyQ2tYWGtCdXdMaFNp?=
 =?utf-8?B?YWtRN0NaOTRQNmFpaVk2SEJSQ1JKaUErUjRWRnZnWmFYT1VwbCtnTHJOS0RG?=
 =?utf-8?B?Qks5NHZnZ2FzQ2hJTVZWSDNiMi92TXBac3hnNC9hYmtFcnQyRG9YZ3FzaC9G?=
 =?utf-8?B?ck5zczUyaUgxYWZ0NEpKVThzNGhCSm9tNitBcUtvU3JHNW54cFZXWTZCa1RE?=
 =?utf-8?B?YlBHQkpoVklYTjN6TG11Q1ZQMERSTTdEa1liSGl2L2pIUjkxbW5ZQjE1Rm5p?=
 =?utf-8?B?MFlwKzdRMC92alA1aWJCR1hTQmllY0xWMzF3bEtibGZNMjUvSi95aFJZdFpQ?=
 =?utf-8?B?dVhxanhHK00yUTl1cUU3b01oajBCK2ZZenl4NXZRQXUwaFRrVGUwa3I2R1JF?=
 =?utf-8?B?dmF4dUVxbHhHQi9lTDIwWXhkUWNXN2lJWmxNUFlRRHdLdWtOM2dGa0JpeGpM?=
 =?utf-8?B?UmZKODRUTTBZcFA5OThJbllUcDVacG9VRnZ2c0NJdktiZVFvdmVub3BwL0V4?=
 =?utf-8?B?bWNvNU0xeDZOQmg3NzFpbVlGZVVRUks3TmxNUysraFZNeXV4ZmhhbytTWXdV?=
 =?utf-8?B?N0kra3lJM3RBRnY4aFBzQktNbXVHNmxZc2pFdnNjQTZKOVBBU21qMGl5UGRC?=
 =?utf-8?B?N0xiRWt3V2V5SzdaMlA4SGpMTTB6QzlaZEJ1S2ZUVm9NdzBuZk1EbHFoR3pu?=
 =?utf-8?B?ekE4b0twZDI0RHpwUmpnam1LWTRLSEszeEt6eEIzdTZITytiampjSnk4UStu?=
 =?utf-8?Q?mvxWQnMUBw3VV9pE4EOG1rPTP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc8f47-17ab-451b-65f8-08db03a00048
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:29:53.9029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8EynSQdYXwXMlJpl7C5YBlPIUpTNOWYVlY3cDo0HuZNFYNVba+euV1z5BmJEU5wikcNNz3s9gNA5Hhnt0Ni5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9686
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72c;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/31/23 11:27, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure in
> parallels_co_check. Let each check performs in a separate loop in a
> separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 81 ++++++++++++++++++++++++++++++-----------------
>   1 file changed, 52 insertions(+), 29 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 02fbaee1f2..f9acee1fa8 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -438,14 +438,13 @@ static void parallels_check_unclean(BlockDriverState *bs,
>       }
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_outside_image(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> -    int ret = 0;
>       uint32_t i;
> +    int64_t off, high_off, size;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -453,23 +452,9 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return size;
>       }
>   
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
>       high_off = 0;
> -    prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off == 0) {
> -            prev_off = 0;
> -            continue;
> -        }
> -
> -        /* cluster outside the image */
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off > size) {
>               fprintf(stderr, "%s cluster %u is outside image\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> @@ -478,19 +463,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                   parallels_set_bat_entry(s, i, 0);
>                   res->corruptions_fixed++;
>               }
> -            prev_off = 0;
>               continue;
>           }
> -
> -        res->bfi.allocated_clusters++;
> -        if (off > high_off) {
> +        if (high_off < off) {
>               high_off = off;
>           }
> -
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> -            res->bfi.fragmented_clusters++;
> -        }
> -        prev_off = off;
>       }
>   
>       if (high_off == 0) {
> @@ -500,6 +477,52 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
>       }
>   
> +    return 0;
> +}
> +
> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> +                                           BdrvCheckResult *res,
> +                                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int64_t size, prev_off;
> +    int ret;
> +    uint32_t i;
> +
> +    size = bdrv_getlength(bs->file->bs);
> +    if (size < 0) {
> +        res->check_errors++;
> +        return size;
> +    }
> +
> +    qemu_co_mutex_lock(&s->lock);
> +
> +    parallels_check_unclean(bs, res, fix);
> +
> +    ret = parallels_check_outside_image(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    res->bfi.total_clusters = s->bat_size;
> +    res->bfi.compressed_clusters = 0; /* compression is not supported */
> +
> +    prev_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            prev_off = 0;
> +            continue;
> +        }
> +
> +        res->bfi.allocated_clusters++;
> +
> +        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> +            res->bfi.fragmented_clusters++;
> +        }
> +        prev_off = off;
> +    }
> +
>       if (size > res->image_end_offset) {
>           int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
Reviewed-by: Denis V. Lunev <den@openvz.org>

