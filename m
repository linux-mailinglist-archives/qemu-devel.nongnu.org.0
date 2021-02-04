Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC830F323
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:29:27 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dlG-0001mV-9H
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7djd-0000P3-VU; Thu, 04 Feb 2021 07:27:45 -0500
Received: from mail-vi1eur05on2094.outbound.protection.outlook.com
 ([40.107.21.94]:12408 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7dja-0000aQ-Qa; Thu, 04 Feb 2021 07:27:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz0GmI/bMdjfg2WjkRDyEJWsFMu+9Gh+tO3tx6nO17KqPRFPd1iPAUv09yRj8+SrUmywBxSCkVhf8dw/rlJCPiMDpp14VdHrLbISPxSpnTTlZr+GX2Cnq5+PvajLos30g072ZyxpFPzDGSGYzt4ytniVxyD/gODZOa7eCiY5laMjh2GPwgpIUM3byBdsy95sEGT2WuCT0U7yRlzBXX8hfWL3Om6fp3xnd0UlbqYZ/qeq50CGBhttMoeII9HetHrZ5a2/YSx/zsNqN1fRYFCCeISIdGZYDtFb+VkpDOJyLj+yUL4M9DmD3eYaCR5N5RqPUCusRvVMEYK9f80ltBDlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZnKGpwckNuyzl5gxNNJQOUq5a2puQRwpyxO9QeZVts=;
 b=lCBuVuUV32ckMBBaigtykc1hw3kgip10sW3ufhPi0IHETlO+/feJ9psj4mMKRD6R6K0x1zgFF4/vr5To1zgFlLHn8L5uQaHBheqpDhSiiD8gXdtC+OAiqxDGW9IjB2i5IBNubXnIuyC7u54CNj9eAGLBsQvUeQMGycgJzpQJIfM8h/ODB6o8TZkt+tYNNf/JOHSdLWgTfuu++NsmVwseD2KqsOIdW6dLGCo3gSg3b3a4sMmSCD5Hpgd/spH4i2nXDNeZPvvFLNysJ2tv6t52ELJaXaIXFNfSTAMtkt3NTEHkiCAdNW2LcjsZqbdI4NewFELICQTN+vzZ+LLKmwJj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZnKGpwckNuyzl5gxNNJQOUq5a2puQRwpyxO9QeZVts=;
 b=poaBg8NDsVFpZJYp3gyPg/PincuXLeWnAnRr8JFeTdxe6cLzdqUG5Kk5Xj5hxo3ltsWQW9vWgsq2wMF/VkBkkCA2LI4u4n+ZN78Gi2RFdxih/APi3JhyJfSWqDhRFytQuSfKdYcIH1RBu5PMLfXt5v4lHpQEH92ZObpNXWuWGn8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.26; Thu, 4 Feb
 2021 12:27:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 12:27:39 +0000
Subject: Re: [PATCH v2 25/36] block: introduce bdrv_drop_filter()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-26-vsementsov@virtuozzo.com>
 <20210204113128.GD6496@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <221cebd2-6ba4-0e15-cf40-2aa2969cc230@virtuozzo.com>
Date: Thu, 4 Feb 2021 15:27:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204113128.GD6496@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM0P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM0P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Thu, 4 Feb 2021 12:27:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 603b00de-b560-4e0a-5dda-08d8c90842c2
X-MS-TrafficTypeDiagnostic: AS8PR08MB5895:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5895A315381AF968ABDD40D4C1B39@AS8PR08MB5895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MI/sqSAQqOoRyiABfklzNCmxLilAHJ6pBUSaRLeP5F0MfECujX7icu4D/Axrx3WW9UCYIU4X6N6znlTaYHeWRxlTgXVi3gOle+EXPuQRS7sQc/qT5dPw0mTE1SeAKW3Cu1hVxBSmvvxW1L3C2T2LlNWDKl+Wn02qJTkxX7aDooKIVsjtnmrbFLBFUXbD8kUgcTm7ikrJ8J6+EqqGM67Wb/CkUjqd4b1pdGeuU6Gz4K3zCocT/Kgix6uHBhVTR4jnlvuJfZ3tTst8EKI3izz3X3H86opUqrLgZwRqzk11lmo9ofYwTWDRwPOjuHqYwuOxwsY4i6YWGVyHuq8Ax/V7op2Z/5I7VVapGek52QvdSEA/hnjy93d6GBGiDKsd7tOcTDhtxzqV9J6mZsDBc4WNqihIf+yBCxKnO000JyRcbY92Z+bVxbUztobA2HzgclBmsLwVzBeOUbNWxqvNQuIu7HfNIL/5k0rqx7CliRkoJ1dksAseWmKDajvp/GZ5Ga6avkEY42TlIUHtvIL9ERHLdYcpdJz/cK6eI/iBTTogJFGww0u72TTlTADa6nrrBGe6QsJCSXJ43SQnxG+HrlmAdwvspVUk78ou3TBi8C55X1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(478600001)(31686004)(31696002)(2906002)(107886003)(316002)(4326008)(6916009)(956004)(86362001)(5660300002)(16576012)(66476007)(66556008)(16526019)(6486002)(83380400001)(186003)(26005)(8676002)(36756003)(8936002)(52116002)(2616005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjNOOXlqWThtY0toS2JLUkowSVNDKzhLMlRsT0d6M25Kd3VrQ3c3MVBYWWxh?=
 =?utf-8?B?N3pwRUdJTFZqb3FwcjR2Y011c3VoUC9VVlhPSFRXTURJWEsrVWpMcURQYXZa?=
 =?utf-8?B?RTJ3U0tXcTMwY3FwMXZ4d0VnRDN6M1o1ZXlQQ0VYT0ZHZ1k1MjJWMWpqS1N4?=
 =?utf-8?B?MzJ0QzE1VEp5anh0MzFnNTZkREVRb1pmVFhUTzVISElrV0Q2cjJ6VzYwN0E1?=
 =?utf-8?B?d2thUVE2MjRqVk93dE5NdG1WajFaeWVCMGRhN05RWDdvZmc5UG8vTzZGUFVn?=
 =?utf-8?B?ZTNjczFYQTBWU0lmY2RVZjJlK1pnUVozNUtONVNPWjJSYnExNVowaHpFL0ph?=
 =?utf-8?B?VUpBRjlKZU5kQXpXcVVuek9GTzY2TTFUcVp2aXFFT3NMQVJwWVFMV3hiOEtZ?=
 =?utf-8?B?emZRSDUvQm9vY1JTK1pTQURFQWx2N2ZxR3gwMGFmUXNtRHJpSUxOWTJYT3lR?=
 =?utf-8?B?eXE5aEc4ZzMxM2orVzAzMXBZVngwNUZuemZCVGhGS3hRTS92UFZYNzd2NlB2?=
 =?utf-8?B?ZVN0V252SWNhZmlPUk9jVUg0VGN2U3g1dHI5djR1TG9NWW15QWhqamNNKzlt?=
 =?utf-8?B?bUpUNG1wZ2RkM0dacnBybm9PL04wQzJWNm9NTDdzL004OXNvSUc2S2ZTU0Vr?=
 =?utf-8?B?SzlJYVFKSDBIRSs1cEtiL2VmMi9JNjMxcllOcVR3ZXJrQXEyRXJVcmw1ZU9D?=
 =?utf-8?B?WWZHREh1S1o0UkV1SHlVbDdJOVJoUkJFLzdkSVFBT2ZzSHAyUVlYR3BGMEZB?=
 =?utf-8?B?YTlPOEs2YloreUNZV3BiMmM2SHdKZkxQeEg2N0VLeXJzNlFmTnNuQ0lZMkVh?=
 =?utf-8?B?RVBTRW5zQW81SmRhMGtUbUZUSjQ3WWNKbUlmVHBsVW5VZy9JVlNqdnhtZGpx?=
 =?utf-8?B?S2c3OFQyaGV1Q21IRnhXaWZuOUdkN1lQQXRZWGNheHUxMWx4eHROczVRcC9s?=
 =?utf-8?B?TzdJT0RLQmxYUzFvZEF5STBsTndmQ2VmaHJxTlhTNzVROTdQTVQ4OGZRYkVz?=
 =?utf-8?B?eURnUzNXaWwwR1RWc2VyWnRqWVdJREJLWmtWRkVMRFZpbGpQS2RoQkpla0Zz?=
 =?utf-8?B?NVNlV2xXa1VSMFNIZExmNVJNL1NSQ2V6YzJKcHVxVk9ITWhvU1l1d3l4b2k5?=
 =?utf-8?B?aXVoWk1aSTNFcFJ1VkVyaTQzbVRUbGp4ZDhqQ2tDUWJPbDRmYWU3RXdncVFa?=
 =?utf-8?B?cy9CM1dSTTdoMzUvTzNzSGNFb3dEN2ZMc3ROdkdPekdNT2lHSnFtd0pMNU4w?=
 =?utf-8?B?QmJLTEZNNDhZaXFIQUpwVFgrVGtUZFdFZUNwRThlMnE3cGxiRE5qNXJIaEJL?=
 =?utf-8?B?QlZINlB3blB6QTZ1UDFzVU5sQzNVNmh3UHd3YXdZMnJScHQ2b0QxdGlCQjZP?=
 =?utf-8?B?a0RMZDBhT0h2dWdjc3hsUGQ0ckxGZ0R4WWNjVFh3Mi9xbHRjOE00NkIzK3pL?=
 =?utf-8?Q?1O7d+1Vi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603b00de-b560-4e0a-5dda-08d8c90842c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 12:27:39.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9rqr3OeLoQn+zQ4CDA5xjdyMTgamAVhkhHocq0UrPH6Vd8MDCxRuHxmiUuJAlE0ulOwm7ir968vinQ8TWxFZ3RkJndBVf9jBw6zwzlKQBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Received-SPF: pass client-ip=40.107.21.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

04.02.2021 14:31, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Using bdrv_replace_node() for removing filter is not good enough: it
>> keeps child reference of the filter, which may conflict with original
>> top node during permission update.
>>
>> Instead let's create new interface, which will do all graph
>> modifications first and then update permissions.
>>
>> Let's modify bdrv_replace_node_common(), allowing it additionally drop
>> backing chain child link pointing to new node. This is quite
>> appropriate for bdrv_drop_intermediate() and makes possible to add
>> new bdrv_drop_filter() as a simple wrapper.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h |  1 +
>>   block.c               | 42 ++++++++++++++++++++++++++++++++++++++----
>>   2 files changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 8f6100dad7..0f21ef313f 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -348,6 +348,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>                   Error **errp);
>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>                         Error **errp);
>> +int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>>   
>>   int bdrv_parse_aio(const char *mode, int *flags);
>>   int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
>> diff --git a/block.c b/block.c
>> index b1394b721c..e835a78f06 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4919,7 +4919,6 @@ static TransactionActionDrv bdrv_remove_backing_drv = {
>>       .commit = bdrv_child_free,
>>   };
>>   
>> -__attribute__((unused))
>>   static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
>>   {
>>       if (!bs->backing) {
>> @@ -4968,15 +4967,30 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
>>    *
>>    * With auto_skip=false the error is returned if from has a parent which should
>>    * not be updated.
>> + *
>> + * With detach_subchain to must be in a backing chain of from. In this case
> 
> @to and @from make it easier to read.
> 
>> + * backing link of the cow-parent of @to is removed.
>>    */
>>   static int bdrv_replace_node_common(BlockDriverState *from,
>>                                       BlockDriverState *to,
>> -                                    bool auto_skip, Error **errp)
>> +                                    bool auto_skip, bool detach_subchain,
>> +                                    Error **errp)
>>   {
>>       int ret = -EPERM;
>>       GSList *tran = NULL;
>>       g_autoptr(GHashTable) found = NULL;
>>       g_autoptr(GSList) refresh_list = NULL;
>> +    BlockDriverState *to_cow_parent;
>> +
>> +    if (detach_subchain) {
>> +        assert(bdrv_chain_contains(from, to));
> 
> The loop below also relies on from != to, so maybe assert that, too.
> 
>> +        for (to_cow_parent = from;
>> +             bdrv_filter_or_cow_bs(to_cow_parent) != to;
>> +             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
>> +        {
>> +            ;
>> +        }
>> +    }
>>   
>>       /* Make sure that @from doesn't go away until we have successfully attached
>>        * all of its parents to @to. */
>> @@ -4997,6 +5011,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>>           goto out;
>>       }
>>   
>> +    if (detach_subchain) {
>> +        bdrv_remove_backing(to_cow_parent, &tran);
>> +    }
> 
> So bdrv_drop_filter() only works for filters that go through
> bs->backing?
> 
> Wouldn't it have been more useful to make it bdrv_remove_filter_or_cow()
> like you use already use in other places in this patch?
> 
> If not, the limitation needs to be documented for bdrv_drop_filter().
> 

bdrv_append supports only bs->backing based filters too.. So for now it's enough. And probably in future we'll refactor it all again when implement multi-reopen qmp command. Will look at it when prepare new version and either improve or document limitation.


-- 
Best regards,
Vladimir

