Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D43B2F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:00:56 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOyU-00068X-R9
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwOx1-0005TT-8b
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:59:24 -0400
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:49376 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwOwx-0006HD-Lz
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:59:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buWfTEEhs7AgYOy3T9C0lprk2QJYLECyzzjI0TomCk+F20PZ9WMBZBadWda5LmAT3S5M2wnVzNRbAjWhBSJPK6LuwxNsIv7VcL8nx56ahHVqGX08YYEY11L8OiWtFPv8bcUfCUrX+3VyqyomZa6nf8XtKPUPYTk6nE2ZtJ/XK3gZc3uK7eCpfybZf0+C9oEztmlfh46sG/cxvQHvLOu1YwkymJLhKnOX1XzQKdyMwfEMhPDgBX5+423rgVFk65MPItHNattRpb7PxDh2KXULA+DWgT9ffg25JLa7LFRTiaWeO9iNe78Lx8Do+ce7auGP0+Dp1mfte3dHil8T7cJmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnD450EGuRSwEjHZkjft6NJtkKLQ4BTlQGMswDX2YVw=;
 b=O9RmooPXf6uwII4iR2dLfA/PMJ1GUhVwaA2iuM4EOKQS9rCayqtZbbsW4PU1DuFIw9PAB8fQyy7diZ4ZwTx+uHglPPb+XMSMNwvE8CYOW85AuX5DBBzLg1kSwK12PCZPypr01+OhGYmTZr8oTHtj4dJHQkgoXMEsu8Jdn7vOjEv27IHRxnOVO3axPyVJxF83QBHrMFWElQXkAz6yLxterQVfvW3/rUj6Fq1odPGR2kUwa58T+4qRVKeRRA01XJuYs3TLdLv9Pjh4a4f8jaf/ldA33mAkfTeVxYn1i9IzOEbYB/Emg0aXlrexNFwuNSas7oJT6tvogdib6i9XY153DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnD450EGuRSwEjHZkjft6NJtkKLQ4BTlQGMswDX2YVw=;
 b=i3xFeyVE3ZkZr6/UY8vJEaU7YAq6ho9kzu9rBq2c4QyjUAeVcXWdvMKI0JL0fdMd6UovtJYE0BwA0MqyHfQt6C3OlQH0HotOPO6ByRQ45umL9HRzLo3MnXIxk0t/soZ6QsHdgSP1hCY/fpHPkSZZZqh6jNQ1pM/Dh6LUuIUdHZI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2609.eurprd08.prod.outlook.com (2603:10a6:203:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 24 Jun
 2021 12:59:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 12:59:16 +0000
To: qemu-devel <qemu-devel@nongnu.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: iothread_instance_finalize -> aio_ctx_finalize crash
Message-ID: <3b564579-e468-b47d-f608-d683d4a4bf18@virtuozzo.com>
Date: Thu, 24 Jun 2021 15:59:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 12:59:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d41704-f0cd-4452-7e67-08d9370fdf4c
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2609:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26096F308BB762451CB9C688C1079@AM5PR0802MB2609.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QE6YEFvBsO70W0udVoOeaq2u5AaDo+8Q5HVMD8bQg81d23h/XsVq99nR36rcHfFezii94S7387OkdcLg44TfkVEAz34vnlMcexC2PI3OaMjolkUT8gw3BsNmmSP8vNT9wcvGeHJvIRQz2+DDH/mlnLn4Dek4xw2zg86EKzKZUnMZJ8q+CiRyHRbWdo9c8Grp+YWLWaDaKmvXywtr0vHy1sDMsVdWpTUS2/I4LZ+S7UuSWY6EomjdVZcfMsBs1r2/xl+HK/XcUBv104FCu426/EDNcqN0ogMkEig58TgVxBIEUHaIsajvPNsgQv/xG38YXtZgADD8Qy5/9Y/8SiOc5h3yzYfmQ2OJGQH5AomqI8W3K4feZpEruyGawMffMFmQAuz6vRKb6ah97qE840NHMssaAf0h2LHr2vIMRElsrqjsPdZLVQvfoczHNz+/Vm9QDMOKsIfdon+/TSSf6ggL2sZ2WQYBgw4wBgc6eKnw19OOIkmH8w0y8RPRmSIi7KpXrXO6+FKrnJ8qZO6l9nDqeAr3pmptZkXCYZeAno/bGCq5dhyW4G0BMT/5SzOGcnaSaNhRqU86QHqEr/fMir1JcUx1lhnex5HIbNupEHznKL4m8IKeU9cBci8n84h4FScGHDpgxVFxXbVgmeiqaplMXuoS/eG/Y+jzrY+0wtvB3k28TTheeKKbWFpqX0aJhnU5kL9UtcjW9D+go84ua61qjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39830400003)(5660300002)(66946007)(38350700002)(38100700002)(316002)(2616005)(52116002)(83380400001)(956004)(66556008)(66476007)(478600001)(31696002)(16526019)(26005)(186003)(36756003)(6486002)(8676002)(6916009)(86362001)(16576012)(8936002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTY2ZGQyWTNZNGJXSWh1c0VraTBURnlGNmorL2w1RGxvSndXcEFXT1FMNVNT?=
 =?utf-8?B?NWZDQXpHZGxGTTlDVkVvRnA5MG91dVlGM2FaTnRNb1pkMDg0SzBkellYby9n?=
 =?utf-8?B?N1FMVDZCdFdiTnJiSFREQllWQnN3Q2daVVh1R3lOZnVlTXM3T1lBaUFReWhq?=
 =?utf-8?B?WVVmYVlKYlErbXZ4ZUtKN1V6NW11SytrbEVGRG0zTHZJOHI3Uk0vZklzZVRP?=
 =?utf-8?B?V1ZMd0Y4Q2wvYUVkTk1JNWw1QkpOcTFtUUhMLzRGNThBam5YR3MrVFNHSnMx?=
 =?utf-8?B?bEx2cWNHTCtrbUlUVjZxU2JpT0FVWTNXYzJORnJJcFdURDhmVEIrUm1CdWNy?=
 =?utf-8?B?bmlYS1BwRzc1YU9GaUcxQmR2U3pldU1rbktNOW1XNUY0bmFwVXJZd3JqamRu?=
 =?utf-8?B?d0VidnVFUndYTjBhSlE3R0NGTmNoME82U0JnMFBNcW9jOEtheUczQ21PcWkr?=
 =?utf-8?B?bjZSQmZLY2Jjb1V4bHNqZmJVZHFZLzE4bVhIWDhJZnd5aFBEMG5YdFI5Y0Vr?=
 =?utf-8?B?dXowU2hvMXoyQ3E0SUNBQVovNkpSUUJsVTA4bVpSWnkwNERoMjBOeDJ4ejFW?=
 =?utf-8?B?djFPQVorU3pDQnVyaXYrQ09MN3JtdXBJSjNzSUFYbVJlTkI0MGRxcE9SWjh5?=
 =?utf-8?B?NUhnS0VoWitLaWhSZzdUWkdUbzVycWpuQTFNWk8rY0Q2b1YwL0VIbzJ4enZE?=
 =?utf-8?B?Yzh1eWhSb3o3dmh5cS9janBmSjJrNG1pcEJvOG9xUUZRREVncUVVMDZhdzdS?=
 =?utf-8?B?Nm9WQTlqNXFVTWk1NXpWTEZJNitqNXRMRGdubE50ZTJXbmV2eHRYanJoZTd1?=
 =?utf-8?B?YmYyeFhPMThLQklkWmh6czdLOHlnaHBuTFByVTA3SkwrbFVITVV1SzM2SVNQ?=
 =?utf-8?B?K2NDNldCVHhJeXpiN1BtQ3dFblVHc1kyRnlkU2RkQU9IQmdKSU9kaElRc3NP?=
 =?utf-8?B?bEZ3WE8zZmg0L3lPZXUwRUFNS2ozR3RuNTJtQ0l4ZkJrK2svQnFLRmdMa0dn?=
 =?utf-8?B?MXJzaUpKRkVGK1doREZjT1oreUVoWEgzcS9UczhZWkVINk51MjE5b0JwMHhD?=
 =?utf-8?B?a3Zma1hQK2liQVBqaVNNcW95SHpjVFBBbmpESUVBSUFFalRRcnd4SnpGNTRB?=
 =?utf-8?B?dllUcE0vNEpkWCtiRGFzSFl4UHNCMmE1MnZqZFFyZ1JVNStiQ3JoRk1aQ1FX?=
 =?utf-8?B?dE5ydzIwSi82dk44N3NjWkhUYWJQS05LdmRjV1lSeDJYRkxKVFZMTUVyWDky?=
 =?utf-8?B?MDFsam4wQnJ3MWVIWkYySnRpTG5XdEpSSmhHdjNNUkt6K1ZPVzZlV3hmSWVz?=
 =?utf-8?B?a0N4Q1pmSHdndDBqU1lRMUJnVjhxV0JwRmFHTWZ0N0pZRCttMEFkcGhiMElU?=
 =?utf-8?B?cHpyV0VsWFhsWWwrVkZRdVZQbktXQitBZDl3OG5LaitvZUxzVUVYUk5iUzMw?=
 =?utf-8?B?WlBjcy85RnIvWkwxKytKbDdHTlVtUDVkd2NGVmFoTUR2UHVSSzJwbHp0OERC?=
 =?utf-8?B?VE0rUUFtY0hDdnFFeEpiQVd3V0tiMjlsaHd2UlAwSXVKcTJRVmVNMEhVazBn?=
 =?utf-8?B?T05XcVFRM1ZxN3MxMkdRTVdKTkJ4bGM1b0FrUU51bEFTYlRBbGVCdnNtY3Vu?=
 =?utf-8?B?RGpEYjhTN3JqK2puc2hzS0JraG1zV3RzUE5uOE9oSDl6d3l4MG9HN0l1T0dW?=
 =?utf-8?B?eEFxc3hzaW9HOE9uTVV4aUR3MjlUbXh2dEJGUGFMaXdpNlBwUkh3a3FhcUlv?=
 =?utf-8?Q?xwHMPxgoQDMubFArigifYq+0CUzZj7OMl/MwnOi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d41704-f0cd-4452-7e67-08d9370fdf4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 12:59:16.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6ON8TTlk2Q3joy7Mx8SAprDQXXbFnc/44ArVHWkRufdaRBm5D+KiE4b6AMMXQtoDpSjR09pzX0ZZwJpIzpHak5NJwxBG0oD2cRe0fIaZUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2609
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi!

Could someone help me with the following please?

We have a crash in v5.2.0-based downstream branch. I don't have a realiable reproduce, neither can find significant differencies with upstream code in touched functions.

#0  0x00007fc2a8dbfe7f in raise () from /lib64/libc.so.6
#1  0x00007fc2a8daa8b5 in abort () from /lib64/libc.so.6
#2  0x00007fc2a8daa789 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
#3  0x00007fc2a8db8576 in __assert_fail () from /lib64/libc.so.6
#4  0x000055fc1d76e195 in aio_ctx_finalize (source=<optimized out>) at ../util/async.c:343
#5  aio_ctx_finalize (source=0x55fc1f9cebf0) at ../util/async.c:311
#6  0x00007fc2aa335789 in g_source_unref_internal () from /lib64/libglib-2.0.so.0
#7  0x00007fc2aa335a0e in g_source_iter_next () from /lib64/libglib-2.0.so.0
#8  0x00007fc2aa336b35 in g_main_context_unref () from /lib64/libglib-2.0.so.0
#9  0x00007fc2aa338d9c in g_main_loop_unref () from /lib64/libglib-2.0.so.0
#10 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
#11 0x000055fc1d644e19 in object_deinit (type=0x55fc1f7db490, obj=<optimized out>) at ../qom/object.c:671
#12 object_finalize (data=0x55fc1f88da00) at ../qom/object.c:685
#13 object_unref (objptr=0x55fc1f88da00) at ../qom/object.c:1183
#14 0x000055fc1d643365 in object_property_del_child (obj=0x55fc1f9a80e0, child=0x55fc1f88da00) at ../qom/object.c:645
#15 0x000055fc1d644618 in object_unparent (obj=<optimized out>) at ../qom/object.c:664
#16 0x000055fc1d6661d9 in iothread_destroy (iothread=<optimized out>) at ../iothread.c:369
#17 0x000055fc1d6ec5d9 in monitor_cleanup () at ../monitor/monitor.c:670
#18 0x000055fc1d63584b in qemu_cleanup () at ../softmmu/vl.c:4562
#19 0x000055fc1d374307 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51


(gdb) fr 10
#10 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
145             g_main_loop_unref(iothread->main_loop);
(gdb) list
140             iothread->ctx = NULL;
141         }
142         if (iothread->worker_context) {
143             g_main_context_unref(iothread->worker_context);
144             iothread->worker_context = NULL;
145             g_main_loop_unref(iothread->main_loop);
146             iothread->main_loop = NULL;
147         }
148         qemu_sem_destroy(&iothread->init_done_sem);
149     }
(gdb) p iothread
$24 = (IOThread *) 0x55fc1f88da00
(gdb) p mon_iothread
$25 = (IOThread *) 0x55fc1f88da00
(gdb) p *mon_iothread
$26 = {parent_obj = {class = 0x55fc1f92b4e0, free = 0x7fc2aa33e3a0 <g_free>, properties = 0x55fc1f9ad980, ref = 0, parent = 0x0}, thread = {thread = 140473870030592}, ctx = 0x0, run_gcontext = true,
   worker_context = 0x0, main_loop = 0x55fc1f9a8300, init_done_sem = {lock = {__data = {__lock = 0, __count = 0, __owner = 0, __nusers = 0, __kind = 0, __spins = 0, __elision = 0, __list = {__prev = 0x0,
           __next = 0x0}}, __size = '\000' <repeats 39 times>, __align = 0}, cond = {__data = {{__wseq = 3, __wseq32 = {__low = 3, __high = 0}}, {__g1_start = 1, __g1_start32 = {__low = 1, __high = 0}},
         __g_refs = {0, 0}, __g_size = {0, 0}, __g1_orig_size = 4, __wrefs = 0, __g_signals = {0, 0}},
       __size = "\003\000\000\000\000\000\000\000\001", '\000' <repeats 23 times>, "\004", '\000' <repeats 14 times>, __align = 3}, count = 0, initialized = true}, stopping = true, running = false,
   thread_id = 10141, poll_max_ns = 32768, poll_grow = 0, poll_shrink = 0}
(gdb) info thr
   Id   Target Id                         Frame
* 1    Thread 0x7fc2a4a19f00 (LWP 10134) 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
   2    Thread 0x7fc2a4a16700 (LWP 10136) 0x00007fc2a8e8002d in syscall () from /lib64/libc.so.6
   3    Thread 0x7fc29e9f8700 (LWP 10143) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
   4    Thread 0x7fc29e1f7700 (LWP 10144) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
   5    Thread 0x7fc2027ff700 (LWP 10147) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
   6    Thread 0x7fc29ffff700 (LWP 10137) 0x00007fc2a8f5e9aa in pthread_cond_timedwait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
   7    Thread 0x7fc20301a700 (LWP 10146) 0x00007fc2a8e7a541 in poll () from /lib64/libc.so.6


So, it's about mon_iothread, and it's already finished to the moment of the crash (this seems correct as earlier in iothread_instance_finalize() there is iothread_stop() which does qemu_thread_join())


Now, what crashed:

(gdb) fr 4
#4  0x000055fc1d76e195 in aio_ctx_finalize (source=<optimized out>) at ../util/async.c:343
343             assert(flags & BH_DELETED);
(gdb) list
338         /* There must be no aio_bh_poll() calls going on */
339         assert(QSIMPLEQ_EMPTY(&ctx->bh_slice_list));
340
341         while ((bh = aio_bh_dequeue(&ctx->bh_list, &flags))) {
342             /* qemu_bh_delete() must have been called on BHs in this AioContext */
343             assert(flags & BH_DELETED);
344
345             g_free(bh);
346         }
347
(gdb) p flags
$1 = 11
(gdb) # BH_ONESHOT | BH_SCHEDULED | BH_PENDING



So, there is unfinished BH in the context when thread is already finished..

Does iothread has own aio context or it may use qemu_aio_context?


Looking at iothread_run(), I can't understand, what prevent creating bh after iothread finish?

So, what prevents such situation:

1. iothread->running set to true, so we leave while loop in iothread_run
2. exactly after it (from some other thread) we schedule a bh into aio context of the finished iothread..


-- 
Best regards,
Vladimir

