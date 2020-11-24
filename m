Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4802C1FB9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:20:29 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khTYq-0005vv-Rr
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khTVr-0004Y2-LD
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:17:23 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:26295 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khTVo-0006eA-Ex
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:17:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaV7B+rEsupRq1j1bVaYkzlVkSTRHafw6arNFS6PQOFFDWUOtO0Ch/kILVqFSX2rRb0dvolmJcGomCXGe1C8N/KkipDgy0hKFEGJC0ZsQ/DD3sLKLfw9TSqZNaG6ZVDjWzcWXGRaz80QuQC4PBDY+ZrnEPA56zWQ3E6rE/ott97vkN5AUVXQe44mLvkQwu5QJGT+v0dz1+zepY7kcEu2Yxm6ce4VsbzHloYbwbJJuFC+3/iLkTPyh5LxYnFZAQ/QZM/bdZ+1I7MOKydkW59td+A1yIGdXVsZe7YGDfNrsLdeREbqATqe6K3uKMRZzngublO354HeROqfADJikgGMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rwoHde61GYYS6QEPXCulxsIOn3UpJQSw2ttMrWOflw=;
 b=kAr+8vpk8A0E4n2aLtTtJeAn4kZhXAB0Mz+7WkpiamuukIH240gKNniAUy8AD2TI0IlneoaXyaa4s9n+wDm8BWsFhfpFq6KLjXvPcK8i7MLbz9Hp3U7jlyfCQIb9qBE2Qo4tgK/9EBD0HAmsMrIMq1rSWUKy6BGAX/0rCTskf2mQ0WwGAbKcoBJFiSM1OHpv6V0sb4tWOLVz1q6q/UA9F1vF1akHiIXha6fRT/0UGr/HFOCyjpm58EWb/V4zZhi6tB9zjZ92g/T8xhYnpCK0sc6TnMZ+Vvt6j+O1MLyVh3AxlYUhZonCTkajlp7zay0+Ku/5wRbCZfYnFa5u0rUalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rwoHde61GYYS6QEPXCulxsIOn3UpJQSw2ttMrWOflw=;
 b=QLfMax+dumbx9wOViZ3EqsW1qXV4YC/OSDwSpbkYgqpg9ChiiteyMiEaneoW/AqY9+iPJr+WeRkLyUlJT7IxORS6oXbI9c0mspLMQmFa2Ig1N+XxQhK6guBywj2hTXV2nr+httAGk8a/blg8aHsp8AHpXMBW+05Y+i0g4rBGtmY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5870.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 08:02:11 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 08:02:11 +0000
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
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <b38025e0-ca06-b7e7-0745-3fa411019dd1@virtuozzo.com>
Date: Tue, 24 Nov 2020 11:02:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201123213443.GE60522@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR02CA0093.eurprd02.prod.outlook.com
 (2603:10a6:208:154::34) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22 via Frontend
 Transport; Tue, 24 Nov 2020 08:02:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71bfbc86-aa22-4597-788b-08d8904f3f72
X-MS-TrafficTypeDiagnostic: VE1PR08MB5870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB58700A070F514A85D22EA94A9FFB0@VE1PR08MB5870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dKT01AskrsDx025heNkvVSQOEtTot3KEH2HCDaEB8MwiKsMM8Sr2KqvT3h8zBrJUXJJ6Jh9WkBRtwAx8PnuxPNzAUuNYraKvtm/rpoE0WPWWdfKgnmpwPun1+tBePwmg90tCj/ZlTH5jTi701J0bGZRhIR51sbTgoEAjcQfgjrG4YhqNJx1A7Eo58kGuGTBl1/vyKgByaw1CF5w2oKTexrGuNoblxJSz1txUeMPkRVP2DEKzv9XIiEZb7al4XevzsQezzShJmY608tLrXAfBX8c5lGMmcvqc0lcYnSxV/aA08Az8vFwfdOGnjQ9BBcoLx5RXYPDSOCSXQ4dkRaPrcpYenG64VVfrX/y769tm5RYEneOPJuaox/x2AZjmg2v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(376002)(396003)(346002)(54906003)(31686004)(66476007)(16526019)(26005)(186003)(66946007)(316002)(31696002)(16576012)(44832011)(4326008)(86362001)(5660300002)(6916009)(36756003)(8936002)(83380400001)(66556008)(52116002)(478600001)(6486002)(956004)(2616005)(53546011)(8676002)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDh3Y20vVTU5SWZNRTNCR2RJcFBJTG5vR2pqNFJkQUpmTlRicWZFWWhJanBF?=
 =?utf-8?B?aVpsT2hIeVNOTGJva2RvVlBmenJKdTB1S3hzSXlzUk5OYlR2TFAyOUZwN21q?=
 =?utf-8?B?NlNwSVRDeGJJcE1IUHY2VURmejRPM1VKOEJwVURpNzN0SGtyYy9vbXBYWDhQ?=
 =?utf-8?B?TE9VZVlnU21RVERVWnk5cHlESFBCbFVybTRKRnp2SGhtbzZYSHFYV2ExVU1N?=
 =?utf-8?B?SisvQ3BNcy9JT1lSTHVXdzFDSHdsUHBiQU44b2YwUlQ4L3hyQlpCbmZ0ZDdD?=
 =?utf-8?B?RFNWQlViT2pLSEpUcTVhbFNJRGFRM3N1WXVvUSs1eUd6Mjl5Z1UvWjkxWGRr?=
 =?utf-8?B?QzFHemVrL21jZFZyUTV5bjB2MFgrb3ROSnNpekl0STdJNGFnaWRmcnUwVEYw?=
 =?utf-8?B?Ym5pY3RGaklYQnNjcmlVNFVkNkdvNVJMcUdBU2k0am5EayttS3Y0NWIvWDJk?=
 =?utf-8?B?d0svWnJDcndJRzFHeUxaUnVZQnFzc1JBSENlaUkwcE1pMC85SUpHQnJFRkZ2?=
 =?utf-8?B?ZzN2S3R1Tkhwdzl6a283MjUwNFhPY01FVmtSR3d6NDkvT0FQZTh6d2Mvd2FY?=
 =?utf-8?B?b09QeTh4c0hzaDBlYXhIT1UrRVAyVXR6QXlmenBXaTZvVUZzTHQ1UEt2Y0o2?=
 =?utf-8?B?MTREWjRySkd1eG5kTkEwMnNsbW9wUXFRcEwzcG5ZcDdRMmhaeDhna3Facy81?=
 =?utf-8?B?RnFoeTFSdFVGcVZ4dWN1Ly9wUDdyUll6eTJ2U0pxcjEzRDhiZnNxZUYrYlpK?=
 =?utf-8?B?MjBNbnN2bUZFVEhvemk2dkNma3Y5UitoRmREVndYTFFaNStnWjhSNHBTVElP?=
 =?utf-8?B?eWgyRXNpV0ZPU2RHOHpickdmaGNVVS9wWkl3UUgzQ2ZVblhTN3kzTlp5NWZs?=
 =?utf-8?B?VnNIUkttVlMvQTFvREZMbThFWGxybHlhak5BM01idWhhNG82eFVMbUhwVUwx?=
 =?utf-8?B?Q08veDhCWVRRVzQ2c3AzTWw4OGZHS00vM3k1YUxxVSsvcnUvakVYRlRtRWtV?=
 =?utf-8?B?Q0JoVzhkamlQYXR0T2tERTgxOFZUbmtWTzVUaDF6WUJqT0tjenF2aTBJeGM2?=
 =?utf-8?B?eStXZFpaZHZCL2dPeFdneUlXUnE3Y2U3VGdJeUtTdFpyOXBWOEdXeUREdjJr?=
 =?utf-8?B?VFZOdlFzdnFRcThnMHdoODUyaGJwQklNanl5Ny9peTJhbDR5dWRuVG8zYTN1?=
 =?utf-8?B?bjJDSlZRdlZCbXh1YzZkMFlwakR5UDk0cnE3a3J3TXNqTWlKMTJNMmxycUwr?=
 =?utf-8?B?NHRTUlptbENpQmZKT2p1Z1Z3TldaR0R1ckFCZm5pb1Q1Z2RyaVRBMVN1NmJm?=
 =?utf-8?Q?G7IBpnJTX2Qw0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bfbc86-aa22-4597-788b-08d8904f3f72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 08:02:11.6256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Hp/C2pr3mwzSbLLojPYPvO/G4xxDRB9IInmHekGs/RcYT2qXVD1KXKxA3nBvZBeaY7CMcb2kWK7IErWX/z13BylqhCMZJR6P40NHcdAIvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5870
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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

On 24.11.2020 00:34, Peter Xu wrote:
> On Fri, Nov 20, 2020 at 07:53:34PM +0300, Andrey Gruzdev wrote:
>> On 20.11.2020 19:43, Peter Xu wrote:
>>> On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
>>>> Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
>>>> worring a little about some additional overhead dealing with urgent request
>>>> semaphore. Also, the code won't change a lot, something like:
>>>>
>>>> [...]
>>>>           /* In case of 'write-tracking' migration we first try
>>>>            * to poll UFFD and sse if we have write page fault event */
>>>>           poll_fault_page(rs);
>>>>
>>>>           again = true;
>>>>           found = get_queued_page(rs, &pss);
>>>>
>>>>           if (!found) {
>>>>               /* priority queue empty, so just search for something dirty */
>>>>               found = find_dirty_block(rs, &pss, &again);
>>>>           }
>>>> [...]
>>>
>>> Could I ask what's the "urgent request semaphore"?  Thanks,
>>>
>>
>> These function use it (the correct name is 'rate_limit_sem'):
>>
>> void migration_make_urgent_request(void)
>> {
>>      qemu_sem_post(&migrate_get_current()->rate_limit_sem);
>> }
>>
>> void migration_consume_urgent_request(void)
>> {
>>      qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
>> }
>>
>> They are called from ram_save_queue_pages and unqueue_page, accordingly, to
>> control migration rate limiter.
>>
>> bool migration_rate_limit(void)
>> {
>> [...]
>>          /*
>>           * Wait for a delay to do rate limiting OR
>>           * something urgent to post the semaphore.
>>           */
>>          int ms = s->iteration_start_time + BUFFER_DELAY - now;
>>          trace_migration_rate_limit_pre(ms);
>>          if (qemu_sem_timedwait(&s->rate_limit_sem, ms) == 0) {
>>              /*
>>               * We were woken by one or more urgent things but
>>               * the timedwait will have consumed one of them.
>>               * The service routine for the urgent wake will dec
>>               * the semaphore itself for each item it consumes,
>>               * so add this one we just eat back.
>>               */
>>              qemu_sem_post(&s->rate_limit_sem);
>>              urgent = true;
>>          }
>> [...]
>> }
>>
> 
> Hmm... Why its overhead could be a problem?  If it's an overhead that can be
> avoided, then postcopy might want that too.
> 
> The thing is I really feel like the snapshot logic can leverage the whole idea
> of existing postcopy (like get_queued_page/unqueue_page; it's probably due to
> the fact that both of them want to "migrate some more urgent pages than the
> background migration, due to either missing/wrprotected pages"), but I might
> have something missing.
> 
> Thanks,
> 

I don't think this overhead itself is a problem since its negligible 
compared to other stuff.. You're undoubtly correct about using postcopy 
idea in case when wr-fault pages arrive from the separate thread or 
external source. Then we really need to decouple that separate thread or 
external requestor from the migration thread.

In this patch series wr-faults arrive in the same migration loop with 
normal scan, so I don't see direct reason to pass it through the queue, 
but I might have missed something from your proposal.

Do you mean that if we use postcopy logic, we'll allocate memory and 
make copies of faulting pages and then immediately un-protect them?
Or we just put faulting page address to the queued item and release 
protection after page content has been saved.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

