Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547B2B9C47
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:51:59 +0100 (CET)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfquM-0006Xb-BI
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfqau-00010W-T6; Thu, 19 Nov 2020 15:31:53 -0500
Received: from mail-eopbgr50099.outbound.protection.outlook.com
 ([40.107.5.99]:28023 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfqar-00087v-3t; Thu, 19 Nov 2020 15:31:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTLioGCT4DJeJRZCku2p2T1IyrDM+p7eWyXVpDhQVZQJBpm2OLkKkdu9Ys/oqncdvH3xhp4dPzF6Y2pezIDimrZWl+F+g2Ud94cSFG5FStpRIeFOBPxBnVbS9DUziI6gft2r/rAZwhgKrLS78fjlgAO3E3IkXCb760+PrZMe7aLLsWH9ObppbctX7LAqA/zN2UIEDFbdwk4SX6OXCdQqlqFjIzDoKESGXYSfaa70YS92mJS0yK3WESgmFFV/1GZefn9k9kk6WMuu9QmVaxlLAiaMOOHo9lQ3Oiu9dC2zZCsAkHxa7DI3eH67lv3uZtHrmsQtsW2QvBGtFb8dVx30KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok0WdgbtpAXLS0VD4sfFGCCbv8z3UseusTl5LZ0hElI=;
 b=Tj+Qi7jANjriYKWt8HRjM97psPmt/V1Dx0oGFqdchKSQ4RAm0P68Qk9VWMlmJOtXygLvdYGqf8hezSUedPdiomyh9T4T2H2tisB0CR5TwGcrb4UKBN89iWB7Gslzep4RE0u8mCtiDsidxF3SsL+vka81tRjUhOj7zruvSSTsYvUWoZZsYdVZk67gW3cFVJPAnIpzLrJY+vx+DJak7/+AqyWLrc4qXYMNkmI7pk+I+my3K6ksn6OIuv4dGQYUjGEmXboW8z7YTP+NwXYnxR6hYDRT9ff3YueT6Fc+5xxTpXXkQ4KsGX3+6Rrq0Yf07g2eJQMq+gu847IxhBfkLgXWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok0WdgbtpAXLS0VD4sfFGCCbv8z3UseusTl5LZ0hElI=;
 b=GdV1w6UYhjD9iS3zprheH9vXS8lXrcjBtjfC5LNszv10gBLnVOBijomVjMv2Eg5wjs/M8g/WUQ0HMjeMwYXkdW6+F9JpmWak8sobpMLONxnUY3K6y781Upew6H9Z7Du4Djucww1N1Zj68tHTkM9bHLiX/tl8d8c2/f9/V+CRJkM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 20:31:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 20:31:45 +0000
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
Message-ID: <32cd520b-0463-945c-9222-ec20baf8be8a@virtuozzo.com>
Date: Thu, 19 Nov 2020 23:31:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <33bb2781-2811-0bf7-cdbf-cb3544165276@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:208:1::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.89) by
 AM0PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:208:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 20:31:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd501e9-27a8-4889-0754-08d88cca21be
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20334EA81F27391E4E18BCC4C1E00@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXLzTLNglocHf3s/2gDUt/xtVqsDANNLdQgEjXuzPZnYUh3Biw1q4YIrYpTHNfmhVHhRtPT2wpMErs4gr1KcJyv5nrPOIrZuC5uyLNS2kbAY+5t3LXEAuqYG+v9KwM1zAo5z0spEwvg4RsMTqgByZ1E2tfQKkrFJpZNUIHUluO3fKN9zD5ZU+XKz//6WXnNvVKHyx45pcQp7rbLRKPt7Sl3JpVS6PnD9laDOjT3OxobB5GZyRZ1jcxSSwt+nj1tPepKVyZ1kNJclNqy2UmjW8M+ONeLGbUfMJy7SPQ/p35DFZP2zLur19CvYzgDtLSrINQpUEkk14TprImfru4uNTaa+gmUoysPsZZ5nrIQHGeYjtp/RMatCGj5y/v1i7hXg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(346002)(376002)(136003)(16526019)(186003)(5660300002)(110136005)(66946007)(66476007)(16576012)(26005)(36756003)(86362001)(4326008)(31696002)(316002)(2616005)(31686004)(2906002)(6486002)(54906003)(52116002)(66556008)(478600001)(956004)(83380400001)(8676002)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 4B0Iai6VkhEwEb2sHULlwUx/4T47875AihPi4x1LZP4w+PqcmNK7xQEs3YRJqmTnP+EuxyitJ4e+9Ovx/Kj4+TNcu1udB65nObGYNADxF24dDOp+CvzVSS8DOe/pg12xHiHAGgd61uE7NVtl/g5BSo8VDea7osmZ0MmvC7gJZrBdhBvAl2o/+PpjjH6GqoI2SFUGlnez/ORDqE/5bo2if9Xtqpf5qYIsfKdm4Evb/KxCvkBqq6MXL76Ppit61EX89LXPOibKoLjYmuQ079nV+5BGvG6VwuxwD2RDWLFhNmeJcYX+xMLxNvrk2DleR/KHzy4B8/NH8wlql6N6XrV1ewJRo7Y+rnelrtriSLxXY33j7gwo6UQKILMiWcO15uTQKozTV74oBRKECRxcta+V6UZVvMBiS+h0zIJMBE3X+QFom4eBeFEf2EWw7VK+j2LFxnArevDOPgqgs12fQmZfSoVgcMGlpUKoRPHC5MjZqzVXZG9vkiVVJK89YSSIQweHDHipcPI7ScvbOBG/aUsqdOpuknyEGtesw3Bh/LmAeC3CnBGkukpPUX+497k/hY3CXqJyz9JKHmAHnD52a7xfNUwfRLNOkm6orEeEJogt0Z0GE6m0MbcqVUjsBJJB7qqE07Sm5T8YgIZLRenaUPcfaQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd501e9-27a8-4889-0754-08d88cca21be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 20:31:45.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZb2ucwUjG9/ThfRV9yPe6nUaraFUvgIhGE1/3tjhpNhB25M4+FX/8OH8GNMkXkfBunxMYCpm6IXXPOcebUn3t6Vae/sdGh2tcEoDCCcbIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.5.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

19.11.2020 22:31, Vladimir Sementsov-Ogievskiy wrote:
> 19.11.2020 22:30, Vladimir Sementsov-Ogievskiy wrote:
>> 19.11.2020 19:11, Vladimir Sementsov-Ogievskiy wrote:
>>> 16.11.2020 20:59, Peter Maydell wrote:
>>>> On Mon, 16 Nov 2020 at 17:34, Alberto Garcia <berto@igalia.com> wrote:
>>>>> Do you know if there is a core dump or stack trace available ?
>>>>
>>>> Nope, sorry. What you get is what the 'vm-build-netbsd' etc targets
>>>> produce, so if you want more diagnostics on failures you have to
>>>> arrange for the test harness to produce them...
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>
>>> Hi!
>>>
>>> After some iterations I've reproduced on SIGABRT:
>>>
>>> #0  0x00007feb701bae35 in raise () at /lib64/libc.so.6
>>> #1  0x00007feb701a5895 in abort () at /lib64/libc.so.6
>>> #2  0x00007feb701a5769 in _nl_load_domain.cold () at /lib64/libc.so.6
>>> #3  0x00007feb701b3566 in annobin_assert.c_end () at /lib64/libc.so.6
>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
>>> #5  0x000055a93374fd5a in bdrv_detach_child (child=0x55a9363a3a00) at ../block.c:2777
>>> #6  0x000055a93374fd9c in bdrv_root_unref_child (child=0x55a9363a3a00) at ../block.c:2789
>>> #7  0x000055a933722e8b in block_job_remove_all_bdrv (job=0x55a935f4f4b0) at ../blockjob.c:191
>>> #8  0x000055a933722bb2 in block_job_free (job=0x55a935f4f4b0) at ../blockjob.c:88
>>> #9  0x000055a9337755fa in job_unref (job=0x55a935f4f4b0) at ../job.c:380
>>> #10 0x000055a9337767a6 in job_exit (opaque=0x55a935f4f4b0) at ../job.c:894
>>> #11 0x000055a93386037e in aio_bh_call (bh=0x55a9352e16b0) at ../util/async.c:136
>>> #12 0x000055a933860488 in aio_bh_poll (ctx=0x55a9351366f0) at ../util/async.c:164
>>> #13 0x000055a93383151e in aio_dispatch (ctx=0x55a9351366f0) at ../util/aio-posix.c:381
>>> #14 0x000055a9338608b9 in aio_ctx_dispatch (source=0x55a9351366f0, callback=0x0, user_data=0x0)
>>>      at ../util/async.c:306
>>> #15 0x00007feb71349ecd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>> #16 0x000055a933840300 in glib_pollfds_poll () at ../util/main-loop.c:221
>>> #17 0x000055a93384037a in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
>>> #18 0x000055a933840482 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
>>> #19 0x000055a933603979 in qemu_main_loop () at ../softmmu/vl.c:1678
>>> #20 0x000055a933190046 in main (argc=20, argv=0x7ffd48c31138, envp=0x7ffd48c311e0)
>>>
>>> (gdb) fr 4
>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00, new_bs=0x0) at ../block.c:2648
>>> 2648            assert(tighten_restrictions == false);
>>> (gdb) list
>>> 2643            int ret;
>>> 2644
>>> 2645            bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
>>> 2646            ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
>>> 2647                                  &tighten_restrictions, NULL);
>>> 2648            assert(tighten_restrictions == false);
>>> 2649            if (ret < 0) {
>>> 2650                /* We only tried to loosen restrictions, so errors are not fatal */
>>> 2651                bdrv_abort_perm_update(old_bs);
>>> 2652            } else {
>>> (gdb) p tighten_restrictions
>>> $1 = true
>>>
>>>
>>
>> I've modified code a bit, to crash when we actually want to set tighten_restrictions to true, and get the following bt:
>> #0  0x00007f6dbb49ee35 in raise () at /lib64/libc.so.6
>> #1  0x00007f6dbb489895 in abort () at /lib64/libc.so.6
>> #2  0x000055b9174104d7 in bdrv_check_perm
>>      (bs=0x55b918f09720, q=0x0, cumulative_perms=1, cumulative_shared_perms=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2009
>> #3  0x000055b917410ec0 in bdrv_check_update_perm
>>      (bs=0x55b918f09720, q=0x0, new_used_perm=1, new_shared_perm=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2280
>> #4  0x000055b917410f38 in bdrv_child_check_perm
>>      (c=0x55b91921fcf0, q=0x0, perm=1, shared=21, ignore_children=0x55b918a57b20 = {...}, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2294
>> #5  0x000055b91741078c in bdrv_check_perm
>>      (bs=0x55b918defd90, q=0x0, cumulative_perms=1, cumulative_shared_perms=21, ignore_children=0x0, tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>, errp=0x0) at ../block.c:2076
>> #6  0x000055b91741194e in bdrv_replace_child (child=0x55b919cf6200, new_bs=0x0) at ../block.c:2666
>> #7  0x000055b917411f1d in bdrv_detach_child (child=0x55b919cf6200) at ../block.c:2798
>> #8  0x000055b917411f5f in bdrv_root_unref_child (child=0x55b919cf6200) at ../block.c:2810
>> #9  0x000055b9173e4d88 in block_job_remove_all_bdrv (job=0x55b918f06a60) at ../blockjob.c:191
>> #10 0x000055b9173e4aaf in block_job_free (job=0x55b918f06a60) at ../blockjob.c:88
>> #11 0x000055b917437aca in job_unref (job=0x55b918f06a60) at ../job.c:380
>> #12 0x000055b917438c76 in job_exit (opaque=0x55b918f06a60) at ../job.c:894
>> #13 0x000055b917522a57 in aio_bh_call (bh=0x55b919a2b3b0) at ../util/async.c:136
>> #14 0x000055b917522b61 in aio_bh_poll (ctx=0x55b918a866f0) at ../util/async.c:164
>> #15 0x000055b9174f3bf7 in aio_dispatch (ctx=0x55b918a866f0) at ../util/aio-posix.c:381
>> #16 0x000055b917522f92 in aio_ctx_dispatch (source=0x55b918a866f0, callback=0x0, user_data=0x0)
>>      at ../util/async.c:306
>> #17 0x00007f6dbc62decd in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>> #18 0x000055b9175029d9 in glib_pollfds_poll () at ../util/main-loop.c:221
>> #19 0x000055b917502a53 in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
>> #20 0x000055b917502b5b in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
>> #21 0x000055b9172c5979 in qemu_main_loop () at ../softmmu/vl.c:1678
>> #22 0x000055b916e52046 in main (argc=20, argv=0x7fff7f81f208, envp=0x7fff7f81f2b0)
>>
>>
>> and the picture taken at the moment of abort (and it is the same as at the moment before bdrv_replace_child call) is attached. So, it looks like graph is already corrupted (you see that backing permissions are not propagated to node2-node0 child).
>>
>> How graph was corrupted it's still the question..
>>
> 
> additional info: it's all during test_stream_commit_1 in 30 iiotest
> 

OK, after some debugging and looking at block-graph dumps I tend to think that this a race between finish (.prepare) of mirror and block-stream. They do graph updates. Nothing prevents interleaving of graph-updating operations (note that bdrv_replace_child_noperm may do aio_poll). And nothing protects two processes of graph-update from intersection.

Any ideas?

-- 
Best regards,
Vladimir

