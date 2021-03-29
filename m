Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5634D8F8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 22:20:02 +0200 (CEST)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQyMi-0006nx-Hj
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 16:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQyLf-0005yw-O9; Mon, 29 Mar 2021 16:18:55 -0400
Received: from mail-eopbgr50131.outbound.protection.outlook.com
 ([40.107.5.131]:28994 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQyLc-00055N-IN; Mon, 29 Mar 2021 16:18:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCGxIJRMPkdlObSiZVebj1L05nK1/Hd1eFQBJYAMd04gkFHVi8Rbat0Cjzt/hR7GJuWoV8pwV95TrNjK/fxcJcdkgOxzxx679Pdmm+K+ZzCtEPlARo3ZTpTG0wKIkRNgLC8x5yWQa/dL2kzCZTzFwJHJNUj7moe7snP+KK8uyYFsUyF0JsBz8spFb580Nhg+dNkCXouSNUEFuRevnRBBirktgjlHPaC0FkdNz9ojzxnEiwXJTbR7fvaM14HoNVQY0jRKufCeF0zLTlAe+bqcEInDKLUqRMk1dwhCKuI97L6ievsaBrJvLEwLchl35FvndIyKyoTWsT8r1JmZW3euwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAO/mtWEqhkQLBb+AwTKG3c395RJ0H+ItTlIWqnofy8=;
 b=XnXtaDBiicezu1tNEKi70o1EtZjC37mpuZuZuZC+rw//L/CcyPIIzW360oFnG3lcQXe0KipOgbXcVpLD9Ea3RUysVziwC5vXbke/4o37O7lHXSYVgJWXaeNLZKJXWWLpZ4QvvfxyNOW88G721r0E8LbkDp/EqzloCXPgsnHZmmniRFbbI24GeqpSN0rU9U1zxUE1HKOtZwcDU8Pa15o61IfPSNUKfHojlzOwXvlp5sxKAEPcVCQOPyf1ITQsTW4t2x3szH292OmGClhVsEjiBdTw87Ja76x8hPLYQPlFdbF31Fv8n6BQX8DGbYciEdmpTdK7xmldb1dCdP4b516HEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAO/mtWEqhkQLBb+AwTKG3c395RJ0H+ItTlIWqnofy8=;
 b=a25BIqUp+ezO171bb72Vuij1KT5TYzRVY3xii3KqWIEyI21RUKtOKnxIfeB32i7SxTAmit+YhaR1m0Gg5J24a02VkH8Km+raHdrzcw6Pl+J+FQ0AOnDDmHKSsTxeWl8A6uou9cKY/c2f/dDwjYVd8AQZgijDbvZuBOxZ6ewZ238=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5208.eurprd08.prod.outlook.com (2603:10a6:20b:eb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 20:18:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 20:18:48 +0000
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8c702bb9-416f-ada9-4691-22f37d82b2b8@virtuozzo.com>
Date: Mon, 29 Mar 2021 23:18:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:208:d2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 20:18:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd986f5-2831-48bf-5568-08d8f2efdc3d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5208:
X-Microsoft-Antispam-PRVS: <AM6PR08MB520809435D15EF3D10C2721EC17E9@AM6PR08MB5208.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzReA3UB/8q51lBtS+r9cwnKJfkKWyCeuGSjUjIBzDD2/VfQPXw/3hV4NIkH7+C2f79ud1/8VDJDmfmDQi/g6mJWsu3AXYwZD4De29rMKy3QlgUgyHQ8CB2++vB+9HNAsCATgKiBCqpatzC1GN+1xlvmjb6aeD510XJeHgeHriGHVnctEWU+mFQw9ROH9Lprl8wSpb/OP9J1oPdQmnaRnzxEVWL7XUuQIBc547uOgI0v6PZTWyWtuGDWhzAh9FPXdRaBCJV6pWcXHRLc6uGci1bQlpKqQHLuxLG9RTlK75wT9qPJQObs5cKta+mh7rPcp5HggMbdO1cJKu/bwWOrjiHzF2BMe5hhj/w7tGYzVSbM8Nj7ZxZBSmx2PFVYh0r8x9LDQVYOCSGJ0DjxCPs/+SneugmIGJE2n26bgj1+6VCgMZ8f4usU3umgl3mn8Ql3le4jSDoO5UCwgn/eHtHncQMtDNXZFSP2rL0oZl0vTVfnSn3tGCSse4STNpdzExa4+GCP6woxxZXkGcI5aIAAaIlhzm1nwWX+UIYAfTxdX9/mKw87zW192pGqEgV1A2ajNMtQi2oO9F1iiqAHnXDQq0PiW4YITkasEZF91P+/deISqnbfxSJIuU2aniPc8rrByBG+R5ZOsiqmsq5kBkwDTiZjiOM0o3mrxDRoRsOYiQAhpC5hoBNzttmnG2QOSJiDwUq+zrv+TUvuq41icMXiY6iPo9lRvR505iwrTPe+cDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39840400004)(136003)(16576012)(316002)(86362001)(5660300002)(2616005)(66556008)(66476007)(53546011)(38100700001)(31696002)(52116002)(8676002)(8936002)(6486002)(31686004)(956004)(16526019)(2906002)(26005)(186003)(4326008)(478600001)(83380400001)(66946007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3JwS3lQQXVMdVFLT3F3RTdidGQxUzB1UUpaTXlzWStRUnJMU2dyQytueWNG?=
 =?utf-8?B?SzVkUEtSLy8vR0l4RVl6K0JXcGcveXFkVWU5bTBKeldDUXIyWWNOVXVnL3E1?=
 =?utf-8?B?enFURUl4V0Y2bzZMSndTK1lkek8xYkdOMWR3ZktIY3RSZHl0c3FyWVo5YTFW?=
 =?utf-8?B?MWxEQ3RNZWNQVmZlaGJ6empIdGtqZ1dCdzZuWjM3cXl3SWNjanQ2S281T0VE?=
 =?utf-8?B?MDZsc3BKUzRqN25JMCtMbTVVRmVRNThXMVhKeGpnWlJEeUU1YnMra0ZYb0hM?=
 =?utf-8?B?dThKaC94L21hbGhHc1pRMHRmZndCbnduVE12cGJjd05NemZQSVdPbG5tTEI0?=
 =?utf-8?B?YkF5cFNJUk5LYVp5Uk1XbzFGVlQzRlJ3eHVpNzJ0a1JpblBIdUdZYlJ3RmlK?=
 =?utf-8?B?YUJ6Y3pld0xyOVBkWVRzOENiTWFLVzZKaWFjNXV3TGpyV3BueTFYWU5tTFhK?=
 =?utf-8?B?NndZVThITVNpY2FNTEwxK3N5emRnRkdUVm9vbmp2M1FIN1pIS25RejRtc0xS?=
 =?utf-8?B?NmNidzZRYkk4dmdrWk9qVHh1elNMcTBwRndCNU5lRHYySnIrQk91Z0Z1czdB?=
 =?utf-8?B?MzRJUEh0Q1BNTCtOMlJsNlpCM3N2ZGlXUHNqZ3NCZnViWUNLeW5LT3NvQ2pO?=
 =?utf-8?B?cTl5VUlWc081K294OCtCZ1BhUCtGdCtiaEJtTDl1VStNeGdzRzJqR1pQYlpL?=
 =?utf-8?B?QjRtM05QS0k3bExCMjZvaU1XK3V1Y3U1Rng1NldoZGpGVjA1bzdBRUJFUHp0?=
 =?utf-8?B?Q1NxS2pZbExVNnVyN1BBK0hMeFp2bXpoSlNEdm5hOEVDLzkyTWRwUDFLRXND?=
 =?utf-8?B?Szl5VDdmc2xsQVdEaWt1MHh6K1p2RTNhMlRPcVNtMUduSWZGaGZ2ZHFSd28w?=
 =?utf-8?B?NnBYVWoyOFRuSE9CRmlxaFJzWW12Ukh6bllXVzhYQlQxZWpsUGRkOURZamNp?=
 =?utf-8?B?dnRjM2drK2dBcjRadUZyRjRKTkVpQ3pzTWFIc0hQYmJpVEJBOStMR1F0VXIr?=
 =?utf-8?B?SUgvMCtpOTFFUFFqa1BiaWJOM0dtMFMzTEZXVWVuWFEyL3lmSGhvZUE1Q3Q3?=
 =?utf-8?B?eWszTFEvcHRpMkl5MjNTak9YZlRKUm9EVmRCNndQaDdZdCs0ajVMM3REQVBQ?=
 =?utf-8?B?QVNuK25xMVlJU1U2MDd5UGRnY0UwYjV6TUpGSnVSVXQrVEU5d0ZjNndCZm1P?=
 =?utf-8?B?NGNQODU1N2VON1l4TjB1QnFlM0RlYWxDMCtFMmRRd2p3aGhzajZaT2RwRzVJ?=
 =?utf-8?B?UnppSkdONnZIc2F1Snl5bDJnY2F6Z1hacUNDekFzTjlLWEx6R1h0TUI5Q3Zt?=
 =?utf-8?B?MnZnNitBWHJBOXc1L2NFSlRXOWpuem5YanBtUytSOFY1dERVbFRSWS9YRG4y?=
 =?utf-8?B?ZzZtck5rYUVzQnhXbnRIcVV2Tnk0Vk41TmIwUHYvZTE4K3BEaWNINWlOL2Rq?=
 =?utf-8?B?dXN6RElGd1lkT2RlbnJKQVprSUE3NWI1U0pGdUl4T1dMU1d0Rm9lUDF0QUI4?=
 =?utf-8?B?L09DRWVHd2JRWk5MTkI5clFLMm5HQTMrYS9MMW9MZmpZZ09FQldSdyt3K2tT?=
 =?utf-8?B?RGJEckxvUDNXbndPbENnKzkxV0V4QzhKdFpBVnZyeWR1VXp4cXo0Q0ZjejhK?=
 =?utf-8?B?VmxRTGhDOVlPeXdweDkyNjB2T3RGeFVoMnI5SDlQd3BsRFFGN2RZeGJKcWt3?=
 =?utf-8?B?NDczTGtXcERmUGhyR0dKVTllWE9ZM3RldFdLSFVCRW0vcTV0UjV5UkJlUHlL?=
 =?utf-8?Q?rsdA0NZqN6/BrTboRhtmoIzDdU155T+OQSgUXNe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd986f5-2831-48bf-5568-08d8f2efdc3d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 20:18:48.1805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /73M6vi03icvt1FY/vTS6MVqkJ6xIkK3W+b8DT9Fx/wDJM4RAw7jPFnBgCSIPUP6tt9soxffNA9LTUCycJm/vN0Gj9OgNtxkKV6nQ7tk1cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5208
Received-SPF: pass client-ip=40.107.5.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

12.03.2021 21:15, Max Reitz wrote:
> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>> Compressed writes are unaligned to 512, which works very slow in
>> O_DIRECT mode. Let's use the cache.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/coroutines.h     |   3 +
>>   block/qcow2.h          |   4 ++
>>   block/qcow2-refcount.c |  10 +++
>>   block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
>>   4 files changed, 164 insertions(+), 11 deletions(-)
>>

[..]

>> +static int coroutine_fn
>> +qcow2_co_compressed_flush_one(BlockDriverState *bs, bool unfinished)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +    int ret;
>> +    int64_t align = 1;
>> +    int64_t offset, bytes;
>> +    uint8_t *buf;
>> +
>> +    if (!s->compressed_cache) {
>> +        return 0;
>> +    }
>> +
>> +    if (!seqcache_get_next_flush(s->compressed_cache, &offset, &bytes, &buf,
>> +                                 &unfinished))
>> +    {
>> +        return 0;
>> +    }
>> +
>> +    qcow2_inflight_writes_inc(bs, offset, bytes);
>> +
>> +    /*
>> +     * Don't try to align-up unfinished cached cluster, parallel write to it is
>> +     * possible! For finished host clusters data in the tail of the cluster will
>> +     * be never used. So, take some good alignment for speed.
>> +     *
>> +     * Note also, that seqcache guarantees that allocated size of @buf is enough
>> +     * to fill the cluster up to the end, so we are safe to align up with
>> +     * align <= cluster_size.
>> +     */
>> +    if (!unfinished) {
>> +        align = MIN(s->cluster_size,
>> +                    MAX(s->data_file->bs->bl.request_alignment,
>> +                        bdrv_opt_mem_align(bs)));
>> +    }
>> +
> 
> I’d move the pre-write overlap check here, because its purpose is to prevent writes to metadata structures as they are happening, not as they are queued into a cache.  (I’d say.)

Hmm. pre-write overlap check usually done under mutex.. Should I add an additional critical section to do overlap check? I'm not sure.

> 
>> +    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>> +    ret = bdrv_co_pwrite(s->data_file, offset,
>> +                         QEMU_ALIGN_UP(offset + bytes, align) - offset,
> 
> I remember you said you wanted to describe more of the properties of the buffer returned by seqcache_get_next_flush().  That would be nice here, because intuitively one would assume that the buffer is @bytes bytes long, which aligning here will exceed.  (It’s fine, but it would be nicer if there was a comment that assured that it’s fine.)
> 

It's here, read several lines above: "Note also, that..."

>> +                         buf, 0);
>> +    if (ret < 0 && s->compressed_flush_ret == 0) {
>> +        /*
>> +         * The data that was "written" earlier is lost. We don't want to
>> +         * care with storing it somehow to retry flushing later.



-- 
Best regards,
Vladimir

