Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20722325F5E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:46:59 +0100 (CET)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYm2-0000ns-3P
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lFYhy-0007Sl-7x; Fri, 26 Feb 2021 03:42:46 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:46961 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lFYhu-00086m-3L; Fri, 26 Feb 2021 03:42:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvy4W7TOMZiuhn4jD98xx3LMugxQmToX9boHhuoXYrAi/kszbpByvxrOCAA7EnUvfgjBwjwqD378ZU7eOSgV4mZBnBfOW0r1zpwBToD7dx5/dMElvzNpNNEpjJJ1KVdxCA0u+z5t8hafMYI6yezYGEQ74rPDQFJKHD9YS/YQuB7D0esRqYMrpsxhcFUIBXxrNQcME1p9TMjtRYirjpT8AjifFi3yASlsZN5pcjK2uxv/JzWTsRTcB3Tq9ajn0ludrZVPvNfFAMtPrJtaYWvDmR+cAML5XbYkD8leyzsSHnZXAvsTcGmu7u0m+PmnkX6nxacfd1mhRN1Kldy8N2TEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MusfE6BnoZa0kkvTwidckbHjSvvKFv6wb6OeLe93/M=;
 b=ZJgeylUbDFrudrUVA48cvIQobwIpz/sybGRzPJYEEZLlyNBCF1U/R3kb1yLr8xk9+K4c/PeiL74Y2M4afolKhBJdmkl7feKs7lqYq1FbZwvwHQTshKISuWYgjHZCwB6MHEou+JnpsJQx246BjpmUwcWzlIg+ECmnyOdvcjYBmDPuNrjrUpEv3QFNQ99dzj+5IBg/2k7pf/GlH35BLpq3f7IaS7YTg5HhYfHqtjL+KG9JugQg2WgEtKyPdFGD0CXi6EQgWK57YRdVZmBo4cAANS/HTBkCIsfH6Xa251tKeovRI5es0sx9bPg3OFd2W4LyMWjEGFOYhgn1uEc+Pm/gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MusfE6BnoZa0kkvTwidckbHjSvvKFv6wb6OeLe93/M=;
 b=JDK9Ot3Nnngp3uQdBAAxic9hkz5PwQ5179oSLtNJbfeE7t8MuFyysVM09Qh8p+QvvSzACZCLRwElywM1l8BXdQ97ZzzD4wTuPzRV+ZQOtuO7PHevuZg01f5+QiT3n+4kQfoXlPyhf3sAyKO1sLYZJ4iBXzHlNrwqEHceEKC0QhY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Fri, 26 Feb
 2021 08:42:38 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Fri, 26 Feb 2021
 08:42:38 +0000
Subject: Re: [PATCH v2 4/6] parallels: support bitmap extension for read-only
 mode
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-5-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <e097fe12-b1ea-b986-a610-b46acda2fc40@openvz.org>
Date: Fri, 26 Feb 2021 11:42:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224104707.88430-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: HE1PR0102CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::42) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 HE1PR0102CA0065.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Fri, 26 Feb 2021 08:42:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13091244-f8cd-499e-73a1-08d8da327891
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216C3F8736272C639243040B69D9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhBYRtBSO90aWr/HCVDFatmBlvME3KIuV3so4/TfOspyQUr9BXspFkU9lrJ3pmn6P1Ry1tdfIG5t8AZihx658N8FGXpQWX8aldF1nJsBwAOrAHoszZLiKWh2dhpKNCU8TuhJapj/bBiKRFYELUVJMI/ULQ+T/vj9Vlkcdk0vb/yUpQdPRNM8Rc7nNdns9KQ//L5HRinAfNzSaSlPlZR4/faRT5IuCkuegYP0vUzmBZoFsAS71mvG4I69vmOwPzhncwUJeeJlIQlPMir2y+5opzaCBDWKr7tD/5p5elAzWzJuK+sXWbXtNtVxMgaeV8Fn94F9nNDcR38C2Izh/+D8EZHD92Ayw0ThSU2wdwFe6Ab/7OaLsnOgeOLacm6Cg/fYuJIdK/HJo/6FdoFB0HD88FhFHG5z0ZoVUlYSs/dSn/k1kg2VE/8QAngPou2RkZcxAc1AHv5U6cX9rltGHv/Vk7CiXcYM4W0L5MmZKoj+72HPTJvUioyLDBJqrZ6rUc/l2UCU35yeKmmBPPTE6Tdx8VwT4CEFq+2ih6lNR65YMbVlrhD3s+YXMlkzdZuGrb+cEDc3vDPU0gNPaV3u+96hzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(396003)(376002)(136003)(36756003)(6666004)(52116002)(16576012)(30864003)(5660300002)(31686004)(186003)(53546011)(478600001)(6486002)(66476007)(26005)(16526019)(83380400001)(4326008)(956004)(8936002)(2906002)(31696002)(42882007)(66556008)(66946007)(8676002)(83170400001)(2616005)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFBXT2tsTHRDYmo0c2lKTTBLRHZBODhOdm9JUWQ4NHZ6OTNWVmZ5RlhZSTh6?=
 =?utf-8?B?QTVWM1lYcEpzRlhHMjJncUdiVis3aUxSUEVYc0IwU3lVbTkrS29lK3lDZldj?=
 =?utf-8?B?eDRkTjZURVd1MGdaZGFkeTcyUmlmM3hVS0o3Z3puNXZoT1h3Y1dDWVZveE5C?=
 =?utf-8?B?V2ZtbndpeXRobVpsSmFJQTdhbHNRVTErRHpTdmxkQnBrYWFqbjdWaVkveGs1?=
 =?utf-8?B?QUFYVHFvVGhxaWxNbGxrRW9xNHVkM2VnRUlkYjdDMFdyL082aUp0WXF6RkVu?=
 =?utf-8?B?OHgrUTJKUFE1QmVIZlExdjZOQTU2bGlqOStKNG1odS9KQzlzUjdOaFZ4Rzd0?=
 =?utf-8?B?bURhRnltZHlrdTVlVXFhVmphL0dFUkhRYnRXanlZVVRxUlc2K21BSVVabmt1?=
 =?utf-8?B?MVE4Mlg5K3V3TlNmUUk0QXg1eEFZRjNHcVhoRFhzZ3lONnZjTTM0dTJuM0tD?=
 =?utf-8?B?T3AyT1BhL0hSNlIxRXNCeHZjVW9uT3ZMTUdwV1g0Q3dTUE8rcTRXUWZiQkh5?=
 =?utf-8?B?bEFhbnRUM3hwRnROdFZPMUdQUmJUQjJJUFRLeVBaR0Z2VnpTMU5rUU03cWtN?=
 =?utf-8?B?aEJFekk1WVEwVEVJdUd2MEVVUlRnbjVKN05zejJQNDJrS0gzc2VLdUtLcCtS?=
 =?utf-8?B?ODZNVUNKb203eklvbnd1ZGF1b3oyNnhxZUxOT3phK0dSek9acWlaMElDY2p2?=
 =?utf-8?B?ZFl6RUFlSDJBbWRpblRUMG8yUnpwdE5jR2JwRitJL2lXdFRNQ291SWhGVzhG?=
 =?utf-8?B?a2pKbnZNN3lmUXFQb3ZhQTRndEFseGxaNjNTNWRNd2NacHE5aXBEc2ViNmU4?=
 =?utf-8?B?N2p3K3FIa0duY1lubHl0N3JTTXljY2dISnYzb2U3cDQ1aHRhaWZ4Vk1kZnZq?=
 =?utf-8?B?NW9xOUZzSU5TUHFDV0dmMUhQdlM2T2JWditPUU03OU1sTFNiWWJKY0pjbFJl?=
 =?utf-8?B?cGkwODRybFFGbFFYb3FvZVlHTDhHQmNYRWFDR1QyMWhsd3lieURmaUk5UTZZ?=
 =?utf-8?B?WEp2V2NURk05UG5GdjZuRWVPZWwyOEtGbTRlejBPN3hPYjExeFc2blB2YkVt?=
 =?utf-8?B?VWFpMjlzcU5TTHFFWTNWamlwa2tyZ2NkN1FZR1A4T0tiL2ZsTlFnVnNzNkN4?=
 =?utf-8?B?NHhMZGlZL1h5ejFFdXorMmMwRFZ5MHk4RDV0cUp2Qmh0anl3akQzRkNYVU1h?=
 =?utf-8?B?Z2VtMUl1WkVBYmhLSVJ3MlU3R3FOSVBtQk9mbVJxTDRWRVZnRUpTTTlFdGVn?=
 =?utf-8?B?S2piM2oyb0NBVE91bGRwVG5PS1k5dGhObG9HVWVNVy9PS3BLblhMaDhoS29q?=
 =?utf-8?B?dVp4ZEo4L2FDZVdnOGczL2hCRWtxU0xxZ1piSjRPL2U1MkNiZHpHTmJQMjFx?=
 =?utf-8?B?eEhMQlo4ZnorNVFlVjJKQS93MGlBLzlDd0xWMC9HZjJlWkFISmJZZTRyWm1B?=
 =?utf-8?B?OGdDZlpyTWVLUXdFakVOUTJTOEg4UExFNUkrMTdnYlBFRVFxeEY0VmtLWGJ0?=
 =?utf-8?B?ZVkwcjM2dFlvOWIyNDFaOTY5Z3V4WEUySHhFTFlKY3lZREFWT01STXlBRURU?=
 =?utf-8?B?L0hUd2FCNXpjM0ZuM3JaU1VKQ2tBQ3RFMHhyeVA4ZDdPeDlYWTdSR1hXRXFF?=
 =?utf-8?B?SThObGQ2YkdwTEYxekVSazFzUnlrcFlWcHFhd1NvVFFjQzBrOVA2R3BBaE1n?=
 =?utf-8?B?Q3lMSmNYQkNXMUxnekl5NGlHQngyYVEzOHZObisrRUFZbDZuK0lVTk1DWEtY?=
 =?utf-8?Q?Vp2EalrZhf14KbpG4kd7zEmcyXIIDrn+TkPcQru?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 13091244-f8cd-499e-73a1-08d8da327891
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 08:42:38.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tcKVPst5+OOlcieM9ZeEQ6goXwcvPwPgEfGP3ArD7eheD4bQaBGK28ZxqdKXraOjfbvogfJjGljcgGshLTItg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.4.135; envelope-from=den@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/parallels.h     |   6 +-
>  block/parallels-ext.c | 300 ++++++++++++++++++++++++++++++++++++++++++
>  block/parallels.c     |  18 +++
>  block/meson.build     |   3 +-
>  4 files changed, 325 insertions(+), 2 deletions(-)
>  create mode 100644 block/parallels-ext.c
>
> diff --git a/block/parallels.h b/block/parallels.h
> index 9a9209e320..f22f43f988 100644
> --- a/block/parallels.h
> +++ b/block/parallels.h
> @@ -48,7 +48,8 @@ typedef struct ParallelsHeader {
>      uint64_t nb_sectors;
>      uint32_t inuse;
>      uint32_t data_off;
> -    char padding[12];
> +    uint32_t flags;
> +    uint64_t ext_off;
>  } QEMU_PACKED ParallelsHeader;
>  
>  typedef enum ParallelsPreallocMode {
> @@ -85,4 +86,7 @@ typedef struct BDRVParallelsState {
>      Error *migration_blocker;
>  } BDRVParallelsState;
>  
> +int parallels_read_format_extension(BlockDriverState *bs,
> +                                    int64_t ext_off, Error **errp);
> +
>  #endif
> diff --git a/block/parallels-ext.c b/block/parallels-ext.c
> new file mode 100644
> index 0000000000..e0dd0975c6
> --- /dev/null
> +++ b/block/parallels-ext.c
> @@ -0,0 +1,300 @@
> +/*
> + * Support of Parallels Format Extension. It's a part of Parallels format
> + * driver.
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "block/block_int.h"
> +#include "parallels.h"
> +#include "crypto/hash.h"
> +#include "qemu/uuid.h"
> +
> +#define PARALLELS_FORMAT_EXTENSION_MAGIC 0xAB234CEF23DCEA87ULL
> +
> +#define PARALLELS_END_OF_FEATURES_MAGIC 0x0ULL
> +#define PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC 0x20385FAE252CB34AULL
> +
> +typedef struct ParallelsFormatExtensionHeader {
> +    uint64_t magic; /* PARALLELS_FORMAT_EXTENSION_MAGIC */
> +    uint8_t check_sum[16];
> +} QEMU_PACKED ParallelsFormatExtensionHeader;
> +
> +typedef struct ParallelsFeatureHeader {
> +    uint64_t magic;
> +    uint64_t flags;
> +    uint32_t data_size;
> +    uint32_t _unused;
> +} QEMU_PACKED ParallelsFeatureHeader;
> +
> +typedef struct ParallelsDirtyBitmapFeature {
> +    uint64_t size;
> +    uint8_t id[16];
> +    uint32_t granularity;
> +    uint32_t l1_size;
> +    /* L1 table follows */
> +} QEMU_PACKED ParallelsDirtyBitmapFeature;
> +
> +/* Given L1 table read bitmap data from the image and populate @bitmap */
> +static int parallels_load_bitmap_data(BlockDriverState *bs,
> +                                      const uint64_t *l1_table,
> +                                      uint32_t l1_size,
> +                                      BdrvDirtyBitmap *bitmap,
> +                                      Error **errp)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret = 0;
> +    uint64_t offset, limit;
> +    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
> +    uint8_t *buf = NULL;
> +    uint64_t i, tab_size =
> +        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
> +                     s->cluster_size);
> +
> +    if (tab_size != l1_size) {
> +        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
> +                   "to bitmap size and cluster size. Expected %" PRIu64,
> +                   l1_size, tab_size);
> +        return -EINVAL;
> +    }
> +
> +    buf = qemu_blockalign(bs, s->cluster_size);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
> +    for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
> +        uint64_t count = MIN(bm_size - offset, limit);
> +        uint64_t entry = l1_table[i];
> +
> +        if (entry == 0) {
> +            /* No need to deserialize zeros because @bitmap is cleared. */
> +            continue;
> +        }
> +
> +        if (entry == 1) {
> +            bdrv_dirty_bitmap_deserialize_ones(bitmap, offset, count, false);
> +        } else {
> +            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS, buf,
> +                             s->cluster_size);
> +            if (ret < 0) {
> +                error_setg_errno(errp, -ret,
> +                                 "Failed to read bitmap data cluster");
> +                goto finish;
> +            }
> +            bdrv_dirty_bitmap_deserialize_part(bitmap, buf, offset, count,
> +                                               false);
> +        }
> +    }
> +    ret = 0;
> +
> +    bdrv_dirty_bitmap_deserialize_finish(bitmap);
> +
> +finish:
> +    qemu_vfree(buf);
> +
> +    return ret;
> +}
> +
> +/*
> + * @data buffer (of @data_size size) is the Dirty bitmaps feature which
> + * consists of ParallelsDirtyBitmapFeature followed by L1 table.
> + */
> +static BdrvDirtyBitmap *parallels_load_bitmap(BlockDriverState *bs,
> +                                              uint8_t *data,
> +                                              size_t data_size,
> +                                              Error **errp)
> +{
> +    int ret;
> +    ParallelsDirtyBitmapFeature bf;
> +    g_autofree uint64_t *l1_table = NULL;
> +    BdrvDirtyBitmap *bitmap;
> +    QemuUUID uuid;
> +    char uuidstr[UUID_FMT_LEN + 1];
> +    int i;
> +
> +    if (data_size < sizeof(bf)) {
> +        error_setg(errp, "Too small Bitmap Feature area in Parallels Format "
> +                   "Extension: %zu bytes, expected at least %zu bytes",
> +                   data_size, sizeof(bf));
> +        return NULL;
> +    }
> +    memcpy(&bf, data, sizeof(bf));
> +    bf.size = le64_to_cpu(bf.size);
> +    bf.granularity = le32_to_cpu(bf.granularity) << BDRV_SECTOR_BITS;
> +    bf.l1_size = le32_to_cpu(bf.l1_size);
> +    data += sizeof(bf);
> +    data_size -= sizeof(bf);
> +
> +    if (bf.size != bs->total_sectors) {
> +        error_setg(errp, "Bitmap size (in sectors) %" PRId64 " differs from "
> +                   "disk size in sectors %" PRId64, bf.size, bs->total_sectors);
> +        return NULL;
> +    }
> +
> +    if (bf.l1_size * sizeof(uint64_t) > data_size) {
> +        error_setg(errp, "Bitmaps feature corrupted: l1 table exceeds "
> +                   "extension data_size");
> +        return NULL;
> +    }
> +
> +    memcpy(&uuid, bf.id, sizeof(uuid));
> +    qemu_uuid_unparse(&uuid, uuidstr);
> +    bitmap = bdrv_create_dirty_bitmap(bs, bf.granularity, uuidstr, errp);
> +    if (!bitmap) {
> +        return NULL;
> +    }
> +
> +    l1_table = g_new(uint64_t, bf.l1_size);
> +    for (i = 0; i < bf.l1_size; i++, data += sizeof(uint64_t)) {
> +        l1_table[i] = ldq_le_p(data);
> +    }
> +
> +    ret = parallels_load_bitmap_data(bs, l1_table, bf.l1_size, bitmap, errp);
> +    if (ret < 0) {
> +        bdrv_release_dirty_bitmap(bitmap);
> +        return NULL;
> +    }
> +
> +    /* We support format extension only for RO parallels images. */
> +    assert(!(bs->open_flags & BDRV_O_RDWR));
> +    bdrv_dirty_bitmap_set_readonly(bitmap, true);
> +
> +    return bitmap;
> +}
> +
> +static int parallels_parse_format_extension(BlockDriverState *bs,
> +                                            uint8_t *ext_cluster, Error **errp)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
> +    int remaining = s->cluster_size;
> +    uint8_t *pos = ext_cluster;
> +    ParallelsFormatExtensionHeader eh;
> +    g_autofree uint8_t *hash = NULL;
> +    size_t hash_len = 0;
> +    GSList *bitmaps = NULL, *el;
> +
> +    memcpy(&eh, pos, sizeof(eh));
> +    eh.magic = le64_to_cpu(eh.magic);
> +    pos += sizeof(eh);
> +    remaining -= sizeof(eh);
> +
> +    if (eh.magic != PARALLELS_FORMAT_EXTENSION_MAGIC) {
> +        error_setg(errp, "Wrong parallels Format Extension magic: 0x%" PRIx64
> +                   ", expected: 0x%llx", eh.magic,
> +                   PARALLELS_FORMAT_EXTENSION_MAGIC);
> +        goto fail;
> +    }
> +
> +    ret = qcrypto_hash_bytes(QCRYPTO_HASH_ALG_MD5, (char *)pos, remaining,
> +                             &hash, &hash_len, errp);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    if (hash_len != sizeof(eh.check_sum) ||
> +        memcmp(hash, eh.check_sum, sizeof(eh.check_sum)) != 0) {
> +        error_setg(errp, "Wrong checksum in Format Extension header. Format "
> +                   "extension is corrupted.");
> +        goto fail;
> +    }
> +
> +    while (true) {
> +        ParallelsFeatureHeader fh;
> +        BdrvDirtyBitmap *bitmap;
> +
> +        if (remaining < sizeof(fh)) {
> +            error_setg(errp, "Can not read feature header, as remaining bytes "
> +                       "(%d) in Format Extension is less than Feature header "
> +                       "size (%zu)", remaining, sizeof(fh));
> +            goto fail;
> +        }
> +
> +        memcpy(&fh, pos, sizeof(fh));
> +        pos += sizeof(fh);
> +        remaining -= sizeof(fh);
> +
> +        fh.magic = le64_to_cpu(fh.magic);
> +        fh.flags = le64_to_cpu(fh.flags);
> +        fh.data_size = le32_to_cpu(fh.data_size);
> +
> +        if (fh.flags) {
> +            error_setg(errp, "Flags for extension feature are unsupported");
> +            goto fail;
> +        }
> +
> +        if (fh.data_size > remaining) {
> +            error_setg(errp, "Feature data_size exceedes Format Extension "
> +                       "cluster");
> +            goto fail;
> +        }
> +
> +        switch (fh.magic) {
> +        case PARALLELS_END_OF_FEATURES_MAGIC:
> +            return 0;
> +
> +        case PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC:
> +            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
> +            if (!bitmap) {
> +                goto fail;
> +            }
> +            bitmaps = g_slist_append(bitmaps, bitmap);
> +            break;
> +
> +        default:
> +            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
> +            goto fail;
> +        }
> +
> +        pos = ext_cluster + QEMU_ALIGN_UP(pos + fh.data_size - ext_cluster, 8);
> +    }
> +
> +fail:
> +    for (el = bitmaps; el; el = el->next) {
> +        bdrv_release_dirty_bitmap(el->data);
> +    }
> +    g_slist_free(bitmaps);
> +
> +    return -EINVAL;
> +}
> +
> +int parallels_read_format_extension(BlockDriverState *bs,
> +                                    int64_t ext_off, Error **errp)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
> +    uint8_t *ext_cluster = qemu_blockalign(bs, s->cluster_size);
> +
> +    assert(ext_off > 0);
> +
> +    ret = bdrv_pread(bs->file, ext_off, ext_cluster, s->cluster_size);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Failed to read Format Extension cluster");
> +        goto out;
> +    }
> +
> +    ret = parallels_parse_format_extension(bs, ext_cluster, errp);
> +
> +out:
> +    qemu_vfree(ext_cluster);
> +
> +    return ret;
> +}
> diff --git a/block/parallels.c b/block/parallels.c
> index 9594d84978..6ebad2a2bb 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "block/block_int.h"
>  #include "block/qdict.h"
> @@ -843,6 +844,23 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail_options;
>      }
>  
> +    if (ph.ext_off) {
> +        if (flags & BDRV_O_RDWR) {
> +            /*
> +             * It's unsafe to open image RW if there is an extension (as we
> +             * don't support it). But parallels driver in QEMU historically
> +             * ignores the extension, so print warning and don't care.
> +             */
> +            warn_report("Format Extension ignored in RW mode");
> +        } else {
> +            ret = parallels_read_format_extension(
> +                    bs, le64_to_cpu(ph.ext_off) << BDRV_SECTOR_BITS, errp);
> +            if (ret < 0) {
> +                goto fail;
> +            }
> +        }
> +    }
> +
>      if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_INACTIVE)) {
>          s->header->inuse = cpu_to_le32(HEADER_INUSE_MAGIC);
>          ret = parallels_update_header(bs);
> diff --git a/block/meson.build b/block/meson.build
> index eeaefe5809..d21990ec95 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -57,7 +57,8 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
>    'qed-table.c',
>    'qed.c',
>  ))
> -block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
> +block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
> +             if_true: files('parallels.c', 'parallels-ext.c'))
>  block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
>  block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
>  block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
Reviewed-by: Denis V. Lunev <den@openvz.org>

