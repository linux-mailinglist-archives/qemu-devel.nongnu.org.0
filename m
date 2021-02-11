Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85E318B86
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:07:04 +0100 (CET)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABgV-0005Yu-OY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lABQ4-0008CC-DO; Thu, 11 Feb 2021 07:50:04 -0500
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:56130 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lABPx-0004Ao-A7; Thu, 11 Feb 2021 07:50:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTVytcIMj41jsJb4MFvZWePT9e6ybnTBXbtowgd58CmFW4MM7t+RHTgyfL0ZDLW0mnjKfO6IIXR2YSCDLEprlgARkWwbWPC2NscWudZMEse4rdYifmaKsaeONqcXmUaSCr+LBUv6nQp9uiaIg/sxJC+wnIP5iTKShgmBqBJLkWnknNscqKJaFzqYeouuY1IxGrZY85zFtk95iXPigROqoOmxgLssuKoQdHj3tOPu2F+ts75I5ibUSSzTuAyZcMvCjJ7DNTZkmaTJfYtV/RwjlxKxyECXTStDuAWnbzXUp/xJXJOeHN25fgyip/yHAivzx5BHm9UlHquq/RAPrsVOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQCDpg5y81j2TQQZi52uRdIRAZ+Ikqxm0pfuHgy+Oqc=;
 b=gZVgZESKHWbwMgIPT5GFEd6fFv7sHMtsNAdklEF6TlL+vgx6oTicsJyuKvjRq9Q6L8CTucIt9NbNVmrq1eFNfwd00mx2sw6tNIviDFN6TPCXkE8NcRypBPDebesNwgtNT9YHYK+5cUB0z+lfypzACSPWSJvVOVS7KB0kpKxgvDGb2zfvKsVllF5FRoyVuypHq706d9yLDrKZT3wKWNiGgJQ41/GGMuONNlknWY/8BCKJ0ZBntFEvN60Pjtz8JatyuFVZ6slKrY/Md3E2724d2YKX5vFIXW7MJpZEBUUXW5NaQu3hx3Xxw16CIrY/nVusx+desFCA3c3gdBcuFFQ1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQCDpg5y81j2TQQZi52uRdIRAZ+Ikqxm0pfuHgy+Oqc=;
 b=mDl4VWxKRx5WvZzLwuM4Wmt1LPlBg8pGgohbQXCTVDgPuv/ymCrEq0gGczNB+4MTTbd2XQTU79irR7e1MC3kLfZrTsys5CSM4Z8bZXl5OphL5FaDeNFJJnfoy2xogXdAmw+2tnWq6C2SGr1Q9Z3FNWy6qfT2UH/z5NoYpKbfK3M=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 12:49:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 12:49:53 +0000
Subject: Re: [PATCH 2/7] block/qcow2: introduce cache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-3-vsementsov@virtuozzo.com>
 <741acab7-b641-9b18-c0ae-1a5d149536d7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9ed1dfea-0681-a922-4d2d-3b40c14eae73@virtuozzo.com>
Date: Thu, 11 Feb 2021 15:49:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <741acab7-b641-9b18-c0ae-1a5d149536d7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM4PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:205:1::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM4PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:205:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.12 via Frontend Transport; Thu, 11 Feb 2021 12:49:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68494219-8814-444b-0b04-08d8ce8b8696
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53843B1675CEA87C2F66D73EC18C9@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6m28xVHG2E5fP3m9vOzFOcHimSccmI7bLZ1jqtc9nia7481UaZsR0Yc02OvWvpBZLtH/ZokIZdeC80shq8uupuJfqDNSSERyq0NE3FDeXdcIBcBrelb74lCE3RXPAlP0mp123sfm60wSIiCKVZFG6vkE2G9Sds6yJLChArPfaZ2Eevq0KMhIIgBcLvr5BHbd7Vnbr2B+zWEMHyLFRKBviC27y95k7DuJZmYpUoxH5Qi3f3CrfmyLIjzeT+jrdbTu5P39ZU+FzzBw8WP5qGxb/07GeWLu1dmy1fhpK9Z+jTsBKVL9sgToActPnNmtezS5TQ2K6sPVH6wxlLDcN4GTKT64fSnbRyUGQ8pDiopLb5patenviPsnDiEe0v1/1g5JN9fLO5IHIdW5FHuq9ELDEQgG7qJrVZGXdyH0zbkvZE6RtpyKb78tMJvupcRQrokH1V+/AkIUnYlv7dToN3X9GpskeGXC2lVEw3uKEuiIrs5Ygd/O7YmFjt0gW6pyu9GFPWwjp4xmpjtQ1ysOyEn0Hf9sp9f3aaMKKCeHuifx1ayX8UhpEjItduMO/TmdTmzBcQD5KtagmAs92bj0O+iLNS5rTVQJHD7255Etwst9FCbevZY5RlmKth/D0ePxY/tiqHWQ/tdaxueuBenJASNAE+b82vZVNk5JRgA+OU75FFTAeMRiWYdBFlz+dBLNmeg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39840400004)(346002)(376002)(478600001)(5660300002)(8936002)(31686004)(316002)(30864003)(4326008)(966005)(66476007)(36756003)(107886003)(2906002)(8676002)(16576012)(66556008)(956004)(6486002)(16526019)(53546011)(186003)(83380400001)(66946007)(26005)(52116002)(86362001)(31696002)(2616005)(19627235002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW9qRllINDNEM25MbUYyYWJVbisxMTV4V2lsUU9ScDkrWVBmZis1Vkxjd3BB?=
 =?utf-8?B?QXpkRy8zbmIrZnN6dlcxNTg2elQxYVB6amlMbWRIcG1PbDhwQUdXVGhXWWl4?=
 =?utf-8?B?VWRvcWl5KzdFNDNPdTNGd2pCN1VxV2kyL0FtMHBQSUo2Y3NYUFdUc2hXNXc2?=
 =?utf-8?B?MzRrQ1RDWlM5dndnTVYvUTI4TjJGdUxvQTFXWEh1TmN0S0dWVzRZVk5TaUxW?=
 =?utf-8?B?ZzRyc1FQc1dHa09ZU3dGZTkreThlVHZoaDd6UGlNbGpkZ01nRXJZR2dtOWtU?=
 =?utf-8?B?NFFRdHFFT2hMRUI3LzU5REFJYW9ETWozcDlEZHNVQ3IvZW1oejRtR3lUYVlU?=
 =?utf-8?B?L2FXb0txd1J4dW1zUmEyV3NpSmRKZ2szc09XZ2FvZThCM1V6SUl6M1RoSVc0?=
 =?utf-8?B?M3JSWERjYWtjekN2VDZidEZGNDNkWnZ0U05WU3B3L0Z6bVBLcUp6WFhiNmdE?=
 =?utf-8?B?V1VUSHhwUWVPYjBIUHJiK244dVJNMXdBNTVTeDh0SGhQK3ZuZmQvWVZCVzlK?=
 =?utf-8?B?eWZObCtUbCt0NWVrdS95RE5xU0p0ZHVDdWNPUkxJMHZaV0U2TTR2Z0FQNmR0?=
 =?utf-8?B?aXAySDVSRmIvWG11NUJKQ29jcGltb1BSZ213U3ZtbzNLUThjS3BpcjF2eTQy?=
 =?utf-8?B?RlBWZUlXZ1l1L29PK2ZHMWd6VHRoMXBaQVN1K3NFTHNnbHZFaWltcmlYc1M2?=
 =?utf-8?B?YjFpYWlwZi82cHlhdVZEVEwzUEhiTi9kRjFIWkVSMHRLVzBWK1JGMHdXZTVr?=
 =?utf-8?B?ekQ5OUZVWGFaVUI2MDduMDRkQ2pLR2tuZUpGMTNNazR5WnZKRUpJVW4zY1Jw?=
 =?utf-8?B?NG05ODdiZi9nTWwvSjFVZmdCeGM0NWFqWWgwVFZZRUZyUFBlTy8zZHBTTUxV?=
 =?utf-8?B?a0hsS3ZxY0lITGJjTzJBR2ttOWZYM0FadG8renFZL2xvUVFzUTYzbS9kRTZZ?=
 =?utf-8?B?Wk9zMnNlbHVwM215OXVHRENsVS9nT2dOb09HdGlXTXVaOEtsSE4yWnNPczE0?=
 =?utf-8?B?ZHF2ei9oT05nQTIwMEhxTlAxMGVIbzM2V3NPeGtyT0drUmRRbHlsMlNBOVJS?=
 =?utf-8?B?MTVNY1hRN2daWjZGTFk3bmxqTGFzTG9NeXh2QW94d1drWVJNemNTUzVIVU9y?=
 =?utf-8?B?TXU1c09ZV1JoL294TmZVTjZBUk5hdlBGV2J5Tmt2OTI0NG04Tk4weDJscTBo?=
 =?utf-8?B?TGxrQWc5Y0YrRHBxTFFESHhoY215bVovYWxrdEZ6UFBqanFlSWowMEJkS1NK?=
 =?utf-8?B?ZjRqMHJ0TEpMbjNvVldmeVpwUkRHM2JBZ1JwVjduZFk3T0FrMmd3ZmVZcU9Q?=
 =?utf-8?B?cnlsbDVtTmFjK1lDVGI0b0IyVWVzTjZwNXM4cVRrWTBsWWxwSjJNTG54ZCtj?=
 =?utf-8?B?SlpnaEJJd01BMUFNMFNFeDhOcHlsNGN0eno5OEo0N0Zkb1BRcWNLbHlZWmJT?=
 =?utf-8?B?RzhFTG5nQnhQNGxJMllMNXVTMnp0UDVROXRCU3gyelYzK002bG4rUDJGdGtm?=
 =?utf-8?B?OHBSZStzZ1grRFI1TlYvMDNRRXF1bW80NnFKaTNsS3VsVDBGSjd0b0tqclNR?=
 =?utf-8?B?cUJXbjFLUUZnS3FpMUYweGFYOEJ1Zm9pQ2pmbVhLNVoyazU2Z2hTWlkxN3Fq?=
 =?utf-8?B?OXdIT1BWUDZSaGZvUWIxUnJHNUZNeTRkUFljVFVwTlRBVlluYmVvNnlDakYv?=
 =?utf-8?B?WU5Qd2dKQ05WdFNaem4wZlJySElYY2ZBT1h6MUZpM3NrVWYrQkVYeTBnWmla?=
 =?utf-8?Q?ZD/95oKvKsCFQmctWthexffeA8pBKAbS9CLNMvq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68494219-8814-444b-0b04-08d8ce8b8696
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:49:52.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5LZdWs6trA9UHlXQqmsbYE6Fj8kTXzlIIdrZ+jfOnnMQnOV/69yU47AFTnVGSS31ZBe6+S0VH4rDAlOkFA6PaKYJqd+384LuFipnqHpA9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
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

you may jump first to my last inline answer

10.02.2021 20:07, Max Reitz wrote:
> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>> Compressed writes and O_DIRECT are not friends: they works too slow,
>> because compressed writes does many small unaligned to 512 writes.
>>
>> Let's introduce an internal cache, so that compressed writes may work
>> well when O_DIRECT is on.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/qcow2.h                        |  29 +
>>   block/qcow2-compressed-write-cache.c | 770 +++++++++++++++++++++++++++
>>   block/meson.build                    |   1 +
>>   3 files changed, 800 insertions(+)
>>   create mode 100644 block/qcow2-compressed-write-cache.c
>>
>> diff --git a/block/qcow2.h b/block/qcow2.h
>> index 0678073b74..fbdedf89fa 100644
>> --- a/block/qcow2.h
>> +++ b/block/qcow2.h
>> @@ -322,6 +322,8 @@ typedef struct Qcow2BitmapHeaderExt {
>>       uint64_t bitmap_directory_offset;
>>   } QEMU_PACKED Qcow2BitmapHeaderExt;
>> +typedef struct Qcow2CompressedWriteCache Qcow2CompressedWriteCache;
>> +
>>   #define QCOW2_MAX_THREADS 4
>>   typedef struct BDRVQcow2State {
>> @@ -1010,4 +1012,31 @@ int coroutine_fn
>>   qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
>>                    uint64_t guest_offset, void *buf, size_t len);
>> +Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild *data_file,
>> +                                                      int64_t cluster_size,
>> +                                                      int64_t cache_size);
>> +void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s);
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
>> +                               int64_t bytes, void *buf);
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
>> +                                int64_t bytes, void *buf);
>> +void coroutine_fn
>> +qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
>> +                                          int64_t cluster_data_end);
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s);
>> +int qcow2_compressed_cache_flush(BlockDriverState *bs,
>> +                                 Qcow2CompressedWriteCache *state);
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s);
>> +int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
>> +                                      Qcow2CompressedWriteCache *s);
>> +void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
>> +                                     int64_t size);
>> +void coroutine_fn
>> +qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
>> +                                  int64_t cluster_offset);
>> +
> 
> It would be nice if these functions had their interface documented somewhere.

I tried to comment dificult things in .c... Is there a prefernce, where to document
how and what function does, in .h or in .c ?

> 
>>   #endif
>> diff --git a/block/qcow2-compressed-write-cache.c b/block/qcow2-compressed-write-cache.c
>> new file mode 100644
>> index 0000000000..7bb92cb550
>> --- /dev/null
>> +++ b/block/qcow2-compressed-write-cache.c
>> @@ -0,0 +1,770 @@
>> +/*
>> + * Write cache for qcow2 compressed writes
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
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
>> +
>> +#include "block/block_int.h"
>> +#include "block/block-gen.h"
>> +#include "qemu/coroutine.h"
>> +#include "qapi/qapi-events-block-core.h"
>> +#include "qcow2.h"
>> +
>> +typedef struct CacheExtent {
>> +    int64_t offset;
>> +    int64_t bytes;
>> +    void *buf;
>> +    QLIST_ENTRY(CacheExtent) next;
>> +} CacheExtent;
>> +
>> +typedef struct CacheCluster {
> 
> It isn’t immediately clear what these two structures mean by just their name, because “extent” has no meaning in the context of qcow2.

It's not important for the cache are extents compressed clusters or not.. So I'd keep more generic name

> 
> I understand CacheExtent to basically be a compressed cluster, and CacheCluster to be a host cluster.  Perhaps their names should reflect that.
> 
> (OTOH, the Cache* prefix seems unnecessary to me, because these are just local structs.)
> 
>> +    int64_t cluster_offset;
>> +    int64_t n_bytes; /* sum of extents lengths */
>> +
>> +    /*
>> +     * data_end: cluster is full if data_end reached and ready to be flushed.
>> +     * data_end is absoluted offset, not relative.
> 
> *absolute
> 
>> +     */
>> +    int64_t data_end;
>> +
>> +    bool in_flight; /* cluster is being flushed now */
>> +
>> +    /*
>> +     * waiters: coroutines to wake after flush.
> 
> No, once in_flight is reset to false, which may happen even if the cluster hasn’t been flushed.
> 
> 
> As a note that doesn’t really belong anywhere, I don’t like the current use of this queue perfectly well.
> 
> This is how it is used right now:
> 
> Some context A sets in_flight and flushes the cluster.
> 
> Some context B wants to evict the cluster from the cache.  It sees in_flight, so it gets into the queue.  (If in_flight were not set, B would remove the cluster from the cache.)
> 
> A finishes flushing, resets in_flight, queues B.  Then if flushing succeeded, it will evict the cluster from the cache.  If it failed, the cluster remains in the cache.
> 
> Then B is executed.  If the cluster isn’t in the cache anymore, it’s done.  If still is, it will remove it, and then be done.

all correct

> 
> My problem is that if B were executed right where it’s enqueued (with queue_restart_all()), we would crash because B would see the cluster in the cache, remove it, and then A would have a dangling reference and remove the (freed) cluster again.

But queue_restart_all() doesn't execute B immediately, but only when A yield. And I think a lot of code rely on this.

> 
> So, well, it works, but I personally find it strange to “invoke“ B where you don’t actually want it to run.  I think the @waiters queue should only be restarted once A has had the chance to remove the cluster from the cache, or to be more general, once A no longer has a reference to the cluster.

You are right it looks strange. Why I've written it this way? I dont remember :\ .. Will try to reorder.

> 
> tl;dr: I think the @waiters queue should only be restarted once the reference to the cluster is no longer going to be used.

yes, that will look better.

> 
>>                                                  Must be empty when in_flight is
>> +     * false
>> +     */
>> +    CoQueue waiters;
>> +
>> +    QTAILQ_ENTRY(CacheCluster) next;
>> +    QLIST_HEAD(, CacheExtent) extents; /* sorted by offset */
>> +} CacheCluster;
>> +
>> +typedef QTAILQ_HEAD(, CacheCluster) CacheClusterQueue;
> 
> Why the typedef?  It’s used one time.

Haha, good question. At some stage of developepment I had two queue, separate for complete clusters, and passed these queues to functions.. But I decided that this makes me to go through two queues in same places instead of one and this doesn't make things simpler and safer. So I've dropped it. But typedef was left. Will drop it as well.

> 
>> +
>> +struct Qcow2CompressedWriteCache {
>> +    /*
>> +     * @data_file and @cluster_size are copied from qcow2 state. Not huge
>> +     * duplications, seems better to avoid accessing the whole qcow2 state
>> +     * instead.
> 
> Why?  What if in the future the data_file child can be changed with reopen?

I didn't considered this.. Still it's impossible now, yes? But would be possible in future of course.

> 
> What’s the argument against accessing the whole qcow2 state?  That it’s a layering violation, that we shouldn’t access it while the rest uses it? 

To keep it simple to reuse the cache for something other.

> If that’s a concern, perhaps *data_file should be an indirect pointer to the pointer in the BDRVQcow2State.

Or we should update it on reopen (like cache_size)

> 
>> +     */
>> +    BdrvChild *data_file;
>> +    int64_t cluster_size;
>> +
>> +    CoQueue waiters; /* coroutines, waiting for free place in the cache */
>> +
>> +    /*
>> +     * Cache limits not total number of clusters but total number of active
>> +     * clusters. Active clusters are clusters with non-zero @n_bytes (and
>> +     * therefor non-empty @extents). This is done so we don't need to wait for
>> +     * cache flush qcow2_compressed_cache_set_cluster_end() (which may create
>> +     * cluster with @data_end set but zero @n_bytes), as
>> +     * qcow2_compressed_cache_set_cluster_end() is intended to be called from
>> +     * qcow2 mutex critical section.
>> +     */
>> +    int nb_active_clusters;
>> +
>> +    /*
>> +     * If max_active_clusters is 0 it means that cache is inactive: all new
>> +     * writes should fallthrough to data_file immediately.
>> +     */
>> +    int max_active_clusters;
>> +
>> +    CacheClusterQueue clusters;
>> +};
>> +
>> +/* New extent takes ownership of @buf */
>> +static CacheExtent *cache_extent_new(int64_t offset, int64_t bytes, void *buf)
>> +{
>> +    CacheExtent *e = g_new(CacheExtent, 1);
>> +
>> +    *e = (CacheExtent) {
>> +        .offset = offset,
>> +        .bytes = bytes,
>> +        .buf = buf,
>> +    };
>> +
>> +    return e;
>> +}
>> +
>> +static void cache_extent_free(CacheExtent *e)
>> +{
>> +    if (e) {
>> +        g_free(e->buf);
>> +        g_free(e);
>> +    }
>> +}
>> +
>> +static CacheCluster *find_cluster(Qcow2CompressedWriteCache *s,
>> +                                  int64_t cluster_offset)
>> +{
>> +    CacheCluster *c;
>> +
>> +    assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
>> +
>> +    QTAILQ_FOREACH(c, &s->clusters, next) {
>> +        if (cluster_offset == c->cluster_offset) {
>> +            return c;
>> +        }
>> +    }
> 
> This reads like in any language but C we’d opt for a hash table.  On that thought, why don’t we opt for a hash table even in C?

Agree why not. I just tried to avoid difficulties that can be avoided for the first run.

> 
>> +
>> +    return NULL;
>> +}
>> +
>> +/* Creates "inactive" cluster, which doesn't influence s->nb_active_clusters */
>> +static CacheCluster *cache_cluster_new(Qcow2CompressedWriteCache *s,
>> +                                       int64_t cluster_offset)
>> +{
>> +    CacheCluster *c;
>> +
>> +    assert(!find_cluster(s, cluster_offset));
>> +
>> +    c = g_new(CacheCluster, 1);
>> +    *c = (CacheCluster) {
>> +        .cluster_offset = cluster_offset,
>> +        .data_end = cluster_offset + s->cluster_size
>> +    };
>> +
>> +    qemu_co_queue_init(&c->waiters);
>> +    QTAILQ_INSERT_TAIL(&s->clusters, c, next);
>> +
>> +    return c;
>> +}
>> +
>> +static void cache_cluster_free(CacheCluster *cluster)
>> +{
>> +    assert(!cluster->in_flight);
>> +    assert(qemu_co_queue_empty(&cluster->waiters));
>> +    QLIST_FOREACH_FUNC_SAFE(&cluster->extents, next, cache_extent_free);
>> +    g_free(cluster);
>> +}
>> +
>> +static bool cache_cluster_is_full(CacheCluster *cluster)
>> +{
>> +    assert(cluster->cluster_offset + cluster->n_bytes <= cluster->data_end);
>> +    return cluster->cluster_offset + cluster->n_bytes == cluster->data_end;
>> +}
>> +
>> +static void cache_cluster_remove(Qcow2CompressedWriteCache *s,
>> +                                 CacheCluster *cluster)
>> +{
>> +    if (cluster->n_bytes) {
>> +        s->nb_active_clusters--;
>> +    }
>> +    QTAILQ_REMOVE(&s->clusters, cluster, next);
>> +    cache_cluster_free(cluster);
>> +}
>> +
>> +/*
>> + * Return number of consequtive clusters starting from @first. Store next after
> 
> %s/consequi\?tive/consecutive/
> 
>> + * last extent pointer into @next, store end offset of last extent into
>> + * @end_off.
>> + */
>> +static int count_consequitive_extents(CacheExtent *first,
>> +                                      CacheExtent **next,
>> +                                      int64_t *end_off)
>> +{
>> +    CacheExtent *e;
>> +    int64_t off = first->offset;
>> +    int nb = 0;
>> +
>> +    for (e = first; e; e = QLIST_NEXT(e, next)) {
>> +        assert(e->offset >= off);
>> +        if (e->offset > off) {
>> +            break;
>> +        }
>> +        off += e->bytes;
>> +        nb++;
>> +    }
>> +
>> +    if (next) {
>> +        *next = e;
>> +    }
>> +
>> +    if (end_off) {
>> +        *end_off = off;
>> +    }
>> +
>> +    return nb;
>> +}
>> +
>> +/*
>> + * Write consequtive extents, starting from @firest. Store next after last
> 
> *first
> 
>> + * extent pointer into @next. If align > 1, align end of the whole write by
>> + * zero.
>> + */
>> +static int coroutine_fn flush_consequitive_extents(Qcow2CompressedWriteCache *s,
>> +                                                   CacheExtent *first,
>> +                                                   CacheExtent **next,
>> +                                                   int64_t align)
>> +{
>> +    CacheExtent *e, *end_extent;
>> +    int64_t end;
>> +    int nb_extents = count_consequitive_extents(first, &end_extent, &end);
> 
> I’d prefer nb_bufs, because it will include a tail if present.
> 
>> +    int64_t aligned_end = QEMU_ALIGN_UP(end, align);
>> +    int64_t tail = aligned_end - end;
>> +    int64_t len = aligned_end - first->offset;
>> +
>> +    /*
>> +     * Alignment if for flushing full cluster, first extent offset is always
> 
> s/.*,/The alignment will not exceed the cluster size, so the/?

s/if/is/. When cluster is "full", which means it is filled up to its data_end, the remaining tail is unsed, and we can align it up.

> 
>> +     * aligned.
>> +     */
>> +    assert(QEMU_IS_ALIGNED(first->offset, align));
>> +
>> +    if (next) {
>> +        *next = end_extent;
>> +    }
>> +
>> +    if (tail) {
>> +        nb_extents++;
>> +    }
>> +
>> +    if (nb_extents > IOV_MAX) {
>> +        g_autofree void *buf = g_malloc(len);
> 
> I wonder if this should be blk_blockalign() if first->offset is aligned to the cluster size.  (Don’t know how common that case is.)

blockalign may be better, yes

> 
>> +        char *p = buf;
>> +
>> +        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
>> +            memcpy(p, e->buf, e->bytes);
>> +            p += e->bytes;
>> +        }
>> +
>> +        if (tail) {
>> +            memset(p, 0, tail);
>> +        }
>> +
>> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> +        return bdrv_co_pwrite(s->data_file, first->offset, len, buf, 0);
>> +    } else {
>> +        int ret;
>> +        QEMUIOVector qiov;
>> +        g_autofree void *tail_buf = NULL;
>> +
>> +        qemu_iovec_init(&qiov, nb_extents);
>> +        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
>> +            qemu_iovec_add(&qiov, e->buf, e->bytes);
>> +        }
>> +
>> +        if (tail) {
>> +            tail_buf = g_malloc0(tail);
>> +            qemu_iovec_add(&qiov, tail_buf, tail);
>> +        }
>> +
>> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> +        ret = bdrv_co_pwritev(s->data_file, first->offset, len, &qiov, 0);
>> +        qemu_iovec_destroy(&qiov);
>> +        return ret;
>> +    }
> 
> The write functions are missing overlap checks.  It can be argued that this is done by qcow2_co_pwritev_compressed_task() already, but the idea was to pair all actual writes with overlap checks (i.e., cached writes in qcow2_co_pwritev_compressed_task() wouldn’t need to do a check).

Some more checks will not hurt anyway

> 
>> +}
>> +
>> +static int coroutine_fn cache_cluster_flush_full(Qcow2CompressedWriteCache *s,
>> +                                                 CacheCluster *cluster)
>> +{
>> +    int ret;
>> +    CacheExtent *end_extent;
>> +    int64_t align = MIN(s->cluster_size,
>> +                        MAX(s->data_file->bs->bl.request_alignment, 4 * 1024));
>> +
>> +    assert(cache_cluster_is_full(cluster));
>> +
>> +    ret = flush_consequitive_extents(s, QLIST_FIRST(&cluster->extents),
>> +                                     &end_extent, align);
>> +
>> +    assert(end_extent == NULL); /* all extents flushed */
>> +
>> +    return ret;
>> +}
>> +
>> +static int coroutine_fn cache_cluster_flush(Qcow2CompressedWriteCache *s,
>> +                                            CacheCluster *c)
>> +{
>> +    int ret;
>> +    CacheExtent *e = QLIST_FIRST(&c->extents);
>> +
>> +    if (cache_cluster_is_full(c)) {
>> +        return cache_cluster_flush_full(s, c);
>> +    }
>> +
>> +    while (e) {
>> +        ret = flush_consequitive_extents(s, e, &e, 1);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int coroutine_fn qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s)
>> +{
>> +    int ret = 0;
>> +    CacheCluster *c;
>> +    GList *local_clusters = NULL, *p;
>> +
>> +    /*
>> +     * Make a snapshot of current state: we will not flush clusters created in
>> +     * parallel with flush operations and don't allow adding more extents to
>> +     * staged clusters. We are also protected from parallel flush operations
>> +     * flushing the same clusters.
>> +     */
>> +    QTAILQ_FOREACH(c, &s->clusters, next) {
>> +        if (!c->in_flight && c->n_bytes) {
>> +            c->in_flight = true;
>> +            local_clusters = g_list_append(local_clusters, c);
>> +        }
>> +    }
>> +
>> +    for (p = local_clusters; p; p = p->next) {
>> +        CacheCluster *c = p->data;
>> +
>> +        if (ret == 0) {
>> +            ret = cache_cluster_flush(s, c);
>> +        }
>> +
>> +        c->in_flight = false;
>> +        qemu_co_queue_restart_all(&c->waiters);
>> +
>> +        if (ret == 0) {
>> +            cache_cluster_remove(s, c);
>> +        }
>> +    }
>> +
>> +    g_list_free(local_clusters);
>> +
>> +    return ret;
>> +}
>> +
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s)
>> +{
>> +    int ret, save;
>> +
>> +    save = s->max_active_clusters;
>> +    s->max_active_clusters = 0; /* No more extents */
> 
> Perhaps better “Don’t cache any more extents” / “Don’t cache any more compressed clusters”?

right. or just "clusters", as compressed cluster actually maps to extent.

> 
>> +
>> +    ret = qcow2_compressed_cache_co_flush(s);
>> +    if (ret < 0) {
>> +        s->max_active_clusters = save;
>> +        return ret;
>> +    }
>> +
>> +    assert(QTAILQ_EMPTY(&s->clusters));
>> +    return 0;
>> +}
>> +
>> +/* @cluster takes ownership of @extent */
>> +static void cluster_add_extent(Qcow2CompressedWriteCache *s,
>> +                               CacheCluster *cluster, CacheExtent *extent)
>> +{
>> +    CacheExtent *e;
>> +
>> +    assert(extent->bytes);
>> +    assert(extent->offset >= cluster->cluster_offset);
>> +    assert(extent->offset + extent->bytes <= cluster->data_end);
>> +    assert(!cluster->in_flight);
>> +
>> +    e = QLIST_FIRST(&cluster->extents);
>> +    if (!e) {
>> +        /* inactive cluster */
>> +        assert(!cluster->n_bytes);
>> +        s->nb_active_clusters++;
>> +        assert(s->nb_active_clusters <= s->max_active_clusters);
>> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
>> +    } else if (e->offset > extent->offset) {
>> +        assert(extent->offset + extent->bytes <= e->offset);
>> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
>> +    } else {
>> +        while (QLIST_NEXT(e, next) &&
>> +               QLIST_NEXT(e, next)->offset < extent->offset) {
>> +            e = QLIST_NEXT(e, next);
>> +        }
>> +
>> +        /* Now e is last element with offset < extent->offset */
>> +        assert(e->offset + e->bytes <= extent->offset);
>> +
>> +        QLIST_INSERT_AFTER(e, extent, next);
>> +
>> +        e = QLIST_NEXT(extent, next);
>> +        if (e) {
>> +            assert(extent->offset + extent->bytes <= e->offset);
>> +        }
>> +    }
> 
> I like how in C one always tends to implement everything from scratch.I think adding an element into an already-sorted list is a standard problem, so it’s a shame that it’s implemented from scratch here.  Also that it doesn’t use binary search, which would require a random-access list, so...

Yes, we have g_list_insert_sorted(), but it doesn't use binary search anyway. So I decided to use typed lists as Kevin said they are better.. Still I'm not fun of all these macros.

> 
> Well.  Not sure if it’s necessary.  Probably not.  Although I find it weird to start the search from the front when I’d imagine it’s more likely that new compressed clusters (extents) are added to the back.

Thought about this too, but decided to not care.

1. I think, it's all doesn't really matter, as io write operation is a lot longer than all these opeartions with a list.

2. Still it's interesting :)

When adding extent we want to check that it doesn't intersect with other extents. And we want to have sorted list when flush the cluster.

In GLib there is GTree. It has g_tree_foreach in sorted order. But it doesn't have an option to get neighbours of inserted element (to check intersection), neither it have something like lower_bound and upper_bound :\

Hmm, implementing a tree from stratch is not what I want to do in context of my cache :\  Any ideas?

wow, I found this: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1509

So, 3 months ago all we need was merged into GLib master.. Aha and it's in GLib 2.67.0.. and centos7 has 2.56..

I can add a comment: "refactor using GTree node-based API when it become available (it will in GLib 2.67)"

> 
>> +
>> +    cluster->n_bytes += extent->bytes;
>> +}
>> +
>> +static CacheCluster *find_cluster_to_flush(Qcow2CompressedWriteCache *s)
>> +{
>> +    CacheCluster *c;
>> +
>> +    QTAILQ_FOREACH(c, &s->clusters, next) {
>> +        if (!c->in_flight && cache_cluster_is_full(c)) {
>> +            return c;
> 
> I don’t like it very much that this cache is built as an R/W cache, i.e. that entries are retained until they need to be flushed because a new entry needs space.
> 
> It was my impression this was meant as a write cache, that should speed up specifically O_DIRECT operation.  To me, that implies that entries are flushed once they are done, which is precisely why it works for compressed clusters, because we know when those are done.

We learn that cluster is finished in two cases:

1. when data_end is set and we see that cluster is full. That's a bad place for flushing, as we are under qcow2 mutex.
2. when we add an extent. That's occures during some write operation.. And I don't see real difference, flushing cluster here or when we want to create one more cluster.

And because we don't want to flush at [1], we'll probably have some lost full cluster if flush only on [2]. So, we anyway should flush when want to create new cluster but cache is full. And then no real reason to flush on [2]

> 
> I suppose nobody cares in practice because compression is basically only used for writing out whole images (so displacing clusters happens all the time, and once you’re done, the image is flushed and closed), but it just looks strange to me.
> 
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +/* Cache an extent if there is a place */
>> +static bool coroutine_fn
>> +try_cache_extent(Qcow2CompressedWriteCache *s, CacheExtent *extent,
>> +                 bool *cluster_in_flight)
> 
> Like with other functions, but here especially, I would have liked some documentation on the interface.

will add

>  I suppose the return value reflects whether the “try” worked (so a good guess is possible to me, but it’s still a guess at this point).
> 
> I have no idea what *cluster_in_flight means.

Neither me at this point, I don't remember:) But everything is so obvious when you are writing the code..

Ok, looking forward, *cluster_in_flight means that cluster is now flushing, so please don't even retry to cache this extent!

> I would have guessed it means whether the host cluster touched by the compressed cluster is in flight, but it’s also set when the cache is disabled.  The caller seems to interpret it as “write this immediately”, which to me actually seems wrong, but more on that in said caller function below.
> 
> Perhaps this function should just have an enum return value that tells the caller precisely what to do with some expressively named values.
> 
>> +{
>> +    CacheCluster *c;
>> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(extent->offset, s->cluster_size);
>> +
>> +    assert(extent->bytes);
>> +
>> +    if (s->max_active_clusters == 0) {
>> +        *cluster_in_flight = true;
>> +        return false;
>> +    }
>> +
>> +    *cluster_in_flight = false;
>> +
>> +    c = find_cluster(s, cluster_offset);
>> +    if (c && c->in_flight) {
>> +        *cluster_in_flight = true;
>> +        return false;
>> +    }
>> +    if (s->nb_active_clusters >= s->max_active_clusters &&
>> +        (!c || !c->n_bytes))
>> +    {
>> +        /*
>> +         * Cache is full, we can't allocate a new cluster and can't activate
>> +         * existing inactive cluster
>> +         */
>> +        return false;
>> +    }
>> +
>> +    if (!c) {
>> +        c = cache_cluster_new(s, cluster_offset);
>> +    }
>> +
>> +    cluster_add_extent(s, c, extent);
>> +
>> +    if (cache_cluster_is_full(c)) {
>> +        qemu_co_queue_restart_all(&s->waiters);
> 
> This interface is unclear.  The documentation of s->waiters says to wake them up once there is a free space in the cache, but that isn’t the case here.  It’s true that it’s easy to make a free space (by flushing the full cluster), but there is no free space.

Problem is in documentation, will fix.

> 
> This also ties in to my uneasiness about how full clusters aren’t flushed immediately.
> 
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/* Takes ownership of @buf, don't free it after call! */
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
>> +                                int64_t bytes, void *buf)
>> +{
>> +    int ret;
>> +    int i;
>> +    CacheExtent *extents[] = {NULL, NULL};
>> +    int nb_extents = 0; /* number of non-NULL elements in @extents */
>> +    int64_t e0_len;
>> +
>> +    assert(bytes > 0);
>> +    assert(bytes < s->cluster_size);
>> +
>> +    e0_len = MIN(bytes, QEMU_ALIGN_UP(offset + 1, s->cluster_size) - offset);
>> +    extents[0] = cache_extent_new(offset, e0_len, buf);
>> +    nb_extents = 1;
>> +
>> +    if (bytes > e0_len) {
>> +        int64_t e1_len = bytes - e0_len;
>> +        /*
>> +         * We have to allocate a new buffer, so that clusters are independent
>> +         * and can free their extents when needed.
>> +         */
>> +        void *e1_buf = g_memdup(((const char *)buf) + e0_len, e1_len);
>> +
>> +        extents[1] = cache_extent_new(offset + e0_len, e1_len, e1_buf);
>> +        nb_extents = 2;
>> +    }
>> +
>> +    while (nb_extents) {
>> +        bool do_write = false;
>> +
>> +        for (i = 0; i < 2; i++) {
>> +            CacheExtent *e = extents[i];
>> +
>> +            do_write = false;
>> +
>> +            if (!e) {
>> +                continue;
>> +            }
>> +
>> +            if (try_cache_extent(s, e, &do_write)) {
>> +                extents[i] = NULL;
>> +                nb_extents--;
>> +                continue;
>> +            }
>> +
>> +            if (do_write) {
>> +                ret = bdrv_co_pwrite(s->data_file, e->offset, e->bytes,
>> +                                     e->buf, 0);
> 
> Is this safe?  do_write is set if the host cluster touched by this extent is in flight.  Because it can’t be full, it must currently be in the process of being flushed by cache_cluster_flush(), which flushes all consecutive areas with flush_consequitive_extents().  If the underlying file has some request alignment (which it tends to do with O_DIRECT), then those writes are likely transformed into RMW operations spanning more than their precise byte range.  Isn’t it possible that one of those RMWs then intersects with this write here?

Hmm. I thought that if user writes to in_fligth cluster, it's wrong anyway, so we should not care.. But it may be not-full in-fligth cluster because of previous "flush" operation.. And in this case we should wait until it flushed.

> 
> If the host cluster is in flight, shouldn’t we just wait until it’s flushed?

agree

> 
>> +
>> +                cache_extent_free(e);
>> +                extents[i] = NULL;
>> +                nb_extents--;
>> +
>> +                if (ret < 0) {
>> +                    goto out;
>> +                }
>> +            }
>> +        }
>> +
>> +        if (do_write) {
>> +            /*
>> +             * We yielded during second extent writing. Probably the cache is
>> +             * already free and we can now cache the first extent.
> 
> Where do we yield?  Do you mean it probably takes time to do the write, so it’s possible that if do_write is true because some cluster was in the process of being flushed, it is now removed from the cache, so we have a free entry?
> 
> Why not just check for whether we have a free entry?

and we do it, moving to try_cache_extent at start of loop..

> 
> Also, it’s possible that do_write is true just because the cache is disabled, which I guess is handled fine because then both extents will have been written to disk, so that nb_extents is now 0...  But that behavior isn’t documented here.
> 
>> +             */
>> +            continue;
>> +        }
>> +
>> +        if (nb_extents) {
>> +            CacheCluster *cluster = find_cluster_to_flush(s);
>> +
>> +            if (cluster) {
>> +                cluster->in_flight = true;
>> +                ret = cache_cluster_flush_full(s, cluster);
>> +                cluster->in_flight = false;
>> +                qemu_co_queue_restart_all(&cluster->waiters);
>> +                qemu_co_queue_restart_all(&s->waiters);
> 
> Looks weird to wake up other waiters here, because we are very likely going to take that spot, so it’s likely that nobody will be able to make use of it after we took another iteration.
> 
> It’s also weird because it’s different than the two other places which wake up s->waiters not if there’s a free space, but if a free space can be made by flushing find_cluster_to_flush().  As in, this is the only place where the queue is used as it is documented.

Sorry me. I'll come back with better documentation for v2

> 
> I think this again ties in with the question whether we shouldn’t flush clusters as soon as they are full instead of waiting until we need another free entry.

The only reason is what I've said above about qcow2 mutext.. We should not do extra things, when data_end of cluster is set. And that's why we'll have postponed clusters anyway.

> 
>> +                if (ret < 0) {
>> +                    goto out;
>> +                }
>> +                cache_cluster_remove(s, cluster);
>> +                continue;
>> +            }
>> +
>> +            qemu_co_queue_wait(&s->waiters, NULL);
>> +        }
>> +    }
>> +
>> +    ret = 0;
>> +
>> +out:
>> +    for (i = 0; i < 2; i++) {
>> +        cache_extent_free(extents[i]);
>> +    }
>> +
>> +    return 0;
> 
> return ret, I think.
> 
>> +}
>> +
>> +int coroutine_fn
>> +qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
>> +                               int64_t bytes, void *buf)
>> +{
>> +    CacheCluster *c;
>> +    CacheExtent *e;
>> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
>> +
>> +    c = find_cluster(s, cluster_offset);
>> +    if (c) {
>> +        QLIST_FOREACH(e, &c->extents, next) {
>> +            if (e->offset == offset && e->bytes <= bytes) {
>> +                memcpy(buf, e->buf, e->bytes);
>> +                return 0;
>> +            }
> 
> Again, reads like it should be a binary search.
> 
> I suppose e->bytes < bytes is OK because the only caller of this function is qcow2_co_preadv_compressed(), which passes a maximum length, effectively.  But then I’d call the parameter accordingly (i.e., max_bytes) and zero out the tail.

OK

> 
>> +        }
>> +    }
>> +
>> +    return bdrv_co_pread(s->data_file, offset, bytes, buf, 0);
>> +}
>> +
>> +/*
>> + * Caller states, that there would be no writes to this cluster beyond
>> + * specified @cluster_data_end. So, it's OK to flush cluster when it is filled
>> + * up to @cluster_data_end and it's OK to align flushing write operation up to
>> + * some alignment (not greater than cluster_size of course).
>> + */
>> +void coroutine_fn
>> +qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
>> +                                          int64_t cluster_data_end)
>> +{
>> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(cluster_data_end, s->cluster_size);
> 
> If cluster_data_end is aligned to a cluster boundary (I don’t think the caller does that, but...) this will do nothing, so cluster_offset is likely to be one cluster too high.

well add an assertion

> 
> I wonder whether we should assert that cluster_data_end is not aligned to the cluster size, or whether we should use cluster_data_end - 1 here, or whether the caller should pass cluster_offset.
> 
>> +    CacheExtent *e;
>> +    CacheCluster *c;
>> +
>> +    c = find_cluster(s, cluster_offset);
>> +    if (!c) {
>> +        c = cache_cluster_new(s, cluster_offset);
> 
> Is this case reachable?  How?

Ooops... I feel stupid. Great thing that you asked this question!

Somehow I thought that already allocated clusters may be in progress of... what? compression? writing?.. But actually allocation is of course done after compression. So we may compress clusters in parallel, but than they allocated and written sequentially. Of courese without the cache the writes themselves may go in parallel. But write to cache is immediate and doesn't yield. We even can do it before unlocking qcow2 mutex to be sure that we don't switch to another coroutine to write next extent first.

Seems I was wrong, and all this can be a lot simpler. Very sorry for your time. But it helped me to open my eyes :\


-- 
Best regards,
Vladimir

