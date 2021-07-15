Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528543C9EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:37:04 +0200 (CEST)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40bv-0001bU-Bn
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m40ag-0000g5-Kb; Thu, 15 Jul 2021 08:35:46 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:61153 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m40ad-0004Vn-I3; Thu, 15 Jul 2021 08:35:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS2ERoxScq3bFOF34JP2go2/c7Q4haaqZmIa/UwybWF7aTLXvLGiEJeWi1bFfBLCrQ/vHrIUzC2dS2PNuJlfKhRnvzM0SG6+WvWBgY8s5K2ye79R3/bsNRi+IAnZfqIEalFja1W57ePOTtVjj71jmPJClrBU+r5LbN0vxnIfdc58beqhpUaO673KDVrwGHtK0KBBHl+FYvomx0DQwAqBpOHt3C/7Pm2xuzRsCuEROARvzrNt74ONibigVSgb6SseqI0STsw5Y45Lbb3/4SdV2xpMqlBqdmEuR61XtFmoK5Mzhk1pIe0s/Lu7R1sF2w2fBYPsBUQbHQvbup8ZZV+bZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwrP99ex7Cr/cjWOoKh7gepiSY4ynOb5HGGI1PzJDdM=;
 b=YWWAibN4Noo8wamJ20yjDGdDbfM3UEmwY0xfPJkh1I+TWlmojO+XbXtsXwHoPuZo0OoN6QhkZ7IGCRQoL3wPzWLOEEF5tp4Eo9TbkOKpjsYIJw66YJThd50uuuKZbzJ4Ff1yWCkhQsem/1NUQkWzG2ILB7tO5k0W9J7pHl6QWhqxbNWHMJoVJB9q5phg9+0KRqxhj+ttpKKnTRYQb7/x/1OsrkoHZocVirAMjevnQ7KFOliXaBPTj8SvePKSf5VuW4/RmB+XFMercO/4QX3uSNYePE7iV984jBAkcokPkH21QvGCtQwQDyW5gJ+AZYmdu2q1N1MB5vKEWHb6xu9/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwrP99ex7Cr/cjWOoKh7gepiSY4ynOb5HGGI1PzJDdM=;
 b=cKDX/2ZwjolQYdUuvda4RQGT9alTWa8VJ2et4JlM5dwxRsI/MoO2Z427YaGyhx3B9FjUk86y44mCGO/SdCgm8UQnrnDHWGPQ9s+BFq6zy14s4IZvkdXHi0QptVm7lt3WKLG/RfcqOqcEm1xkDIoHYmOHSOAggKqoIgSkIgc93/w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4344.eurprd08.prod.outlook.com (2603:10a6:20b:74::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 12:35:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 12:35:39 +0000
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
 <37a92342-37a1-151b-7fbd-31604a792938@virtuozzo.com>
 <YO3BjpNHumrPUab1@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a19c12ab-6055-5ebd-6afd-1cee7ff20e13@virtuozzo.com>
Date: Thu, 15 Jul 2021 15:35:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO3BjpNHumrPUab1@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:208:55::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM0PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:208:55::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 12:35:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6c5eacf-8a7c-4c32-e63d-08d9478d0dc6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4344:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43442140DF84A2B3236E4A76C1129@AM6PR08MB4344.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3kEShcpdLQEloQZtChSqcBCmP7wk3AO98AUODyqPhtkiQ1QKs/3ZalpOaaYsf0vZNo+6L4wGF1KcZ8P1K4Idzj5Rr+T2xXWvYpZU9E/FpMXtGHcFzivzePYW3rPhcN+v/CTlaZbE+1w21vL94Uw8/7jVnOnjzR6yleV1hV4vTIKSlJksLvSYJXaxyrjkGBP0ejIL/pD0OVgl4g6Ijizk0LnZRmB9YaigW0Hg1ikcfVihssThNp5q34ysN/K5g/jR35kxhb2IdwKxy/XuHOJq4icyJjmBhf2GBlaab09UHIFmePEJos7vOM9VpZxZd4Z4mteHtoM/euCW0LjctYvfcP9lHSG+wkKebkf2PR+CkmMCiAU06hMeisVM2JIJ9NWv+a8GQuTHkCf5wazyT3IjgPetJ9dQ6hqY48XkYJw6sVuzsD3wfIP4r5wHTLAHzlgZN+cYgCDK8oDuE29abWvros9nXSBHE2kxiR8/XlGLb5o6LNDj60QPmfLN1oZJ3wabMPUcNWAH+icQjAchrusXyYojcCnO7JuD49GDd9dffzF/rXyAB1D0+toyXYubyWNNAckyBSy3G9n26NaCrOdZgLJCSKiiYm0hMkzzsyKOZM/I1qGRLvqmWk0jKU80IY5H0EsvihuuCH7Cn7z43eb/uW0DK5lnWF3+ecSSGIMgpBtTGrJdEwNbOWPbK/uumW9Z2QGRvYoHzU1EDtnC3ex8TwElGEjmAtDt6ED/fsCSn7ZmNzJQTum778xB2HBPhvGgwpSvohM3Bj6EbXYkd8wlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(346002)(396003)(31686004)(38100700002)(6916009)(316002)(2616005)(8936002)(66556008)(478600001)(66476007)(38350700002)(16576012)(956004)(54906003)(2906002)(31696002)(66946007)(8676002)(5660300002)(86362001)(53546011)(83380400001)(186003)(26005)(36756003)(52116002)(7416002)(6486002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Cyg7+FxOJFam2rQzdnyp/4KBf3T7A3bM4ZgfFjsW6OeWOKpW9eYfdOPu?=
 =?Windows-1252?Q?XpCgK4JFDQQaRagevugOPkx2idr1QyfTnVAr+P+uonAwNI265j6u2R9a?=
 =?Windows-1252?Q?yJnKD+7+fWNOwjxK4Gq4RfZA3TXNhpON+YY2gzEgJjI1QxlNZQ8yEORA?=
 =?Windows-1252?Q?quWexVc6LB2lOX7cXNPTdqJqML5OdSu0xnNgZbAnm1tiqNm1k6MKbM25?=
 =?Windows-1252?Q?3q9AjQrviapFps8/4K9U5hmAF0ADS7rzLzDJhsrmQTshC60R6OnrNfSR?=
 =?Windows-1252?Q?pC7LQjegQxcroEZc78uFZVxKkaMo23W+9x4dIGF8ICsWCl7+CaW1ruwT?=
 =?Windows-1252?Q?Zra/nqEXuXFCw6dAxtjWbcHfdLT3PzGYSOuf/OuhIixSbRG4w/Zi7XrF?=
 =?Windows-1252?Q?RMDiGTWNePdul5A6RxxgfKDooLKnTEmFLcL3lVL1TL/zjbRz9tKdkbM/?=
 =?Windows-1252?Q?5kjT/Y7eBKQ1yA5Vkeww4G1VYbqX4JO5NTK4IgtZ7h/AJz6xJveJs6n7?=
 =?Windows-1252?Q?sEc0n2tPmFxHAvk4AfX30vKu4n0MynINHdmAUFpMS0o3bqGyXMG4IN1V?=
 =?Windows-1252?Q?djgc6znK1RabMKMgUfivm/uKKt2lWFNOeLGJLEtJILJclrGlIOcZbc6d?=
 =?Windows-1252?Q?3oKTzzd8pMWjM2w9UDth09DMxCoaJbuIRGiGZ+ZSf9+nIJnWJUNXbH/h?=
 =?Windows-1252?Q?17LFCOtJYxTA1FJJIzJkU7mzqc4w0peNBysK2hf8lf+tB9Gi+1rc5aYU?=
 =?Windows-1252?Q?HWFLjwQqqilgjTF/wxvGNzfBLJZBRChyTESSFbgCaLYKiYwtc724CObW?=
 =?Windows-1252?Q?+EnA+6H74AoahyIZWX4twMh6NElrRE+ya49d450sRpSjuJlZsEmAuoyz?=
 =?Windows-1252?Q?irSI5IbxwtkTquadpGMX+/xEj6qCPvZkfuVGekXa2NU/we1Js9N+mitc?=
 =?Windows-1252?Q?dVPmzI9zN3JVTB1l0MuexfEM8GEfUzoAuXPPBYszycNto+xICXqdNmm/?=
 =?Windows-1252?Q?zl8lkb8A3H8P35uby6d8ehkxQj1kVdiKCvQgCLoYcpefCJYGfKXHXzdR?=
 =?Windows-1252?Q?eYTJ+FspePLEjH9YJrCk17oIikTfb/q+Bitf41eZj4QwXAt0AOc90X5R?=
 =?Windows-1252?Q?jP13ZClRCjWpWrpGsnPtc1AIILYRWFBtT3ePvqdJ/BT3ALVpQ3kZiSIS?=
 =?Windows-1252?Q?2L/3UodVhepxtp81ZxLXOQ4HblK33R9gmtdqzi9t4h+1JFo5aDORZiJt?=
 =?Windows-1252?Q?2OGukgJwTQ4EOKwkdafToD7PePBWO9I7e0sgInvyxFHBjeGi2P0q8Om7?=
 =?Windows-1252?Q?3IIlI4x3UjCyKbe7a6VLnoOB/gKOf7kI9PPn8mvMnvBYQzM0BFOvNW35?=
 =?Windows-1252?Q?OZNk6fnXnYO8358UsWFrFfEr5Q2BlZeswOjTrBo3QiplU602hoo2ekkJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c5eacf-8a7c-4c32-e63d-08d9478d0dc6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 12:35:39.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8SpOwu39/VQk/bsZwf+H2LUliFilSwtHpnA+CYvvIHHeyHb94R/I+bZU2lQ7aA8ccIpifqBIWMGoBP1CjG6x9U+ENweZtnfJe7EOEBOtIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4344
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

13.07.2021 19:38, Stefan Hajnoczi wrote:
> On Tue, Jul 13, 2021 at 06:18:39PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 13.07.2021 16:10, Stefan Hajnoczi wrote:
>>> On Mon, Jul 12, 2021 at 10:41:46AM +0200, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> On 08/07/2021 15:04, Stefan Hajnoczi wrote:
>>>>> On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
>>>>>> On 08/07/21 12:36, Stefan Hajnoczi wrote:
>>>>>>>> What is very clear from this patch is that it
>>>>>>>> is strictly related to the brdv_* and lower level calls, because
>>>>>>>> they also internally check or even use the aiocontext lock.
>>>>>>>> Therefore, in order to make it work, I temporarly added some
>>>>>>>> aiocontext_acquire/release pair around the function that
>>>>>>>> still assert for them or assume they are hold and temporarly
>>>>>>>> unlock (unlock() - lock()).
>>>>>>>
>>>>>>> Sounds like the issue is that this patch series assumes AioContext locks
>>>>>>> are no longer required for calling the blk_*()/bdrv_*() APIs? That is
>>>>>>> not the case yet, so you had to then add those aio_context_lock() calls
>>>>>>> back in elsewhere. This approach introduces unnecessary risk. I think we
>>>>>>> should wait until blk_*()/bdrv_*() no longer requires the caller to hold
>>>>>>> the AioContext lock before applying this series.
>>>>>>
>>>>>> In general I'm in favor of pushing the lock further down into smaller and
>>>>>> smaller critical sections; it's a good approach to make further audits
>>>>>> easier until it's "obvious" that the lock is unnecessary.  I haven't yet
>>>>>> reviewed Emanuele's patches to see if this is what he's doing where he's
>>>>>> adding the acquire/release calls, but that's my understanding of both his
>>>>>> cover letter and your reply.
>>>>>
>>>>> The problem is the unnecessary risk. We know what the goal is for
>>>>> blk_*()/bdrv_*() but it's not quite there yet. Does making changes in
>>>>> block jobs help solve the final issues with blk_*()/bdrv_*()?
>>>>
>>>> Correct me if I am wrong, but it seems to me that the bdrv_*()/blk_*()
>>>> operation mostly take care of building, modifying and walking the bds graph.
>>>> So since graph nodes can have multiple AioContext, it makes sense that we
>>>> have a lock when modifying the graph, right?
>>>>
>>>> If so, we can simply try to replace the AioContext lock with a graph lock,
>>>> or something like that. But I am not sure of this.
>>>
>>> Block graph manipulation (all_bdrv_states and friends) requires the BQL.
>>> It has always been this way.
>>>
>>> This raises the question: if block graph manipulation is already under
>>> the BQL and BlockDriver callbacks don't need the AioContext anymore, why
>>
>> I don't believe that block drivers are thread-safe now. They have some mutexes.. But who make an audit of thread-safety?
> 
> Emanuele :)
> 
> FWIW I took a look at the stream, mirror, and backup jobs today and
> couldn't find anything that's unsafe after this series. I was expecting
> to find issues but I think Emanuele and Paolo have taken care of them.


Hmm, do you mean that all jobs are thread-safe?

Looking at the mirror, what protects s->ops_in_flight for example? It's accessed from job coroutines and from mirror_top filter write operation.

> 
>>> are aio_context_acquire() calls still needed in block jobs?
>>>
>>> AIO_WAIT_WHILE() requires that AioContext is acquired according to its
>>> documentation, but I'm not sure that's true anymore. Thread-safe/atomic
>>> primitives are used by AIO_WAIT_WHILE(), so as long as the condition
>>> being waited for is thread-safe too it should work without the
>>> AioContext lock.
>>>
>>> Back to my comment about unnecessary risk, pushing the lock down is a
>>> strategy for exploring the problem, but I'm not sure those intermediate
>>> commits need to be committed to qemu.git/master because of the time
>>> required to review them and the risk of introducing (temporary) bugs.
>>
>> I agree. Add my bit of criticism:
>>
>> What I dislike about the whole thread-safe update you do:
>>
>> 1. There is no proof of concept - some good example of multiqueue, or something that uses mutliple threads and shows good performance. Something that works, and shows where are we going to and why it is good. That may be draft patches with a lot of "FIXME" and "TODO", but working. For now I feel that I've spent my time to reviewing and proving to myself thread-safety of two previous thread-safe series, but I don't have a hope to see a benefit of it in the near future..
> 
> The multi-queue block layer should improve performance in cases where
> the bottleneck is a single IOThread. It will allow users to assign more
> than one IOThread.
> 
> But I think the bigger impact of this work will be addressing
> long-standing problems with the block layer's programming model. We
> continue to have IOThread bugs because there are many undocumented
> assumptions. With the multi-queue block layer the code switches to a
> more well-understood multi-threaded programming model and hopefully
> fewer issues will arise because there is no problematic AioContext lock
> to worry about.
> 
> Stefan
> 


-- 
Best regards,
Vladimir

