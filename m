Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CC3F4FB9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:43:30 +0200 (CEST)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDyr-0003rD-C3
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIDwb-0001LU-Ae; Mon, 23 Aug 2021 13:41:12 -0400
Received: from mail-am6eur05on2105.outbound.protection.outlook.com
 ([40.107.22.105]:43136 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIDwV-0003mc-Az; Mon, 23 Aug 2021 13:41:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ618DVMh1BLOl8waFzG5Tly0XQ1DqSUK4cUPX7PzXu5jceu6qb3J83YhrAPkBYbO6rNIzd+ZTkzcISWK8n9Gcg2lL7UPBEDU8eBiNHQ7YQWvNDUBh10r8Zrl63laLkC3YzJVF/8rDuFSV3sNmqSAiCpDS/P5DxFqPuzLWGTS266ne+BM31jHHqLeOj3DfRSHdNvlsRL5SBZZIRsOaoO+ehK60lSA4ZtUqY1Byr9ShuyWF9lmjNxp1yqin6M7AJS1GzstZwrYGe2sBGpSxaEi+jhD0Fn/oX586zgyV+SSMjbGSpUq0uRmixYVHK3mBkGs+xsNz+P7dCQmM3ecsUZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLxLupNu2Mp0YI1RlqmXJyZ8RHXMFTxUiSrt6EPlUbQ=;
 b=VKj+KdQyKiZd/WAbZOcYOPCcNyHsJyYwN7DxpOCVTvS8qLESBtUjwh2EjgfSFS0NuRaPd3S1qpWdcDf/YmPThUnXHRn3n91TogS91lRiVnjkPUqmTz9D6FMJlVwFAyBwnKgUh6FMGVJs3qNZlhVhmtwQQuKk98J7s+hPII2iDGKnWotLYSxxCHgWgRqmxVec5Kd2RWP+WdpxsEcU7rU3+o8vRp3/PSFAJNoVBCQwqs8oEYuRRTRwPvCh1cf4QKw5Md2DWrom5r8pn5QVFaNxoYULFj4AYEXUBaZaB9Fr1YWAlrWRdTM11iccal9fqfFErS59eGUxRnur9CYPhGHWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLxLupNu2Mp0YI1RlqmXJyZ8RHXMFTxUiSrt6EPlUbQ=;
 b=tTB4BC9OAGFJ5aNrSHg7PJQl5Dk5OcrplZ1qKES4MNq2p9z1WbH/wepA42rDCdx3F0oJKiizBi9yr8qzJeDyV8HMuO9YyfXx7GYZ9KZzcJsAZOamb3IQM/ZUND+wtkkHQQ3XlPup2c5DdTnZPZokew/QWQiHHjilOBOQIRsYVLE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:40:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 17:40:58 +0000
Subject: Re: [PATCH v7 07/33] block/block-copy: introduce
 block_copy_set_copy_opts()
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-8-vsementsov@virtuozzo.com>
 <1cf5b03a-fe5f-a258-3fea-f5f3a3e5cfd9@redhat.com>
 <4ab74994-5f7c-c286-8566-a68c999099e6@virtuozzo.com>
Message-ID: <27a3b6e9-5884-613e-2b03-26e1a20e3136@virtuozzo.com>
Date: Mon, 23 Aug 2021 20:40:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <4ab74994-5f7c-c286-8566-a68c999099e6@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR08CA0012.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 AM0PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:208:d2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:40:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8be0512-5377-456a-0489-08d9665d2ab6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6808:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6808A68CF92C4933B714C854C1C49@AS8PR08MB6808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:128;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhvQXgT0d1KXDzrmxco/8R0Wz+/HuYPOmoeCvGAfRSSgjJXhVjtlmaLC+8HrYEWjzFBjVrloFSCCChIdkqwPHwPdxsJTZx6N9U355zT9p8Rhn37c3XwbPoT4ws0LGSkcejCxMjIGF8/5akpM0Q1VSswEE1G6o+po6P2fuei15XyRR6wUJEM1SIrhE5zd2/cx6pWKBvbNi+H8WB8GPxd3JWHFYffSF14ZcCKFLarC+tOaHaEvdsOq6gX0hLBF4VxxjuzkzAzzh7ogPiXVBUM9zAB9UJ+CW8b+br96yzqjTJYUrmkM3f77Pkjsu+rANElYbH9bm0QXBNek+BZeyeVAptGUIKIqmdRYkNMd3k3K9cxu9BXTG9uwvROTHSMYXGG8jqLyP7BTU5WitVdVhWG+MrnA5N3jAkboDUxMVQJgJGLKpDhcEjJ1O5x/p4AKeWCBonOBdCT7bQtePsHVcizxFwwy8j1Ao14qblbkj1qxmhCleKJj4QYACcIg26rxLZZ1SFreVMbUZeyWVCgtagQKvblDHpXWeMpqE4YalhOGRH8b1weQTi8h03Vqw4tZYMxbWc6BkYF9K28chADIL87oI8FazlhBKfFcd6rX98xN+w7oJqMKGCO8As3KFryYzz1VADxImqm+dTufStO2FE6H8nCaul7FZphp4aVPnY9b6uosVcXAR9lIVWCUB6OhIafQE/1R4lqTATwN2Z+SgzhHPnk5L3Vr1J4oNz0ilg/YAF4I1bceCdxEXpGNGOmmEJQJP2W/p+FHMwHIQOpeqx4Z0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(376002)(366004)(346002)(136003)(31696002)(956004)(16576012)(2616005)(38350700002)(86362001)(38100700002)(83380400001)(6486002)(316002)(66946007)(7416002)(478600001)(66556008)(66476007)(2906002)(36756003)(26005)(8676002)(5660300002)(8936002)(53546011)(52116002)(186003)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBWMnY2bEZnQlVVWUkyNlpaaDVnL0tYSTQyS1F4L1lXTE5Nb1dXb1V5YzVE?=
 =?utf-8?B?STMzMXhkblpPemJWaDRHdDJFeDZVaWtkZWlIWFFrNnlkS25Pc2NEYWFNT0sw?=
 =?utf-8?B?NnFqUU5nMkNjSXRJYVdlNkVRdU9CTG41RWFIbUR2NWx1S1owL2RKRHFoQXRX?=
 =?utf-8?B?UVhHdGV1UitrSUZKN09KY1cyYnJHUzBRWStsMzNmZUdSR0VlSnd6VENMeVhM?=
 =?utf-8?B?akFCQm5tL283WGxkcTBKSnRzaXBMZjdTdlpmVEtzdHMrZkZZUXlta2xkeU5p?=
 =?utf-8?B?dUpoYTNIdFhQZnloeFZ6TTdJYmFTVE5QUEN4VnJoc3A1ZWNJeW50Zm5vTlpR?=
 =?utf-8?B?ZmsrNzJQSDV0aDhqOERXOTVmbDJ0VGVUTHNNM1JDS2lTaVRJUk5aVlNramtD?=
 =?utf-8?B?Ni9PSVMzOGxaMkZUUlpnYzlSUGhlRTdTTTJNbkJJc1FwRUtSMzJGRWJ1ZEpt?=
 =?utf-8?B?djZoSDZxNjREeTlxZ3N4c0FSWmRMUjJISlNZTmJoalFTNWsyVmkxemZmcXdj?=
 =?utf-8?B?NHNJSUEzdFE5dEU2S000bmtGeHd3d3Q1N3MrbU5PL1JQZWJjVHNyeFNmemE5?=
 =?utf-8?B?Z1hVMHUwc3prcUJIVTk4SVZDcWlUeVNRazZ1RWhsdStyMmxmcS9wSVNIUmhQ?=
 =?utf-8?B?ekZNdUFIcXdZQ0V0Y1daM24reGR1dExqUVkwc2xuVWdSUEg1K2k4QTdrNjl6?=
 =?utf-8?B?UjRrSFo2S1lCN25LOFJHenVlWnZZMXBvcXM2dkJHbndGQVg0eGNMUHdhWk5K?=
 =?utf-8?B?c0Y3N0Zsd2NEL2k1Uk9HVTYzWVpUbitZVlFGczUzUHVyTHROUmRxdkEwODJN?=
 =?utf-8?B?S0FFSHpBaUhmbmNmb0owK3VXLzhCemljOXJnVit2UUl4V0NTOHFQSml1NFB2?=
 =?utf-8?B?dllnZzdUUDdaQWJnSzVEbVY0cDBHcWFaVmZwZzRBTUdBbERjYWhXTHN2Y05i?=
 =?utf-8?B?ZlQwSnZjOGJldkZ2cjZDQjZ3SlRiT0N5VXlJMXJVWFpuWVY1VEYyN3pJbHlB?=
 =?utf-8?B?dlR3akFqRDBqMVFHTE1QNGdva3ZyVFMyQVJua2sxTlFKME5ZQXJrbVFTVmtN?=
 =?utf-8?B?NnZlRy9QZU5pYnI4em0rY1l3a3Fic2svY3lTTzJ0bGNVUXFrczYzaWwrNnU3?=
 =?utf-8?B?SHgxbzZpWUVTQUdNckVSUVUrcmVLWnpldGF4ZnRDTHNqNmhRekFYeGsxSit1?=
 =?utf-8?B?QWxRVWxrakN1eXdiZ2MvTVhQbmJKVnRjakpxSzNvS3U2UFRybWNlVzRTTEhx?=
 =?utf-8?B?LytRSURKclJtSHBVcWFjNDFSNnQzd2hsdWR0Zy95VCtmdytEc0tQTGgzN29i?=
 =?utf-8?B?VGtPd1dkQk9CVFE1NVRLTXRJNTNscXhTVUptc1lGRjl5eHVGclAzU3F6Z0c0?=
 =?utf-8?B?THVWcHRpTWU0YXA4WVk5ZmdFSkF1dGNMc2g0OW5CNEhqZ2dianRDc2pzOFI1?=
 =?utf-8?B?MytZNE5RWGJNb0lRcVBYelNFdXdDSS9iNnlCRm9LdzZkSk5zQ0VLbi9za1M4?=
 =?utf-8?B?b1crUzhRYUlXTk1HdTlBV2VDODNrNW1sYUtkOFIxdXVyQ1JGTDEybDI3TExX?=
 =?utf-8?B?YVBkOWNsRVhLU0hmcFJPdUF0bnAxK0JHQnl6TEcrd1RBTGhNcWY1NHZVNjNl?=
 =?utf-8?B?SkwyT1p5aDNtRUQydUFZQlNNTW0wQVl4V09DVEZJOEw3N09YTnRrT3pCb0R0?=
 =?utf-8?B?Y1V1cjJ3K0VlZUVLME5jK1dXRGMra2FvNWNKa3pUOGtIUTlDamNaWS81VCtq?=
 =?utf-8?Q?CEff3k1zQ9HYOZEPqJLrk0qwPYWT4GrylC826tq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8be0512-5377-456a-0489-08d9665d2ab6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:40:58.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25Yo6GmHyif59EN24d4LFbUIH0rSwr5EOfcWbH/89ArSOAeyEg+QDvB93QYfUdA+4Q5v2GTIl9YuTCliWuB1T9pTkDZvmdaTvGXersMueu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Received-SPF: pass client-ip=40.107.22.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

23.08.2021 15:05, Vladimir Sementsov-Ogievskiy wrote:
> 10.08.2021 17:55, Hanna Reitz wrote:
>> On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
>>> We'll need a possibility to set compress and use_copy_range options
>>> after initialization of the state. So make corresponding part of
>>> block_copy_state_new() separate and public.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   include/block/block-copy.h |  2 ++
>>>   block/block-copy.c         | 66 +++++++++++++++++++++-----------------
>>>   2 files changed, 39 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/include/block/block-copy.h b/include/block/block-copy.h
>>> index 734389d32a..f0ba7bc828 100644
>>> --- a/include/block/block-copy.h
>>> +++ b/include/block/block-copy.h
>>> @@ -28,6 +28,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>>                                        int64_t cluster_size, bool use_copy_range,
>>>                                        bool compress, Error **errp);
>>> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>>> +                              bool compress);
>>>   void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
>>>   void block_copy_state_free(BlockCopyState *s);
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 58b4345a5a..84c29fb233 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -315,21 +315,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
>>>                                        target->bs->bl.max_transfer));
>>>   }
>>> -BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>> -                                     int64_t cluster_size, bool use_copy_range,
>>> -                                     bool compress, Error **errp)
>>> +/* Function should be called prior any actual copy request */
>>
>> Given this is something the caller should know, I’d prefer putting this into the block-copy.h header.
>>
>> However, I realize we have a wild mix of this in qemu and often do put such information into the C source file, so...
>>
>>> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
>>> +                              bool compress)
>>>   {
>>> -    BlockCopyState *s;
>>> -    BdrvDirtyBitmap *copy_bitmap;
>>>       bool is_fleecing;
>>> -
>>> -    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
>>> -                                           errp);
>>> -    if (!copy_bitmap) {
>>> -        return NULL;
>>> -    }
>>> -    bdrv_disable_dirty_bitmap(copy_bitmap);
>>> -
>>>       /*
>>>        * If source is in backing chain of target assume that target is going to be
>>>        * used for "image fleecing", i.e. it should represent a kind of snapshot of
>>> @@ -344,24 +334,12 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>>        * For more information see commit f8d59dfb40bb and test
>>>        * tests/qemu-iotests/222
>>>        */
>>> -    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
>>> +    is_fleecing = bdrv_chain_contains(s->target->bs, s->source->bs);
>>> -    s = g_new(BlockCopyState, 1);
>>> -    *s = (BlockCopyState) {
>>> -        .source = source,
>>> -        .target = target,
>>> -        .copy_bitmap = copy_bitmap,
>>> -        .cluster_size = cluster_size,
>>> -        .len = bdrv_dirty_bitmap_size(copy_bitmap),
>>> -        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
>>> -            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
>>> -        .mem = shres_create(BLOCK_COPY_MAX_MEM),
>>> -        .max_transfer = QEMU_ALIGN_DOWN(
>>> -                                    block_copy_max_transfer(source, target),
>>> -                                    cluster_size),
>>> -    };
>>> +    s->write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
>>> +        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
>>
>> Shouldn’t we keep the is_fleecing check in block_copy_state_new()? We must perform it at least once, but there is no benefit in repeating it on every block_copy_set_copy_opts() call, right?
>>
> 
> I think, it may help if user calls block_copy_set_copy_opts() after graph change
> 
> 

On the other hand, nobody actually call this function after generic graph change. And intended usage is start backup when source is already backing child of target.. Will change it, at least for code be more obvious and not raise questions.


-- 
Best regards,
Vladimir

