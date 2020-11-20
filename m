Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596132BA692
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:52:56 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg367-00083K-EB
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg34l-0006wv-19; Fri, 20 Nov 2020 04:51:31 -0500
Received: from mail-eopbgr40113.outbound.protection.outlook.com
 ([40.107.4.113]:25349 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg34g-0006Qa-Cx; Fri, 20 Nov 2020 04:51:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOX8pbaWqdWg2hYEx/nWAdQWyy/iAp59VnM6fRnxUmF1CT5tEAe7UNgL8A96Q4n0AdNZKw+F+dKN1FyuWD6fsVe3cfX+nIMXHBJcyH3OQk7WtDpwbkEffwXcfaE7xSoB3hSy2A1nJJWYAd2D6QK60UpAV10N22ifhX+xyrxlVM2BeEIlFWjzFxUdrIyvL092yWLiflvShUKwUAEDu86O6Jx/aAKlNNV9xag7B3OMl2YwPwvDvLYXD/FdnpOJiq3yApmuPfk8CeMPHBoV/xe8giiDoR/Yi43vUmuV1U2+xW1MnBnvPOYW6SfjOdJYOQny2JMTapqgWaL3F6t4cwmM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRh8EPSMnFq7yJBZsTaOG4+BTnWn+K+NRSV7HHC1jdA=;
 b=WJpN+KeURMx2PLb9EoRUAKF/SW1VSGcbgGqU9ViUnTzMJCymE73r7s0+McnOF47vZDYFlwZTiwGSrvtx2B5qIYqgCiYape5qdUjli7sJjgYS5uQ0poWLDfWuJEiNftE6YD8lfUrO9A0fosunAu76DCOzuuO/gRvqe9NupwMJJBfSaglUXrxwBweeCDJoIH2CcGWI2znNyzu1VcAj3M9wBbvnw2Phh+WKC0wIl/uO/scl13zjtbjBN8+zFbx2TRj4hVHeKNJTt3mygs4+cmAikvScZ4XUa+k0bFf+PZs1UllIz7sIOXqMC9mTpczazD9F7gpVas6QKZ9dnBZa9yKEHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRh8EPSMnFq7yJBZsTaOG4+BTnWn+K+NRSV7HHC1jdA=;
 b=FuvZlFwH3HPhKPe8ghqevhyYaBTvu6cbnEjnB4dmUz+VwuNuaWqAgK+di4N/uktpMZ+uPtMcFZmfCgTrXy4oBbj42c8wah9iPZGoE8IjxFyGylCbVI9rRmQ9UpAhSihk4Q65YKIGg3dNsYZqvpJ2cPl5mlicKYkac5kU81VQ2x0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4721.eurprd08.prod.outlook.com (2603:10a6:20b:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 09:51:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 09:51:22 +0000
Subject: Re: iotest 030 still occasionally intermittently failing
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Peter Maydell <peter.maydell@linaro.org>, Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
 <w51tutpp5nr.fsf@maestria.local.igalia.com>
 <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
 <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
 <1f53f805-9367-d7c6-94ca-8d91e88f362f@virtuozzo.com>
 <33bb2781-2811-0bf7-cdbf-cb3544165276@virtuozzo.com>
 <32cd520b-0463-945c-9222-ec20baf8be8a@virtuozzo.com>
Message-ID: <3cfcbb68-2f62-d7f2-65e1-6ba7dd879ac5@virtuozzo.com>
Date: Fri, 20 Nov 2020 12:51:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <32cd520b-0463-945c-9222-ec20baf8be8a@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: AM9P192CA0001.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.108) by
 AM9P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 09:51:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 896f4b92-ddb7-4049-3473-08d88d39d614
X-MS-TrafficTypeDiagnostic: AM6PR08MB4721:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4721D2C017F92CFCC59A640BC1FF0@AM6PR08MB4721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUbzR01Lt61OEHivWXQJkrjibyY9wc53eHkC/cyPEFQ/NTuQVJFpejHAanQF3dy5QMP6s5RupsJSuBf953/jhgh/mdp9+yqlCDQ8zrRHnYojEBL9KXH+syoHJnT/9AWEvzsPyWf4SItQWH3pqOmWypNm8Na5c3mAiyvjLRHyF/foLPYBJpE8fu/I3nYIF5BYEWs1FVucEhwL+yuxMJ/QSU8cgJ+QBwbqOJSuh6mPJiKmIPBr2ezJVRXEjKAgOyLZtw7TYpCpGjGGo4IJPmCxQ7nhq7WFpo5GnFbLBIowt0skV06FUtVqJpoCmnruCHBe4pyaMJBCCZY2VDz3gE/MOXKJhb4LClhBPPD5/lYxqmoW9P3v2b0cT82oJEHV5C4A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39830400003)(31686004)(52116002)(16526019)(54906003)(110136005)(4326008)(16576012)(36756003)(186003)(6486002)(316002)(478600001)(5660300002)(86362001)(83380400001)(8936002)(2906002)(66946007)(8676002)(30864003)(66476007)(31696002)(66556008)(26005)(956004)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: JH6dTTrDIN8xk1t9l5URdKFOW4diw5Uqn7pREwW9HjS14apfMGSdaz/z20FosPl0f6P3ehSVaZnusS6XC0RZzNBvgitZsC9FtWMfcwbGAizhQ1IuI5RER5elWLJn0W/SzQh3dKUii/PGtKhCeyIhRU/RKg4wrztHC7f4+SkBJD+5rJUyR90YvajBY3ZnUP1MYW0VLShzVenGMXzag2nfI2IpzOTkbGSzXwPMGCqt3Kg856TL7QM12L1Ks9nfu0b21sb4ImOcStH7I5iT1jHx6nxPkEWFCdqDYGp7OKV4DhcHtYil6rRt7HkBijYL6n/86dF+YA54UUtbVFHwkOlPjlsMHDZnvqJSO9h9JRnakYBylTOgrfet0v2PUN4t/g2F3qmcKMj+U7ZLhrlfGjETHakVUacC6op6DGmh8haYgUJDgIYq9uqF2TFcWLI5s7HhOPAtXgU6Lh7MTUO/NG/nGaK/UMXg/THyZYs5QAnTauiIt0Difco70J80f1XOMLR8UBvThK+3I2tDZMB0kVchT69MMu6s8awG4J+2JT1q+1/25eWo9qlsOx6mQqwjsoy7Q1fzNP5IABRxwP1Xf/3QuoNnCdQtTPxSbxjAvgazdQh+fWxGp5FOpY0SUYQMeoVKB3DpVt6dPMmhfF0xCGruBg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896f4b92-ddb7-4049-3473-08d88d39d614
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 09:51:22.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vck9ReeyVmM5a61dWaEm2yBsVBlbEMt/NffQrCTuKS/p0De7JAlKnwuVqgONI3k5I24oICsUVsk2MEp2u5PIzQctgu3mRVWWZgquffwp8/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4721
Received-SPF: pass client-ip=40.107.4.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

19.11.2020 23:31, Vladimir Sementsov-Ogievskiy wrote:
> 19.11.2020 22:31, Vladimir Sementsov-Ogievskiy wrote:
>> 19.11.2020 22:30, Vladimir Sementsov-Ogievskiy wrote:
>>> 19.11.2020 19:11, Vladimir Sementsov-Ogievskiy wrote:
>>>> 16.11.2020 20:59, Peter Maydell wrote:
>>>>> On Mon, 16 Nov 2020 at 17:34, Alberto Garcia <berto@igalia.com> wrote:
>>>>>> Do you know if there is a core dump or stack trace available ?
>>>>>
>>>>> Nope, sorry. What you get is what the 'vm-build-netbsd' etc targets
>>>>> produce, so if you want more diagnostics on failures you have to
>>>>> arrange for the test harness to produce them...
>>>>>
>>>>> thanks
>>>>> -- PMM
>>>>>
>>>>
>>>> Hi!
>>>>
>>>> After some iterations I've reproduced on SIGABRT:
>>>>
>>>> #0  0x00007feb701bae35 in raise () at /lib64/libc.so.6
>>>> #1  0x00007feb701a5895 in abort () at /lib64/libc.so.6
>>>> #2  0x00007feb701a5769 in _nl_load_domain.cold () at /lib64/libc.so.6
>>>> #3  0x00007feb701b3566 in annobin_assert.c_end () at /lib64/libc.so.6
>>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
>>>> #5  0x000055a93374fd5a in bdrv_detach_child (child=0x55a9363a3a00) at ../block.c:2777
>>>> #6  0x000055a93374fd9c in bdrv_root_unref_child (child=0x55a9363a3a00) at ../block.c:2789
>>>> #7  0x000055a933722e8b in block_job_remove_all_bdrv (job=0x55a935f4f4b0) at ../blockjob.c:191
>>>> #8  0x000055a933722bb2 in block_job_free (job=0x55a935f4f4b0) at ../blockjob.c:88
>>>> #9  0x000055a9337755fa in job_unref (job=0x55a935f4f4b0) at ../job.c:380
>>>> #10 0x000055a9337767a6 in job_exit (opaque=0x55a935f4f4b0) at ../job.c:894
>>>> #11 0x000055a93386037e in aio_bh_call (bh=0x55a9352e16b0) at ../util/async.c:136
>>>> #12 0x000055a933860488 in aio_bh_poll (ctx=0x55a9351366f0) at ../util/async.c:164
>>>> #13 0x000055a93383151e in aio_dispatch (ctx=0x55a9351366f0) at ../util/aio-posix.c:381
>>>> #14 0x000055a9338608b9 in aio_ctx_dispatch (source=0x55a9351366f0, callback=0x0, user_data=0x0)
>>>>      at ../util/async.c:306
>>>> #15 0x00007feb71349ecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>>> #16 0x000055a933840300 in glib_pollfds_poll () at ../util/main-loop.c:221
>>>> #17 0x000055a93384037a in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
>>>> #18 0x000055a933840482 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
>>>> #19 0x000055a933603979 in qemu_main_loop () at ../softmmu/vl.c:1678
>>>> #20 0x000055a933190046 in main (argc=20, argv=0x7ffd48c31138, envp=0x7ffd48c311e0)
>>>>
>>>> (gdb) fr 4
>>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
>>>> 2648            assert(tighten_restrictions == false);
>>>> (gdb) list
>>>> 2643            int ret;
>>>> 2644
>>>> 2645            bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
>>>> 2646            ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
>>>> 2647                                  &tighten_restrictions, NULL);
>>>> 2648            assert(tighten_restrictions == false);
>>>> 2649            if (ret < 0) {
>>>> 2650                /* We only tried to loosen restrictions, so errors are not fatal */
>>>> 2651                bdrv_abort_perm_update(old_bs);
>>>> 2652            } else {
>>>> (gdb) p tighten_restrictions
>>>> $1 = true
>>>>
>>>>
>>>
>>> I've modified code a bit, to crash when we actually want to set tighten_restrictions to true, and get the following bt:
>>> #0  0x00007f6dbb49ee35 in raise () at /lib64/libc.so.6
>>> #1  0x00007f6dbb489895 in abort () at /lib64/libc.so.6
>>> #2  0x000055b9174104d7 in bdrv_check_perm
>>>      (bs=0x55b918f09720, q=0x0, cumulative_perms=1, cumulative_shared_perms=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2009
>>> #3  0x000055b917410ec0 in bdrv_check_update_perm
>>>      (bs=0x55b918f09720, q=0x0, new_used_perm=1, new_shared_perm=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2280
>>> #4  0x000055b917410f38 in bdrv_child_check_perm
>>>      (c=0x55b91921fcf0, q=0x0, perm=1, shared=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2294
>>> #5  0x000055b91741078c in bdrv_check_perm
>>>      (bs=0x55b918defd90, q=0x0, cumulative_perms=1, cumulative_shared_perms=21, ignore_children=0x0, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2076
>>> #6  0x000055b91741194e in bdrv_replace_child (child=0x55b919cf6200, new_bs=0x0) at ../block.c:2666
>>> #7  0x000055b917411f1d in bdrv_detach_child (child=0x55b919cf6200) at ../block.c:2798
>>> #8  0x000055b917411f5f in bdrv_root_unref_child (child=0x55b919cf6200) at ../block.c:2810
>>> #9  0x000055b9173e4d88 in block_job_remove_all_bdrv (job=0x55b918f06a60) at ../blockjob.c:191
>>> #10 0x000055b9173e4aaf in block_job_free (job=0x55b918f06a60) at ../blockjob.c:88
>>> #11 0x000055b917437aca in job_unref (job=0x55b918f06a60) at ../job.c:380
>>> #12 0x000055b917438c76 in job_exit (opaque=0x55b918f06a60) at ../job.c:894
>>> #13 0x000055b917522a57 in aio_bh_call (bh=0x55b919a2b3b0) at ../util/async.c:136
>>> #14 0x000055b917522b61 in aio_bh_poll (ctx=0x55b918a866f0) at ../util/async.c:164
>>> #15 0x000055b9174f3bf7 in aio_dispatch (ctx=0x55b918a866f0) at ../util/aio-posix.c:381
>>> #16 0x000055b917522f92 in aio_ctx_dispatch (source=0x55b918a866f0, callback=0x0, user_data=0x0)
>>>      at ../util/async.c:306
>>> #17 0x00007f6dbc62decd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>> #18 0x000055b9175029d9 in glib_pollfds_poll () at ../util/main-loop.c:221
>>> #19 0x000055b917502a53 in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
>>> #20 0x000055b917502b5b in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
>>> #21 0x000055b9172c5979 in qemu_main_loop () at ../softmmu/vl.c:1678
>>> #22 0x000055b916e52046 in main (argc=20, argv=0x7fff7f81f208, envp=0x7fff7f81f2b0)
>>>
>>>
>>> and the picture taken at the moment of abort (and it is the same as at the moment before bdrv_replace_child call) is attached. So, it looks like graph is already corrupted (you see that backing permissions are not propagated to node2-node0 child).
>>>
>>> How graph was corrupted it's still the question..
>>>
>>
>> additional info: it's all during test_stream_commit_1 in 30 iiotest
>>
> 
> OK, after some debugging and looking at block-graph dumps I tend to think that this a race between finish (.prepare) of mirror and block-stream. They do graph updates. Nothing prevents interleaving of graph-updating operations (note that bdrv_replace_child_noperm may do aio_poll). And nothing protects two processes of graph-update from intersection.
> 
> Any ideas?
> 

Wow, I get the following:

#0  0x00007fa84bcf97b6 in ppoll () at /lib64/libc.so.6
#1  0x000055b33e46321b in qemu_poll_ns (fds=0x55b340d28b60, nfds=1, timeout=600000000000) at ../util/qemu-timer.c:349
#2  0x000055b33e495c33 in fdmon_poll_wait (ctx=0x55b340d026f0, ready_list=0x7ffcc0af5f30, timeout=600000000000) at ../util/fdmon-poll.c:80
#3  0x000055b33e4575b0 in aio_poll (ctx=0x55b340d026f0, blocking=true) at ../util/aio-posix.c:607
#4  0x000055b33e302c41 in mirror_exit_common (job=0x55b341e94d20) at ../block/mirror.c:648
#5  0x000055b33e3031e3 in mirror_prepare (job=0x55b341e94d20) at ../block/mirror.c:776
#6  0x000055b33e39ba6b in job_prepare (job=0x55b341e94d20) at ../job.c:781
#7  0x000055b33e39a31f in job_txn_apply (job=0x55b341e94d20, fn=0x55b33e39ba2e <job_prepare>) at ../job.c:158
#8  0x000055b33e39baf4 in job_do_finalize (job=0x55b341e94d20) at ../job.c:798
#9  0x000055b33e39bcbb in job_completed_txn_success (job=0x55b341e94d20) at ../job.c:852
#10 0x000055b33e39bd5b in job_completed (job=0x55b341e94d20) at ../job.c:865
#11 0x000055b33e39bdae in job_exit (opaque=0x55b341e94d20) at ../job.c:885
#12 0x000055b33e485cfc in aio_bh_call (bh=0x7fa830004100) at ../util/async.c:136
#13 0x000055b33e485e06 in aio_bh_poll (ctx=0x55b340d026f0) at ../util/async.c:164
#14 0x000055b33e4577a3 in aio_poll (ctx=0x55b340d026f0, blocking=true) at ../util/aio-posix.c:659
#15 0x000055b33e2fa4d9 in bdrv_poll_co (s=0x7ffcc0af62e0) at /work/src/qemu/master/block/block-gen.h:44
#16 0x000055b33e2faff4 in bdrv_pwritev (child=0x55b340ed0f60, offset=0, bytes=65536, qiov=0x7ffcc0af6370, flags=0) at block/block-gen.c:408
#17 0x000055b33e34be9b in bdrv_pwrite (child=0x55b340ed0f60, offset=0, buf=0x55b341d10000, bytes=65536) at ../block/io.c:984
#18 0x000055b33e386c6f in qcow2_update_header (bs=0x55b341023020) at ../block/qcow2.c:3037
#19 0x000055b33e386e53 in qcow2_change_backing_file (bs=0x55b341023020, backing_file=0x55b341bf3c80 "/ramdisk/xx/img-0.img", backing_fmt=0x55b33e613afc "raw") at ../block/qcow2.c:3074
#20 0x000055b33e379908 in bdrv_change_backing_file (bs=0x55b341023020, backing_file=0x55b341bf3c80 "/ramdisk/xx/img-0.img", backing_fmt=0x55b33e613afc "raw", warn=false) at ../block.c:4768
#21 0x000055b33e3b2377 in stream_prepare (job=0x55b341030620) at ../block/stream.c:88
#22 0x000055b33e39ba6b in job_prepare (job=0x55b341030620) at ../job.c:781
#23 0x000055b33e39a31f in job_txn_apply (job=0x55b341030620, fn=0x55b33e39ba2e <job_prepare>) at ../job.c:158
#24 0x000055b33e39baf4 in job_do_finalize (job=0x55b341030620) at ../job.c:798
#25 0x000055b33e39bcbb in job_completed_txn_success (job=0x55b341030620) at ../job.c:852
#26 0x000055b33e39bd5b in job_completed (job=0x55b341030620) at ../job.c:865
#27 0x000055b33e39bdae in job_exit (opaque=0x55b341030620) at ../job.c:885
#28 0x000055b33e485cfc in aio_bh_call (bh=0x55b340ead840) at ../util/async.c:136
#29 0x000055b33e485e06 in aio_bh_poll (ctx=0x55b340d026f0) at ../util/async.c:164
#30 0x000055b33e456e9c in aio_dispatch (ctx=0x55b340d026f0) at ../util/aio-posix.c:381
#31 0x000055b33e486237 in aio_ctx_dispatch (source=0x55b340d026f0, callback=0x0, user_data=0x0) at ../util/async.c:306
#32 0x00007fa84cdceecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#33 0x000055b33e465c7e in glib_pollfds_poll () at ../util/main-loop.c:221
#34 0x000055b33e465cf8 in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
#35 0x000055b33e465e00 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
#36 0x000055b33e228979 in qemu_main_loop () at ../softmmu/vl.c:1678
#37 0x000055b33ddb5046 in main (argc=20, argv=0x7ffcc0af6a88, envp=0x7ffcc0af6b30) at ../softmmu/main.c:50


aio_poll at start of mirror_exit_common is my addition. But anyway the problem is here: we do call mirror_prepare inside of stream_prepare!

----

Ok, moving further, I moved stream_clean, stream_prepare, mirror_exit_common and mirror_complete into coroutine context and protect them all by new global coroutine mutex. This helps, now the bug doesn't reproduce.

Still, I'll try to finally understand, what's going on. But I think now that:

- graph modification code (permissions, drains, child-replacements, etc) are not safe to call in parallel, for example in different coroutines or through nested aio_poll.

- but they all do different kinds of drains, io operations, etc, which lead to nested aio polls and everything is broken


-- 
Best regards,
Vladimir

