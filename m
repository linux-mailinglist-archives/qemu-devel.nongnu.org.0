Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58438B33C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:27:35 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkaE-0004X7-Rd
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkXG-0000CV-Po; Thu, 20 May 2021 11:24:30 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:17849 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljkX7-0006uQ-26; Thu, 20 May 2021 11:24:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f74BDTUGi5wakSCyZ9MtMxa876X/sNNxP9WRkP0rFOVPeUHRdMg13qKIse244WE7AAxQxchozVCO56TMjNCYO55AoWlMRCDbuyUPIgsy/ErJ4Ao1/V/s06VePm6RwHtAhqdK/P/oD1CaPOtzxUf9umJJSQlknUYaZBoGtVj+R6DcvtzSmayeTXXfn8faXxCERQh7VphW9f6CAJEMyUfGfSb6s+ajkXs05ZBj0igpRFBSZxZYGgmbDsHoTVBNK2ODi+89C1h9m46VjrS9b8MKIj0Sfk/QgseKmiba1CmlSxOMKewQv1SIwlWBYTHMfNpaLf0BUmR9nFkuLhxVVRwnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T62lxW/CzAsPjRStCuEKbfue5aVLypTraGm9g7UX11E=;
 b=ipcIhnzo5cDb/JdoYZtsHZq0kQC0Y+/1jR1lWyzwkpRrbjzM7bElbbyEWP3E0vprL2xgMXz3QzeJrszJCqiz78sw72IMhB1uYwvH8SA35Bfjs0jBlVX0e3Zdqw68hhbUOs9kD7f9F0yOSLcKQdL9Asx54wVha1XdZklKjMAy3G3B7C+yvbpNvZpg2+s7kLSz/CFxrNpuiQvxHCEy0O7mhQWW131bnkA1nhvcchTVmxNPYfdRMBMAUX8q+tMQLhTk81yY/p9O9Dx7Apkg/A4zHq9uYZxE/ZynX1H+JiiLV/YOxg/YEK1b51+7jKCujO1est7/oX13i0P1MPZWWU8ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T62lxW/CzAsPjRStCuEKbfue5aVLypTraGm9g7UX11E=;
 b=pudX9tj4UOMLBiiF6uekn2W9LkVwd7ycyeaxNCXOW7mmtQ0VRj/Z5DVuDSAQoCG+HHzhRCIbFd0spsJgsjh3OGjX5dAWtYKmADTRD6suWHep8Hm2szVUIBfsqY1yYqzgUw/1uqeLy2wcgg2rSq36492rLRC9sJlSJ02FuhH1Jjk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 20 May
 2021 15:24:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:24:16 +0000
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
 <a2964e8e-f452-8bd7-3bdb-0a8e963430a3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a2ba6aef-230f-f710-829f-edca5f806e48@virtuozzo.com>
Date: Thu, 20 May 2021 18:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <a2964e8e-f452-8bd7-3bdb-0a8e963430a3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: AM0PR08CA0033.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 AM0PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:208:d2::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 15:24:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca91c8a-d6dd-4247-3efe-08d91ba3547f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551C90E95964839B768BED4C12A9@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGNVzIh6pQ6F3kmTaJAbKSGRrbYsJh4/UfiiLTxN3vV6vMeOiXVSmwgUqBO/qMx2Ox0qmnxRIxDMPGLERwim15BaZl0YTYQnFnmS95pDdwKQeg0G0BEHvyvLU487Jw6dQbo13jpyGIMdcyrTrJzOrIRA+ycr9Wh8aKx2o6Wjsg5Fxk4atmZIVdzTqhhSpIHmS+fExiDHhrceSiHrwr+0uYcA5IO3FgWyIlkgKN+2urMKQ5uR0BWC8NSZs2WiNFGGHIqvf0fkn/w4HrU1c+xqZYqtnHchqbXb+VQrBSHMf3aBDuKWgd8RBVkVbxGONRXHp1Mmp8rDmKUECBqsM9XmxM8ysqCLXyD5z6BViCWAPQupF07gY/X5n90huX6TGn1riil3mpOffXCoinlpy3QNOHIWmTVcMxQXFVYbFPJh6F3jSihDDrbA7dqhPcYMPTZGeLcY+gVNM27wHAl1O0J2pjD/SePOpn6K222SpglENkybmCBUZ064tVH2fTfSR0CAJpyKoRBKh4owHYsmqh/ZJElYa7qPz9R2hXcWi/QoHHOA+4LxAiCGGA5feNsswucmF3F7c8gciWPLboSPvgCVJdFUPlCNr32aBA2sjoII1vSzmSAbdZSFbo/Ek5xG8hoyXb1SMfcfEwmOVwYDUATca1rv4u7ppotxVAhBXxRTKJm6S5wU5ijkZpcSBzFr15iVgxbAyKJerDXF0vvhbjsgWFeekwhdkHiwtBPuSN470hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39830400003)(31696002)(86362001)(38100700002)(38350700002)(478600001)(31686004)(53546011)(26005)(66476007)(66556008)(2616005)(956004)(6486002)(4326008)(54906003)(36756003)(8676002)(2906002)(83380400001)(16576012)(8936002)(52116002)(316002)(66946007)(16526019)(186003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmtvVlMrenlDcUh5RzBwa2hBME05d1gvbGhhR3NXR20yODRZakRzaE9Ia2ZE?=
 =?utf-8?B?YmNFdmZ6ZWxlME1PM2R6TnRxR2xjOXVHN2htaEptQWd4S3YwSkNMYlgraXhE?=
 =?utf-8?B?dUhPb2JxVkhsa2hHbS9nQ0lkNVRFZDF4RTIzUUhaMnRaVnQ1cm5ZeWRjMHlQ?=
 =?utf-8?B?dGFsRXVmTnVsUWZXQjQzbkhIYldnMDlaWTU1alVEVnBwNXJxcUhQcW1TeVp2?=
 =?utf-8?B?Y2tIcSswTnpwdGhZRjA3eUFrTHZWMVpCdnZUWDNFeEM3ajljbnovemxlb3Ro?=
 =?utf-8?B?NU9UUUozcGFLby84Uk9PWEhtQnZKb283ejM1Z09INFpLUDdMK2lrcUN3V2FR?=
 =?utf-8?B?cVprS1E1ZE55UjdibU1ZRGMrdHRCaEkvUUdiUDdNdnpDUTQ0SEZXdDJnNGpy?=
 =?utf-8?B?QWxTcC85c0cvZ1Q5WXRUbjRwcldxSE9QOVZCSStZb2JHc04rbjZhOWhVME9J?=
 =?utf-8?B?NE1ibmNYaHNFMFpac2IybHZsbWJGZkFLWk93RnJJaDloNGV2N0M2RzcyUzdR?=
 =?utf-8?B?YW5LZ0VFSTZOOTJrMHpFWE9xRTFJV0FKS2FNaFVJUjJYM2JFWHNDMnJud2FE?=
 =?utf-8?B?bjlUdG10MUxyWkRwcjhCSW1tV29lVVV6YWUyUGR6V2VzSzR1S0xUZVAwYmor?=
 =?utf-8?B?VzRjRXBQRTdISDF2OGlvNjgzcTNpNzJ6QWRNYnJnMEd6SER0Y09qaEVxWE9r?=
 =?utf-8?B?TlV4Szk5S3h2YU1FK1h0N0oyTTdVUmJ2T2l5OW5vSjhSNzlRcGY0eE4zeWc4?=
 =?utf-8?B?L3FQUnNPclR0RWlnZ0VDOEs4aGUxaFdTVmR1bW9xODBKNkk4dS83eHdoeXB6?=
 =?utf-8?B?VlVVdVZULzBBTllsK0FweHhaRzFSQXBhQjczVGF2QUdSWDdOTkk0UkJCbnBl?=
 =?utf-8?B?cVlkYUlxWDc3MzlxUmlnODg0QU1rSDNEMnNEeDZCekZzdXNqWE9Bb2RYQ0sr?=
 =?utf-8?B?NEhxSXZBRHB5ajZxakNHWlVpaXhVRFhmbXF4OUhsZG84Y1IvNUpUTjR4Qllr?=
 =?utf-8?B?MC9scnhRa25OS2xLd01WOUlXQW1Oa1M5b3FzNEtRZzJSNVAwd0lYdm9RWTFB?=
 =?utf-8?B?R0hYMFFmTEJBVVFOczhGMmdzVllaZXlGKzFyUnNtWEtEOGdibU5OVmhCcEM5?=
 =?utf-8?B?Y29ySWlrSUZHS29YZzRCNzlITmZBeXFmekRwVW9oRjdtRGFTd3ZsalM3czk1?=
 =?utf-8?B?eXZhamVxTU9Uc2J3YkVWTHFQQmdHK3JIdklRUUtSUTYxMkErbkVBRWZtRmpW?=
 =?utf-8?B?ZlhIYmFQTWEwMldWVGhDVDBQT1lnajBCSTdMR0tibjFDKzZ6VkRXWUdZaWxH?=
 =?utf-8?B?S283UjJUcExqY2NjQm5QZEY2TVJmcm91Vm9pcm9KTFBYSnJpQXJnK0RKTE04?=
 =?utf-8?B?NHF4WFNmSUpmdzVWYVlESEJKR3o4NDEwL3IvT1JDUVlCWUZ2TGJMaGhnd2lD?=
 =?utf-8?B?YkF0Q083YTF3RVg4VkVpK3h2UmpDU2RJWk9LOGZ2WXlxTElTb1A3Y3h2bnk3?=
 =?utf-8?B?V2ZETGRESktmVEVSaHBWUC8zeGczN3VRejd6QWtDQWtYUnVLQ2VRbGE1b2tQ?=
 =?utf-8?B?eEtSS3prZ0NPdGxwQjVNSG9FL01FTnpGS0t3cnQyQ0pxcEc5WlplL1V0NjJY?=
 =?utf-8?B?bDJEaDBIVGZsMHFkc0VTNTdIWng0Zlo0RDFRdTgyMVBOQVNaYlhPcjJ3T2x6?=
 =?utf-8?B?Q0ZNb1JwVUlLY21KeUNJTmROdFA4L2xsRW56Y3owUXVVN2pZMGdadTF0TXds?=
 =?utf-8?Q?ksrWnYW8NI0ptkq6JrXIQdqpvHokZRXrkPC9p9h?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca91c8a-d6dd-4247-3efe-08d91ba3547f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:24:16.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +88/i4Yufl1OkRMMjpJ5nToA4uSgPVEA70zXp+NIYc38zCQSI2hoOSUTM9pr2Mge5dHNkY00LDKXoc3aAsFwIaBJJG0raXC8gVv2HjVGSlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.20.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

20.05.2021 18:06, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 20/05/2021 16:42, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> Put the logic to determine the copy size in a separate function, so
>>> that there is a simple state machine for the possible methods of
>>> copying data from one BlockDriverState to the other.
>>
>> Honestly, for me 4-state state-maching + function to determine copy-size doesn't seem better than two simple variables copy_size and use_copy_range.
>>
>> What's the benefit of it?
> 
> It helps having a single field (method) instead of two (use_copy_range, copy_size), especially if we need to take care of protecting it for concurrent access. See patch 7.

What's the problem with protecting two fields?

(me looking at patch 7) What's the reason of introducing atomic operations? It makes things more complicated (we have two synchronization mechanisms (mutex + atomics) instead of one (mutext)), with no benefit.

>>
>>>
>>> While at it, store the common computation of block_copy_max_transfer
>>> into a new field of BlockCopyState, and make sure that we always
>>> obey max_transfer; that's more efficient even for the
>>> COPY_RANGE_READ_WRITE case.
>>
>> hmm, maybe. It could be a separate patch.
>>
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------
>>
>> stats agree with me, that its' not a simplification.
>>
>>>   1 file changed, 39 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 37c8e8504b..10ce51a244 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -28,6 +28,13 @@
>>>   #define BLOCK_COPY_MAX_WORKERS 64
>>>   #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
>>> +typedef enum {
>>> +    COPY_READ_WRITE_CLUSTER,
>>> +    COPY_READ_WRITE,
>>> +    COPY_RANGE_SMALL,
>>> +    COPY_RANGE_FULL
>>> +} BlockCopyMethod;
>>> +
>>>   static coroutine_fn int block_copy_task_entry(AioTask *task);
>>>   typedef struct BlockCopyCallState {
>>> @@ -85,8 +92,8 @@ typedef struct BlockCopyState {
>>>       BdrvDirtyBitmap *copy_bitmap;
>>>       int64_t in_flight_bytes;
>>>       int64_t cluster_size;
>>> -    bool use_copy_range;
>>> -    int64_t copy_size;
>>> +    BlockCopyMethod method;
>>> +    int64_t max_transfer;
>>>       uint64_t len;
>>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
>>>       QLIST_HEAD(, BlockCopyCallState) calls;
>>> @@ -148,6 +155,23 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
>>>       return true;
>>>   }
>>> +static inline int64_t block_copy_chunk_size(BlockCopyState *s)
>>
>> "inline" word does nothing in static definitions in c files. Compiler make a decision independently of it.
> 
> Typo
>>
>>> +{
>>> +    switch (s->method) {
>>> +    case COPY_READ_WRITE_CLUSTER:
>>> +        return s->cluster_size;
>>> +    case COPY_READ_WRITE:
>>> +    case COPY_RANGE_SMALL:
>>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
>>> +                   s->max_transfer);
>>> +    case COPY_RANGE_FULL:
>>> +        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>>> +                   s->max_transfer);
>>> +    default:
>>> +        abort();
>>> +    }
>>> +}
>>> +
>>>   /*
>>>    * Search for the first dirty area in offset/bytes range and create task at
>>>    * the beginning of it.
>>> @@ -157,8 +181,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>                                                int64_t offset, int64_t bytes)
>>>   {
>>>       BlockCopyTask *task;
>>> -    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
>>> +    int64_t max_chunk = block_copy_chunk_size(s);
>>> +    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
>>>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>>>                                              offset, offset + bytes,
>>>                                              max_chunk, &offset, &bytes))
>>> @@ -265,28 +290,27 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>>>           .write_flags = write_flags,
>>>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
>>> +        .max_transfer = QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
>>> +                                        , cluster_size),
>>>       };
>>> -    if (block_copy_max_transfer(source, target) < cluster_size) {
>>> +    if (s->max_transfer < cluster_size) {
>>>           /*
>>>            * copy_range does not respect max_transfer. We don't want to bother
>>>            * with requests smaller than block-copy cluster size, so fallback to
>>>            * buffered copying (read and write respect max_transfer on their
>>>            * behalf).
>>>            */
>>> -        s->use_copy_range = false;
>>> -        s->copy_size = cluster_size;
>>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>>>           /* Compression supports only cluster-size writes and no copy-range. */
>>> -        s->use_copy_range = false;
>>> -        s->copy_size = cluster_size;
>>> +        s->method = COPY_READ_WRITE_CLUSTER;
>>>       } else {
>>>           /*
>>>            * We enable copy-range, but keep small copy_size, until first
>>>            * successful copy_range (look at block_copy_do_copy).
>>>            */
>>> -        s->use_copy_range = use_copy_range;
>>> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>>> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>>>       }
>>>       ratelimit_init(&s->rate_limit);
>>> @@ -369,30 +393,25 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>>>           return ret;
>>>       }
>>> -    if (s->use_copy_range) {
>>> +    if (s->method >= COPY_RANGE_SMALL) {
>>
>> I don't like such condition:
>> 1. it forces me to go to enum definition to understand the logic
>> 2. it's error prone: it's very possibly to forget to update it, when updating the enum, and logic will be broken.
>>
>> No, I don't like moving to state machine for this simple thing.
>>
>>>           ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
>>>                                    0, s->write_flags);
>>>           if (ret < 0) {
>>>               trace_block_copy_copy_range_fail(s, offset, ret);
>>> -            s->use_copy_range = false;
>>> -            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
>>> +            s->method = COPY_READ_WRITE;
>>>               /* Fallback to read+write with allocated buffer */
>>>           } else {
>>> -            if (s->use_copy_range) {
>>> +            if (s->method == COPY_RANGE_SMALL) {
>>>                   /*
>>>                    * Successful copy-range. Now increase copy_size. copy_range
>>>                    * does not respect max_transfer (it's a TODO), so we factor
>>>                    * that in here.
>>>                    *
>>> -                 * Note: we double-check s->use_copy_range for the case when
>>> +                 * Note: we double-check s->method for the case when
>>>                    * parallel block-copy request unsets it during previous
>>>                    * bdrv_co_copy_range call.
>>>                    */
>>> -                s->copy_size =
>>> -                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>>> - QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
>>> - s->target),
>>> -                                            s->cluster_size));
>>> +                s->method = COPY_RANGE_FULL;
>>>               }
>>>               goto out;
>>>           }
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

