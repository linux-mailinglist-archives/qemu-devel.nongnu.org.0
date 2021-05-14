Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E6E380DC1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:05:41 +0200 (CEST)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaJo-0006Hs-59
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhZmO-0007xv-Nx; Fri, 14 May 2021 11:31:09 -0400
Received: from mail-eopbgr140137.outbound.protection.outlook.com
 ([40.107.14.137]:55034 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhZmD-0006Ei-Q9; Fri, 14 May 2021 11:31:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtV7xSwqwvEMmcMd394oMnpUpJqgMOUOQRFJN/8lLUOkdrKInvRSfjnGHiagT0i8dbu54C302zhlHQP0R2iL1/OrQ2dl8P6PjAjs1GjbuTsBq3wvk1MKtqGUL3vRH65oGsieRaYlN1t7GwmRt7XNFfCyHjsp6Xy541uudUkRxjzna+5/WAZ6sVhpSPasHvhH17eGORXKEG75wB21rkV9598duyjOgZswyIR5E7nwXsb1QRS8fuoDa/dza/v1mhq+NCAGH6QY/JxeB46OOFtcIdUAVE+Hv8xxNL6u2KmOVGZeYujEglX37omD/QBXCQK/7eqUY52eQTWcmSO/KCyGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUiB+kwzbEiS2nnSIIlXf4AH8uhtD/j1STRZd2qeXsY=;
 b=DuIWp+NgZIIG+ZsC8rew/9NEzylPTM9HYdDwN/QwE2bDoG1t1EEho3CmFbF1pzO+inMw/fcdPn5IAeSXrj+KNQUol5Fq172Jp8d+Q+uVXujCqnJBSyA8aXRW6mXeTOuZOYLuArU6dcYUplM2/9JC344Sf7d1TFBaf4I14s/mDbUQkefZ9arFXpH3bRzwcYyu5ygtYXEw2uatWISHkO14wrRNrwilYfL1Z0WN5vdF26iME1oK3nc0bf9fgtRCyZzISSda/Je36rDtYO834Av/EC+UKBs+Ny6t55QZmuJbCHSiupzoiOJCJJyVPaib+4AnQZHzRE63eP8kpIpLr68jjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUiB+kwzbEiS2nnSIIlXf4AH8uhtD/j1STRZd2qeXsY=;
 b=pQY8wDim+ltngLTa9uojtN17InVseYqTTYxpEJDbKQxEwdWIilsqC61DHsFFghOFskKNRmEW94uwyeIaPDxTNRqZ6nyz6RsgY+gYfY9LSVFIzAZWaP2TgIVAnfMSgEiD+2EqVZcDM8DCM7DVCIiGSsEpPm4tiIM9lq9lu6trvyE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Fri, 14 May
 2021 15:30:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 15:30:54 +0000
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
 <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
 <6b9d7c37-aaf7-1745-260b-4cce8f0891ee@virtuozzo.com>
 <8008b39d-905c-3858-a96f-8609801a4ae0@redhat.com>
Message-ID: <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
Date: Fri, 14 May 2021 18:30:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <8008b39d-905c-3858-a96f-8609801a4ae0@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 15:30:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf93dfd-db67-49cf-c953-08d916ed435a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3224E4DBB423E8F71AF1AB70C1509@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2DMU9XloFTw16pKzWrAyXR5DGnUkq0hMi5GrPL3yJVpk1eFig4Z9XOSOtLOTwfo2oRrE28vo88Q+DFb/igNvwflEHW0GmG17Uq6gyYsg9FmEM/tgpxF1Mpws6Q5/1r+YYZF6FUbM27M0lsB6OAg6RcMy2+/+HsldNauX0bHim3rT7NXCvsOyiFf/Uio3pzKtvgYbozTnyj0M9p3wDI0FaK1hO4xCa3UjWFdGeRQHMvit7njXEXTJ5FohsG5xADSakI0Ixe+inEryzNADmzOalRXWXs6B53p+zSMWj4x1e5S028dDjU+1ocJaJdjm0h7qKb62VAEAnYp1yNdLPCRd/aPLwSGKAYzE5BwIxTYxXUBH1mCmNU3HNQNNwrKb04YI2/2Iu/S5feZ2eSD5uTJe+cA8HTIWTAwvx40sapTMGj2CtZcO8XXXApuRqgV5pDyOSIpsLoy/FYVObjjpW7PTcqjXDcB3oXz2ELJ6G/Fmv4Cz4CPYva5Yfv4VFUGxwkrNjwSU09TEdL0X8rRMTb4HOfG3sEuezBZH97WvyqNsT5KAh4ik4gj8yD8Io8N1nJkW+ggnUS4hFx/YGubRczCpQMQmxod+HEh/XuqNFphGu/Q7sbRJn4YphGwEsX+7tIQWd9Kn42cLfwHJOfzkTcsN1pXI1b9aUXrARF+dXZfpszBGU6ZDcgqN9rwisfywiFg6cXORlCiof8pI1NJ4A5QhL3Mf+mvaq6WR2PCjsLhU4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39830400003)(86362001)(31696002)(6486002)(6666004)(956004)(110136005)(66556008)(66946007)(4326008)(8936002)(36756003)(38100700002)(478600001)(66476007)(52116002)(31686004)(53546011)(186003)(8676002)(26005)(2616005)(38350700002)(54906003)(5660300002)(16526019)(316002)(16576012)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?I99yaqqhsKnI9AsPwE5ii9dZzMoWBlDWPU4p6k3iofTK2r/lR7aal3cF?=
 =?Windows-1252?Q?+qrwlPO67Ej+Rl17TPHNOM1qUJLA8KuzRgUk/Oktb7maqw+SEukI1Mrw?=
 =?Windows-1252?Q?HNnMZHsX0LqBe++yICUHl6AhRJchwvvLk9zXsrsIlWppeEIRb60XFRIw?=
 =?Windows-1252?Q?/s/I6to1YJcx/TflDS/KH6pcJRg9pCV+0tL5B998K8IHY5Zrz7bp3r/A?=
 =?Windows-1252?Q?IJCWmMza8VAAorf9rL3bTxdSnM0bxYVVlRDLDpe48KLIHvc8caobp0se?=
 =?Windows-1252?Q?XsiD0CGSLKdTME7tk16C6jqaQXRUNt/Uy4ixQXBLUItca+kF1V+weUww?=
 =?Windows-1252?Q?xtlfY91IlHRWtDTyOK4rRBgDMCNHU0zWlY3W2Mb20NqG9ZcLMZAHQVQU?=
 =?Windows-1252?Q?uRchjZKqPq53FPINqVi2KP/zjYOvUmW2adXEu7fif0lh7cKnxOpznsW1?=
 =?Windows-1252?Q?JanfiAb3BGBtp7HXTzBlmSk7BGbKbE0ASsIqj23u2f+SiNx/nTA9FtU5?=
 =?Windows-1252?Q?gUdujbKOnZqkisRnZSkh7CdgbmgqmVsi6+c23GVZ4TGFQp4AU0umUknO?=
 =?Windows-1252?Q?AedNzdbB4KvIs2SNtrEXvyfvzrAX4J58N8Kdrfn66Azw9SsJMCrQ+oLa?=
 =?Windows-1252?Q?amLqVvTHANHn0halLyh83FnbHT6h6m4P3sA427Qiwb4eqGg2hLPv2ZK6?=
 =?Windows-1252?Q?oNQaqmId+urSWpQGrGDxrR+kMLvWDPYQ0Y4iydf6jGkrV9SoNGobWfUZ?=
 =?Windows-1252?Q?Oz0ts9Ko3jqZwsDYJGv6MaT7R2yHQCRfJ1BJl47u5x/384R+272rEqvK?=
 =?Windows-1252?Q?H+XsxzEiiMoFUc66CQT51s6uvsU+BaCV/n83pRC3eWZvqjbSgFux/S6A?=
 =?Windows-1252?Q?xQDmqFN8Q5RRMCsFSGUHZ35h7/QuRAHNXjJTTy9/OJd94RVwO6bvoViu?=
 =?Windows-1252?Q?0HrQqg3cSsm6HYRpMzK5dgtxH9NotD3D5tPHMIIYCpO2R+KaA8FtF3wW?=
 =?Windows-1252?Q?jo1eGknKmB4YGqzPFil6XgwyQO+lEmu14r+EpS76ZS/uS5dVQWDGbAS5?=
 =?Windows-1252?Q?LfX6dkMrxJpef8oexcXJWTzvVCZd+MzVyJtsn+jRjZi8Yw3ADotdwe/F?=
 =?Windows-1252?Q?b5uGY3T86HkyIEX4YQUN4MQVKdRjZPNEgnS9rHNuvSQTcQ2IU91yWbqx?=
 =?Windows-1252?Q?NV4Nfv0USLDUuQvoQkkoFvnJ5U/YUqN8WxUl8dIwig7+lfrFHAPX1fMg?=
 =?Windows-1252?Q?l5C9+WsMpLGGGqlAyppj/TzN1ruZO7PxIrg/Vq+zm+DwJ7qzIegwLR7f?=
 =?Windows-1252?Q?NmXiNkkhiDE2nGqR2HB/JqPjpPKzXNTiMPgu0+jU7vzj02wHNDNUh4Gx?=
 =?Windows-1252?Q?6DYds5EakGlK/AognfzjNCSZIU7Jh09ZE9WgE5HhasLYbeC1+oOdwm0b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf93dfd-db67-49cf-c953-08d916ed435a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:30:54.3695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAqBf4XNasipIOqFgRABOwTogVSoPt1EStlGXzhrag/EFGN3K6vmeHxcK59XJlRYFx28UbrZBIWuqiWve7z2A5dXXfReqzZXHCmOd9NCd6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.14.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

14.05.2021 17:32, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 14/05/2021 16:26, Vladimir Sementsov-Ogievskiy wrote:
>> 14.05.2021 17:10, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 12/05/2021 17:44, Stefan Hajnoczi wrote:
>>>> On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe Esposito wrote:
>>>>> co-shared-resource is currently not thread-safe, as also reported
>>>>> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
>>>>> can also be invoked from non-coroutine context.
>>>>>
>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>> ---
>>>>>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>>>>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>>>
>>>> Hmm...this thread-safety change is more fine-grained than I was
>>>> expecting. If we follow this strategy basically any data structure used
>>>> by coroutines needs its own fine-grained lock (like Java's Object base
>>>> class which has its own lock).
>>>>
>>>> I'm not sure I like it since callers may still need coarser grained
>>>> locks to protect their own state or synchronize access to multiple
>>>> items of data. Also, some callers may not need thread-safety.
>>>>
>>>> Can the caller to be responsible for locking instead (e.g. using
>>>> CoMutex)?
>>>
>>> Right now co-shared-resource is being used only by block-copy, so I guess locking it from the caller or within the API won't really matter in this case.
>>>
>>> One possible idea on how to delegate this to the caller without adding additional small lock/unlock in block-copy is to move co_get_from_shres in block_copy_task_end, and calling it only when a boolean passed to block_copy_task_end is true.
>>>
>>> Otherwise make b_c_task_end always call co_get_from_shres and then include co_get_from_shres in block_copy_task_create, so that we always add and in case remove (if error) in the shared resource.
>>>
>>> Something like:
>>>
>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>> index 3a447a7c3d..1e4914b0cb 100644
>>> --- a/block/block-copy.c
>>> +++ b/block/block-copy.c
>>> @@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>       /* region is dirty, so no existent tasks possible in it */
>>>       assert(!find_conflicting_task(s, offset, bytes));
>>>       QLIST_INSERT_HEAD(&s->tasks, task, list);
>>> +    co_get_from_shres(s->mem, task->bytes);
>>>       qemu_co_mutex_unlock(&s->tasks_lock);
>>>
>>>       return task;
>>> @@ -269,6 +270,7 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>>>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
>>>       }
>>>       qemu_co_mutex_lock(&task->s->tasks_lock);
>>> +    co_put_to_shres(task->s->mem, task->bytes);
>>>       task->s->in_flight_bytes -= task->bytes;
>>>       QLIST_REMOVE(task, list);
>>>       progress_set_remaining(task->s->progress,
>>> @@ -379,7 +381,6 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>>>
>>>       aio_task_pool_wait_slot(pool);
>>>       if (aio_task_pool_status(pool) < 0) {
>>> -        co_put_to_shres(task->s->mem, task->bytes);
>>>           block_copy_task_end(task, -ECANCELED);
>>>           g_free(task);
>>>           return -ECANCELED;
>>> @@ -498,7 +499,6 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>>>       }
>>>       qemu_mutex_unlock(&t->s->calls_lock);
>>>
>>> -    co_put_to_shres(t->s->mem, t->bytes);
>>>       block_copy_task_end(t, ret);
>>>
>>>       return ret;
>>> @@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>>>
>>>           trace_block_copy_process(s, task->offset);
>>>
>>> -        co_get_from_shres(s->mem, task->bytes);
>>
>> we want to get from shres here, after possible call to block_copy_task_shrink(), as task->bytes may be reduced.
> 
> Ah right, I missed that. So I guess if we want the caller to protect co-shared-resource, get_from_shres stays where it is, and put_ instead can still go into task_end (with a boolean enabling it).

honestly, I don't follow how it helps thread-safety

>>
>>> -
>>>           offset = task_end(task);
>>>           bytes = end - offset;
>>>
>>>
>>>
>>>
>>>>
>>>>> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
>>>>> index 1c83cd9d29..c455d02a1e 100644
>>>>> --- a/util/qemu-co-shared-resource.c
>>>>> +++ b/util/qemu-co-shared-resource.c
>>>>> @@ -32,6 +32,7 @@ struct SharedResource {
>>>>>       uint64_t available;
>>>>>       CoQueue queue;
>>>>> +    QemuMutex lock;
>>>>
>>>> Please add a comment indicating what this lock protects.
>>>>
>>>> Thread safety should also be documented in the header file so API users
>>>> know what to expect.
>>>
>>> Will do, thanks.
>>>
>>> Emanuele
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

