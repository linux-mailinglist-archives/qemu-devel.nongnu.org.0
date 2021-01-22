Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571323000F3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:58:35 +0100 (CET)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2u9B-0006FV-S5
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2u7i-0005Ly-FT; Fri, 22 Jan 2021 05:57:02 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:58432 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2u7e-0002xP-F1; Fri, 22 Jan 2021 05:57:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBgAZGzlVt9uxQKly86tCt21gGak4VKU5EKl2RWd9/5X0/9iCWr3IuWCQLMhR6U4NwRK2c5WzrDM0q4VwVGwePh/KSUW6UfQZGA8z7Hr+WhUCV245yIAcVM0WqmEA6z8fh6k7KdL9yWH0H5ky2Y2LnfJ9XRJnQvJCRnL5Elzvk7qTKBY8KiKsVicV1xfWn9K0VufyhxDMwbG0ppaErjUctTfmVJQHIQwszSnM5490QRcwBty2XNfn06hiYm8+yHPwGEQCb6T50zgO0/UuKV7nmUkxAnDjndDjUZQAgIwdqegRthP3wVUgVGAQP0WHgDArOPZwB4+MoBZPVq9elud2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LQD4LEAQzkBjFp6OwYVdk4CJa16GL6yNHoOM88aRQY=;
 b=AhOf9OExpGCvMVnT/poVMwgF7EmxenfBU3q5n9NJUyhTi7x+KeykJri4x7u0AJzA1XWR3Xs1AQrOpuSew1F4JJvO6Is/5BeGbYfRNoAOXYqeJTlw4nut0e01LiGoX5M0KgfVaC8M3Vm8FTtapChA4WchMiStqERm30FVtmkc/Oi37Xi6K9dhysrcPgcos0UryTuBXU7Ei6FcD1s83mPkOqoKcgsS2bzP5N6fBN/TAwRk68OAbvBT+5FjCPkwt4JKtohS9u/3r/ksIDrkBk723fuZrBmg1mntYYe1+L8WHv5tKRzm9IXHL3d479sSDFYohQSa9D6+x3pXHH/MeUqstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LQD4LEAQzkBjFp6OwYVdk4CJa16GL6yNHoOM88aRQY=;
 b=IjyqwRuUTHT7ci0a13r4lq1Ysx/9m0x8NjHmzv4biboNgXNpC58ytaxs/td1OD3QTC0uciH1JyAAp4DvwnLVlgeV0w89Jvv6jRgsBtZHg070pxAFMUVov5lqXk+SOsfYyp7VEXGRiAcPJOzv1+MwbUvy1KalulAFAiZgtz4KJ4E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5502.eurprd08.prod.outlook.com (2603:10a6:803:12f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 10:56:52 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 10:56:52 +0000
Subject: Re: [PATCH v2 2/8] nbd: allow reconnect on open, with corresponding
 new options
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
 <20201130134024.19212-3-vsementsov@virtuozzo.com>
 <eaa152c3-5bb0-aff0-1dfe-526069f94ff7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a480a679-aa71-4657-175b-3c2d3075d3e1@virtuozzo.com>
Date: Fri, 22 Jan 2021 13:56:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <eaa152c3-5bb0-aff0-1dfe-526069f94ff7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 10:56:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47b5e375-458b-4073-c64d-08d8bec46c7d
X-MS-TrafficTypeDiagnostic: VI1PR08MB5502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB55020F4D77E502F147890391C1A00@VI1PR08MB5502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOlETd+OxZ17IQwh3y/idpJqGN8Y532tmvbxnA3d/gT7CtjvzpVZJk7alC9npOHvhj2S47cMrSEGhM0EeHQVV4dHd6a109rg3vGRCWrxM6djv6WrXfzOcCwJmbhNdzs/kkOEUiGWIEbsQxHDRwFE9dIC9e4klk4N7cgQ3i4Mfg99LKZxyPlH/2ZfgK8pzLrDbV7/Mif4w9eTaQojhY6EJ7gcdefJ01g1qeTkkY+1rD+OPbHh2HeLI0uHQ9rGdFr+AXLyLpSAIgOx9nntviSUHlYkga38fjFyN0o+RZwiDPMZKW8ZWk8IQaiXIeNzdOcG6xuVlUZl5HTm6bxYqwhBDTb+ULk4Tw9RNdhTxvE7q/JNmKxZNniWwz3WEdwadsRjjOeI8XxcGZoxli5zKgENrnoCYSTw/Cm60JOmdG+YRAQUxrk4qQIYVXXtNGa2hlNTHj5S8fCmjdwEDNX0g4No/ZFbCleBABboSL9GMorJ0XydixtLsgCClXssHDmxlxgH0h08b8j2OfoofXic1ruJmrHNB4Dx0GwtCaVJ/ENXig43HpKsXmMt02jjTDA7xsMuK554EL8mpgpdShSx8JYfiyo4cszil/oYU2fclLgyiqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(8676002)(4326008)(31696002)(83380400001)(107886003)(478600001)(66476007)(8936002)(2616005)(956004)(52116002)(6486002)(86362001)(26005)(31686004)(36756003)(186003)(16526019)(53546011)(16576012)(5660300002)(2906002)(66946007)(66556008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djlxcUN3NDgvRCtnaGFHdElHbjdLWTZPR3o0MVExSlozUHIvUXRONFJadE1V?=
 =?utf-8?B?amdCYUJaQWRiMWE1Wk5COG80NnEzTnNFdXRqNE1Nb0NyZlN5YUY1eWQ5QXNH?=
 =?utf-8?B?bVluT1BnbElpRnRuVW5iUXkvYU9sbXBOaVhXZHhvMDJIeEQ5QmhBUHVSTC8v?=
 =?utf-8?B?dTJzNDRPOUJIVmRKR1lrQzJtSG5wWitlbER0YU5FOXhES3JTeW8xTzZibXQ2?=
 =?utf-8?B?MGJ6aEUyOGZBNzgzNk1tQjI1TUg4RkJDUStGdE5EQWFudm91T05BRDhlSTE0?=
 =?utf-8?B?OTRTeis1SXpLYVpoVUJtb3prTU51SXR3MzUySFVMeWdmN1BkZmw5NlEzaXQ0?=
 =?utf-8?B?c3BzUXR1NGxsNkJKNTVvVTdBL1EydGc1K2F4MnpIUkxtNU1CWE51V29GMHRC?=
 =?utf-8?B?R3daODJtV204UW5Tb3NrZWZoS0RrRkxLZFpmL0ZXTVc0YjkvQXY2a0ZzU3hR?=
 =?utf-8?B?NTBURjBuaEdsc29FcWJiQXJTQ1FJbWJZbS9kRGpBRC9nczBQS0pDV0Vya3Fs?=
 =?utf-8?B?anR5N0NLZWt6amFaNE5meFVHRHdYWkZRUW82dW5FWGlIODdWMExrbzBobkFP?=
 =?utf-8?B?R3NWMmVzNVhsREFrWU93YXQySis5eE9qTjMxWEhnWUJFeFo4WkdWeXRSTW1K?=
 =?utf-8?B?S3BzS2dBMGxSM0Ird3k2dlJaajVaTlJhOURvSjgxZS9vc1pobTBsRzMySEp6?=
 =?utf-8?B?OGcrVSs0bjZUV3NsWmpDLzBDK01GV0pZak9kMTcxcjQ4UTZaZXo0QXFyU3pO?=
 =?utf-8?B?MHd5blplUS8rZXBobW9EdE5WM1kxeFcyZk9jNGNGQnJKeTZQVXVsTWtlR05o?=
 =?utf-8?B?ZUZPZTMxcEM3ZnpVelQ4aTVVb0oycEQvUk5HQTlRakZEVkd2R3FtY0grYWRa?=
 =?utf-8?B?UkNpbGhqWTNiL0JlZ0djZkZaWHV2UXRySTc1N2V2OUcvWnE2bHZsUXNIWVdL?=
 =?utf-8?B?MTFJbTFhYm1uc0pXOUI0ZGVrT2RlZVkrdEpXeEVHVUJLbXI2eSsrMVlFUFJj?=
 =?utf-8?B?WDdvaGI3OGVzNExseTg3SEtXMVNjMmI0UTN1RmJmSWR3NHpkOTc2R3dMSWRw?=
 =?utf-8?B?WEN2OGZTdVZHU0VDcWVxcW9NVWNEVjlDZUpHTVVvRmJCdTNkUnFxY2pQQ2l6?=
 =?utf-8?B?SEtGSTRRSlZLeHp3VlgvRXNMbThLT0dxTEJkV3d5eGdrb1VQUWdIQ2t6NDFT?=
 =?utf-8?B?UlZwSTluOFVCREdrRmQvNmlZMlZLc08zaHBrYzBCRHlKOTQvcWxVUWlXdURV?=
 =?utf-8?B?S2kyNGVqNEE1WlhFL3RxVjVvNWV6VGh0VFpNby9mNm1DMTdhRjN0RlY1b2xx?=
 =?utf-8?B?bnM4ajJPdDFaWjl6cnhiejdobEw4WHcveVZxR2dwOHNFaVVYbUkvOUh6YUl4?=
 =?utf-8?B?L1p4R1Y4M1NhKytKODBWUVU5cTdGMDBPZTR5RzV3R3N1TkdTYlNoT0NnOUI1?=
 =?utf-8?B?UnRDaWtjemZValFEd1FrbmIvRVA1dHN1aDdtL3R3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b5e375-458b-4073-c64d-08d8bec46c7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 10:56:51.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/KJHRD5oA455QpnHwuOWUi32PNMn6QNHjltPKVJ4WLonDJYd/vYLaoINoHAzREOVplcpMtTWmEpkaXp3mZblBHtM1u2dVXtfezrtv0fqSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5502
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 04:44, Eric Blake wrote:
> On 11/30/20 7:40 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Note: currently, using new option with long timeout in qmp command
>> blockdev-add is not good idea, as qmp interface is blocking, so,
>> don't add it now, let's add it later after
>> "monitor: Optionally run handlers in coroutines" series merged.
> 
> If I'm not mistaken, that landed as of eb94b81a94.  Is it just the
> commit message that needs an update, or does this patch need a respin?

Oh yes, you are right. I think the most reasonable thing is to keep this patch
in separate (for simple backporting to downstream without Kevin's series), and
add qmp support for the feature as additional new patch. Will do it on respin.

> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 115 +++++++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 92 insertions(+), 23 deletions(-)
>>
> 
>> @@ -474,6 +484,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>>       s->wait_connect = true;
>>       qemu_coroutine_yield();
>>   
>> +    if (!s->connect_thread) {
>> +        error_setg(errp, "Connection attempt cancelled by other operation");
>> +        return NULL;
>> +    }
> 
> Does this need to use atomics for proper access to s->connect_thread
> across threads?  Or are all the operations done by other coroutines but
> within the same thread, so we are safe?

s->connect_thread is not accessed from connect_thread_func, so in this way we are safe. And variables shared between connect_thread_func and other driver code are protected by mutex.

What about accessing nbd bds from different threads.. In my observation, all the code is written in assumption that everything inside block-driver may be called from different coroutines but from one thread.. And we have a lot of s->* variables that are not atomic and not protected by mutexes, and all this works somehow:)

I remember Paolo answered me somewhere in mailing list, that actually, everything in block drivers and block/io must be thread-safe.. But I don't see this thread-safety in current code, so don't introduce it for new variables.

> 
> 
>> @@ -624,10 +645,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>       bdrv_inc_in_flight(s->bs);
>>   
>>   out:
>> -    s->connect_status = ret;
>> -    error_free(s->connect_err);
>> -    s->connect_err = NULL;
>> -    error_propagate(&s->connect_err, local_err);
>> +    if (s->connect_status == -ETIMEDOUT) {
>> +        /* Don't rewrite timeout error by following cancel-provoked error */
> 
> Maybe:
> 
> /* Don't propagate a timeout error caused by a job cancellation. */

No, we want to keep ETIMEOUT

> 
> 
>> +static void open_timer_cb(void *opaque)
>> +{
>> +    BDRVNBDState *s = opaque;
>> +
>> +    if (!s->connect_status) {
>> +        /* First attempt was not finished. We should set an error */
>> +        s->connect_status = -ETIMEDOUT;
>> +        error_setg(&s->connect_err, "First connection attempt is cancelled by "
>> +                   "timeout");
>> +    }
>> +
>> +    nbd_teardown_connection_async(s->bs);
>> +    open_timer_del(s);
>> +}
>> +
>> +static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>> +{
>> +    assert(!s->open_timer && s->state == NBD_CLIENT_OPENING);
>> +    s->open_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
>> +                                  QEMU_CLOCK_REALTIME,
>> +                                  SCALE_NS,
>> +                                  open_timer_cb, s);
>> +    timer_mod(s->open_timer, expire_time_ns);
>> +}
>> +
> 
> 
>> @@ -2180,6 +2235,14 @@ static QemuOptsList nbd_runtime_opts = {
>>                       "future requests before a successful reconnect will "
>>                       "immediately fail. Default 0",
>>           },
>> +        {
>> +            .name = "open-timeout",
>> +            .type = QEMU_OPT_NUMBER,
>> +            .help = "In seconds. If zero, nbd driver tries to establish "
>> +                    "connection only once, on fail open fails. If non-zero, "
> 
> If zero, the nbd driver tries the connection only once, and fails to
> open if the connection fails.
> 
>> +                    "nbd driver may do several attempts until success or "
>> +                    "@open-timeout seconds passed. Default 0",
> 
> If non-zero, the nbd driver will repeat connection attempts until
> successful or until @open-timeout seconds have elapsed.
> 
>> +        },
> 
> Where is the QMP counterpart for setting this option?

Absent (as described in commit msg). Will do in a separate patch.

> 
>>           { /* end of list */ }
>>       },
>>   };
>> @@ -2235,6 +2298,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
>>       }
>>   
>>       s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
>> +    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
>>   
>>       ret = 0;
>>   
>> @@ -2268,6 +2332,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>>       bdrv_inc_in_flight(bs);
>>       aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
>>   
>> +    if (s->open_timeout) {
>> +        open_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
>> +                        s->open_timeout * NANOSECONDS_PER_SECOND);
>> +    }
>> +
>>       if (qemu_in_coroutine()) {
>>           s->open_co = qemu_coroutine_self();
>>           qemu_coroutine_yield();
>>
> 


-- 
Best regards,
Vladimir

