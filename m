Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160A5A28DE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:54:03 +0200 (CEST)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZmb-00075a-T7
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZHE-0001AQ-KZ; Fri, 26 Aug 2022 09:21:36 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:63363 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZH8-00042o-He; Fri, 26 Aug 2022 09:21:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THdN9cfmu8OgV2ExE/cTVereGvPo6Ou9LEeIWwKVLCVp1CQq0gFxX76XkMXe4Lx8g4UqXCXl5yEbvdSDDrC10WKXHRrc9Ha3qaxn92/2vnO5f4jw5die5hF5ekkkclDi7kZJn3We8GrReUOyifOLF24eRCrXte5Zw+CIiXhVPtkLcKoId9AdQs3mJbRMS2xD98rqjmM7h1IBnRaVJInoXTqjcjU1JSyr82sBEFxGUoT8MYpJw32kotPGNy9v+KUwbsU8VJWR+pYP5O/fgSh452mP63TiTIsmMJAZa8gWT12hDwJx8yx4V/7U3lZt9vDq2zEyUJh2Vsq8xcAh+vG8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vd4D/HEp0l2oVZecLkL5SD6hXktVkh7JE/q+KZlkyQ=;
 b=T1lHLlkn+4YEia0T2kC+tIRcrb6hjQ7Rzw8m/SfP3gRbsD4T+O9Jcu3rMP/0Qn1kdys9wXMGUNYUr2wRfUZPGg/0r1Nfx+D8QuLD+kpH2+Ux9IRRnJ6xbMIn+uwX92YLatJkEdzDoiqdrts/hdu/9COkd1JNc2Furr68kSckg/k0D32DKLvGs0wNPHP+X79+MdgW54nlkavYGMiB07YzpvwKtsl0U9PoERyi4cxo+B7rwz5nQY43lq50VO5HKqFXY+fcR6jFR9XUReBkFNq8zrCyf5JSt/DWmt9Gm5PijXmlxfBzb3OyjyCjCC8gnO3GTzikfH2J4SLtD7Qg5+swJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vd4D/HEp0l2oVZecLkL5SD6hXktVkh7JE/q+KZlkyQ=;
 b=dZQQQ2OQUmBYEUgreiWFxRAtvNMhWW+sez/iVTv80+t0+jvAPWi8W7vB2EPVAvCAQZmBf3+cmrJAt7Xun+2xIHpe0qkTFzZPACfamtIhJ+z0rYDffJYbRUoQxN/JI9QWwYD1rhfJEmJ62vXYRIBfwG+yCe4QrmV0IDdrpE9b2btEQIsP64tMgYrBud+6tn3O7WOmBn2dDzqXf/Ls47+S95ttgqxRcYyfnRCEe0xRrhiyx+9gC9lccL+gBN4YzMVcHl5y5g2w0rmoaafG+SMaM4uYNvHLwmJVpd/5u9JjiJQfzrI/6yQ3DntT24Aj74MByLsCtDl016NaHst7TQ6CtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB7761.eurprd08.prod.outlook.com (2603:10a6:10:3bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 13:21:25 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 13:21:25 +0000
Message-ID: <47c82f6c-3094-466d-8ca2-0f1c6f69540a@virtuozzo.com>
Date: Fri, 26 Aug 2022 15:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 08/10] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-9-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220825143109.176582-9-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::35) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d6c31d-2708-4ad9-fece-08da8765e05e
X-MS-TrafficTypeDiagnostic: DU0PR08MB7761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+ecD9y3zdjDWxOF1ve9qGzCMjyz4po3/4tRtU79rcWLz/0N284bJJn00PQKtt3JwLz+tr+BHUx15SO//cURhDKMvlA5dgTs/VvQVzkZuvSqoH5K/mVIH5HeySWx+xh6Q1ECqqd4B2KjCfm9WhHqQ19x8LFQZSokX9yB5lP3Hf8huEkCQZ9O5lbxZ2FyWB+vk3LnIHIq9N56b02fQEgPn1v+J4isZ2jMx7FbR/hCW96DOIR0opjass24em99cqFcs/yXX2rb1nQRTcXPnimYoFGyMZth7P7DdVNP8dEXFBs97Z+8FkbwmCPr0guQtnMaQ9apxNaIwd9LANDTna6ppTooZVfgqTAkHy3+V+V9RedTYtFjRgPagDLJ1nLD83dDBJdwxTK2XIVofJA5yCUa1jF7rPKQMeUyhwij+qCQmDvO4wLoa6UxMk9XJJlxH+/WCbqh0tZStHRaaeQqACJBzfAvYgZY9VZPm7jK9fcVCs1eZ9aq1GNZ3oTfXi1DaB6bUOXaikzc8FYkL0IpIcqv7pLlQ4GMTM36wbKAOVZugE6O5g855qhdpL6Cd6VKnJDxgzLDzJVMr/ol7LXPr8z4QlUdilXlxrH1wfn2b4eHpRNR8gqupNRwevyOwPgjQRo7nV57NogU+SsG4Can8W5PKrAhAgIcOh6zqRsRWdwt7LVgWXcJBinphV2p1g3CNrVNdjDhkljMi5w4oQyCK0akrAaMQFRDga2WDeCUeJmV+EzqK0HvR9b5/t1c1YY8VvXt5KeiKaPXYMCfK8PKqkFbpNpUXYLKOZBC7tCVVjKxCCpNDf6Aow/j/v+0Sjlom+E+atpWarBLYlz19mudOwcO2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(2616005)(6486002)(38350700002)(26005)(41300700001)(186003)(6512007)(53546011)(6506007)(52116002)(31696002)(38100700002)(478600001)(86362001)(83380400001)(66556008)(66476007)(4326008)(66946007)(8676002)(316002)(8936002)(5660300002)(2906002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjNjYTdSWWVWN3UvczZZUFhYZmJEM2hvYVZ2Qm1YWDQ5MWFFYldaUm9lbGVo?=
 =?utf-8?B?bDVaajlaVkNXaVF1UWpQb2tKWFliMEtzOTc5ODZRR2prUWNnaGlGRUhIVDh1?=
 =?utf-8?B?dHRRT1ppQ015NlU2TzFuVlg0eVppa0xZL0NOZmZhbno2WFNaN3FXWDh6a0tq?=
 =?utf-8?B?SXZyVlBuVEh5SE1FZDA3RlRST0pEOTJJSGp1QXJjbWhKWmdaVzMxUlZiSXJZ?=
 =?utf-8?B?cEpseDBpS2xQYUcxZHhpclpUUDg1cHcyVC9YbVhReGlsRE55UG9XeDFTWW5n?=
 =?utf-8?B?ZjdxZlA2eGRid2t6Nmlua2cvWko2NzVqakJWL1ZuT2FuYkFVcUw0SU5wTHow?=
 =?utf-8?B?cnMyME10eDR4UVJmbTRwS0o2YXF5bFRlTk1pc3VYNlhDWm5lZnZVL3ZWb0lp?=
 =?utf-8?B?MFdLeDRuU2FxNjdvNXJLRXJMMjhjSVB2dEhxMEVvTnFXbmJUcUVNenllYzh1?=
 =?utf-8?B?TUlBN2dVcFl3blZzZWZqVk1PeHFjeE1IZEphdGtmdEFtQ3A2QTJQMjlmaWg3?=
 =?utf-8?B?QlZ3NGlKU3Fuc09DYTlyNmloZlhrZHdMWENyVzFTTXhlOWZobUI2WGRWTEJM?=
 =?utf-8?B?Uk53NXFoMTZvMDRFTldBMFZOUVNZZ1E4NHBVemRYTE93bnR1djZ4Q2QxVS85?=
 =?utf-8?B?UitOZm9oQnViYUEyQTBKNkFFRFg4aitpUzB2OGxUTjJjS1RWd0hWL01iWmpU?=
 =?utf-8?B?Y3ZYRVVtd1pVRWNGaS9yV3ZCVkxOek9EaVRyTFducXVxNEt6eXYzN2NMRVhP?=
 =?utf-8?B?eEgxK05WY2RaL0JRSG40WXdqVzFaVVpySUYvRlhGK3Y1Y3F0WXBlYlZYZXlF?=
 =?utf-8?B?WCtISEpOVUdlcW1LakRrUWVTOUJ1MFNrVlY3UEpqY0VDYTd2a0poUUs4RzhV?=
 =?utf-8?B?aXNMVjlWUmlYYTVCTDhGTUIwZ0VUZUFWZHZwVnVpTXhyeHBMNWZGSkJ1UGR3?=
 =?utf-8?B?ODVKRnFTVHcyZllPSnQ2OTlOWHRBMzJUUVJGQSt2T2xycVNCVzVzTCs3UFJt?=
 =?utf-8?B?Ymd1ZGRwV1RKVjNXeUJ6YUJHUmgzb0UxVlVGTVE1MGl4SzB2c3FXeWpBVVRh?=
 =?utf-8?B?eXFCV2xQTDBhRzkxYnRxZnVieTBhd1gzdXAwTVFpb0QzNWR6dG51YUQya1Vp?=
 =?utf-8?B?bmpJcWNlb3RackFVVlRiU0FrYTM0cTAxYXZVUHkvSWRINmZERnNvNnFqT21x?=
 =?utf-8?B?NVNqTTNnckZQRnFOUnhqYW9BWHBXYkRmUVk3d1VCeG5qQXdOUS9Idkk0cXJ3?=
 =?utf-8?B?bHJieC81Y3BTbVBVRlNpcEZBUnFmV0daNE4zbmhOY0ZJeTFQekxWdlJ6dCtl?=
 =?utf-8?B?aGQzUndtWmYyNGlwMmliVVJZb0t2clBidjFaWHZIL0txZ3crKzM2Uk9nQVht?=
 =?utf-8?B?WE56VGxSbWM4ejM5SVJVZ1MwZ2sybktDYlo3aDdlay9Kck83SlpnaTJld3o3?=
 =?utf-8?B?ei9YWm1kQW10R25mb3JIMlFCSTA3SWRaRHpzL0d0QWl6YjlGUzN3UUpyMkx5?=
 =?utf-8?B?VUlWdGIrc3RJTldZOG9RRVkvYy9NVFZ3ZnVWV0Y3L2oyczFrbGl4UnMwTGN3?=
 =?utf-8?B?UnJxcnJ5bnl3REFIaFZvYVB1dlFrTTg3YmhMTzFySytuTUJKcHpUZ3NMZ1k5?=
 =?utf-8?B?enBXL1hoSzh1VnBLMkVWcWNJQkFQcDhWSGIvYTRqOTZmd28vc0FIcUpxa2F0?=
 =?utf-8?B?QXBGeUJhS2ZEaEwzMGErbm9xeURISUJQVGJvUjE2UjczV2dJT3pxNXl1KzRt?=
 =?utf-8?B?QXBJc01zN2p4T0c2ZUUzTE9ST3U5SGJaMzZweDRFVTFVc0NXSGxFR2tjN0Ri?=
 =?utf-8?B?TEJwMlFueXpOT2UwVzg4RnNIWG5hbDdaaFFzNGJuZnZpeHdLK0hiZld6R2pN?=
 =?utf-8?B?K2JBdlRNTWcxQ0MxYmRiWjc0QlRJUWdMdnhsQWI2Ti8zWWVlOFR4N3hhYzFy?=
 =?utf-8?B?MDB2YVFlaGkwVlY4aFpsYTFJL3B3UGlwUlU0WGNFNXJiVzZFQnFOUGpEMWRC?=
 =?utf-8?B?aTJ6ZEdaZUhvTE9FSzJRSTRIcldhL3RJS1JqZHNTUG1EVFBaNEFhS1JMSlBX?=
 =?utf-8?B?OUgxYUMxNmZ2NU9GYlVIR1JjY0NsSmR1aGFIM3NkQks3OVJ3aG1KeUJlSkEy?=
 =?utf-8?Q?yN7Mx8eSu1ypEKlUA9nGXIOYV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d6c31d-2708-4ad9-fece-08da8765e05e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 13:21:25.3833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTZ0TgWlZwh7Qhonc5r4kBnyQyWqTQDhGLeM/n1JMb17ZTpW4yUsPtUdz8OD29vCCe8C50wW/wvAK132uBqPcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7761
Received-SPF: pass client-ip=40.107.6.138; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 84 +++++++++++++++++++++++++++++------------------
>   1 file changed, 52 insertions(+), 32 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index f50cd232aa..1874045c51 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -475,14 +475,14 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static int parallels_check_leak(BlockDriverState *bs,
> +                                BdrvCheckResult *res,
> +                                BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> -    int ret;
> +    int64_t size, off, high_off, count;
>       uint32_t i;
> +    int ret;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -490,41 +490,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           return size;
>       }
>   
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
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
> -        res->bfi.allocated_clusters++;
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off > high_off) {
>               high_off = off;
>           }
> -
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> -            res->bfi.fragmented_clusters++;
> -        }
> -        prev_off = off;
>       }
>   
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
> -        int64_t count;
>           count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
>           fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
>                   fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
> @@ -542,12 +517,57 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               if (ret < 0) {
>                   error_report_err(local_err);
>                   res->check_errors++;
> -                goto out;
> +                return ret;
>               }
>               res->leaks_fixed += count;
>           }
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
> +    int64_t prev_off;
> +    int ret;
> +    uint32_t i;
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
> +    ret = parallels_check_leak(bs, res, fix);
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
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>   
Reviewed-by: Denis V. Lunev <den@openvz.org>

NB: we have agreed that we need additional patch here to avoid
BDRV_FIX_LEAKS with errors if BDRV_FIX_ERRORS is not specified

