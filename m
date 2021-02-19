Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3231F8A1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:51:01 +0100 (CET)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4JI-0001gw-RR
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lD4Fz-0006Ly-0r; Fri, 19 Feb 2021 06:47:35 -0500
Received: from mail-eopbgr130133.outbound.protection.outlook.com
 ([40.107.13.133]:53125 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lD4Fv-0003DC-J7; Fri, 19 Feb 2021 06:47:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGWHdSNdU/ZWDwmwCngYxtIahRohIZgnLacapSutOKpesd7xJRjB4OM6WqmNR7fmQeQAJpuFLeGwnpLf2cAPvhG5GZ4RlcJDf3fyIArnV+DV05D/Jg6Ifcfh5ENytz70dLkZVwJ+IcHYwxHG3ZP6HNsuJWjt4zq54/APs420iNfEr0qVS5NvDKyFcFyxxpS7g/jPslHv/dOqBiDD6UIRbP8k+wyytpYJs6ZFoTG+4zVFZ436ala7vKfFvXRYFf3xGWfa5ufOq4BZGOySABv6FXMLN6OGk/cZX1l9bn7hyjds+v0tIYCk4JNWsqJvwwJ8iqv6ugFgyDzXVSDLnrzLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhdsFcvZosRbVhWskq/2cOWoq32a5GAz91PC9czTT18=;
 b=YlorLz33sRhGp1WnMw3WPwXTb+g3cOHc/Ia4yOxwUYWdpi7+D2WBP3BNf2qAA0+AX3Myg5WMzJVmD+nJFytgRfqImt5N6IwMYUnNaQ5sPJQo9zo2mpl1OBeO/yjJz3R0WEyJAGfXHvCGfC4YelGyFkDsqtOzVkOW8/PhW48c6kMcsfLXxZi+b+/jbZ3W7pbzpDGEhamfg10l+bBLVzdtmoHg3V0i+ajm9Io6L2g10mQMLORoWww/NNwVsv5ApQ0JhaF+W53Wgy0V/BWAsUkczM+anaQy5BYt79+RHNouIPvPeP+0j8d9VbWoxAy4L7+G6xPj6pjeEgeliPpLtW7OHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhdsFcvZosRbVhWskq/2cOWoq32a5GAz91PC9czTT18=;
 b=eWfyHlz+jJRTngvCkGSQqzA/0J7tTdQRWDF5KN5omLkQd14aqQEn7ENkXFFAOWAEK9DT3JPjU8SUQv5z31f4EqtK2QsGP2yJ+gPPnLTQa6fJ0zyHQEWJwjFCzgOTMuyAkiT4kVbGPhTHpNJ05tUTIVIodN6pucqwUWzR+aXmcQY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6871.eurprd08.prod.outlook.com (2603:10a6:20b:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 19 Feb
 2021 11:47:27 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3846.041; Fri, 19 Feb 2021
 11:47:27 +0000
Subject: Re: [PATCH 3/5] parallels: support bitmap extension for read-only mode
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-4-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <214a4725-2ec5-f6de-4548-a4b6deb95ea4@openvz.org>
Date: Fri, 19 Feb 2021 14:47:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210216164527.37745-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0PR02CA0180.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::17) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM0PR02CA0180.eurprd02.prod.outlook.com (2603:10a6:20b:28e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend
 Transport; Fri, 19 Feb 2021 11:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6b5272d-823c-44e6-2319-08d8d4cc21bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB687164E97D46FD9004C8A479B6849@AS8PR08MB6871.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HBTRuhK+itg0gWFg3JfrZ+Qc1qTPJkeYOo+t8WYd2XO2iLwpEYiaHUS3vyOOLtAqLKyjOFm/geicsGdMW42NJfS0U9T674vGOPn8m6fKVpnMoJy1IUt5Z+YZTEKw4SIvlz39Pyf4Y1ygarKz6H90cnMpfg91RSuXsLidq22PYgrBIiJvr67ij198HcNEKJ+D0XdLq3QGNgmR7cAbXQNJ05GMMIsok8Zq7/jAxyXyDE2QlT2FyXTp5x2Z9ynR6rOxj+jsfjJeJm/ciU0uD2j+ZfIhvxYahTNfvLWOnu0rdgiEN05mQynIiLaNEXyMrzHvLNGFYCp1mRhUY2RwGYotZnIr8OCRdal4Ac62tZY9bzmt4PW6CEVMCA6xNTG5g7RWTIg+3TGjM3tm/2jPh/D8g/XCPYaWTNguiwGcHA8PLSPgg4iJ6Hu4f1MY0lqZvnyb5JCsxp1Zuuj5wjY79g5MtUyb7RrnogJD9A94fe+vdoFxPwIu+F0mA6E9cmPK7xCgVCy29nVb6NPAzilJF9U7rsNLQ2uL70v0KkQXoU4C3WLWHHM+5ObpFFTfvov5OJNxNwaW/ctzoXb867M8LDPFQe5iLZnhAAZRzMJUPo6/pNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(186003)(26005)(16526019)(42882007)(30864003)(6486002)(2616005)(956004)(5660300002)(8676002)(31686004)(8936002)(2906002)(52116002)(83170400001)(53546011)(478600001)(316002)(16576012)(36756003)(31696002)(83380400001)(66946007)(66556008)(66476007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzUxWWZ4bjl5NkZlY3JXbXlWbTY5T2M4Mng5SEE4Q0p3V0VBS1J5NTNRaDNz?=
 =?utf-8?B?aGlSWDFTcHVVa2lhb2VOb0diWXpuenVxR0trOUYwOHZvdkRRNzVDMXQ4d3Yy?=
 =?utf-8?B?RE1BL005dE5jelhvNDlXQXdjRlFra2kyVU9HSUxpbWVlYS8xVUNqdzRkOXhP?=
 =?utf-8?B?YmFMYWNnOHBKcWJlZXhoYmx5ZEhyanZkNzhyMmxvb2kva3NHVDAxVDBuZm9O?=
 =?utf-8?B?aUpPVnEzNUxBVXNhVUJEMEl3d1NvVFNVNll3QmswNmhHZ1prRVk0T1RMbkZZ?=
 =?utf-8?B?dElxMzJFdk9MYXR3Q0FrQnBSRXpFTTNOYzg3dmwvbU5rOVJGdHNnSVp5V2NZ?=
 =?utf-8?B?Mms1YzExNlJyT3RTNVVTalExcFRBRHFadDhqdlhBT3VOOW1pckhKY0ExaDBq?=
 =?utf-8?B?L0tmYm93OHdWcGZXNHQ3MUlTNXYzaHN6N1U0aXIyTEQvb2l2T1owMytCZjJP?=
 =?utf-8?B?a0lXUjdEcE00NUJXNlhxV2pJQzE0Sjg0TmxkeFdrcDJYQ1BBRDQ2S0dYUUNS?=
 =?utf-8?B?OG1BdHU1UVBieWFRMEtwdHRqUHl6SFFJSGU0UDZ6RWNjYzNHVzUxMWVaRFpL?=
 =?utf-8?B?NkZnSUF1aFU4N3VPOFJYRXNuZHU5ZWdNT0FPamtYUDJwaVdOQXhxSTJBSXBl?=
 =?utf-8?B?YzQ0QmJmbm5MdHZINjRFMEhIVUlOU3h0Q292MmNsYzdyM1g5RVIxTnlsNEFI?=
 =?utf-8?B?NFBsMnRGN2xuKzdXOW93WGFKMVlnTmZxc2czdmx2dkZzS2ZwN09WSGs4aVlW?=
 =?utf-8?B?V3ZlUGdjaUtIYloxamoxUU1vZWVXZ0xYRVFiT1pqUUMrR1pEeDhDSU1Hb0po?=
 =?utf-8?B?d1BJcGloSUozV1MvbzNZWGJBeGhDWHFUTGFsNitXRVJEQzN0VEViMXBCMDFO?=
 =?utf-8?B?U1VWek50S1NEK2FSZHEwQ1dTaFpIZVFoV3VWYzVZd0ppbksveHh6VThpcU4v?=
 =?utf-8?B?ME90TlBrbmxqcGNEdlZCZzlxWXBxd3dRUFVKaEN5MitzUWg3M012dCtRektx?=
 =?utf-8?B?aTZVaW9sQm02RDRTOG5uZDZoUEVPN1ByVXZZQWJFTUhia2tlYithT2VocUlI?=
 =?utf-8?B?cyt1QW5CWVdVSzlNRitYMFUvbXhxTVZVMXA3RWNSNWJKM3hMQWZzZ09rVE43?=
 =?utf-8?B?eWhGZ1E4TGxTV05mNnpnTmV1ZmNPc0lmYlRzTGo3dzNtTmxhK0RiZm9JV3lG?=
 =?utf-8?B?cVJYa0hWckJTcTViTUxjVmFrRWhOZHNTalZyK1V3aUdWSDJXRkhnZmwxUXlI?=
 =?utf-8?B?UGEvSnltUjZDbGxGNGlqR1FtVUUxa1hLMnRPZ3phdEtEWEJzdG1TVnpRZ0dK?=
 =?utf-8?B?ejF6UlQ2ZWdPaFN4V3JPS3JhMUI3Ni9rU0s4djBsNWlzNWN5alRGeSt5TStW?=
 =?utf-8?B?VFBkYTdxS1RFZlF6SktZR2pIUmtwWk9pbEQxWm41MEt0RHE4aFlTNTRDQVhx?=
 =?utf-8?B?YWlFVTlVYW1WREpWSVZ6L2N6UEpmOGJqZmxDUHRRTm5tWFJGSFVyRkdYaHN2?=
 =?utf-8?B?cktJb0Z1Ty9IWlEyam9YeGlTK1J0NVFkNEpQQkpOS0NFZjkyVmE0OTdSeGdx?=
 =?utf-8?B?WkF1a3J6SVA1TTl5RmNJb3cwb1NPdXhTZ2NCMzZNaXA3WTA1R0NjRWNGeVB6?=
 =?utf-8?B?cEFUYXVDdFhsQjFHM1R6WVVZdjcxWmhlT1NUeGNHYWlFWWl1cDU5clc5VFpW?=
 =?utf-8?B?MzJmM1h4MTBCR0NpTjRtZUNVWG5qTzY1T2ZTczhkRUwwTVJIRmJXZHc1Ym9M?=
 =?utf-8?Q?GpiywbfzcKzf8ztgloHMV3pfVrvCPUjbEzQqOSU?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b5272d-823c-44e6-2319-08d8d4cc21bb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 11:47:27.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ukrAOHEP/eQGPIhksUqDIIS1WRfGC9PNSC4NPryp9X8IUiX4R4f3p34YI27409KGIZkTYlc6ABxaV9X46ekvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6871
Received-SPF: pass client-ip=40.107.13.133; envelope-from=den@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/parallels.h     |   6 +-
>  block/parallels-ext.c | 286 ++++++++++++++++++++++++++++++++++++++++++
>  block/parallels.c     |  18 +++
>  block/meson.build     |   3 +-
>  4 files changed, 311 insertions(+), 2 deletions(-)
>  create mode 100644 block/parallels-ext.c
>
> diff --git a/block/parallels.h b/block/parallels.h
> index 5aa101cfc8..2dbb7668a3 100644
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
> @@ -84,4 +85,7 @@ typedef struct BDRVParallelsState {
>      Error *migration_blocker;
>  } BDRVParallelsState;
>  
> +int parallels_read_format_extension(BlockDriverState *bs,
> +                                    int64_t ext_off, Error **errp);
> +
>  #endif
> diff --git a/block/parallels-ext.c b/block/parallels-ext.c
> new file mode 100644
> index 0000000000..b825b55124
> --- /dev/null
> +++ b/block/parallels-ext.c
> @@ -0,0 +1,286 @@
> +/*
> + * Support for Parallels Format Extansion. It's a part of parallels format
> + * driver.
s/Extansion/Extension/
s/Support for Parallels/Support of Parallels/
s/It's a part of parallels format/It's a part of Parallels format/
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
> +    int cluster_size = s->tracks << BDRV_SECTOR_BITS;

should we save cluster size to BDS or create helper for the purpose?
Such operation through the code is looking terrible. Originally it was
available in one place only and that was acceptable. Now it spreads
over and over.

> +    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
> +    uint8_t *buf = NULL;
> +    uint64_t i, tab_size =
> +        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
> +                     cluster_size);
> +
> +    if (tab_size != l1_size) {
> +        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
> +                   "to bitmap size and cluster size. Expected %" PRIu64,
> +                   l1_size, tab_size);
> +        return -EINVAL;
> +    }
> +
> +    buf = qemu_blockalign(bs, cluster_size);
> +    limit = bdrv_dirty_bitmap_serialization_coverage(cluster_size, bitmap);
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
> +                             cluster_size);
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
> +
> +    memcpy(&bf, data, sizeof(bf));
> +    bf.size = le64_to_cpu(bf.size);
> +    bf.granularity = le32_to_cpu(bf.granularity) << BDRV_SECTOR_BITS;
> +    bf.l1_size = le32_to_cpu(bf.l1_size);
> +    data += sizeof(bf);
> +    data_size -= sizeof(bf);
could this be underflowed? size_t is unsigned

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
> +    l1_table = g_memdup(data, bf.l1_size * sizeof(uint64_t));
le64 to CPU conversion seems missed

> +
> +    ret = parallels_load_bitmap_data(bs, l1_table, bf.l1_size, bitmap, errp);
> +    if (ret < 0) {
> +        bdrv_release_dirty_bitmap(bitmap);
l1_table is leaked

> +        return NULL;
> +    }
> +
> +    /* We support format extension only for RO parallels images. */
> +    assert(!(bs->open_flags & BDRV_O_RDWR));
This is what I am not fully agree with. We support bitmap RO, i.e. we
will not
be able to continue tracking and write this again, but for the purpose
of the reverse delta we could have the image RW.

and even for the case of consistency, do you feel that assert could be
tooooooo strong. Our colleagues will come to us here with the
blames that QEMU has been crashed even they are doing something
completely wrong :)

> +    bdrv_dirty_bitmap_set_readonly(bitmap, true);
l1_table is leaked here too


> +
> +    return bitmap;
> +}
> +
> +static int parallels_parse_format_extension(BlockDriverState *bs,
> +                                            uint8_t *ext_cluster, Error **errp)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
> +    int remaining = s->tracks << BDRV_SECTOR_BITS; /* one cluster */
> +    uint8_t *pos = ext_cluster;
> +    ParallelsFormatExtensionHeader eh;
> +    g_autofree uint8_t *hash = NULL;
> +    size_t hash_len = 0;
> +    BdrvDirtyBitmap *bitmap = NULL;
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
> +
> +        memcpy(&fh, pos, sizeof(fh));
> +        pos += sizeof(fh);
> +        remaining -= sizeof(fh);
remaining is to be checked before memcpy to avoid reading beyond end of
the cluster

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
> +            if (bitmap) {
> +                error_setg(errp, "Multiple bitmaps in Format Extension");
> +                goto fail;
> +            }
unsure at the moment. May be this is too restrictive.

> +            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
> +            if (!bitmap) {
> +                goto fail;
> +            }
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
> +    if (bitmap) {
> +        bdrv_release_dirty_bitmap(bitmap);
> +    }
> +
> +    return -EINVAL;
> +}
> +
> +int parallels_read_format_extension(BlockDriverState *bs,
> +                                    int64_t ext_off, Error **errp)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
> +    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
> +    uint8_t *ext_cluster = qemu_blockalign(bs, cluster_size);
> +
> +    assert(ext_off > 0);
> +
> +    ret = bdrv_pread(bs->file, ext_off, ext_cluster, cluster_size);
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
> index 3c22dfdc9d..d33b1fa7b8 100644
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


