Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C17504F8C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 13:47:21 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngPqe-00021W-Fw
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 07:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ngPlQ-0001EN-ED; Mon, 18 Apr 2022 07:41:53 -0400
Received: from mail-db8eur05on20701.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::701]:21689
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ngPlL-00036n-9z; Mon, 18 Apr 2022 07:41:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th2+9kGDLRrTdi58weoyGTrtEf481M/EZgV4FzAQRCvRPYuIHyxgDiP3axMWvwEhtheuNum8yJOi3GYkxfRpuTOAIGNf8St64ITqXxY+1tBzx/p1s+hR0wzcjjH3VoDD5eI9I6mAGIavq9cBwAnJh0Lw+LXKGy3rc12uNYZx/TYBPBfqeNWeLMu4hOS4IQNSbLgcFU/0rR6sRa4npPF17dHwizPCFjAa9AV2XGiU8EECKhPkVkTfYaAnYd8DKmkxn1cxOMY3cd3h4tL5ax7Wfiz47VsC2XiWtm6p0wlij7BMcHDDXw8Ufy4v6HuDYctzv3Klw+d4sSS1ZoQ43OWwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPP35AnuUXy9V7RF5FOqRTFfIrAG66ts06FgR2JFAG0=;
 b=mMYggBbymTKgMMRdhVcZYhcYAp/LNbcQHmBRmDLKOxJXtC5QdGSVPbPnBmIaBQbndwz3YvlOETH5KD8csJdqCIkefkU6flXvN8M36SxInw0D2bwPjZv/CYFwjk1F1MpYJXM4aHlDY2LNWSVAWBKezfL0s9GPHPsRV5FHsKFB+YoPAt775zZtXDbSaIW/h6X1ca+dKGUMLoUHVVV/t55yRLC6aXgmlhItPkKA6rIxaxglEk8PiLSKhiGFfomUEYW3W2ywwQZxDq8nfs/BZa9dLku6Z47l+C5E2vmixjU9kYZniaYnfvRfdcauIegfKPSgBjRZebjymiGGqbMTW8vszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPP35AnuUXy9V7RF5FOqRTFfIrAG66ts06FgR2JFAG0=;
 b=tVZXClvpQR5NXG/UxRcxSUC6bemMxTco5mt7KaRf8Uo2h+9KU4cK4pUozqb0fIM3HTS56gzG1Nw127D62uF1jMBC20tdoux4yP8TWNtonImHFr9reyjnY7BNhowzepwOHUBab14oJd5X75qnN/clcy/P2ctdCT2inAr2bNEhc9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB4260.eurprd08.prod.outlook.com (2603:10a6:208:139::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 11:41:41 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 11:41:41 +0000
Message-ID: <7c024b20-6a02-088d-df39-80709893346b@virtuozzo.com>
Date: Mon, 18 Apr 2022 14:41:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] qemu-img check: fixing duplicated clusters for
 parallels format
Content-Language: en-US
To: Natalia Kuzmina <natalia.kuzmina@openvz.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: stefanha@redhat.com, v.sementsov-og@mail.ru, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
 <20220418110430.319911-2-natalia.kuzmina@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220418110430.319911-2-natalia.kuzmina@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::33) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24fdd046-bd47-4c3f-3361-08da213067de
X-MS-TrafficTypeDiagnostic: AM0PR08MB4260:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB42606EBD18C75C3C4145E370B6F39@AM0PR08MB4260.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLBXWtM5NnN19MwY3PMFctNZxGShI8p5mtN+/1QYNhj3uS/HmVANUWAsb6kf030HOaH2u3YrWpapDxr10JG9a45BX6sG47jfUWPBV+xELzfNCSpOP3px1ejalWuYw53bMPvOhXL9FpXixLJJzbu3actU+vXSc9BDh5QjiKmkeN/zx7593SuFTaiuyk1xSVb9bnllWV9hZXaylDCxSLGX07vDqJ3SCuP9+oS1+Kc5TsjRHHXYxMG3Cz2j6C6MKAjSkdlDGG7w+XVWTd3jeLKGsKj2bZVhmmk+VtwdWZQa0hOL9KHJYNkeKRSZkyYWL0xJcmU1sSIZlZXPpMsLNjAi1PZ2i34Wm6Fdbu1FtRgJxLRws8DxVLaUJSCHZfAD+DQG7EeJ7qSuOzWVq+p6rlW+KF2fieUnkIQ2L38cuxaeyxo6iZiwsIr3pgvXEWsDUIDMFBJMeZ0oNA7ZOlXZqo2BpAQYtbLFH2+OHqhgIB5SLFSM8oVRC12A7TrWPmTlEgiLO/LgTLpzeyeEzy1X0BsSNB71rQyEEjDBj8okY1Z8UyakR8mR+QTZGEQol1su6yUh/yMKd9OW4oWzQom9ap9mjrXU+CPpCD/YBFlj7dvm6UikxQ66jfviSX/lvr2Fa420sqqq9XX4g4Sp6wnQydxMoz69oILcbJUkP0Ersb7VmmCvlnF96Qv0U4BNImLQ30tl2mcDDjOCDjuqoB5dMnOAgiJSRtAA1mj5CjWF0u3YuaojD1X489WExt3LIH8E4G4p47Y7JQUN+NMaxfOgQEKt8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(53546011)(6506007)(2906002)(52116002)(31696002)(86362001)(2616005)(26005)(186003)(31686004)(36756003)(66476007)(66946007)(66556008)(508600001)(6486002)(8936002)(5660300002)(38350700002)(38100700002)(316002)(6512007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJaeDhzMjhOWnpUZk1kd2k5Nk5LcEFwdmZFbHZIeUxtMk5SdVRqTUF3czZy?=
 =?utf-8?B?MmRzUEpwdEJEbCt6SE12UzloMkp5RDJOYk1ZaXFFWElJRk5LZnA1b3BWZ0RL?=
 =?utf-8?B?dWNURDlidjY3WHYzUFNocFJlbDBTYlRCU3JDQkNETTFtdUdBMUhheXhpL2R1?=
 =?utf-8?B?VFJIV3pPOGZIZ1IyVys2S2t6aHYrN1BUcXppMi9jaXcxenB6TXRwdkppTklm?=
 =?utf-8?B?Q0tuYlE5ZlB6SFZHTWRnQU9jeHVwNlcyeWFqb3M0RUZ4OGdEaS9qV2ZqOWFQ?=
 =?utf-8?B?dWZVellaWTVaK2tHcVpzQUVpNksvV2Jnb096YWJ3TjdLcE1WLzdRVFN2bG00?=
 =?utf-8?B?bnRqejl5MlN2Q1VCaWxObXNzYlVkWHJWbzNKQXdxaHdrSXhlWjdMcjNmRTcr?=
 =?utf-8?B?cGJMS2V2OUc5NGI3ZTJBc3g3Z010MStEZU5xeDg1WmtsNFRHK1Z1ZHdtMjg4?=
 =?utf-8?B?dzZDUWxDSU1hYk1Ic25hczhYMHFOVm9DbjRJK2pQOVpiZ09IM2E3Y01vT2w5?=
 =?utf-8?B?YTlOWE1qNm81QWs0Zy9XRk44TjNaeE5NRjB5Z0JMSEZ4MU1TVytrSUp0L2h5?=
 =?utf-8?B?aHVvcmRacStDeEFrQTJMZzh6TkhJNXNIVG92eGxPWW5zTEtkbGQ3bW50QS85?=
 =?utf-8?B?cWN1eUVhVjRGUkM4N21WTzVPOUhJMWZ1WG9QODdDcXpua3hsWjV2VWpER2pV?=
 =?utf-8?B?N1o0RVdLOCtEVTV2aTFqRkpOWTJNODgyenAwc0wwWElvTWZUaG41ak5PWFVt?=
 =?utf-8?B?akJvTmFaY01HRW44QlN4N1NsR1phcjFzTk14TWs4cld2b2UzYWJGRURwOERU?=
 =?utf-8?B?NUQvY0l1aS9YaVlKN3ovMTRqZ28xc2ZCakZFWmloS2hDTjY0RDdNdGpkVmxu?=
 =?utf-8?B?VUFDVU5pUzk1eTdjYjliRzIydndFUkszU0lIai9DYjd3aWVpc0NHNnIvN2F1?=
 =?utf-8?B?bzdWcmQxd2k1VU1GQjZ3M2M1TGl6dU4rWTNTTkJ3WTN3eWFxSTJWYk43Y2Fj?=
 =?utf-8?B?QTRVTE4vbi9WbnB5UEpxaFE3QTRjaHo5Q3BRcTM1SGMrZ0lKUFh2blVNRUZo?=
 =?utf-8?B?Z0t1L3d6bm9keThnalk4NmozNXFNRC9qczlIaC9EOStRaVpLaElEVjFwazI2?=
 =?utf-8?B?MVBBbHV0UFBMMG1NK01TZ3hmd2FlbXEzL3BuK1l6azlIdFkzanEyYTkvTGJP?=
 =?utf-8?B?K1FRZ29XcTV3cWJ1TlJydEw0NFlTNjZ4bC93Q0VsRWVQK01Jell1bDYzazlL?=
 =?utf-8?B?Y1NjYWJCekowZG1EUjRwQ041UDhrR2hCMklKYVhTZmc5VXZFZ2V6TEZHdW9w?=
 =?utf-8?B?ZllZYVpXYUdjZm9ESVMxNmZrWWR2Sk5ONDZndE1RTjBhSVBENEtVdUw2VU4y?=
 =?utf-8?B?K2Zsb1hOTEk1cUdDaitPTzc0VjBSUHlLQ2p5bGRXWGt2cFZodFF0clV1dVNB?=
 =?utf-8?B?SklGRmRHb25mU20yODVySnBoakRvbjVXYUJmUGpMaVFmaEVqUURYdTdCMTJ6?=
 =?utf-8?B?b2V3S21jY3UzZzVoU0YrVzFtRC9PM0R2YVJHZG5yanI2OEtYTFFjdWpNRXZh?=
 =?utf-8?B?ZXUzVXMyOHVnbXFJNEFLcnM3OE9zcWdpQkVUQ3daZks2MnhlN3RhckZucEhV?=
 =?utf-8?B?QUhmblBUaFVrbWlCemhYcVliY0VuSStIdUZadklzQjF5cy9ENHQzMzJZTFl6?=
 =?utf-8?B?cDJmZXpIQ3h5ZkhaRjhoUGlTK0ZDTmpvSnRpMUEyMXJDRGJYVE8xdE1BNFpV?=
 =?utf-8?B?TTVQV2RwRCs1RWxWQ0JQbUwyMjQ2aW9JUnc3YXcxekZIOUtBZElvb2tnZUw5?=
 =?utf-8?B?d20rWGRnY2JBNTNGd05Tcy8wak9USmF4RGl1dHUxV1EwM2h1eTJ1dHBJaGta?=
 =?utf-8?B?YjRFSVdNS2RjOG1JTHMybVlmTUh4TGJCVm5uRnNRcVZsN0tVdERaVmZOL1Zm?=
 =?utf-8?B?OXplcnltbncxcHJIVEtVcGE3ZXhDUU9OU2NhWXBrcS9Sd1ptWUVwUzc3TVFQ?=
 =?utf-8?B?NTRvU1RnamxndnRvRE1ob3JGdDQzSnp2T2ZkWG9tWW12ZXFGa01KQUZOcCtU?=
 =?utf-8?B?ZFBERnpld1dMU3RYSWhiek5rVkdWWGh6M0VELzdpRWFXQ0lqSGZCRzJ6ZVRX?=
 =?utf-8?B?UHE5MnJFdm1USXZhenVYQURST1JsY2VURlp4dUtnMVBRUVdtTG1BekVuY0R5?=
 =?utf-8?B?QlVnbWxZYTJrSTJhWVEwaDdTZGtFdVRNazA5a3c0djdwR0JBdjk2QmZOMjNk?=
 =?utf-8?B?emt3alAvVlVUT2V0ZGNHWFhqdDdtOWhJSjdVKzhveUdJeU1ESVMrQ0VpQ1lP?=
 =?utf-8?B?cjhxN1JUelhjVnFCTCtmWXYyVVd1UmQzMU41SmNkckNsSHl5TERzdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fdd046-bd47-4c3f-3361-08da213067de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 11:41:41.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olWC9ExkK+Ocr99MXLWiu5IimPOdxWPdr8KbylG7Gf7xWpyMMMtxwZVSyT2tHySjXHYR8jriN+nh7lyD4c7v0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4260
Received-SPF: pass client-ip=2a01:111:f400:7e1a::701;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 18.04.2022 14:04, Natalia Kuzmina wrote:
> Let qemu-img check fix corruption in the image file: two
> guest memory areas refer to the same host memory area
> (duplicated offsets in BAT).
The code below requires big fat comment, what is reversed BAT,
why it is needed and how it helps us to detect the corruption.
You have spent more than a month writing the code. It would
be very good to spend 1 hour to write detailed comment.

> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> ---
>   block/parallels.c | 66 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 6ebad2a2bb..6a73933d45 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -418,9 +418,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t size, prev_off, high_off;
> +    int64_t size, prev_off, high_off, idx_host, sector_num;
>       int ret;
>       uint32_t i;
> +    int64_t *buf;
> +    int *reversed_bat;
>       bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
> @@ -442,8 +444,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>       res->bfi.total_clusters = s->bat_size;
> +    res->bfi.allocated_clusters = 0;
>       res->bfi.compressed_clusters = 0; /* compression is not supported */
>   
> +    reversed_bat = g_malloc(s->bat_size * sizeof(int));
> +    for (i = 0; i < s->bat_size; i++) {
> +        reversed_bat[i] = -1;
> +    }
> +
>       high_off = 0;
>       prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
> @@ -453,6 +461,59 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               continue;
>           }
>   
> +        /* checking bat entry uniqueness */
> +        idx_host = (off - ((s->header->data_off) << BDRV_SECTOR_BITS))
> +            / (s->cluster_size);

> +        if (reversed_bat[idx_host] != -1) { /* duplicated cluster */
> +            fprintf(stderr, "%s cluster %u is duplicated (with cluster %u)\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
> +                    i, reversed_bat[idx_host]);
> +            res->corruptions++;
> +            res->bfi.allocated_clusters--; /* not to count this cluster twice */
that seems wrong. Duplicated cluster after the fix would be present
twice, with one location and with another one.
If this is correct, detailed explanation is needed.

> +            if (fix & BDRV_FIX_ERRORS) {
> +                /* copy data to new cluster */
> +                sector_num = bat2sect(s, reversed_bat[idx_host]);
> +                buf = g_malloc(s->cluster_size);
why not to allocate this buffer once at the beginning of the function?
Error handling would be simplear or use approach below.

> +                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
> +                                 buf, s->cluster_size);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    g_free(buf);
> +                    goto out;
> +                }
> +

would it be sane to just zero BAT entry and call
                                   bdrv_pwritev(bs, sector_num << 
BDRV_SECTOR_BITS,  buf, s->cluster_size);
and avoid error prone dances with the internals?
Once the operation is done you could start the operation for the same 
block from the beginning.

> +                ret = bdrv_pwrite(bs->file, s->data_end << BDRV_SECTOR_BITS,
> +                                  buf, s->cluster_size);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    g_free(buf);
> +                    goto out;
> +                }
> +
> +                s->bat_bitmap[i] = cpu_to_le32(s->data_end / s->off_multiplier);
> +                s->data_end += s->tracks;
> +                bitmap_set(s->bat_dirty_bmap,
> +                           bat_entry_off(i) / s->bat_dirty_block, 1);
> +                g_free(buf);
> +
> +                res->corruptions_fixed++;
> +                flush_bat = true;
> +
> +                /* these values are invalid after repairing */
> +                off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +                idx_host = (off - ((s->header->data_off) << BDRV_SECTOR_BITS))
> +                    / (s->cluster_size);
> +                size = bdrv_getlength(bs->file->bs);
> +                if (size < 0) {
> +                    res->check_errors++;
> +                    ret = size;
> +                    goto out;
> +                }
> +            }
> +        }
> +
> +        reversed_bat[idx_host] = i;
> +
>           /* cluster outside the image */
>           if (off > size) {
>               fprintf(stderr, "%s cluster %u is outside image\n",
> @@ -472,7 +533,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               high_off = off;
>           }
>   
> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
> +        if (prev_off != 0 && (off - prev_off) % s->cluster_size != 0) {
>               res->bfi.fragmented_clusters++;
>           }
for me this change is not a part of the commit. Should it be present here
or be moved into the separate commit?

>           prev_off = off;
> @@ -514,6 +575,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>   out:
> +    g_free(reversed_bat);
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;
>   }


