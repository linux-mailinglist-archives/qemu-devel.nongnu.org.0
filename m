Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6A3A130D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:41:59 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwas-0001Fj-Ce
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqwZx-0008RW-Eb; Wed, 09 Jun 2021 07:41:01 -0400
Received: from mail-eopbgr50128.outbound.protection.outlook.com
 ([40.107.5.128]:56806 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqwZt-00015K-UQ; Wed, 09 Jun 2021 07:41:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUls5KWgSQ84kmSNQc7i5PzgsNEyxnRKYvKeIc295IU1zEcYIEqFk4iJX+f8glwZtoTCfatK68E8TRmTvP5Yv85cMOCpYKY5X+IdFDt9IuMJRCb68SGfF3Jc7KFZXPK6RBbIjZMRxqaLVU3/vqQtN95bPY+vOW+bypdM4CUj5o5Wy8C3RbHSeNhFvcXBl8CPkMj4ESy4Slghb6ybZO/fsPPDsgznv1Fct2g72OzbrmRDrVPnuMOrWFKeiePF1LzSgqRw5FsCsrUwrLOv/UvdRfCLlSJu4WCV3bvDnQcqenkY5AMF8dabkh3xLPRYe7d4jwvM3hFchxwU8GHkqB4nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcJx7X3eE1tybDMhIU3ojUnXkRAC76w0RqlJjqyy6pw=;
 b=hkwxPCVIkzvTK/bSAEC+OfXFgAJN9BYMIa4vVfJwQEf8wK6ZAumao4RUFNdQ/Jbn5AzpfPlo4iq+0O93KzQkOosbzYgakTDge2t2qf8UDjjYUssk4ww5BHrXb77qAZteYvi5gBZAOY8eYWZUEFJxVRMQn/K/4zUzLvtPSRLen3VjhojK14L3Z34DvAZBp0GAX9IOhaG5bgJ16kk7WZzuNltZHLMWWqRXrIh7UzY8c5Iywj1lOZvF98PNuJofCmANKmYfJ/rMP+hLgnApSFXoRvBSueWNrPJwQKVYygBC7/Oj4M7RmM+MiCzA90DRXYmO9St8kpMzTOXSWdf/hsBXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcJx7X3eE1tybDMhIU3ojUnXkRAC76w0RqlJjqyy6pw=;
 b=vMQbb0SuNKQi7d8XEw+tj9DCW22mXNl6hN+F4XdBaELoK3K6Ivn7852MKlOcSIItx+K/eaAK8wtw5uAr7K81LqFQfxrC13xhj61ROyub5RDC8wx+Xsx12gDmORNKEFBrH1/UOLPLQTVzbT8OKzszcklSlX3zSOr0q7IC6wpZqY0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Wed, 9 Jun
 2021 11:40:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 11:40:53 +0000
Subject: Re: [PATCH] async: the main AioContext is only "current" if under the
 BQL
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, qemu-block@nongnu.org, eesposit@redhat.com
References: <20210609105309.529896-1-pbonzini@redhat.com>
 <dd9c3572-65bd-17b6-f163-755cb37fffe1@virtuozzo.com>
Message-ID: <85de0237-b993-b365-aa49-755888ef91e2@virtuozzo.com>
Date: Wed, 9 Jun 2021 14:40:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dd9c3572-65bd-17b6-f163-755cb37fffe1@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM8P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM8P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 11:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 278073b1-3fd6-487c-6a72-08d92b3b7047
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33812EF2D021BC3EA9CB5059C1369@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6AO/8ckQbgcT9Xd/Bz1WzbGdvG+tb+VllItf5sVqk79vyjAE9npQrnhWX7bF1RPHZDNyc+ZEK8DFl6fG6rkfEO/jFRwfgo9iVO0FRD5GVpti9Y7ZzVp+C3lizKaI2rdD4HXc8mGSgblJlWLB6+ztIf5nzJHJfeaicumwLOoLRXnPSYknuX4ZKEa/r1v3wuOOToDpP9dQr0aJkabsCsk1qJjqFdf/WkZjoZT9osrqLWluyHv470fDNNDiPAYSat19z5H8WtNpb60aB5SteZWv8+UchhUe+50sOxZPkrvBBCRxOByidhxKcv5HvbEitYUosALMscwNAl89cL47jXvahZULXkcTXDGX3kKHqe+frf+AGlTRxes9CYdlUA0vt1Y0iAQE7FuWMfL5233cOC9RltieJxcc7sO6HRqpZn1JwdVbmEyg3WDtCNOJbMetfgV5QqVKkfNgTfJzilf4eExOqpHmeAEv0Vz6Bjpxj5T7VlLK512T/DBJWinjZ127W8+O55Sp7fZZe7d4FkOA8TLdNn1DVjTXNAWUFnLVGSaD1XJQflDUFw75tJ+JWtF9a4TmspyGchQPryvw83xNqngyknHfV5haWxlA8oN3zrU0RDgE6IAbT2k61UwUEthKzwt7mC8wK8SZ6boPjKd8OO2nQLOeU5FOTKVRT+vbqfqEysL3oiCM5OtJNaI34W3BcDubQQe2capAXnAdJYIWIveLr0dc27jOLsi+c4cpYZzUPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(346002)(396003)(83380400001)(8936002)(8676002)(956004)(66946007)(2616005)(5660300002)(16576012)(66556008)(316002)(26005)(4326008)(86362001)(16526019)(6486002)(478600001)(31686004)(186003)(52116002)(2906002)(38350700002)(36756003)(38100700002)(31696002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk9aUFlwZ1gxWm5JR2R2Yk9vWDRvTTcyeStIa0dSemNTK3RsOXQrdE40WGhF?=
 =?utf-8?B?am94cnpxSjkyaUpiU3FKcUFQZnlkRC9TQ2U0czlIbGtwK2FqY3ViQ1F3YnVU?=
 =?utf-8?B?WGdPNlpTQmdlZEJhSDdXTkI0NDBLMHFjdCszS3llQkhsRllFNU4xK3V1S1dP?=
 =?utf-8?B?RmxYd01CanhYQ3A2R2NIUkJvWkVocDY2YU96VWRyME9IbytUOFlCNE4xbmpB?=
 =?utf-8?B?Tm0vU3BTVlBMQTd0V0tabGlRUmJyUGdxY2NwR2RNQUI0MUx4NFFLSTZBYm9m?=
 =?utf-8?B?blZpZ1RpNEd1SEJISkw1Y2kxOUtyZ0hZd0Urb281dkQzZ2VZdDNJbHM0ZWE4?=
 =?utf-8?B?K0ZsTVBZM0FLR1Z4L2hxN0RpSzZabTVkRlJ1cW5JN2ZwZmVXa3FKN1R0dkFw?=
 =?utf-8?B?aCs3NlU5MmNGcFJLdm02NHYzZkE5RzQ0dTcwQjhZZWQySm1VeGpveTZwbkZO?=
 =?utf-8?B?TGNUN0pPaFZGNEZnNlMwYTgrNHBic0w2NnljK2JhVFFuT3BJcmVkMUN6d1g1?=
 =?utf-8?B?MTVuMEFRTkxEdjM0cG1wMzZxMXphUDJQbklITHVjVW5scHJHREZIK3N4dTFO?=
 =?utf-8?B?UFh6VGloZzU2NmlaejRaUW5UcTU2S1daSGc2VHNkcVBhQkFpTGMzak5XYlhZ?=
 =?utf-8?B?eVhHSTdwanZTTkFSQk1HU0xrTmFvLzFKa2JSTjhoSklCY29aN1lJdk91QWRP?=
 =?utf-8?B?amd1MmVUdFRoNWdic3lpN2R2WUdvakZnVldaRGlzVjBnNnRNRWJpU1dzNGlE?=
 =?utf-8?B?L2FIcnNEMkhScDZRZ1ptTU1PU05wdUFJMlZPTHcxV3krWXBKTk5wdVB3aWFm?=
 =?utf-8?B?ZERUcFZEYzh2SjRSRmkrUEVudXBNNU5KZzdIOGg5R3gxMExsSndKZ09Candn?=
 =?utf-8?B?WDNzazg3QVRJSS9zYnhiUmZobFI1djJKSFl4L1FaRjdacjcyWjNzL2ZzcnJJ?=
 =?utf-8?B?K2dNbU83WGNvNk5vUkNDamZmTytGR0pQdlVhRTI0bFBURWsvelRLbjBORjh5?=
 =?utf-8?B?ZTFqdlFaaEdiVVZZM0tNMU11eDBiU2hzN2pRTGFUVXg1bm9hVndRbjltbHd1?=
 =?utf-8?B?bXJBbC9LRlV5Y3phOFlUems0bEo4VmltaDVLT0M2c2JZc0hlcyt6SkI3QU9s?=
 =?utf-8?B?VmhpRnZPR3E5Sk5MQjA1MS90c3NCYkNnb3l2UnZsbUwrTzF0WitpU2lsb1Yy?=
 =?utf-8?B?VDBvKzFtRnlEMERaMDQva3ZVL1pJU1FJa1lia1pwUU5IM05Tc0pDRGlaczN1?=
 =?utf-8?B?YThmSUNrTU5Cb0ppN1ZEdEwvaW0ySC9zODF5LytMZlRBQm0rSktkczFjbmpK?=
 =?utf-8?B?aDR1NC80K01oU1YxQmNHb0FJbDZKaUtJRFh6ZmVjU0NxWWRGNy9MK2xxZDAz?=
 =?utf-8?B?Z05MSjF0SEtUZWhWUmxYelFsQ3o3UmJsbEZBLzNJbDhXRGRNek9US1lPazNm?=
 =?utf-8?B?a211bWdpTTEzejhsOFVDNEl6ZHg2amEzMXJFMVROeWpXcDVsRGU5YjlkSVY0?=
 =?utf-8?B?Rkh1amdvQXpzeWJZYkVlNHRTWkswRGR3bmhoMzNkYkErQUhqQk84UnkxV2Z4?=
 =?utf-8?B?Y3pUMU5vTDRHdTIzTHhZaVdiTVFtVHM0QXMzS3NxZEhFOFlvdzNvYkVidG1B?=
 =?utf-8?B?OW5TK05jQ0F4dkxWOW0xK1BJN1ljNCtCUDVnOTc3aEpMQmUwM1ZiT3U5SnVB?=
 =?utf-8?B?eVlsQ0VJZElwVEhQd0prM2NoTGlTRkJ3aGRyTVQzUUV6TlNnSC9tOWVmT2Zo?=
 =?utf-8?Q?bovV9HPxnjTcwMhSfSKnwRnwMQ4f6r48BpszSl1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278073b1-3fd6-487c-6a72-08d92b3b7047
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 11:40:53.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8UI4zENvc/F3RBVbR8/p0PFYxFejfUbWMLJ9GkcMc7FDvlcBFHr5Spv7+xpm5EXJnpOrE2VALRADdVCNEscC/l1yrO+1wQ3zM3Q0QeR710=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.5.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

09.06.2021 14:32, Vladimir Sementsov-Ogievskiy wrote:
> 09.06.2021 13:53, Paolo Bonzini wrote:
>> If we want to wake up a coroutine from a worker thread, aio_co_wake()
>> currently does not work.  In that scenario, aio_co_wake() calls
>> aio_co_enter(), but there is no current AioContext and therefore
>> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
>> then attempts to call aio_context_acquire() instead of going through
>> aio_co_schedule().
>>
>> The default case of qemu_get_current_aio_context() was added to cover
>> synchronous I/O started from the vCPU thread, but the main and vCPU
>> threads are quite different.  The main thread is an I/O thread itself,
>> only running a more complicated event loop; the vCPU thread instead
>> is essentially a worker thread that occasionally calls
>> qemu_mutex_lock_iothread().  It is only in those critical sections
>> that it acts as if it were the home thread of the main AioContext.
>>
>> Therefore, this patch detaches qemu_get_current_aio_context() from
>> iothreads, which is a useless complication.  The AioContext pointer
>> is stored directly in the thread-local variable, including for the
>> main loop.  Worker threads (including vCPU threads) optionally behave
>> as temporary home threads if they have taken the big QEMU lock,
>> but if that is not the case they will always schedule coroutines
>> on remote threads via aio_co_schedule().
>>
>> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   include/block/aio.h   |  5 ++++-
>>   iothread.c            |  9 +--------
>>   stubs/iothread.c      |  8 --------
>>   stubs/meson.build     |  1 -
>>   tests/unit/iothread.c |  9 +--------
>>   util/async.c          | 20 ++++++++++++++++++++
>>   util/main-loop.c      |  1 +
>>   7 files changed, 27 insertions(+), 26 deletions(-)
>>   delete mode 100644 stubs/iothread.c
>>
>> diff --git a/include/block/aio.h b/include/block/aio.h
>> index 5f342267d5..10fcae1515 100644
>> --- a/include/block/aio.h
>> +++ b/include/block/aio.h
>> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>>    * Return the AioContext whose event loop runs in the current thread.
>>    *
>>    * If called from an IOThread this will be the IOThread's AioContext.  If
>> - * called from another thread it will be the main loop AioContext.
>> + * called from the main thread or with the "big QEMU lock" taken it
>> + * will be the main loop AioContext.
>>    */
>>   AioContext *qemu_get_current_aio_context(void);
>> +void qemu_set_current_aio_context(AioContext *ctx);
>> +
>>   /**
>>    * aio_context_setup:
>>    * @ctx: the aio context
>> diff --git a/iothread.c b/iothread.c
>> index 7f086387be..2c5ccd7367 100644
>> --- a/iothread.c
>> +++ b/iothread.c
>> @@ -39,13 +39,6 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>>   #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>>   #endif
>> -static __thread IOThread *my_iothread;
>> -
>> -AioContext *qemu_get_current_aio_context(void)
>> -{
>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>> -}
>> -
>>   static void *iothread_run(void *opaque)
>>   {
>>       IOThread *iothread = opaque;
>> @@ -56,7 +49,7 @@ static void *iothread_run(void *opaque)
>>        * in this new thread uses glib.
>>        */
>>       g_main_context_push_thread_default(iothread->worker_context);
>> -    my_iothread = iothread;
>> +    qemu_set_current_aio_context(iothread->ctx);
>>       iothread->thread_id = qemu_get_thread_id();
>>       qemu_sem_post(&iothread->init_done_sem);
>> diff --git a/stubs/iothread.c b/stubs/iothread.c
>> deleted file mode 100644
>> index 8cc9e28c55..0000000000
>> --- a/stubs/iothread.c
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -#include "qemu/osdep.h"
>> -#include "block/aio.h"
>> -#include "qemu/main-loop.h"
>> -
>> -AioContext *qemu_get_current_aio_context(void)
>> -{
>> -    return qemu_get_aio_context();
>> -}
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index 65c22c0568..4993797f05 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -16,7 +16,6 @@ stub_ss.add(files('fw_cfg.c'))
>>   stub_ss.add(files('gdbstub.c'))
>>   stub_ss.add(files('get-vm-name.c'))
>>   stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
>> -stub_ss.add(files('iothread.c'))
>>   stub_ss.add(files('iothread-lock.c'))
>>   stub_ss.add(files('isa-bus.c'))
>>   stub_ss.add(files('is-daemonized.c'))
>> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
>> index afde12b4ef..f9b0791084 100644
>> --- a/tests/unit/iothread.c
>> +++ b/tests/unit/iothread.c
>> @@ -30,13 +30,6 @@ struct IOThread {
>>       bool stopping;
>>   };
>> -static __thread IOThread *my_iothread;
>> -
>> -AioContext *qemu_get_current_aio_context(void)
>> -{
>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>> -}
>> -
>>   static void iothread_init_gcontext(IOThread *iothread)
>>   {
>>       GSource *source;
>> @@ -54,9 +47,9 @@ static void *iothread_run(void *opaque)
>>       rcu_register_thread();
>> -    my_iothread = iothread;
>>       qemu_mutex_lock(&iothread->init_done_lock);
>>       iothread->ctx = aio_context_new(&error_abort);
>> +    qemu_set_current_aio_context(iothread->ctx);
>>       /*
>>        * We must connect the ctx to a GMainContext, because in older versions
>> diff --git a/util/async.c b/util/async.c
>> index 674dbefb7c..5d9b7cc1eb 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -649,3 +649,23 @@ void aio_context_release(AioContext *ctx)
>>   {
>>       qemu_rec_mutex_unlock(&ctx->lock);
>>   }
>> +
>> +static __thread AioContext *my_aiocontext;
>> +
>> +AioContext *qemu_get_current_aio_context(void)
>> +{
>> +    if (my_aiocontext) {
>> +        return my_aiocontext;
>> +    }
>> +    if (qemu_mutex_iothread_locked()) {
>> +        /* Possibly in a vCPU thread.  */
>> +        return qemu_get_aio_context();
>> +    }
>> +    return NULL;
>> +}
>> +
>> +void qemu_set_current_aio_context(AioContext *ctx)
>> +{
>> +    assert(!my_aiocontext);
>> +    my_aiocontext = ctx;
>> +}
>> diff --git a/util/main-loop.c b/util/main-loop.c
>> index d9c55df6f5..4ae5b23e99 100644
>> --- a/util/main-loop.c
>> +++ b/util/main-loop.c
>> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>>       if (!qemu_aio_context) {
>>           return -EMFILE;
>>       }
>> +    qemu_set_current_aio_context(qemu_aio_context);
>>       qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>>       gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>>       src = aio_get_g_source(qemu_aio_context);
>>
> 
> 
> Hmm. Your previous suggestion (with my addition) worked better for me.
> 
> With this (and my series on top of it) I have a dead-lock in iotest 058.
> 
> And in gdb all looks like aio_co_wake() in my own separate thread leads to coroutine execution exactly in my own thread.. So, it don't dead-lock on trying to acquire the context, instead it somehow enter to a coroutine.  And then deadlock because called coroutine tries to lock the mutex, that already locked before (in the code that thinks that aio_co_wake() will only schedule the coroutine).
> 
> I'll dig into it a bit more.
> 
> 

Aha, that's because qemu_mutex_iothread_locked() from stubs/iothread-lock.c is used, which always returns true.

-- 
Best regards,
Vladimir

