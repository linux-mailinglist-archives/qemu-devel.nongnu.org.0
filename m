Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E63B00D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:58:03 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdAQ-0001NN-8c
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvd9W-0000Zl-Id; Tue, 22 Jun 2021 05:57:06 -0400
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:15854 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvd9S-0000k7-Vx; Tue, 22 Jun 2021 05:57:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwQDs2kDxgEvr+edy3KEOlv2eYiG5pjfILqhyqpkrh4ILM/yPR61ECIZtR/OwejQfFyluZWYaDMduxvLBDqMVUARJgYGG3NdFsCfMuUGvXdw4HsnVjZOLz9HyZJOuMu2waRDVxnUJu3Rqsz+gn2gB5hZDUjFPVR5XO4XbwoMo5BcE2rfB3ioUh76hCGH7xYD4u55UQ+bD6zu2V4Q4mYDQOWC5wQgG2LpquUYDCdJJz1QE8tfmIoRZrzfPq++dDBHp6h9WGEXw1730ac6hDsrOjFQADRSkpOSThML1EJmEw9l4pEPmcd6GPo/5bHsVWqX6HVSHYn3gkGzM70at5YORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYmAvUvwQmel1v2Bs57AfKpQ1hAO7l0E9mTNTfvxlrk=;
 b=mGYcrk5b7bNn8HiZAfxVispiQlqx544eBwlaiz7FaGBG2Z2czULL7WGehIdXbk/sjen/Xkihao/ja8xxC/dQlF5gdRiI9sVcjRu1A9QLpDTjK2/xWBbROSp9xI0u7KtIFESKeNDWYX/ydvFv6dS4ZinuquAZj79dqhwSlKj+ywuAWb+Aw07D/GXaFDajMyoXgTOxEJqKxwE9qMAFOaWyqiC4j60he4RKABtyTRVNrRCR4N+MUxABAHySstJPungxTSA4amUUjp3/zQdJQfFAsFKlGnljjF/3uZBSwrytOiPJuV42Daho7EfMCdr31oifaK1qySt0gJBmeBbQ0ES64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYmAvUvwQmel1v2Bs57AfKpQ1hAO7l0E9mTNTfvxlrk=;
 b=XBRRxAThbG9WzXmokReE6ScQDCbrxyUYFxxoaDcfiKH42AMWSYdpfrntRSYSKVb7PNOIVTpG9vik1J4rKAsRWZDf0XQfOUiPADPZMfiTJUlqg8vo/uKusRYgipqwACkC9fnRgJmIxzypihRO6gbkyQQrdhSWNSO4mIXOUhzfFzQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 09:56:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:56:58 +0000
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <215f6356-1b9a-3f3b-c35d-bf0b176ebd0f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <be6351d0-4616-b94d-9c31-922fe4afa437@virtuozzo.com>
Date: Tue, 22 Jun 2021 12:56:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <215f6356-1b9a-3f3b-c35d-bf0b176ebd0f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0501CA0035.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0501CA0035.eurprd05.prod.outlook.com (2603:10a6:3:1a::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 09:56:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a13f69d4-6d93-4210-05fb-08d9356412f7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6166:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61669B6A95F4350579371F45C1099@AS8PR08MB6166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3GHYeo4dpwBNP8ehFeEi6kx4HrBtwjjazO/1fSKnlr5q9GwXMQrTjCVBxN2QWAxpPsglLwZrUXTDkilUQRlGX+L0B9alfsgFblDBd2vAO1USmtUHJX7AW40XI+kzZN4zhWm/AHy6ptcC+ZbZutKAAxq4c9+YM9QVZxZIl6ZXWWFMMjJPxmDLNF7gLedeE42FChsaUFmxRzyR1x6puCzQckqwCvOUr8wHueCO9JIODxW7huMM0HlzplgX8bA8ef6TFUNuM1qkuSsqvKi5MQMd+hlKJHTRU+Vfkq2F+IEu9dYrlmKEWJhRFWPP6FqM5dluGbTHf8Sh2AKkJfSzGAA1Jybzqb8N7niuqiyls4yn4l7SxoJt++5LPQiuHdgS6TqPyTBV+q8hJ/wN2NmTXO4IInu4Xyk8kGXHAqvORbht5sXuhe8NytG95QP8dXKctBtadSjD3tMqqpvj5coZbTEW9VFzUoGtSBK//RZ1mAF9iKLFiWTeIgz8K2j3PEAUuvNCHvjp+n4m6IBHLguBuLRhPhr5l87czpKrlVoMyRUQ9YJ4QFVOHxGaz40OLhjRiJ91pvx3wnIIAw9m11bufNSfLYp35JWy71xy81SKHyI52jWbpV3qN8+wyQv6cYwa9J9CQWvc5ATtXc9q6lmG5e1N7Xc9vlwLcz4SoHiusN6TD1F9etsIedCSGBMEV4059poQ4eAu0nPsTvvCgcf+CA6/Cnh9CbX5HRTHdQxzV9M7J+2zEdlfhzfHgBQmZ1WxKEp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39840400004)(376002)(136003)(36756003)(54906003)(956004)(6486002)(31686004)(8676002)(2616005)(5660300002)(2906002)(8936002)(16576012)(66946007)(16526019)(316002)(83380400001)(478600001)(66476007)(38100700002)(31696002)(4326008)(38350700002)(86362001)(66556008)(52116002)(53546011)(186003)(26005)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3o3bUdzUVVNTm00NTBHYU9tbkxLSXpGdjVMT01YVysySVZRZTdpMWRzSWpE?=
 =?utf-8?B?UzI5NlBNV0VRMDdCZkxzUnNCdTVDSmRjeGpvMGR1VTAzSXJrOUZsTHJHTFBp?=
 =?utf-8?B?akNwYzR0TGoxSUk5dG01NVFJbVAydEpqM1NoQ0c1QU4zZ2Y0Q0EzaDZwVmNX?=
 =?utf-8?B?bTEyV3U3VGV2V3U1cDJLT3k2d1VJc2l1RHR2U2lyZ3NYbjNBVktCSVd1OWZi?=
 =?utf-8?B?R29UQithT0hJL2VCNHdzMm1XVFlGc1UrM0hTNlhrNk1LaWJJODYrN0d3ZW9O?=
 =?utf-8?B?ZHlVemllVUpObEhJSkZpNFpVNFZLUk9vemFha0x0bVQvdzhoVWVneDNSNVBr?=
 =?utf-8?B?d1dtS1JiZnJQUm8xMmhqMXdCWVVuZFRFNHRuR0dxTnRnWWVXNW8zbjBiZlpz?=
 =?utf-8?B?WXRwRnNBbUR2TlhTeXEvVVpLQkp2Nzdja0E3c0xDREplRjBLSDVHRlZDZmRQ?=
 =?utf-8?B?eUppeVFqMmtNSlhzNnJ0em1HeW1yNUhpRjc5dHozc3NZeHpBdWE2T1JsWm0y?=
 =?utf-8?B?cjZKa2lnREc5YXBuWmFUMGMxOXlGSVNiOG5kNU5DQnZibi9tZ3o1N2pXRE1I?=
 =?utf-8?B?MWJDNHRWM0dkWFZMSVFHeHNCVGNwMFdmcHhSZzZ4blRpMVo0cklTQVV3OXFh?=
 =?utf-8?B?K0lVU0NUN3l3UUtpTjRkaFp1eDVSQzlueVJuYzlzM0dVT0d4UUtoVmRMeTJB?=
 =?utf-8?B?TG16N1l2U2FtY29DTGoxTE5qKzBrTUdxejZVcVBuV0NjREllQUtHSEs1VDZL?=
 =?utf-8?B?aGNsYlV1WlpzQXdKdkZxS2pRNG1jcW9kZjlRQ1ZkbTRUYUtIUjR5ZnZITUM3?=
 =?utf-8?B?YnN6Nk81c0xiMldVQ0xHMlV2ZnhlNFVlQXJESncxVjBiTWF1bTl2Z3c5aS9a?=
 =?utf-8?B?T0JDcWRUTWZReEJ0bnlPb2FHU0V2QmEvQ3RFNUUrU2luMHpCRkkzdk1GL21D?=
 =?utf-8?B?YWxhcTFaVWpTaHM3OXd0Z3VkVXA3YmJGdmpjVGhldGIrMXdsN003b3lFRDF6?=
 =?utf-8?B?NUV2dE9sNmNDRnFNeWp3QWVDSFNEeHVKTW9IekFZOVZXYjNxRmh1YlJKWjNE?=
 =?utf-8?B?bDV3NzNsMWtEUjZ1MXU0aURsVGxxcDl0bHQ5eGF4dHYvKzZ6QVhBdFFNemZ6?=
 =?utf-8?B?RFlnd3ZqaXZqL2RjdjFRWE1iY09zWW5mZjVWVloyMjUxSGJFZ3BDdHJGbWhk?=
 =?utf-8?B?b05ldExvMUlnYUhkK1JnOHZnL3E2VVR3ZHlHVTU1UDdpL1F1cmlGb2hKS2R6?=
 =?utf-8?B?MTBqNDNXQ0J0K0JGOTNsS2h2TlVLSTNrS1A4NS9UTnJrTEtaVzlHZVk3OU1B?=
 =?utf-8?B?R1JVUENUdk1zbzUrUUZEYWl1Y3A3bU4yUlJiTlNIVDVjUEcyV0poTUppY3l2?=
 =?utf-8?B?UEVQeGQxWEl3WUhkTW5lcWJIK0hFWGQwcjVDb1E0YnhKMW5jY0JPVUNYclMx?=
 =?utf-8?B?NDgzb1FUN1gyck5DOFpuMlBOYkFEZjJ4WUpmQmJGSEtCOHJIOFROMERJd0s1?=
 =?utf-8?B?ZlFVdFVNU1REeE5HaVp3QkVLYk9hQkRLL2JrWTlpbmhUNnJUL2J4RlZDVWJL?=
 =?utf-8?B?NUJSWmhTYzlKa0VjT2xzOUJiT2JQNlJ2NkxlVEZsbHZORE9Lc01Cakx3bFhy?=
 =?utf-8?B?T3pXSHg0bFc0Z3lKMUIwZkdLQUVScHptOTdsaGVkN1ZmUTF0ekxXYUhIUDBw?=
 =?utf-8?B?OEhFRkVKQ3EyK0U1UkJndk44MHlqaXdWZzBONFBIQnJyRWJ3TmFIcVZEL1pZ?=
 =?utf-8?Q?aKW6y+LmRAEVRIJnFkncBTtCBP9ns6F88bo8t9s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13f69d4-6d93-4210-05fb-08d9356412f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:56:58.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvgfIRAWzloC1N1CcgTlFhtXg4RROqaUsSHXS97FELgE1rW1Oh8YJvn8/gbYBwRH1ybtWoQPBSkcgqOFpuSfx0AJgankaoQnhljy1F+K6IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

21.06.2021 12:30, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 19/06/2021 22:06, Vladimir Sementsov-Ogievskiy wrote:
>> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>>> fields are written by block_copy_dirty_clusters before .finished is true.
>>
>> And that they are read by API user after .finished is true.
>>
>>>
>>> The atomic here are necessary because the fields are concurrently modified
>>> also outside coroutines.
>>
>> To be honest, finished is modified only in coroutine. And read outside.
>>
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/block-copy.c | 33 ++++++++++++++++++---------------
>>>   1 file changed, 18 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 6416929abd..5348e1f61b 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -53,14 +53,14 @@ typedef struct BlockCopyCallState {
>>>       Coroutine *co;
>>>       /* State */
>>> -    bool finished;
>>> +    bool finished; /* atomic */
>>
>> So, logic around finished:
>>
>> Thread of block_copy does:
>> 0. finished is false
>> 1. tasks set ret and error_is_read
>> 2. qatomic_store_release finished -> true
>> 3. after that point ret and error_is_read are not modified
>>
>> Other threads can:
>>
>> - qatomic_read finished, just to check are we finished or not
>>
>> - if finished, can read ret and error_is_read safely. If you not sure that block-copy finished, use qatomic_load_acquire() of finished first, to be sure that you read ret and error_is_read AFTER finished read and checked to be true.
>>
>>>       QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>       /* To reference all call states from BlockCopyState */
>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>       /* OUT parameters */
>>> -    bool cancelled;
>>> +    bool cancelled; /* atomic */
>>
>> Logic around cancelled is simpler:
>>
>> - false at start
>>
>> - qatomic_read is allowed from any thread
>>
>> - qatomic_write to true is allowed from any thread
>>
>> - never write to false
>>
>> Note that cancelling and finishing are racy. User can cancel block-copy that's already finished. We probably may improve change it, but I'm not sure that it worth doing. Still, maybe leave some comment in API documentation.
>>
>>>       /* Fields protected by lock in BlockCopyState */
>>>       bool error_is_read;
>>>       int ret;
>>> @@ -650,7 +650,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>>>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>>>       assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
>>> -    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
>>> +    while (bytes && aio_task_pool_status(aio) == 0 &&
>>> +           !qatomic_read(&call_state->cancelled)) {
>>>           BlockCopyTask *task;
>>>           int64_t status_bytes;
>>> @@ -761,7 +762,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>>>       do {
>>>           ret = block_copy_dirty_clusters(call_state);
>>> -        if (ret == 0 && !call_state->cancelled) {
>>> +        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
>>>               WITH_QEMU_LOCK_GUARD(&s->lock) {
>>>                   /*
>>>                    * Check that there is no task we still need to
>>> @@ -792,9 +793,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
>>>            * 2. We have waited for some intersecting block-copy request
>>>            *    It may have failed and produced new dirty bits.
>>>            */
>>> -    } while (ret > 0 && !call_state->cancelled);
>>> +    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
>>> -    call_state->finished = true;
>>> +    qatomic_store_release(&call_state->finished, true);
>>
>> so, all writes to ret and error_is_read are finished to this point.
>>
>>>       if (call_state->cb) {
>>>           call_state->cb(call_state->cb_opaque);
>>> @@ -857,35 +858,37 @@ void block_copy_call_free(BlockCopyCallState *call_state)
>>>           return;
>>>       }
>>> -    assert(call_state->finished);
>>> +    assert(qatomic_load_acquire(&call_state->finished));
>>
>> Here we don't need load_aquire, as we don't read other fields. qatomic_read is enough.
> 
> So what you say makes sense, the only thing that I wonder is: wouldn't it be better to have the acquire without assertion (or assert afterwards), just to be sure that we delete when finished is true?
> 

Hmm. I think neither compiler nor processor should reorder read structure field and free() call on the whole structure :)

And anyway for block_copy_call_free() caller is responsible for the structure not being used by other thread.

> 
>>
>>>   }
>>>   bool block_copy_call_cancelled(BlockCopyCallState *call_state)
>>>   {
>>> -    return call_state->cancelled;
>>> +    return qatomic_read(&call_state->cancelled);
>>>   }
>>>   int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
>>>   {
>>> -    assert(call_state->finished);
>>> +    assert(qatomic_load_acquire(&call_state->finished));
>>
>> Hmm. Here qatomic_load_acquire protects nothing (assertion will crash if not yet finished anyway). So, caller is double sure that block-copy is finished.
>>
>> Also it's misleading: if we think that it do some protection, we are doing wrong thing: assertions may be simply compiled out, we can't rely on statements inside assert() to be executed.
>>
>> So, let's use simple qatomic_read here too.
> 
> Same applies here.

Here I agree with Paolo, assertion works better as written..

So we can just keep it as is.

> 
>>
>>>       if (error_is_read) {
>>>           *error_is_read = call_state->error_is_read;
>>>       }
>>> @@ -894,7 +897,7 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
>>>   void block_copy_call_cancel(BlockCopyCallState *call_state)
>>>   {
>>> -    call_state->cancelled = true;
>>> +    qatomic_set(&call_state->cancelled, true);
>>>       block_copy_kick(call_state);
>>>   }
>>>
>>
>> Uhh :)
>>
>> Ok, that looks close too. Or in other words, I feel that I have good enough understanding of all the thread-safe logic that you have implemented :)
> 
> Good! :)
> 
> Emanuele
> 


-- 
Best regards,
Vladimir

