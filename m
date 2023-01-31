Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3891683196
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMseG-0004A7-EC; Tue, 31 Jan 2023 10:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMseE-00049q-Jc; Tue, 31 Jan 2023 10:34:14 -0500
Received: from mail-am6eur05on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::721]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMseC-0001ii-Tt; Tue, 31 Jan 2023 10:34:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYObouZzcY85wEV456b0E4uSM+ys+egldlLrPl2avNfiOiMVByL/fqhUw8qrUlfqD3xSTJ+im3oXZ14mONkbZKsDw4H3KwQW+kHcF7fbA2ma9/VMLStFu1XfsnMpVWiAi9b7F9ZSGEEc0dD/22G7Uj3qWRT2sgVGYWuAFCYsQq1US9Hb9EQDacf+fxixNMyJ2DNAMUNNSPBJY6gxt3x6mzMKzjt2u1waTV4iiVjyIGshE++Of6AZNGQrN1jrHviQZl1rIJ/PP32/7D9MIubPH49tRoYVLgZmkrajIWfkoAMzzQ/OjWm9PrlHImcH5KwinmVYxxTJt8VhW/9DAIzX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKdSE/re7NguHUJrYFEI0+VDBbITPVkIx32olMO0MbU=;
 b=lt0fnXcKPX1Bfbbyhk6UUUP0QgbRRYff6SfjctYsuHIYxq2Lm5lK7jzjvW8OjWX1ttx4slRUW1RE3r7Pt+N1IOxPgnl/kU8BDxPH+BKwD/shXy7dKd9fwDgP5hdFhDGxJhPiBJgCaSFtx1JTBMeUsRVRraGZCRf9IM2WSIrbzQ2HXdvav/alaLDTHHHK1OtYwKoDMM2WkJTG/93mRzzqnpfWHm3yL3+MpvdurD1XP2TFus3DPxtSugM8drja87E7R6KFhv8ew9DRblXdOV2oVhX4ZoiVD1xCF79voBOrjvWUf/i0bPwFx2Dno5VvOdNQU3pzq5TLqqY2OTonEz5t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKdSE/re7NguHUJrYFEI0+VDBbITPVkIx32olMO0MbU=;
 b=ZeyazKGDnlnLn/0FZVmtnSFCkPacngwcYPhTZmuqzkgqt7lTWQefOD55Nq7xUqX5z0GrIpq/a2cZ5EIXGtocR64Mv6bjvNq9EW5zLQy/Q4ljGbtGWFtuQMuSOi5oqBBV9osE3Thgiztr/8sIWGpEuno5TSQuIPfghnk61ZxgrS6xWdVN4rCSlZ5vC1TmIf4G7rdBknh55gjB3fguoHvQ4b7ye46c5l7Ts7zxMPM8j2DOewEkBOqx9DRbDOgMjDactXKuRho5pZK/dKoHKmcDRfNOl1gW24FDqy/rpcsqlFjCiIIku8d17f/V74di0vBr9uP1uCPHGXFMm8qPCWQ5dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 15:34:05 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:34:04 +0000
Message-ID: <b47909ea-a2ea-1e5c-b6aa-2e2ca5b17c87@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 08/12] parallels: Fix statistics calculation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
 <20230131102736.2127945-9-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230131102736.2127945-9-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0185.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PAXPR08MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 196422a3-affe-464a-0144-08db03a095c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSoQj59eKJ6ZMYFdW/YGyrZPGwt3xtGKfPm60b3xvTT+8GjjSVoIiPvdeQn+XLqTxlD2/VL6ZbfTvrbJW1ded67lFSjrKslviF9Q7f8+HA4AeK1+OkJMF9yZ0pYhelvpy2lvZdLEVw0zdalPRaYOrRWmo8Oi7b5dXWUsn5UPPkdkFwhjPLDMwzyYsDq+BJgDSz3J7vaV/AT3IisFJgD2pmlIIxuy76Lk02Eqyml0RLNPTEz0m0H/Fw8Y5S0V81NfvaGmWvx/SSTbQeZJtWBC6f2tqeTaT9JWSiDah1C4naIwUal2zE9wmU4jPQBuiJ9O9BYjc+gNo0IHum5xxGK/XxVp26iaOOmz2dFNYjEjQzKc+b+Zj0Y3JI9hTY3QvYVP5HJTCNYXO4yfnorRdwoyFViHc+ksohCtpqG69HwW5FGXPQsGDCp21ZnJ+MMUmCYQ33k9UAhkEVzwxBqbRIZxIaU8C20xIwDgIoBykl8/DelTLmDjEMYxieFMBekv45Gb6+LJU3dZcMvmNDNALjZ6C+bUIhKhbkjoOJkda73vjKjbJMO1+77mpCHHL8JBAlkPhFzrgx+0/WlyO52w0wC6ziPPJtAUVdDlIVRXRyF1IJPJnyaviHQwJ2ubgr4/SZCVSY3WtL3Uux1CTn4fqdyzLDgc1d1IkyE1OClIiWj9iMfOcL2Mcm9P+zUo+A0ErRYjmYUvQ5QJGD4gHEkDiOIXxC19wXMa5KeDDba3KDTlILM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(451199018)(31686004)(66946007)(4326008)(41300700001)(66556008)(8676002)(8936002)(66476007)(316002)(5660300002)(6486002)(53546011)(4744005)(83380400001)(36756003)(2906002)(186003)(6512007)(26005)(478600001)(6506007)(31696002)(2616005)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExFcW94YnRHcG9VejdKRktxYS9ZTW5RQzNiQzU0cWExSVFvNlN5Yy9lZVUv?=
 =?utf-8?B?UUJ6NmJ4R2tEZDhoSU1CSHAwS2RNcFJiSENaNkZ3MUlWbFFLMjBpN0hzb0Jh?=
 =?utf-8?B?K2V6SkJIa3VCR0k2bWxtOWpKWHpGeE9IV21yWEVQN2ZJOGMwbWZoZ3N4Zmdv?=
 =?utf-8?B?WTZGbEhxV3JicFphVC9TeWl5MHhBQXVUZmJ2MFdRTWVEV01IVkVwSllxQXB5?=
 =?utf-8?B?OE8zRWZWVmEwSm5rTEo2SE9URkhSbEk0cWVzM1JJcUFwbzdHNnNaSEkyVzhD?=
 =?utf-8?B?VW9ObEd4bm0zNVBNeUJmTEVBV0dTREM3Wkh4dER6TzBVZVlkTVpzbi80cXZM?=
 =?utf-8?B?TVBEcTUyT3psejhDdlFPd2ZBYVlDNWRUVlpETEZTMmRpQktPektTZVV4OHpQ?=
 =?utf-8?B?dHVHK25uTVhzUmxVYTlTc0FqQTB5OVRtOU1seWgwTVROS1FkcDR1TytiM3hQ?=
 =?utf-8?B?UmlvbkU5R00yeVBOV1ZsWFQ3aENYNTlHVWRkZzF2c0NzeFRoclhUazdQS0JP?=
 =?utf-8?B?SjFZL0FRT2ZLWm1CRENNbU8xYS8yN3RSc3RRSFRyT0RWNitOdU0wTlBoTE9j?=
 =?utf-8?B?ZkFTdENpazZUelgyek5aS09JRGorQk5kOUFDeEdpeTl3YytaZFNpMUYrcWN5?=
 =?utf-8?B?YzVKRGwxZEVmbm5HQVNZTndNdFJVTEtKUzlLT1ZCRU5IcXRjZlNraG0xUmFT?=
 =?utf-8?B?ME1tNERPQWZPUDdOelUwTTRBdUJPM3NPQWNkN29EYnJnN0NuT25nY3Ezc2xQ?=
 =?utf-8?B?NVR6Zk4xMVI3QWZTYjV0TFZwSG05QmZrbmw1KzRVeEEyYUFuNm8xSWxCSEdC?=
 =?utf-8?B?RUlyWnpYVGVTcDhYUTVMZ3BTdGZ2aGZqSUxCQ0wyTmt4WkF2NmlJUkVUMlk2?=
 =?utf-8?B?MmhWR0VHWm5VS0xrc0g2dDUxdUNoTlBRNUk0VjFNbzJHMVhrVUpDZkorUDBO?=
 =?utf-8?B?ZmtYMFJ6ZjcxV0tXa3BBbXFYdU5lTjBISjJ6bkhhT3l1US9FNi83MGc3bDRv?=
 =?utf-8?B?WHNPOWpzTHlhTzlvZ0tJOVpXdHRoZ2xGdUhtWk9XOVhoUVlvK1ozUjhKSGdi?=
 =?utf-8?B?Ny9ZaDFsa0U3NVF4dnJtRXRPdEIwVXYwbGR4Umg4OStSNGhyV1FBWVc2bzJl?=
 =?utf-8?B?RDFSMm5PM0NDOVQ3UTg2V0hCUE00RkZkbDl5R2M2TGNTaTBucHFtbWs0WVNo?=
 =?utf-8?B?cWI3TG5tWVFZc2NaN2RlU1ZIRDdqNmRGN1pPdzlUYVVZQTRzN2syZUt4Q0R0?=
 =?utf-8?B?c1ZyMlFabmFCRnRGeVF5bWpscVRDYWhERzl2UC9RNGE1SGtjRGpweGhCb2xT?=
 =?utf-8?B?RkQyWW5na040cVlQa01ENk5NRm16WEdsRWNIWVhFeURZaVdxRTdMMURJOVVv?=
 =?utf-8?B?bjNNVGM5VnJ4M3dIeVRTQjZHWFhwQytReHFmSnR4c0FFeHZ4R3Jnbys5TURq?=
 =?utf-8?B?V3R1ZUh5RWllRkZrVnRGcVRjMHIwcWFodHI4TStvQkhjUDVVY2RscWt3NEFH?=
 =?utf-8?B?UkZQdnNQS2IzbkovSmlIYUcybUdSbU4vaWRiUXl3cHRyVEMwR0ExNzRZQ1p2?=
 =?utf-8?B?ODZ6NUsybkVCcWNINExVWnE5a21OYjliODNzVy81QUFIdWtTZmE2Sjg0L2xt?=
 =?utf-8?B?VW5Ca21rTjhiaVZRL0x5bVpwYzBwb0JESk8xNXA5OXc3Ty9jZzdqUzJGMjln?=
 =?utf-8?B?T3ozRE4wK0FKNDQ0MzFRWVg5dVpoUS9nMWY3QVhOSlBRNHRoMkVWTTFzWXRD?=
 =?utf-8?B?K3NwUmNoZjFQYXNLTkhnOWtWcnczT0FVQ2E5RzRkL0t4c3J6MWVBMWx3RDRj?=
 =?utf-8?B?RFFyc2pqa0ZQTnVEMDNFNkp1QVFSQzdPQitRV1BMQnNvQkVsTmVTSUNZcHps?=
 =?utf-8?B?M09jZWt1eXdJNmZCc0x6ZmRLZXFONm90ekFYSVg2ZTVCejduZ2t4NEJpWnZz?=
 =?utf-8?B?Qng2TnNVNElUU0xjcW8yaURlNWE5dk5OKzFvaGhGazJTK1dQVHgxclJGSUFW?=
 =?utf-8?B?cE1MbnNORldrZVFXejdCcC9TTG1IVmxZQ3VtNXNmOG9veUtoM3FOS3oraXZR?=
 =?utf-8?B?dHVCaGZZQ2prNzQrVVlPVGQrVkYwYUVla2NXTHpvbm5DVmttOUJtM3pjbmE2?=
 =?utf-8?Q?prkM+mGTbsGVWWiF+qiMS5mxI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196422a3-affe-464a-0144-08db03a095c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:34:04.7923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrP2NJ0td59sgIj2zGlYfgOKmGRLPf8ONwK/h70FvXXNz0yhbZLG2Vy+sYBd9Fw2Xrq+q6T/XVwf1XiPux9LKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6735
Received-SPF: pass client-ip=2a01:111:f400:7e1b::721;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

On 1/31/23 11:27, Alexander Ivanov wrote:
> Exclude out-of-image clusters from allocated and fragmented clusters
> calculation.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index f9acee1fa8..7382c01191 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -510,7 +510,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       prev_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
>           int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off == 0) {
> +        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
>               prev_off = 0;
>               continue;
>           }
This requires explicit comment that the fix is applicable
for the case when BDRV_FIX_ERRORS is not set or
I am missed something in the context.

Den

