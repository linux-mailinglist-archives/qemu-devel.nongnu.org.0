Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47D3C7316
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:22:22 +0200 (CEST)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KEn-00010p-4p
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3KBO-0005Pt-GE; Tue, 13 Jul 2021 11:18:51 -0400
Received: from mail-eopbgr10138.outbound.protection.outlook.com
 ([40.107.1.138]:18401 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3KBL-0006WP-1L; Tue, 13 Jul 2021 11:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FriE+0VtuCbJkrySByOKqX+gLV2Xu8GjnDnVydSrrCTbUT96bKZUlmYVeehlvEX0aAnC1Ky/KtOAYSJY1TNAXcepd5wkuwK9trHLd/nMwHiZ3QJrw8ptnSCTGZGe6paQkrTWWIhlvSbEqveU81uBMOpVlmv0r5qjEAr9QNmzkeNob0jIusOQYRjUCmc7fKuppuw2t9FK/g5uvwpuAqnirPYqoH/85eafeaN82TN060vDfLCK75jcGmraUvf5ymZijZhlsWNStIUTENIjuJoggWLtjm9gJ9snugnAXtPC1tq5OFZp7WULxUXhI+6TucB6iG28wadprvX5nUq1/oXKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfJ/hFoWcNnGCAnrVy1UykE6EbPsW4bfzs37Abo/m6g=;
 b=VsiBKhF5okG/OIL8/dnIe5zUoyqrZr5Y7ppb9PZulv8S4IxKoAuba7GN/bJ/1qj0n8zbyOiqomKD/UWAOsiU8rx34trUTRjozNemR+rzeQW3CgkFTox+3extNZLBseDVy4+ZiHEl8BxFq6jG6cGcZoSUNRDBDaBXnmDa1I3TuF9uPIWIJq5IH9LeJECRYFvDmyHabeZZQV06A4mSEYLzDzhvU0YOq1PLKsrggDUH8VZawDmOqQE/064xHRVyuYvUDfo+x9n4M19T4u5RT/CYkTSwSuflLa9zvFCvPQZ65l7jrJDXiLhNiB1kuN4Sj+R2Cn4JJ02n1gS6q0GP2oKDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfJ/hFoWcNnGCAnrVy1UykE6EbPsW4bfzs37Abo/m6g=;
 b=s6nZ3weXkwltkFUIXbHvEz06VrgoRMT3DbOlnqZLx9Uf4Gua76Z5Lk5HjIddAqnXOIej5ADnbB9mBHvLzBbZS3P+3ph/LANAxZh/QsFoq0MZJQSdnJ9+2iBHrkbfMMarcvjVFutPTeyqFEfI+6IrEPr/J/YMxlRK8Me4S52nQJs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.27; Tue, 13 Jul
 2021 15:18:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:18:42 +0000
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <37a92342-37a1-151b-7fbd-31604a792938@virtuozzo.com>
Date: Tue, 13 Jul 2021 18:18:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0168.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1PR05CA0168.eurprd05.prod.outlook.com (2603:10a6:3:f8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 13 Jul 2021 15:18:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93d26b8-d168-4fb2-9717-08d946117fd4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544EE34FFEFE38BCD087C19C1149@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtD/ddvdfYp9O7aVfPuS7A0HJexBcU1SwrvFPIs0skqgA6EU5bKF0Sonm5J9VxM3zHlT6mt1pGDMFYLhJ883fVAYdiWaDeTKqbFH59lQpRyHmcti5oq8Wh/Yh4C7etrwxVvR3tCIzJxkVkbQy52+Hp7G16Wp0gf66i75+lNQNlJLKZ6cyI0qp/n7DL1u4HZnWQ0Ofz+2K8Rqv+bO3msGDRJszNAcYCYXtLEeZVYJNyFZTJKHDhK6ACiMoYkoC+JBv/xpxZ7BVts5OVKwOXjpbJR1JX7AGpLn0/rIg8apTEju79rzX4rKrCmOfisFpmIHOHbb0HrgMmUhELfwJegU7oRD66M4puxwJchSghox95YJCjCXUmo6b3Vhe0AI9z5qEjyr9kAMCXSesCV42Iu6Jo7dqh85HQxeqUfs9b3MxuSUN7pM5m7lPfPWSdxTfcz8585pdrzH+SDN2nnBIiJkBII6OJ1GE8TpiXoKbHbOKQwk8YwnqzCi5BqGmtEODoKjSzG1fjCMfTshMiPGCKG9nb+AP0bZPgCI+F8hAsFewoRz+DKPIOz3ealWZJxO41wgblXbJuPqhmKJl/IJ9smPf4ORTaWtGw0DvB0c6MI8wosolaH5+9kxEAOu/mTbARaT58bVkPbqMaSJJ/O++wo5H5YvZG2RHMKEMu1vzB3lwka2ijo1CHS9xYaxenF5OrsqGdBP02tQlrj87Jsszp/UZ9pOfvi25wRTNZLTv3dWQkv4vk8V6osZlefjlWWICxWdlRcAjDoEI9Q1WhZpix3Jaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39840400004)(376002)(396003)(6486002)(110136005)(54906003)(36756003)(38350700002)(4326008)(31686004)(16576012)(316002)(5660300002)(7416002)(83380400001)(86362001)(38100700002)(31696002)(2616005)(52116002)(66476007)(956004)(66556008)(66946007)(478600001)(186003)(2906002)(53546011)(26005)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?7x+sOE589eMpI1eYkjZ0sU1Q5u0wJG2AaJ0pzz/fCKBn1HMFgyFstJ5j?=
 =?Windows-1252?Q?g7yL/sbvR775jvW/XxLddR0+T/8NBXi6xGpEnpyAWknn6Z813FkEx4JW?=
 =?Windows-1252?Q?F5+POu00ENt/I6L3mzY+9z3ljIveVGRypCd0hhA6SqD7PJOAx/5LDCFw?=
 =?Windows-1252?Q?38FfRztRHQENdyzdlt3qAGhuv8bbghuLolV3Fd8mq8LVfWoM1mF9WwK9?=
 =?Windows-1252?Q?UNmjbIXHZw3P5Peb0n22y/RD18itfG3S/nrCs/cxxLHHczhCRajkUBxa?=
 =?Windows-1252?Q?6HacDPyTcXc+LFj5/y0R3F+Jpbs0jjvz4itsjWDYHVW/ULCe9YjNUu3O?=
 =?Windows-1252?Q?TxUtP+hQxKJ8exMrkkvvI9Ln/Tj7350gKkDKzwiC9fp/TE1Xqc9rG2oU?=
 =?Windows-1252?Q?fFGB/ErD95XuOO/Wyp4KqYJ/MQRFO2ypldJs6C4zLJ3pHPGKcJwwpIXJ?=
 =?Windows-1252?Q?DjhYLbTRhfkCzteylNraM+8NU0uVptuK9oG8kZKpwqtYpz9HVLloHX5S?=
 =?Windows-1252?Q?ODRR+pS/ha998HKQPpUjcm/2yg8LjVx2CSsAxqG/0xcliPVcbqU8j9ej?=
 =?Windows-1252?Q?8VetblqRU35uBFxYZdXFLnEunKjaIK3mbYynfdIP2Y9zhKeWidpbQk40?=
 =?Windows-1252?Q?siCWQGL877xfvlj88hg43qP+5Ucqc7wBeFuMRiQCyb3FNJ57DkyXBE+t?=
 =?Windows-1252?Q?2lCFRliugRopWuSxeR1orOFeWPDMtl6S4bnkT1O5t9uZvV2bE/vpivYe?=
 =?Windows-1252?Q?AJi5kvKO14K2AmmZQiIxoaE7MlZvgJjKAnL19PMLShBjLzBaLYnznZT6?=
 =?Windows-1252?Q?WiXgVadOrSbaj0thmQiCTGQkGxIU20he0n5XAh9/6+sL9qT13SHOEFNj?=
 =?Windows-1252?Q?WKW8I42epPR1wDghTZcLmaT5JuDU1tvA6fRp8lipGt4BZXg8qMqv3oV+?=
 =?Windows-1252?Q?HnryM68NLEd58JduEu+se3h/zR38aSMoTNXOxa52dfsuLGQVVyE7xu8h?=
 =?Windows-1252?Q?DuQXOJHI9wL9v8EVmQPKgJVaYdGDYx+IKKdVWNTO8GesC3Nm2N+Hhm+Y?=
 =?Windows-1252?Q?yorx66uSxYEwohKWEcMHJ47QCS5tIilNPXkWlpzn1+eQdzcWmj+YSiIY?=
 =?Windows-1252?Q?vYKyM3aT/9qJgzJQqLKTFmHiZLDL4C0ZDEUjIwuAjNk05Ji54lWMR+GY?=
 =?Windows-1252?Q?g6o7Up7K+m6B/Trf/n9HVLEDHlXBNxZIUkKmpUJ2xbTMGD9IEBIONMMq?=
 =?Windows-1252?Q?L3jLEIzVPFmLlGl90+KCBQbuaj8tKS/jt9CykEisPWRX/HzZB0e73YhJ?=
 =?Windows-1252?Q?baEmupHXNHlKLG76XVu9ocVAdUena5nHE9xPrq5csUr/fXYV7Ma7RT7k?=
 =?Windows-1252?Q?sdcXEHI9M/PfOQUDrBeonrsMcOytIElp/nFPHRYuI6sAXbfAqMxMuWio?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93d26b8-d168-4fb2-9717-08d946117fd4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:18:42.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFJO7P8Gvlmon+E56pVwq6wVmTIPeiRJ6qNvk5fzJkzcN5SAZJSB2qlzo12iDjcmp3XmN4DPKgi7eLlrcv2cRZngFjPC66kgrzmHjwsEBO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.1.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.07.2021 16:10, Stefan Hajnoczi wrote:
> On Mon, Jul 12, 2021 at 10:41:46AM +0200, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 08/07/2021 15:04, Stefan Hajnoczi wrote:
>>> On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
>>>> On 08/07/21 12:36, Stefan Hajnoczi wrote:
>>>>>> What is very clear from this patch is that it
>>>>>> is strictly related to the brdv_* and lower level calls, because
>>>>>> they also internally check or even use the aiocontext lock.
>>>>>> Therefore, in order to make it work, I temporarly added some
>>>>>> aiocontext_acquire/release pair around the function that
>>>>>> still assert for them or assume they are hold and temporarly
>>>>>> unlock (unlock() - lock()).
>>>>>
>>>>> Sounds like the issue is that this patch series assumes AioContext locks
>>>>> are no longer required for calling the blk_*()/bdrv_*() APIs? That is
>>>>> not the case yet, so you had to then add those aio_context_lock() calls
>>>>> back in elsewhere. This approach introduces unnecessary risk. I think we
>>>>> should wait until blk_*()/bdrv_*() no longer requires the caller to hold
>>>>> the AioContext lock before applying this series.
>>>>
>>>> In general I'm in favor of pushing the lock further down into smaller and
>>>> smaller critical sections; it's a good approach to make further audits
>>>> easier until it's "obvious" that the lock is unnecessary.  I haven't yet
>>>> reviewed Emanuele's patches to see if this is what he's doing where he's
>>>> adding the acquire/release calls, but that's my understanding of both his
>>>> cover letter and your reply.
>>>
>>> The problem is the unnecessary risk. We know what the goal is for
>>> blk_*()/bdrv_*() but it's not quite there yet. Does making changes in
>>> block jobs help solve the final issues with blk_*()/bdrv_*()?
>>
>> Correct me if I am wrong, but it seems to me that the bdrv_*()/blk_*()
>> operation mostly take care of building, modifying and walking the bds graph.
>> So since graph nodes can have multiple AioContext, it makes sense that we
>> have a lock when modifying the graph, right?
>>
>> If so, we can simply try to replace the AioContext lock with a graph lock,
>> or something like that. But I am not sure of this.
> 
> Block graph manipulation (all_bdrv_states and friends) requires the BQL.
> It has always been this way.
> 
> This raises the question: if block graph manipulation is already under
> the BQL and BlockDriver callbacks don't need the AioContext anymore, why

I don't believe that block drivers are thread-safe now. They have some mutexes.. But who make an audit of thread-safety? I work mostly with nbd and qcow2 drivers, and they never seemd to be thread-safe to me. For example, qcow2 driver has enough operations that are done from non-coroutine context and therefore qcow2 co-mutex just not locked.

> are aio_context_acquire() calls still needed in block jobs?
> 
> AIO_WAIT_WHILE() requires that AioContext is acquired according to its
> documentation, but I'm not sure that's true anymore. Thread-safe/atomic
> primitives are used by AIO_WAIT_WHILE(), so as long as the condition
> being waited for is thread-safe too it should work without the
> AioContext lock.
> 
> Back to my comment about unnecessary risk, pushing the lock down is a
> strategy for exploring the problem, but I'm not sure those intermediate
> commits need to be committed to qemu.git/master because of the time
> required to review them and the risk of introducing (temporary) bugs.

I agree. Add my bit of criticism:

What I dislike about the whole thread-safe update you do:

1. There is no proof of concept - some good example of multiqueue, or something that uses mutliple threads and shows good performance. Something that works, and shows where are we going to and why it is good. That may be draft patches with a lot of "FIXME" and "TODO", but working. For now I feel that I've spent my time to reviewing and proving to myself thread-safety of two previous thread-safe series, but I don't have a hope to see a benefit of it in the near future..

1.1 If we have a proof of concept, that also gives a kind of plan: a list of subsystems (patch series) to do step by step and finally come to what we want. Do you have a kind of plan (of the whole feature) now?

2. There are no tests: something that doesn't work before the series and start to work after. Why it is important:

All these thread-safe primitives are complicated enough. They hard to review and prove correctness. And very simple to break by new code. Tests that runs by CI proves that we don't break subsystems that are already thread-safe. For example, you've recently updated block-copy and several related things. But we have no tests. So, assume, a year later you finish the work of updating all other subsystems to be thread-safe. You'll have no guarantee that block-copy is still thread-safe, and you'll have to start from the beginning.

3. As I said, I really doubt that block drivers are already thread safe. An audit and/or tests are needed at least.


-- 
Best regards,
Vladimir

