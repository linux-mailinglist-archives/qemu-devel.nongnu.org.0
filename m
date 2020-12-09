Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581952D438C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:53:06 +0100 (CET)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmztw-0005qP-SX
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmzs0-00050m-CO; Wed, 09 Dec 2020 08:51:04 -0500
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:12209 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmzrw-0007fO-Lu; Wed, 09 Dec 2020 08:51:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAO3NKVA3UuTXG9OasQbZrLcSESIC98jLsyuuvf6FAeqCtZa6aYanlG6n854yTy6dgpAf49vbqhrgIjGwFS8MNrW5r1udi8NbhwEzTN3fYs7CBDe/ZcugEx/ByRGNe96BIEboJm0N4dIj9ECUdJQ8z24CE1/K4UA6Kn8P1SnFVgnZZSkcSh8jqg2y1jt0qlxOJl/Xk3BKCEQ1nFKeGUMIRGxXMqiLGukrMrILaQ8Z3I8kTUnCRhbgWEIWwIqYYqpCPRUeBElDeOPGSSSIB/8UlV6BxgXg0qY4su/4wRwttqtsEJB3CLIAqhw1ARR7MmGJ+ogR+NRzpxcokpvA1wEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mslYcMsTty4cIW/8RQ9BmMXeHK0FZf0jgFhC+OFC0Po=;
 b=SIGTpwKgu56k+qrptcC5VDgWbNb2S+FMRBTtbdA7XLdKpQP32nWPwlskddXzNetMiOYLgY9M4g46MmRR55DVvGPRqLKtdR2DG3MSc0EpZ2UQdbdZx4slYxBT9hVQNRmJ1jrJp0HScy0j6Ty6LMvMAliqZbV8g7Kc/iYqq/5a6Zmf1suvUjp+jMwA06nrT2Y21+nU21gWOABceuVMzno5JxBjGJEPcAV+5KBkjDyzDOeOQgA9rQkrfwupo8ta1JD76NXL+VQ8fUeGlYO2vxqnKVOjGyjrutQFpfelxTrAn9hgNZLIBLzKgfquprRGdCRH8TdUWKWfcHm6eLMuI8Pfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mslYcMsTty4cIW/8RQ9BmMXeHK0FZf0jgFhC+OFC0Po=;
 b=wqVwJmohduNWt07+GE74EzVlVcO7s6zOIr+/sXAMMqhcAC8E4hU8Ad4wqes/P0DA8GBPtpOrpcDRwIWp7EkbASLfgYA1Y3hJ914ucPFlXUy2fVISIQe7WnRFex2O1aYWPSe2o3INYCv75CP5vQsEpHU4N6ev43gavSgpOoaCeuo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 13:50:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 13:50:54 +0000
Subject: Re: [PATCH RFC] qemu co-mutex crash / question
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 den@openvz.org
References: <20201209123246.251265-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <84c851c1-790e-cb10-5c40-9cee1f1e7dcd@virtuozzo.com>
Date: Wed, 9 Dec 2020 16:50:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209123246.251265-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR02CA0169.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR02CA0169.eurprd02.prod.outlook.com (2603:10a6:20b:28e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 13:50:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf2a105-1fed-4f07-ed1e-08d89c497283
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447224A6C47E9CFE7044617EC1CC0@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIhUNZPwCAWmu3tHfvFWmocU7ka4Fmrixn8sxvC46zK+Wr14BH5rVMfe3X8kpWiEk46xd00tgnerQnLQJv2fkedqXylcwPplGrqTjpnTxdHAJGRowUhw4pRqF+FOgQDTOZt7TgZy36YyFYRKtWBnEXQKsZsXGC7zOZ4p3MLFYHrsGy9kb2VHxq3XbSGyqyA6ZJo+w1J+X08x9W1nCvvgc2+lVUj83gUfRpFHRVLFZ9KOwkr6C3u3/8lmonXswVINyroAUOam4p6rOiL3C/ujnaE1Aaie7pAUzh/88jDssqsvk2FyQ5KEApcOducHMTMW/myA16SebvtTX9igpRV/jXIHRjhsabPSMpUZYvw+h44R1hCQI5pR7kFZAIBUHkAbTQl/rdriIkDXmX+cVHYofqh2S8z0LwwL0ipTvxWmdezHeRIHuqXaGWY8ZYdsL6TB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(16576012)(66946007)(6916009)(66556008)(36756003)(86362001)(31686004)(34490700003)(107886003)(26005)(186003)(5660300002)(6486002)(8676002)(16526019)(83380400001)(956004)(52116002)(508600001)(66476007)(4326008)(31696002)(8936002)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFVmcXhVRnNtVXRxa1BVcUh0RjhoUDdvK2NwU3dyQ0pYamJ2TnhNdzV6dHg1?=
 =?utf-8?B?dUNjUnFlK3R4YkNVZDhxaVJLQ0FxSTVKb1IzRzhEMHVoS0MzNUpWMkNUanVU?=
 =?utf-8?B?ZnIrNVRDMHdHaHB6bTNXRFhoMWo0dEd1ek5VVkhCQlB4aUtCM1RKTDhMWjFE?=
 =?utf-8?B?VGJkUmU5dy9DTTladnhLRVRmSUUycW5aZXhMcmdnckZtRG4rNmxLdk8wTDh3?=
 =?utf-8?B?SEFZL2FXVnN5V0FUMzBXNVMyVjkvWXN3UllMc1lYRjR2OWJSa0QxNzRpR3dr?=
 =?utf-8?B?dlJuWnEyR3BZclhNaFBwU015ZDFRVUJ5UENicmtSMlZjSGU5L2dDU3RBNG5Y?=
 =?utf-8?B?QTZpZmNnZ2E4Y3FhWmJUS3dqOEg5bjlMYTF6Ujl5TzhVUDZVUkQvcU9OSEho?=
 =?utf-8?B?OXdDOVA3ZUhwZnpvSzE1bGZJNjZrYk8zV0c4RVFzK3J6Ym9ZNUpXR0JUUWdL?=
 =?utf-8?B?R0lxTEVUejdGa2FvWTFBMU9MWFB5Yk1KZjd0U25rNXFhNmhSeTBGcFZSaWxt?=
 =?utf-8?B?TTVyQ3Nac29tMnNUV0hUOWRib3JvekZ2UUlHSEZVKzlBY3NhYURjUTlMV014?=
 =?utf-8?B?K1dxeWhxc1RueWllVnpDVjMvYnFHNEI5R3FFRkErbDk2Q1IvWjN6NlpHb1Ir?=
 =?utf-8?B?VEtZY0JUQ2cxbnVPbTByOVlLa3hORUVZZ2M5VVdvZDV6SFk3Q3RJQ1RwMHlQ?=
 =?utf-8?B?cDEzZEFtVTJHOWo5Wnp6UjNRM2xpelNIWmtHeTJyVEZQMkk3bWt2ZnVNRGpX?=
 =?utf-8?B?VnFYZGROa1g4OUVDTHcwcHVGK2FVZzl0aU9hSUNpU2k0UjY1UmlPQy91eFM0?=
 =?utf-8?B?OWMrOUEvYzNTaExCZmpCV09TWlJHZ2luTXYyRnpsQVF4RU9nZUYrMXZtWVl1?=
 =?utf-8?B?T1hadWo4alNyZG51a0FQR0xkQWpHL2dzaURCRFpGNlRPYTJCMU1GMHFEK2FT?=
 =?utf-8?B?U1g4OWdTQXdVS3I5Y1JZRG5pUEdxK3BxbnJaVVlDZlpRNE5mUFhTN1R3NUl4?=
 =?utf-8?B?RXo0cysxemFQS3FmTHBpSUR1VlZYaW1uV3A5WnAwU3VZeWI1RCs2VTlleEhx?=
 =?utf-8?B?M21ZTlRJdm4zakNIeXBYRWRrRTZqYTFhejdwNEh4bnh1bVc3c0ErMjIwY3Bh?=
 =?utf-8?B?MmcrL0NjSkFLSFhzTlFZWVpCekZGam9rTmZSNFpaK3RUK3l3cytoekxLb3J0?=
 =?utf-8?B?dEkxcUIzNkxKK3ZpSWxndjRuU0pBTFhwSm8ySDFhbll6SlpjUXREQzVxeFVX?=
 =?utf-8?B?Qmo2bC8xbW5jdkdRaDBmZXd4V0VPNHE0WXFVeTJ4WElvLytYYVBsUVp2cUNO?=
 =?utf-8?Q?fi3OipaBkfcA88BbfzgxdBQ7FfJRUrNEHP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 13:50:54.0092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf2a105-1fed-4f07-ed1e-08d89c497283
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QGWntD1o21+xaSkg1eyuoFXkIEFrA+UqIgjJ0JNKoRZZbdvhCLuSKJPri7Nd6+ATc2T0AyjEuUyFIDSMu11ilXVJvE/sIzkMDROXzY6oJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

09.12.2020 15:32, Vladimir Sementsov-Ogievskiy wrote:
> test-aio-multithread: ../util/qemu-coroutine-lock.c:197: qemu_co_mutex_wake: Assertion `mutex == co->wait_on_mutex' failed.
> 
>      Thread 18 "test-aio-multit" received signal SIGABRT, Aborted.
>      [Switching to Thread 0x7fffe5ffb700 (LWP 24549)]
>      0x00007ffff7063625 in raise () from /lib64/libc.so.6
>      (gdb) bt
>      #0  0x00007ffff7063625 in raise () from /lib64/libc.so.6
>      #1  0x00007ffff704c8d9 in abort () from /lib64/libc.so.6
>      #2  0x00007ffff704c7a9 in __assert_fail_base.cold () from /lib64/libc.so.6
>      #3  0x00007ffff705ba66 in __assert_fail () from /lib64/libc.so.6
>      #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
>      #5  0x000055555568c5a0 in qemu_co_mutex_unlock (mutex=0x555555771360 <comutex>) at ../util/qemu-coroutine-lock.c:307
>      #6  0x000055555557acfd in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:208
>      #7  0x00005555556bb5d7 in coroutine_trampoline (i0=1434467712, i1=21845) at ../util/coroutine-ucontext.c:173
>      #8  0x00007ffff7078d30 in ?? () from /lib64/libc.so.6
>      #9  0x00007fffffffd850 in ?? ()
>      #10 0x0000000000000000 in ?? ()
>      (gdb) fr 4
>      #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
>      197         assert(mutex == co->wait_on_mutex);
>      (gdb) p mutex
>      $1 = (CoMutex *) 0x555555771360 <comutex>
>      (gdb) p co->wait_on_mutex
>      $2 = (CoMutex *) 0x555555771360 <comutex>
>      (gdb) p mutex == co->wait_on_mutex
>      $3 = 1
> 
> So, it failed, but in gdb the condition is true.. How can that be?

Interesting: I tried to run test on one cpu:

for i in {1..100}; do taskset -c 0 ./build/tests/test-aio-multithread -p /aio/multi/mutex/handoff; done

with taskset it takes a lot more tries to reproduce, but finally I have correct coredump with correct assertion failure:

(gdb) bt
#0  0x00007ff7fa22d625 in raise () from /lib64/libc.so.6
#1  0x00007ff7fa2168d9 in abort () from /lib64/libc.so.6
#2  0x00007ff7fa2167a9 in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007ff7fa225a66 in __assert_fail () from /lib64/libc.so.6
#4  0x0000564c7ca99153 in qemu_co_mutex_wake (mutex=0x564c7cb7e360 <comutex>, co=0x564c7d3f5c40) at ../util/qemu-coroutine-lock.c:197
#5  0x0000564c7ca995a0 in qemu_co_mutex_unlock (mutex=0x564c7cb7e360 <comutex>) at ../util/qemu-coroutine-lock.c:307
#6  0x0000564c7c987cfd in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:208
#7  0x0000564c7cac85d7 in coroutine_trampoline (i0=2101304064, i1=22092) at ../util/coroutine-ucontext.c:173
#8  0x00007ff7fa242d30 in ?? () from /lib64/libc.so.6
#9  0x00007ffd3b3c6ac0 in ?? ()
#10 0x0000000000000000 in ?? ()
Backtrace stopped: Cannot access memory at address 0x7ff7ed19c000
(gdb) fr 4
#4  0x0000564c7ca99153 in qemu_co_mutex_wake (mutex=0x564c7cb7e360 <comutex>, co=0x564c7d3f5c40) at ../util/qemu-coroutine-lock.c:197
197         assert(mutex == co->wait_on_mutex);
(gdb) p mutex
$1 = (CoMutex *) 0x564c7cb7e360 <comutex>
(gdb) p co->wait_on_mutex
$2 = (CoMutex *) 0x0


other interesting threads:

Thread 7 (Thread 0x7ff7ef19f700 (LWP 261134)):
#0  0x0000564c7ca98f99 in push_waiter (mutex=0x564c7cb7e360 <comutex>, w=0x7ff7ed09aea0) at ../util/qemu-coroutine-lock.c:151
#1  0x0000564c7ca991c4 in qemu_co_mutex_lock_slowpath (ctx=0x7ff7e4000b60, mutex=0x564c7cb7e360 <comutex>) at ../util/qemu-coroutine-lock.c:211
#2  0x0000564c7ca993f5 in qemu_co_mutex_lock (mutex=0x564c7cb7e360 <comutex>) at ../util/qemu-coroutine-lock.c:277
#3  0x0000564c7c987ce2 in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:206
#4  0x0000564c7cac85d7 in coroutine_trampoline (i0=2101304384, i1=22092) at ../util/coroutine-ucontext.c:173
#5  0x00007ff7fa242d30 in ?? () from /lib64/libc.so.6
#6  0x00007ffd3b3c6ac0 in ?? ()
#7  0x0000000000000000 in ?? ()

#0  0x00007ff7fa3cdf55 in nanosleep () from /lib64/libpthread.so.0
#1  0x00007ff7fb0d27b7 in g_usleep () from /lib64/libglib-2.0.so.0
#2  0x0000564c7c987e05 in test_multi_co_mutex (threads=2, seconds=3) at ../tests/test-aio-multithread.c:237
#3  0x0000564c7c987eff in test_multi_co_mutex_2_3 () at ../tests/test-aio-multithread.c:270
#4  0x00007ff7fb0cface in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#5  0x00007ff7fb0cf874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#6  0x00007ff7fb0cf874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#7  0x00007ff7fb0cf874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#8  0x00007ff7fb0cff7b in g_test_run_suite () from /lib64/libglib-2.0.so.0
#9  0x00007ff7fb0cffd5 in g_test_run () from /lib64/libglib-2.0.so.0
#10 0x0000564c7c98874e in main (argc=1, argv=0x7ffd3b3c7868) at ../tests/test-aio-multithread.c:459



-- 
Best regards,
Vladimir

