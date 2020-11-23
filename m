Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138982C0346
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:31:05 +0100 (CET)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh97e-0004TP-UO
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kh96M-0003rp-4s; Mon, 23 Nov 2020 05:29:42 -0500
Received: from mail-eopbgr130113.outbound.protection.outlook.com
 ([40.107.13.113]:17294 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kh96J-0000QK-Hj; Mon, 23 Nov 2020 05:29:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heR7tCrX/9OlYq6RiqDxLihE6tZMaKwYxrT0CX8FoKY+nKl8hxgGpGjZDz2XBT1hH4OslKXVo0Q+oH6h8I15ufhPWe038vMed5OyOYwhrlG7SLjS6pl/1zDURGGHdPyu9JHRk0iFu7iaR04St0xd+eoh9HrXT4BZGbo0YDfgj2ywdxM/XU1wq6KAo8d7Kfqa7TbzrcktlAd80+CkbVMWyBoQkCWLSehcRjyy9YZrz1h9RkWdHLLdXjC+45zMgnYEkxuxC8A+pE273l91mDwR3kPwcNWzaJCNOyV/YWSBhpHCjc66NvUaghr0whTmU/hRJ7HBlCjSMtogXCh7LteBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xFIz3ggUEt+jWNLO7guJeEzhi7xFuX4vbZoSvTf8KE=;
 b=QgDQ1+P5hOArA/RaikMQ9J7wJdu0GtNi5IwevrqK++xYiDpPR1VzY/p7xjmugxYM+90jQHh+QAiM/maf7MZ+/Mnes3qlIZR2fPVIeOzmGcU4TLiTMCfvw0+TTNoqynF3yYZrHtIuMNaiH2XNGPxSgdaEboO+eEy6eE1wnt05L5LC/9Pe176aQd4kkL0NKooo5eMVl9aa2uvn6TgbzDse76vqsl4atG++4Wkw/xDR29Vfdfi8Gr5BREbDHn/j5XXxKJymNC1WnuR0n8KhswUOozmUsRQBny2/OIlW/QmMSkxdx7cm9J1Owth9cAGu8ae2BbUBbGuy3Yr5UEb0/o4dUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xFIz3ggUEt+jWNLO7guJeEzhi7xFuX4vbZoSvTf8KE=;
 b=ODuIBXaS/UNQeJeH3pjw+4QMAq6vBnfaMrHSDDedL6wiKh/HhpLZlXyeXDlwFBZjYwPi9Msa8f0WAawOnJCj8/FL1ZyHMOiSVHolB1MzKbKn9n9YKM+AVBD1PEadwLNF7gjOaogbW/BKhJjCx7au/aG1cGfaq4WKeBDcqRgD54M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2612.eurprd08.prod.outlook.com (2603:10a6:203:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 10:29:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 10:29:34 +0000
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9185045f-42d2-a8d4-4143-de3283975259@virtuozzo.com>
Date: Mon, 23 Nov 2020 13:29:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201123101058.GA5317@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR02CA0073.eurprd02.prod.outlook.com
 (2603:10a6:208:154::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.115) by
 AM0PR02CA0073.eurprd02.prod.outlook.com (2603:10a6:208:154::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 10:29:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf0229c-5ac5-4259-2d36-08d88f9aab8f
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2612:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB261224BB71A4F1172BB936A1C1FC0@AM5PR0802MB2612.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyuEluY3pMdqqKdD3XrWRSbQztw4+Kq06rnzhAPGEAj1wLUycpFPTQYOxLYg5LIyVchv1SK0nzwrTTTGbxp/d3tAyWOzyocBTDMSXqieWUhhGXCTei6sdGZvo/6X8uzK9uIDuruc1B2zSUGWvPSl0qAGMnFhDIZ2fK+qevEugBiuRo31VXDUXk2ULHkEJBOPZMr4AuXFhiLLS4s3umX2GrvL39aLuDBFfM+ZbRvP47VbiHsxhKnFrUi+nNvRKVN882qh9oNl9vt6QPwvhhyz5luz93buPg3FN663Cz4uVnSso3DsNh31h5G4Xcyhx0NsJj5Phvjf+R+u8H4GO6GQPIJVV2L23QdyNrK7VTZMxIfMlqZ+RqaqlvHO//feXhxK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(366004)(376002)(396003)(478600001)(186003)(6916009)(52116002)(83380400001)(16526019)(86362001)(2616005)(956004)(4326008)(26005)(316002)(31686004)(8676002)(8936002)(16576012)(2906002)(66476007)(6486002)(5660300002)(66946007)(31696002)(66556008)(7416002)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: cTEpKz57JeQDSW+56S5AL5fKAwXdo9PjmLs9Li7NB/v6h0NaHhf4RETZldTcFPm042gfr7vxLYpYzVuUlBsjZuWnMUMyaod5jbd3On+vnyg3VnqRGn+2zAE3WPdtLIQLvmn6T8jZRk+2Z2HJauNX0pOo5Vac4PkrkD6vbJk+VTaegyKMmacyBglezPJauM9xZXvyQNHW6Uvwmj80Su1tp++90trjRSxjr0sHPJllGJOFHcrmj8S50Fnpz6t+Q4LtbAPntZmyo1PRafxN5u4DZ9bf9fGL6KXCJBW37Tp5JL6v4AFBaho2bE8XO/wbnFF8XKvDg5eVdajYi5qH5h2skaHTwhlW9SuxjTmwhlERLaRUSngfoKU1kP0+VGxHgF5aqD2Hw/kCc4Gz+rOq9wd74jvSuuQ+88twnUCrvmDWPpyOsZMGfXK652TgmqXyc5OrpkV1zUpEv4TyR9o7XPjnHBCL/xca5CIrgM9YyTg3LhgfYJj3izVozveYYZmvK8AG2UMlAY2qczvBRgl5azoXcJUdddFfAy/R1lM1pcwdLdvCPu+uxcmzcem++IpEZKO6Nr+2atwx4PW2cwXyYC8aaRbih76JTkpaNKoGFeHIeUa69qf9PDRp4XafVvHZY5jegWuC+/ZHlMRVv+mrvtKM1og7oImBacFOHNIFkPwrnQnLFA/hiskFY8Dq3DzwnXz7tOIV6l3Tx7tKF4yyTOle8wF4mC8TnHh/d4hC3AKjEHzytv9nQBAQoZU3t5OgIU3675Lc2/SOTTEoAj9iBVfnsEPBNxm1ta8kcYSYRLsqoDo/wwBit1OijWd59jZyy1zbG9PiWzMKzWNMkE8NntWJ+AWOD7UtxOAEV0bltIiSVDrzWy6cqQ64gT+/I/ktqJqPRM6Rlg0Dg6rZD4xQBBFZSA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf0229c-5ac5-4259-2d36-08d88f9aab8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 10:29:34.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iPPy/PNWMxzQXmjBDYD9ieanijluRQxFMi5dEAfo9xWmjCHO0eA1bvFD1NhJJLW8CbOca6phO7PkJMGNf3iZ9Txsoz+43J9zVi2+rsr66k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2612
Received-SPF: pass client-ip=40.107.13.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

23.11.2020 13:10, Kevin Wolf wrote:
> Am 20.11.2020 um 19:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 20.11.2020 20:22, Kevin Wolf wrote:
>>> Am 20.11.2020 um 17:43 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 20.11.2020 19:36, Kevin Wolf wrote:
>>>>> Am 20.11.2020 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> Hi all!
>>>>>>
>>>>>> As Peter recently noted, iotest 30 accidentally fails.
>>>>>>
>>>>>> I found that Qemu crashes due to interleaving of graph-update
>>>>>> operations of parallel mirror and stream block-jobs.
>>>>>
>>>>> I haven't found the time yet to properly look into this or your other
>>>>> thread where you had a similar question, but there is one thing I'm
>>>>> wondering: Why can the nested job even make progress and run its
>>>>> completion handler?
>>>>>
>>>>> When we modify the graph, we should have drained the subtree in
>>>>> question, so in theory while one job finishes and modifies the graph,
>>>>> there should be no way for the other job to make progress and get
>>>>> interleaved - it shouldn't be able to start I/O requests and much less
>>>>> to run its completion handler and modify the graph.
>>>>>
>>>>> Are we missing drained sections somewhere or do they fail to achieve
>>>>> what I think they should achieve?
>>>>>
>>>>
>>>> It all looks like both jobs are reached their finish simultaneously.
>>>> So, all progress is done in both jobs. And they go concurrently to
>>>> completion procedures which interleaves. So, there no more io through
>>>> blk, which is restricted by drained sections.
>>>
>>> They can't be truly simultaneous because they run in the same thread.
>>> During job completion, this is the main thread.
>>
>> No, they not truly simultaneous, but completions may interleave
>> through nested aio_poll loops.
>>
>>>
>>> However as soon as job_is_completed() returns true, it seems we're not
>>> pausing the job any more when one of its nodes gets drained.
>>>
>>> Possibly also relevant: The job->busy = false in job_exit(). The comment
>>> there says it's a lie, but we might deadlock otherwise.
>>>
>>> This problem will probably affect other callers, too, which drain a
>>> subtree and then resonably expect that nobody will modify the graph
>>> until they end the drained section. So I think the problem that we need
>>> to address is that jobs run their completion handlers even though they
>>> are supposed to be paused by a drain.
>>
>> Hmm. I always thought about drained section as about thing that stops
>> IO requests, not other operations.. And we do graph modifications in
>> drained section to avoid in-flight IO requests during graph
>> modification.
> 
> Is there any use for an operation that only stops I/O, but doesn't
> prevent graph changes?
> 
> I always understood it as a request to have exclusive access to a
> subtree, so that nobody else would touch it.
> 
>>> I'm not saying that your graph modification locks are a bad idea, but
>>> they are probably not a complete solution.
>>>
>>
>> Hmm. What do you mean? It's of course not complete, as I didn't
>> protect every graph modification procedure.. But if we do protect all
>> such things and do graph modifications always under this mutex, it
>> should work I think.
> 
> What I mean is that not only graph modifications can conflict with each
> other, but most callers of drain_begin/end will probably not be prepared
> for the graph changing under their feet, even if they don't actively
> change the graph themselves.
> 

Understand now.. Right.. Anyway, it looks as we need some kind of mutex. As the user of drained section of course wants to do graph modifications and even IO (for example update backing-link in metadata). The first thing that comes to mind is to protect all outer-most drained sections by global CoMutex and assert in drain_begin/drain_end that the mutex is locked.

Hmm, it also looks like RW-lock, and simple IO is "read" and something under drained section is "write".


-- 
Best regards,
Vladimir

