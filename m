Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2A229C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 17:57:37 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyH7f-00086T-Vk
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jyH6b-00077r-Eq; Wed, 22 Jul 2020 11:56:29 -0400
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:52121 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jyH6X-0008R0-Qo; Wed, 22 Jul 2020 11:56:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns3Vh0XXRtXuEYTsPwLMzUhFYAgSCZsW57HMFMcN5kYCX4u9KOik3fIhcrQ2grp9yhbkyoeLxU/sBV+FVwxGbYS5A2gnoNrEAgntKispiOHaZFapJYNoTjXtZxgZGZxeTMSPSXOI/kW3uY+hvSRc8TJryfhPUYGtsvB7VYPqC2l9vLmfXFn9Xc9yJqaABxlkkXxgx18EryI1EIPewgS1AHTNH9ClDct2HYt1Mx8/WDMVUeSJNt7caPXNZpD4BSp+9sW90QhIRAG1USa+diyqNLq27+mlrZMehg9VussIBm63I1GTUUDdbP7BPPWvWKXJ4p3q+WNmvfpyZQq/jLjHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AbGB6CWIlMjZT8KjrR/YRrjvjLeL+NKI7UrzJh/RQg=;
 b=lKDzQxCmWZv4w/By2fMYGseTO+RjYfLpvBE6tfGHY5gqPkAsdt5o0h6oUMiojnfS0YxP90z9mC8KOld1GMeNd39YnZ0AEYXfd7pDZbTKYJZiube2n3Te+Nz/wbhDTuzaQU/e7rs1iFUttY85iT1eKJnsq/M0UA/HHSI7tyZ4Cwyflm0pSXfDj9IJzByDqGXeSHz467xL/J5lpTAVSw884w7r8gEhjhCGSHGlmLJRPM4hG4fTmM7lfD3rc4HpekKw6J7ojFrnL05aAKsy1VFloK+71CqbuSyTNTvhVDCh63shfqFIn24SfRAe0GUKm8L8xq9V5ynckdzvbdvGF95yAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AbGB6CWIlMjZT8KjrR/YRrjvjLeL+NKI7UrzJh/RQg=;
 b=Ebka0pFxS4hSHovLEbVP2YeP7FwFBKGnj62qDDRbZaE7iDYfwVhWofHz9K2vSaN6kCnvY24M8WE5+Jlru5bHl4UbRr9jWf7T4fskrSYeBlxc/rcwBM4z5Ts5lgWFTvmoDZlwY4q55ACIm/VDWeYqE/ZllJ5reN2ymBA978IqURI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4406.eurprd08.prod.outlook.com (2603:10a6:20b:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 15:56:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%3]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 15:56:22 +0000
Subject: Re: [PATCH 3/4] io/channel-socket: implement non-blocking connect
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200720180715.10521-4-vsementsov@virtuozzo.com>
 <20200720182923.GP643836@redhat.com>
 <840b762e-1ce1-af25-2ea0-b8cfdedba0d4@virtuozzo.com>
 <20200722112104.GC2324845@redhat.com>
 <cd5058fe-20d4-615e-8489-a30ac54d57de@virtuozzo.com>
 <20200722125303.GI2324845@redhat.com>
 <71bd9b95-6db6-bfaa-729e-df9d1493e5b7@virtuozzo.com>
 <46847ccc-22d0-59b9-6c43-16cb6af4b078@virtuozzo.com>
 <20200722152140.GO2324845@redhat.com>
 <ebc8409a-7387-8cb4-cc37-8b2df580863b@virtuozzo.com>
 <20200722154324.GP2324845@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <390d3990-db02-3932-64ad-acb44970fdb7@virtuozzo.com>
Date: Wed, 22 Jul 2020 18:56:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200722154324.GP2324845@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0501CA0056.eurprd05.prod.outlook.com
 (2603:10a6:200:68::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.154) by
 AM4PR0501CA0056.eurprd05.prod.outlook.com (2603:10a6:200:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Wed, 22 Jul 2020 15:56:21 +0000
X-Originating-IP: [185.215.60.154]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9c397dc-4d4a-4b6f-808c-08d82e57c7d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4406:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4406B4F2DF218607AEC66252C1790@AM6PR08MB4406.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxB/mtD5fQAYWlczs22xIbTD9FXiWJpHDEANZsizhLyO6TXNF9mg1mFjTUlLSttvIC0s6Ai6IB+VNU3zZOrjHuYPocfQ6UX1DfS7eh4fsKbcjNHeQS6HB+27t0a7jTGjhdtZA87rAC+0buwcyLACDY+qlXK9OauD6FcsCbl9ocEC+wcCZLi4UvHN7TWkZYj8vXVyUkK4uWlx7//kejQLsrglaybV517RYixjVwSZezsErcEPdjUfh27inpfkXCWjhPr6IurvWyWnyUuaMOlKJ782bAvxyNhTS+4s1n7NIQn8VB3FWNSORTO5ZdnB3t1Q/59EqHYDL4klci2qqTfk7omD4GikRc+78mhSakahk82rfrNfrqu13f7Nt3c72hlD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(39840400004)(396003)(346002)(376002)(83380400001)(66946007)(6486002)(31686004)(107886003)(8936002)(316002)(16576012)(5660300002)(36756003)(2906002)(6916009)(31696002)(4326008)(2616005)(478600001)(8676002)(186003)(956004)(66476007)(26005)(66556008)(16526019)(86362001)(52116002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 0gaI5QBKsWkgx2o0aC++DX/gdH1rR2i6efRX8PMtqyWIyTw/dx1coHlu3uWUoj4QeDBpw5ejyFIbBx9vRimVPPA06SWX7oNmIEweIbRd1cBx+otimu/JQQWX8zKcbQlssOX2tW+KlNRHrUlZARGDz2HxUHhsl4MYttiqUZ83OMJcDmatF62ZZ3MQ8uefHgRJ1FELHILBbrQieboAxW3nL5/HXv/+yT4btEaqbzeAMusAqpDpFIiG3H478CRcNu6g3JGWw7Di2JMMfWnBt+AKNX6lRHtz5ygatZF/1O4zhd1c5OVtIVm5cCVB9UiTvAA+xDIiUp+rwz5O7UoB+KCKLFiZT15emwnxQX+g5U4WCKQyjgQcyPo1jR+Agb4mNj8009+ikh19+PuvFtZ6RlZZ/o82/sNQlM2MOXJWQyVN/RpAA+U1cjbcCmC1Tt570zxmcQx4EdJG6cA0AkN7iNwjUPj/KV0IIZcx0k+RUAAzcOljs7+W2C/NWE/shTXxUbM6
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c397dc-4d4a-4b6f-808c-08d82e57c7d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 15:56:22.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn2shKz96RhcJpW4en047MHH7CTd0gKdIqMunr4PAge27DKdauBkr3ccVN82XjfneTP7lzbSYaplVMxRmh4WhOTe+wdaWZOvkD68NT1JeYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4406
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 11:56:23
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.07.2020 18:43, Daniel P. Berrangé wrote:
> On Wed, Jul 22, 2020 at 06:40:10PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 22.07.2020 18:21, Daniel P. Berrangé wrote:
>>> On Wed, Jul 22, 2020 at 06:04:53PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> 22.07.2020 16:47, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 22.07.2020 15:53, Daniel P. Berrangé wrote:
>>>>>> On Wed, Jul 22, 2020 at 03:43:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> 22.07.2020 14:21, Daniel P. Berrangé wrote:
>>>>>>>> On Wed, Jul 22, 2020 at 02:00:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>> 20.07.2020 21:29, Daniel P. Berrangé wrote:
>>>>>>>>>> On Mon, Jul 20, 2020 at 09:07:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>>>>> Utilize new socket API to make a non-blocking connect for inet sockets.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       include/io/channel-socket.h | 14 +++++++
>>>>>>>>>>>       io/channel-socket.c         | 74 +++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>       2 files changed, 88 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>>>>>>>>>>> index 777ff5954e..82e868bc02 100644
>>>>>>>>>>> --- a/include/io/channel-socket.h
>>>>>>>>>>> +++ b/include/io/channel-socket.h
>>>>>>>>>>> @@ -94,6 +94,20 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>>>>>>>>>>>                                           SocketAddress *addr,
>>>>>>>>>>>                                           Error **errp);
>>>>>>>>>>> +/**
>>>>>>>>>>> + * qio_channel_socket_connect_non_blocking_sync:
>>>>>>>>>>> + * @ioc: the socket channel object
>>>>>>>>>>> + * @addr: the address to connect to
>>>>>>>>>>> + * @errp: pointer to a NULL-initialized error object
>>>>>>>>>>> + *
>>>>>>>>>>> + * Attempt to connect to the address @addr using non-blocking mode of
>>>>>>>>>>> + * the socket. Function is synchronous, but being called from
>>>>>>>>>>> + * coroutine context will yield during connect operation.
>>>>>>>>>>> + */
>>>>>>>>>>> +int qio_channel_socket_connect_non_blocking_sync(QIOChannelSocket *ioc,
>>>>>>>>>>> +                                                 SocketAddress *addr,
>>>>>>>>>>> +                                                 Error **errp);
>>>>>>>>>>> +
>>>>>>>>>>>       /**
>>>>>>>>>>>        * qio_channel_socket_connect_async:
>>>>>>>>>>>        * @ioc: the socket channel object
>>>>>>>>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>>>>>>>>> index e1b4667087..076de7578a 100644
>>>>>>>>>>> --- a/io/channel-socket.c
>>>>>>>>>>> +++ b/io/channel-socket.c
>>>>>>>>>>> @@ -22,6 +22,7 @@
>>>>>>>>>>>       #include "qapi/error.h"
>>>>>>>>>>>       #include "qapi/qapi-visit-sockets.h"
>>>>>>>>>>>       #include "qemu/module.h"
>>>>>>>>>>> +#include "qemu/sockets.h"
>>>>>>>>>>>       #include "io/channel-socket.h"
>>>>>>>>>>>       #include "io/channel-watch.h"
>>>>>>>>>>>       #include "trace.h"
>>>>>>>>>>> @@ -29,6 +30,8 @@
>>>>>>>>>>>       #define SOCKET_MAX_FDS 16
>>>>>>>>>>> +static int qio_channel_socket_close(QIOChannel *ioc, Error **errp);
>>>>>>>>>>> +
>>>>>>>>>>>       SocketAddress *
>>>>>>>>>>>       qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>>>>>>>>>>>                                            Error **errp)
>>>>>>>>>>> @@ -157,6 +160,77 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>>>>>>>>>>>           return 0;
>>>>>>>>>>>       }
>>>>>>>>>>> +static int qio_channel_inet_connect_non_blocking_sync(QIOChannelSocket *ioc,
>>>>>>>>>>> +        InetSocketAddress *addr, Error **errp)
>>>>>>>>>>> +{
>>>>>>>>>>> +    Error *local_err = NULL;
>>>>>>>>>>> +    struct addrinfo *infos, *info;
>>>>>>>>>>> +    int sock = -1;
>>>>>>>>>>> +
>>>>>>>>>>> +    infos = inet_parse_connect_saddr(addr, errp);
>>>>>>>>>>> +    if (!infos) {
>>>>>>>>>>> +        return -1;
>>>>>>>>>>> +    }
>>>>>>>>>>
>>>>>>>>>> This call is blocking since it calls getaddrinfo whose design
>>>>>>>>>> offers no ability todo non-blocking DNS lookups. Given this
>>>>>>>>>> call, ...
>>>>>>>>>
>>>>>>>>> Oh, that's bad, thanks for taking a look on that early stage!
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +    for (info = infos; info != NULL; info = info->ai_next) {
>>>>>>>>>>> +        bool in_progress;
>>>>>>>>>>> +
>>>>>>>>>>> +        error_free(local_err);
>>>>>>>>>>> +        local_err = NULL;
>>>>>>>>>>> +
>>>>>>>>>>> +        sock = inet_connect_addr(addr, info, false, &in_progress, &local_err);
>>>>>>>>>>> +        if (sock < 0) {
>>>>>>>>>>> +            continue;
>>>>>>>>>>> +        }
>>>>>>>>>>> +
>>>>>>>>>>> +        if (qio_channel_socket_set_fd(ioc, sock, &local_err) < 0) {
>>>>>>>>>>> +            close(sock);
>>>>>>>>>>> +            continue;
>>>>>>>>>>> +        }
>>>>>>>>>>> +
>>>>>>>>>>> +        if (in_progress) {
>>>>>>>>>>> +            if (qemu_in_coroutine()) {
>>>>>>>>>>> +                qio_channel_yield(QIO_CHANNEL(ioc), G_IO_OUT);
>>>>>>>>>>> +            } else {
>>>>>>>>>>> +                qio_channel_wait(QIO_CHANNEL(ioc), G_IO_OUT);
>>>>>>>>>>> +            }
>>>>>>>>>>
>>>>>>>>>> ...this is offering false assurances of being non-blocking.
>>>>>>>>>>
>>>>>>>>>> If we don't want the current thread to be blocked then we
>>>>>>>>>> need to be using the existing qio_channel_socket_connect_async
>>>>>>>>>> method or similar. It uses a throw away background thread to
>>>>>>>>>> run the connection attempt, and then reports completion back
>>>>>>>>>> later, thus avoiding the getaddrinfo design flaw for the callers.
>>>>>>>>>>
>>>>>>>>>> I explicitly didn't want to add an method like the impl in this
>>>>>>>>>> patch, because getaddrinfo dooms it and we already had bugs in
>>>>>>>>>> the pre-QIOChannel code where QEMU thought it was non-blocking
>>>>>>>>>> but wasn't due to getaddrinfo lookups.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> IIUC, the main appeal of this method is that the non-blocking
>>>>>>>>>> nature is hidden from the caller who can continue to treat it
>>>>>>>>>> as a synchronous call and have the coroutine magic happen in
>>>>>>>>>> behind the scenes.
>>>>>>>>>>
>>>>>>>>>> IOW, What's needed is a simple way to run the operation in a
>>>>>>>>>> thread, and sleep for completion while having the coroutine
>>>>>>>>>> yield.
>>>>>>>>>>
>>>>>>>>>> I think this could likely be achieved with QIOTask with an
>>>>>>>>>> alternate impl of the qio_task_wait_thread() method that is
>>>>>>>>>> friendly to coroutines instead of being based on pthread
>>>>>>>>>> condition variable waits.
>>>>>>>>>
>>>>>>>>> The most simple thing is just run qio_channel_socket_connect_sync in
>>>>>>>>> a thread with help of thread_pool_submit_co() which is coroutine-friendly.
>>>>>>>>> And this don't need any changes in io/channel.
>>>>>>>>>
>>>>>>>>> Actually, I've started with such design, but decided that better use
>>>>>>>>> non-blocking connect to not deal with cancelling the connecting thread
>>>>>>>>> on shutdown.
>>>>>>>>>
>>>>>>>>> I think, I'll resend based on thread_pool_submit_co().
>>>>>>>>>
>>>>>>>>> ===
>>>>>>>>>
>>>>>>>>> Hmm, there is async getaddrinfo_a function.. What do you think of it?
>>>>>>>>
>>>>>>>> It isn't portable, glibc only.
>>>>>>>>
>>>>>>>>> But seems simpler to use a thread than move to async interfaces everywhere.
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> Hmm.. Still, on shutdown, how to cancel this connect and getaddrinfo ? I'm not sure
>>>>>>> how much time may getaddrinfo take, but connect can take about a minute. It's not really
>>>>>>> good to wait for it on shutdown.
>>>>>>
>>>>>> The intention was that if you don't want to carry on waiting for the
>>>>>> async operation to complete you just give and pretend it no longer
>>>>>> exists. Eventually it will fail or complete and the thread will exit.
>>>>>> The only important thing there is making sure that the callback you
>>>>>> are passing to the _async() method can cope with the cleanup when the
>>>>>> work eventually completes, even if you've given up.
>>>>>>
>>>>>
>>>>> At least it's not possible with thread_pool_submit_co as I wanted, because underlying
>>>>> thread pool waits for all its threads to complete on exit.
>>>>>
>>>>>
>>>>
>>>>
>>>> I'm trying to use qio_channel_socket_connect_async().. But callback
>>>> is not called.
>>>>
>>>> How to make it be executed? In tests/test-io-channel-socket.c it's
>>>> done by g_main_loop_new .. g_main_loop_run. But I need to yield.
>>>> socket_start_outgoing_migration uses qio_channel_socket_connect_async
>>>> as well, but is not doing any magic with g_main_loop. But it works. How?
>>>
>>> The _async() impls uses  qio_task_run_in_thread to spawn the background
>>> thread. When the thread finishes, it uses g_idle_add to invoke the
>>> callback so that it runs in the context of the main thread, not the
>>> background thread. So something needs to be running the main loop
>>> in QEMU.
>>
>> I came to same idea. But still, I don't see where g_main_loop is
>> run inside qemu_main_loop(). Only iothread_run() does it. But
>> what if we don't have iothreads?
> 
> There's no requirement to use g_main_loop, what matters is actually
> that something runs the default GMainContext. 

O, I see now, g_main_context_dispatch() in glib_pollfds_poll() does it, yes?

>qemu_main_loop
> satisfies this.
> 
> If you have a different GMainLoop that you want to use, then you
> can pass its GMainContext into the _async() functions, and the
> result will get dispatched from whatever thread runs that
> GMainContext/GMainLoop. So you could use this to get the callback
> to be invoked in your iothread context if that's desirable. If
> a NULL GMainContext is passed to _async(), then the callback is
> dispatched from qemu_main_loop() thread.
> 

Thanks for your help!

-- 
Best regards,
Vladimir

