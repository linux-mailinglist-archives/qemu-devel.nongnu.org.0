Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B47577E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:19:43 +0200 (CEST)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMuk-00085Y-Bs
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDMqg-0003Vm-VL; Mon, 18 Jul 2022 05:15:31 -0400
Received: from mail-eopbgr10123.outbound.protection.outlook.com
 ([40.107.1.123]:62798 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oDMqe-00063k-36; Mon, 18 Jul 2022 05:15:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8YdVFui41S4pl6RSEPsSvfH4lntPefRHABBesqoVadgakCydRRmZSXT8iOKoLGclqK8idsSvVnSuY4jcaXqS8Pb76YBmtgSSw2H5l0PnbugFLUIMqhR7KuGdSmA9UKmNPVLUE6RV/yi431V8KE8eD5z5sUT7zpi5vXQHEN43qYzYhMoF13gphH2jIdCkxeiP/DNpiNIcmsZK6MM5yGQYh4s8Eb+LJxX/ID61xJNdgayD8v5omSpGo8MBCKUBrxDZ1hNMaslwvZjCI7acmlPU3w1dzlFipTaBhuKKZsSDw5FL48TFQzK/LaO1FesVg2/OU0d+wfCqThEzxazR3fQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hKu3s95fjUv9iPHcs7IYArFsF91DVaKKm4H//nspZU=;
 b=WYk4DE1HURpmU18Jc6ryt8r8WhW7hu8aEr8SWRs94862aNN0+n4hpLgErPyP41NvTyaau0u6st/McIcLSr8DdWxrBlAGf2gWM8UvWQlcEujRWAwB8aUHa9x4GXokILC6r3uE1yP4nwFBRBovbrHwSI9U+lUhuW4hUekvNkkjfqVmtXfguze9skbmdr02BV8DAHlCgrN84ktHmrZ/bMie6v7ijdzNsH4A83oYeVsvBUv3GPoMhA/peZIpcqEPWWvQJk2y1JleAvW6Qf3WlwB6pAtg9ArrUxpBdRYSS8c0mvtnbC22UlUQKpQSVys7xAfhQ5RNqwtQ+/a3ax7P3LzDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hKu3s95fjUv9iPHcs7IYArFsF91DVaKKm4H//nspZU=;
 b=BlSaXW1TpScGzZ6h4sgPJPupKJc9oaFG3P9Rhgx5gxhww8QpyQYdRYZcpvkug0OncEFSFGsL9IYOBS2e6WsUqP0QwSk9jWlBe+BE3FF3wgb3+YBsHOJvta0lio7WafTSZc1roVWQnUZPH11Jt7CwPxrAS2SV1kqErg1ka34Ml5v/MQyS4+AkdCAmVNYnC3bauiq+1Hj+LYbPzNBOqhW21gFEXq+ZZP+/xW1Iglt1jKYoDgcCmJ+C5qZTsB9SbbdWMZqDYAlZc4qzd4dqfR5JQcuDhCr57HX1yG56Z8ea7P69ukf4CieaUHTOPtFbo0bP59et+Nt4Lrn0XUZl22xBAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB7PR08MB3562.eurprd08.prod.outlook.com (2603:10a6:10:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 09:15:20 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:15:20 +0000
Message-ID: <6fb80309-4c52-f1ea-79e9-43d11745b007@virtuozzo.com>
Date: Mon, 18 Jul 2022 11:15:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] block/parallels: Fix buffer-based write call
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
 <20220714132801.72464-2-hreitz@redhat.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220714132801.72464-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a752b8c8-e675-4b6a-2cd5-08da689e0963
X-MS-TrafficTypeDiagnostic: DB7PR08MB3562:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVDEIAM0ORziWCXj8H2TOdF+Qc0rbDO9uULDZi9dcys47uP0XXU4WzJB+F8mmrrrjd3/jf0/Ocpelt6uisLbmbQMW0DUGopsLF5bbCCYOZS/HSPplfZ0l7f6E+PvB6aKqD96C9pNvrm0NbEwBcUn5mvN794XLDe7pHGj/sipSrV07o1IoaB//LP9LfAd7BNGouILRKrVUu7PM4YF6Loa/T354eQEvQQ/P159//oh+s3nuvA/OyCnB2d/iYNuP4f/J4FSv51MjrHW8T04n/koDR4gBGoe0XzcBXybBeZOlFOXy0Dge3BmyXBQ68VoBCZnDGoQ+UxhS3R/Cuvkk09o4GuTGZAX27QpjkVER9owRae/UB9HB+H1ofCUU98epypU0LLr6uEzHoyjFe9HCP89EVWyjhywBlT/AO53d22MpM04epXe2PMG/s2cnYt+lqAh607g5vWpCWPl1ydltFYGmt1VSIdHcQCFlA7VzBBzTncqvUoaqOe06H30tAOXhh4pYfR/m+ThLplqL0yKweiX4/wvQdFqcpf0GNrMaOmL9JIgk4q61+jyL+/bN2MilVIdwql9UMO19JAl57TBDUpyMJLR1Vk6rWUor2X13CZ+x67JqPBjQySqH1c/WmHtZ1mSSNThauVij6Z+Ba9DuiI9Xn5RhYx9BM1nq1Lb4xMQ4Tib4wsJTVYbim48LN8hrkQHNPcPtdA2Ow/exgtvts2mOA9gMp5CbhdqjJnUi1x80WbnFwlX54bFWRR3kZS89f6eo7lKIzkVGlxde+ngtk8I7vuV6ky9jqQxQ0XYzhAVen24NNZ8A29hFwkX2xp+/q1jMtDg1OJcLhefWlqV0kqh3jc2IGdfwcFN2eFDVvVsRaisqmd6bnQh1K6O9EIotSjp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39840400004)(346002)(396003)(136003)(366004)(376002)(86362001)(2616005)(6512007)(5660300002)(6486002)(52116002)(6506007)(478600001)(6666004)(41300700001)(31696002)(8936002)(53546011)(2906002)(4326008)(26005)(83380400001)(186003)(66556008)(36756003)(31686004)(54906003)(66476007)(316002)(66946007)(8676002)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjcyQkVaV2NncEtwK3Z3VTVIZENyazZJQVJlTXZRNjF4Q3djZDN5TEdWb29h?=
 =?utf-8?B?dDcvY2ZhN0FDSUYvVE5COHJRRTl2Mm1pemdlUVg2bEtsai9LTFdaT0w2dW1o?=
 =?utf-8?B?WVdwOUpISFpleFgrSVQxdFZKVURwRFRPVWVDUGZzekhYTWtqbjYrWkFXQVdO?=
 =?utf-8?B?STJ2eStSLytZU2taTWltalJJV2orWXluYll5RGlGTGhhckZNSkg3ZlF1YmlT?=
 =?utf-8?B?dE01RG5OenR4NHNuSWJtNDJyOVF5MGs3Ukc4OGh6OHBTVGhNQlZkMFczODdl?=
 =?utf-8?B?eDJsQm9ldkkzTmJ2UlozTjR5bGNrd1R2UTJ3aEZGYnlRYW5vSXJ6V2g0endC?=
 =?utf-8?B?L2hjRHZLY05Mc1REcXdBQVRrb3FSTXZGTzBIZG9GUFdkQ1d6UjhKMXl5ZlBE?=
 =?utf-8?B?TC8wWDBTMW8xbmUxVEpLZVlqd3lHN3VIOC9ySmxmME1yM3FYZUtEZVQwNXlh?=
 =?utf-8?B?M3lBTDBDM2hYS0JxdVhvV0Z1THVjZDFBaThaK2krc05rQ3YrdG82clhZTFJD?=
 =?utf-8?B?Q0NmbmFWQWZMUW9OUFYvd3A3ZmozWG9zelUxYTJkcklxRHNvODh3ekkvcWhk?=
 =?utf-8?B?ZDA5ZGd6c1l1UUFVMDFqRUFmc3FMZzhFTWV2SWd4L000Q2I1eEFEUzlsTkl6?=
 =?utf-8?B?N2NxODF6NG1iNlordzFSVkFNcW5pWXU4VE9TSmkxUlZzS2FJNTl3dDJIKzFm?=
 =?utf-8?B?NWJTM3Q4YzdKa3IxMnlHazErcVZtbTMycEwyRUhCNWVQUjVscEpEQmYzcHMz?=
 =?utf-8?B?N2U2ZnQvTGtMUCtYTEVyKzVjUzBZblp1Rm01RGc4YmNxSUkyR0p5TVJjUVBZ?=
 =?utf-8?B?NHZvNldNeUFHNjdTWnNoVmRjVEI1UStBSzhLS3BHMDUwekQxUDZvNEVKYUl3?=
 =?utf-8?B?Nnh5akhZdmxjdDNPK2QvenhzY1B1S3ZSOHJCWDRmSmFiaFh2SDFtTEJ6MjhS?=
 =?utf-8?B?ZFZtRVFRejg5UTVZSjZ6T0ZuTVQwLzFoV0swSDczbHp2aFJVTHRoVVdxMFR6?=
 =?utf-8?B?aDdJaVhya3picERYMG1HQzN4Tzd3dkRpMDAwNHltZk5EYnVBWGZlaFFrRUJL?=
 =?utf-8?B?dVRhRXZud1VDd2tNKytpUVZGT21XaDg4YytYQ0dUcU9QTGgxd0NQblRSbGFr?=
 =?utf-8?B?SWhNTnZ3TXNIVmgwWTNFWG9Kdm9mQmVnSmZ2M3N1K2hXMkdrZHlqSWlpY05W?=
 =?utf-8?B?TFltelJCbXV0YmZPLy9BcFpDQlNSZzVPWTEveVhlOW5vTnI0bzhZTlZGdDFy?=
 =?utf-8?B?QmZ3N2ZpR3lpQTdNaXRhZWI3UzczckNEZVZFVHNBWjV2d3FDbXpzZFdOLzBY?=
 =?utf-8?B?c2VyYWNzNGdnTkMxUDR6QlROZCtvd2N0RlYzS3RyTE5GM3BMN0QzU3kxcytu?=
 =?utf-8?B?KzVzemphTWZ3aExEcFh0dmpUZ3BiMzd0K20wMktGYTRJZ0h0UE93cXlVNS9z?=
 =?utf-8?B?cEhTQW1KcmFTaTdDOW9udyswcWZkR1RiUU8yTmpZcFlYM0NzcDFpZURWUGVS?=
 =?utf-8?B?MitWcERnNVJ2MGQ4UktBTTUyYVlDYXJIb3VJUWgwNlJjR3VYMjhsMnZOeG53?=
 =?utf-8?B?Ykw5aC9pWjIxRXBZcDc3THE1WW00TmEzbks4TXhRYitJM1hpaEgxcE10SjEw?=
 =?utf-8?B?NVZUSS9Ca2RwU2RySHpYZ0xvcjZHZi9kZ1BsZkx5V3NLYVZWbWVaa3Raa2l6?=
 =?utf-8?B?aTlJeWtHcXdnRTBvYUxVeG42djlnYlpWSVRPTUF5SGJIeWRmUVRnQm4vNUFq?=
 =?utf-8?B?UVdqbk1XRjM4Z0xmT29QSGZ2WElMSlJVOVJpUmphQmFmY2RUWTdxQURrNm1H?=
 =?utf-8?B?WklNY1F3KzQ4OGV1UnlnZnMyMWJ4dktMalVyY2Q5OVdOenlxZUZYQ1pDWWJ2?=
 =?utf-8?B?RnV0aTVXSnpjWXlreXhtR2lEWE9TVVpCNG01cDl2N1RMOHI3NThWeFpBeVlU?=
 =?utf-8?B?YVpydUUvK0R4dGY3MmpMc0MvdFdlOFpmdUgzcnBPenRRUjROSDAwWHg0ZSsx?=
 =?utf-8?B?RGVSTWVSazhNdzhqSUY3Q25vK05odTAxNEhRSkRuNkFlTEJaTTNURnJ5cTJj?=
 =?utf-8?B?U0h2SS9BM1QrY2tPUk90dmxaV3QwYlVhSVBQWTlwaFhhYS9qQlFhLzdJWFl5?=
 =?utf-8?Q?HmbYFT92tpEcs8le4szEZ9JB3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a752b8c8-e675-4b6a-2cd5-08da689e0963
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:15:19.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxGgSihU0ArNWzcoZhsR3LFZJFFzzLlJ8U1JJvzaKxXV4ZP7lbs4PRAWm8mdh3b72pVF+WC5e/O7j9yBUbivSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3562
Received-SPF: pass client-ip=40.107.1.123; envelope-from=den@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

On 14.07.2022 15:28, Hanna Reitz wrote:
> Commit a4072543ccdddbd241d5962d9237b8b41fd006bf has changed the I/O here
> from working on a local one-element I/O vector to just using the buffer
> directly (using the bdrv_co_pread()/bdrv_co_pwrite() helper functions
> introduced shortly before).
>
> However, it only changed the bdrv_co_preadv() call to bdrv_co_pread() -
> the subsequent bdrv_co_pwritev() call stayed this way, and so still
> expects a QEMUIOVector pointer instead of a plain buffer.  We must
> change that to be a bdrv_co_pwrite() call.
>
> Fixes: a4072543ccdddbd241d5962d ("block/parallels: use buffer-based io")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   block/parallels.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 8b235b9505..a229c06f25 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -241,8 +241,8 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>               return ret;
>           }
>   
> -        ret = bdrv_co_pwritev(bs->file, s->data_end * BDRV_SECTOR_SIZE,
> -                              nb_cow_bytes, buf, 0);
> +        ret = bdrv_co_pwrite(bs->file, s->data_end * BDRV_SECTOR_SIZE,
> +                             nb_cow_bytes, buf, 0);
>           qemu_vfree(buf);
>           if (ret < 0) {
>               return ret;
Reviewed-by: Denis V. Lunev <den@openvz.org>

