Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D4599C91
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 14:58:59 +0200 (CEST)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP1aU-0001cW-4Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 08:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1YV-0007ji-5H; Fri, 19 Aug 2022 08:56:55 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:27286 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1YT-000599-5c; Fri, 19 Aug 2022 08:56:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeMF3M0osbav5oFhG0WjBnNotGr+ejVq/AYqMdsoSapTBzW6j8gTwfHikXVFijiGYJGBHlI6LnC8C0iV+qsJ+bU6RP/K2yVswWs+AHrCKYbB0nLht30bdE/t1JE7luElJ3QCDnW2gKPZ5zbcfvjLRayaCpUGFaOCLszyJ+OnCQtVXOSibPpu/kWw+qkC7ObxcF/U3oapJMMxvbQnJRX+8Fwm3/WYcgfkbquf3fIsADjeSYzcg3o0tpbuFJOKD8kWJhLR0CGZ0cNZQ+HqrKwhFRVJ7MYaj+n3LZPVVfqemM15O6Dsb5FK/qFJyTClbmeyMWg0blcKMIneqXOLSCtrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR8542KXIQFJ07kHCtUnM//QqhROuBHiAQNSW4ngX68=;
 b=T7cWTZf2ZeE/0usZjgjVlpRq4WEmjrB6mPdsTpmFJQjHNuhnEE+qOOY8x0rXGdbGCZ4x7ddIjmKxZ/GmyhtcFz7/9cisLk8Ce35sIkutJJalZ3+SFxuQtOIeG5pSQprUGsDh97DxymTMUNbFoXvr+hvDw7tRMzZoRicA/vzCLguKmAbUu7GwRbTaXwGF81jGwno5h1QEVTafzMz+mJ/XIOuL4fFh4NKBkX3NKkDlGci7QKJ8UZztTKVkgZMa4w8jdsHxAAOVbjIL3nFSGaC+9CBqcVbs9n2RsVx9ZxBww8wi0lkiHCgdDIR0kWGz7vGkYGmN7OYDdPNc3zsS3yjnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR8542KXIQFJ07kHCtUnM//QqhROuBHiAQNSW4ngX68=;
 b=y07Y/Mzx8wfjfiZ8x3HBx6Q5Hxe47cGJkkiVR4bjt8ZwEGH/h0yOeVMBojssBVe5ZyYIDVTXQo2HoO4LM6iqUiBI0zJXknelqiMpTPgnln5/9VgXUZ59LNZP5G7hO4Q4G8m8MiNDjInK78EKlTJiJrw1AfN4WU2dbHrTpihzE7zoKoOvjCcNdhCworYZ1RHBe1oj5m+wvhUGhNFoDghE/lHQqefUpAb+EIvmVtBVCBvoAgyDadwjb0lVgkuRdRWz4p3xy0fuDS2a34W9VzWilwkpuVVivIZIK+d1SMYo90cWZ09+y7drZ7kebal1h4Z8Md3PpXB3ZQNA3dRLokxGww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 by DB8PR08MB5340.eurprd08.prod.outlook.com (2603:10a6:10:11c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 12:56:50 +0000
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7]) by AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7%5]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 12:56:49 +0000
Message-ID: <582f5f97-1307-dd98-c147-993c37fe96a3@virtuozzo.com>
Date: Fri, 19 Aug 2022 14:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/9] parallels: Move check of cluster outside image to a
 separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
 <20220818151456.2118470-7-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220818151456.2118470-7-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::13) To AS8PR08MB6946.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01fc4719-cd98-4545-7b7b-08da81e247f6
X-MS-TrafficTypeDiagnostic: DB8PR08MB5340:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZzUoP/1HX0eLEk5YHK2n79xBffQwutQaFabut9ozV1UufMqg6QjV9t57n9kFWmXdDXbjPlrjhJnHgXgr10Wmi16wp/G3MQag5AZUP5HnpYQvmiwqrCAU6U60s6YItI5MeZlinTfezx3Qxk05Szkvx68RumS2coITrg162PJbukHF1WDk/iZQawssidoHffTf2nf+8epcpHJBjvAx1icukmNosMkaE9IFCUuw9aUk3Nuk4Rj+zRFl1irKUHv4efrfLWnrm45mmGB4BD1v6sKbg9WxmxLHRpAmFZJTBTJHnUQ1LzVQEZZPy12yEzRx/A62XtPZCO1sup+oercBcan2+TzCPMKmrBgY6CkLd8i99+C70Pu/IvYyLxBHbnqj5Q6btZ5eRDHviIOGXXoC8gnZBVAUkN585nrKnHccABwUqFs6FH28q+nuyy9ku+wrEM5RViF/H1QcX0UDxHRQSMfdwT/WzW+itInn2GI5jikKuKrJ4CElCaCZvFdPwqESnZc0efAy7Sc7HcHxLwA/Qadna5dNlW94DDqESHdoAAWr5HkRDCS7eZ+aXATNB9EOlKO7c7MgFM7X3Gv7PMBj3bEFXZR9TpVAx0Ttrj3nqeDlGplyZO1pLEsEGjxsI3nUI/6t8ADyIHPF79qwbTYOICzXwSQbwE58t8t0lLBLcrz9QxSbXrNN0LeZLPbAWuaojS83vrJ1eHHVlcyKJZmX18RtHNn6Leq9hby8k7CwAii1uzK87czYJH5/s5ZpDuvydzcsaUuEDAwbDrPyU1K8sPFzAxGPdBBKOEGlICIuTzy5FGwmKyFwrbM1wfa5iwIQj1meIVQsmp0dXvxizB+XzVOmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6946.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(36756003)(31696002)(86362001)(31686004)(38350700002)(38100700002)(26005)(6512007)(52116002)(83380400001)(186003)(6506007)(53546011)(2616005)(478600001)(316002)(6486002)(41300700001)(66476007)(66946007)(66556008)(2906002)(4326008)(8936002)(5660300002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE16Vm94dDFZdi9qVGhZc3Z0RzljMlBveUZ4TEpzQ2ZqNUdJMWFDWjVld3lR?=
 =?utf-8?B?MDZLRTA1aTZ1VlE4amJkeGxXUENFMFNaWG1FZ2FaWXc3U2t0Nyt0UU9SMGoz?=
 =?utf-8?B?ZE12bWxSU3JZTU9CTk9QeDVIY0JXNHFiQjJLMHBDVXlhcUk3eVNSSFEwTnFM?=
 =?utf-8?B?LzFHQmxxUWtiMkRmcmZsTjQxU2ZnL2xQNGhjbmVucVVxcTl2UDlvWkJEOFM4?=
 =?utf-8?B?MEJTaTdsemNRSExmR0xQZ0NHa21rREc1TEZ1ZmpnS1ppbzdvZ3BLaDdZbmth?=
 =?utf-8?B?UzNuTFFhbkhLeFRMZlA2bnAyTjRJV3hlWlNDUURZa3VoQVJ6U0F5MW5VWTlI?=
 =?utf-8?B?U2VJanhMUCtLOG1zaXorSlVQSWpMelA3czN6UVkwWmg1dVd3WUdjeE1zby9B?=
 =?utf-8?B?YitYV2hhZHZsTmttVGpYTkxjSzV6bjZpM2tIY29zSTBSVzhRT0pVdW0yWmFF?=
 =?utf-8?B?YmFpbE1wclFHOE9aZlRaNTJsekwrL0Ivd1RZSWhIK1N1QkJwNXA2Y094bjNT?=
 =?utf-8?B?Zk9NQ21ON2tldXFqVW9ZOFh0R2orZzZUU1ppZU9RTm9IczY2OVJOY2lxbmRX?=
 =?utf-8?B?WDlSNTgzU1JKUjNiejJTbXpnYmVoNFpSQytNZ3Bwc1hxalZRRStxR2t4S05E?=
 =?utf-8?B?bjcwNFRycnJwbDBJWFJEeGI3aG1FMmRVeUhnb0c1NCs1K3l5NTlEVkE2UDhQ?=
 =?utf-8?B?bDk5UFN0MFV0SElWT3o2MjNiM3RtVnZrQWVNK2xxbW9Qc1k3SE9LN0ViUVFu?=
 =?utf-8?B?TjF2b3gzTU5oWXFIVS85YXJiUkxWTmlqMGl3bjBUcExMUnVONVkwTkZNYTN3?=
 =?utf-8?B?SDBraTdXaUhDNmE1S2J5SUZwWlQ0aWxuVXIrVVdGWWRZRk13a2pSSnBDeWE4?=
 =?utf-8?B?Y0N3U2JBWTQxYUY5T28xOHpkZGZZaFhtRkJCTDFFMTlmZWpMOHcrOWM1NEJm?=
 =?utf-8?B?Yk9TNUpBTkh1MzZLdWxtRmdFdFozQmY5a29pZnRCd21YZjlPOTljOUxwVjg1?=
 =?utf-8?B?NVdjdzk2RDZLRVpEcWdsRExUT0NGL0VwNW4wTjBrTHAweVBrOWZzWWdoTkhI?=
 =?utf-8?B?MXpXRE02aXZYN3hSc0gwQ3oxQXdoTHB4YTloMWZqQk9xZy9yU241NG5FNVBO?=
 =?utf-8?B?U0Nlckp2ZWlQRUt4dGp6OVA5VWN0UTJDdEVwZml0bDNYMTVRSTRzQm9nMDBR?=
 =?utf-8?B?dmpqSHk4TEI3WVhFYm5admJ0dFBxK0VRK3ZDUDFvVnVpWkNOTitFOEp6Wjk4?=
 =?utf-8?B?NnRhWXByS0R1ZUVtMVMzNUt2c2hTdWFCd3hBc3RINCttZUpWN0UzU0k5WnRW?=
 =?utf-8?B?U2w1MW9VbC8rOU0vTFlzTnFMMk9ReEhib29Ga05TZ3FGTHNlcXp2d3A2TTR4?=
 =?utf-8?B?VzFoNVRmajBlN2p6dzdhN0I2Rm4yUFNlNmZaNDEzYzVaWS9ybFgrQ1VncE5D?=
 =?utf-8?B?bDVuMTFnc3c5ZHpzSEM1NTRBb2FlN0VUU29NNUE4SmpYcTRUdE9WMVh5ZDlM?=
 =?utf-8?B?OTM0TFQ3R1NGMUVEUGoxWHNka3hJbTloYUFPaStpZ3hna1VTUXNaTGNNQW0z?=
 =?utf-8?B?ejJDZkw1MFFnK3c3SkRuUkVwZjhZNzlsdVRveHcwTWJub2FIVzlIVHFoR3VS?=
 =?utf-8?B?SmloYzRFRUNKTTg4UjZ4TERTcy9kTndSSmdvV2F3dGcrM2RrSXZkd29MOTZI?=
 =?utf-8?B?OEk1WGptbzdrdVE1anBNZ0VweE1EMXl3WFhhUE5iMEFUdVNwL08wbTRYYXFS?=
 =?utf-8?B?NEJ4R3V0ZFB5cDVEOE1VaGR4cytuTGcyS2J2VWt1K01xWkRwb2VTbXdOcmtY?=
 =?utf-8?B?ckdvUUZUUUR5Q3RrZ284YVlmbk0xYitNMTM5bEljVDFhMGducDJpaEtvc0FC?=
 =?utf-8?B?aDBtZDZybUw0a3hiOEVJZlVEZk5HUGRhZjlSdkQ2WkJCdzFoUXQvWklGWFpz?=
 =?utf-8?B?T3lNNXBSMWpCMlhqdDAvN0NEdW4yUyt3THlVZkZPQ1RxOTExWTBrdzdQdkEy?=
 =?utf-8?B?bXI5amRoODVFbDR3MjRBa2NzYTNlTnVXV1Y1d2V1OGNFdVE5R0IyNVdCRzJ5?=
 =?utf-8?B?R3pwUFQyQXYwamYvbm1wS092bVlSaDFZaHhMY2duby95emVCMk5tWTdQc2Nz?=
 =?utf-8?Q?TETZ0pU8+zdHRjyGPtJOlG+Ba?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fc4719-cd98-4545-7b7b-08da81e247f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:56:49.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlVVHDhZzsscWNTIfMkHZ8N18PUsL/YmNOP9zyM+IXbA6OE322v0DL/5ZLGZvtniSrY4X8ylIa1LJD9X3KqTsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5340
Received-SPF: pass client-ip=40.107.6.106; envelope-from=den@virtuozzo.com;
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

On 18.08.2022 17:14, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
> s->data_end fix relates to out-of-image check so move it
> to the helper too.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 67 +++++++++++++++++++++++++++++++----------------
>   1 file changed, 45 insertions(+), 22 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 3900a0f4a9..1c7626c867 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -438,6 +438,46 @@ static void parallels_check_unclean(BlockDriverState *bs,
>       }
>   }
>   
> +static int parallels_check_outside_image(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    uint32_t i;
> +    int64_t off, size;
> +
> +    size = bdrv_getlength(bs->file->bs);
> +    if (size < 0) {
> +        res->check_errors++;
> +        return size;
> +    }
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > size) {
> +            fprintf(stderr, "%s cluster %u is outside image\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +            res->corruptions++;
> +            if (fix & BDRV_FIX_ERRORS) {
> +                parallels_set_bat_entry(s, i, 0);
> +                res->corruptions_fixed++;
> +            }
> +        }
> +    }
> +
> +    /*
> +     * If there were an out-of-image cluster it would be repaired,
> +     * but s->data_end still would point outside image.
> +     * Fix s->data_end by the file size.
> +     */
> +    size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > size) {
> +        s->data_end = size;
> +    }
and this is incorrect IMHO. In the next patch you could truncate the file
inside leak check and thus data_end will point to a wrong too lengthy
value.


> +
> +    return 0;
> +}
> +
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
>                                              BdrvCheckMode fix)
> @@ -457,6 +497,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>       parallels_check_unclean(bs, res, fix);
>   
> +    ret = parallels_check_outside_image(bs, res, fix);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
>       res->bfi.total_clusters = s->bat_size;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
> @@ -469,19 +514,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               continue;
>           }
>   
> -        /* cluster outside the image */
> -        if (off > size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> -            res->corruptions++;
> -            if (fix & BDRV_FIX_ERRORS) {
> -                prev_off = 0;
> -                parallels_set_bat_entry(s, i, 0);
> -                res->corruptions_fixed++;
> -                continue;
> -            }
> -        }
> -
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;
> @@ -518,15 +550,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->leaks_fixed += count;
>           }
>       }
> -    /*
> -     * If there were an out-of-image cluster it would be repaired,
> -     * but s->data_end still would point outside image.
> -     * Fix s->data_end by the file size.
> -     */
> -    size >>= BDRV_SECTOR_BITS;
> -    if (s->data_end > size) {
> -        s->data_end = size;
> -    }
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>   


