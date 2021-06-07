Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216F39D5A3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 09:12:18 +0200 (CEST)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq9Qn-0001SF-3x
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 03:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq9Pm-0000bu-Bn; Mon, 07 Jun 2021 03:11:14 -0400
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:7777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq9Pi-0008N4-5f; Mon, 07 Jun 2021 03:11:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHE/OhYk/dGcOShe03cOy4H4F/tHhbH5AGrYDzBdgajiqN20trCEwQP9jQGKgwX82ej5SyVkrejEqiyIIlGoGObVPh/mW6KXX4v0U7UN8LG4BvI66FKc17MdCw/9/c3m8jdoFG8RSO3R/w1nN1PwGs/RG4Z1w4PIOfSR+n6YtyuaZvZ2bt8BF5jesNtIuskmxo9ST4K1JXXrFOQjW49ygbkGZzk/jk7Skt9/iPx9yJj3crEkueSXCk6mLrBfLDXuSQKwGI019fV1iYAW5A9I4ilXmKQyP/ub3/tIeGidQN8AYWnUnUc2ucQ7iB/3plz2orwp4UOmL8ZkXbPmLGcT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fkdpt5/+QPsh1YmeES/AlL7Vdco06SC+EBmQZknwak=;
 b=WMdI0XgaodmdnuvTmvWOlPNhJ81YhHRTbQjqAIUl6zT1k7cWZCGfiaumvBjUO4SDG473HCXt2SyeIFx13CmzCAry4KLk1K9yiBD0LHROTRIU57HUlKZHjtiUReCmtp9JKMhxEQz6dwViJQO9ntWzwxIktyZhQKAtZcc0x/g8iJesDOCTQjGhfFEoq1XbUpvTHD57p/AJP1wLhWXUzGfqTmIENmNUQgXhihU67GwZB67s9b7AZc4MeVgkTyXbEkJBCPvuD5Z+3QzNwvPWdf+gGhgLqvFIlW31RFSLQbP07kYjuuYThRGBCQFvVl4Vk7QYXTvRENDOs29leN2ZsFfWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fkdpt5/+QPsh1YmeES/AlL7Vdco06SC+EBmQZknwak=;
 b=RRjb5T284WUJvB9jfWueTIYq4PlWLLgrhALAb9fvolC/xmfcX8L3zMMLKfXJzOOUBX2OvpHSd9HddDfgl+v8oxoA07AOQJylk+QwwO52ZVUrRzlolQONeFwOKAB7vDQq6VcDN2Y96PtJZtn1ZAm23LRJrHNCO+U/y++7YYwUjAQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1842.eurprd08.prod.outlook.com (2603:10a6:203:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 07:11:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 07:11:06 +0000
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
References: <20210604065237.873228-1-its@irrelevant.dk>
 <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
 <YL259FilxX0aqFYb@apples.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a9104cf3-efed-524b-803f-b49d93fd062f@virtuozzo.com>
Date: Mon, 7 Jun 2021 10:11:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YL259FilxX0aqFYb@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: AM4PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:200:42::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 AM4PR0701CA0006.eurprd07.prod.outlook.com (2603:10a6:200:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.12 via Frontend
 Transport; Mon, 7 Jun 2021 07:11:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ab52b2-8174-4b1a-8b25-08d929836ac4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1842:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1842DD456A6D12D404A08FC1C1389@AM5PR0801MB1842.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1/J1fkvSeAFktOzzUPm2UZvvTPAhpuJh5A3NusYCent3kLvhzDahhQDGQsVZ5lmEWRwsrEmoTGQigM2Gu8nlzOG9PGf7jdi83T/IvjWRgjVVMqTlV0LDeHXqwgCMzuR53lTPpyd3IzXtYUeENPGlTnyCy86bRI/dnzRBBy7ubyI66w5q0FAsVPSbE9CoECvCvBlFzj4Tht1GongwwoTNfdesOllekBLJc1qEYoifQIDsHDMHmRsS2wlJTPn1tFRYgdDcumuQZEsBrxcn4xC3n6T3FM8ffmSzr0N0Sstc/FdHYC0DZA1AxeMEPAMSb5R2r9rAB9rUH4rj8a5syiR0GkFjk7SuyoARSuZemip76hPLtmh9n90cbE5C4DoZoJYStLkdcv2FCs/0i+4GBFk5K65RB0gePAxv6phTqpHE5bydg4tGaot915QnA49gxr01it8CvLm+n0xYMn867hFu5YhSl3nT6IIcjhV8iAGXciEIPG2uovvT5Yany5s6ABpay3XOmJ0WHv2bwGusxKpiC/qVV5yI/aN9LhYMKPfwCE4YVvFreFGV4bFWBSYwHQc8zjaY8OCew2afMLeHJ9tlbQAA/OloBe9L0nvK43yle49ruyuHTuNkXcxh43Ti65g/daInVd8RGy4N1RTvImYlgtv1n9U6t7mvYsN9doybzkDz+bzfHyYsHnvDfy237gFQzP3jy4JIBiSutNE7gO5K8KQhCRQWr0CVtLJWBboufc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39840400004)(376002)(366004)(38100700002)(38350700002)(478600001)(2906002)(5660300002)(31686004)(6916009)(52116002)(8676002)(8936002)(4326008)(2616005)(66556008)(6486002)(66476007)(66946007)(956004)(83380400001)(16526019)(186003)(26005)(31696002)(86362001)(36756003)(16576012)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHBuMWVFUC96N0xZSHFqb1dleHhqVzN5cVJ4Qzk3ZVBMbEhFSjJGMnJxK3RM?=
 =?utf-8?B?dGI5RXpOUjJtbUIvbDlXMXpXeko1RDIxNk9GdDRQaUdGOWtJcERRanBHaWJl?=
 =?utf-8?B?K1dFWis1dnBZVmRDTjhlRjY0SmE2ZG9oOWEwUVcrWXdYa2FQN1kyZUFvQnJt?=
 =?utf-8?B?dXlIQmRhTXlLYS80ejZ5Wi9DZjRnc3ZScEVUMU1seEJNT2h0aEkxOHRhWGpU?=
 =?utf-8?B?c25yaEZSQUpoTWtjVkFIK3IzNHBmWlhHSFRkNEdJV21nd3NXb2F0c1dkc0FV?=
 =?utf-8?B?eUErTUJwY21BbUI1VHVrNlMyNEJPbUllMHRCTlNxOGxTSXNCRWNycERqNW8w?=
 =?utf-8?B?cFZRS0FQZHdGTUhTMEZabEFtOEJtcHc3aEZXdWN1NGcyTUV2N3lGeFN1NzM1?=
 =?utf-8?B?cGRHNFM0UmNwMGNlN2k0S3l1UFI3SUlERmVNSGVxcHRFOXNCUVZXL05rQWVX?=
 =?utf-8?B?NXJDWm1LaWVlVGl2ZTdzZEhGcXVZRmFKOEU3djJ4Y1lxejZhLzEzUytQbms0?=
 =?utf-8?B?VVFFdEIxVzVtQzhRMFk4Q3U4NmVyZDc5K3VhcGFvTTF2QlU3eEM0ZUVmS0hS?=
 =?utf-8?B?aWwrU0dQejBDZFZrbzNZclRibzFqTFYyZ3pJYVUyN2k0OXk5TzdSVk5zZW1t?=
 =?utf-8?B?WGoyaFd3S1lyQXF2dkMxNlY5MGdYN2c4anlqNGpocUUvcXdhZ0dMS2JOemdV?=
 =?utf-8?B?YlBKVTVoT3FPRHlEdEgveU53ek9SYmRmdXJaSVVESDArQktoNXFNNVBwTzdC?=
 =?utf-8?B?UFB4UUlRY2pJdmErc0pYdU94UjFuVkV6K05xYTRTYzJHclYvaHBCU0JSVnJS?=
 =?utf-8?B?WkxVVWZ2cFRaZU1UdXZqdzI0V1pBbElQVmpVRi9qWWFaZEJWMEJkekl0cmlG?=
 =?utf-8?B?NTlFZjNNdTNEcXVqd1M0SmhVSkJVQlh4enNoL0tNVUROV0NvNEdFa2greU9W?=
 =?utf-8?B?b1Q3MWRyOHNqeW5Ua2czbXN3cDBlTUNvZE5tTnZnK3pjQkxkNUpIN01WcXNx?=
 =?utf-8?B?RHBsdHdjZEtDVXFCUUpWWlNHdUVIV1BkU0FaUDZJczZHS0pOTkluN3JTYVI0?=
 =?utf-8?B?UFZZMmdsSk1YTFVhdG8xbE1HdnpxdmpaRUZDNW5aVGpoN2tjSTl3RkFaakxE?=
 =?utf-8?B?cDlieWRLWkVkaER0SmozeldORFpHZC94L2VKeEJHbEQ3eitsQWFpR09qZkFx?=
 =?utf-8?B?RGwvbzgzc0F2aHk5K0xCU2hDVUkrbkhuM1NLWDRVZ3hhS0loUjFzbkJwVkhT?=
 =?utf-8?B?dWlGdEVMbkxVWXlPenNoT2pZUkdQZEZJcjZMcWwxcHlBYnZXWndEOFZLTDhw?=
 =?utf-8?B?ZzN6T3h2amIvOHhKeHhyQ1E3NkdaUGZoYzQ0Q1Fsa1NXWWRRVUZJWWhTN2RI?=
 =?utf-8?B?Sis3Zk5iQmVVMVdES1NxL0tlUTBJY0pXSFlxYnRjTmRjQ25BOE5ac1hwMjVZ?=
 =?utf-8?B?NEh4NHo2WUdWVHFBUithdmZRblBhRXNUbzJnd3JRenAwa2U2ejA1OWVEbG0v?=
 =?utf-8?B?SjNoMkdqZHJnWmJZQ09NMlBGK3o3RnJncFZnaVhBZ1RwNW9jb2NXcTBZMkww?=
 =?utf-8?B?Mm1XbGNFUDNSYUsvdlNlVzJtYTdRSFU4WTRzcmlwY2ZKaG5FaEZlVk1lL0lj?=
 =?utf-8?B?a0M4RzkySDZJOFFMZjYxWmQ2NHhIS0M4Q21lUjFEd2ZEU3F5S3RmUy9kSU5m?=
 =?utf-8?B?RTZseHcrK3JqR1VGZnBLbmVJVFJnbEVFaWhHOUlVMUdQNS9peHBnMG8xKzlo?=
 =?utf-8?Q?DllNQbBG599+uUuAGcnJVW+iaJ3m9wP83RwhugT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ab52b2-8174-4b1a-8b25-08d929836ac4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:11:05.9232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuqT2R7gSzzQZIZCUTIKHKDv9e/Nhx2l/X2do9QA3yGqZ7AAXduoE7yl6LGQIL6X2WMa7R+Z6JKAdrXsoGfvpj69dF8jYdH5b8jQsjfq+mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1842
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

07.06.2021 09:17, Klaus Jensen wrote:
> Hi Vladimir,
> 
> Thanks for taking the time to look through this!
> 
> I'll try to comment on all your observations below.
> 
> On Jun  7 08:14, Vladimir Sementsov-Ogievskiy wrote:
>> 04.06.2021 09:52, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> This series reimplements flush, dsm, copy, zone reset and format nvm to
>>> allow cancellation. I posted an RFC back in March ("hw/block/nvme:
>>> convert ad-hoc aio tracking to aiocb") and I've applied some feedback
>>> from Stefan and reimplemented the remaining commands.
>>>
>>> The basic idea is to define custom AIOCBs for these commands. The custom
>>> AIOCB takes care of issuing all the "nested" AIOs one by one instead of
>>> blindly sending them off simultaneously without tracking the returned
>>> aiocbs.
>>
>> I'm not familiar with nvme. But intuitively, isn't it less efficient to send mutltiple commands one-by-one? Overall, wouldn't it be slower?
> 
> No, you are right, it is of course slower overall.
> 
>> In block layer we mostly do opposite transition: instead of doing IO operations one-by-one, run them simultaneously to make a non-empty queue on a device.. Even on one device. This way overall performance is increased.
>>
> 
> Of these commands, Copy is the only one that I would consider optimizing like this. But the most obvious use of the Copy command is host-driven garbage collection in the context of zoned namespaces. And I would not consider that operation to be performance critical in terms of latency. All regular I/O commands are "one aiocb" and doesnt need any of this. And we already "parallelize" this heavily.
> 
>> If you need to store nested AIOCBs, you may store them in a list for example, and cancel in a loop, keeping simultaneous start for all flushes.. If you send two flushes on two different disks, what's the reason to wait for first flush finish before issuing the second?
>>
> 
> Keeping a list of returned aiocbs was my initial approach actually. But when I looked at hw/ide I got the impression that the AIOCB approach was the right one. My first approach involved adding an aiocblist to the core NvmeRequest structure, but I ended up killing that approach because I didnt want to deal with it on the normal I/O path.
> 
> But you are absolutely correct that waiting for the first flush to finish is suboptimal.
> 

Aha. OK, if that's not a performance critical path.

>>>
>>> I've kept the RFC since I'm still new to using the block layer like
>>> this. I was hoping that Stefan could find some time to look over this -
>>> this is a huge series, so I don't expect non-nvme folks to spend a large
>>> amount of time on it, but I would really like feedback on my approach in
>>> the reimplementation of flush and format.
>>
>> If I understand your code correctly, you do stat next io operation from call-back of a previous. It works, and it is similar to haw mirror block-job was operating some time ago (still it maintained several in-flight requests simultaneously, but I'm about using _aio_ functions). Still, now mirror doesn't use _aio_ functions like this.
>>
>> Better approach to call several io functions of block layer one-by-one is creating a coroutine. You may just add a coroutine function, that does all your linear logic as you want, without any callbacks like:
>>
>> nvme_co_flush()
>> {
>>   for (...) {
>>      blk_co_flush();
>>   }
>> }
>>
>> (and you'll need qemu_coroutine_create() and qemu_coroutine_enter() to start a coroutine).
>>
> 
> So, this is definitely a tempting way to implement this. I must admit that I did not consider it like this because I thought this was at the wrong level of abstraction (looked to me like this was something that belonged in block/, not hw/). Again, I referred to the Trim implementation in hw/ide as the source of inspiration on the sequential AIOCB approach.

No, I think it's OK from abstraction point of view. Everybody is welcome to use coroutines if it is appropriate and especially for doing sequential IOs :)
Actually, it's just more efficient: the way I propose, you create one coroutine, which does all your logic as you want, when blk_aio_ functions actually create a coroutine under the hood each time (I don't think that it noticeably affects performance, but logic becomes more straightforward)

The only problem is that for this way we don't have cancellation API, so you can't use it for cancellation anyway :(

> 
>> Still, I'm not sure that moving from simultaneous issuing several IO commands to sequential is good idea..
>> And this way you of course can't use blk_aio_canel.. This leads to my last doubt:
>>
>> One more thing I don't understand after fast look at the series: how cancelation works? It seems to me, that you just call cancel on nested AIOCBs, produced by blk_<io_functions>, but no one of them implement cancel.. I see only four implementations of .cancel_async callback in the whole Qemu code: in iscsi, in ide/core.c, in dma-helpers.c and in thread-pool.c.. Seems no one is related to blk_aio_flush() and other blk_* functions you call in the series. Or, what I miss?
>>
> 
> Right now, cancellation is only initiated by the device when a submission queue is deleted. This causes blk_aio_cancel() to be called on each BlockAIOCB (NvmeRequest.aiocb) for outstanding requests. In most cases this BlockAIOCB is a DMAAIOCB from softmmu/dma-helpers.c, which implements .cancel_async. Prior to this patchset, Flush, DSM, Copy and so on, did not have any BlockAIOCB to cancel since we did not keep references to the ongoing AIOs.

Hmm. Looking at flush for example, I don't see how DMAAIOCB comes.

You do

   iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);

it calls blk_aio_prwv(), it calls blk_aio_get() with blk_aio_em_aiocb_info, that doesn't implement .cancel_async..

> 
> The blk_aio_cancel() call is synchronous, but it does call bdrv_aio_cancel_async() which calls the .cancel_async callback if implemented. This means that we can now cancel ongoing DSM or Copy commands while they are processing their individual LBA ranges. So while blk_aio_cancel() subsequently waits for the AIO to complete this may cause them to complete earlier than if they had run to full completion (i.e. if they did not implement .cancel_async).
> 
> There are two things I'd like to do subsequent to this patch series:
> 
>    1. Fix the Abort command to actually do something. Currently the   command is a no-op (which is allowed by the spec), but I'd like it to   actually cancel the command that the host specified.
> 
>    2. Make submission queue deletion asynchronous.
> 
> The infrastructure provided by this refactor should allow this if I am not mistaken.
> 
> Overall, I think this "sequentialization" makes it easier to reason about cancellation, but that might just be me ;)
> 

I just don't like sequential logic simulated on top of aio-callback async API, which in turn is simulated on top of coroutine-driven sequential API (which is made on top of real async block API (thread-based or linux-aio based, etc)) :) Still I can't suggest now an alternative that supports cancellation. But I still think that cancellation doesn't work for blk_aio_flush and friends either..

>>
>>> Those commands are special in
>>> that may issue AIOs to multiple namespaces and thus, to multiple block
>>> backends. Since this device does not support iothreads, I've opted for
>>> simply always returning the main loop aio context, but I wonder if this
>>> is acceptable or not. It might be the case that this should contain an
>>> assert of some kind, in case someone starts adding iothread support.
>>>
>>> Klaus Jensen (11):
>>>   hw/nvme: reimplement flush to allow cancellation
>>>   hw/nvme: add nvme_block_status_all helper
>>>   hw/nvme: reimplement dsm to allow cancellation
>>>   hw/nvme: save reftag when generating pi
>>>   hw/nvme: remove assert from nvme_get_zone_by_slba
>>>   hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check
>>>   hw/nvme: add dw0/1 to the req completion trace event
>>>   hw/nvme: reimplement the copy command to allow aio cancellation
>>>   hw/nvme: reimplement zone reset to allow cancellation
>>>   hw/nvme: reimplement format nvm to allow cancellation
>>>   Partially revert "hw/block/nvme: drain namespaces on sq deletion"
>>>
>>>  hw/nvme/nvme.h       |   10 +-
>>>  include/block/nvme.h |    8 +
>>>  hw/nvme/ctrl.c       | 1861 ++++++++++++++++++++++++------------------
>>>  hw/nvme/dif.c        |   64 +-
>>>  hw/nvme/trace-events |   21 +-
>>>  5 files changed, 1102 insertions(+), 862 deletions(-)
>>>
>>
>>


-- 
Best regards,
Vladimir

