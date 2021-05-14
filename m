Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFE3812C1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 23:17:25 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhfBT-0001fZ-W6
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 17:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhf9m-0000cw-11; Fri, 14 May 2021 17:15:38 -0400
Received: from mail-eopbgr10097.outbound.protection.outlook.com
 ([40.107.1.97]:4994 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhf9j-0006jK-3R; Fri, 14 May 2021 17:15:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESg45D79hu/acgIJLdxbyGWVBwFmFZiQaucfEszU1Jcypz1rLL3B6SI4BWOGQ1IM9CXaCqAsX/KnF3Ij5kWzzsDbWngxQvbMnhhR1/05umvABwsgE9JtDbWaKr8K6R3r8iyZaWiCjWRdtzRAaRTuw2iTUZflfPxQJk21FfcgfetIBklOFBqlV3gtBhkFkWrc0QcOKkPgXUkA0HVl8wkVlge7VchgBDkJTYxiO/4BaPSGlnnYoVel9Fn0LugOJdoIqE7hUTBNuDvnHwr9Y/BJUsuSB05/Xbv8hL1eay58IRdU9X6aoB5lIAPnn/mItwmmr+W8X+R+HuY+TGa7hwZxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5TE0OqKFcinilKpwTx97rZwh7AjqW4ej1PGXiRJ2ZY=;
 b=fbQtBvr/DWRTnfu/Lxvx4F2rOLOz6hN94otech4BbzhR3ng+FTwGKRpcCES5OHwgGLm8ub/NebRbMthmr7vveSydS2/ndaF5BwQsQ7Gkn8S2eJlBX/rToM2lt2Ji1V4UhDh2/QVRS7Aj36KUCCGBhhOC7t30X2zE+G/jJWq7YIHmIJOd/pt0T5v5/0QSP5uUSQEI6HThYEwTa+VcuDc0Tmhv6TOJYOelTq20Fl7Au/UuRQ+2MvFSLJKpqhPF8inyqyLFBkEY7pbG6Od00hVQO++ghyvoy9cArOwMAlUgaBxGlRm91cteXuCm51h+vHG6WzMjTK7pr1X00ZoHCrqjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5TE0OqKFcinilKpwTx97rZwh7AjqW4ej1PGXiRJ2ZY=;
 b=NIjRAR5cTknTKW1csxoZFRsCyGqrzImxhnNJ94AniNnMB39aIu99dS4tPOBEAn1NBjeqq4McmxlP7PesmiNVuuLWhFH9B6xHuUWLAQIDGw8AiTPq61L6SJFUoF+/xxXFe/p9ZTcY7gc805pok9tBwvE4SUV6js0j+qOMPIrPPyo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3576.eurprd08.prod.outlook.com (2603:10a6:20b:4a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 21:15:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 21:15:31 +0000
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
 <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
 <ce9c970e-d7f2-fef9-8b07-b1fc5f634cc6@redhat.com>
Message-ID: <dfb58ab5-a7ea-edf8-5278-6b666aa6097b@virtuozzo.com>
Date: Sat, 15 May 2021 00:15:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <ce9c970e-d7f2-fef9-8b07-b1fc5f634cc6@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 21:15:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd9bf2c-a7cb-4d02-72b3-08d9171d67d6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3576:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3576A950855069E3C7F36AFFC1509@AM6PR08MB3576.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39tLuiv3Qrq/R+EdWSWZN0sFUyJIUpiFGCfzY7l8dDLqXkQxuQLzmEXXgpVg5WOmhwfb5oDdULb1jppZAHIqeSfOlOHosjBXNhJ//9C+xue6Uq0XBTUa0xmXwUyETWMdPlF/QTP6r721AQg/aUJZgQehLbBteowrwkfXUer8E4TphX1Pm4tYlPAaauY6VvQ2D9IqC+uUTQbb0/eqkdgr+W8kivmktGFfnzPM/je3ATQ81/fze2RvzERqjpK58NADD1IEhvXkwbMcXj3dIF0c4EFCVpcdKF4rJKEC1mr3JEGpbvjsYVNNhs9bTRb8/LrD+S/0SO/Pu6XaaGBQ/E/O9O7KOb8pDkkkNMM/OHVGeUi+x6B9dYHjGcrZbtkIFRabuoTjDRQkxCv4GsSQR95WP7LKeHIqEwniKYIH9GdrpvldeOh5hx7a8oiAo0xpGYuN9u+46jo3X/7nAn/uYaT2Hm2xkSIqi9HtREt6kEMY32CwvMNz0ooMn3N4FmgnmeYiyc1sBLHQDsb6CDAP7hH0ioYfchHdCLWXhzGMkCfxW3WqR1UpuV6Y0KTR0C8M/UkRH3x2agvbUWZrCVpQfBgLDLXEAzHSazjNRg8thjDjV2GcbIxKSXHAiqHzJvUUwF/OvsZ5JnXvIEH4+fdnHnW+upOyFx+VXFFMb+zlRH9kReZ/SqI7yXxXGmeYA/H7BkFFcJ4Tb6aLiWfvLv8Mv+fFrNWJObNvV3Niqq8dJwClB7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(366004)(396003)(346002)(16576012)(31686004)(52116002)(8936002)(956004)(38350700002)(54906003)(110136005)(53546011)(2616005)(186003)(4326008)(6486002)(66556008)(36756003)(316002)(16526019)(66476007)(38100700002)(86362001)(8676002)(26005)(5660300002)(83380400001)(2906002)(31696002)(66946007)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?l8yJ9cbE8gVb8Z+BgvKwa4fK0oMi2pjx+pA2iCtBHwd6nSox1PwDjYGU?=
 =?Windows-1252?Q?kXhYtJCcMXwEFF8osDKVG0faUJF1OSVCqHergD+1gRJF55N2S5PYdiAs?=
 =?Windows-1252?Q?WboB0Q5RbIqWrEWWJqOaZzHFtZimeJc9GBxEzfk4Qq/ET+GwJgJ1Quna?=
 =?Windows-1252?Q?35gb6Hy7vFPiBhDAs3Wdk7ndt42uzKZCfd9rEc+W16JSawa2C58RagEn?=
 =?Windows-1252?Q?io9nWTNzESeUmipI8w9MKdcbGo0tWNDkEpsoj2zioun7iv0mxg56yyMj?=
 =?Windows-1252?Q?XiS2jQTh0ZDm22dPljEQnxQbwRzmvem1oroq6jiH8tUxiD9KjHcrPyvr?=
 =?Windows-1252?Q?mfWTYzHEk3869sXsbzww5uLnnNQZ4dS960/AROkv/BtzI/IwTVUlNcB6?=
 =?Windows-1252?Q?kanKwXKtEPkm1gG4GC000wYJ7kITp4CgVZ/5zQ5DjPjH4GnZ34lAC4My?=
 =?Windows-1252?Q?ne1wnbbwIxP6SshfzJDN9ONhB0RqzshyBZf3r43OQ7t4HG9OYgNGfviV?=
 =?Windows-1252?Q?kPdo4X5mZUQ1546zUYRYgZveYIwAIta5p+6tRQ9dq77gmR75IH/Lzr4J?=
 =?Windows-1252?Q?Cbxcm0Rn8N7GF/2ps+heECse7seiSSzTrWii8cuLt8pKsQosZjp+Dmhx?=
 =?Windows-1252?Q?Z7HUEOB4Vkn6q26fCtDRdVn56AHN/oDc9nGSnzS+sg+QJ9A1KoZN/AOb?=
 =?Windows-1252?Q?JpeMfveqg1cd47KCTgcZvNm8X6ppwc+nvXian6mMP+RoRCaJ8/hqiNUd?=
 =?Windows-1252?Q?V4Z7gu1TdnsilfUgt7uW4X5uWRHYAT1T+kNxXN49CLXxZ3FIn7ZQ2wiD?=
 =?Windows-1252?Q?6AwpqGlPAYu9t4/9KvolVq3LgYmOX3pU+okGUZMQVFho2LR5/TEscukY?=
 =?Windows-1252?Q?5f4YXIu1ojE9HxsOYgcA31adZ7UNsnxOKrvLnywGdlHL5AHm4jINEgrR?=
 =?Windows-1252?Q?0knQ/KNskUr8BX5ny4tDm3ZZkXJ6Og9XPeppM52zOu/fW477R5hG1ZSr?=
 =?Windows-1252?Q?r3mkZo97a0rDZ2YlLLL6JQP44i39HS9GzKP+UJZ2DtI/AVvYKFl3FvwX?=
 =?Windows-1252?Q?0pE+NnUmew3nP8sCcuSD/HZPyWCDWq9oIIaxC9/ncSZxHvSL3OLtcADs?=
 =?Windows-1252?Q?Owc4SlP2eI/PjrAOSB2OTx6Io6hPBES9nx6oNYoJBznEa8C5P0y+XTG3?=
 =?Windows-1252?Q?BECUargTbO2CiMGUbPJTWvh2SfIG5Spz1L1RdGd/WH4TQErvnrABSWrq?=
 =?Windows-1252?Q?9StVFwLUuQIbygZ7L+bUa36pL3d/c9FmBpKiGU73wrMWYcp1IhuTp0mY?=
 =?Windows-1252?Q?cfIH6+OljS38PUir5mMfVELcmF09yVwgC5zSaivylxz/tASjuf8V2w/0?=
 =?Windows-1252?Q?QoUqtBcx8QwWL8Ely5cPJShcPsfK0rnEA/8JPA01fu2J//PX1cgBweaM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd9bf2c-a7cb-4d02-72b3-08d9171d67d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:15:31.4587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufDWjzeIBQwOembzRVY9mfInC8JWbbiDbda1J7DLrdXWCp4KpqPLdGweK8u+/2r5MWFJyE80Ee+hftZAJDqa90L6SkBCfJTuMcZ78YqHaJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3576
Received-SPF: pass client-ip=40.107.1.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

14.05.2021 20:28, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 14/05/2021 17:30, Vladimir Sementsov-Ogievskiy wrote:
>> 14.05.2021 17:32, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 14/05/2021 16:26, Vladimir Sementsov-Ogievskiy wrote:
>>>> 14.05.2021 17:10, Emanuele Giuseppe Esposito wrote:
>>>>>
>>>>>
>>>>> On 12/05/2021 17:44, Stefan Hajnoczi wrote:
>>>>>> On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe Esposito wrote:
>>>>>>> co-shared-resource is currently not thread-safe, as also reported
>>>>>>> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
>>>>>>> can also be invoked from non-coroutine context.
>>>>>>>
>>>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>>>> ---
>>>>>>>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>>>>>>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> Hmm...this thread-safety change is more fine-grained than I was
>>>>>> expecting. If we follow this strategy basically any data structure used
>>>>>> by coroutines needs its own fine-grained lock (like Java's Object base
>>>>>> class which has its own lock).
>>>>>>
>>>>>> I'm not sure I like it since callers may still need coarser grained
>>>>>> locks to protect their own state or synchronize access to multiple
>>>>>> items of data. Also, some callers may not need thread-safety.
>>>>>>
>>>>>> Can the caller to be responsible for locking instead (e.g. using
>>>>>> CoMutex)?
>>>>>
>>>>> Right now co-shared-resource is being used only by block-copy, so I guess locking it from the caller or within the API won't really matter in this case.
>>>>>
>>>>> One possible idea on how to delegate this to the caller without adding additional small lock/unlock in block-copy is to move co_get_from_shres in block_copy_task_end, and calling it only when a boolean passed to block_copy_task_end is true.
>>>>>
>>>>> Otherwise make b_c_task_end always call co_get_from_shres and then include co_get_from_shres in block_copy_task_create, so that we always add and in case remove (if error) in the shared resource.
>>>>>
>>>>> Something like:
>>>>>
>>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>>> index 3a447a7c3d..1e4914b0cb 100644
>>>>> --- a/block/block-copy.c
>>>>> +++ b/block/block-copy.c
>>>>> @@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>>>       /* region is dirty, so no existent tasks possible in it */
>>>>>       assert(!find_conflicting_task(s, offset, bytes));
>>>>>       QLIST_INSERT_HEAD(&s->tasks, task, list);
>>>>> +    co_get_from_shres(s->mem, task->bytes);
>>>>>       qemu_co_mutex_unlock(&s->tasks_lock);
>>>>>
>>>>>       return task;
>>>>> @@ -269,6 +270,7 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>>>>>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
>>>>>       }
>>>>>       qemu_co_mutex_lock(&task->s->tasks_lock);
>>>>> +    co_put_to_shres(task->s->mem, task->bytes);
>>>>>       task->s->in_flight_bytes -= task->bytes;
>>>>>       QLIST_REMOVE(task, list);
>>>>>       progress_set_remaining(task->s->progress,
>>>>> @@ -379,7 +381,6 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>>>>>
>>>>>       aio_task_pool_wait_slot(pool);
>>>>>       if (aio_task_pool_status(pool) < 0) {
>>>>> -        co_put_to_shres(task->s->mem, task->bytes);
>>>>>           block_copy_task_end(task, -ECANCELED);
>>>>>           g_free(task);
>>>>>           return -ECANCELED;
>>>>> @@ -498,7 +499,6 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>>>>>       }
>>>>>       qemu_mutex_unlock(&t->s->calls_lock);
>>>>>
>>>>> -    co_put_to_shres(t->s->mem, t->bytes);
>>>>>       block_copy_task_end(t, ret);
>>>>>
>>>>>       return ret;
>>>>> @@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>>>>>
>>>>>           trace_block_copy_process(s, task->offset);
>>>>>
>>>>> -        co_get_from_shres(s->mem, task->bytes);
>>>>
>>>> we want to get from shres here, after possible call to block_copy_task_shrink(), as task->bytes may be reduced.
>>>
>>> Ah right, I missed that. So I guess if we want the caller to protect co-shared-resource, get_from_shres stays where it is, and put_ instead can still go into task_end (with a boolean enabling it).
>>
>> honestly, I don't follow how it helps thread-safety
> 
>  From my understanding, the whole point here is to have no lock in co-shared-resource but let the caller take care of it (block-copy).
> 
> The above was just an idea on how to do it.

But how moving co_put_to_shres() make it thread-safe? Nothing in block-copy is thread-safe yet..


-- 
Best regards,
Vladimir

