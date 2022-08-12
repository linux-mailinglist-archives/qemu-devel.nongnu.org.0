Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A4591291
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:59:13 +0200 (CEST)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMW7z-0001ur-0T
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVyI-0001U4-Qf; Fri, 12 Aug 2022 10:49:11 -0400
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:33776 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVyE-0000ti-Tx; Fri, 12 Aug 2022 10:49:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKm19Zbf6jZ4oe+ZzBE+uSB1QsCYjtubGvkJPX3fZqkxdj67TfpymM+Vde21DUtRLgrQ1exSTewUR/KvP9pyWfgnMTwVLaMIPmDBxUh0AqbEsLQP3LDimHrOkg86EATnxJCQJSYlwIfN/LbULZnpwfrHDMlhRMayw/a76MmTI9RXAL76Uo+UFywuRhZiDPGQhdrNaR1nHhJvNwy4KyqnvW4m4sfF65ygc4RznzVcN0NR+pcL2vbuAvMqDCWHtEJFRJXw9Kopu+jcSya10Kb+A6PuBYq2Wh1XnX12qfLGLCNHqjEO5DH5ym2v77CMc+mG2Np3jl8sMyC8EHubSlO1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6xqTIrLyI0geliz9CJWjHqakK0ATQzPRjrVcY1lc5Q=;
 b=IANwUuVd8feCAJky5v4B/ioMpK9KVYC1RNl93qi2xviJNvcRkxciixtFitEnIfhVUFbnucz0//0a3hVfqwAAlT97G8AWwRLJ3xEkPc2uO8fHCNhch2Ziy+tHfWkJhZfNXSV1J4fQ6HDB7mY1a2VfWiHoqr+8M2w2y38sXmqwB1bGRoPZZY7llfY+YxEiFn+AhYFt00TqILB/klXDhxPQm6pzXG4SVcOhtlp29uoQ6m7tsYrRxpBHZbrwG0+c57VoRPoyUhND72G8CFBe2xoAuY1afO6SOaYqgsuk423W158atMyXgb2lntxBUSsYZJLJMMm9yXqVJ3m5IqDMIe9QzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6xqTIrLyI0geliz9CJWjHqakK0ATQzPRjrVcY1lc5Q=;
 b=dtW59hgxpQMSh2+CtGhk0okBoMo/OIZtZTnrCF6EaKp0iK4KmBK1/I8s9pKXiA+aADskJonFFre3FHNmbBJKXV0IETY16bST8XKiWbdWUMjbN80BuRJ989mY7R00g3UG0wM6sCq3/1Wtd4hmZ6bqSXn/YstXkWT/SPUmEv81+WU/HMtP78VmGV/PC3J4tA6yxu7DEIpatCHTxTnZYFUfWDwKX9Ua43MEQtF1iTh5txW8coq2hdeYEdrrRcVuo2JRLwIzb1lOxnXONGQWWAvRdMnGopmqNhkch3yQ9egnjd82tbsp/gGNB2jmiEa6a2vu+7SuWWvgAHhlt8bb5VMPWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0802MB2207.eurprd08.prod.outlook.com (2603:10a6:800:9c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 12 Aug
 2022 14:49:04 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:49:04 +0000
Message-ID: <1650904c-952f-95ea-0856-2bfd98c03cc4@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/8] parallels: Move statistic collection to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-8-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0057.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::46) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30f0cc0c-fb9a-40c0-6092-08da7c71cd41
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2207:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeskfyLnSBiGL/WV85LFt/A0pn6KutcCFhX1r6OMfT9xz+VCULEjFjrgbDBDKdE3Gd5LJqB3KCVWvAaNP3cLFSmB8zEBdZ3DqRHM7f+eLMm1t3aF0N8yiaeQwsIKqE4ALx91KSfJEyX+ZvT5sBy8RmhrBFnvR5vIsaz9+kaGrYviiVjk8rceVxVOzBOH1OntazzA0aqlq+ZDKFPvhvLUe5FlxJVB2mADqzMC57A8zIqDQDDetPxBD/Lr9B3u/z41xpuwlMoD7OYTSItSv9NBbQpsyHwd4fsJ4IIREcxO6k3MpxAcecAsZ1xFymwAJmLnwgySATtdsQR74nD5blYDQlQhocuHpZmfLQ+0G7aepf/BlUgjcA2x5rOLmLxHQAPAEPVjDOwO+33tLp6CnGfU/IiNbTNSb4RP8bnDJa5iAi8VmGHSfHXsphx8fQTExbKFm8cQksl1opvE6+UYfRMpOwMrszH9z8Wb7RH5v/q00613s4zWfY150NbPwiu198tHfp3Unpt6r7+ou2doOaebsxP/QpFb00dZjgNUGBJGfOkI0LdekfqF9y0dNEYY3Fy5Dao8WLjeVsmOXqzEofSxZhCPqKFZAkWZKYMi7enKiIgD9BLA1zCwdrM/qY1znBlA7Czcmhsm0bJTSBM7VIzdYXmVGW3KgXUuHa8NaUqG/eSnDaD+S4tyrzkOw1cyENdrMqfudgxDOsAnvzhd/7PpCcpth/QJRliu+SoE0V2cds/VOZaHgBzwTdQ4XbGtYL54PzXAT5kKa1OYN/udNJ5iB3a6KzCsNrkxRbELtWv8Ec/vlAdOzvUe0PQuIAaOVmgWsU39yUav8whBrjC01l77yrTBYsDISMWhEN3nHNDJv5GuHCk8jZc2MVkM22jG+Uct
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39840400004)(346002)(366004)(396003)(136003)(376002)(186003)(2616005)(26005)(6512007)(41300700001)(52116002)(6506007)(53546011)(36756003)(478600001)(6486002)(31686004)(86362001)(31696002)(83380400001)(38350700002)(2906002)(38100700002)(8676002)(5660300002)(8936002)(66476007)(4326008)(66946007)(66556008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzJzMVc5SkhlNmQwK0lBN3JkUE1nSk1XaWRvRzRIQ2lSYjJJaHd6aTI2YVV0?=
 =?utf-8?B?aG5TS2F0T2l1WktocEZzbC9NRWIwKzNLTzdGNGViUXQyc2RWQ2Y1YlhRYS9h?=
 =?utf-8?B?SUxpU1p3QVRrdWt1Ri8rclZtbURGclIrODZHOXB0TkEyQ1d5S1lGUGw3QTZT?=
 =?utf-8?B?ZjZzU1RUV2xscDE2TzZJSmh2WnN3VjBQbUdyYktkTE05SHg3MFNkVHM4bGow?=
 =?utf-8?B?R0NRcjZ4dDNOeEVPVlZJMDJVc1h0cE1LTFRndFZjK2NhOXpPU1B4eDNnemYy?=
 =?utf-8?B?TmVSMlBKWmxUT01oMXBQeHVPTi9rdmhITmllOHZwZzVld0k3ZkU4aDRkUVI2?=
 =?utf-8?B?Njh5cDVEbjVkRFVYZmk3cmx3cVVOYTFGeC93ZGZHWm5xMU9IOCtLSVFpUm05?=
 =?utf-8?B?MDBRTHNMTVRuTW9YcUx0S2VoNnRwcUYzaUVlOXc5TE1NcmlsbWU5d0Rxbjhl?=
 =?utf-8?B?NU9UVEhRazdnZVlkMjVkRHlaV3BBK2ZCekdTbmlqNzhESHR3TEhqa2lYWEdN?=
 =?utf-8?B?anUrYVA5Ym10NjgwN1UxbFZqUzlSRmJJR1kyM0Q2K1lXc20wVEozNjZwRUNB?=
 =?utf-8?B?NGJTaGhZVTNUaVovYnFDSUdPemtDZ1poQVV4eWNhbUU2QW1GVDZvVGd4TVd3?=
 =?utf-8?B?OGYyVHBhVmo1K3V1bnpvR3pJRVg1UGlqNVdZSXhNdDZLKzV0eWd0WTN4Q3Qw?=
 =?utf-8?B?RWdKQjJMOEdRdTlrUDVuOEYrSkxQaDRuNGJmdjRQNU81R0x0cFo4NHIrTVdl?=
 =?utf-8?B?Y1J4UHNWWG9BL2d2TG5Bb1E5SjNHT3RFK0MrMVdjNGY1UUFuZ0s4WkpKWDRv?=
 =?utf-8?B?VWhkRkRwVW1YRmZ6WGtaT0VIVUtHS0xoMHdka2I2MFR4YnYyMUNHeEFhUVB5?=
 =?utf-8?B?S2hxaTI1YlN0eGxqOFNJVm1SSHdjZlZ5VzRJelZseUNTbWE4YUtzMDZQNlVk?=
 =?utf-8?B?a0R5WWFsUk5UT3h6cTMwNXRRQzY0RTZoekFXMU1ramRSWGtSdHFDdk5lM0hp?=
 =?utf-8?B?a3dSZC9mR2E2YWJZUHpkbWdPbFhFekxIT0o2MjE5M1paZHYzMEdWWFZqRUtH?=
 =?utf-8?B?bm5EVlRRbHd1MXByZEFoaERPQ2RsQ0pCaHNmNGtqUUVYV3hLMVhUVFFUcW1X?=
 =?utf-8?B?UkxPVEJ3Z3lyMjNCMXdZWUwyVTNZYjdZQlVyc1dsRUkxYkt1aWd1ZzBQQyt1?=
 =?utf-8?B?cmNhTkxBU3JXNFpCMm9VMFI5YWUxZUtmQ0JBZ2JmSmZNZU1uU2h4Nkg4dTZM?=
 =?utf-8?B?ZTFaWkNlaGdLMlRBVDVvRVgydE9KNDlCT0IzYlJjOTBET1FTbml4a1B1Qkkz?=
 =?utf-8?B?REI4OWdrL2E0eUFUNFNBcWJka3NucXJJcEdxZUFhU2JNcW9WMGNuSSttYVZr?=
 =?utf-8?B?WGlKZlk3cmwreE1WUkdIT2NyaHlhaUgxbURBZi9BRS9URmo1RkZ4LzJVcW5Q?=
 =?utf-8?B?cW5kU1ZvSVV5eENmQlZVLzVnL2M5OFY4Vk1mUTkxQW01Q0YxMWptOHRkQWdC?=
 =?utf-8?B?NUIzbDlRODJORXJPOE0wY0RYeE5Pc09tYTB2RWZsMEJLL1BhdUhQU3VqaC9n?=
 =?utf-8?B?cDZpTmhkZGY3amVSU1dmRVM5M042WmJ5ekxrY2xLT3oyNExQaDh0N1I2QUlw?=
 =?utf-8?B?bVEyZy9QalZnWEo3VG5Gdm9VZ2Z6ck9JanY1NHZOUGtiWVIyUDg0TnRXSkdT?=
 =?utf-8?B?c2ZUeUplMmVsMEtHd0V4SEtrM2pnQURST3l3MVFxOHhjL1Y0NW5PNW5CT2dX?=
 =?utf-8?B?VGk2M2NFdmVTejExVUN1VmU1aHo5N1pQVHVQWVJBaHl5Ry9CcGQyZzJBcm9C?=
 =?utf-8?B?N2tRNnpCRURPSUoySFFtVWdNZW5ubldCcUJTeW44bzZVaXhndkZNQmNZWGJp?=
 =?utf-8?B?dFUzRkFOQzl2TzZFUWhHUGR4bEJwdlZVdGpHdy93S001VlZqZXBOSUtrMDFR?=
 =?utf-8?B?MG9NVDc2aU5LYVhVL0ZKdDNYekE2NTM3VGhHZmNPWGJ0cDBOZS9YRFpka216?=
 =?utf-8?B?ZklLSjcxTzZ3YUZNRGZNNkFCUUt1ZFNFRUFOMDZFVnhnNk5qK0FkR1ZBTkhH?=
 =?utf-8?B?ZTVPeXpFZU43RCtoK0g5ZU5keW9HQkJUSUFoQWhZZ1djOThZbWFTbVZZU0Nq?=
 =?utf-8?Q?CNWu28GR4JQoOe4O74ZOMAuXE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f0cc0c-fb9a-40c0-6092-08da7c71cd41
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:49:04.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2tDzH3DG/ltHGaEEji6+CNHzU8TgCVviXAJQm1SEpRRgnQDfdJSDb4/ia3FBRYFNqH5L18KQM4Oo1T5sUmqgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2207
Received-SPF: pass client-ip=40.107.6.131; envelope-from=den@virtuozzo.com;
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

On 11.08.2022 17:00, Alexander Ivanov wrote:
> v2: Move fragmentation counting code to this function too.

same note here about ChnageLog and motivation

> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 54 +++++++++++++++++++++++++++--------------------
>   1 file changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 8737eadfb4..d0364182bb 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -518,48 +518,56 @@ static int parallels_check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> -                                           BdrvCheckResult *res,
> -                                           BdrvCheckMode fix)
> +static void parallels_collect_statistics(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t prev_off;
> -    int ret;
> +    int64_t off, prev_off;
>       uint32_t i;
>   
> -
> -    qemu_co_mutex_lock(&s->lock);
> -
> -    parallels_check_unclean(bs, res, fix);
> -
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    ret = parallels_check_leak(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
>       res->bfi.total_clusters = s->bat_size;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
>       prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>           if (off == 0) {
>               prev_off = 0;
>               continue;
>           }
>   
> -        res->bfi.allocated_clusters++;
> -
>           if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
>               res->bfi.fragmented_clusters++;
>           }
> +
>           prev_off = off;
> +        res->bfi.allocated_clusters++;
>       }
> +}
> +
> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> +                                           BdrvCheckResult *res,
> +                                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
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
> +    parallels_collect_statistics(bs, res, fix);
>   
>   out:
>       qemu_co_mutex_unlock(&s->lock);


