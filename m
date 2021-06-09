Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475993A12CE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:33:29 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwSe-0002Pc-Cm
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqwRh-0001aV-5e; Wed, 09 Jun 2021 07:32:29 -0400
Received: from mail-eopbgr70119.outbound.protection.outlook.com
 ([40.107.7.119]:30021 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqwRd-0004FX-8Q; Wed, 09 Jun 2021 07:32:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVniXJNTgnBHIvfmfmEHjjN5BRO701uPkauqWCg9ZLhWGJWqoWST3NsqQYctjCEOyr1SqpCDOsfWuJGXiCR8R5Rhs5XQhRh8ZMgorYK4Um9dsTlyzs0iTKrEiUqskTRYeDx3eaUSfd+hHknKJ1ifUoLa5U16dDkSTwjcOuh8tjY4F7nR14pJ71K7NoU7/CXwvZ52CUAcz8A6GphVeQ7KpFtP/GCdZAlT4QhAmWD+2YmzmXVRA6A5eUnCdrBcxOFthFaaCsZKIxGBlAJmk9Dkc5k4nxNvPZjxPL7ROQdpgU4W+tsNYeiiZzO1bTEIWWrLzSHLX9l892Za9pRXpjErmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQaf5Nf3H1B8XoNTvCK2KK4NrAKz7uh3TofND2nhr2k=;
 b=noM4y4qZ3JXfEJD6TZzDlOA9r/RiEOja9ePG9qXyNLAsMkqbKuLn9Xy83gUkJK3nFfym0TFVhMOSCmf9fGChUj7eaazCDr9qppVZpNKyeYC/L9MjSCQ7JqPmKkZe1YfWXrnRzUN1OWC1CNu5LTrEtl0xoAws8bgUfwCkpOSCkGiubC6D1YbcKE1UylRnpuEZVTpD55f7AKWfKp2WYf3yRNchc9vhhnDfaCp5WK8PaqIGzr0mWvUITVXwjHXdVbr8YU1CE669eOKfJQXVYIIE9XzdMeoIP/EI9w3QIPHY5/3+JbacNYaqelOtRuXVFxNmj3zV4oTl/8UVur8gCth+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQaf5Nf3H1B8XoNTvCK2KK4NrAKz7uh3TofND2nhr2k=;
 b=YVOWxtrOFSW+zD9o3GVQT4IQ99kWfDjOJ7X8Q/xQBDCjhV35RahlnWUkhvHQDwVyENObimXCN+fve3oAbnUUIzPlMwjXGHogoVk1sRjD17GVCJhUray056s8yPZ+dVyCnKuYnM88GD/WNq6ugNsCrHXNVpr3zg8CbISfE9k6k0s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 11:32:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 11:32:22 +0000
Subject: Re: [PATCH] async: the main AioContext is only "current" if under the
 BQL
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, qemu-block@nongnu.org, eesposit@redhat.com
References: <20210609105309.529896-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dd9c3572-65bd-17b6-f163-755cb37fffe1@virtuozzo.com>
Date: Wed, 9 Jun 2021 14:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210609105309.529896-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 11:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10c2f19-96ce-4951-e347-08d92b3a3f40
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53836A4719B7AD8C0DC2A044C1369@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FCEX4k00d0EdjI3pEEUlIrElhIOL6IFa0m1KPUlRumdfkiqhck3SxRqt5zNjuHZgjDcEX4BnQ6Oo+6B3JSvGIEJLMQCS6JUlqw5MSmlBSpC7cDf0FEv8SZrZrmbcu5q7uzl6B1SN4bNjE+vBXvf5tSWC6095IazeCR85hrNOj5G8mPSOOhQgdU+p5pK4xX5z/UHst+oosy67uTA/O6PpCz9OQNFfSNipDO4qTxbyK7GOzEsEKDT/CNQa+s6xPv/2AnkxpKFn27HmZzK9ZFZzdngndZhsRWnVsbopb47K8WhuzWTC62v+78NVO3hIa6r9Wxk2bZDVkDgUMqpvSAmXMJ3mXHuGeeKGKFSDi3Lkjcvfas+l4+92wl9fMQA3BsVfNB8XgFPLOVT3USdLyoX21nlY3C72SfTCUxm/kwZuNgUV94orvc+nuzweGFDzQAc4a9TbsLEeaQVp25uuwtuS+dAoblpbotzsyXaxSKDMhPt9AWU953aUGHY4cP708c06qch7V9xHkh4osTB3L0+/KALwtWtwROdh0/faa3Q6cheprJvMrSZxfytmPIrk7Ea8b5BzE1A3hBDDYI+hFKORTkaKBX+aMcfUjUc9p9KN5zmWmDjvhQY9GTEzzZ0kItl5GOr64elxODB3YJ6Bi0R4URvW52z5jBsxiedM2OvWN620furj7I+EnoMqgTklkUtirzCirl3zBY7GkaDnmaKHf3Hp6L02gBbDSMl1owtSOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39830400003)(376002)(136003)(366004)(5660300002)(26005)(186003)(8676002)(956004)(16526019)(16576012)(31696002)(31686004)(8936002)(52116002)(38100700002)(86362001)(4326008)(36756003)(38350700002)(6486002)(66476007)(83380400001)(478600001)(66556008)(316002)(2906002)(66946007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTNtSTNyK3ZCVk85NFVXN2I0T2pMclJaY2k4QnlCUWdrNXRDbTF5cThOeExF?=
 =?utf-8?B?NkJTRG8yT09PdGRDZDQ1TTN4dExnNlExdFhHUHdHTnhxR0ExaW1sVWh6U3lB?=
 =?utf-8?B?Zk5HeGUvcGhtQnBURWJJaFlUdVJtS2VJOElkZmErS0pSZ1FwU0FCMEllZUVM?=
 =?utf-8?B?TEU5ZGliMzVzSFNXcUhzdVNLeFlhVDVLMVRURVo0c294aFdidDEvbTlZLzdN?=
 =?utf-8?B?OEZPMG1ORHRSU3J6NVJBNE43VzhCSVFLRUhKZCtlZFVwS01jUXgvaWRqZS9D?=
 =?utf-8?B?NzF4cDczTUtlSkU1MHNPM2VvVXZ2N1lNS3I2YThXUmZwOERJeEpKY2pRUzZl?=
 =?utf-8?B?QVFERnZPa0lUdjRsSlFZbDVnL2xqaHBROWx1WS9PbVpvT1ZtZjkzWnd3QmVk?=
 =?utf-8?B?VnJkbEthNzVRL2RFdUlMWGIxcWM3MlppeTd1cXMwL0daK1c0RlFqTmtnV3Aw?=
 =?utf-8?B?amhtSHhhK2x4ZHJiaXpzK09PT3dkbGh4NGFoSU1ZL2lEaGt2V1RkdDlxaTFN?=
 =?utf-8?B?VHhoaGNGQW9TeWVhWGxjakQ3aHFkcEtaOHJkMW5xQW44OTVmZG9CU3hCUmJU?=
 =?utf-8?B?TkoycENGc3dWYVd1UncvMVY5Nk9yYTBVaXN0UzhHWmZlODJFNlVkRjZURThw?=
 =?utf-8?B?T1U2cm5pMy9NSFRRd0UvaHZueDY2VVBTNUU3WXNvalJxd3VYNUwxQ2NiVGdj?=
 =?utf-8?B?blJnVGZGYkpYN1JYbjBnZngwalI4dUxxbWtrNU9PU3hHWGE4NStDNW1xTldw?=
 =?utf-8?B?WERWTFk1TEtTR1ZJNTgzcWpQTEpBdDlLREZISXRsRHRmL0phbGh5Q21ZSTM1?=
 =?utf-8?B?d2xkbW1ET0QwOURjcUlEMHJSY2prdStXK284TTVUNUhPblVpTFlwYU02Tmg3?=
 =?utf-8?B?SFhoL0l5RU95dlVjSE5ZcEROdkEyS21kWkhidnRDQlJCbkdvN2lFZXlUNHc0?=
 =?utf-8?B?M0FZRHhVQXEybWZRdVpRaHcvclVwQW5wRnkyVUx6NURqMmpSd0RWZU12dmU5?=
 =?utf-8?B?eGNWWG9QWWtCMWYzMzJRdFJ6TjhQUzRHcHdDa25hNmM1Qm82VHcrU1ZoaDJu?=
 =?utf-8?B?cmlydm1ITVdZWGRTUW9NWHBrZTYxbXN1N0JORFdNYWdWdEJ1SjQwekVQeFMx?=
 =?utf-8?B?YksySnUvRTFqR3ltdGVFWWd4R3JxaUNhYWF5QWFPc1k2TG1ZZFZmSCt1aU9m?=
 =?utf-8?B?MzlBdGJ2VFl3VUtobXZ2aU1Eclc5VUlyRHVKbnlyc0ZzKzRKeEcrOWwrVnlL?=
 =?utf-8?B?K0dITzNmK2svZUR1bXYvTXdKc0dKaDNTc1pSdEFLN09SMmcvRjJLUVgzeTFl?=
 =?utf-8?B?YmI0dDYzV2kyclpxdXpoWW9hb2pwbnRrZC9mZVdVa3AzWnZFVWYyOWVpQ2g5?=
 =?utf-8?B?ZmsrZXF5a1VoUlM3cEtyeVpKb3pKdTd4TjNRa2lvd2RUcjlmRmRRY1ZOa1F2?=
 =?utf-8?B?NmUwNU8yQVR4N3djV3pnUnNHejgxTTZSTmh1YlFIWDcxSE85bTlTR0pPM0xI?=
 =?utf-8?B?dDUrSW91eUNEdkN5Q2hBdDJKSDMyQURDOG1uMlhHM0JqY3h2emdqR0g2UnlP?=
 =?utf-8?B?WXVaeEszeFZSaytDclJpUW1zdGx2YU1NMHI2N2IyM1NhU2s3UDRoTmdnZ1dI?=
 =?utf-8?B?U05SNElyWmFHYU5IZDVoYkxDeTN4NGZLVmRubndiV2Y5L0tNNTh6TndRajZi?=
 =?utf-8?B?L2ZtOTkwaS9QRnFuZlNjZzJ2WnBKQmVGdFhuLzJrazd6N25iNWV5aDQxMmZv?=
 =?utf-8?Q?NwZbO84RSuXfUBSweb2SawTISbbJHVWUj2E9aIh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10c2f19-96ce-4951-e347-08d92b3a3f40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 11:32:22.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBPqrrPEtPseQ8fNgy4DfLXShHRVrHB/kY4tqB7TAyf1Xjq2P371V3vRm8ePdK6mIjIdd9pf9PTX65nKYz/MiWrL+W/McqdjsXPIqL3y3ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.7.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

09.06.2021 13:53, Paolo Bonzini wrote:
> If we want to wake up a coroutine from a worker thread, aio_co_wake()
> currently does not work.  In that scenario, aio_co_wake() calls
> aio_co_enter(), but there is no current AioContext and therefore
> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
> then attempts to call aio_context_acquire() instead of going through
> aio_co_schedule().
> 
> The default case of qemu_get_current_aio_context() was added to cover
> synchronous I/O started from the vCPU thread, but the main and vCPU
> threads are quite different.  The main thread is an I/O thread itself,
> only running a more complicated event loop; the vCPU thread instead
> is essentially a worker thread that occasionally calls
> qemu_mutex_lock_iothread().  It is only in those critical sections
> that it acts as if it were the home thread of the main AioContext.
> 
> Therefore, this patch detaches qemu_get_current_aio_context() from
> iothreads, which is a useless complication.  The AioContext pointer
> is stored directly in the thread-local variable, including for the
> main loop.  Worker threads (including vCPU threads) optionally behave
> as temporary home threads if they have taken the big QEMU lock,
> but if that is not the case they will always schedule coroutines
> on remote threads via aio_co_schedule().
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/block/aio.h   |  5 ++++-
>   iothread.c            |  9 +--------
>   stubs/iothread.c      |  8 --------
>   stubs/meson.build     |  1 -
>   tests/unit/iothread.c |  9 +--------
>   util/async.c          | 20 ++++++++++++++++++++
>   util/main-loop.c      |  1 +
>   7 files changed, 27 insertions(+), 26 deletions(-)
>   delete mode 100644 stubs/iothread.c
> 
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5f342267d5..10fcae1515 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>    * Return the AioContext whose event loop runs in the current thread.
>    *
>    * If called from an IOThread this will be the IOThread's AioContext.  If
> - * called from another thread it will be the main loop AioContext.
> + * called from the main thread or with the "big QEMU lock" taken it
> + * will be the main loop AioContext.
>    */
>   AioContext *qemu_get_current_aio_context(void);
>   
> +void qemu_set_current_aio_context(AioContext *ctx);
> +
>   /**
>    * aio_context_setup:
>    * @ctx: the aio context
> diff --git a/iothread.c b/iothread.c
> index 7f086387be..2c5ccd7367 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -39,13 +39,6 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>   #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>   #endif
>   
> -static __thread IOThread *my_iothread;
> -
> -AioContext *qemu_get_current_aio_context(void)
> -{
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> -}
> -
>   static void *iothread_run(void *opaque)
>   {
>       IOThread *iothread = opaque;
> @@ -56,7 +49,7 @@ static void *iothread_run(void *opaque)
>        * in this new thread uses glib.
>        */
>       g_main_context_push_thread_default(iothread->worker_context);
> -    my_iothread = iothread;
> +    qemu_set_current_aio_context(iothread->ctx);
>       iothread->thread_id = qemu_get_thread_id();
>       qemu_sem_post(&iothread->init_done_sem);
>   
> diff --git a/stubs/iothread.c b/stubs/iothread.c
> deleted file mode 100644
> index 8cc9e28c55..0000000000
> --- a/stubs/iothread.c
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#include "qemu/osdep.h"
> -#include "block/aio.h"
> -#include "qemu/main-loop.h"
> -
> -AioContext *qemu_get_current_aio_context(void)
> -{
> -    return qemu_get_aio_context();
> -}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 65c22c0568..4993797f05 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -16,7 +16,6 @@ stub_ss.add(files('fw_cfg.c'))
>   stub_ss.add(files('gdbstub.c'))
>   stub_ss.add(files('get-vm-name.c'))
>   stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
> -stub_ss.add(files('iothread.c'))
>   stub_ss.add(files('iothread-lock.c'))
>   stub_ss.add(files('isa-bus.c'))
>   stub_ss.add(files('is-daemonized.c'))
> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
> index afde12b4ef..f9b0791084 100644
> --- a/tests/unit/iothread.c
> +++ b/tests/unit/iothread.c
> @@ -30,13 +30,6 @@ struct IOThread {
>       bool stopping;
>   };
>   
> -static __thread IOThread *my_iothread;
> -
> -AioContext *qemu_get_current_aio_context(void)
> -{
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> -}
> -
>   static void iothread_init_gcontext(IOThread *iothread)
>   {
>       GSource *source;
> @@ -54,9 +47,9 @@ static void *iothread_run(void *opaque)
>   
>       rcu_register_thread();
>   
> -    my_iothread = iothread;
>       qemu_mutex_lock(&iothread->init_done_lock);
>       iothread->ctx = aio_context_new(&error_abort);
> +    qemu_set_current_aio_context(iothread->ctx);
>   
>       /*
>        * We must connect the ctx to a GMainContext, because in older versions
> diff --git a/util/async.c b/util/async.c
> index 674dbefb7c..5d9b7cc1eb 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -649,3 +649,23 @@ void aio_context_release(AioContext *ctx)
>   {
>       qemu_rec_mutex_unlock(&ctx->lock);
>   }
> +
> +static __thread AioContext *my_aiocontext;
> +
> +AioContext *qemu_get_current_aio_context(void)
> +{
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    if (qemu_mutex_iothread_locked()) {
> +        /* Possibly in a vCPU thread.  */
> +        return qemu_get_aio_context();
> +    }
> +    return NULL;
> +}
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
> diff --git a/util/main-loop.c b/util/main-loop.c
> index d9c55df6f5..4ae5b23e99 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>       if (!qemu_aio_context) {
>           return -EMFILE;
>       }
> +    qemu_set_current_aio_context(qemu_aio_context);
>       qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>       gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>       src = aio_get_g_source(qemu_aio_context);
> 


Hmm. Your previous suggestion (with my addition) worked better for me.

With this (and my series on top of it) I have a dead-lock in iotest 058.

And in gdb all looks like aio_co_wake() in my own separate thread leads to coroutine execution exactly in my own thread.. So, it don't dead-lock on trying to acquire the context, instead it somehow enter to a coroutine.  And then deadlock because called coroutine tries to lock the mutex, that already locked before (in the code that thinks that aio_co_wake() will only schedule the coroutine).

I'll dig into it a bit more.


-- 
Best regards,
Vladimir

