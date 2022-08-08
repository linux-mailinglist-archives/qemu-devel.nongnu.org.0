Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAE58C872
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:38:33 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL21g-0002B8-OJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1is-00084y-Gx; Mon, 08 Aug 2022 08:19:06 -0400
Received: from mail-dbaeur03on2120.outbound.protection.outlook.com
 ([40.107.104.120]:54174 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1ip-0003OG-4j; Mon, 08 Aug 2022 08:19:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JznzCtO+1Ddf8luWqXipJAcLhklMgv7YPpzADfJ8ONEIhIrtFc6A87RQxXS+jpeMW5kcOxZ+vYUODFjLr/h463981nAoMlIDaV5R7vsUWPJahts+WB4zgp0h74cjVYWut2CrdWYhhu8Xt4u0QK9ou2HCIgvvnXBxTxMEhcZzf9pfmH6BpG0Mk4NdDJnn0NC4JMNXvUDOX1vgU/6foLonFF2G++bMzYNMbtQB76AfYDoeKGXcWzCDJlJUu9ZlmzIV6Ql176YtBNiJTmh7dz5eczW67Um1rQjVA/K4WG36rlAjjmxCxeMUNp1l31cQ4Y0WikleGQnHsccZU9fCjDROww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahwz1mBzx5qgTJLYHowiJNMqCGpvptxjnhvKsPT9WeQ=;
 b=D+XBMxGjZHyP6dl4JUMC4J85lNercuSs5IS71iNT7tKXINauMUOyoTHQ1inPHuagA9EApIY2mCrLxtuJnMKxoeoLSTY9gM5K/K3StNfYdsi0gE/5HzJMZeLVcMVspbDyoJNQJtkDZdeCqNbQNZI/RsXn6MJuHFMGDDVATvWbfF+0EctAYZNj0kucRR+FFawG/9v0pSMCwztMTy3pSD+RYT0qxvQmGfKCOYJ8Rt32GUBoi4kBd6piCoopxCVGo5pHOoryCuo6mn2TajXNDT714wSGPoiEpxumGmG23dIAQW9+Kvvt36MRkRepqt5H8cIZbSj9ECUK1wN2cFvuXZUCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahwz1mBzx5qgTJLYHowiJNMqCGpvptxjnhvKsPT9WeQ=;
 b=jBoxx2EgEnhH9uESgowqnVpU3vu8bQnfF21/6Me1VUmfC+53Rb2ETh2+0K4746ymoDOQji+0rIYAOWKyntnfL41m0oiVGDq3hacYvrZvkXQASi0tNonD2IjhB6imuKqrlLqfDLWX1Sxb8r484n6ddAe4AIbrnkJUHgtB8y09ILlKAH1i7Q5ispD/HbmWFGCmZEPMG9rLeh79k+SU+Jw6sphk5CQz8nh99Tl3I7BvzgSMh/B8uqcLRfeAAE7Nx7j0rmY9tUx24vShqEnJ9iG4+A2Mf1ryc633syMLJ4a9eEjbZRmeO8HHqL8aMOmU2lPd+hTTJIC0/KPZaWV2qYSr5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0802MB2448.eurprd08.prod.outlook.com (2603:10a6:800:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:18:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:18:55 +0000
Message-ID: <283b57f9-973f-e4a6-51a0-b7715dd6499f@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/9] parallels: Move statistic collection to a separate
 function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-6-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-6-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::39) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b8f0a6c-e9d9-4964-54f1-08da793829f1
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2448:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPQbAShtFi9pAPttYLM+3kdU6BU365+0ek4Ln39KTW/hpzTUUGaQSzTz0p3UT0G+K8ehRYx+ToqWx2LtdvZwslPMFaw7YLs/kLPUytsnkZfDNccPDmiovihRHd3oB7GQazAFSJFnPqIaGn42M4GvCeUBJsq31H0jRNdVLcf999Q3RxyBUm7rKzF/hNLd37nVTLK9+TsIIKax9yCA6+rD9cCWSJ3PADZAokkvYMW+ht8aSOSS2kju+oVVN3XkvcaqJeCvBE4CTg9erllGq1RxBSKiZcwmM1J+5a0LZG8qZHvcAJkQ98AVzVe0pH5oBbtpMcB+uX0qXZtOllRNZhCklecfDdWWtFlRawuTDt884GJopiQFb7oYVBzIEa5iwE3p/p4KwF4w9MnAm95Y6gD4YdPmFGwLNNsyB5toTRgcwW9aRteVoeRudrsrqBnicagchQAbt4ioCw5HfniFF2oAewmSNOkdVmG4YlayagBm28IzLiynjw4R/EbnfZngvw/XdE4nTS2LAEAvhgcEI50Cav4IPJ3BGGclbuiVWmi9cRKiWQOGu7+eJACBcWBPJq9sslbnGybVPbHx7ItD+Dd8hdBIS6VDDHSdqzDXiWfDT1wN1l5RT4HnNbok4FUJfQE7+mbM+P8WKgeWCcCy0t82+xZ7tW599Djfl3l2lwrAS1R1si5ijmBick2ANFPU8Y6+cC4ky5GeOIAxy1WhvxC393sE/J5KjeXqBoCfB9LVnDbI38K9H72CiF6C4uR50wVVYI1130hA3WaU9pHaTDHKoQUnrL8F4g95P9RjQALdWcHZ5DMC2WVyBx7dG6IkGpP+DHvx8w5+hGfRj07haszRAdi5n4OIjZcnAnYOk/4eJwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(39840400004)(136003)(376002)(38100700002)(4326008)(31686004)(66556008)(66946007)(6486002)(8676002)(186003)(5660300002)(66476007)(36756003)(316002)(8936002)(478600001)(2616005)(2906002)(6512007)(26005)(41300700001)(6506007)(52116002)(53546011)(83380400001)(38350700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUl5c2htbHhVL0hhTXVDNGl4Ly9rVW5mUVp1eGVEZGg1b3EyclFYaHBET0Vr?=
 =?utf-8?B?MTNRblEySUtjZDBXR0laVVV6d0ttUldMSEVzbnc3NzZKY05nVUQza3JtUFJq?=
 =?utf-8?B?VmR4RHpwNkdmanFhVTA1YkR1bURRMlAzZmNNbzlhTHdEQ2g3NVRLK3AzUStt?=
 =?utf-8?B?dmthaXplc0VtTkV5ZmlvWERwNzVzVU13YjkzUEYvOWFjOTIycUpoUllQYUVI?=
 =?utf-8?B?TisvYjB5a2dCemlvSGpJek5zNmM5MXN1bDVVSnpkVXJVRW1xTFlRUHo4b1Bm?=
 =?utf-8?B?d2VJOWgxV2FSdGRPa0dkQ2dHVGgyNmdhc0pxaUVlWkpNblFEVUpFY3REZG90?=
 =?utf-8?B?dHZKdkFFRi9DUWVjVGtoYXFrbDFrOHZJaTF4TmxIOGxoaXhFcmdQc2Y5aW04?=
 =?utf-8?B?MmNqNDFSQ0sxMnVpOUlPYXlCMnQ3R1hUYkJYdzNIeWpYdmVpQ0JyUjVHa3pH?=
 =?utf-8?B?ODNORkd5aUc3czloUnVrcU80aERkN2pOdkpyZzFSK2lDcDdVRmUzYXBCSzZk?=
 =?utf-8?B?bnJwbUZ4dXF0QUZ6THhoVlU0UVFWdW80NzVKZnlwR0svbGhTNWg0VFdIR1pl?=
 =?utf-8?B?SHNFUUpNSXN6b2FNNVUvOUJxeFJCYlRHWmtxY0pMaXU4N2h0M0FybTM1VzNi?=
 =?utf-8?B?Zkk1L3BFbVR1aUR0b283WVpRWjZVZ1VZS0cyR2JOcWJ6VDR6SW5zb3NSbEhJ?=
 =?utf-8?B?ODBGRmwreWRqS2dHbHFEUnRsYWNrOVVFWWFBV1prMVVsVmp5YTZ2ajYvVjRS?=
 =?utf-8?B?YWxnUlQxd2ZCR3lpQnUrSzlTN0xzZ1RuTEtCUXFOVXI0ZkViZ1NtR1BtMnp2?=
 =?utf-8?B?WjhmTEVOMTdTbzNkRk5aSFNOeWdnbTdUZENzb0lDZXZHRGpvRTQ4R1AyQjhQ?=
 =?utf-8?B?ekRaOVd3MmlGeTR2dE1KU216REI4b3JwNTBzekM1bkxiOW5pVW0vNzJVcHJK?=
 =?utf-8?B?UWdzdCtmSkp0WHJ5Qmg2Q1JuYTV3Vnc4dUJDbEZDaXM0cithZmVJSzkzRmJV?=
 =?utf-8?B?NVdXYU53UE5Yb21YeEtHRmowaldFZG10aUYxUldOTWErVWFmV1BNcmsrenIv?=
 =?utf-8?B?UjVCR1hJNTlRVHZnUVZvYlBRQkp0d2JRZ2NjNisxZDBsWEFvb2NWZlI2RnJv?=
 =?utf-8?B?djFOZXNvRHVFTktVOHZoc3g0c1ZTSytaZldtaXBFWVZRUjdwSk8zcjFodnpK?=
 =?utf-8?B?WEpYM2Q4cDFSZnFaaytzQmlmNlhqeGNPVXpqbG94MW01QVY0QjduSUtkTmdC?=
 =?utf-8?B?UEg0SFNrdHJMVGNyR0VSS2o1M1haUXBOdWJla0IzaGUwUWZHejRQaXZFY3lr?=
 =?utf-8?B?ZWtDTzdrMTlESy9RdGc4VEMrdkV4TWdHL0thS3RtY0hJTXJNM0t1b2RFN2g2?=
 =?utf-8?B?U0lsOVJ6WWlqNmR2dEh0VGhONTVWb1lPcVBtVUFpendpNngyYkRGRm1xVC9x?=
 =?utf-8?B?eXoralhLdHZnWFZPY0MvOEJMS2JxMU9QQUk5MDUxUHVaMkhNek9wQkl3K3Yx?=
 =?utf-8?B?T3Nwcit2bmhZdzQ1aVdEY3V0bmxiUHJ4RTlOOGNjMTZTeFcxa3p0Tnl6dGFr?=
 =?utf-8?B?eElQZml4M3VrT2c0MWJpdDdHbHBMdDcyaHo1eVpnSXRlMFhxVE5WM3ZkVUlk?=
 =?utf-8?B?OXJ1a2RJV1RRRkNpSTBsZDZRZDNRMVBPSGhqamduazdScmpxdTNEaXNCd2Vm?=
 =?utf-8?B?dXRKSWJpY0x5ZDg5ZGhFRzh1TU12N0ZCY1lSTC9QalVBL1dKMUw2dUFpWXVQ?=
 =?utf-8?B?ODc5b2lFYVg3bnowWXV3UEtUeXV2Sy9VV0xHSjkxZkJoa2RPUEN2RFVrNTJz?=
 =?utf-8?B?VHNFRExOY0ZtTDFTTS9ZVVpkUjZ0YUZ5S2phTGs0Zmtzb3RMdGI2NW9RT2Q0?=
 =?utf-8?B?ODMrOTl1VTg5bkcxUUNpdGEyNERXdWNrcjlFZVFVb0FJREFkR3NiRVl4ODJF?=
 =?utf-8?B?OEhtaEdtTFB2MUFDeVZQYVFtVTB2STRDdEIxS2FoS1JlRHhZRmVyTVh4UzJY?=
 =?utf-8?B?TkpDMXJUTmpuamViWk92QXl5TkRxaDRQbUxDbkkxL2NHMmJzeHJkOU02a3I5?=
 =?utf-8?B?eDFYNGMwNEdWSGlDcVJMMHM1Yzh1SnpaTXAvclBNNXF0TnVldUx0cXdzbG1s?=
 =?utf-8?Q?Q50ko0GqO9k0h2OlIDNuFddm2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8f0a6c-e9d9-4964-54f1-08da793829f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:18:55.6251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n4dVvL0mhGVmkJ8A86292A2Qko2vKH2ikmaJ+RHAdUyGA6UyAI0nA7HLFO/CnUkSjllvfNETT3hQ7LBR5YnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2448
Received-SPF: pass client-ip=40.107.104.120; envelope-from=den@virtuozzo.com;
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
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 0edbb812dd..b0982d60d0 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -553,13 +553,29 @@ static void parallels_check_fragmentation(BlockDriverState *bs,
>   
>   }
>   
> +static void parallels_collect_statistics(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    uint32_t i;
> +
> +    res->bfi.total_clusters = s->bat_size;
> +    res->bfi.compressed_clusters = 0; /* compression is not supported */
> +
> +    for (i = 0; i < s->bat_size; i++) {
> +        if (bat2sect(s, i) != 0) {
> +            res->bfi.allocated_clusters++;
> +        }
> +    }
> +}
> +
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
>                                              BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
>       int ret;
> -    uint32_t i;
>   
>       qemu_co_mutex_lock(&s->lock);
>   
> @@ -577,12 +593,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>       parallels_check_fragmentation(bs, res, fix);
>   
> -    res->bfi.total_clusters = s->bat_size;
> -    res->bfi.compressed_clusters = 0; /* compression is not supported */
> -
> -    for (i = 0; i < s->bat_size; i++) {
> -        res->bfi.allocated_clusters++;
> -    }
> +    parallels_collect_statistics(bs, res, fix);
>   
>       ret = 0;
>   out:
for me fragmentation dances are pure statistics thing, this should be
done in once function/patch

