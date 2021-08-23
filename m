Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13A3F4A52
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:07:31 +0200 (CEST)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI8jh-0006Ly-M9
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mI8hx-0005Ur-Le; Mon, 23 Aug 2021 08:05:42 -0400
Received: from mail-eopbgr20104.outbound.protection.outlook.com
 ([40.107.2.104]:8614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mI8hu-0006bs-Lv; Mon, 23 Aug 2021 08:05:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5Jplb6U8I/R0qbOmKIwajMfTUBwpgefEebKjW5YyqmSsbFHOUIp9w2VOi09uUIHsh6zSQ3UgNMOZIm1W4/13d9pQYZ4Axqo4/PLhu45BrEqzd6psroEnucIY/43sFWniUGIyzQVzrTQ9h8w9A2Ak5T5BB/l0OGfr3i15exi/Ey7CYfpOCui+8VD/NKtcxnXEdDy5X910km3NQrj0tS8zLNJLdzFN1R/CDpG/KfQq3F6Ihp5eudy/eK7rJkQso3n+hP1G1618cIxG9h0ogRbO/N0QnntYfK/QuHR2A+sg6LVNT6ap3gAr9xtjnCntETHtRgiKcZxb7rFNfqCzHIUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFRQtFjiG/j3zgzMP2ahRyDcDBUJrJjWLzX7tF0GJew=;
 b=EW4ZMghcCXF8yGwhobJ1ADPXrX8lz42DLrZs70iMf7CSORqr3CdmS4fPn3PJYSTwcE9N38EQAMn+MoHSARaq/cBIcvs42zbpg7SdAYnlCWnnDaeNRTc95W0tjXn0TdHQfYz3uO+eEUqC0AHrV7JEV9ucHYhJMUi4gsYNxVq3dml2EA0curjPyw9zdbhXZqxnx0k5Nvjzi3i20ct7eYUoD8c1jXKTv9IP2MpwTcft3hjowNi4lscIJsce3P3UZZe4N+wfNpZ/c8UXb/mKRi3GIXAjKuFBcrrF/aoj3l276aniTXo4wn+X2V5xcoM2V3KSwh8XCm5k2ehz7wgguslBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFRQtFjiG/j3zgzMP2ahRyDcDBUJrJjWLzX7tF0GJew=;
 b=cuu1U/IEB+7Zod8tHcFRDgmK8eJZ4mNN4x2v5bke9+Gca6XRIfSq5vuZ5ZYx/mhQCHqhcAuldMSVCCcPoOBxqo0q0kDV2JAie7Ux1pgSY+eELnKMPCH7jm6PfrgaH10dvyuqmJRvRhIX0aNDk+LHMOT5tsT4ma3FhOx4yNT8dmM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 12:05:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 12:05:33 +0000
Subject: Re: [PATCH v7 07/33] block/block-copy: introduce
 block_copy_set_copy_opts()
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-8-vsementsov@virtuozzo.com>
 <1cf5b03a-fe5f-a258-3fea-f5f3a3e5cfd9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4ab74994-5f7c-c286-8566-a68c999099e6@virtuozzo.com>
Date: Mon, 23 Aug 2021 15:05:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1cf5b03a-fe5f-a258-3fea-f5f3a3e5cfd9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.5 via Frontend Transport; Mon, 23 Aug 2021 12:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b0e3016-cb1f-4692-f72a-08d9662e4f04
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59116B58C1D3078A82623880C1C49@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obQ5fTOjgSUyP+Pes+sQhm5mAhmddoEN/9R5i/5MSZGPKtklNhB1hgNCI+3hHruquzGwj/hV6ihHJsTI3DQTxlTQ1XtHbsKG9lJY6cAuMyhdIdjeIKvxON72FomkRA1sL4w7Pq8nJl8IPUoQO8gGcJ5eANRS2EKnjFFRR4XGuR/jWBmC+H5uR8zauqddQb+X+sSazzDZohXhsmVxtdcJyUUDs/3AA38i1eo9MHb7VRKh69JeYDz9qlH+s086iQFyyc7FatoW6iuNdL/Qoq6vKvwXXIx1FJAeyKvjYRL79ELiVc6wyYBXhbApbsg391mTTnLJpvBpAENMEX2V5TvGLxk7dzC1wzAChv4pzNrLyEMZ3dkbTxt81Ya57o0sc8OcMkE4HyH0zpG2rRLux2v/IFUGiTL6t36gKAvtJco9mMnWqssnU5kNrzyJ3pTjbXmT6MT2+m3Ql9kPwVJ5bV5vPpbJsYDpUh1xynsrS6TrjqdfzJnfyjmg3blEzccD0508wAxgXfoDkbmotcEPNr4fn39FlU/BNdXnSt4AhkNFFFTzmkOE3IFq9mfHzEZwumXI7VFhGKEOBNxypcc0AZhczXiifOuzVxm/op1emetMNxAMiga03SMTxn1qhonEUheE9Sdl+y9pJXN6NCTJJMYAqg1jrvX9osFONgRoyGgLZYyEzUZTXehy0iyuwmsV8BB9bMzh7Ilaojtjm7PNs8cZ9vVoszd66eBKTwtMPNoaUIAEhfUTgbC58qO81vSEVyqZTmOEolc6PBgP8c3ukD1z5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(6486002)(2616005)(66946007)(53546011)(83380400001)(36756003)(26005)(478600001)(8676002)(186003)(66556008)(316002)(86362001)(66476007)(8936002)(2906002)(5660300002)(4326008)(38350700002)(956004)(52116002)(38100700002)(31696002)(16576012)(31686004)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VldkxpV0hHMXFkQ2R0bnRTeGxBYU5NRENwOGQ1emJST2RaNVluUDIrWnBD?=
 =?utf-8?B?RGgxZG1HZ2NkZnhDTDFQZ1dxcXh2K3EraU93TitPUGFLRTFBLzNNM2txdWZo?=
 =?utf-8?B?SzFmbWpvRnRhai9yaHJpbGIybllRS0ZhSFhBZGMrYUpmVG5EMENsUndKYXpW?=
 =?utf-8?B?clpoU1VVS3JqRExSRGdjWTN6UVJZckxrNlpLZGF5Rk9vRkRidE9CenowOE5Y?=
 =?utf-8?B?bmR1T3FaQ0NoR1FXenE4Yk9ZSS9QL1FxanRNOTNGZFNBZ2F1Tk5mOVlmY3U4?=
 =?utf-8?B?MUhjYWNXbUJ2WHFTQk04VWpyYXN5Q0xuNVZ5MlJJU1p1VWxWU0lYQWk4UVZI?=
 =?utf-8?B?d0NsVGkwRFFtdGJkL0JqU1BoTzhGdTIvRTE4SjJGTVdaK25JalNwc0ZHWkRr?=
 =?utf-8?B?L3E3dUs3QTVqQWtpdGZlbVZiS2VrYStUMWVtMGtjV2l6Z3QxYy9ybFFZRDFy?=
 =?utf-8?B?bTg1S1JaT2xFT3lKd1RDUkduUjh1MVJRc0VLU0JPQXlIU1ZvWEtNUXNiY2lP?=
 =?utf-8?B?aVRiK0UxR0NDYjZlYVJnOXIwUXd3dVFGeTVQMHZLMTRHTGVKczNBQit5NExV?=
 =?utf-8?B?MkZ6U1pPY1BYbmlXNnF4UXZSc0xqMFBKYkJpR3hMUGl0d0d0blhjeTB6enBy?=
 =?utf-8?B?SHY5a0c5MjVUQ0VhNzNCd1R5ZFFjLzFJbDRaQlNBTVBnL04wbmcyNFpBdWpG?=
 =?utf-8?B?cUhCcDhteDFBRWp6S0RCUE04ZSsvYWtjYmZ6YkUxaUcrU2l6MFFQemFsc2NC?=
 =?utf-8?B?VS83dVN6RnR4QmY3bDY1cHNyeDNmNWdNNktjZ1o2MWhhZHFyN3BSbW9pVHEx?=
 =?utf-8?B?UzJiVXJJTWVSN1ZwZ0RxTzRsV3FjSmx4MzhUUWo2MjRhZGpZcUdwQnZhN2RY?=
 =?utf-8?B?QkNITjVHRXgybEdleTUzRWVCa1MvUjFHSzA4M0dtSjJvRVpDcHZVQmFZZFVN?=
 =?utf-8?B?S040eG9jakY5NmlJeWFnTHFSRG1yUmdaMCt2LzNxZCtoUlFPTFU3Q1doN0Jt?=
 =?utf-8?B?elRoa1VlRlY0c2szbms1aEFmZ283aTdSbEs1dkZKckVVT3NINDF1cnlQNzhu?=
 =?utf-8?B?UDBTcmt1SG9hdU80cStTUWtBYmc0TGNWVXl0cktNUEliTkc4eGgvK0tWUWFz?=
 =?utf-8?B?NmszVFFnRis1OVdOZDg5WUJBMVdYL29ZYk40WVMzU1hxU1JkZ25ZWHBSN245?=
 =?utf-8?B?dVo5TEJmOEtYRk9rS3NkaDJ5MkprSU9BQko0RjdSSnRuaGNoSWxFbjZDWjhL?=
 =?utf-8?B?UXdEZktCMDgxdXBCcDNVbXBpM2xkT0ZPU0VUSmdLY0Ziell1U2dOU1ZKRzF0?=
 =?utf-8?B?RHRhSm1yRTBTR2Qyb29XbXZWRGhxeHJaWXppR0NNZ2Z3ZTFSTFVBNzJCRjhJ?=
 =?utf-8?B?MHBBc3MvYkM4eHZQZHVuRFRaQkdCY20zeGZva0k2amRwVG5VZUo1bnBpUjds?=
 =?utf-8?B?Q0hyeHRYTmtZbUppVjRyM0k0NnIwOGxyNXNzMGVWNFhCdEJEaVA5cG93QXJF?=
 =?utf-8?B?L3lqRWI5U1hVSkN6RnFucENBT2toOEEwMlRuYndNd1pTUnlZRnJhUnJydjV0?=
 =?utf-8?B?ZWVST0JNUXllN3dIaTEzek5EWDEwbUhvZWJ0OCtqM1ZYS1R1YUR2ckM5ZzNh?=
 =?utf-8?B?Zk5BM1ZITkh1TnNGOHVISTVEUllkZTFBSEQ5QW9jWVZuWEdoZ2lOL0loaThY?=
 =?utf-8?B?YWFTVC9MN0ZqWEdDMzBVZHdoUUFIT2I4NUdsbGVlNVhTUmxqT2hKeGZHTk9q?=
 =?utf-8?Q?70RbErMQqKWqyz7qAMfJnxHl9am/06xvuDlaWgo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0e3016-cb1f-4692-f72a-08d9662e4f04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 12:05:33.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uocUPfK8QkAfdpzAf8T0r56tJfDETQ4zZh+OEGCmf7IdmkK08FADWK0TVoayvBYRAvWW6lU4b6tU51jdw8qBVJ/w6QeeFHgxiZjKgTYzKjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.2.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.08.2021 17:55, Hanna Reitz wrote:
> On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
>> We'll need a possibility to set compress and use_copy_range options
>> after initialization of the state. So make corresponding part of
>> block_copy_state_new() separate and public.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block-copy.h |  2 ++
>>   block/block-copy.c         | 66 +++++++++++++++++++++-----------------
>>   2 files changed, 39 insertions(+), 29 deletions(-)
>>
>> diff --git a/include/block/block-copy.h b/include/block/block-copy.h
>> index 734389d32a..f0ba7bc828 100644
>> --- a/include/block/block-copy.h
>> +++ b/include/block/block-copy.h
>> @@ -28,6 +28,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>                                        int64_t cluster_size, bool use_copy_range,
>>                                        bool compress, Error **errp);
>> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>> +                              bool compress);
>>   void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
>>   void block_copy_state_free(BlockCopyState *s);
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 58b4345a5a..84c29fb233 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -315,21 +315,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
>>                                        target->bs->bl.max_transfer));
>>   }
>> -BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>> -                                     int64_t cluster_size, bool use_copy_range,
>> -                                     bool compress, Error **errp)
>> +/* Function should be called prior any actual copy request */
> 
> Given this is something the caller should know, I’d prefer putting this into the block-copy.h header.
> 
> However, I realize we have a wild mix of this in qemu and often do put such information into the C source file, so...
> 
>> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>> +                              bool compress)
>>   {
>> -    BlockCopyState *s;
>> -    BdrvDirtyBitmap *copy_bitmap;
>>       bool is_fleecing;
>> -
>> -    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
>> -                                           errp);
>> -    if (!copy_bitmap) {
>> -        return NULL;
>> -    }
>> -    bdrv_disable_dirty_bitmap(copy_bitmap);
>> -
>>       /*
>>        * If source is in backing chain of target assume that target is going to be
>>        * used for "image fleecing", i.e. it should represent a kind of snapshot of
>> @@ -344,24 +334,12 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>        * For more information see commit f8d59dfb40bb and test
>>        * tests/qemu-iotests/222
>>        */
>> -    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
>> +    is_fleecing = bdrv_chain_contains(s->target->bs, s->source->bs);
>> -    s = g_new(BlockCopyState, 1);
>> -    *s = (BlockCopyState) {
>> -        .source = source,
>> -        .target = target,
>> -        .copy_bitmap = copy_bitmap,
>> -        .cluster_size = cluster_size,
>> -        .len = bdrv_dirty_bitmap_size(copy_bitmap),
>> -        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
>> -            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
>> -        .mem = shres_create(BLOCK_COPY_MAX_MEM),
>> -        .max_transfer = QEMU_ALIGN_DOWN(
>> -                                    block_copy_max_transfer(source, target),
>> -                                    cluster_size),
>> -    };
>> +    s->write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
>> +        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
> 
> Shouldn’t we keep the is_fleecing check in block_copy_state_new()? We must perform it at least once, but there is no benefit in repeating it on every block_copy_set_copy_opts() call, right?
> 

I think, it may help if user calls block_copy_set_copy_opts() after graph change


-- 
Best regards,
Vladimir

