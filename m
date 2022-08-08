Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C461B58C84C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:24:46 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1oL-0006AY-TK
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1j5-0000H1-Rq; Mon, 08 Aug 2022 08:19:22 -0400
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:53838 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1j3-0003SO-Pm; Mon, 08 Aug 2022 08:19:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwlv3sSLSoHVtL2v94I9FPXCNOdsUizi0Bu8fhwgTnBlu75gD2Ekb2SP461qAvFgNNDCY0Ko54QigzcJSqESASsKGv7043XQm4xMdNDvbe7mjhL5IhlnQvhT71mz20QgAaU64jnewz+Khk/dspg/1aI4FYSyF5e2eHzdYmAQaQlSGJLAhkH79F/7ZhGi6X8UF2wEv9csCYTXsHiZpTrE0PPzLiOuyzbOAdJ6X4mZHeCsiCRA1JV7DlDZotLT3T6AmHsVPuz/zxXr7FYesd6j5mQCJiPYhEHTSvmmBWTQwa65KCpg4tCZhKf1BMaRhmfysyEyAHxwYcwPfZTHVtdYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXzLyvMF/Mrv9Ekx+pHLoNB9PI0bvqH36+nQDDAISIM=;
 b=SuimUS07Deo2ZaobZxYBpUiSp9ViEKBGktj7t9tdRtahD0hKeCGhXoqPfnoyOhxkYGR8g4AVQXo8ZSSSTpE+XWQnAqFQtd/8/2FEddJTgRF4UlAUbyMjr7XhgB429U7GqgtWkjkh33ie+Z9FtYA7mrwxqch5wQ9vWS1C8Gv6gEY9q6h7CBtBriHp4NEFLtJp5U3QFOwyTXqtQ9GM+QPoF5ukZBCTJB8MKt7YziaHQGmS5aMngodSR4CgI6GJKGD9H5x7OYO9+Skjt4yEYDafj0lpG4MWc8rmZbKifUpZck7/U59fznYcZv1shftAxFkwKDB2BHC6dImWX34w1y1PpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXzLyvMF/Mrv9Ekx+pHLoNB9PI0bvqH36+nQDDAISIM=;
 b=bRjeSOA3HiV4BohGiRiVZCaY4j24+4/i3a5NwdhqrczgirvEJAqELLyjDhmiOh7FR7p3I6AtANCmjUlBFNplOzxbekMsRBRYUX3xSAf99Ldc7ijBY2P04K3tCrNRe51Pb7LKqcYaK0Az2+1Mcv4h69PUv/KK0QxQrNrVi7Gm0vrrKaimp81rlW65hYNAK4lMHEI5fK64a3XMcffPo0vyYInHgLDyB07ln1q9K7tqlYy8SASoXgDQ+n3XwLvtmu7szPsDocS9VsCqtYL1pGwfU1AMhTBoFt9bYo/5UrpGz6W5PaGi754ipdRBJl1h476cAVa+yBQ2y631vdRx7QFoOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB8PR08MB4156.eurprd08.prod.outlook.com (2603:10a6:10:ae::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:19:12 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:19:12 +0000
Message-ID: <c16f830c-a4d9-df28-949b-24a5177ea2fb@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/9] parallels: Move check of cluster outside image to a
 separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::25) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c33a1ed3-bdf9-4992-6c7f-08da793833d2
X-MS-TrafficTypeDiagnostic: DB8PR08MB4156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pCrXz87+1j848jAYvRdqCOVr/WLVBfu6aCO2Qg+r/pJJmdkGRvRfshTrSTFjeFuQd5f6IgBwPx6cHICu7qns20+zTcMrEGoMSR7ntRmqds57a8hf3Qo9qBj8Aq83VVgUOfe9+NmZPnRLHKJ+loUBeuPV210rHv8u/q3+9YA8v/cSq31wLOGquq+AMKz8S/9uj4DG69TJpcXSCY7FpjEZHN3/jEKIAv7lrbYyJiGkpMJ6TnWPVyPQA426yjdWw+qX/RNdmpAvuUcsvU0qmrOYBbMj3gqBum0yRSh3hfqCyBlX/5LXGaJpogluSSvg/2V0O8XmkOkP60JhnHZUPZkRpMnHwWVZ7cCRBrocmT1uGDkaEH6VywyyL7/b4wp8Y8w3zZFq8rjenGrgadTGVeN1UY4zv2652c/rNPgESPH0pta9sG87aRTxDFSf0flN2W33twY1/7+bgQc/Onr2cN3LXfLDPGmb8FXt83NxqkjYM8qYsxAVUf5JqMV8RuWcKjctroC1j+6uClMB7+M/papTgxA5ql5RWwYHJe1XcFwIJeGE6WBSi8YZg/CvK2amHOCq+JQnmyioTF0iQ3KXz4JW+pwbQu6O+4zFe8d/sdZ5A5gzsjaO+QXkO5G3an4NHNC0Sz9Aaop4inEKWG1nXjNkJaH4g+vXGuTTWr6gB/2lLazCSlS5fShUSh3soEgdxos6yMsreCL+6gsNW+bLMPCqoFudxNNX6j8r6q3tkqzYHzXkJQyw9nGs6zQgp+GSzzSV1Oi066B+BJ+kVmCXAVibwQTmlnLO0UzJL3DmfwJAIvgt0L8MkPtfi7b8sLRdYes8oxxrCbyqcoEwHwDgDKMI9Vps9RhU6ZTycgsLFeSVZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39850400004)(136003)(366004)(396003)(376002)(52116002)(2906002)(53546011)(26005)(316002)(6512007)(41300700001)(2616005)(6506007)(83380400001)(36756003)(86362001)(31686004)(31696002)(6486002)(186003)(66556008)(8936002)(66946007)(66476007)(5660300002)(478600001)(8676002)(4326008)(38100700002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRXUHVnRUkwaTJMSitZMFhOQVdZT3NsU0xRSWtSNUdmMnlYQlJRTEFJelVm?=
 =?utf-8?B?UVZNWTFrWHh4UzQ0MG44NW1rcExReTJvQk5lRjVQak5FbHZ5V3A4cFZCK2RJ?=
 =?utf-8?B?ajhZRGJVR084ZHZKTDF2RjRzNFpGYnlsNnJJOGRJWFh2K3MxRGJmN0kwbFdu?=
 =?utf-8?B?YkZsdHVyRyt5VmUyd1pzc0N4KzhKcTcyWjdrRW1ra1Z6ZkdFdzIwbVpobHNI?=
 =?utf-8?B?dGdISWo2M1pLK2JuMzEzYTZ5TGo1MkJKUit2WitmdzVMOGZoUW9YN2p6Wkc5?=
 =?utf-8?B?NFZHcTNZNlkzMmhjVG1ud0ZhNUtpc1FNb2x1Z0R3c29GbHA2T2p0TFN1TDN6?=
 =?utf-8?B?bjg2SCtMY2JlaEVzQUM0dGt3UUtHWTVISFRYUDNPcElTaW1xcjE5ZythRkk2?=
 =?utf-8?B?M2dNemZLelNvVkRINUkrTmVVcXRlSHdLTGJST3dUVXdLTUE1cjJubFBScElE?=
 =?utf-8?B?TWpQdmVzSk5DWjJjUTJhQkVGSkZaNGdSQ2hpRnVyY0xONXhLOVJWaXk2UWw2?=
 =?utf-8?B?VUVKKzltUzV0cFJQUVljUXZyVlNTN25hcVVka2FteWpkYXFWM2orU0VtU2dS?=
 =?utf-8?B?Tmx3cTZuV3lUNWEzY3NCeTJlWUYwYUNWN0N5bXg5aE9XK2hndlc2UnVxM0xo?=
 =?utf-8?B?Q09zcWdNbjh4aUs5UHBKU1RpUlRBVG9mNFcxYzJmOUVYL0ZjK2FyWVgvYkpW?=
 =?utf-8?B?UGlQejlJVmpEaGtxWlFiNjZiK3JPWDVKeTFldmlQMkhhUEdJVDJhckVNb3Ni?=
 =?utf-8?B?c3djbUdtUnBkODhoaDROWG8vNEVKWlVPNGhBOVc2RVRzcWE3MXI1OGlGZ2pX?=
 =?utf-8?B?alN2UFhEZm94amJRcnhCY0xDTVZhWDJSakRxNU1YTjZaNkhNek1vaU5tVC8v?=
 =?utf-8?B?bHdXVzl1Qnp0dGF3aWJ2b2ZmVzNrMjdzemRIVFJPa3ZyUFlQVXVXRmc0VzJK?=
 =?utf-8?B?d1lkdkkySlBPUXQrZkN6ZHd4M0ViVjd2V3pYL214WmNidDZTaTZSc0IxRU8w?=
 =?utf-8?B?bnAvNlEvYzNGVGozNERzbmRRSkc2ZGk2eFhpV0lhZmZIWDAvQWVCS1R3RzNs?=
 =?utf-8?B?S05vTVZxeGxibytXdmVBY1l0K2tZZjdsdENxdHJLdmx6T2UwbUU4SDF4NW9Z?=
 =?utf-8?B?dG0wVVpDRkNVN2lEVDl4ZUsxU0hCOFRucEo3RE8vV0Z6bnpZNDEvbDVrbXg5?=
 =?utf-8?B?bzdkL3YrOWxVaUNKWGhiclVRNnhOMG9YL25lMmZ2SnAwK2JiMEFWc1lnYVpN?=
 =?utf-8?B?MGVUaEdPTDF3NU5uTjhidGNSRURRcTBORG1PbkR5a1BBUWtjRVZxQzl6Q1Qw?=
 =?utf-8?B?VVJrNlZ2RVhBUXBrdGc2NGpqVU5rcjVWM0RMQWdqb0sybWxTZ2pVdm4zYm1N?=
 =?utf-8?B?VUQ4QkZTYlJFcTZaWVBOaUR3bVJaMG9GV1FVWVdBUnZuSVBqY3pQcTRqSGc3?=
 =?utf-8?B?aDRyZk1UVFVDS01iUUorS2xqVEhlZjlLMDB3cTFTRUlUdFd3WHJxQVc5UElr?=
 =?utf-8?B?NFgxLzhSWGMyY0pnTkpicjU2NVQyMndpbStFcTRsVHduQXduUVBsaUJuZE9F?=
 =?utf-8?B?cnBBajIrdWZ4Z3JFcUJOdTNpL0p4dnBMSHF0ZWNkYzMvU1NrMW1vVFU5eXBV?=
 =?utf-8?B?WDIvWjZQeFN6TDVJY0lyb1dtRFR5UmFNUHBxN1ZkdmVMaUZKb0J6NWJUdG1Z?=
 =?utf-8?B?K1dEK29yS2Zud09Hd0k2R2FqdFA4b01NQUhiK2NTYUZNbm10VllSRXBQVEp6?=
 =?utf-8?B?VE1xelh6VjltVzREQm00QmRaUTAyOWo4clgxYk9uOGFvZXM3NFZEMnoxK0tL?=
 =?utf-8?B?Z21VcERZbHJsbmZmcUVLRHNrTWI4SzFIT3dvcXRyRllQL3J0TnUxTmhSS0hI?=
 =?utf-8?B?MnMwWVdnRGtqY0hZNjZLUTN4bFkyUXhlRG5EWDFsQ3BOS3pNNDhDMXp3RHdL?=
 =?utf-8?B?TlFNYkJQM3ZFaldRMW5GZlNoWWFHcTlPUGlmaUpRdEtDZU9QbGI1Wkt4NENX?=
 =?utf-8?B?TFNVL3hBV1o1Y0hQSzRMY0lZYkJxWXRvRkdjWDVxOWZGNjBTdWVXd3RVUjhC?=
 =?utf-8?B?dCtwZ3NJeWtKUUdvRXdrV0QxYUJNK3ZvQVdaVWF5aTg1aDdtQkZtVFd3TVl0?=
 =?utf-8?Q?0D9m9E8H3UZxswDA3mp8YotS2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33a1ed3-bdf9-4992-6c7f-08da793833d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:19:12.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNchzPNjj5exK3W4RHaWM8BtZLQJTyoN3nfKRLT7F2tcaVZULbutEbqqddwRLh7TDy5HR3SZevVdq/fVhPzkdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4156
Received-SPF: pass client-ip=40.107.6.97; envelope-from=den@virtuozzo.com;
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

On 08.08.2022 14:07, Alexander Ivanov wrote:
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 76 +++++++++++++++++++++++++++++++++--------------
>   1 file changed, 53 insertions(+), 23 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 108aa907b8..7b400ecdcc 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -413,6 +413,13 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
>       return ret;
>   }
>   
> +static void parallels_set_bat_entry(BDRVParallelsState *s,
> +                                    uint32_t index, uint32_t offset)
> +{
> +    s->bat_bitmap[index] = offset;
> +    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
> +}
> +
>   static void parallels_check_unclean(BlockDriverState *bs,
>                                       BdrvCheckResult *res,
>                                       BdrvCheckMode fix)

This helper seems unrelated to the patch subject and should be done 
separately.

> @@ -431,6 +438,47 @@ static void parallels_check_unclean(BlockDriverState *bs,
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
> +    int ret;
> +    bool flush_bat = false;
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
> +                flush_bat = true;
> +            }
> +        }
> +    }
> +
> +    if (flush_bat) {
> +        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> +        if (ret < 0) {
> +            res->check_errors++;
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
>                                              BdrvCheckMode fix)
> @@ -439,7 +487,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       int64_t size, prev_off, high_off;
>       int ret;
>       uint32_t i;
> -    bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -451,6 +498,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
> @@ -463,20 +515,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
> -                s->bat_bitmap[i] = 0;
> -                res->corruptions_fixed++;
> -                flush_bat = true;
> -                continue;
> -            }
> -        }
> -
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;
> @@ -489,14 +527,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       }
>   
>       ret = 0;
> -    if (flush_bat) {
> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> -        if (ret < 0) {
> -            res->check_errors++;
> -            goto out;
> -        }
> -    }
> -
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
>           int64_t count;


