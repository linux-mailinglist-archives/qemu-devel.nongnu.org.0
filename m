Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2859D6EF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:58:34 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQg5-0004kA-K0
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQQdq-00082e-0a; Tue, 23 Aug 2022 05:56:14 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:7742 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQQdn-0001pa-Da; Tue, 23 Aug 2022 05:56:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEq26tryfY+/n94bO1OacjbEgPBy+jH7cixlF4lemCGmm1PHEg7Dx35JtneeIZSz3n29McSisyK1PBlFqsmeJx4Q5oWKG/LpXUhlrxPuWVgAC1LWyzcoyNBuhRQRJQ66NfcctN13DExF2KBh/W9XuSV4WCvEfeIe6LKHSQtgRkn9yuaUM9ctuw+FrwArd81Bzab1obhiFxECw7Y6tr8Pr7CNLq75C7oJ4H1y0KPYu98Eg5/tIJZWBzW82uBTRTvi51EmIMOAnOIQe5L2qlcqRi5mce1ezpM5tNiVNa3XnD5hVrNlbdz42iVUIOhy5LRi6uRovxNEtpNVXdgv8EIWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgcUHKWk+rvM90cLjrD59/x1iirOcS9yUtHuSd4Qbs4=;
 b=iUCK4gaWbOK7fg6bNncepg2O67dESbKN+z+OYZklgyrPZdkDRdx2ZG8zR3D7sGW+t8wjCY4TGnbRmTIm6EM6xuxEq1ULVmoi10WSZiWNXHVtL7bQGtRTzbncpqHKghkDHMv+gyTS28itNVoytaIB1TNV27JahdyE0Dvy+4hRNi3ny76UXhgrEO/dIErZ2IWkuhvY4IGWhvARugqgx7jAGPIT9UnTiIFWqmCDRUAh+QpA7Pw4TzGyk1lf/8zTqzXCxiNRGRchdKGs9ZZCLTHmyjIEoM9wcssc8ngBFZWNgCutW7ojniEefGrIbV1VRN+WubWDqyUuMP6z/4DtdnUe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgcUHKWk+rvM90cLjrD59/x1iirOcS9yUtHuSd4Qbs4=;
 b=LgdEFdrb9ad0abUtd5mcLkVhcip7i+gsiMRT+QUROS2X7M8F1EiwhsTTQ9I+ovPGXZA0pwSEgc91VzhOhP7M8zKPvrHfG0Px1bClIeNtMDoeus6mZnyhrm0craRNKpuZ4z66r4pH4kQ47vvIQJL7aHL8myoAtiLmFATX0EyV5+uQWPZl41FctxXbOHKVIaCTcTWDiTLbw1vKhpkEe4aneE2wx3eAU9MM8SOieEcHhwYfmKVEGrYqXVaP+FAHSspxUChnyoE9SUFZ5Cx16/sWC/0sLVCYV/45EWJ/fHf4sauPqsvj5un6H+qll6+r0DDifBI5wolJ7HlmejzugeXQIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9202.eurprd08.prod.outlook.com (2603:10a6:10:416::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:56:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 09:56:02 +0000
Message-ID: <ab4b4350-57cf-8732-4643-b39400bd64cd@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 7/9] parallels: Move check of leaks to a separate
 function
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-8-alexander.ivanov@virtuozzo.com>
 <68e6f899-9b4f-c589-4d8f-21c8ffa7a264@virtuozzo.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <68e6f899-9b4f-c589-4d8f-21c8ffa7a264@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::24) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5982d0-7c70-40cc-438e-08da84edb04c
X-MS-TrafficTypeDiagnostic: DU0PR08MB9202:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDG8iRFGh8kRsmWjcaxqW+Md4e2aM/Qgv3hXeqZT9DFfNEjDTj0O7V7xnFI7osQvPo8y3kARipPZW8xo6i1th/FTtZr2m6QAloUH5mSgxV7jpua93E+vVVm5eFJAFlYOrmVTVFmRH75MSSHO6sMiBnBs3nVZw4amea1xIwxJUtjfHQCeOMrSFZyqdwwKMnGrvCvDKw45fKnP5H5YoXd0Fd5CBYmHwrLLJ+B1q/IJ6JXXRtDg8cpa64GdIrNBH6CYSOtMjSHw8M1bdKLGtFJeRTwbBHoTFUAefGG0Y1v2n4HLMP5yTIWk9yECRVk0mroReUS6KR06drAmp4HuZGwmA8hXUVm14hyhJlkoXY7x8OZTjP3eJlISlx9NxSiURCXsvR5aSwgtqx0x72VqZUcxmN6LES2C+dgvO3DKomxg9p9yooa1yhUb0sV/Lg+vwvsoqtAbQHM8mJMJLW1YsdWOWFaHLN7DYqSJjImjPWwyHhow2YK/VOOgdCWaUPBOcYb7qaEUVIbPctIBYxYqG1n9/8uqC3zjVrudeuBBw1o0/yYN2xrBvD2k/h40U9YJDdKuSMuHDiQG4nIa3kmo9EgzbqVN1Cs2S3nu8yFqTcTxE6Aa5uDTmhdzeNgIwlKrxqPe9lklKi9q3zslRdwSAbstTsKeC8iDpqvr+DVYFTIhWTnNxcWquebnTANElbnYjRcrcZ8ZP2r3iCDjkNMY+lq3KbTK0+ouPyV9qF0iwd9y8DqLMeYXuTPMrfEPjL1xw5r3JzRsT0jaAopJLFxOusAMRDc5GqHjGz1qpyV2ACtkXtN9S9b+HrdURFGS0tik6JIg16Qh2TCZRDdKzHGyLQ9/aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(86362001)(6512007)(66946007)(66476007)(31696002)(316002)(8676002)(66556008)(4326008)(26005)(52116002)(6506007)(53546011)(2616005)(2906002)(186003)(83380400001)(6486002)(36756003)(38350700002)(41300700001)(44832011)(8936002)(38100700002)(478600001)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXQxSnVhSDRRUnI0TVBMRnZJWERJVUNuVVJHcHE5ZXlxTnZnQTJOS3kwdUZu?=
 =?utf-8?B?c0kwQno2Q2tGUjZ2cEExYVhpWG5vRWVaVUc1TTFHVytNMU5uc2t4dXFQbXJm?=
 =?utf-8?B?WlAvbzdwT2czQXJsV3FrbHZ3TWtUcXZSTTFBRmJHZmtvcS9xVXF4UDBFNU1v?=
 =?utf-8?B?Wnk1eGwwSThBM3JWcVF5WGFhQk1Gc1p6L3ZoVXg3YXF1NE9BNHlDd2FPTTBI?=
 =?utf-8?B?Szl4eWxpNFBTdWF0S1MrQXFpY2dURGxXcm4rY0VSYzM2cUF1YUNGWkltMCt1?=
 =?utf-8?B?Z2M0SWRTRVMrMnUyOVZFWkVqYzN5M3ZSYjA2WUppZGx0SGpYc3FEdDRmZDNR?=
 =?utf-8?B?Wi9wTWFkTjd1TmRONDVKS01RNlBSS3BST2dKL0RndjlPWEtiOW5WV1hjVXFN?=
 =?utf-8?B?U3R0eklsa040UzJCcVN0UUpGYlZzZW5OSmdUTnl0SGVYMDhoNTlDdzNJWU0v?=
 =?utf-8?B?UFpoVnh1NzRva0lqemNkamtmVU1zL3QydEY1UmdyWk9GV0ozc3cvVktxdmJo?=
 =?utf-8?B?ZWlIMG1DOG1hTzhqMnNYVHRBWWJoZDRHbzlubGdYRUVNS2RkOUhId3cvQ0Rt?=
 =?utf-8?B?NFdiTHRWdmkwNHhackpSSkdwbDZRRktpQWd6cWMyZGhIY3ZLVlFRdWFqckZW?=
 =?utf-8?B?MWRaTWJRc3RLV3FLWFM4bXB4MytIUE1ycGxHYUlNVWNIaFV2QlFhMVhTZmJs?=
 =?utf-8?B?NGMvYWFmMmZCb0xvcTRZSjF6WUdKUjZBemlKVlljMVlHOXk0Zmx0TUJNdXlO?=
 =?utf-8?B?UnFUVGZ3SWJ1SFVzTm8yRTBLWGNraVZmRWNCOFlUamZYM09xRmM1eHdNM1Nq?=
 =?utf-8?B?U052QUV0eXdBcDZ1ZWNCdlMwUjE5azltNVdZOC9nOFNRdWpwa1lpMXEvNVR2?=
 =?utf-8?B?amdFcEtOYVg3b3Z3QitubHppbWcrUzVuaTBTNU1uV2xiWnNzSHZwYXEyOGpT?=
 =?utf-8?B?aW5lY3Z2dFRVTFVoK1J6Z2dxNDVaNjZRK3FyYlNOOU85cGlrRm1wVzdsTzVj?=
 =?utf-8?B?a1dnREk3Ny9TY1JLUGVCaEZ3Yk1TYlBCWExYc2lZWVNsOEFGUURmSXNWZ3pm?=
 =?utf-8?B?S09PejNTejk0UWp5cXlRK2xFWGpLT3NQd0F2N3pqcEtMTW1mWVJHdlgwbjU1?=
 =?utf-8?B?TTN6SkZHN0RlUFg5bjJ1R0tNVVFaV2JlTURBM2UxUWlpUWQ5TUhDRTNZcDJr?=
 =?utf-8?B?bE9oRW5CbUlDbTdKczQ4cEdEWFRrd1NSYmU3M2c1VVhUUWd2OEZ3V3dqUXhC?=
 =?utf-8?B?bmRLSjN4RUZvZzVZMENjdEVHV0NkN3RPVjRPaitkempSY0E1M1FnYnQ3UGxz?=
 =?utf-8?B?Zy9YYVBLMWY4QzNKUzgvR0p3SmgxVlVkOGRDa3djbzJWYlZlU3V2QTROSXNk?=
 =?utf-8?B?ZkRaT25Wb3BVeUlFQmpIRVVlaWxVMHhHTlo0U0tibDdRbllzWUtCdnM1RFRO?=
 =?utf-8?B?RFdVRXRIVWJROEcrdFRDSjhacFNTRSthcS9Bb2dtK0Q4S3JUaGJ5bUkycVU0?=
 =?utf-8?B?SDJjajBINHdPSEg2TWFiMWxqQXBnQXA0eGFxS1E0VmNqNGd4VE1aQ0hQTHJR?=
 =?utf-8?B?U3ZaUVRSWm91VGErOVZlclJia1ZCbCtQZG5GdjgxSFh3Q2RuRW85aU00VGhU?=
 =?utf-8?B?M1BwWWllMjhXK0tjb0Y1OXc5WXpOL2tOdDRqMmhxdStiNDhrN3o1TzRRQTJR?=
 =?utf-8?B?U3U0RlU3QWRBZE9mYjVFcXRUWVM5d1pGUW9TaWlSejJjRXdieXUvUlZIelhr?=
 =?utf-8?B?ZDBSZ0RFSVkzVDBxdVF0NDNIc2lCc1hNYVBoeEMwOElyRGFza1RMMk1GWnN4?=
 =?utf-8?B?NGIvUWNDNit4bDloZVJLN2VwTjdkY3BoSDE3N1JVazd4amRIS1Z0V0pvejJZ?=
 =?utf-8?B?VUJ2MFp4TUwraWFVR3RpRHAxRGxYcFVvYVBsWEtPN25HUHFXdVF2ZTF5dHFx?=
 =?utf-8?B?ZzR4T2JrOUR1SWt3ZWV4L1l1RzF0M0FCTExUZndaK0hNNU1xWUtHRWowK2ds?=
 =?utf-8?B?aFlIalVyUW1GeStRT1dMVzRNK0JFSFA0NGZVczdLbDI0enhuMEVuRGQ4NW9B?=
 =?utf-8?B?Zkk1cGJITVNGcXBjNzJUelhROWx2eXFqNEV0czhOWDZLclduTzdzSnZvOC9N?=
 =?utf-8?B?SVJzZjBvVnlNalgxQkpkVHhWVTN1UFFsNG1aSTJmWmcwMDc4dWE4S2Q4SEtj?=
 =?utf-8?Q?QncrifL6uVZxCs6JX1x8ojo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5982d0-7c70-40cc-438e-08da84edb04c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:56:02.7031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIc1nYyYWqSfBW5RnxtPpSJyO8Jv9tUkBhoNfmnD07Nt5T78CaiaArwFYu4fCoqcsaa26X46XbFw4zCgx6jLFQB3XhJf7/8XWRbbLnd2RyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9202
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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


On 23.08.2022 11:40, Denis V. Lunev wrote:
> On 22.08.2022 11:05, Alexander Ivanov wrote:
>> We will add more and more checks so we need a better code structure
>> in parallels_co_check. Let each check performs in a separate loop
>> in a separate helper.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 87 +++++++++++++++++++++++++++++------------------
>>   1 file changed, 54 insertions(+), 33 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index bf074f247c..12e8d382f3 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -468,14 +468,13 @@ static int 
>> parallels_check_outside_image(BlockDriverState *bs,
>>       return 0;
>>   }
>>   -static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>> -                                           BdrvCheckResult *res,
>> -                                           BdrvCheckMode fix)
>> +static int parallels_check_leak(BlockDriverState *bs,
>> +                                BdrvCheckResult *res,
>> +                                BdrvCheckMode fix)
>>   {
>>       BDRVParallelsState *s = bs->opaque;
>> -    int64_t size, prev_off, high_off;
>> -    int ret;
>> -    uint32_t i;
>> +    int64_t size, off, high_off, count;
>> +    int i, ret;
> This is not we have agreed on. 'i' should be uint32_t
> You have fixed parallels_co_check, but this needs
> the fix too.
Damn! Missed it when rebased on changed patches.
>
>>         size = bdrv_getlength(bs->file->bs);
>>       if (size < 0) {
>> @@ -483,41 +482,16 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           return size;
>>       }
>>   -    qemu_co_mutex_lock(&s->lock);
>> -
>> -    parallels_check_unclean(bs, res, fix);
>> -
>> -    ret = parallels_check_outside_image(bs, res, fix);
>> -    if (ret < 0) {
>> -        goto out;
>> -    }
>> -
>> -    res->bfi.total_clusters = s->bat_size;
>> -    res->bfi.compressed_clusters = 0; /* compression is not 
>> supported */
>> -
>>       high_off = 0;
>> -    prev_off = 0;
>>       for (i = 0; i < s->bat_size; i++) {
>> -        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> -        if (off == 0) {
>> -            prev_off = 0;
>> -            continue;
>> -        }
>> -
>> -        res->bfi.allocated_clusters++;
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>>           if (off > high_off) {
>>               high_off = off;
>>           }
>> -
>> -        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
>> -            res->bfi.fragmented_clusters++;
>> -        }
>> -        prev_off = off;
>>       }
>>         res->image_end_offset = high_off + s->cluster_size;
>>       if (size > res->image_end_offset) {
>> -        int64_t count;
>>           count = DIV_ROUND_UP(size - res->image_end_offset, 
>> s->cluster_size);
>>           fprintf(stderr, "%s space leaked at the end of the image %" 
>> PRId64 "\n",
>>                   fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
>> @@ -535,11 +509,12 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               if (ret < 0) {
>>                   error_report_err(local_err);
>>                   res->check_errors++;
>> -                goto out;
>> +                return ret;
>>               }
>>               res->leaks_fixed += count;
>>           }
>>       }
>> +
>>       /*
>>        * If res->image_end_offset less than the file size,
>>        * a leak was fixed and we should set the new offset to 
>> s->data_end.
>> @@ -549,6 +524,52 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           size = res->image_end_offset;
>>       }
>>       s->data_end = size >> BDRV_SECTOR_BITS;
>> +
>> +    return 0;
>> +}
>> +
>> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>> +                                           BdrvCheckResult *res,
>> +                                           BdrvCheckMode fix)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    int64_t prev_off;
>> +    int ret;
>> +    uint32_t i;
>> +
>> +    qemu_co_mutex_lock(&s->lock);
>> +
>> +    parallels_check_unclean(bs, res, fix);
>> +
>> +    ret = parallels_check_outside_image(bs, res, fix);
>> +    if (ret < 0) {
>> +        goto out;
>> +    }
>> +
>> +    ret = parallels_check_leak(bs, res, fix);
>> +    if (ret < 0) {
>> +        goto out;
>> +    }
>> +
>> +    res->bfi.total_clusters = s->bat_size;
>> +    res->bfi.compressed_clusters = 0; /* compression is not 
>> supported */
>> +
>> +    prev_off = 0;
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off == 0) {
>> +            prev_off = 0;
>> +            continue;
>> +        }
>> +
>> +        res->bfi.allocated_clusters++;
>> +
>> +        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
>> +            res->bfi.fragmented_clusters++;
>> +        }
>> +        prev_off = off;
>> +    }
>> +
>>   out:
>>       qemu_co_mutex_unlock(&s->lock);
>

