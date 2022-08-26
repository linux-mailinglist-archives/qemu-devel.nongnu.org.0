Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180565A2847
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:12:17 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZ8B-00052N-OU
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZ52-0003BL-O1; Fri, 26 Aug 2022 09:09:00 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:37888 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZ4z-0001sm-IT; Fri, 26 Aug 2022 09:08:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWFXYr5zxh7gEhGqFNkOzYEuoC0B9LEbS/vx1xrr5wJyiS0oIdwf0bWneMEdXjP54PhO/t2GNKyKVBKj43+nFPCpIfE3yyUWTPdIwvmBHoPMORKxouie2CiA9c6kFJdesFdFzFaV7Luk7a+8D+cRsHPrjsp9lKUu/BrTo5kxQesTTfgnzeWEaMgW4IW1zL3Qt95iZqAYfLL9UF7BM2JPfb6YfotyCBfDm+fe0pztTumGq0DFfklW3+AB2hj5bb2qP44cJEzpCOL4BYFs+EPzobXwroiR2YjzVAQClJ0X48CVi++eB0JiMwQM5hbr4XcAM3PBG4BeaTetC740Xeac6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL6L5HxVwQZacUtkSBHgBFxyQRor+ullhqXpcbq4spY=;
 b=Vi+F2xt7pruUkMgTpN24UDVgw2gNX3BW/ZRM+t1B1PKm4uLOX5u+fjbFnbP62RxGgRunE2pZ+UeMzNaLtWjc6JprfDf2n63kqzi1+3aJCvDHcjmayqaHkIOBke0IGBVbJkyJEG0Uh0zW5938Aru9GZQHTS1UyotnqI+jq1BjYAo/zrJsLv7tpYmGrS982oI60ahE2loro5NIQJHXd2e51We/EkFdaMlnOVDK6QZ1YF6hK0dzH4+qyYCoZ9hjHaxpltHqa1/61Z3yfftlNDyUBRuCvj1bCURunsyt3J7TXyWFK9d3ZClHaVtvdYkpCrVSuK8pVZdUqCr59TqHeCcrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL6L5HxVwQZacUtkSBHgBFxyQRor+ullhqXpcbq4spY=;
 b=I9Gnz2YTt5YeX9dJ5eIGF4F08zO9XBznen4ONOJO4EDTOrJJx72lMLOrSPjF/ejomb1JiG/RGLYTBAR9VLTLfCc1u44SShzMWnjoDLLFagv4R4cBG9KK7Yy8a0JeTzNqkrAEW4rG57/tOly79HRNe+L7OMDgwRPb/rZoyUBYWCxbRqqyfauLNfj/ANFPVG3Q8QdGETBU5dPrHL18Ro69e4EzMVzshaOaC3DjmoZLQXYLJJrrSxgx3teWvpdiEDg4R+/wPkgclRQl75ZPd15IuIU5PEjwQNFxpvdP5baOODLRdx65UZS19jyPUumCuWv3G30/P1fm6y+ONcIxXnmsJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB9120.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 13:08:51 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 13:08:51 +0000
Message-ID: <894e03ab-4cbd-da6b-7f95-df1912d3f47e@virtuozzo.com>
Date: Fri, 26 Aug 2022 15:08:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 07/10] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-8-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220825143109.176582-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0180.eurprd09.prod.outlook.com
 (2603:10a6:800:120::34) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166206e6-be21-409e-46c0-08da87641ef9
X-MS-TrafficTypeDiagnostic: AS8PR08MB9120:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QGyxI45+PfQbpwN44VWoO77aJw1bygdffapOFWSVB64KZxWrt4FjB+l2+5ltSpUYnhPbnSZonMQsL0+2NXkQPU40SPIVSFu9vj5AWuxuITFe9DeZQPdbOCuqcAcvhi45ZdOnK5PDcCCx+dB+53D60FI78EG0IgZhXg8QjEqERNxFbViCM11CbDGkHc9BXyemmhmUxPJbGL7K8FqG7KicfRGppeKWwM/USqz2jUb/DhMFDEqMQGDQIgiXm/dMw4avsrcMamDnhsjI+SeHitz8d960qt/9TfOadlsYcU7HzDZ6u67ADzYhp1aqyemn1zMikoOXdiXzl7sJtAZnURDzWYEtG7uMPqqrdaMmf6KiBTsSpcCkhd+b2kBJ3QGxiLLpEmh1ozFCrrcDFOAHG7xO9tcJ4heQvgtPI+BHg4fnnnvDgPqK2VeNbW28+g45oaj/HsZFYzqsUxxskErOI0PFTOZNYXHs1kjQy69PgOiU6sSPPVg6h1V/9M4YBU0ykb3JnG/rc9nv0AXn+ISdXYD/+2Pu66vlNRK6YnPpVgcvvdpjRm7pzmU79aB1E51Kwvq7uIlxITydyTWtfgwNEZp5CT7u5ip0jCYdMQQxaGkA2Wn0kqizXR+NgapKUg1OubXcO2n0Yeop2vtGD5aFQZvzCQW9Bc96219Q2EEqOmFTikeyDYHpyAm0oyLb5TPhqUN8B/3MKyTjVF5Xh1eJEyzKkNMN94T8iUeMa9cdSJBJEZUmAuvtjI0OnhR93eduvKJ1BFG3kIMQ/S6AXakR3mYQINdqc4ndhXkq7bsLZ24bdXSSgoEO6Jvt/mSnr3J6FO4MP3gtPxp4dqOIZ+qearBzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(86362001)(316002)(31696002)(83380400001)(4326008)(66946007)(8676002)(8936002)(41300700001)(2616005)(5660300002)(6486002)(478600001)(186003)(66556008)(6506007)(36756003)(52116002)(31686004)(26005)(66476007)(38350700002)(38100700002)(53546011)(6512007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDNUOStvWG1nQkdvUnlyb2x5U2c2UGZMY0F5c2s5MlpLbmRRV2RJejZCK3RY?=
 =?utf-8?B?aHJDdE40QWNyejBNbmZtdVdqMjhnOE1uSG1kV0h6cm11SGo2SEljN3hXKzdE?=
 =?utf-8?B?ZGhwdCtjcktiemU1aXkxb2tsejBWeElqWDNvWUpnbXVFN3FCZU04YnUzZk1G?=
 =?utf-8?B?OWRLbjhBMzFjY3NUaXNxSTNyWGZYbzlmL2lzMlVLdEZTcjkvVm9ldmpEdVdp?=
 =?utf-8?B?Tnl6dnFuQlBuR1c0Wld6L0ZZNGdrUTNBcFRNekkwTDgrUnp4Z1VmdDQ1Q2lv?=
 =?utf-8?B?SVAycGtPTFBRSG81a2E2Z2lyT20zOU5ZbDI0MGViSGRIeUFkQnBPcHZCSStB?=
 =?utf-8?B?bTIrQVU4WTRpV2ppZkZQek4zTkp5bTF6M3NEY1Y4M0ZYTjhUQjNIcHBPa01z?=
 =?utf-8?B?NnY0eXhUbkt0ZVhmV2pidjJWbXJPL05lY1h0UW1VOXJPMEp0WG1BTEt5REx0?=
 =?utf-8?B?ODRtUnRVS3dVZkNMdDZlLytpdlNyeTJQdE9EZkVjcm9neWhydldXVjFrQXVX?=
 =?utf-8?B?Ni9FU0FMTm5SVHcrbFhDblJhaDQzQVVBS1R6K1ZrNUN5TEFSR2VJaElialpV?=
 =?utf-8?B?RCthNDllcFRobGpxMU44ZW8rVTFoejYveHIwMjUwanpQdTFJTGRqc2ozYkM3?=
 =?utf-8?B?YkUydmVVM0pya3M1Q01VTkZWMUh4MDBZSWFXaXNockM1VHBBNG5uQStxdnpV?=
 =?utf-8?B?UjdrMmZuMVIxWGFVL3ZqRjRLN0tzRFNMSWlnYWRTdGg1NVNUUTQyVi9MSjVC?=
 =?utf-8?B?Njg1Vi9uV09sT3Nsekx6N1JKdWIxVzVGcDZTejFhUTNnWlowNURpc1IvTzZE?=
 =?utf-8?B?ZHNxK0JIWXNBb0Zqb25qUVhLbmQ3QmVLbElvUlk5MVZkdGlIaFd4aFJma0lC?=
 =?utf-8?B?T1RZZXk5WE9mWHp4dmxKMjNtczhqTG1FOTRqb2hURDgrQWZTZVVEL0N2Unht?=
 =?utf-8?B?MXJrQTJMN2JxR0Z2SEx4L0E2SnZTTHZUdGFZazFoK3hDOWIwQWVoUlJjdmN3?=
 =?utf-8?B?OER0Z1hwcDQwS2Jxc1p6RDNKMGl2cDdCL2VYaHR3SHFtSmNJQVZTRHladzd6?=
 =?utf-8?B?c3dHK3RiVGVXSzViemNaSWU0RzhabDcrZXMwMTVQYVFLVEVMVGVHeHFUMnl5?=
 =?utf-8?B?TkoxaCtONXgxd3ZZV2pSMW93eDBDRmdOWXlPblllZE1JYjNPSDZhQnpDWER3?=
 =?utf-8?B?emNKT044bVlmbVJUeXFWMHlyMkNNOWczUVRVQnpLazlnQm5ORlB6MmE1MjlD?=
 =?utf-8?B?ZFhOdkJmMjhSdGowbFZ0dUdwYnMwMm9iMisyamFDNE00VGFyWkRlOS83MHV2?=
 =?utf-8?B?OTlMRWpvcTJYbHNoejd5R204ZlZIRkt1S0h4TFQ4U0lSWHUyZ2FxZTZ2cE5J?=
 =?utf-8?B?QzlzSzZuRDJYbVFqUzZMeWdXVm91SWcxSG9WaUpmT3RTbDFSaXhMV3BWNzNW?=
 =?utf-8?B?K3BMOVlRYmVETStCSnVqbUR0VXR1aTlZTEQ2YmJsVENnUVYydmxXdWtrRVN6?=
 =?utf-8?B?UGVHMThKbm5JTmhQU2pPQ1FTYUhTejBpSk10Q2gzaTVkamI1RU9ucHgxZEdO?=
 =?utf-8?B?dUp3dkM4SnFYYXYycE9YQW5rSUM2QlFuNDkzYktGc1Zld3EwVkxrVWtOd1BP?=
 =?utf-8?B?OEdacnBvUkgzc2RiTDYrRm9tQ3JTNXRXaDdhQzl6Q0thc05peSs4eGp2T0RY?=
 =?utf-8?B?YlNtZHhLSGp3RVFCUlhCc1RkTlFTcmVmVlZCd1ZDUkVPSjM3VXNEK0tYWDBP?=
 =?utf-8?B?c0cydEMrTVVNZW5lRWcwNktPQk5LWW9NN1lMNUs1c05DRGJSRTAvRnhDQkor?=
 =?utf-8?B?YjVOMUg5Q0Y2eGU0Y0h0UTNBbjl1SWJ4UWdCb3QyeW9QUWduQk5pSzJORjY2?=
 =?utf-8?B?RHd2SUtPb3A2YWJYY2JZbFdoQnE5U2duVjcwMDJJdzM5MTJoYklDMFVPSkgr?=
 =?utf-8?B?MUNnRjZMR3N1VFRHKzhwMzF1cmM2b084YWVBRDQzcUdPZUdsdzlDRzJ0V1FT?=
 =?utf-8?B?aW9lY1ZlSzhMbmVXdFM2bU5hZG9xN1dnRGZneXIxY0w1dUc5TWxRcGxlVWcz?=
 =?utf-8?B?Sm1rZHhlRm5PSmdmVXpkbEtqZzkzZG9tVVo1QWd1bEwyL216Mjk2Z21aakNw?=
 =?utf-8?Q?N+XoNvNAwCNyV2F/lOgvVFZa/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166206e6-be21-409e-46c0-08da87641ef9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 13:08:51.4041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1zi5o5rW5GR634QJLSF1gWwp6l0qbwcTL+FfPWXe61t/axyTxTxkWjjVLxgGYx2HgrRsowoSkDP9n1EcSDDrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9120
Received-SPF: pass client-ip=40.107.20.107; envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index eea318f809..f50cd232aa 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -438,13 +438,50 @@ static void parallels_check_unclean(BlockDriverState *bs,
>       }
>   }
>   
> +static int parallels_check_outside_image(BlockDriverState *bs,
> +                                         BdrvCheckResult *res,
> +                                         BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    uint32_t i;
> +    int64_t off, high_off, size;
> +
> +    size = bdrv_getlength(bs->file->bs);
> +    if (size < 0) {
> +        res->check_errors++;
> +        return size;
> +    }
> +
> +    high_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off > size) {

we need one more patch here. Correct check would be

if (off >= size) {
   bla-bla()
}

> +            fprintf(stderr, "%s cluster %u is outside image\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +            res->corruptions++;
> +            if (fix & BDRV_FIX_ERRORS) {
> +                parallels_set_bat_entry(s, i, 0);
> +                res->corruptions_fixed++;
> +            }
> +            continue;
> +        }
> +        if (high_off < off) {
> +            high_off = off;
> +        }
> +    }
> +
> +    s->data_end = (high_off + s->cluster_size) >> BDRV_SECTOR_BITS;
> +
> +    return 0;
> +}
> +
>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>                                              BdrvCheckResult *res,
>                                              BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
>       int64_t size, prev_off, high_off;
> -    int ret = 0;
> +    int ret;
>       uint32_t i;
>   
>       size = bdrv_getlength(bs->file->bs);
> @@ -457,6 +494,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
> @@ -469,19 +511,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               continue;
>           }
>   
> -        /* cluster outside the image */
> -        if (off > size) {
> -            fprintf(stderr, "%s cluster %u is outside image\n",
> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> -            res->corruptions++;
> -            if (fix & BDRV_FIX_ERRORS) {
> -                parallels_set_bat_entry(s, i, 0);
> -                res->corruptions_fixed++;
> -            }
> -            prev_off = 0;
> -            continue;
> -        }
> -
>           res->bfi.allocated_clusters++;
>           if (off > high_off) {
>               high_off = off;
> @@ -519,8 +548,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           }
>       }
>   
> -    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
> -
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>   
Reviewed-by: Denis V. Lunev <den@openvz.org>

