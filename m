Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48C2C2F07
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:43:09 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcLM-0000lf-JK
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khcIX-0007ce-4B
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:40:13 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:9279 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khcIR-0005Ut-9W
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:40:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmJJkRsz3+LLQHkP/oKV2UCJPVz14p5gqdGn/Fk9/H/fMl2Chg5WipmlhYyutXD9MczIpKAyyAIYUoS0wGAZcjAb5v9nKB5oHIhKG3JjEqAR5VGJ52YulzDNiD7t/kONlqXZHLbQANazbEJA7Hej/8PtbckOe+GUHNhUN7T4PdLErK5DlijbxAAEgU4JSQs8eZx4q3zP48YVJzpmNwCcCDUvOjm+f4wACrIMf9JhvAQykjskt4nYCcPFx0lS9UyyP1rmA6AkDeQ6OQbyvPx77Oew8eN7hZ6LC5oe6yCh2480AH9u7hS4Z+r0Rxb6roLY0XizEnjpO38MolWjdQDJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qA0JvZHQmLAZARsoH3tGsYp7jgw6hRel2LFsielOus=;
 b=DkK7ivEV/Aeh2p8stmEWkLoshXpqezeAR+WEQurbDwoIG3maeEkRNk4I4URESx392iGQiyvzDRh21PkzsdD0AbsBZg3CTFwD9OsXpB/1u3x17A8PDk/NpJclyobN+nas6hJr+OLgae/D5eXkprvTY6FgVIkL5nAZTCYwe/t7JuAR1ywbQ+mW/VPYbwU3U808DzK2/teyuwcBqmUXPaS0BgaEVyow6s9zgQZhQPx/lU2zJ0fCDoO1FxcEllE2MeT4RYqY7LaD3hMn5J+llmucGG2TP0AwID4DxjNZJuzLT9VN2YjRRbELKcpoS8begOeIgulk8dlZTKOUDLEoA5Nd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qA0JvZHQmLAZARsoH3tGsYp7jgw6hRel2LFsielOus=;
 b=uF5uef950Kw3gY6rTNrJi4mef+CatAtAfWMfcxUiySsnwcvgBLtLnLKjqVecpLcUlTkvtrBC/FoNzAZHw0uqQral+3yy7LoFzxDd21X/uFhQJm3moaGuWMIusSHZAEVTFLwAWxLJmbgnA5xoZb8k0o37vnnKKJ9CVaAEff1x4P8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3822.eurprd08.prod.outlook.com
 (2603:10a6:803:bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 17:40:02 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 17:40:02 +0000
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
 <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
 <20201120164316.GC60522@xz-x1>
 <c222b7ca-9368-3adc-00fd-5261216f7df1@virtuozzo.com>
 <20201123213443.GE60522@xz-x1>
 <b38025e0-ca06-b7e7-0745-3fa411019dd1@virtuozzo.com>
 <20201124151729.GA257984@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <71c30a1e-8fbd-1eb3-aa5f-2efc973c0647@virtuozzo.com>
Date: Tue, 24 Nov 2020 20:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201124151729.GA257984@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR07CA0099.eurprd07.prod.outlook.com
 (2603:10a6:207:6::33) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:207:6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.9 via Frontend Transport; Tue, 24 Nov 2020 17:40:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce0b8c0d-efb2-4661-cf73-08d8909ff8f2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3822292116668999752B10909FFB0@VI1PR08MB3822.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:304;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hI91MQhWZOdGdeCzblq/yiHJKNO4Q6w7fO4YRkhQ8YEgsY1jee2PoYVAupz0dpJhj7fI7HRiZUYKL8kxwD5WNaVUTe8vR46WQa9/VhM8LhuAPZuCXSnzzoYior1y5xBGtVn8MvE7+4A8DU3eXy5TZ+F7q9hWzuzCE0677/Zxy3V/jiZ7L9eIjvqt1JgnJ+sNr8aYpfu5OOALx2Q8igESVTj3H4R1a+ZPSyhF6h2P1NfB+7wyH9KyYlgORdYDuF3pqROk8rI5m+VkAfRx53zLp/cZ7aynyAXkLVcK03OCxgC3pnIohzaBcbab1u2BOb9y7E2KL0rqT3sqS/6n1M0Zi+IVi0fSVF6N9I11Mg/yHwuuy1sKAf0t7LYQh9P1+jMV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39840400004)(396003)(36756003)(53546011)(6916009)(31696002)(52116002)(83380400001)(26005)(66556008)(44832011)(5660300002)(16576012)(316002)(2616005)(956004)(54906003)(66476007)(186003)(66946007)(16526019)(6486002)(86362001)(31686004)(8936002)(8676002)(4326008)(478600001)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzJKN0xiVHJjSllNUTJqTmM3Q3lOQy9KQ0hFVGFLcUo1RTlLdU5PS3pNeFRK?=
 =?utf-8?B?c2pNeU5PaGwrMkM1dXE5ODlJLzU4V3EzVXhSSUVSY2sxNmhzeW5QNkppbk4v?=
 =?utf-8?B?dnJmOER2Wi9YVExtQlBwM0x1UkN5MzZTdlJIZFN5U2FMR2F1bjdqVVVqU1hl?=
 =?utf-8?B?b1JFNXl1Yi9uR3RzeWl5NEFtOVRma0xvY3R4RWcvcEpzckZZeFBWNVhxTW8z?=
 =?utf-8?B?OUR2SkZ1NmhoN01qWkhxSEdQYzNRaWd5SjZ1VDVhUnlkTzdMSC91UlEySUFC?=
 =?utf-8?B?RUxlUTUya0JIU1d3Vkx5YWdSUDNnN3ZXTjQ2Z1JTRVFMNFNQcnEwZ2RPSXVH?=
 =?utf-8?B?UG5mcEx3endvTlFCdHEyY3pieWQ3UHNNMHc1S0xvYTl6NlBtYlZ4cllzL05u?=
 =?utf-8?B?bWo0TkhhSGkzT1pWbDE2RlhJd3pvVlBlUGxQTVVpd0dHWUVLdVpmVkdkL2tp?=
 =?utf-8?B?L1o1TE9sOThXWFJ1ZDRFa0lqZ0c3Tk9sNnA3YUJSRE5qNnlNaC9wbHlhUU9p?=
 =?utf-8?B?US8zMFJtei9DZlJvcmczamFudEhxMDBMRjlHbVFDc0RWVE5ONnJGMTlPdGZH?=
 =?utf-8?B?RDNENVpCL2VGRU9rTndNQUZ5azJLYlpWN3RUVy9VRmFQOUp6UFZsSUF0emVE?=
 =?utf-8?B?ajRBSHkxMVlKQTNWd1FiQzQ3cGI1V2M1eWQrTms2WFRFS29idGxYbGVGai9r?=
 =?utf-8?B?Zm5pQ2xuRTEyZWFPRnkxYTJoYU85bFVSQkxYa2p0RUpBM09lSDdXUXBjZEox?=
 =?utf-8?B?Z1Nza2Z3cHRLOHBBa1dDWGJXOEdNOVp6dWhaTmZYaXg5bzRxOHA0d3U5bWYw?=
 =?utf-8?B?emxlOVNtSys4ZDd5b3FNbTg0U3c3cDVIbGtUaXdVV3hNSE5jaHpML3lrUTBq?=
 =?utf-8?B?ekx2Uk4vOXplYTlLci95TGFOZEpGN000c1J2am9INFZOaENRazNRRDZFNUNT?=
 =?utf-8?B?NHJxMzFvTDRzeU1WbEFBb29GWkw3ZkxZcFJpQy9GTTdDVDFNVnc2Tjg5Tjhy?=
 =?utf-8?B?NnNCQzZNTGNzN3d1WkppUUtzOXc2SnMvUVRRejAxVVgvY2d5QUlwUm1LUFVL?=
 =?utf-8?B?UVZLbjkrTERoSDdxeGVlM05PbTI2SjNxNERybTlWQkJnTHNOYnZKTjJFWXdk?=
 =?utf-8?B?TC9ObnVEVUJlYlgrWnJ4SE1pYm44dVFqRmJUbFI4UTd4VVBUSkptZnYwV1FS?=
 =?utf-8?B?UVhoTWhHMlM0eVpQZXFVZ1JxUEJ5ZlExNHVwK0s2VXFReC8xYlJ2ZlBnM0c0?=
 =?utf-8?B?RXJQemZVcEk1Ukx6YTB5c2lQN3Z0czhhbVBKZ3NKWitjK3NqajFaS1Q2eFZP?=
 =?utf-8?Q?xQqBKIe12+eqZ3+sW+I6ghosXYW4Pfbb5J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0b8c0d-efb2-4661-cf73-08d8909ff8f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 17:40:02.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ljgKJtG6u7mdxrOJL+PhRdYcASHiobPW9Dg8Cg32/ViV+Xbw9Q9Ym+ovIvf8R1cEKDKInq1LtyKDNjOFTFfrqoDycOB81LM374ZaxtMUR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3822
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

On 24.11.2020 18:17, Peter Xu wrote:
> On Tue, Nov 24, 2020 at 11:02:09AM +0300, Andrey Gruzdev wrote:
>> On 24.11.2020 00:34, Peter Xu wrote:
>>> On Fri, Nov 20, 2020 at 07:53:34PM +0300, Andrey Gruzdev wrote:
>>>> On 20.11.2020 19:43, Peter Xu wrote:
>>>>> On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
>>>>>> Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
>>>>>> worring a little about some additional overhead dealing with urgent request
>>>>>> semaphore. Also, the code won't change a lot, something like:
>>>>>>
>>>>>> [...]
>>>>>>            /* In case of 'write-tracking' migration we first try
>>>>>>             * to poll UFFD and sse if we have write page fault event */
>>>>>>            poll_fault_page(rs);
>>>>>>
>>>>>>            again = true;
>>>>>>            found = get_queued_page(rs, &pss);
>>>>>>
>>>>>>            if (!found) {
>>>>>>                /* priority queue empty, so just search for something dirty */
>>>>>>                found = find_dirty_block(rs, &pss, &again);
>>>>>>            }
>>>>>> [...]
>>>>>
>>>>> Could I ask what's the "urgent request semaphore"?  Thanks,
>>>>>
>>>>
>>>> These function use it (the correct name is 'rate_limit_sem'):
>>>>
>>>> void migration_make_urgent_request(void)
>>>> {
>>>>       qemu_sem_post(&migrate_get_current()->rate_limit_sem);
>>>> }
>>>>
>>>> void migration_consume_urgent_request(void)
>>>> {
>>>>       qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
>>>> }
>>>>
>>>> They are called from ram_save_queue_pages and unqueue_page, accordingly, to
>>>> control migration rate limiter.
>>>>
>>>> bool migration_rate_limit(void)
>>>> {
>>>> [...]
>>>>           /*
>>>>            * Wait for a delay to do rate limiting OR
>>>>            * something urgent to post the semaphore.
>>>>            */
>>>>           int ms = s->iteration_start_time + BUFFER_DELAY - now;
>>>>           trace_migration_rate_limit_pre(ms);
>>>>           if (qemu_sem_timedwait(&s->rate_limit_sem, ms) == 0) {
>>>>               /*
>>>>                * We were woken by one or more urgent things but
>>>>                * the timedwait will have consumed one of them.
>>>>                * The service routine for the urgent wake will dec
>>>>                * the semaphore itself for each item it consumes,
>>>>                * so add this one we just eat back.
>>>>                */
>>>>               qemu_sem_post(&s->rate_limit_sem);
>>>>               urgent = true;
>>>>           }
>>>> [...]
>>>> }
>>>>
>>>
>>> Hmm... Why its overhead could be a problem?  If it's an overhead that can be
>>> avoided, then postcopy might want that too.
>>>
>>> The thing is I really feel like the snapshot logic can leverage the whole idea
>>> of existing postcopy (like get_queued_page/unqueue_page; it's probably due to
>>> the fact that both of them want to "migrate some more urgent pages than the
>>> background migration, due to either missing/wrprotected pages"), but I might
>>> have something missing.
>>>
>>> Thanks,
>>>
>>
>> I don't think this overhead itself is a problem since its negligible
>> compared to other stuff.. You're undoubtly correct about using postcopy idea
>> in case when wr-fault pages arrive from the separate thread or external
>> source. Then we really need to decouple that separate thread or external
>> requestor from the migration thread.
>>
>> In this patch series wr-faults arrive in the same migration loop with normal
>> scan, so I don't see direct reason to pass it through the queue, but I might
>> have missed something from your proposal.
> 
> I see your point.  For me whether using a thread is not extremely important -
> actually we can have a standalone thread to handle the vcpu faults too just
> like postcopy; it's just run on the src host.  My major point is that we should
> avoid introducing the extra pss logic because fundamentally it's doing the same
> thing as get_queued_page() right now, unless I'm wrong...
> 
> So I think your previous poll_fault_page() call is okay; assuming the same poll
> model as you used, I mean something like this:
> 
> ------8<-------
> diff --git a/migration/ram.c b/migration/ram.c
> index 7811cde643..718dd276c7 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1473,6 +1473,14 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>   
>       } while (block && !dirty);
>   
> +    if (!block) {
> +        /*
> +         * Set the block too if live snapshot is enabled; that's when we have
> +         * vcpus got blocked by the wr-protected pages.
> +         */
> +        block = poll_fault_page(rs, &offset);
> +    }
> +
>       if (block) {
>           /*
>            * As soon as we start servicing pages out of order, then we have
> ------8<-------
> 
> So as long as we set the block and offset, pss will be updated just like
> postcopy.  That's exactly what we want, am I right?
> 

Also think the best place to put polling call here, not to touch pss yet 
again.

>>
>> Do you mean that if we use postcopy logic, we'll allocate memory and make
>> copies of faulting pages and then immediately un-protect them?
>> Or we just put faulting page address to the queued item and release
>> protection after page content has been saved.
> 
> I think current approach would be fine, so we don't copy page and unprotect at
> a single place after the page is dumped to the precopy stream.  If you could
> measure the latencies then it'll be even better, then we'll know what to expect.
> 
> IIRC the "copy page first" idea came from Denis's initial version, in which I
> thought as too aggresive since potentially it can eat twice the memory on the
> host for the single guest, not to mention when live snapshot is taken for
> mutliple guests on the same host.  It's just not something that can be directly
> expected when the user wants to take a snapshot.  That's something we can do
> upon this work, imho, if we'll have very high latency on resolving the page
> faults. But that's still the last thing to try (or at least an "by default off"
> option) so we can still think about some other solution before trying to eat
> too much host mem.
> 
> Thanks,
> 

I totally agree that creating shadow copies for each faulting page is 
not a very robust idea.. Cause we could never know the 'proper' limit 
for the buffer memory we should allocate and cut from the host, it 
depends on hardware, guest workload, host I/O intensity, too many things.

So I believe file/block backend side is a better place to provide some 
buffering and keep memory/latency tradeoff. Also it allows to be less 
'invasive' to QEMU code itself.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

