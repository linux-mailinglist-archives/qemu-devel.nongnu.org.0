Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E92F3427
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:29:33 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLbv-0007vJ-Pn
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzLaP-0006zR-Ax; Tue, 12 Jan 2021 10:27:57 -0500
Received: from mail-eopbgr10110.outbound.protection.outlook.com
 ([40.107.1.110]:28393 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzLaJ-0007UB-SJ; Tue, 12 Jan 2021 10:27:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUEqW9J8cQav9w5yuCkLdq/iTo87Z0BVdJKTfiZdCwiuA4pa0oR6P9eikh7uFHRPoBxzM4NQ/xmJySlvSqdnZlUOwN0lOfcXIRRBJcOe5EO/4vmJ9Mwk7fnlHxSf0rEzeseJLQv23RLMB45WsKcnIjMmfaBB4ygz1eN0GWydnEfw/k2Hw9GQwOw2/spKLs1iAqVRN4fQJ2IZiI94BIV5hQ9Hee7noOv9fePKClQDGXJC5yPuHS8FfkLbOkxEMSOBhXYhSln4W5DdjOwo6O1VQaQSMloM8OasHem3OM6/FjQqRlj/ufEnUVJyvUrFevOKgcQ45ZkoscYObwGuCs8E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhBtmoOYUnAxQcjDOJv5AS+FevYg+Rj4AKdM1Cakbcw=;
 b=eAsLRXEgibhsbWg/fa3SYYd8ICXf/lRB5VvURQsXRaze6kXiIIuQ53qQrrAupyj3+q1d1tlz0pHIVU66/c4J09BnNoC5fzysapSgip4BYUgq9rUD8yBWEaUdus2//vkYP/sjEumPOE54Ey3RGipyqE9r7/U6VNwq9qchiX0ZsRWFsPqKVBk5pAZyzLi/ZlhiNE5yX/1AM8OZ5Nu0+7UYkb9z0ZRuUpVKhQgQ3ILKEPluhcx8gZV77Q+sT689n31lSEsxtUTcslvOX7i54ThNuej1SJFs54vjmrpi2K6ruTumkAgPe8fqtLmwd9658s8jZ7jU9qn0074G51IV9nzAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhBtmoOYUnAxQcjDOJv5AS+FevYg+Rj4AKdM1Cakbcw=;
 b=eESJay8Y9qfI1q6XDrSFoq2sYYCl2kNxvnThKC/BdnQ71y4pJlFpXWv3+QHMixe8wzqyq6zAKIsBkQQ3wC2DYKfkojCmw8jWUv3hSb2SklmPvEp+burd851LM9PyWGsJ5ot1LAGblacX96maOkQYjHgl4ghxsTJspaot0hbRAPE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 15:27:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Tue, 12 Jan 2021
 15:27:47 +0000
Subject: Re: [PATCH v3 19/25] backup: move to block-copy
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-20-vsementsov@virtuozzo.com>
 <9708f8d8-3afc-f30d-9245-20071763c5a3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b2926382-30dd-cf90-1984-a88f8e0b5301@virtuozzo.com>
Date: Tue, 12 Jan 2021 18:27:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <9708f8d8-3afc-f30d-9245-20071763c5a3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:27:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 966915e1-8843-4498-20bc-08d8b70e9dc0
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5877C25897924A82C6EDE4ABC1AA0@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cgA0fyWnUS0/zn4M5BNZJEnMmtnv1p7fX/iNGbKc0q05WpWEi9kXaM5/AnJd/ti56Ey4+Es4xmp0G9H5FWB4s1Prp/egcp3C6dgVxj4waVMAJyRzuYLGl+AJsrFwLKIs3ov8DspLWFfauexoNBS7uZGk0NbZs4kZUyOmmk/ymcuDEBSXA+Jpw8E6DY8xeS4qsULuWn6dU7pU+w4hmfm6Cc2YfkTqtB+Fr8cjGz12XPbjANaCgZ9qI07Xy7fmd6/JGYylY96uatS2GpzCtZF48NvuQSQo+FgAh3MapcyT//PibF8dpYqaiBrfNOcRcFQ5lAeHaltwLY7WMdd3oFlvmRBtgX0HOH5uscmSPqZIs3vbMelgTCvSPCNK0+X5w3erDO8mMdj+5oOuR0q6gQA0AN17ZjDwjQrOxVpSTgUw+wgm4HFOJXQt+LcxIE3xLagCSHc7VZMjmjttSIbspWwGeB6aU+1GvIJtWRCEOS41CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39830400003)(376002)(366004)(136003)(2616005)(26005)(8936002)(31686004)(186003)(31696002)(2906002)(478600001)(16576012)(53546011)(16526019)(4326008)(83380400001)(66556008)(956004)(107886003)(5660300002)(52116002)(86362001)(66946007)(8676002)(6486002)(66476007)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nm4wamFsaWE4SGZ1OTVBYnRTYThYdEZTRVF0L1RScEtWdGhJaitwSXhFcTVJ?=
 =?utf-8?B?dXM3amNYbUNPOGVDUVd3Wmovam04cU1pNjZOd01uckpxSldSNXV1cUdKY282?=
 =?utf-8?B?Rk5rbkhjU294ZGZoN2lKUDl1ZnVCVGxYZ3RTMWtBMUlWS3BFc2hFbWRWc21B?=
 =?utf-8?B?Z0hVNlcyeFRyUGdZVlRDZmtzL2dvSWx4dUEvS051RGtqazNTWGFpbGVKbzlI?=
 =?utf-8?B?RzNCWjRQOVVidHE1a0E5eU82akttK2l5OURTamZKd290WUloTlVEaElHcGtB?=
 =?utf-8?B?VDdUMzJidmdodHNwR1BlMTdMNHlTeHh6UGowck8wVUJ2eUt1UC9OZVBmOC9r?=
 =?utf-8?B?aFJ6TUxmY2FBUkJiODBXc3JlcXJuQ2F6RWt6OTVsTXQ4NC9ueUZIVkt3cGV6?=
 =?utf-8?B?ZXNwcXpaMWF2UjhwTm9UaDJ6bVhUMUpLa3lhQzNoUTdCai9aRkJ1dEwwd09v?=
 =?utf-8?B?bEg0WTFRb3RLd01jK2JDWkJvRWZzRU9HY0Fha21YQk0rQjlBTDJlbStKejdz?=
 =?utf-8?B?YWNhSWo2SXBQamJFaWNUWnVJZC8reTQ3ZVJYcjZUMEdHOXJBZHVkY2xtbUZs?=
 =?utf-8?B?Z1VNY2dKWDE1Ly8reERHMDVkblp3V3BqeWNmbHQybktTTEdhVjBLeVlCSTlU?=
 =?utf-8?B?TUNKN01IaXozREh2UE1zSTdZUlBxYzdLaGw1SnlkU1cyY0dRQmRwSlpwZ1d0?=
 =?utf-8?B?OUZocCtFRis4a3BLYXcwUjZRVmgreWlmZWFGeVlwRVJpMmxOcVVrR2dLbDNt?=
 =?utf-8?B?NWU5cjVhaUNYU2FIcFJmaGkvWUlmVWswbkZnbFJUejc3d1lRMVNUSm14cFND?=
 =?utf-8?B?OHNlZ1NnMEJubWZCQUVMeUdUT0xkZXVyZUVqYWZ1TkNQclJsNjA3Y1YyaHNX?=
 =?utf-8?B?dTJFdnVhQlY2T2lVUUhwcXdDWGZubmVodmp5c29CVVZ1L1JTUU1iaVRIKzFY?=
 =?utf-8?B?clBZVG1FTDllMVAxdlZyYW04ZGFJRGFJbWFrakdmR0wrMEVMYWJLUU03VW1D?=
 =?utf-8?B?aDMvK3pzR0p3NmliaXVKMHVUbTVLSzRHRGV5QVZJekNmY0dVMFpTS1U3L0FO?=
 =?utf-8?B?M3VoOTJ1Z1JDaWt5M2pmL1RYMFFJTHl6dWZqYmR3QXdiSnFObmQyOWZsK3Jz?=
 =?utf-8?B?RmNOTEdUdW9HY1h6WW03OSt0TGJGM1NWYllZK1RGOGtUSFIzeHNsNDhBUFpG?=
 =?utf-8?B?eUtUZDBpVXhvNzNkU3pwNGVNU3JHUy94ZlBLN3NaT0l0aGs2Y3VTdVVQaCtu?=
 =?utf-8?B?UnpXSTc4L2ZSMm1MSS8vWUZhQmxiaTJUWkJzczZOVWR2bVN3Y3ZJU29MWWk2?=
 =?utf-8?Q?2AVPxvmbG7oXq0bBDubE18sNhbzKYwTHzI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:27:47.6277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 966915e1-8843-4498-20bc-08d8b70e9dc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAC5dF3nJJarGeYh2dBk+jtYpilXSsIkYY16IvVlwghHMeAKBCHR+yuF9iP5HzMfG91khwB7fQvvZvjktj1wwXZDQH9hCGzxwwGgdzTFs2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.1.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 16:23, Max Reitz wrote:
> On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
>> This brings async request handling and block-status driven chunk sizes
>> to backup out of the box, which improves backup performance.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/backup.c | 187 ++++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 121 insertions(+), 66 deletions(-)
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Thanks a lot!

My way to this point was started in far 2016 summer.. And final concept is far-far away from my first attempt:)

> 
> Irrelevant notes below.
> 
>> diff --git a/block/backup.c b/block/backup.c
>> index 449b763ce4..0d1cd64eab 100644
>> --- a/block/backup.c
>> +++ b/block/backup.c
> 
> (Just something I noted when looking for remaining instances of “ratelimit”: backup.c includes ratelimit.h, which I don’t think it needs to do any longer)

agree

> 
> [...]
> 
>>   static int coroutine_fn backup_loop(BackupBlockJob *job)
>>   {
> 
> [...]
> 
>> +        if (!block_copy_call_finished(s) &&
>> +            job_is_cancelled(&job->common.job))
>> +        {
> 
> Just for the sake of clarity: If !block_copy_call_finished(), then job_is_cancelled() must be true, right?
> 
> (I.e., could be an assertion instead of the second part of the condition.  I don’t mind how it is, but then again, it did made me ask.)

Hmm, keeping in mind previous loop "while (!block_copy_call_finished(s) && !job_is_cancelled(&job->common.job)) {}", yes, you are right.

> 
>> +            /*
>> +             * Note that we can't use job_yield() here, as it doesn't work for
>> +             * cancelled job.
>> +             */
>> +            block_copy_call_cancel(s);
>> +            job->wait = true;
>> +            qemu_coroutine_yield();
>> +            assert(block_copy_call_finished(s));
>> +            ret = 0;
>> +            goto out;
>> +        }
>> +
>> +        if (job_is_cancelled(&job->common.job) ||
>> +            block_copy_call_succeeded(s))
>> +        {
>> +            ret = 0;
>> +            goto out;
>> +        }
>> +
>> +        if (block_copy_call_cancelled(s)) {
>> +            /*
>> +             * Job is not cancelled but only block-copy call. This is possible
>> +             * after job pause. Now the pause is finished, start new block-copy
>> +             * iteration.
>> +             */
>> +            block_copy_call_free(s);
>> +            continue;
> 
> If one were to avoid all continues, we could alternatively put the whole error handling into a block_copy_call_failed() condition, and have the block_copy_call_free() common for both the cancel and the fail case.
> 
> *shrug*

Hmm. Same emotion, *shrug*:). I like my comment, describing exactly block_copy_call_cancelled() in corresponding if.. Being combined with failure case it would be less demonstrative. But I'm OK with your suggestion too.

> 
>> +        }
>> +
>> +        /* The only remaining case is failed block-copy call. */
>> +        assert(block_copy_call_failed(s));
>> +
>> +        ret = block_copy_call_status(s, &error_is_read);
>> +        act = backup_error_action(job, error_is_read, -ret);
>> +        switch (act) {
>> +        case BLOCK_ERROR_ACTION_REPORT:
>> +            goto out;
>> +        case BLOCK_ERROR_ACTION_STOP:
>> +            /*
>> +             * Go to pause prior to starting new block-copy call on the next
>> +             * iteration.
>> +             */
>> +            job_pause_point(&job->common.job);
>> +            break;
>> +        case BLOCK_ERROR_ACTION_IGNORE:
>> +            /* Proceed to new block-copy call to retry. */
>> +            break;
>> +        default:
>> +            abort();
>> +        }
>> +
>> +        block_copy_call_free(s);
>>       }
>> - out:
>> -    bdrv_dirty_iter_free(bdbi);
>> +out:
>> +    block_copy_call_free(s);
> 
> Reads a bit weird after the block_copy_call_free(s) at the end of the while (true) loop, but is entirely correct, of course.  (And I can’t offer any better alternative.)
> 

Yes, looks weird.. Probably we'll invent some good refactoring later. If the function doesn't fit into one screen, there must exist some good refactoring)

-- 
Best regards,
Vladimir

