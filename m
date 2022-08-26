Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735AF5A281F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:56:56 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYtL-0002tm-3a
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYrY-0001FT-VT; Fri, 26 Aug 2022 08:55:06 -0400
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:46145 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRYrV-00083u-Qy; Fri, 26 Aug 2022 08:55:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebI4fKAw4jgqv1Vf4Fk5FWZb1VMuzY/ycoDki/HVuSTelWbm/5ZbaNjNmC+Fsh+GA7w/FkJh9sqED8JqrzJDXfOvsNqlFoN6lz6u7kqX97lAgPFZQa7QVFR7O3foMV6U2PX9qK881vHgIXYrwuh8foQqPjwniyEY7blw8FUK6qOnW7/jsNUeMChKFKZ3DfMrbisbSoPCjqjo/v6nI5ltNURSLJorojOFTf6+n6prSLVKgH2gYI9OiC0Bl3xhubElAmSALUwRrSntWh649a5mga6mB4XVHGmVvHufAFSauMU/p1K5ZklvZr/RPzbccym5nFwyAX8DVGs30DC1ZbqbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyNGJbgQyW1Q5yjzGBRvV1NEh4+Gv9n8RAiPGA32TI0=;
 b=oMAxYwSoT+HW8smcAWMNn7BgSjYg1ENH4KTQZ8HnsIy0uu0791yre2dLNAWgpHBkM8TY+N8mQa17jBclI5YncYUS1d9ovRTypXCZGRr2/Hq7q0xZ8N8Er+UmDOPt0q5dtMCBkhWeocHL+60w0nUObn4zLblxckjKR83prKyMfFjnqwvtwcduqYVcPzmsdsLnh6uDPh7CB8adxmHjYvTsKpbdEYPcfvGZOC9ulsC7xvmedFzy0YXYQkmz4SNOCTAfLeHJO+hbrX/dhvJyjLhqtrTyQqd2ZfpvM5Q0h3nswtv8lUzadN4nkD8wrJz+C/09GsDG0xWosU79FKx+r/hOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyNGJbgQyW1Q5yjzGBRvV1NEh4+Gv9n8RAiPGA32TI0=;
 b=pMQxKSXn/iTHZWSlJd3ROZ5JRV80iDDVDiNOtzXvTNLNtbbQ4gRe58ukNunyvJGSLiEhucDcznFcgheyZvglxErhy7VHKp9Vwb5P6F402R99sk9vDBqRNmVAkLAjcy5oavDwVtb9z5WFMEEJJ5Gu/CxxpXdW8LLGP/wwd7vU100H9cB0aLiDeDZJMxk/SRp27Wub1eqowFPQyLbQf7AEPRkf55XzMN7ddvX3QBCAkbMNfQmKMBCNlnuG7ADz/Cd9dsAt6I3C1kh5QW45Ws0WDBC0EhPEKuA6K53z/C7278XbTrLdkFixtJmEt7t1/Cv749IL0HKpRKyKiSfRAIG8EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VE1PR08MB5149.eurprd08.prod.outlook.com (2603:10a6:803:107::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 12:54:56 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 12:54:56 +0000
Message-ID: <c3c1141e-262b-0cd6-ddca-7382afd0164f@virtuozzo.com>
Date: Fri, 26 Aug 2022 14:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 01/10] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220825143109.176582-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P193CA0010.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::20) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a02c5b68-9904-427d-cd1f-08da87622d2c
X-MS-TrafficTypeDiagnostic: VE1PR08MB5149:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnvObu0/BUzKO6bhmS79luxQz0y4kUAQi1vNOnty+vhKmsFbB+y9npuJFyNq1kW5z1xnCu2r+Bwu5poMZtFG2Ou7bkKZQDa2wT9CIPOM/4Lkhx1qXiFAyD6Ld+uEdD/URxCDNEmwTyKWmuXthTPMezm6zxYehcnvOqQfro9YnO2hT2zqwH7bim8MUo7FdHG3xMBJrQJl0lYFspCKwieD49QaVhTOan5vtjCQqpLDJoA8hL98fxSZZMI/BFvLK0mkb0Ciua3hHh/c2ib26mM5YYkAh+LY3pv43hD8G83cYNRkUkoibVfKcMpg9pzjcW79WTDYkVxwXNwf0TY8iElzcy52V+Od1ElDia3tWeJO/1n5Iphum0mCjM531erugl94m3fzWxw6nBTI+L5zns31bjR+OT9Og7TywopO4tNEC+04mGGOaKP2IEvaXQiisDCOUtGLrsizSjDNVo8UYJ4Gxe1rScvpnL3h/hVt9ODrpNyhB5sr5SyhVernM5md43WKO8k28HbH5E750vCFyJncwKY4icz3+0vc9YZLsh8AoCRrA7AEhYlYHyM/mvBzLUNb3wCxdMyGBdzM2ZlkPEW78kv9doyRcHoQOsyJZNuTMDf4Pqy2qQ/SxBEvY9aIBSqQqLtsYg6czWkvidXAO7dyefEJoSGbgZv6+SYQrJSF1t8Q/NNY+GKpTxU5JyXXUeexPk+CwMw8CotGEfK2lqsbj7RI0Uo2s+rOZ9eSRqc8tfKXwXshhdIwFALU/P25O0+b/t0tEqPkbCkvGiQ6MpxAt1r2eQRIGVU6OSJTFz2KROZY5D69hoie4qW4sKxjedRU3DHPnG3eE5555XnugH6BbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(66556008)(66946007)(66476007)(6512007)(26005)(478600001)(6486002)(8936002)(4326008)(41300700001)(5660300002)(86362001)(52116002)(2616005)(53546011)(8676002)(83380400001)(2906002)(316002)(36756003)(38100700002)(186003)(31686004)(6506007)(38350700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5yVkZoMFU0SlNjV3ZpWTNHMUtaYlIxdjkrSnpjK0dNaUFPQ0wraXNpMXBj?=
 =?utf-8?B?YXpNeUQrZjdUM1JYZkRhbU5VeTN3Ym5XaUNkNml2R1pqS3FDOGZWVVN2V0dK?=
 =?utf-8?B?ZExXb2k3Y1NOeDdiSHlGZFl4c3VNUFZ1Z0gyWFFzSFhhZnlJc01FSkx5UWdM?=
 =?utf-8?B?OFBKT2szM2lHdWwxT242Z2ZrK3lCNnJOUkRrTVV0bnRxS1d4MEpKNzJMSW9p?=
 =?utf-8?B?VDVPMnVrc1pTeS9RYlM1Z1YyZm45eDlPc2FKSFEyWlgvVWNSR3hGcUlKUTNM?=
 =?utf-8?B?TWVsZ1A2UzJGV1JYcWFCM2VOTDduUER4Y21KVnRGV3hwRlFrZlR4djZXdkpI?=
 =?utf-8?B?aGVOZ3U2V3JUdmpRczE5MWtVOG5CMmF6N2VtYnFkaWpjVzZtNVVPajRRQ3Zw?=
 =?utf-8?B?TCtUUUlXMkgvL0ErbWszOEIxMHRoUElpdG9xTUpFZWl4cmhiVCtma2VFUnNu?=
 =?utf-8?B?M1Y4TXlraisrKzhOWUNqOWtaam9uNTkrLzFPVDBKbDlDMXhrT1J5ZDM4QVJV?=
 =?utf-8?B?ZkFudjdMbDFDZy9NRlRzeDZpZWFPcU8rVVc4cGNRM2dXSUw5Q256aDJEZDlo?=
 =?utf-8?B?YkR5WXRoVTVHNFRFcmUrSFFYMC91SWk0NVh2d2xJSW45STQvSzUvZlZiOGNk?=
 =?utf-8?B?M1FYSEFUWlAvSHVBVEl6UzdnWW5ZMVVjUEZ0STdCSmp5SFk2SmVLYys5aEY3?=
 =?utf-8?B?a1lXNUVFd1RUS0V4Wlk0ellBVFdKTWpFWlhJeWQ1WW1oWXNLT2NxZU1iMmN5?=
 =?utf-8?B?bm9ISEpFSW9rNEJ5QWRtbnNFU0cyTVhldXk0dHhxWkpkM1dWaWZKUitWUTBR?=
 =?utf-8?B?MUlPV0hIdkEraDkxSFpQZHpBbFB4NnlOYmpQd3plVnVsYTFVNE4rV3NpMzZv?=
 =?utf-8?B?bFdhSWhIWGc5OVBLNHBYUzEzVDdMcUh5dVVLWkhydTA3Sk01SU9oenhzbFdU?=
 =?utf-8?B?d0dMRDVxMG4xT3kxbGNCVG42VDdVWXBrSjJwQ0UyQUhLZ1A4OXMzUEdMakx2?=
 =?utf-8?B?b0xRUkdwZHlSTjZsaVBsQXdCMGhMa3Q2aFRtN1puQ1c3N01Xem53blBobkRm?=
 =?utf-8?B?Z1pyMkdiaG1VeTV6S2JndzBwSExENmRGSkErVmVHWEFyU3FmRFhsMWdZMWh5?=
 =?utf-8?B?Sjd3YWZ1MVA2NTgybkxTaE9DYnlkZG1ydjh2QzIrL1VhWXlOM3RKVkFmNCtL?=
 =?utf-8?B?RjJNM1A5UVYvcldNZURYbmxOZXZUQnpWTi9HTmhQdDdXTTVWQzQzWWNqTHV6?=
 =?utf-8?B?cXNOYmZRMWNYMHI2Ry9KNjh1Mk5lVzFRMnI0d3JuZEZHWUlTcm1jRGtJMnp5?=
 =?utf-8?B?MTl4ajhIdzhSKzlSTVNxS1pmcHQ3UkxEWXFmNUEwRHZKTE1nTE92ZHBVWEVR?=
 =?utf-8?B?cSt2bGFnaHVYV0U4VnptRE1TczFrZUNnTVUvd1IxS2ZRQWFZSHdUUWZUZWFF?=
 =?utf-8?B?U3hzNUw3ejRpRGFyR3hxS010ZlB0WUkzYi82MDRUZ05YbVRoOGdXWlE2bU9S?=
 =?utf-8?B?Z3RydzhQTnEzcHhUSzlNVmw2ZTFnSnZ6YUVudDZnTnNnZUJBRUdUV1QwYTVp?=
 =?utf-8?B?ekVIUGlqaEFla3RVNGlCODBBMDNXU29KL2VpSFNscW5FQmlUMlZGeWxTS29K?=
 =?utf-8?B?NFJyVHpqdWdrL2h3dUZUV0hTOGhLbHJMQVV3Umo0WDFES1VBUVVxb01WMTFB?=
 =?utf-8?B?RnBTNCtZcnhoZEJ4U1lPcjdxQ2NhU3pVYjlha3Y2ZGdTS2VjcWpYejZBbFYx?=
 =?utf-8?B?ZnVldjErREE2ZnlBRlJrazJVV3d3QXZuaUJZWjFCNmVrUXNCUnF0WUhYQ0RF?=
 =?utf-8?B?cmFqdnBtTVdiZS9xVDI0dkc5U05NVUFkQTBMVW9aeWhNRFNEWUs0dVNoZ3JP?=
 =?utf-8?B?cGZqYTMycXR2cFZPak5TZnhWaWtDQTVvR1g0NzhVbUk5TG44VlJMZlhGenB6?=
 =?utf-8?B?N1k5S2RUL3BPd255bzJjdVNGUDU0d1FxU1R1RGFITjdFbkxHQmJOR0FvNDZT?=
 =?utf-8?B?aURkUW0yOHo3YytoRElYREIxRG5FWGN4S0JDQkRoUHZESjNYRDF1aEF4NFBM?=
 =?utf-8?B?dnZScmdIRUFwQzNyaC82Sm1MZHVUL2RLaU41ZDBwWFFLR1Yxd2I0MTZnamky?=
 =?utf-8?Q?hL0lEJjOnx6IKr1Pna4PIJeV8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02c5b68-9904-427d-cd1f-08da87622d2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:54:56.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQrVaKOpxZYmTcSSVXVIfoirwy0YsJaSqGr91mtlRny/gJDFrsz9WCqFDUamwBjtcu9/HL0vQtGZAGtQhMbYTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5149
Received-SPF: pass client-ip=40.107.21.136; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
> data_end field in BDRVParallelsState is set to the biggest offset present
> in BAT. If this offset is outside of the image, any further write will create
> the cluster at this offset and/or the image will be truncated to this
> offset on close. This is definitely not correct.
> Raise an error in parallels_open() if data_end points outside the image and
> it is not a check (let the check to repaire the image).
> Set data_end to the end of the cluster with the last correct offset.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..93bc2750ef 100644
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
> @@ -742,6 +743,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           return -EINVAL;
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        return -EINVAL;
> +    }
> +    file_size >>= BDRV_SECTOR_BITS;
> +
>       ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
>       if (ret < 0) {
>           goto fail;
> @@ -806,6 +813,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   
>       for (i = 0; i < s->bat_size; i++) {
>           int64_t off = bat2sect(s, i);
> +        if (off >= file_size) {
> +            if (flags & BDRV_O_CHECK) {
> +                continue;
> +            }
> +            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> +                       "is larger than file size (%" PRIi64 ")",
> +                       off, i, file_size);
> +            ret = -EINVAL;
> +            goto fail;
> +        }
>           if (off >= s->data_end) {
>               s->data_end = off + s->tracks;
>           }
with string length fixes in the commit message (more that 74 chars)

Reviewed-by: Denis V. Lunev <den@openvz.org>

