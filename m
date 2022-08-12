Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB8591201
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:16:04 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVSE-0005vP-JC
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVQE-0004JL-UP; Fri, 12 Aug 2022 10:13:59 -0400
Received: from mail-eopbgr140099.outbound.protection.outlook.com
 ([40.107.14.99]:56450 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oMVQB-0003uz-Dy; Fri, 12 Aug 2022 10:13:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewFZKUP6YpF8q56vO6NTsQhzDXqPxrHKsQBcevUMAw4GcPGW6dLcdtqStdN09i907u0d0G3EBlGGoLjzAld5CMl5ItntHhdO0lwKifQZD/7nXGuJ71a18RfwSF/ruQYtaPY6Jh1Y5xxcbg8yDAxqQ1t/akpXv1aePKaFcTw+gSJSF3c80GgNofn17hPhhds+DBQRMHb6chVvsXIb95GK0zkZXxU5IzYxmeQJfom1gXbVT+y7Oe414I/Lvf2WEuIKuJcz3Ahs6WVs84i5QtSiOMGrhJoOQX4QBsr1/7qSB7qbePMl759rMhWNvxhl0lJWMdRvSgWy0XOCqZM1HtTV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9vo94Iq64WqvcqGvuLrLBMswcYAZgQwoOVUfeXnq7k=;
 b=HgpqcoabeXrlhg0oOttt8xNmpWT1t36zhlR6blu8IjFg4j6NmdSM9bic7XTLqiqAliYumwhLuNuSRr3455HNpmpjY9TuwzT8QExNLt0MnAAffsg0ZId93zZJV90RRuAKaJ8aA5RdkL0V7cGg+iCjAvJhmK7sRraX7JO0bIvcMjwpQKr4lNv2mxpPy1PH5B42Jzpq4XU5UgoRciSNayhMOVIa9mu6FxE8/gb6Y4Wg5JtxlGmKyiFZXnYCjxhKufge70RCNtEmrmYfNO349sWF9ccpbZRZ7QKTa3VCA377oM4aP4emXwU7WE++Ehkul2PIwR3WRHRX02sK9IwUii40Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9vo94Iq64WqvcqGvuLrLBMswcYAZgQwoOVUfeXnq7k=;
 b=m0H7efablF3BtnQ6wtrDr7dq+5yhgN9wMAunfADkx6/Yzv9/H87Fw/9HpkNBqnUg8SbNgoL6aOcqhVo/YHsvvh+s1B/8Y2MaWKN1ilgbWAVZEFQOOeJ6flktCb3wpRaBABl0DrfDY2k2yUDe4tFy4y2g8lnFKa55rkx7glFJ+22fP2EZMgBHYki5lyjMMLZvt1o9jGUIjuETyS2XsHbe7sH4rhWGVm0IPTP3eyYSu3MSDrfEP/hEYmHJBBrtb3uA/2Ovsko0XyMOYHGurH4hVc5XzpzX4aFCwyJz8t5G2/BfyvFbXLzHIfIE5yHhpwQT2tSBxAT+4YUfSQ5j08RnAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 14:13:47 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.023; Fri, 12 Aug 2022
 14:13:47 +0000
Message-ID: <c910c939-dd25-8dac-cc6e-ca96f5ec47d3@virtuozzo.com>
Date: Fri, 12 Aug 2022 16:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
 <20220811150044.1704013-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220811150044.1704013-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0701CA0036.eurprd07.prod.outlook.com
 (2603:10a6:800:90::22) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2427a9e-a3a5-449d-ce13-08da7c6cdf58
X-MS-TrafficTypeDiagnostic: DU0PR08MB8421:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rge7NTIp7LeXyKsQjAxjD01JuOmPTKRCK1ftob/YYLcLEfxHS1u2l6T9mb1Vfr2X8Y9QtV7sE+ZUrpydMvLuIt6XoWmt6j3vMNv/0m4BHisC53nkRQarKWLtWcT+PejgCN6UgMlt9nLlYmB89bL2CkaiDfESATzY2rE70obqMJkxhuF3hkfPUxL+gyEtOYkPC7gKP+dzRuYbSoIJym0uQAYvq/qHHQmcSqqC27uo378ius1NpjdgjeRxp0YBDXXDVOw71yKlScEf9ImozGWKi66TvaeFRfI/nwSALDWZi5nd8ePG8T5o/pt6a1lfl21gX5uziAuKSoY8HrgdExf97Fiw0SbhkJPZNAmdFH4wrf3TO3l0KuVDqhHQIDxnWmKm4qGYO5dBfD+iMY54MTESGhRfoCZ6fvht2TINcINJtSE7KWvSY98sIshSg1QYwefZyPnluV4DbZTq6DAGwOtexAFbPd1PjnVIz+K2e/R6F+H/qBjKreM1TstoDeFJxiLqg7KiuVf625c/5OxWjbkYobnt5rtMdKWZVWJY0qkc3ugc3Iuj5/DnIaUxSFJt54bdtQvV+rSTXVhaGu1b00mAQNQfMyGWdJeePjcP9hQ3nHjYBLuR3J24nAMMtQWJ4DDgRO0hyJlM5CyR4jjB/aNea4+L68HMSF0Z8DXTNFwqm+yApXiFjFj3zbE4KUL7u+vOo+zzECCL4wGPKyLp53vRtuZ8CSoRtMtmDQPqb8bStgPHJ0jz1Dv31hmdlBeug3aw7gtBffjwbdCDYnW5S1FStOQns/7Nhj4pE3p8OqBcs0hd9KL8K6Ruoz2cxgfC1gilq+8N/VexoENb9nyxA/ys7DRW+qCqLPNI2GWHK7HAlIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39850400004)(136003)(396003)(346002)(52116002)(4326008)(41300700001)(6512007)(66946007)(83380400001)(6506007)(26005)(38100700002)(8676002)(66476007)(6486002)(186003)(316002)(478600001)(31696002)(86362001)(36756003)(2906002)(66556008)(2616005)(31686004)(53546011)(38350700002)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlR1SE5kRVYzQkl4cE0zK1dtMkFjVlhMRFo4bUFuQ0FrcksrTVZLQTdqQ2Zr?=
 =?utf-8?B?bk85eTZrVXdEN1I4UE1EMmtUQkhXcm10RnMzNzBHNUwzRGp4SENDRFZTdjdw?=
 =?utf-8?B?SjRpUS9aazVjUUJVemFCWFNmS3RzTFVORmN3bTh3Qnk1MXBBMDlvbytxcGht?=
 =?utf-8?B?WFkrU1BaWkI0M0sydHFUcTlkUitoV0hoZjRHS2FOZ0JoU01VSHNNclNPREc0?=
 =?utf-8?B?VVNqZmFTMXJRV1lqNDZnWEtNN1Bkc01HN1dlcGdhbjl2b0kySmRUcDZleDd3?=
 =?utf-8?B?dEdrNVNCbEpzdFZzWWQyMDlDcm9LSnRpNG9CT3YzTGFaTEgyWitDOG0wb2ZR?=
 =?utf-8?B?SUZhREpkSEZ0bGdEaXJISnhYaEo4clRteUs3aUFzRmkrYkIwWG9NT1d2NmZK?=
 =?utf-8?B?cnFlUnR6dWI1WE0zeUpoTHdVeHpRbVJ6cnJZSyt6c2xTTHlRMVQ3U1FpSDJI?=
 =?utf-8?B?dy9tUmpMZGhYSDlLcFhmZisrUzROTEtuaDRpMi85djBBZGlXZFVCSlBOMmVq?=
 =?utf-8?B?emlHNUtZQ3JoWUZTMUNreWl2ejFJbmdrU1ZqUjh2OGw2akdEM1RCMERacjBF?=
 =?utf-8?B?Y0VrTzlEK0JObUp0MGF2NFV1YVl5L1RSVFVWZkczRDJiTXB5UE84K2FSR3c3?=
 =?utf-8?B?OGlDMlk0MFF5cnZpZGQ4VWs4M1pJVncyWloxVXprcTFpTjQ1aVB0VnJERFZy?=
 =?utf-8?B?RjRrdHRTdEp0NVh4L0hRc3N0bWNuMjllem8rNnVnZHgzVFRtbkM0SnF6VW9D?=
 =?utf-8?B?b0VFeG41S0x4Vk1nK1RVeFpqZEpRbW1ZMkM5cUZGQ2VqZkt1K0JvazVlbVB0?=
 =?utf-8?B?UXBoWnltZUdVeG5hT2Y4VTFBckhDSG5uS1ByN2lvS0tIbkZmT0J2WjRYa1M3?=
 =?utf-8?B?eFlMdFdrZDBpMVBndkJVZXk5T054VW1helpNSy8rZFQxZ3RCcGpvK1JwcGU2?=
 =?utf-8?B?Z3dVR1RFd3FqRGlWU0lUUlBaVGNhckIzWnEzSklkK1NjZytmTVdJbGd0RVdj?=
 =?utf-8?B?M0h1N2tqSlFkbDUvWVAySjVtWXNQMGJIZGt1MUorOEZ5U0F2aXRlVFgyN0tS?=
 =?utf-8?B?ZExMNkpjaWtlMEJxL1ZLOXhHMTZ2TjcwcTd4MlNrMGtvTHEzL20zQWhXMS94?=
 =?utf-8?B?UmtkVW1MblFpWUE1WlJLdzFMRTkvK0tnbDZndHpBMlNGakNUTFZwY3B2TVBC?=
 =?utf-8?B?bGpPKzA5dlp6S2JNTUF5N3FnNWdOWUloeGExbE41MTROdW5KSFB0SjJDRkt6?=
 =?utf-8?B?RWh3WXVEYTlHL2czaGNhbDdDc1dSWXc3Y05RVFV3Rmc5dVBOTWFQMitqZVg1?=
 =?utf-8?B?KzdUREtHWC9xbFhTejQ1c1RVWFpwRm9YSEFYUWJYeDlBcTd2S2pjclM4NFNP?=
 =?utf-8?B?VWpKc2VrQ0o2VVFBM0NFYXdNdFh0NGhnUFNzM1hleGk4NGlzbVdhaFJ0cFFw?=
 =?utf-8?B?Z1ExTjMyZWg4Qm9BUU1TUEJaMVpTU3R3OVkvR2ZuekJhTGMvQnZDSGpydWZJ?=
 =?utf-8?B?NVRxamk0aXdXUkZEMFNNTmJSRFdRSGc2eWJJcTJjSnplZUNlSmNRRld6SndB?=
 =?utf-8?B?R081UEJwdFQ1YWdveVN0MmV5VysvWDl5bjVwZDRZN1ZSeVlMY1dTbVpndzA4?=
 =?utf-8?B?STFsT1pjbTh2SXFKcks2dU9qbStFdjVxaUgvbGZFVVhaN1FMdVlDRjhXY0ti?=
 =?utf-8?B?MFRPTHJ4a0dUT0E1SlBMSlcrMW9nYW1yaVZCQ3dXLzQrOGpDZUM5eUExMks4?=
 =?utf-8?B?UXFGZ3FnenI2aHdsOUx3ZFJGYi9iRk5RNlExSUhPckZvTmpXTHQ3c2FrRkk0?=
 =?utf-8?B?STF4cFVRRVB2a1ZnYmRhSUlIL1IycUp4L0ZtbFRtSEorM2RKdThJWGxKT0Nn?=
 =?utf-8?B?bWR0dDMvR3NGVnBPZmU2NGhkQkZ2bHZHdkR3MUptSG5hOWlKa2UwekJwampn?=
 =?utf-8?B?L2dKOFF1RlFiK1I1NWpMaHJUQmt5dTliamtzQ3pCd045Mm5TVWxPd2lCK0My?=
 =?utf-8?B?TmRqajNWMzBKdTlRY2tEVmI2RmhFU25qb2FZVHpTRUFrMU1EUFN5MEN5eEdT?=
 =?utf-8?B?d0o1WUxlVVphcHYxdlRpL1pIYUx0cEJGeDNGV1JzLzlhQlFBektiTFZudDAv?=
 =?utf-8?Q?ApIJtmhN9KLWM4QqiGGZByy2D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2427a9e-a3a5-449d-ce13-08da7c6cdf58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:13:47.3047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVYpr2fQO1ZA4LA+/s8Cb1GiSLw7lwTkjhuCTyXZPBBnDWp8j4X+Dr3uqf6SVfq574en8QPeL4KRKBUoAaeD9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8421
Received-SPF: pass client-ip=40.107.14.99; envelope-from=den@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
> When an image is opened, data_end field in BDRVParallelsState
> is setted as the biggest offset in the BAT plus cluster size.
> If there is a corrupted offset pointing outside the image,
> the image size increase accordingly. It potentially leads
> to attempts to create a file size of petabytes.
>
> Set the data_end field with the original file size if the image
> was opened for checking and repairing purposes or raise an error.
>
> v2: No changes.
Changelog should be below ---
In that case it will not be merged.

There are a lot of typos/mistakes inside, I'd better use the comment
below.

"data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will 
create
the cluster at this offset and/or the image will be truncated to this
offset on close. This is definitely not correct and should be fixed."

With this change:
Reviewed-by: Denis V. Lunev <den@openvz.org>

> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..a76cf9d993 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
>       int ret, size, i;
> +    int64_t file_size;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           }
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        goto fail;
> +    }
> +
> +    file_size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > file_size) {
> +        if (flags & BDRV_O_CHECK) {
> +            s->data_end = file_size;
> +        } else {
> +            error_setg(errp, "parallels: Offset in BAT is out of image");
> +            ret = -EINVAL;
> +            goto fail;
> +        }
> +    }
> +
>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>           /* Image was not closed correctly. The check is mandatory */
>           s->header_unclean = true;


