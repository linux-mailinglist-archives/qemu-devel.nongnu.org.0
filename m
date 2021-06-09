Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4713A101E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:26:19 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvPe-0003R6-6U
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqvNt-0002Zr-Mq; Wed, 09 Jun 2021 06:24:30 -0400
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114]:20960 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqvNq-00022C-8X; Wed, 09 Jun 2021 06:24:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUJXbLXHEn7IOYVDPgVtuCa48iDh/EnY1zDWq2wii6/1v31T1Kmmdsj35R88g8GbPCy3jPpSSzEK9Lfl44oQFf0ieMkOULrXBanYdxAtBiZbH8xV7+KzxfoQq7dnCJjW6PRBX8SfrfgtKQ3XVHEkl0ecMhVqOQS949/Ni/DR+L4Q7xP27FJsa8Mmxn3veLeF+3Y8a2+HjkbYc4VSsrJAzzuoToHICP+uumgZ5uO3FS4hNLsplkR5avrBVeS15n58r4gbn/mtJv23OtLQmsnY242qHrJiYAUQ+n/pRHsgl4rQA9FJeDQmM4duDVdRqNHKmAL1FI98gRMYIMhkEYw+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4PtIZ4QKvaSzcnRKB6bKasxKUUWF45M1rt0SbZZvXQ=;
 b=QLVLo7rCRM86HevC/4nh8Wk3M3xqsPfDzFvr55eFKez6RudCTbo570Eok6CjVPAyJpBtUtAP4sNp3llmIC53Cm6hwavRNXBVEvg5A4tnEQ4i/wMX2XWvqkDlyzjU1x89uIC2dtfzuMUSmr7bSmyb3AIYQifmiiA8Pq0RJL/4sYMtWtVjA5pdwJnNzv5iwkGNiU7JGoXkuIoqaRr/17giu3UEngANZUZiP3WvpT4cvwU8XcEOt0A07maPUKTPwwFnU+CFRLD16sKNbOZ4iby6AWUJAT5dhxeo6/Q1Z7OjqSFyZDpK4ODxFqqtz8/JuRhQWv8FxTjkAd6C9jG9mXqDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4PtIZ4QKvaSzcnRKB6bKasxKUUWF45M1rt0SbZZvXQ=;
 b=jBxk7dcAAnJpXsgsf/e79zWXjT3KqfmWK4FxoMj8TJdozd2UBJ4aoxlyE1KIMTQMDEN4mghAp0PinMYFVO5fjOBCr3lMf6MkaPfgFUvrU7IYqN+8I6CR9yYdsOWNxf0ZGxDytgQMZG9iPjfhfhPOw0UJ61K77p3FJMFEQIna66w=
Authentication-Results: euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 10:24:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 10:24:22 +0000
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
 <52ba34c5-1de8-21b3-a31c-bf51676c29af@virtuozzo.com>
 <154cff7e-3552-5cb1-4d96-8dae3c1607cb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <008cbc78-aebe-e2fa-8fb3-f8cbdc6daf31@virtuozzo.com>
Date: Wed, 9 Jun 2021 13:24:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <154cff7e-3552-5cb1-4d96-8dae3c1607cb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 10:24:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 850b4a33-ac19-4327-03fe-08d92b30bf6c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376738BDEBA7D0D258D4EDBC1369@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcnhwujYCGTh+9RBje9XoKYA5gXN3XAKDNpcKK6s7RW4yIHx8Ai54VuHlUBBm0Bl58rDxLvYi+IO2QBzC0Dux4fwRB00SzJ3ZEpQ1Z1o+vj8jCYVYHMGP9iBSdlkr5/vZR9xS9J8JOeMtzLqB9LBL+VWeQaSKH4Ueq4JBZYbxMVSo+CzCkJ/yygRKyCkzh5Xv7B74tHBJUuhXs0CtPKRfQIxhYoBtUqyziRr2RpOv53l3Gt88Cmf1t9Lv34Nv4Hz7eyj+CxxhtqifD7bgEV/GVGRZ5GlnDsd0U6hgxlm4GRftonBs90MnGAwkKBIOQlknEF1AaX0sihsMjGTkzdk3AXnd/r/4BNsQe8+JLlLQOsfWKMNnsSm8FzAkKlSu3C1qJsh1GY3ll5P8AgfWDIWL5bVPYsSj2CqweTIM1EhHZvFZc28p9Dek/pTtxtK2avcne8XkdcjCNYOdLYWmjb5R1bAPXM7gGqJRKSP5RiBJFCRf7OwTcsL+z6K/q2jHyomyWEwQmzm0r4AbQzWSuCrpyKXjnYMwM/qtlDK8yU4Uh/LRuQU4fJ1wLonW1GhBndQYfa1tswsc4LFIQzMSu5HLzJqqfw0u2daIwJ/v3Lb0+yg5TqAK5oKeAA2RX1ufuRiYslI6o2r4zXQqgNMOWMbRwb73KcVfqh9XMxnZrTmr1AtLWgfFVrDOOsy6Bj2A8qW8wovNlh0qoTT5xnWkc+WpRqbMt7/XnjL7eAEt7hh5H8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39830400003)(8936002)(83380400001)(86362001)(31686004)(5660300002)(16576012)(2906002)(26005)(956004)(53546011)(8676002)(31696002)(16526019)(186003)(478600001)(38350700002)(36756003)(316002)(52116002)(4326008)(38100700002)(6486002)(54906003)(66946007)(66556008)(66476007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UCtYcEZJK1pPeUk3b0NaRDNPL2MzZG4vM0ZQdlc5UE54Um5lY2ZrMTBpSjdD?=
 =?utf-8?B?aHYyblV4Rm8xdEtkT3RxYnZpV3QyMGxmSHNkZ0hESWlPRXI2ZEJlL3RuaTRz?=
 =?utf-8?B?U1NNMklCTE1tdFpMNENRSEhBZS9TZm5wTnZEUFBCRzVkQVYrVzZXMjVQaVQw?=
 =?utf-8?B?bmVtNk9LOEg0ckpPMVBpK0I4Ukc4eE1PNm9XejJsMlYrSHFiZm44dWxtaU1j?=
 =?utf-8?B?UTU3M2NZbkV0L1JsSVVjTW83ZFBwaE0vQVBkTklvZ29LckU3dnZCSzFqQmpC?=
 =?utf-8?B?MUszdlo2dExicmNnWFFsZlhTUUtWVUZqSXlub0lGcTY4NUJ4NWljZzhBS1VF?=
 =?utf-8?B?d3M0aERmMzU1ZmhTdzlrUEhJL0hVOHZiMFlOYWRDSDZ4RWNTWFBLWGRUTHFZ?=
 =?utf-8?B?RDRDL2M2U2lscG5HL1FRSm9wdDJlVlBmWXdORk9ybXNoVzF6Mk90VVJacmxP?=
 =?utf-8?B?cjJoNmcvL2FyeTREYyt6c1VxSTBkNHE1WDZ4Z3JQdCtqMWIxdHNGRFZxcnlj?=
 =?utf-8?B?QUZjcXAvVURoZEpDaldrakxKblA5N1REZTNwU3lGNHBmcVN4TGVqUDJldWdD?=
 =?utf-8?B?bjVrT3U3aGpMZFpXczJMd2Z3RlRyYllTaG9KZy9RVGZLaGpxNjlnbmcxOGN1?=
 =?utf-8?B?MnRsVXhsbGhlSzhtV0t5cTNVd3hxSUdjM1NId1pEQzNwdnFTODR6UlpZYWc5?=
 =?utf-8?B?MXpadEJyM2hCVktWMG0wbkl6RHAyaG4wVS9NNmpwZkE3Lzk2T2YxeWd2R2NU?=
 =?utf-8?B?cThBdmp2ODhnd2hTZEN3NmVvTWRncEhGMDYybDFBYXZnOGxCZ0E4QnF3RDdK?=
 =?utf-8?B?R3dscUhxSG9VTmJSRDJtR0w3NVVGKzRsQWlQak45dnJyN2U5UndIdld6VGpX?=
 =?utf-8?B?TU9ZcU5aWjhRdlpqcHY1dHd6WFE0Tm9aSld2SHljaTZmbnMwOVF6b1F6eGYz?=
 =?utf-8?B?cGNKbHFQekpid1lLbDlnRURxdmNoeEhheGVPcHZ0bHA5UFJDbUU5eStEeVd3?=
 =?utf-8?B?S3dndURDTVYvMHNQeWlYdnhUb3lQQTlpZmhoSEV3TWxKclZDd0lWMXZXVVVa?=
 =?utf-8?B?RWhPVmRFYTJEc0c2cWxGR3drNUEyRFNaaCtiZ1FRNkJobzVlK3h2MWJDVjhm?=
 =?utf-8?B?eFdiQVlnZ0lYN3BzdEdHVnQ2a29FTm1QUTVvcFNrN3NyMXZBOGZCaklWM3I0?=
 =?utf-8?B?RFdvbDJCaWFYV2Nvc3NRVnBpVkpuMmxqSnFhUzJ6TTN4bU1oNjNOdkdwZVN4?=
 =?utf-8?B?N0dSTUZ1ZjVaTGhPTk1IUVYxcTl1RjZkNnYrOWFZWnA5ZTB1VlBVK1pNTi93?=
 =?utf-8?B?N3dEM0J5dGpocUF0MWxBeXNwWnVSbHFsZFJPRVlVUnFCREsySldTbE1zU1VS?=
 =?utf-8?B?OEtOVzJtQTJEZ09xSmtwZjNKUXhocHd5eU5YY3hLZXpzR01FZFA2VEVIcGdK?=
 =?utf-8?B?RWpFSDhtS2piOU95UExRL3QyUGhMSVJrR1pUbkl0ZmRDejNkQjdhMDRFdkFN?=
 =?utf-8?B?eVlhZXJXSGVtUkhRNWxzMk9UQ2tpYTRWQTNmdkVHbUZKTDhMNzhBUlF5MGtY?=
 =?utf-8?B?TkxoOVhuYnhrenhwNjB0ejI2Tmh3L3pFL0VhejA0VGZHNndpbmUrSGpiN3dF?=
 =?utf-8?B?M21RWGZVK2U4eTBkT0MxcXpxV1VJcVBNdnNtY3oxRW1EK2hTOXhNbGVvQ216?=
 =?utf-8?B?S09aem5uKzlzeEEvdXFFZDRGbWFoeVM0N0V1bDcyNnVyNElseTFvTHNPcVpI?=
 =?utf-8?Q?omxVMtBheYnc4XZ6YZCcRAeLG2aRNvgDV6cSBCN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850b4a33-ac19-4327-03fe-08d92b30bf6c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:24:22.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGz5W4+Uu22MpU93cR08YyudR0gK3WExaIxJ1NXVGC92HXYfXnVUrEGUP67vo0hjAJW19BuLdfq2sodrZGDzXBeXy/3GYHv8cD3B9PsGj/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.22.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

09.06.2021 12:35, Paolo Bonzini wrote:
> On 08/06/21 20:45, Vladimir Sementsov-Ogievskiy wrote:
>> 14.05.2021 00:04, Paolo Bonzini wrote:
>>> On 12/05/21 09:15, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>
>>>>>
>>>>> I don't understand.  Why doesn't aio_co_enter go through the ctx != qemu_get_current_aio_context() branch and just do aio_co_schedule? That was at least the idea behind aio_co_wake and aio_co_enter.
>>>>>
>>>>
>>>> Because ctx is exactly qemu_get_current_aio_context(), as we are not in iothread but in nbd connection thread. So, qemu_get_current_aio_context() returns qemu_aio_context.
>>>
>>> So the problem is that threads other than the main thread and
>>> the I/O thread should not return qemu_aio_context.  The vCPU thread
>>> may need to return it when running with BQL taken, though.
>>>
>>> Something like this (untested):
>>>
>>> diff --git a/include/block/aio.h b/include/block/aio.h
>>> index 5f342267d5..10fcae1515 100644
>>> --- a/include/block/aio.h
>>> +++ b/include/block/aio.h
>>> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>>>    * Return the AioContext whose event loop runs in the current thread.
>>>    *
>>>    * If called from an IOThread this will be the IOThread's AioContext.  If
>>> - * called from another thread it will be the main loop AioContext.
>>> + * called from the main thread or with the "big QEMU lock" taken it
>>> + * will be the main loop AioContext.
>>>    */
>>>   AioContext *qemu_get_current_aio_context(void);
>>>
>>> +void qemu_set_current_aio_context(AioContext *ctx);
>>> +
>>>   /**
>>>    * aio_context_setup:
>>>    * @ctx: the aio context
>>> diff --git a/iothread.c b/iothread.c
>>> index 7f086387be..22b967e77c 100644
>>> --- a/iothread.c
>>> +++ b/iothread.c
>>> @@ -39,11 +39,23 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>>>   #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>>>   #endif
>>>
>>> -static __thread IOThread *my_iothread;
>>> +static __thread AioContext *my_aiocontext;
>>> +
>>> +void qemu_set_current_aio_context(AioContext *ctx)
>>> +{
>>> +    assert(!my_aiocontext);
>>> +    my_aiocontext = ctx;
>>> +}
>>>
>>>   AioContext *qemu_get_current_aio_context(void)
>>>   {
>>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>>> +    if (my_aiocontext) {
>>> +        return my_aiocontext;
>>> +    }
>>> +    if (qemu_mutex_iothread_locked()) {
>>> +        return qemu_get_aio_context();
>>> +    }
>>> +    return NULL;
>>>   }
>>>
>>>   static void *iothread_run(void *opaque)
>>> @@ -56,7 +68,7 @@ static void *iothread_run(void *opaque)
>>>        * in this new thread uses glib.
>>>        */
>>>       g_main_context_push_thread_default(iothread->worker_context);
>>> -    my_iothread = iothread;
>>> +    qemu_set_current_aio_context(iothread->ctx);
>>>       iothread->thread_id = qemu_get_thread_id();
>>>       qemu_sem_post(&iothread->init_done_sem);
>>>
>>> diff --git a/stubs/iothread.c b/stubs/iothread.c
>>> index 8cc9e28c55..25ff398894 100644
>>> --- a/stubs/iothread.c
>>> +++ b/stubs/iothread.c
>>> @@ -6,3 +6,7 @@ AioContext *qemu_get_current_aio_context(void)
>>>   {
>>>       return qemu_get_aio_context();
>>>   }
>>> +
>>> +void qemu_set_current_aio_context(AioContext *ctx)
>>> +{
>>> +}
>>> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
>>> index afde12b4ef..cab38b3da8 100644
>>> --- a/tests/unit/iothread.c
>>> +++ b/tests/unit/iothread.c
>>> @@ -30,13 +30,26 @@ struct IOThread {
>>>       bool stopping;
>>>   };
>>>
>>> -static __thread IOThread *my_iothread;
>>> +static __thread AioContext *my_aiocontext;
>>> +
>>> +void qemu_set_current_aio_context(AioContext *ctx)
>>> +{
>>> +    assert(!my_aiocontext);
>>> +    my_aiocontext = ctx;
>>> +}
>>>
>>>   AioContext *qemu_get_current_aio_context(void)
>>>   {
>>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>>> +    if (my_aiocontext) {
>>> +        return my_aiocontext;
>>> +    }
>>> +    if (qemu_mutex_iothread_locked()) {
>>> +        return qemu_get_aio_context();
>>> +    }
>>> +    return NULL;
>>>   }
>>>
>>> +
>>>   static void iothread_init_gcontext(IOThread *iothread)
>>>   {
>>>       GSource *source;
>>> @@ -54,7 +67,7 @@ static void *iothread_run(void *opaque)
>>>
>>>       rcu_register_thread();
>>>
>>> -    my_iothread = iothread;
>>> +    qemu_set_current_aio_context(iothread->ctx);
>>>       qemu_mutex_lock(&iothread->init_done_lock);
>>>       iothread->ctx = aio_context_new(&error_abort);
>>>
>>> diff --git a/util/main-loop.c b/util/main-loop.c
>>> index d9c55df6f5..4ae5b23e99 100644
>>> --- a/util/main-loop.c
>>> +++ b/util/main-loop.c
>>> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>>>       if (!qemu_aio_context) {
>>>           return -EMFILE;
>>>       }
>>> +    qemu_set_current_aio_context(qemu_aio_context);
>>>       qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>>>       gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>>>       src = aio_get_g_source(qemu_aio_context);
>>>
>>> If it works for you, I can post it as a formal patch.
>>>
>>
>> This doesn't work for iotests.. qemu-io goes through version in stub. It works if I add:
> 
> Great, thanks.  I'll try the patch, also with the test that broke with the earlier version, and post if it works.
> 

Thanks, I'll base v4 of nbd patches on it.

I now run make check. test-aio-multithread crashes on assertion:

(gdb) bt
#0  0x00007f4af8d839d5 in raise () from /lib64/libc.so.6
#1  0x00007f4af8d6c8a4 in abort () from /lib64/libc.so.6
#2  0x00007f4af8d6c789 in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007f4af8d7c026 in __assert_fail () from /lib64/libc.so.6
#4  0x000055daebfdab95 in aio_poll (ctx=0x7f4ae0000b60, blocking=true) at ../util/aio-posix.c:567
#5  0x000055daebea096c in iothread_run (opaque=0x55daed81bc90) at ../tests/unit/iothread.c:91
#6  0x000055daebfc6c4a in qemu_thread_start (args=0x55daed7d9940) at ../util/qemu-thread-posix.c:521
#7  0x00007f4af8f1a3f9 in start_thread () from /lib64/libpthread.so.0
#8  0x00007f4af8e47b53 in clone () from /lib64/libc.so.6
(gdb) fr 4
#4  0x000055daebfdab95 in aio_poll (ctx=0x7f4ae0000b60, blocking=true) at ../util/aio-posix.c:567
567         assert(in_aio_context_home_thread(ctx == iohandler_get_aio_context() ?
(gdb) list
562          *
563          * aio_poll() may only be called in the AioContext's thread. iohandler_ctx
564          * is special in that it runs in the main thread, but that thread's context
565          * is qemu_aio_context.
566          */
567         assert(in_aio_context_home_thread(ctx == iohandler_get_aio_context() ?
568                                           qemu_get_aio_context() : ctx));
569
570         qemu_lockcnt_inc(&ctx->list_lock);
571



-- 
Best regards,
Vladimir

