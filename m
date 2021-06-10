Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A93A29EE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:13:20 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIch-0004zR-VE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIbl-0004Aq-1y; Thu, 10 Jun 2021 07:12:21 -0400
Received: from mail-he1eur04on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::725]:27179
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIbg-0003Xi-Rv; Thu, 10 Jun 2021 07:12:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZX84C9415e50USRBAqCBN6xSmCDNVZXLetiBEgDkvxAVYGK1i+If5aYRLKuPTJgB4hY/8lTuGNdw/UkSkONhvDlel9y+DfnxBzCEdYQa1YzehBeS777MUX8BTZmzv3pdCU6XJqcP6nuHaTj0As4dIIvypJKGjyWMbyFFXROe4i+5Z3bfyiM0YkROvrbEV+YmVwqyK71VJrssFaawpArkn5CSbH6004PY941Kgii4a8R5qtat4VIMynkoha3Y8wEFRGyDnPXFh2/81n4n8RqncRTU1xFj7Qr9EciPxpm4/BIsWZnW+ycATkszyyp8ye/5oTK4N42eY9pHDFRbY+szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOVMrqrd+UWe+6gq+8gbqqIem1xT2Mkp/uoWlNK61j8=;
 b=RVplp5jIFwdeMD9Lr3mdIPZRKumNLZItZuHoCqZ67+mi7s5JpZoQ1JMGZSQEHq9tpOSVyqjBbyIEuDqVWuKxq6eUVo7KsIej/kJXej6TY/6O1yFA7Jgg7T7KX48aLy2hBLw/E+bLjJTy+SbceI3q23bBae9E+GugacbGmvTNZCyW02wfB4mHPwj32ePj9D1CLqxY6xbgKZ6RIx7qzAKQwUb6eoROddzhR7qrJek3citHSbsgFrhVrhsVBJ4zrCjlg+iOur3S8A5v4cF46Qf3JNRUQQNIVJ3FcYiVYfz0U9XFIJO31tvUYealGF77V62KglBiS63z/rGvV/FXdKxozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOVMrqrd+UWe+6gq+8gbqqIem1xT2Mkp/uoWlNK61j8=;
 b=kje/R2QjKNHDCnvDcfeR2zzk0GrJqN5F4lgojSxRM904MxHYdZVzy3uh10mZGqzi/cH+co6Fx8BQ9oj/Q0wf4fIAyUxyQY17R/Y7N4SMD1x6wpn4S9RDRVp4tqQagxUgNWcc4a6i6fXVQ1g6b6zyOjB3v2hfXTSAl9RExb5GKTE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:12:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:12:12 +0000
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
 <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
 <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
 <9d24d1c2-bcf0-59a7-f934-cd67bdff7fed@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ef104344-d857-c741-2893-315e9f0a77a5@virtuozzo.com>
Date: Thu, 10 Jun 2021 14:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9d24d1c2-bcf0-59a7-f934-cd67bdff7fed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR04CA0090.eurprd04.prod.outlook.com
 (2603:10a6:208:be::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:208:be::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 11:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e092d975-bf7a-4132-9e12-08d92c0098a5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134F9432700778295A9BA4AC1359@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LsHoSOYeYbaPH4uwFNyz6LwlIgHVTVmdbXpnZ8wQleZ3D2uc08wkZ1VguOdFGhlMiuNmi/yxWWggOvzdwfSWeKjqBU3D9hVLdRktKRQaJHfeth6DHbXf66MtGnjSxk7plZV1+Q1nrgX3r0K0s8Fd82RipQORN4MHSEjpMq81CrJat/Cy2DZR2mhQKsLf/A6XM789AFXDTUSXCDvbDeR2SP5irgVa4Z+vZGdjqk5rUw4DTZ0XrIB6HEg5Fseq1HT7BX4uYPgSPV4PX+Z+xRm9m5C0rucKYKT5qNLvtyT1DxxLA/N+ppEdUKNkxyzCawG9WvlifARU2cyOUc54ISX4TlIy6BH8raCnL/pisU031/kOFyQ3jxRP2dmato5h99zEw+aNRAn6f0Aqflr8ge5xJ38eemTTdF7hKKYmaUh34pqslVr3mXisiYTczoA2QKIxdGuoySx1Pxx4UjtF9brp6O7oLHp9Zbn5C6KMmq0RAsu7CZJXfomvhKU1XDGfYDbvRJ4hnTEEmX656ukLtze8mpaDUXEChpoiKAATK8buhBTVvoNBagUyH52cWdGhvH4eoODzK2Yp0iCXc8914lmtVUhxQLM93PT7EA+Ce/iel3KzVaybBKYsNas4+KujyfX6csNxTC9zWS+8VYZIdFTLJwTOcUTDq+fh82dRYYZhutV7dno8Ed3VceAbQYkeY5Fu0tIAzyN6r9mveVdI5zTVn8VvBjUK4E3GsyTF2Lr43+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39840400004)(136003)(376002)(26005)(53546011)(186003)(86362001)(31686004)(83380400001)(16526019)(956004)(6486002)(2616005)(52116002)(38100700002)(38350700002)(36756003)(5660300002)(66946007)(66476007)(54906003)(8936002)(478600001)(66556008)(8676002)(31696002)(316002)(2906002)(4326008)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?em03RTJhb0llcHNuNlVFNnZtaGNDYU9sYUp2WHkrSEJOYjgxb0w5dG9RVFNi?=
 =?utf-8?B?WDVvdjRjV2k5M1Nralh5SVVKbmZiQU42TjNHRUVaRTh0dlhEeERnaEZwY3VB?=
 =?utf-8?B?TzhScFhoK3F0enpkelV2YjN1Vk5mb0pOakpGaFk3dWRmOW5SdC9KbTB1SzJT?=
 =?utf-8?B?dDlFc0U0cFVlS1VJSEFSWHpWN3k3QWxjbkkzR1VRQkpiNGphTXNQY1BKQUpV?=
 =?utf-8?B?NjRhTXdqNUNTdk1UMy9wVm1oUCtYQmhXVENEa052akpYVHlXaHUzYmZjOG9W?=
 =?utf-8?B?UHBuMDlOYTJNaFFmSW40dWFwZEN6WnY2TTFSVmlyeHJ6NFZHWjFMT1J1ODRO?=
 =?utf-8?B?c0I4NG45M2E2bHhROUk5a0h2ajhQSGdUeFJ3SDYrc28vUXRrWCsxS2dpV3JL?=
 =?utf-8?B?WTVMdDhZYXNWSTJyS3c3d0tEREN0eTFzdGhyQjRUV2FuSk5DR2tLTTNiNUNI?=
 =?utf-8?B?RU5SSWQvOEpTQmNVK0QrR0ZhM0s1KzlkNnlIT3liMitwM0Z6ZCtCUUNzcW9m?=
 =?utf-8?B?VEZjTDJ5YWdjcDJ5NUlVVmsyNWRXaWF3K0dGaDZUM1Q5Vng2d1g1cHlWNXR4?=
 =?utf-8?B?YkMwUHFldHdQR01UQjFUOVBmb3pGYktMb3MwbXNxdHJxLzNhWjd4VERhdnVL?=
 =?utf-8?B?MFlFblNSMTZvWUhDR1VVb040KzM2QVk3RlBiZCt2Y1BxcC9wdEVDeE1MSVd5?=
 =?utf-8?B?QUREOWVRT05UY0gwck8vaWhyWW9YVkdqTG0wcC84aFN1QkhKamJFUkt0RmRn?=
 =?utf-8?B?c2hCY2hmcUswTTNyczh6UjAzNkRIT3FhbnlSa3ZPcTdxWllnaDV1TTh5NFlZ?=
 =?utf-8?B?M1FSYUhHM042T0tET09WMnc4ZWs4UC9wNEN6MVN0SVhpRlJMK1BWdWNsMlNK?=
 =?utf-8?B?a09CR3Q1N2ZoTTBVcExVcXRBM1NJcU4xdC8vKzdRQys2c3JBdFJIT1dxeXh5?=
 =?utf-8?B?dFFMSmRSeDloc3crS1hPS1ZSUmN4MzAvZWF1SlV6Qy8wZkdrSEQ0Z2dRVGNa?=
 =?utf-8?B?NU1oa1lnVExzK3E1THJyMzh1V3BybmRUTTcvMUhGRmR4RlRaWjJ4NEthb0Zo?=
 =?utf-8?B?RUtXVHpjaTdNU3B1QnJRSHh3Q0MxczV0Q2l3Sk1kaCtvbGdrcUZNY0lGTXR6?=
 =?utf-8?B?cHIyVTZYcEhoTnJDZWxwOHcvbnNvQ0wzUk9mbGdEUmNtRW1xZzE3L2JuZmJh?=
 =?utf-8?B?Sk9rSjJnUkc0RjR4U0drbkFOcE1SYTZqejcvMHNXUnByNGNKOSsxaG5DTmg5?=
 =?utf-8?B?NGE5MkFwa1dhMzk5TmhqcG0vbGRYdkl0bVo4WXQrMngzNUZYclJ5dlY5Wkkv?=
 =?utf-8?B?ME0yenMwV2pZMUx5M0JkVFRXRUpYZUp4WEtPcUo5RVovb0F0MGFnaVFpVzRr?=
 =?utf-8?B?ZDhzTm1Fb1JwOUVHQkt5SEhqb3JmM1VjWDBRQWZKeTVwaU5oUko0QmI5Z3Jo?=
 =?utf-8?B?Ym9IZmtQMXB0MEx1Z3dmUE96N21IdktRdERxL0dvZGQrRnhBRUJuYU14YU1G?=
 =?utf-8?B?Y1M4K2EzUXBiSVdBc1dQY3QvOEVaT084Rk9Ja0hTdVFhWGJCUlREemdHTW1O?=
 =?utf-8?B?ODMrL3FJWFN1RUZrUENOY05WcmY3MG9uOWx4clloenlJRGM5dkJwTyszNG1x?=
 =?utf-8?B?NmtNQjEzRUNFYmdMbjBqR0pFOEVyT2tIQXMvc3EvT1pzamdqakRuY0M3blNO?=
 =?utf-8?B?YkZxZy9JSjJjSVdwT0hOMFRpaUtZeUltZ1Z3YjNseTNicFR2S01uTjNGby8r?=
 =?utf-8?Q?T8j24APWZEvwfwUY3T/mim5khxkXmi/w2sQoI1s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e092d975-bf7a-4132-9e12-08d92c0098a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:12:12.6081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRzAC/kneP4BFR9qm+nV6FLYgaPJZvczaxdjbspbTTSzL1wPT9QTor66exJRczU6UJcsAuQjFPWBhaGv7dyPj7T7v/gzh6NYHJeH2wUx5EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=2a01:111:f400:fe0d::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

10.06.2021 13:46, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 10/06/2021 12:27, Vladimir Sementsov-Ogievskiy wrote:
>> 10.06.2021 13:14, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
>>>> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>>>> and BlockCopyState in IN, State and OUT fields.
>>>>> This is just to understand which field has to be protected with a lock.
>>>>>
>>>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>>>> and thus here left as TODO.
>>>>>
>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>> ---
>>>>>   block/block-copy.c | 47 ++++++++++++++++++++++++++++++----------------
>>>>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>>> index d58051288b..b3533a3003 100644
>>>>> --- a/block/block-copy.c
>>>>> +++ b/block/block-copy.c
>>>>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>>>       /* State */
>>>>
>>>> Why previous @list field is not in the state? For sure it's not an IN parameter and should be protected somehow.
>>>>
>>>>> -    int ret;
>>>>>       bool finished;
>>>>> -    QemuCoSleep sleep;
>>>>> -    bool cancelled;
>>>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>>>       /* OUT parameters */
>>>>> +    bool cancelled;
>>>>>       bool error_is_read;
>>>>> +    int ret;
>>>>>   } BlockCopyCallState;
>>>>>   typedef struct BlockCopyTask {
>>>>>       AioTask task;
>>>>> +    /*
>>>>> +     * IN parameters. Initialized in block_copy_task_create()
>>>>> +     * and never changed.
>>>>> +     */
>>>>>       BlockCopyState *s;
>>>>>       BlockCopyCallState *call_state;
>>>>>       int64_t offset;
>>>>> -    int64_t bytes;
>>>>> -    BlockCopyMethod method;
>>>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>>>> +    int64_t bytes; /* only re-set in task_shrink, before running the task */
>>>>> +    BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
>>>>
>>>> hmm. to be precise method is initialized in block_copy_task_create.
>>>>
>>>> And after block_copy_task_create finished, task is in the list and can be read by parallel block_copy_dirty_clusters(). So, @bytes is part of State, we must protect it..
>>>
>>> So if I understand correctly, you refer to the fact that a parallel block_copy_dirty_clusters() can create another task and search with find_conflicting_task_locked(), or in general also block_copy_wait_one() can do the same in parallel, correct?
>>
>> yes
>>
>>>
>>> Here there is also another problem: if we add the task to the list and then shrink it in two different critical sections, we are going to have problems because in the meanwhile find_conflicting_tasks can be issued in parallel.
>>
>> But we shrink task only once, and we do it under mutex, so we are OK I think?
> 
> I think you understood, but just in case: I am thinking the case where we have:
> T1: block_copy_task_create()
> T2: find_conflicting_tasks() <-- sees the initial task
> T1: task_shrink() <-- bytes are updated, T2 saw the wrong amount of bytes. This might or might not have consequences, I am not sure.
> 
> But maybe I am overcomplicating.
> 

Both shrink and find_ are done under mutex, so they can't intersect. But yes, we should keep in mind that if we do find_ under mutex, and then release mutex, the information get from find_ may become incorrect.

Check callers of find_conflicting_task_locked():

block_copy_wait_one has one critical section.

if no conflicting tasks we are OK.. Are we? Ok, look at the only caller of block_copy_wait_one() - block_copy_common().

assume block_copy_dirty_clusters() returns 0, so there no dirty bits at some moment...

than in parallel thread some task may finish with failure, leaving some new dirty bits.. Then we check that there no conflicting tasks.. And then we go out of the loop, when actually we must retry for these new dirty bits.

So I'm afraid you are right, we are not threadsafe yet in block_copy_common(), as we should check conflicting tasks and dirty bits in same critical section to be consistent.

> 
>>
>>>
>>> So, is there a reason why we don't want
>>> QLIST_INSERT_HEAD(&s->tasks, task, list);
>>> in block_copy_dirty_clusters()?
>>>
>>> By doing that, I think we also spare @bytes from the critical section, since it is only read from that point onwards.
>>
>> This way find_conflicting_tasks will just skip our new creating task.. And we'll get conflict when try to add our new task. No, we should add task to the list at same critical section where we clear dirty bits from the bitmap.
> 
> 
> I agree, with the above.
> So to me the most correct solution would be to call create and shrink in the same lock, but this creates a much wider critical section.
> 
> Alternatively, I can leave it as it is and just update the comment.
> 
>>
>> Then we shrink task in another critical section, it should be OK too.
>>
>>>
>>> I am also trying to see if I can group some critical sections.
>>>
>>> Btw I think we already talked about @bytes and it's not the first time we switch it from IN to STATE and vice-versa...
>>> I mean, I agree with you but it starts to be confusing.
>>
>> On last review it seemed to me that you actually protect bytes by critical section where it is needed. So here I'm saying only about the comment..
>>
>>>
>>>
>>> This also goes against your comment later in patch 4,
>>>>> @@ -212,7 +222,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>>>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>>>>         /* region is dirty, so no existent tasks possible in it */
>>>>> -    assert(!find_conflicting_task(s, offset, bytes));
>>>>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>>>>         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>>>>       s->in_flight_bytes += bytes;
>>>>> @@ -248,16 +258,19 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
>>>>
>>>> The function reads task->bytes not under mutex.. It's safe, as only that function is modifying the field, and it's called once. Still, let's make critical section a little bit wider, just for simplicity. I mean, simple QEMU_LOCK_GUARD() at start of function. 
>>>
>>> Where if I understand correctly, it is not safe, because find_conflicting_tasks might search the non-updated task.
>>>
>>
>> find_conflicting_tasks only reads bytes, so it can't make damage.. Anyway making critical sections a bit wider won't hurt.
>>
>>
> 


-- 
Best regards,
Vladimir

