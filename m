Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C252C0A92
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:48:50 +0100 (CET)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCD3-0001S1-UM
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khC94-0007o6-DL; Mon, 23 Nov 2020 08:44:42 -0500
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:32961 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khC8z-0005Ma-Dx; Mon, 23 Nov 2020 08:44:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkSmfWDFJXd244qez9iZgN42U5ffMkOJOTrifijVW4aE5xM8xg6OjX8fXPyN2cbxuAgiZyDrfdk2ebMPsvhfGI4MP0+d09KIQNszvL2rmn0ErgJAqLFPEFoX0z7Lx3xsF4W1eP/ZSngUFnasZHNdJmgnp2tLJaK1uTEs7DfvOW2nPyzuS/Pbym4SK3Uir4D7O1c6GGCl+YOdikjgoyK7RBuxXcs71IRFuPL5DLuOQj3b5foEqetJaBRUJt+k2tgRCBPZwyzk3YPRR4GPCeo4OKneFmC/K8E+AoioE/39xhWa4A3q3M+QrN4IqzqXoOATzkMWOhho9/F6AJjg91LLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqyiNPw38XwNS89vPsf4d9F/aU80TPYCD+4irwANV24=;
 b=Dn/b8Z0nnw37w+NFFA/QcLlGRwCAK1UG0GbMjYi5NL6pQL35pYeUqfmEriF0T+0DK8ECV1zRGHUelXXQmPBHtN7UhEQr+cRE+T28NicpasjOXoPJEVVvZMMzW7qzzSVG0NoLfevNdV80cntQiKzG68GgR8Z5mJ7rhrdJUJiD2vD3eaHUWe9oZQhNNKGRlYKB1Pxlbhh5B/3I2Mw68xPyk+JqMC8TIyYzFW/ohugLNSsqCDOVPDM0pfmNmXVrZYjUlQRgk/4R+zLQ/Xew7FA8obVKpmEEN/JJIXNYGa940sLYBrym1+5sU645PvhSuWZpF7JWoQ7VqT00i2cQ6Gm4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqyiNPw38XwNS89vPsf4d9F/aU80TPYCD+4irwANV24=;
 b=jqMSAqblHypRYqWkCHj3NQ9wtJBCgFMeK3NTkwO6iGVZYX0JJiSnSmOP82eJMJwciFBp2CqpHi9zPsjX1uOe7kum/pkvjTvd/KeyMe2dCnhFHtz3xfINNMurktm9ZyMM3D2GMlCJG3JbKi71InJGZ5eX+f3b4K+HHnwABS7GUwk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 13:44:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 13:44:33 +0000
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, jsnow@redhat.com,
 mreitz@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org,
 eblake@redhat.com
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
 <20201120163627.GD5599@merkur.fritz.box>
 <e72b2129-0e65-5f8f-a90b-baf03757b1c9@virtuozzo.com>
 <20201120172251.GE5599@merkur.fritz.box>
 <6d6b17b9-80d6-aa90-6e1b-f8519ae181cc@virtuozzo.com>
 <20201123101058.GA5317@merkur.fritz.box>
 <9185045f-42d2-a8d4-4143-de3283975259@virtuozzo.com>
 <20201123111024.GB5317@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c43ad0a0-8c61-057d-603e-229ae592b94e@virtuozzo.com>
Date: Mon, 23 Nov 2020 16:44:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201123111024.GB5317@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM9P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.115) by
 AM9P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 13:44:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04bebc57-537d-4948-70e5-08d88fb5e8e9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3221150E8737EFDC917166E2C1FC0@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xdSxMNKdsoNySPNjVCgBythU0Ompt+tfA175ks8UtqKRzEIReCfLUJkpFOt/s+zp9W3tu4I3KEhqRA+E/G8fGLNl4f4ht7iTHpGvxlYHUllQId6X5Q4iiGCVbILOXCqFLWhKVW5eVgAVULySsfGBBq+SRJywr8LXpLfuxoboOLZ/E2uxmmhh+LzI9DQvdKnPOpQG24PljYz0Rfy+kmpDfCkkj5BuuZp4tEX8tChUtZoRfkJKLU/aUUV4CNUX+4734UIDM7pZrUYIZv1MEtOviog0d3aNIVgXOGZUqaUL4+x2jPdgripoR3iqO5lcyKZGr7iI3bE9ms5Edl03lhn6TpfZtmVgjXUO1bifcf1RQAd9jos2EmRBr3foTSnArlI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(366004)(346002)(376002)(86362001)(36756003)(83380400001)(16576012)(6486002)(478600001)(52116002)(6916009)(2906002)(16526019)(8936002)(7416002)(316002)(4326008)(31686004)(2616005)(186003)(26005)(956004)(8676002)(66946007)(66476007)(66556008)(31696002)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: r68IxBkE56pxnhALcX4c+9r7Z+TBJC0dnm9otLF/mySeSsqQUT++Ghi3DgOrRz8cElp20YjZVnhjw25CsZyPfDi2vWuBx3O6HPKQxITjob99Tx2qAV8QDsnBvDx3M9wZBb7ZolXOyM3/0r1BwASDqNtrqGtuYYvsJ6d82hnPvy2JvmbVxM0zQBcltep3jFWTu1ulvyLeEzjW34zy5AP0+PFlgHcBY53Z2uRXqwZD2Rf1XHL+zZ2/o+h97xMc6ivwszJLjpYQkqdmf+UMYkXEpKDsh4C12gve2vvqW3VeecDMDl6Io//eoaojFbc6eC+8COVQk0bbwnovG0dFDUvtsxrimVeyDi9pB9b8FvTVVGeWqCNKMMJaiohD8zNZ/ab187eabtxh4DSBCi6Rbs85Laqm3L0PtWPEzGO4KdYH6VXLr+UpnB0iHapETDrxUERubjWF2KyBYEN1zNsnqUPQvhkTpTWupe+lsRQpF53RfVhHxG02VSEwaAqDwA9Pc7uaMW+Il/vNB4q8p5pNpm5TLvqKUiEKt1KAKJV9gJRfDDoqHO+l6o37e5LFawc3Dauboi6c7som1bZ225EBHaK44OXNpggZs5da/W/wZ8W3IicWz5ORj7YWkglv+7ZJF5L+SwFilmTE8KNOPwrKQ/2lSe7n9twqHcGSKByHCASLfvT95vDJ+/oqwDqOsqJD40uRG83O0ybw9a8LORTdIAZYOstVvk7HIqTetvcIVl4MgmKhV4Gsi186gvpF4NqPs734O4+YPdfrdNCpK+CMV9grTOZNYoAd6aUR2E7HzdJ64l6I+Tb4dPZpNXH7/HFwzNM81JeVCq26txb6OAyo9+oPE+e/9NaX3TCK+YZRnrlxFtMHjTqYYrAJlkaJb+NWgF2i40pNCl53988T8s8YT16MOQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bebc57-537d-4948-70e5-08d88fb5e8e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 13:44:33.3983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHicmoUGZXr1m3g+fxtaxmcFLYIU6usGhP02X48EjzBjHB7hxcGy/kGhjkj5ZBJ735hLE9ocWQY/OvdmI8965FPMK6ktBSFvvlwV3nultHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.20.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

23.11.2020 14:10, Kevin Wolf wrote:
> Am 23.11.2020 um 11:29 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 23.11.2020 13:10, Kevin Wolf wrote:
>>> Am 20.11.2020 um 19:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 20.11.2020 20:22, Kevin Wolf wrote:
>>>>> Am 20.11.2020 um 17:43 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> 20.11.2020 19:36, Kevin Wolf wrote:
>>>>>>> Am 20.11.2020 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>>> Hi all!
>>>>>>>>
>>>>>>>> As Peter recently noted, iotest 30 accidentally fails.
>>>>>>>>
>>>>>>>> I found that Qemu crashes due to interleaving of graph-update
>>>>>>>> operations of parallel mirror and stream block-jobs.
>>>>>>>
>>>>>>> I haven't found the time yet to properly look into this or your other
>>>>>>> thread where you had a similar question, but there is one thing I'm
>>>>>>> wondering: Why can the nested job even make progress and run its
>>>>>>> completion handler?
>>>>>>>
>>>>>>> When we modify the graph, we should have drained the subtree in
>>>>>>> question, so in theory while one job finishes and modifies the graph,
>>>>>>> there should be no way for the other job to make progress and get
>>>>>>> interleaved - it shouldn't be able to start I/O requests and much less
>>>>>>> to run its completion handler and modify the graph.
>>>>>>>
>>>>>>> Are we missing drained sections somewhere or do they fail to achieve
>>>>>>> what I think they should achieve?
>>>>>>>
>>>>>>
>>>>>> It all looks like both jobs are reached their finish simultaneously.
>>>>>> So, all progress is done in both jobs. And they go concurrently to
>>>>>> completion procedures which interleaves. So, there no more io through
>>>>>> blk, which is restricted by drained sections.
>>>>>
>>>>> They can't be truly simultaneous because they run in the same thread.
>>>>> During job completion, this is the main thread.
>>>>
>>>> No, they not truly simultaneous, but completions may interleave
>>>> through nested aio_poll loops.
>>>>
>>>>>
>>>>> However as soon as job_is_completed() returns true, it seems we're not
>>>>> pausing the job any more when one of its nodes gets drained.
>>>>>
>>>>> Possibly also relevant: The job->busy = false in job_exit(). The comment
>>>>> there says it's a lie, but we might deadlock otherwise.
>>>>>
>>>>> This problem will probably affect other callers, too, which drain a
>>>>> subtree and then resonably expect that nobody will modify the graph
>>>>> until they end the drained section. So I think the problem that we need
>>>>> to address is that jobs run their completion handlers even though they
>>>>> are supposed to be paused by a drain.
>>>>
>>>> Hmm. I always thought about drained section as about thing that stops
>>>> IO requests, not other operations.. And we do graph modifications in
>>>> drained section to avoid in-flight IO requests during graph
>>>> modification.
>>>
>>> Is there any use for an operation that only stops I/O, but doesn't
>>> prevent graph changes?
>>>
>>> I always understood it as a request to have exclusive access to a
>>> subtree, so that nobody else would touch it.
>>>
>>>>> I'm not saying that your graph modification locks are a bad idea, but
>>>>> they are probably not a complete solution.
>>>>>
>>>>
>>>> Hmm. What do you mean? It's of course not complete, as I didn't
>>>> protect every graph modification procedure.. But if we do protect all
>>>> such things and do graph modifications always under this mutex, it
>>>> should work I think.
>>>
>>> What I mean is that not only graph modifications can conflict with each
>>> other, but most callers of drain_begin/end will probably not be prepared
>>> for the graph changing under their feet, even if they don't actively
>>> change the graph themselves.
>>>
>>
>> Understand now.. Right.. Anyway, it looks as we need some kind of
>> mutex. As the user of drained section of course wants to do graph
>> modifications and even IO (for example update backing-link in
>> metadata). The first thing that comes to mind is to protect all
>> outer-most drained sections by global CoMutex and assert in
>> drain_begin/drain_end that the mutex is locked.
>>
>> Hmm, it also looks like RW-lock, and simple IO is "read" and something
>> under drained section is "write".
> 
> In a way, drain _is_ the implementation of a lock. But as you've shown,
> it's a buggy implementation.
> 
> What I was looking at was basically fixing the one instance of a bug
> while leaving the design as it is.
> 
> My impression is that you're looking at this more radically and want to
> rearchitecture the whole drain mechanism so that such bugs would be much
> less likely to start with. Maybe this is a good idea, but it's probably
> also a lot more effort.
> 
> Basically, for making use of more traditional locks, the naive approach
> would be changing blk/bdrv_inc/dec_in_flight() so that it takes/releases
> an actual coroutine lock. As you suggest, probably a CoRwLock.
> 
> I see a few non-trivial questions already for this part:
> 
> * What about requests for which bs->in_flight is increased more than
>    once? Do we need some sort of recursive lock for them?

Is there reasonable example? I'd avoid recursive locks if possible, it doesn't make things simpler.

> 
> * How do you know whether you should take a reader or a writer lock? For
>    drains called from coroutine context, maybe you could store the caller
>    that "owns" the drain section in the BDS, but what about non-coroutine
>    drains?

Intuitively, readers are all IO requests and writers are drained sections.

Why should we store drained-section owner somewhere?

Ah, we need to do "read" when holding write lock.. So we need a possibility for readers to operate without taking lock, when write lock is taken by current[*] coroutine.

And I don't see the way to make synchronization without moving everything to coroutine.
In non coroutine we'll dead lock on nested aio_poll loop which will do nested drain of another job. In coroutine we can wait on mutex more efficiently.

> 
>    What do you do if coroutine A drains and then (directly or indirectly)
>    spawns coroutine B to do some work?

And that means that [*] is not current coroutine but may be some another coroutine started indirectly by lock owner..

So, just RW lock is not enough.. We need something like RW lock but with a possibility to call read operations while write lock is taken (by owner of write lock)..

> 
> * Multiple concurrent requests from the same origin (the drain section
>    owner) shouldn't be serialised, so the CoRwLock needs to be taken once
>    per origin, not once per request. Again, how do we identify origins
>    and where do we store the common lock?

This makes things complex. Why not to take lock per request? IO requests will take read lock and go in parallel.

> 
> * Is it desirable that requests hang in bdrv_inc_in_flight() waiting for
>    the lock to be released? This may be in the middle of another
>    operation that needs to complete before drain_begin can return.

drain_begin should take write lock. This automatically means than all read locks are released..

> 
>    I seem to remember that introducing queued_requests in BlockBackend
>    was already non-trivial because of potential deadlocks. We would have
>    to prepare for more of the same in BlockDriverState.
> 
>    The BlockBackend code involves temporarily dropping the in_flight
>    counter change that the request made, but on the BDS level we don't
>    even know which counters we increased how often before reaching
>    bdrv_inc_in_flight().
> 
> Do you have a different approach for placing the locks or do you have
> ideas for how we would find good answers for these problems?
> 

No, I don't have good complete architecture in-mind.. I was interested in this because I'm preparing a series to refactor permissions-update, and it's quite close. But still a lot simpler than all these problems. So, I'd start from my already prepared series anyway.

Do you think it worth protecting by global lock some job handlers, like I propose in patch 05? It's of course better to move generic job_*() functions to coroutine, to not make same thing for each job. It will not solve the whole problem but at least fix 030 iotest.. I don't remember real bugs around this and don't think that users really run parallel stream and commit jobs. On the other hand the fix should not hurt.

-- 
Best regards,
Vladimir

