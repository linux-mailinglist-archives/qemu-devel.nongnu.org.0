Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444324BFE78
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:24:42 +0100 (CET)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXxx-0001HR-B0
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXoy-0006SB-5A; Tue, 22 Feb 2022 11:15:29 -0500
Received: from [2a01:111:f400:fe0e::716] (port=40768
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXov-0005KC-BA; Tue, 22 Feb 2022 11:15:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSfN73bi/n/l325oTsUiQWT9nCC/gE96NqRcgO7A+QoIqYPfCY/nsd2GqbJ8ALJBpgG5QKdNZO73WvXOiH2BFS6fB2ylhRuB4lzUbJXvCW76tIbd7uHIf7JNQSHtjK2u0TdymkCKRZHnsIWtHaFQP1DAZ3COJSmbIS/9y/dkXnUC8MWZ5RsNwUp6V/WKy2kwgAwaG9v/fb4Cek1/OzNBWKJRbz28GsfI+sSJMinxHQSGOI15HSPl5zfuyC3Tj8qhwOsvUh9zXUN1vLzBLOdtgUUxQ0ZF69iSZgTJ/TdS8P4xiSJcvdeMGGvUthx+3aKpRadEY2vsvct62Quk95aQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcfr211vHn5MC5yw7rMwreNQuA72q5Kv5UjlxcMbZIg=;
 b=jseTLJnueuXaI18EljEkeoRTgaIT2WegC1gkbjhzvN61a0vIX1kzxGMRPEhfyEjFmOCkriZTprwVSoJhRlN6ZFEJtzh6njmvOKyvC7KdL9n9+kJH/Fvn9WzjavHU4JlxemCd5bnPvwUD20wqzpPPKgsJr9XebHmpJaAdqbUiyppjGgUgXPISk5XSoi9Qd/VL1RdvbHl8Ja6Rpoge5J0ge+UJZyPTkEV/xo7jdLBNnlqMBlDTV2c5sUBhA0Gng21WV16OT1uOh5/zDbkB2thSdPKPZr7flazyyRdPPWMEWiVOtfThqI+DvOM4PwtjD6YLxrvwa5XlCCaIMxX2N1PDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcfr211vHn5MC5yw7rMwreNQuA72q5Kv5UjlxcMbZIg=;
 b=tEZKHUTx27DN5iPDcdbDegoKYiN2P5UK0LQje6xEkUKdFtpm0TcmLq4SPxSOe7neFb5le4hCUpXBTM8bh8HnKLdhRRrxgcC9v6YCXCfZ+6vLF4h5XzrjBAXveIKqI6G0f/PjfIB1DCaUf/t/m+JfKtz1B9Rh6m3wul7LXY0Ewy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 22 Feb
 2022 16:15:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:15:12 +0000
Message-ID: <12b5a6c4-d214-8d9e-46cc-6c3177397f70@virtuozzo.com>
Date: Tue, 22 Feb 2022 19:15:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] block: simplify handling of try to merge different
 sized bitmaps
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220215175310.68058-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e25ceca-966a-485d-1f0b-08d9f61e808d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3468:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB346868C83D2A1767F16CA75BC13B9@DB7PR08MB3468.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsdFYPop38YVgi178SyNLv56cMDjtkLwjnSsOG0MfH+ej5WaG+k0kZVirBd98O8msZI30/lGemu5JueWAKsROIJ+PtspKt9pHfjqpEUC4jETVTRVYDeyStIyYv2qpOCCplaGR6iTGMYNTGX+iBep4/6sbQ2JjmkcZlTbkWFyCF+PQKw4bTWt6QwcDZKbJYJaHPFR/ZuJpMRQ4Rxi1k7CuL4udMDJYnA9cBwBvCthoWEIwLKO/8Q0MiTJeJchZwNafsnEbzD43tAnqpwQ7V9skI8VLFcxYeRXAc+CGvNXAEJdASljXVvS9TVz62m6ScmUMJY5C9vZMUR4urDoQwc7hZ3XZTW6Llvk+6adHj2O185d0EDaWYN6IeEaah6SD00Lb1h5KY/Rd4rJxxLlrlkIbfR7CrToinlStABh34HqBdeaCTYuAy2DG9YYE9u9BAM0Z4zAJCai8KePGl8Wt32vizBjNkyf0CTVz2DpFmq8dgDcqLLBkE/Uanp3aY7jKpRp+r7uON5Wg9asZXz99Mf/ftgDEdyOYwMre7EUnoczS7Cbh7QIXu7VM1cyOAM6NnyyK0DVKxZ04Gm+68qFxqxP7P2ZW7uCdpk1BmHNRQVlHiYM/L3Doapx8am1CMaB9PiCsDnpvF9g4XFPifze/BGIQ9nFwcRbP8VNvXlq88GSqBO21+sdtEZpR9mxvT8WP6TJcPEgP4L35PNdg3ni9dgxK3Muoj8/4vdBT2o33QsRfPo+HouPNsIAcECCdsVi+UQ8s97vLl9RnT6VOkTEj2o0Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(2906002)(31686004)(6506007)(26005)(6666004)(186003)(8936002)(83380400001)(52116002)(36756003)(508600001)(6512007)(66556008)(86362001)(38100700002)(66476007)(6486002)(38350700002)(6916009)(316002)(4326008)(5660300002)(31696002)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dOMERKODlkc1FkZ2k4VDZmRkNnbkR4UHk0Vm9OTHRxMFdrRjFJODdRdlNZ?=
 =?utf-8?B?bXFHeUpjL3JaTExFYmpyWnF2djBhWHM1WXZNalVkMWhhRkZydjRHUWtqR01I?=
 =?utf-8?B?YmtqUk96a003K3NkazdBYUUyWU82czRrTkY3eXkzS1RhQWpWZTVFemdiU01v?=
 =?utf-8?B?aEl1THk3dkt6VmFZeUswUXRLU1RXeFdrT2JKalRSb1FFeGh4ZjEyQi9SQWdn?=
 =?utf-8?B?b3lFcU1FZ3ViOUZ1ZEFNNGRSM2c2UmlabnpDaGFhaVhhZ3o0dE8rd3Jtaldi?=
 =?utf-8?B?SzdNRmFKbktEemdzV01EdjNFSmRjZzJVVG5kY1NES0g5WTNsVW00eW1tMURw?=
 =?utf-8?B?Y2JwSlMzMnRZVUs5K0MvR2YvdmV4Z21Fb1Z5Qm84MXFGeEJjUzl4b3F2SGt0?=
 =?utf-8?B?S2xDMGZYRlZxRFRGcWZBdDUydk5xY0k1OFMzOXY1V0grOFdCV0tmbnNnNXNF?=
 =?utf-8?B?Nlc4a1dtYVBEbTk1cU83TDc3TEpZeGxXYngzY0lKWnFGVVZBRDZuc0ZBTzJm?=
 =?utf-8?B?T1U4RSsva1BrS1hHd3hZTFdyOHhOaDhPaHluN3NFQ3RuVjJQaUZkL0RGYmdN?=
 =?utf-8?B?LzlCS01ZL1dpRDBGbDViVWszSjh2eXpYWTY3OE4rbDRNQm1tQUxOVmZVMkNN?=
 =?utf-8?B?RkFXeEVrSFZQUmNFRVNweGY4TXlmYXd2WXV3ZkUvNmRoK2g5L1FESExBQ2F3?=
 =?utf-8?B?MlN5c2xsSm5BdUxhdVU4UnZpUGxoSTJCdGZkbUM4TG5GdkhRNmZVOUZvcmgw?=
 =?utf-8?B?RnZIU3UwcGVXWDk3RlN5a0JuUStud1lGekdnbVNDenZUZTRvVTE3d2RrWHNC?=
 =?utf-8?B?c1pqa2JPdUVjUnNKdHNkUnhmSTAveEhQVlpUY1FSNm44ZDIrbWlnOEdUbC9u?=
 =?utf-8?B?K0FZSjVFQm9admt1ZEd3WEtPTFVDdVpFTDRDTThKUldTY3pHWTBOYWJJQjFZ?=
 =?utf-8?B?Z2lod2EzZGovaDErYm1aRFdoWDNFSEc0V25qNVNZSU1JckxDd0diRWo2aVVB?=
 =?utf-8?B?MWFabHZEL29RWm1kSXNoRnN4MXRQU21kZGp3VE1RcHZOM2JRY2FUOThmaXBO?=
 =?utf-8?B?Q2lhd080ZjM2elAxSWhzWWNOYjZvSXBXalYrRHRvRm1mUDRkT1NEb0FaSXQr?=
 =?utf-8?B?VzF5ZXJSVkxSQUZVd1NseWh3S1laNGJrakJ3WHJkVWxudTlNWGp3UEJtT1Bx?=
 =?utf-8?B?M1FtYzd0WUsyL2tuTGZMT1NiTUZsNE5hdjVHZ0FST1grYVQvRklEa1BLazRi?=
 =?utf-8?B?eTF2TGE1T0hNSy9YdGdIMTV5bU1iMUZjMDY3ODJENEJ4SCtCdTd4SktJVmgx?=
 =?utf-8?B?QzhEamh6a0tlYUpDWEZnK1ZNaDdBaFRUSjVPOEFwSFhPVzF6YUk0KzRPYXJv?=
 =?utf-8?B?NThoc1BCMmRzRkNKWG5VZ3RWa2R1ajFqMkhreFBSbW16V1RBSzNhRUVMVllt?=
 =?utf-8?B?NVF4OGo4NTdpSkVwUGcrTjZUektpRGNISHY2dFpIVmFPQ2lYTlhWUmd5czZj?=
 =?utf-8?B?S0V5TGNQdHZGbzlVM1cxU0hrc01ieWcwNkZEWm8xRVNQQ0cvQmx3YUJaRWtG?=
 =?utf-8?B?ZXEwWUZDcTNpcDh6V1BnTFlkcFViM2tHRWtvQXUvbHlNNnZFaUsvZUFIZlJo?=
 =?utf-8?B?bTU1elRvSXVKclhMeGFDdXhsUFJ5STdJYVh1VjBRZjZmREZiTThveE1LUllw?=
 =?utf-8?B?OHhGR2NGcEpoZUlGMFlHV053M2ZWODFxd0VteFZ6WEVsb2w5M3QyeWpyRUZs?=
 =?utf-8?B?R3JCK1R6dWswZXZIUFFZdEY5TFhzSm9KOXpIaEpLVFJEQUpONnloSUxOK09L?=
 =?utf-8?B?MkJBUStJRkFlenp1cHpnKzhoRG9EYXBoWUJmUGI2cTl4RkNJRE44RUNZblpH?=
 =?utf-8?B?SGt0NnRFbitCWTR3bmw3U2lmZGNPUWRPS0NKVkJpNUFGYzBQV0NadGFna1VP?=
 =?utf-8?B?Yis5NTRLQjRJVUdqcElGVGcxb3diT2gwZ2ExNFZtRU41NTRma1VHcTJsbi9k?=
 =?utf-8?B?UU4zcDIrUUVRaE52RDRwZjUrMkRKaFFDemxURUpybTVUVFhGVzRPcXpzNkVE?=
 =?utf-8?B?a2crZnh3Q3doL1I4TmdPUHh5VWNHVU1EVlF6Uy9MNlRLb3MrdVl5VDhuSkR3?=
 =?utf-8?B?dUp4NitWZzUyMXRiMDFOQTVUR1dYaGVnYnppdjBvcklmeTJlTzVXVy9BWGhB?=
 =?utf-8?B?L3Exanp4ZEFNMnh4SUVQWG9vdUpocGdsdk9BVTU2VFBWckRON21hU0R0NitR?=
 =?utf-8?Q?RpxlFhV0Jd+Fo+Iv2beOgV8PHlriTbk9dv/FehOIs4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e25ceca-966a-485d-1f0b-08d9f61e808d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:15:11.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SsEqQb8ZTNKw8+XVtAcUUnWYG1tyIXNM3Z/z1CXET380/Nty2wi7P8P0YZ16g2XQbV4iYg6WVUbtL5aq6FahnOpOGu+/800MrQvYNc9vMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3468
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

15.02.2022 20:53, Vladimir Sementsov-Ogievskiy wrote:
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index d16b96ee62..9d803fcda3 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
>           return NULL;
>       }
>   
> -    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
> -        error_setg(errp, "Merging of parent and successor bitmap failed");
> -        return NULL;
> -    }
> +    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
>   
>       parent->disabled = successor->disabled;
>       parent->busy = false;
> @@ -899,13 +896,14 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>           goto out;
>       }
>   
> -    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
> -        error_setg(errp, "Bitmaps are incompatible and can't be merged");
> +    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
> +        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
> +                   PRId64 ", source size is %" PRId64 ") and can't be merged",
> +                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
>           goto out;
>       }
>   
> -    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
> -    assert(ret);
> +    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);

bug here: actually we still should set ret to true: it's a return status which we are going to return to the caller!

>   
>   out:
>       bdrv_dirty_bitmaps_unlock(dest->bs);



-- 
Best regards,
Vladimir

