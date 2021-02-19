Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580D31FA77
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:18:44 +0100 (CET)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6cF-0003yH-EP
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lD6Vt-0007ot-Vf; Fri, 19 Feb 2021 09:12:10 -0500
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:45894 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lD6Vn-0005eX-CL; Fri, 19 Feb 2021 09:12:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSKd6ZW/7VBZmV8Ori9k+DgouOyxSncpjMQDdiwnomHN6ByXcbLdpVXjhePNoOrD4LC+bDKit2v7aE2sM7B3O36cMDiCjlbN02L16/1wdXc46u9wQeOJDh0Aj0ir30hp0hyx+lxslJ516Pgn0gxry/KHl1PJl/3jBg8ehSBTOkjSk5MDOtaKFQrvfKQxnEGPEi6ek4eJuL7c0dhTcCqCvWw1s8AulwoXbMqwxVbpL76atZHI7VK3mzYoe7KlglbNak3qS6Enh/qO9k2LpKVJGeM9nAwT9oTNhnPmyha6NgIYiyldOrzX9X4J2WWhIWLw5ljZh4YSkVoj8fBDrcg7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg2I3pw7EcmiawMnXBBE4VAdpDtgFNu5GcJ/zo+6N7Q=;
 b=ckeS2CdT9ADDRxZ/t2lJlQPzy4qqW/AWsAL5YgB/J6ZMtn52/x4heOYbx6V5BxfqE8bPiRBUXcoAW1E5YWhDFmLc9BWr3wtTdv5WVeYoKmMamXEAjintUcmzG6S613P5zThCDobVliSN/3msyZOxVwKevKRWgZd1dYKLcm7YWvtj4YDMdJpWj796P4/QlqOMXwahPRdFRQxqovM5hJ88egpC/w+RYHv6naLf4LpBIP4+m8cO/flYhczBDPrBT++WPq6ZKWLIodgrjBSUUkkDCHAF3/JzCDhqq67DRS9mAMaZsitP7AfvM3bE5oVoI8Nu73ygG6K42bmSwO1XxbxYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg2I3pw7EcmiawMnXBBE4VAdpDtgFNu5GcJ/zo+6N7Q=;
 b=BK4qdByg+VveHoZHZVSQrUz8ISQRS61SPMkLV1My7aui+mEPlXlWLzR3nuCiZaqQywt7JV1Pq4vWLXTv56ASbt0dzkeEPmlGiocgxWcFH93ieUpu3uzvOeWTl9wgLjiNiklPatbfwP2GMF8alxYFCaSpHfF8NuM0PzFNhlMHuxo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Fri, 19 Feb
 2021 14:11:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Fri, 19 Feb 2021
 14:11:56 +0000
Subject: Re: [PATCH 3/5] parallels: support bitmap extension for read-only mode
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-4-vsementsov@virtuozzo.com>
 <214a4725-2ec5-f6de-4548-a4b6deb95ea4@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <064c3d21-56fc-a85a-3308-d1323f3bbc6c@virtuozzo.com>
Date: Fri, 19 Feb 2021 17:11:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <214a4725-2ec5-f6de-4548-a4b6deb95ea4@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.229]
X-ClientProxiedBy: AM9P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.229) by
 AM9P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Fri, 19 Feb 2021 14:11:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2107a049-a918-472e-9c83-08d8d4e0504e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6293CEE4CDCCC765218721E3C1849@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrHJ1Q6XcQnHs8BGeJI+cyWN2XoPuT5Q0dvsA9HOdsN5m35I1Mbcu1XV61IxaA3mJHAk7FKD4GURf0tOiOUCyCZEMYOrbtOaKFetz+Bfz195BJpSCiODLYWAN0InYFDgUBquLXWTQq63irCmsTE6+ExZa2TAzFlUnxgmmNRliQEbqdlj5iAIDU2kCKk9VNG8UK2uoCh0Vq5abUxOf75ZZLGjh7+810hZJZh+omajmLTcpGuqio5cm8C82VnsMJo+M+EfPaNxrcpSaSPROdDPD1Yuq3SKVpsFrIM0l8//AP6vqruK+MMoPwyjPayCaqIRHPQlbiEawv7/5azDyDsGOkQEoDVRm7V/FJKRLZ6J67mc4hm4IMTD00kLSRoHt+2wo0Awm67Jwn8zUMQQNgH+XORUyiiifV/asNtYk36AL6YDWlexB/U5En0/oi6oAV449ZyrDmranx5xwBNESoJ8akFJm9kRVldjDqvb179iqbMHm7/i6BDeiHMPC/CbJfren8Gljuo5BltONzsnYREwJPpdRmGy+lRH4HpSd8BbtxQy1hnDGgbr6gLtkPW6Am1p6unab/IgkTshgPVHnrcXvW1LJ6rss79UnnHTRRClkug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(86362001)(30864003)(31696002)(66556008)(16576012)(5660300002)(83380400001)(956004)(66946007)(8676002)(36756003)(316002)(2616005)(478600001)(2906002)(26005)(52116002)(31686004)(8936002)(66476007)(53546011)(4326008)(186003)(6486002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzFWblR5YWU5RzZDSWNQbE95LzZ3aFBzUmJRTGZscEVIM3lEdzJibC9iYkJs?=
 =?utf-8?B?eWo4OWdWeEl1b2trQVo4MmVCaWlkTTlKTnNwZkRYV0RLbWpuTWNMS1ZXeWNZ?=
 =?utf-8?B?UmlRT0twSHJlZnhFN0lEZHZIcWRlZXplZVc4N2NDdmphZmkwbHlVZ01VU052?=
 =?utf-8?B?T0w3UXR6OTZXeUVpeW0rb2lwRGFHaEtQRTBZWDVCZG9jTnRkY1NrU29HS1Ru?=
 =?utf-8?B?bUhFNFNtNlNiRDdDMUc5eC9EUytGSTBGdU9WN0J5a2MzM1lyMC8xbkVaekhy?=
 =?utf-8?B?dWJlVnZLenVPbHZSV2xxL3orZGxEeGx6VFJMWGI3SW5vMEJGWDZyNTd1aXI3?=
 =?utf-8?B?eHB0RlpBUEltVlpjVHFLd3VOa0xiS0RaZHVsNU9MSGExbk5QY0xtVWdzbUwy?=
 =?utf-8?B?TWdMQTNIeUxXMjJTeHRkblQ0RVluT0t4M0xYSFFibmxtNDRsQkI4NGIxdmpv?=
 =?utf-8?B?SWluVm5TcmVBNTBHWjZCeDdsR0Y5ZDAzN1prWmVqeng2Y1NNWFJvWk1tMy95?=
 =?utf-8?B?Z3RHWmxzUXZDaURvQitPUEhNQzZNdlV3T2NQTXE5M0p5anNKL092WUZ2K29C?=
 =?utf-8?B?ZTRPaTVXdmcxdHlxSDErWEEyRmtzZ0lTWS96bEV1SkZWclRhOFJ4b1c4ZWh1?=
 =?utf-8?B?YVI1cHdzQ1F6T2tNOU5WSkpiVS8wTUl1N2ZvZ0ltdUF5NFlQNWlhNzNzbU9L?=
 =?utf-8?B?Vnl6ZUY0RlB3d3hDekM1dzQwZ2l3Y0xsVEcxMFdvMTNlekVQZmZNYWFBWkJR?=
 =?utf-8?B?V2xTYXBGdWpQU3dvTnNUblUvQWowUDZVTGZXQWllZ00vRE5hUUlXT2RlSEg1?=
 =?utf-8?B?bUpEb1Uxc21BSU9XREp3QS9ZbDNuS0wrZC8reXpEbkpMUHk3V0ZzUG9SUjlW?=
 =?utf-8?B?bjB6OXM5RVdrNDZDaWlxNFNpM0lVbDZLTzEzT01BQUVOQW92ekhYbVdyTi84?=
 =?utf-8?B?UDQ1czJsWFVqcCsybGlLMVJYY0pZVnR2RUNLV1lod1BUaDNjYkg2bTcrQXFT?=
 =?utf-8?B?cFVxQXp3SVFaWXR1d2oyS014WXIyMEhTU0pWRzhadUVKSFkvUk50bFZLbldH?=
 =?utf-8?B?aFdaaHl4OGV5SkcvNWw5UjkzSVU4cEVrSmRrSVVNZVNrZGFDSFBzczlVOUhP?=
 =?utf-8?B?bGlWYkFzMmc4S1M5U3J2QUNkbFpzMHlKY2JFb2UydUp6cjZWdTQzblBvSVVs?=
 =?utf-8?B?TXlUeDlqTUtJTG5TSStOaWJrQytMaTVQK3hqRWFKMVVKOVQrUUp5K0tuRE5w?=
 =?utf-8?B?dGt0YkhaYWt6MkQ3Z2N3ZDlkTjloNUZnUHRoVkozL0FlK0ZzTU1FYzZaT3ha?=
 =?utf-8?B?cUZ5ZmgyMnBBY2pGdUR4Q0lFUG5jMmhZWmlRTytFZmdBVTRkWVFuNVMxNFN6?=
 =?utf-8?B?NVZXQStBR21QOEt2UEh5QTIyaWpvZzQ4MnozK2l2cXJTQWltWTdOTnRHYzVy?=
 =?utf-8?B?bnR6dUF5K2wwam41TVo2T3VwWUQzS1J3U3RNWTVyK0Q3aTJWdHVvbVEzVURH?=
 =?utf-8?B?VmhQUjNMQmh3VEh3V1cvYXNxR0NFY3ZUTWVnZlg1ZHE0d1FRbDV6dEhHZS8x?=
 =?utf-8?B?eHJScWdaWXMxbTVPbE5ESXVnaVJsSjJWSnBoU1ZrRFBMYWpVNWxkNUtqdTAx?=
 =?utf-8?B?amxHd3hiODdJVzdFenJGYzhKWkpYNGxSR0ZFQ2loSEdmNDVWMjQzbEVyUWZy?=
 =?utf-8?B?M1R0T25SdnNDOCtWWnBubnh2UnJJN0h4T295S1RxV2NURnFZNUlGamVpejA4?=
 =?utf-8?Q?09pjN4Fu/LSBRPA0NHv+xfLRS/tu1wt135A4wuR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2107a049-a918-472e-9c83-08d8d4e0504e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 14:11:56.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++SAPusgva3aHKGdzmdvcGBsax7UEggAHbO67l7GPatUl4ev+xv19xQxnbA7tkaZ1wtJ+BP1l67OKBwen1nDFuaCTpsA9LA+P9BtUKidzZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.02.2021 14:47, Denis V. Lunev wrote:
> On 2/16/21 7:45 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/parallels.h     |   6 +-
>>   block/parallels-ext.c | 286 ++++++++++++++++++++++++++++++++++++++++++
>>   block/parallels.c     |  18 +++
>>   block/meson.build     |   3 +-
>>   4 files changed, 311 insertions(+), 2 deletions(-)
>>   create mode 100644 block/parallels-ext.c
>>
>> diff --git a/block/parallels.h b/block/parallels.h
>> index 5aa101cfc8..2dbb7668a3 100644
>> --- a/block/parallels.h
>> +++ b/block/parallels.h
>> @@ -48,7 +48,8 @@ typedef struct ParallelsHeader {
>>       uint64_t nb_sectors;
>>       uint32_t inuse;
>>       uint32_t data_off;
>> -    char padding[12];
>> +    uint32_t flags;
>> +    uint64_t ext_off;
>>   } QEMU_PACKED ParallelsHeader;
>>   
>>   typedef enum ParallelsPreallocMode {
>> @@ -84,4 +85,7 @@ typedef struct BDRVParallelsState {
>>       Error *migration_blocker;
>>   } BDRVParallelsState;
>>   
>> +int parallels_read_format_extension(BlockDriverState *bs,
>> +                                    int64_t ext_off, Error **errp);
>> +
>>   #endif
>> diff --git a/block/parallels-ext.c b/block/parallels-ext.c
>> new file mode 100644
>> index 0000000000..b825b55124
>> --- /dev/null
>> +++ b/block/parallels-ext.c
>> @@ -0,0 +1,286 @@
>> +/*
>> + * Support for Parallels Format Extansion. It's a part of parallels format
>> + * driver.
> s/Extansion/Extension/
> s/Support for Parallels/Support of Parallels/
> s/It's a part of parallels format/It's a part of Parallels format/
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "block/block_int.h"
>> +#include "parallels.h"
>> +#include "crypto/hash.h"
>> +#include "qemu/uuid.h"
>> +
>> +#define PARALLELS_FORMAT_EXTENSION_MAGIC 0xAB234CEF23DCEA87ULL
>> +
>> +#define PARALLELS_END_OF_FEATURES_MAGIC 0x0ULL
>> +#define PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC 0x20385FAE252CB34AULL
>> +
>> +typedef struct ParallelsFormatExtensionHeader {
>> +    uint64_t magic; /* PARALLELS_FORMAT_EXTENSION_MAGIC */
>> +    uint8_t check_sum[16];
>> +} QEMU_PACKED ParallelsFormatExtensionHeader;
>> +
>> +typedef struct ParallelsFeatureHeader {
>> +    uint64_t magic;
>> +    uint64_t flags;
>> +    uint32_t data_size;
>> +    uint32_t _unused;
>> +} QEMU_PACKED ParallelsFeatureHeader;
>> +
>> +typedef struct ParallelsDirtyBitmapFeature {
>> +    uint64_t size;
>> +    uint8_t id[16];
>> +    uint32_t granularity;
>> +    uint32_t l1_size;
>> +    /* L1 table follows */
>> +} QEMU_PACKED ParallelsDirtyBitmapFeature;
>> +
>> +/* Given L1 table read bitmap data from the image and populate @bitmap */
>> +static int parallels_load_bitmap_data(BlockDriverState *bs,
>> +                                      const uint64_t *l1_table,
>> +                                      uint32_t l1_size,
>> +                                      BdrvDirtyBitmap *bitmap,
>> +                                      Error **errp)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    int ret = 0;
>> +    uint64_t offset, limit;
>> +    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
> 
> should we save cluster size to BDS or create helper for the purpose?
> Such operation through the code is looking terrible. Originally it was
> available in one place only and that was acceptable. Now it spreads
> over and over.

Agree, will do.

> 
>> +    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
>> +    uint8_t *buf = NULL;
>> +    uint64_t i, tab_size =
>> +        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
>> +                     cluster_size);
>> +
>> +    if (tab_size != l1_size) {
>> +        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
>> +                   "to bitmap size and cluster size. Expected %" PRIu64,
>> +                   l1_size, tab_size);
>> +        return -EINVAL;
>> +    }
>> +
>> +    buf = qemu_blockalign(bs, cluster_size);
>> +    limit = bdrv_dirty_bitmap_serialization_coverage(cluster_size, bitmap);
>> +    for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
>> +        uint64_t count = MIN(bm_size - offset, limit);
>> +        uint64_t entry = l1_table[i];
>> +
>> +        if (entry == 0) {
>> +            /* No need to deserialize zeros because @bitmap is cleared. */
>> +            continue;
>> +        }
>> +
>> +        if (entry == 1) {
>> +            bdrv_dirty_bitmap_deserialize_ones(bitmap, offset, count, false);
>> +        } else {
>> +            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS, buf,
>> +                             cluster_size);
>> +            if (ret < 0) {
>> +                error_setg_errno(errp, -ret,
>> +                                 "Failed to read bitmap data cluster");
>> +                goto finish;
>> +            }
>> +            bdrv_dirty_bitmap_deserialize_part(bitmap, buf, offset, count,
>> +                                               false);
>> +        }
>> +    }
>> +    ret = 0;
>> +
>> +    bdrv_dirty_bitmap_deserialize_finish(bitmap);
>> +
>> +finish:
>> +    qemu_vfree(buf);
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * @data buffer (of @data_size size) is the Dirty bitmaps feature which
>> + * consists of ParallelsDirtyBitmapFeature followed by L1 table.
>> + */
>> +static BdrvDirtyBitmap *parallels_load_bitmap(BlockDriverState *bs,
>> +                                              uint8_t *data,
>> +                                              size_t data_size,
>> +                                              Error **errp)
>> +{
>> +    int ret;
>> +    ParallelsDirtyBitmapFeature bf;
>> +    g_autofree uint64_t *l1_table = NULL;
>> +    BdrvDirtyBitmap *bitmap;
>> +    QemuUUID uuid;
>> +    char uuidstr[UUID_FMT_LEN + 1];
>> +
>> +    memcpy(&bf, data, sizeof(bf));
>> +    bf.size = le64_to_cpu(bf.size);
>> +    bf.granularity = le32_to_cpu(bf.granularity) << BDRV_SECTOR_BITS;
>> +    bf.l1_size = le32_to_cpu(bf.l1_size);
>> +    data += sizeof(bf);
>> +    data_size -= sizeof(bf);
> could this be underflowed? size_t is unsigned

I should check the size at function start

> 
>> +
>> +    if (bf.size != bs->total_sectors) {
>> +        error_setg(errp, "Bitmap size (in sectors) %" PRId64 " differs from "
>> +                   "disk size in sectors %" PRId64, bf.size, bs->total_sectors);
>> +        return NULL;
>> +    }
>> +
>> +    if (bf.l1_size * sizeof(uint64_t) > data_size) {
>> +        error_setg(errp, "Bitmaps feature corrupted: l1 table exceeds "
>> +                   "extension data_size");
>> +        return NULL;
>> +    }
>> +
>> +    memcpy(&uuid, bf.id, sizeof(uuid));
>> +    qemu_uuid_unparse(&uuid, uuidstr);
>> +    bitmap = bdrv_create_dirty_bitmap(bs, bf.granularity, uuidstr, errp);
>> +    if (!bitmap) {
>> +        return NULL;
>> +    }
>> +
>> +    l1_table = g_memdup(data, bf.l1_size * sizeof(uint64_t));
> le64 to CPU conversion seems missed

for l1_table entries.. yes. will fix

> 
>> +
>> +    ret = parallels_load_bitmap_data(bs, l1_table, bf.l1_size, bitmap, errp);
>> +    if (ret < 0) {
>> +        bdrv_release_dirty_bitmap(bitmap);
> l1_table is leaked

no, it's defined with g_autofree, so it's automatically freed.

> 
>> +        return NULL;
>> +    }
>> +
>> +    /* We support format extension only for RO parallels images. */
>> +    assert(!(bs->open_flags & BDRV_O_RDWR));
> This is what I am not fully agree with. We support bitmap RO, i.e. we
> will not
> be able to continue tracking and write this again, but for the purpose
> of the reverse delta we could have the image RW.
> 
> and even for the case of consistency, do you feel that assert could be
> tooooooo strong. Our colleagues will come to us here with the
> blames that QEMU has been crashed even they are doing something
> completely wrong :)

Assert here is OK, as we will not come here on RW image, as we don't load bitmaps for RW image, so it's OK...

About reverse delta, I think we'd better use qcow2 as delta. We can load bitmap from RO parallels and copy it to qcow2 delta.

What you want is loading bitmap in "disabled" mode for RW parallels image. In qcow2 bitmaps format we have corresponding flag,
so we can store active and disabled bitmaps, and load them as active and disabled appropriately. In parallels format we
don't have this flag. So, I think, by default the bitmap in parallels format is assumed to be active, and we must update it
when disk is written to. If we want to change this behavior we'll need an open flag for parallels format like
load-bitmaps-as-disabled=true..

> 
>> +    bdrv_dirty_bitmap_set_readonly(bitmap, true);
> l1_table is leaked here too
> 
> 
>> +
>> +    return bitmap;
>> +}
>> +
>> +static int parallels_parse_format_extension(BlockDriverState *bs,
>> +                                            uint8_t *ext_cluster, Error **errp)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    int ret;
>> +    int remaining = s->tracks << BDRV_SECTOR_BITS; /* one cluster */
>> +    uint8_t *pos = ext_cluster;
>> +    ParallelsFormatExtensionHeader eh;
>> +    g_autofree uint8_t *hash = NULL;
>> +    size_t hash_len = 0;
>> +    BdrvDirtyBitmap *bitmap = NULL;
>> +
>> +    memcpy(&eh, pos, sizeof(eh));
>> +    eh.magic = le64_to_cpu(eh.magic);
>> +    pos += sizeof(eh);
>> +    remaining -= sizeof(eh);
>> +
>> +    if (eh.magic != PARALLELS_FORMAT_EXTENSION_MAGIC) {
>> +        error_setg(errp, "Wrong parallels Format Extension magic: 0x%" PRIx64
>> +                   ", expected: 0x%llx", eh.magic,
>> +                   PARALLELS_FORMAT_EXTENSION_MAGIC);
>> +        goto fail;
>> +    }
>> +
>> +    ret = qcrypto_hash_bytes(QCRYPTO_HASH_ALG_MD5, (char *)pos, remaining,
>> +                             &hash, &hash_len, errp);
>> +    if (ret < 0) {
>> +        goto fail;
>> +    }
>> +
>> +    if (hash_len != sizeof(eh.check_sum) ||
>> +        memcmp(hash, eh.check_sum, sizeof(eh.check_sum)) != 0) {
>> +        error_setg(errp, "Wrong checksum in Format Extension header. Format "
>> +                   "extension is corrupted.");
>> +        goto fail;
>> +    }
>> +
>> +    while (true) {
>> +        ParallelsFeatureHeader fh;
>> +
>> +        memcpy(&fh, pos, sizeof(fh));
>> +        pos += sizeof(fh);
>> +        remaining -= sizeof(fh);
> remaining is to be checked before memcpy to avoid reading beyond end of
> the cluster

agree

> 
>> +
>> +        fh.magic = le64_to_cpu(fh.magic);
>> +        fh.flags = le64_to_cpu(fh.flags);
>> +        fh.data_size = le32_to_cpu(fh.data_size);
>> +
>> +        if (fh.flags) {
>> +            error_setg(errp, "Flags for extension feature are unsupported");
>> +            goto fail;
>> +        }
>> +
>> +        if (fh.data_size > remaining) {
>> +            error_setg(errp, "Feature data_size exceedes Format Extension "
>> +                       "cluster");
>> +            goto fail;
>> +        }
>> +
>> +        switch (fh.magic) {
>> +        case PARALLELS_END_OF_FEATURES_MAGIC:
>> +            return 0;
>> +
>> +        case PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC:
>> +            if (bitmap) {
>> +                error_setg(errp, "Multiple bitmaps in Format Extension");
>> +                goto fail;
>> +            }
> unsure at the moment. May be this is too restrictive.

Hmm. Somehow I thought that it is mentioned in spec.. But now I see that it doesn't. Will improve to load several bitmaps it's not difficult.

> 
>> +            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
>> +            if (!bitmap) {
>> +                goto fail;
>> +            }
>> +            break;
>> +
>> +        default:
>> +            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
>> +            goto fail;
>> +        }
>> +
>> +        pos = ext_cluster + QEMU_ALIGN_UP(pos + fh.data_size - ext_cluster, 8);
>> +    }
>> +
>> +fail:
>> +    if (bitmap) {
>> +        bdrv_release_dirty_bitmap(bitmap);
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +int parallels_read_format_extension(BlockDriverState *bs,
>> +                                    int64_t ext_off, Error **errp)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    int ret;
>> +    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
>> +    uint8_t *ext_cluster = qemu_blockalign(bs, cluster_size);
>> +
>> +    assert(ext_off > 0);
>> +
>> +    ret = bdrv_pread(bs->file, ext_off, ext_cluster, cluster_size);
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, -ret, "Failed to read Format Extension cluster");
>> +        goto out;
>> +    }
>> +
>> +    ret = parallels_parse_format_extension(bs, ext_cluster, errp);
>> +
>> +out:
>> +    qemu_vfree(ext_cluster);
>> +
>> +    return ret;
>> +}
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 3c22dfdc9d..d33b1fa7b8 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -29,6 +29,7 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>   #include "qapi/error.h"
>>   #include "block/block_int.h"
>>   #include "block/qdict.h"
>> @@ -843,6 +844,23 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>           goto fail_options;
>>       }
>>   
>> +    if (ph.ext_off) {
>> +        if (flags & BDRV_O_RDWR) {
>> +            /*
>> +             * It's unsafe to open image RW if there is an extension (as we
>> +             * don't support it). But parallels driver in QEMU historically
>> +             * ignores the extension, so print warning and don't care.
>> +             */
>> +            warn_report("Format Extension ignored in RW mode");
>> +        } else {
>> +            ret = parallels_read_format_extension(
>> +                    bs, le64_to_cpu(ph.ext_off) << BDRV_SECTOR_BITS, errp);
>> +            if (ret < 0) {
>> +                goto fail;
>> +            }
>> +        }
>> +    }
>> +
>>       if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_INACTIVE)) {
>>           s->header->inuse = cpu_to_le32(HEADER_INUSE_MAGIC);
>>           ret = parallels_update_header(bs);
>> diff --git a/block/meson.build b/block/meson.build
>> index eeaefe5809..d21990ec95 100644
>> --- a/block/meson.build
>> +++ b/block/meson.build
>> @@ -57,7 +57,8 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
>>     'qed-table.c',
>>     'qed.c',
>>   ))
>> -block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
>> +block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
>> +             if_true: files('parallels.c', 'parallels-ext.c'))
>>   block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
>>   block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
>>   block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
> 


-- 
Best regards,
Vladimir

