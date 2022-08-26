Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EA5A2830
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:04:31 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZ0g-0001XW-Im
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYxX-0006ok-Hb; Fri, 26 Aug 2022 09:01:17 -0400
Received: from mail-eopbgr00096.outbound.protection.outlook.com
 ([40.107.0.96]:18879 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYxV-0000dp-Iu; Fri, 26 Aug 2022 09:01:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOl9/Fh+mqvNZyIqWy4Jp3kipN12bXLRNyETRxmCD6vdhbFYO/OIpRlFS8MTctP1ASbajT/2eSB1AjEiLVZVSXJtxyAVpV1efxu+jeuKbzBTR1LvuWoPJ6UfWT7z5bsOB89cV6ZSadWjDfERK9i7lZAfbc6gIkqBCOTVRwMg6Ts6mK4FWYZeknglFrhTNxqWRgheRebR0mNf99m4Wy5Oa1ABJcv/k+ZKngF1d5tY8FkNIVxR67pIu0RT285DASkN6ZWjgLTv1vZOCh4cNg3jtz1Id9IhYTi8S+FOtENMK8d31V0epD++nbOCg/Nego4y+sTSPoZPpnIGbYD35V/Ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV/dWoOfiCFPdXgJny7pXU7ayi9zx2UdrLxmn1G9uoo=;
 b=CNHxAfiikYDFLuBFzVzmZdEUCvkde0eAgQ6/rnbIwoaYqpcG3wQE1H5cueUr2grz+1jXJW4vdu283BBJkNRJLsHKEsFbKox+QfdghFDBW8Gj2+9ttbenZfGNaM5CWUi+Onv3rF3/l/2M7xR+n/1veCbBgEh/ZwG8geuobAt+ZbrcfLB4ZqQzuycpzPrSujZv9JR85xhugGIVhAuDm3kQqUO3hY7ADWcsP2CbvDtoNeDNKzRhiuM1qvnSCZRBlFdbhSvyLK/WQmaR8i9ODpUYuAP4EnUfrynR5YE1duvCeRJF6ZXEdee8ryAu7H9XL4GMH9plJnpjR+RRgDWRozlT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV/dWoOfiCFPdXgJny7pXU7ayi9zx2UdrLxmn1G9uoo=;
 b=w+gxdlXUqJkMQoMLhPw8MwrKL+xjyL2luk2/IK1FMkO5Np9LL7MAhaPMOqSNCWtnJ3aGPXvqqulELqThkGM+fCihkq6k3Qs5oEGdGE0xXAvQFslFqnPxSHvWboXW7vakTguZyijaabAEFrF8iyWpCaRtH5Vr9XoYGJC6Xdj3XsEQak8FBsYoCSmZOntUC9E2l7bmfidqR7GxG0H7+EJeEFgq75QLUP2U+7ImwGYK4LvXgIETnj+1Zc/vNYqBu62cQwkzYw17uPiQRHQa8khqQwVu+/nAWqoq81VxsL6ftCsXvQgDY6iJzBDw0FtHTmJhWuUj+ptCIXoxuQ16kYjPeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0801MB1840.eurprd08.prod.outlook.com (2603:10a6:800:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 13:01:04 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 13:01:04 +0000
Message-ID: <23f11c2f-e47d-4f85-f7d4-073a56fb2471@virtuozzo.com>
Date: Fri, 26 Aug 2022 15:01:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 03/10] parallels: Fix data_end after out-of-image check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-4-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220825143109.176582-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::29) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8689e074-2371-46de-d203-08da87630889
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1840:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pm2iBHsqc90cOwUvwd5WJNfo5cIsSiFiUdPcFuK1p5DGKRUjgVEzqjRtMDW4G/2gNZozDMI6S7mDUpzyWfmSaeni2OlSnFqa2OVbhoKmmTme+9v4IuSdWFvMwPr17H1E04pR81Dd20X9icdCQeG+ipAlbZBcHT/piGamPUN1Zg1Ngts34fEQe0bW91OCOHTwwiZizV2LGEfA7E7mTjejKHUjxsqzOsgaXkKVXYUsmDp/J+mBoUIcUU7MHh2SYVPY8iyjd9l+TnvL83NFcH0F/y95AqueUQ8y4OC5wmAP/rROOU2BpdtsLPVdQxvXsYx6zT0x5XGeq5AJX8Rjo0tzOGBC050cxLuwsgz9hPGOU2euRgxgyl1mZIg6AzoGjPO+yiT2j82/gbcGRf3dg4T4g53KikEh8E8NzuKjenLMqh6EQOiokVGlI1X9klQbINAT+/2FIQ4VTa/KKw/jsIi7SBb8u7NpovLtG3JXDMDui78ctzUE0YRk+wwaudCGik9rupY0SCI7PXWY0B/lPbShAdxXIONfOsvkoaYdAT7iMzkmKy6xMF3XfzedowhaAheUTnsfB09hF37wolGWshHr8+XTflx1Hgxb4Q4FO4+9z53RVORTe2+9R1EiX+FxuYPylEDoFXrWs7drk1kbS7eG9OTdtl1bbfa085APC8vrEIcHCg4xES+DQANCKcs4rx+mzSPAAzO4YJADE5iBoprS8QWj2/rw64c/sBqVi7k/X6m8NWZgF0ViMbOZOb74OBQFy4V3sZdbWAJwoI3ENcg5/h2UNwxjWM/9FEfTf/9oOFdLV0o8BiSt7E6aPF0mhZ/hopJSHOjxaiBQMJR0f95KsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39840400004)(83380400001)(38350700002)(8676002)(66476007)(66556008)(38100700002)(6486002)(31686004)(66946007)(36756003)(478600001)(316002)(31696002)(4744005)(186003)(5660300002)(41300700001)(8936002)(2616005)(53546011)(86362001)(2906002)(52116002)(4326008)(6506007)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9MYm9vTjQ1YkQxT2xxZ01uL3NDaG04TGp2VE90RTlVeUdnbFh3MTdlaVNa?=
 =?utf-8?B?cjhxaXNUYmhGc29aSTBTamo2WWJCTUZQM2tqYm9sdERqcXE4bGd3U2VzeU9W?=
 =?utf-8?B?bzRiaEFRWTh5aEVVK2kwZWNuSnpPVUNZNXBJSE5XMXBuUGcrblREUWxZc0Zq?=
 =?utf-8?B?cFA5VTBmYU1PbW15TmxYNlNLQ2pLWTZ1cnloM1R5a09XNkdvcXI0Y2lXNUtr?=
 =?utf-8?B?dktQV0VkNEtkaHJjczNwL1BTRWFIWFdvSTJWU0UvREVnWXFpaXlTdkYvOUlJ?=
 =?utf-8?B?Sm5Kd0Z5TG55TEhHRHE0UnNZUGNIbDRHekZ0QmxNeXF5RlBwWVY5OENHUExU?=
 =?utf-8?B?ZmlCWERDODMrNk1KZE4vRGdGSUlXUjdlR0lCclhCSGlPN3laUmhkbWJ4SkJM?=
 =?utf-8?B?SWMxVW02RmxFZjFqNm1tQW96WGs3bTNhY1dsWTBBQm41YnkxOWx4M0I2L083?=
 =?utf-8?B?aGR0WjhMVEhoSU5UZmJnbTVYNUduM0xvUkZRNGEvOWx0YytKeXVqTFIxQ1Jh?=
 =?utf-8?B?MDFpalVQNXRQK1pFcTY3Q2ttRm9pNjNubi92Ynhid3RZUFd3Ny9NYWNsZU1v?=
 =?utf-8?B?R1hMZ21qMjIvTzNkMTh2bDhMcFM0ajlkVHM0S0pxTjhKODU3ayttTEYzOFgv?=
 =?utf-8?B?TWxiYUYvdkd6WjZESVdkdnBuTVdNdTJIQktieGQ1YkNoenV3WUs5OGVjdUhr?=
 =?utf-8?B?QTJ4SCtTUVRnUU5GQmNNMEhMblplc1ltN3NyZjhKb1NxWi9ZODUyTlUrOEpI?=
 =?utf-8?B?L2UvMHRScTdOT0poaGVKcG96K3AySks1MFFRa2gzU3Vha3FJV0J5WDlaSVZQ?=
 =?utf-8?B?elFucFZ1dVdlWDdUUUFVTXd1TkVhditXWUk2OEwybDd5YkduUk5qaEk5clJC?=
 =?utf-8?B?M0YvUjdJeGtCdnBYcDRnVFNpQ0Fiak5kQnJ5WWpEaFk5ajRIaU13bmRNWjdQ?=
 =?utf-8?B?ZDdaeXBNaXI5SVpwVEJqdmViSkRNQWdMWFB5WHowcGZ6cHVBVkZ1K3dIWHRr?=
 =?utf-8?B?R2dMdFYyRHRSUzM2UExTVmhPWFh4bk51T3dPWmR1VFZhUWlxbjRSN3A1V05w?=
 =?utf-8?B?SGdhUFFRVkRPMTR4Sy9CY0wvSWhsNGJ5c3Z0NzNOZGpGVWZIbHhiUFp4VVV5?=
 =?utf-8?B?MHc4dmIvOW9HcWZHK1dUZno5T2c5SHhYdGxLQ3ZETVBuUnI1Mllsd3VEZVUr?=
 =?utf-8?B?YU1EYVloZ0UwbFNUQzJEUEJPTkVjMUIybXphZENIS1djb3lkcG9GaDVOblp1?=
 =?utf-8?B?WS91WlJHMmhzQ1FaM2MvSEUybFpjREZmRkNaRUczbU1pQWVSWTFTUFVhalVu?=
 =?utf-8?B?Yk9YUTF5b2pkUkMxcVJxbElSRnEyd3Jia1JhZTUzVzU1Y3FtdzJmY3Rpcnhv?=
 =?utf-8?B?QUlmd1d0TWR4UnJmOHBKeEhYbjR6MGw1d2xzVit0WFM4cTNiTEJ6RVRycER1?=
 =?utf-8?B?VTljdjdhVk5VRDc4aXFpdGtsRGVIb3lQQTM1d0RYdmRFbW9Tc3RRZlg4b01O?=
 =?utf-8?B?aE0va282bnFUazZqNkhNd0NqN1BhaEVyRmN1dTRKYUhVVGFJdU5tTmFMc2V0?=
 =?utf-8?B?U21EOS9GQW80T1VKUWkyWVV0TTloMzZPRUpHWFR4Z2NSMHNvSmxQRi8xMVRj?=
 =?utf-8?B?Z0ZkTHpCT29tZHpDRyttekIyeFJ1cnFSR1FxdlFac2hEaERVUm1oN2dtYjRZ?=
 =?utf-8?B?dkd2T3pvNkRNRWlaZk5aNFhydHcyazNkem9KZE9NdGp2NmJSaDZvR25wYXpY?=
 =?utf-8?B?UjlDMTZjZzFTZjBud0lsRHh2SURlK2dRYzZVdklaeDlkUVQrbzVaVnpiUExC?=
 =?utf-8?B?ekJTN2d3V1VycSt3Ly9xNTViYWs5Yzh5eWVYMEJJTHFFY0JmT0hGcU9jRm1z?=
 =?utf-8?B?QzhibklPRmVRZW1qdm1XUTFCM2FYSXNHMm4xQVRFRHN1RFlkdTZjSlRYOFJC?=
 =?utf-8?B?cHVOcm53UVg5cnhLaXdxekNHaXNFV1ZubTBNWm15ZGZONGd3Syt1SkpMaFZW?=
 =?utf-8?B?N0dMcDBITDROc01hZmRjVE1wRndpVVJnT3dUTURyclNiUGdzcmVoYU9iZmxj?=
 =?utf-8?B?Tlo5ajBVUFRsSEZpdU1DM3dnQzNSaG5CcEpRRGhyblJoOXN6NTM4WkdxbWZm?=
 =?utf-8?Q?5Om7IRiwU9IvBcpYOv2AwSlXk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8689e074-2371-46de-d203-08da87630889
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 13:01:04.3139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5THUfWqxEJHYVNygacNPgrK4f8IPv7yKqidOG0oGWtRyE1vU2qhze2Ro+D45THN+A6Zk9QAbumKdh2Wt2hPMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1840
Received-SPF: pass client-ip=40.107.0.96; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
> Set data_end to the end of the last cluster inside the image.
> In such a way we can be shure that corrupted offsets in the BAT
s/shure/sure/
> can't affect on the image size.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 7e8cdbbc3a..c1ff8bb5f0 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -514,6 +514,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           }
>       }
>   
> +    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
> +
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;
Reviewed-by: Denis V. Lunev <den@openvz.org>

