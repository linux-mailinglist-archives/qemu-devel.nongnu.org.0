Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B621333BDD2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:42:42 +0100 (CET)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoQb-0007Xq-P9
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLoP2-0006si-28; Mon, 15 Mar 2021 10:41:04 -0400
Received: from mail-eopbgr140115.outbound.protection.outlook.com
 ([40.107.14.115]:21157 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLoOw-0005OA-7C; Mon, 15 Mar 2021 10:41:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keO8rMmzbJAHdV9mt6PlpSWAgOsBrPmxKUhEnHyUP8d0FOD1ueCLVK5CJh8bowBvGMvvon7z41w4b9aKS94sW2YUCkcdMb/+efJPB7osiiJFEB4QXeEhYjFR6x0EbUrYO3BQQQb8oSopivv2O4KVOXA/8t1fBsMJI2IlQyu3SEilSU4fkWpD8oMSpme3sTcT+Yq75J3ljVbgtX7mzV1F0n995ETY7f4/bug4I/SeTRjEmHPokiQ+fTmwJeRZtmAjt3AA9kInK8sr+jcDfHg0J+ZuIZZH1Yz1ZMGgFkn3KZo2LQ38Ecetbu0cMaE0J2RCmAGFUE4b9mqS/iwIuhPyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0R3/UlpyiW7k1MYQEVP+IFfAOAPWEZQNxJXFZIrkko=;
 b=ZrxfoDNNAvvj46LDfyjXFxolKoikCgSVpEk2VRjrFQJaROMn7KFmvU4SBJZGPumwW4nBTd8bea8LGs0EwI2QqqFOE76oxVbHQt6336gH9w+WS+klIBRgzqHKETJK8/J+P66qsfQMPA0Cng5Xsb757stmw75ziJFdwRKVysMBZPMUHDlhyGrDw4z2FBWWiVYnrJME1uUnGrhno+9VGgeyKAQ3Zoy7Xn81WTiIuEGLr9J62Lgl/o2VszCBbDz6LXgTfFyiwSzeF7zOFJBswkP/SoH41HwlUjmhNQfUBlilKtirTRdp6HgHuIfIh2r27FOBgsNqp0q8z72x8XjdKv9htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0R3/UlpyiW7k1MYQEVP+IFfAOAPWEZQNxJXFZIrkko=;
 b=ewUK5eCmNHpyU6Z5Vqjn54JKLnHFkW9wFzjoMBD4CreBXBqmC/hu3hnv+6iXi6BX/8ScoQT6bjdp/izE7cvJWs8+c0EfgXwwpKIbMvlTlhONprYSYoUR3e//Z90+V98EM/28HkmUrrt3Hw5VIBfdg/DOAlOh5GkV/a3QIBIeg5I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6645.eurprd08.prod.outlook.com (2603:10a6:20b:38f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 14:40:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:40:52 +0000
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
 <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
 <6056196d-a0cc-7de2-5d6f-b223fdee98ff@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7fb10a80-8001-966d-533e-3f74c739571a@virtuozzo.com>
Date: Mon, 15 Mar 2021 17:40:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6056196d-a0cc-7de2-5d6f-b223fdee98ff@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0198.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 14:40:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e354651-808c-41a1-f313-08d8e7c054f8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6645:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6645CB94E771228E5E7DD9C3C16C9@AS8PR08MB6645.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEUXwB9aVBIiiChpUPrjjMkoYWH4VD202Iyyvn/7EXQYtzrUr4Q3al4e4RajV+aBDvu4JXI6OPB5T5D4vkd+kh/EvKeISZPCu8Judt3W4TcqikXG7vwtqlCWywnAuW6iJbJE9iGXJ1r47XL9S/LkDGRySO/EzTuMDC0DTWB0XqcnfGptU/4vQXtFhHwPaHvMFEcBngD5X6nN8UFDAwg+vbt4WILjZ6/n3xYWU1KQxMlnibF6+Xhqvq/I6AAvi2WsEqSYMOdWNUaBwnsj8UnyddIbfaPeuEptqWmBdjg8+ZWd38XPuvg2NJ8ff/s+/eMezLJIVfCDt4nNq7jZOxD9wigBwVfjO/h62shQKd3LUI21w3tb+oBQV4fSmnZulVAfaYA4+cu4iCr++sxKyCV7h9zGAaLFq9hkF78JjKvoQLLQtwpM+ZrZe3yJkb57KyP4SYfrNpjRMjGRBzHr7m/6a3SiVuFbncavFmKfn+JBBOTTPcwD3A1/xRdklRnDUkzUBhE6m1TEjTclSSnnXvruQBmwm1Jftc/5Vu8KRAdwl9KSUlUEVkkFpMyBQ+oa72z1CQi6SYeR4ZhMh0JPWHOGSMGdREnUSSMOgfzNT/C+RwcX9QIXpJVfYXQXVx14mXHEAa2c0HdCbcvzIgJiUCeO/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(376002)(396003)(8676002)(5660300002)(478600001)(6486002)(956004)(2906002)(2616005)(86362001)(66946007)(8936002)(36756003)(53546011)(4326008)(83380400001)(186003)(26005)(66476007)(66556008)(16526019)(16576012)(31686004)(52116002)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODk5RDZRSWdlcDRPVjRZcEF1YThtQURXOFV2dzVWRGFKWUs4aG44V20vVlhT?=
 =?utf-8?B?RStNeUFLUHo3SlNpQTVRMnNtQ3Jjd3NCWU5kbUZibUhzc08wdXV3OStCNVdz?=
 =?utf-8?B?dUVoMmw0NVNFYlp2M3VOOTJJYmFEUHVsMGJ5WkhpTDNYWHhmSzhZcVN4akkw?=
 =?utf-8?B?a2dpZWRISzZ3bUxFRzhYUmJOdEVLU1ZHV0dFU3BxWkc3bS9EcEtBZ21YRSts?=
 =?utf-8?B?VFpUU1lqTUlZSU9zajh4QVJyVUV0MzgwZlJZcGEwczJUUi9DNVArNk84Uytv?=
 =?utf-8?B?OTBtVFY2VDJEdFMyOXBKY1dvR25kUlpKWGNVNjJONVo2RFRLdDlOOHpGN3Va?=
 =?utf-8?B?Y1hVZ2tOWkJuWW55bDV2NThIUk03T096aFJscFhpb3VLS0E2LzVxK0dSNGFy?=
 =?utf-8?B?RDc3WVcvU0hPWDZWZWZ5K0M2NWt0bTE1TUYvTkJ0UXgwM0FGZnIwSWlEMDlW?=
 =?utf-8?B?dnBCd2ZFWDRZa1liK1ZKbHdIZlV1aHFLTzVYQXFsSmZ0ZW0va3BVTnhIb2pD?=
 =?utf-8?B?NjYyVzlrT1o3a0c3RmZtcTExRjVmdUdmUXJTMXpUYldjOTFWT0kvVjEyZ3J1?=
 =?utf-8?B?clhWdEJVU2RrVCtmNGpZRU82NW03dktpK2N0WTgvaTYvcVp3Z1RmNjNrL1pN?=
 =?utf-8?B?V1B0by9jdEkwaVNteWlkeTUzWWJWNThjMVREemcrUmdSanoyM0drSjVFM28y?=
 =?utf-8?B?RitqbDZHaUd2dkIvOEI2c3gzK1FVUmtLQWU0MklaMTBwdWxWQW1qYzhqOWJ2?=
 =?utf-8?B?eGZZNUVEMExLT3p5WEtXYUhEL0syY3lkdlU2Ylo2T1ZuZ29lUGcvaTZqRjJE?=
 =?utf-8?B?ZUltWXc2cnZYUjV1OEZoRG54dTNtVE45VCtVUXZjeVRFTmR5WUFVQnhyVVRp?=
 =?utf-8?B?SzJmaGFqVE9lVmptUjF0U3NmN1UwNGZNU0tVMHhBRGpqRERWTDdvSEwrWTVa?=
 =?utf-8?B?TzduUXpGcWZDSGdPK08wWGlOc0ZjeGl1NkhadnhFSTIrMDM0bnBUcXo4VkFW?=
 =?utf-8?B?TyswSDR2TmQrQ3FuQXJXc0xDbHpBNjFBSG1URktCTnZ0RHdOL0FsRG1HOVVJ?=
 =?utf-8?B?MXN6c0dSVUx4TnkzM3dDVk5UcXhObEFJS01qUlN1Zy9RNXpYTVpqelIxWXYw?=
 =?utf-8?B?UENrd25EbTFNb1U5MW84a2wwNyt3Ni9rdEx0MDkxWWUvZVVUQTBmK1Z4Z2hE?=
 =?utf-8?B?UTZXZWxHSllnVjFxc2htR1BmR0FGaUF4bTRuc2RzWkhvZ1R1UXdpMWNoK2t2?=
 =?utf-8?B?UjhPQTdTcW5XOVM3RlZRNW96VmV3QWlsLy9QZXhSckt0Z3kyTFlRd0owbk9B?=
 =?utf-8?B?NjgwSm5uYTJadEtVN05QM0lVOUlXaWZTY0dMVjR0OGR1UmJxUWdYTVBNUkEw?=
 =?utf-8?B?cTR0MjRGZTJad0lYZjNQS3RyeTJZaXRzdXVPc2hBd2s2a0ErVEZRdmJDSEtu?=
 =?utf-8?B?OEhIRUtSUXBkUVYzYzA1Ymw4YzFjUS9PNVZJVUtDVW1VcGFxYlBoREhVdkVh?=
 =?utf-8?B?V1ByVmRONHJoVC9DYVpCWVVxYWRxS2I3R205ck5Fd0J6TXB5N29aakp2cTQ5?=
 =?utf-8?B?SHZFdVBwWTlBcEIxaVJWSzBCRXpLbUxWOExsWVpzUzhTYzJRZW5KQmJkakJM?=
 =?utf-8?B?R1NMVWdNaHBIVUV3Y3pUaHR1QTdqekk3K0E3Z0NBb0dIRStCRmJpRkNxYkFD?=
 =?utf-8?B?Y0ZnQVdIY2hnN01qUjRFMTFqWTRaTHhPTGV1QmNsb2pQRENsK3pHZmZkRVNX?=
 =?utf-8?Q?MCwMN4s36d4wFtDsBH9jO5j8xZJ1W0pjUjCA/jW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e354651-808c-41a1-f313-08d8e7c054f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:40:51.9179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zO/sjRMKhV1LVpHz39LhVJzbDGI/gkx/+wX5WdzZLRxCSbP8HOtVZiQM8b5TvvkOsXg0jE0tsPQmdnpymrzwfwINbwVd4vyqTkhodSMkgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6645
Received-SPF: pass client-ip=40.107.14.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

15.03.2021 12:58, Max Reitz wrote:
> On 12.03.21 19:43, Vladimir Sementsov-Ogievskiy wrote:
>> 12.03.2021 21:15, Max Reitz wrote:
>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>> Compressed writes are unaligned to 512, which works very slow in
>>>> O_DIRECT mode. Let's use the cache.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   block/coroutines.h     |   3 +
>>>>   block/qcow2.h          |   4 ++
>>>>   block/qcow2-refcount.c |  10 +++
>>>>   block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
>>>>   4 files changed, 164 insertions(+), 11 deletions(-)
> 
> [...]
> 
>>>> @@ -2699,6 +2796,12 @@ static void qcow2_close(BlockDriverState *bs)
>>>>           qcow2_inactivate(bs);
>>>>       }
>>>> +    /*
>>>> +     * Cache should be flushed in qcow2_inactivate() and should be empty in
>>>> +     * inactive mode. So we are safe to free it.
>>>> +     */
>>>> +    seqcache_free(s->compressed_cache);
>>>> +
>>>>       cache_clean_timer_del(bs);
>>>>       qcow2_cache_destroy(s->l2_table_cache);
>>>>       qcow2_cache_destroy(s->refcount_block_cache);
>>>> @@ -4558,18 +4661,42 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>>>>           goto fail;
>>>>       }
>>>> -    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>>>> +    if (s->compressed_cache) {
>>>
>>> Why is this conditional?
>>
>> We don't have compressed_cache for non o_direct.
> 
> Oh right.
> 
>>>> +        /*
>>>> +         * It's important to do seqcache_write() in the same critical section
>>>> +         * (by s->lock) as qcow2_alloc_compressed_cluster_offset(), so that the
>>>> +         * cache is filled sequentially.
>>>> +         */
>>>
>>> Yes.
>>>
>>>> +        seqcache_write(s->compressed_cache, cluster_offset, out_len, out_buf);
>>>> -    qemu_co_mutex_unlock(&s->lock);
>>>> +        qemu_co_mutex_unlock(&s->lock);
>>>> -    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>>>> -    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
>>>> +        ret = qcow2_co_compressed_flush_one(bs, false);
>>>
>>> The qcow2 doc says a compressed cluster can span multiple host clusters.  I don’t know whether that can happen with this driver, but if it does, wouldn’t that mean we’d need to flush two clusters here? Oh, no, never mind.  Only the first one would be finished and thus flushed, not the second one.
>>>
>>> I could have now removed the above paragraph, but it made me think, so I kept it:
>>>
>>> Hm.  Actually, if we unconditionally flush here, doesn’t that mean that we’ll never have a finished cluster in the cache for longer than the span between the seqcache_write() and this qcow2_co_compressed_flush_one()?  I.e., the qcow2_co_flush_compressed_cache() is supposed to never flush any finished cluster, but only the currently active unfinished cluster (if there is one), right?
>>
>> Hmm. Maybe if we have parallel write and flush requests, it's a kind of race condition: may be flush will flush both finished and unfinished cluster, maybe write will flush the finished cluster and flush will flush only unfinished one.. Moreover we may have several parallel requests, so they make several finished clusters, and sudden flush will flush them all.
> 
> OK.  I was mostly asking because I was wondering how much you expect the cache to be filled, i.e., how much you expect the read cache to help.
> 

It should depend on how many parallel write requests allowed.. (and that's an actual limitation for cache size). We can add a "bottom-limit" for the cache, i.e. don't flush if there less than X clusters in the cache. Still I don't think there actual scenarios where both compressed reads and writes done. And anyway, to accelerate compressed read we'd better do some simple read-ahead.


> 
>>>> @@ -4681,10 +4808,19 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
>>>>       out_buf = qemu_blockalign(bs, s->cluster_size);
>>>> -    BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
>>>> -    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
>>>> -    if (ret < 0) {
>>>> -        goto fail;
>>>> +    /*
>>>> +     * seqcache_read may return less bytes than csize, as csize may exceed
>>>> +     * actual compressed data size. So we are OK if seqcache_read returns
>>>> +     * something > 0.
>>>
>>> I was about to ask what happens when a compressed cluster spans two host clusters (I could have imagined that in theory the second one could have been discarded, but not the first one, so reading from the cache would really be short -- we would have needed to check that we only fell short in the range of 512 bytes, not more).
>>>
>>> But then I realized that in this version of the series, all finished clusters are immediately discarded and only the current unfinished one is kept.  Does it even make sense to try seqcache_read() here, then?
>>
>> Hmm. Not immediately, but after flush. An flush is not under mutex. So in theory at some moment we may have several finished clusters "in-flight". And your question make sense. The cache supports reading from consequitive clusters. But we also should support here reading one part of data from disk and another from the cache to be safe.
> 
> The question is whether it really makes sense to even have a seqcache_read() path when in reality it’s probably never accessed.  I mean, besides the fact that it seems based purely on chance whether a read might fetch something from the cache even while we’re writing, in practice I don’t know any case where we’d write to and read from a compressed qcow2 image at the same time.  (I don’t know what you’re doing with the 'compress' filter, though.)
> 

Note, that for user that's not a parallel write and read to the same cluster:

1. user writes cluster A, request succeeded, data is in the cache

2. user writes some other clusters, cache filled, flush started

3. in parallel to [2] user reads cluster A. From the POV of user, cluster A is written already, and should be read successfully

And seqcache_read() gives a simple non-blocking way to support read operation.

I have two additional thoughts in mind:

- After introducing compress filter we actually support parallel compressed reads and writes.. Even if nobody uses it, it works, and it should continue working correctly

- The only think that breaks using compressed device (with help of compressed filter) is that we can't rewrite compressed cluster (by compressed cluster I mean). But it's not hard to implement.. So, at some moment the limitation will go away.. Hmm. still I can't imagine a usecase :)

I can image that both reads and writes may be used on temporary image in backup scheme with reverse delta, or for external backup.

But rewriting compressed clusters is sensible only when we run real guest on compressed image.. Can it be helpful? Maybe for scenarios with low disk usage ratio..


-- 
Best regards,
Vladimir

