Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB427380BC2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:27:22 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYmf-0001GF-EI
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhYlo-00008a-5K; Fri, 14 May 2021 10:26:28 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:16673 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhYll-0002iN-L2; Fri, 14 May 2021 10:26:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaFn/xa3+aUeRQacMRZhZIWMyQ1sSg7fXQBomX83DHyfD0ItE8NlVQ5sdjlOU/tgjW8wHxOxPAPOFuSHPamdxflXNEnLgMJzlcSUdweRvfPooFiKCE1nNqaCoaYUmb3j/5LsZCGjb9Y5ABKCXV5sL9fVq9q6wDynQYFLj60Z8fo70DDz1IqjvGa4ydtCFNr8LEGpKiFbpzQAd6JzTD35mSEyr3rY+nIWffc05apyI+E8R2G/jRgAGJfeBuHNPVm0ieIE8kI2fyKDSES0qo9Opcmr0+B6gf9eXVmvnYHO4xnfDJplUam9ujRRk6F7uP+zy+nt8bFbPDx3e2fED0Dl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP+qc7brw03j9gjKWGJU3Cxo4lqxDZfvlqz0+7g226Q=;
 b=Ic9SQdnEsvTcmZOKrUa1QxLVG0rNE6R9khTLHH2MzVy60qrE0XDHCQBBKUoicBft4HyQ8DoPsH/vsmJMgmXrpu1/1UKDafAQUFgS4+Q07Nuw5hCIOe38P7YGCxuEdAmAjFdKZg2um394aMoaOL2GDVaNjg/ixNSt7may6IqiOoVTzgjSCbH6lY/v5Cb1XiRlAYm9AADAVgVeFpeNjfaFPXSvdgGCqEq1EzKupgrwZ3IldsjhlxsZfSlqhOpAH+OILcYwGpUi9mKFM7trac/1kqNHQXHyCN7OYDp5cTIztMu/58r8ZEFG6zESm2Hjs6hQ0/ISgwI/odJJoxZzlkUvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP+qc7brw03j9gjKWGJU3Cxo4lqxDZfvlqz0+7g226Q=;
 b=gU3XbmPC7VymSVeoFDimNMDOE9ysBrUb073vAQnW7N0k5mvVlh56ygSoAcpz4NB+JgyUZfyZ4+4EFprTlw+Xy/gcyuZRwZbGr2ZWTWix4PPR/Nu6TPJWtvY2v3zy6Fm8DMsKIthr1EkII9hF9kl+40cissUSErNlAmAdnntJQiA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1842.eurprd08.prod.outlook.com (2603:10a6:203:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 14:26:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 14:26:20 +0000
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
Message-ID: <6b9d7c37-aaf7-1745-260b-4cce8f0891ee@virtuozzo.com>
Date: Fri, 14 May 2021 17:26:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: AM0PR02CA0161.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 AM0PR02CA0161.eurprd02.prod.outlook.com (2603:10a6:20b:28d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 14:26:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f92471b8-105f-4092-7321-08d916e43e4c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1842:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1842B601A7CD34C0A779915AC1509@AM5PR0801MB1842.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6X+e6kvC/rljPr7D9Ez1CTjWCLvT8NvtMjLoNjCPBgR/9ZP/xkzx4OUMVtXjX772Pnj0gA9s32OxLRL5JINSoTFuhpbWhmg1YSsEM8L2EH6Ltiya/pxORva6nY3eDD9nClQve0Tg85Rb9Mg3TEYYxEfWKlt0/tPzkLC03VpEHmYtU71AGUYW02HplKOVMnOo0XMSFnMXdq6WZbLmuBIjPJTa8WWiZQHXI64CeuZ56VpahW1/441h3A8/zBT8RkmGGWpPyOuxd3CS+6VAzaYR8JuIN8dXSJAMEF3QLUm94xI1AOoQQqW6mUpqwc8iitxnFkoUHgGGIjBG8ylyNQgNEYyFdtm0b7R/gMfOdT41kDL+Xev6ZJbQegALLv86cJHl/FfX+VcaWvuaTjj9LFuRPh0vG88thqoOCqbamsx/9+pC6HvY5+TGjeHyw+rQP8F6xfe0GpSyqzFZonH2OWHqsky2rrVnTY9InM+MQSOgKKcMGy5j7CH4/mFOsgpL6DeRcF/Fm2UFaqPMgThYQev4RzrxM8Z/rU4xDz+Eyd+OtMC1lFtGeM+mWDbro/zSsWRcmZq+33cHzKO4lWsymOfVkPO2Q7ShHaNPjxCAjTVwpRjXor6367MvI3+euNXl76JdxVsGfk+KNVHGq8/0dd9iuV9oqOL4WabUcXvh0uyt30zp+1ryZgoJw03H69iN/nz7r8a1I601WZk+uHAEbH31zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(6486002)(83380400001)(86362001)(8676002)(53546011)(8936002)(31696002)(66946007)(66556008)(52116002)(26005)(956004)(5660300002)(498600001)(38350700002)(186003)(16526019)(4326008)(2616005)(16576012)(110136005)(38100700002)(2906002)(54906003)(36756003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?fTQ9y+G+28cZe8G98M6MQnVGsf7C8BBT+d8Td4sW324Z/OajhG9kQJLN?=
 =?Windows-1252?Q?ED8AzbHqG7qJaYQRAv2QNKhhjHJMtPJagrj52FmTLCqjQNBRQMIk/oPf?=
 =?Windows-1252?Q?so/CmRLE1MlDVivJcCPz5XtNlWmSgYtIgQeqto+iDG+nP0CLGgF52tfs?=
 =?Windows-1252?Q?ChVAJjIZW+V/V1sQmxbBZ+vatUvhuN6bPzmU8PaNfTc6pIjbjDB0xNcn?=
 =?Windows-1252?Q?MUaKwrKMxAgPufjOT5Uw2ORdhmYXp/LIEFTnbNWiLmAqjToxr9MwMkQ/?=
 =?Windows-1252?Q?4SyGMvkgHjnNgsnvpY31tPB5FWM8cfZD3ciSPcP5EEOl3cg/59f6dsOR?=
 =?Windows-1252?Q?BAz4bIMJXYQXzMEcAGOJIQqH7jxdL2cWcwRfjIU1O5gn4W8sCsnEtcpo?=
 =?Windows-1252?Q?B1ua3JaXVHvQ27VACXyfa+0thy93cSu3KfjlHhU7dkukM/NCLtRjYiZK?=
 =?Windows-1252?Q?yS6yoi8ban7KlQrrHhbkj+9qHsgqXY0681VemVT26d7fxZ8sH/9PBjId?=
 =?Windows-1252?Q?hHQgUe8+L5wV75WSkA91PmRiEiqdaFYnd9I4lqn+8L5hXWZE4YfBmUgY?=
 =?Windows-1252?Q?ka+KC8EjoYAd8sZKfKByUzQDpYdHGDZ0qruJTBtic2YszgFXfCzLL9Il?=
 =?Windows-1252?Q?pHBppPLy5HJG5uXTevr0Kkl52gafb/P+PZ0JMxjdhdlFP9pP+PF/TBmk?=
 =?Windows-1252?Q?5MgFQ6VUpfGsxMIhvf7rIZhD0+gGa1O7JFgxqprt0ykE6aN1GaAcWxyr?=
 =?Windows-1252?Q?+pQJS4LAsOHqjC4ZzCA1wNLR+QSyrub6zs5ewv4qdp6JkV/yA3B/NM76?=
 =?Windows-1252?Q?pKVLnl5v9sE7LebBgNKhBFCvqqvvya9Vb21h+rp+Rl751w0aPtBhv34y?=
 =?Windows-1252?Q?Yrc0x2TLq8Bdusy1wQ5yy9nChTmH4U7bxt2+QBoS9R/+EwyH980ai1La?=
 =?Windows-1252?Q?TI4hP9UNEXHxGEFWgjkyEkC3CefsGxJWhQiscenZq5aSQL70jFLp8glH?=
 =?Windows-1252?Q?lx2GzYb5XSF9V4AwufR/Wl/ukpBFO87lKgNT/Ql6gg27JMCJVjv5I+Ob?=
 =?Windows-1252?Q?jIbRq4P3AFKju/ZaWelVuy/wjtjFzsNMbanYtq1UNqTBL9+TbhF/jVjO?=
 =?Windows-1252?Q?fc3Zhv34PgrdTqSbe3T2fySI1/TvrDSrIvnIKtKPuxBSNgsPAVNEYXV5?=
 =?Windows-1252?Q?fGNdZ3GzflpcLAZWyt+ue5sijL0Gm/RjHbzuxcJPr3fJpTc7akKItFtC?=
 =?Windows-1252?Q?pNbV5aJGNBlEg8hN/8EiFMWMt4a99bpJ0miZ/ZxwY1XbUlv41/QZNgfW?=
 =?Windows-1252?Q?p5ecdDFuq+KZPNsfFuZzuiQ7GzMyGvIBLbIql9wPvBHmfXIosY9B3oiE?=
 =?Windows-1252?Q?kN+Nbowp1bNlIDSL6KPO4ciqHcApuW08Om8dBCW6Vt4D2zHCbmWGF6yY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92471b8-105f-4092-7321-08d916e43e4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:26:20.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to3gO8VMKE08QVhQiy7Wnz+Ai4hFg1kU2IKuBZwSGoyJR0+V8gsRmYTwG7hWxs0S0sRLn+884a2pcuHBFbPc/NGXyzVP4Gj8ef/Z2sMgvLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1842
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

14.05.2021 17:10, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 12/05/2021 17:44, Stefan Hajnoczi wrote:
>> On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe Esposito wrote:
>>> co-shared-resource is currently not thread-safe, as also reported
>>> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
>>> can also be invoked from non-coroutine context.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> Hmm...this thread-safety change is more fine-grained than I was
>> expecting. If we follow this strategy basically any data structure used
>> by coroutines needs its own fine-grained lock (like Java's Object base
>> class which has its own lock).
>>
>> I'm not sure I like it since callers may still need coarser grained
>> locks to protect their own state or synchronize access to multiple
>> items of data. Also, some callers may not need thread-safety.
>>
>> Can the caller to be responsible for locking instead (e.g. using
>> CoMutex)?
> 
> Right now co-shared-resource is being used only by block-copy, so I guess locking it from the caller or within the API won't really matter in this case.
> 
> One possible idea on how to delegate this to the caller without adding additional small lock/unlock in block-copy is to move co_get_from_shres in block_copy_task_end, and calling it only when a boolean passed to block_copy_task_end is true.
> 
> Otherwise make b_c_task_end always call co_get_from_shres and then include co_get_from_shres in block_copy_task_create, so that we always add and in case remove (if error) in the shared resource.
> 
> Something like:
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 3a447a7c3d..1e4914b0cb 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>       /* region is dirty, so no existent tasks possible in it */
>       assert(!find_conflicting_task(s, offset, bytes));
>       QLIST_INSERT_HEAD(&s->tasks, task, list);
> +    co_get_from_shres(s->mem, task->bytes);
>       qemu_co_mutex_unlock(&s->tasks_lock);
> 
>       return task;
> @@ -269,6 +270,7 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
>       }
>       qemu_co_mutex_lock(&task->s->tasks_lock);
> +    co_put_to_shres(task->s->mem, task->bytes);
>       task->s->in_flight_bytes -= task->bytes;
>       QLIST_REMOVE(task, list);
>       progress_set_remaining(task->s->progress,
> @@ -379,7 +381,6 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
> 
>       aio_task_pool_wait_slot(pool);
>       if (aio_task_pool_status(pool) < 0) {
> -        co_put_to_shres(task->s->mem, task->bytes);
>           block_copy_task_end(task, -ECANCELED);
>           g_free(task);
>           return -ECANCELED;
> @@ -498,7 +499,6 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>       }
>       qemu_mutex_unlock(&t->s->calls_lock);
> 
> -    co_put_to_shres(t->s->mem, t->bytes);
>       block_copy_task_end(t, ret);
> 
>       return ret;
> @@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
> 
>           trace_block_copy_process(s, task->offset);
> 
> -        co_get_from_shres(s->mem, task->bytes);

we want to get from shres here, after possible call to block_copy_task_shrink(), as task->bytes may be reduced.

> -
>           offset = task_end(task);
>           bytes = end - offset;
> 
> 
> 
> 
>>
>>> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
>>> index 1c83cd9d29..c455d02a1e 100644
>>> --- a/util/qemu-co-shared-resource.c
>>> +++ b/util/qemu-co-shared-resource.c
>>> @@ -32,6 +32,7 @@ struct SharedResource {
>>>       uint64_t available;
>>>       CoQueue queue;
>>> +    QemuMutex lock;
>>
>> Please add a comment indicating what this lock protects.
>>
>> Thread safety should also be documented in the header file so API users
>> know what to expect.
> 
> Will do, thanks.
> 
> Emanuele
> 


-- 
Best regards,
Vladimir

