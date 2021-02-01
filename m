Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103030A555
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:30:23 +0100 (CET)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WTO-00051P-Dz
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6WR0-0003A8-9O; Mon, 01 Feb 2021 05:27:54 -0500
Received: from mail-eopbgr80104.outbound.protection.outlook.com
 ([40.107.8.104]:16547 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6WQw-0005Co-0D; Mon, 01 Feb 2021 05:27:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX44kKAEBigUnKGKjliW+a4X/OE+daKavsi40SeCnA0RjZltuE6sVDynGNx1OlzWMiix5gCxLPB+kdRBpCbLp1CuRkh1bdDBcHX1BRuMmDYTPtQfUIty1o29EW5yJ+XBXYq9V/Sd/eq/dT2dPuOJOCp0ky3EktIJQMzDuFUvySwcthASWJ7pB3L340j9XZB2jeaiZiRFuWdpwLD9cX0F5QJyBRvlBeyU8riSoiDI1c+KAnttD0SuoK57CkCORJJ4LTYI1xsQJxiZXptrtLPyLIW4tTkg0mImbRqPjDSMNXQChS3hSMGx8hoJ/uGWpXy602W+b8uUrmlw04vhoys7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wA+65OSkNnU3ZeceSCQHPCwvUB6DfvqiH9TzFSxk+Q=;
 b=ix59KLYnyBmnaWDcUek6n7QGjdTMicGG3OKHfVc+PyBS0Jy/dsBn3ydJnXQdGAWWbLUdk3YNC90Q6I2HYK509Wu/4v5ChRizzjY1xMvAd7frcHK3jy+ZPeRBGniOshBiymIcXBRWsyNslPo2U4d9Y+kvjrSHGIlp6OnQSbp9g4Hk1bk1PcfPUI5GS1T3MjpTzTmV4u1Nrmhib75M3fJCNjSA9iavi0WTVXeVoyn3wOP/jxwH4hEmDG+hej2Ff/tt3j7Y47qzqOgg+ZfEo/5ZdfcvjpL8H33kd9DZ0Q+LKtOdHuA2U4OhOr+i1k9DEA2JeQfUpWRHdP5YFi1Tl5010g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wA+65OSkNnU3ZeceSCQHPCwvUB6DfvqiH9TzFSxk+Q=;
 b=gBCzFhSLWOK/9uRNyCBHFafqwc670kXELLLhrR0kAYNTeWXizMZOkhTEcLzsgQ6pEKSha248SXzJsfwHICAJV2OTqr5oGju6YL7w3Bk7bK4qVNmWVqSdheUyU6pJF4GekJD6YGRQ0accktxF9y6Rjri8o7zCmlndTSumhXK84gE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 1 Feb
 2021 10:27:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 10:27:46 +0000
Subject: Re: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
To: 08005325@163.com, kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ce0a7f2b-ccf1-f898-4bf5-5b256e9c2f3b@virtuozzo.com>
Date: Mon, 1 Feb 2021 13:27:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210128013053.23266-1-08005325@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM4PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:205:1::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM4PR07CA0005.eurprd07.prod.outlook.com (2603:10a6:205:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Mon, 1 Feb 2021 10:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44fc49f5-90ae-4c0f-98ba-08d8c69c043c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6423:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6423E20BE9315A31B18393EFC1B69@AS8PR08MB6423.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZXpxDT6gkAR/QiGMaw/375aoByKN5nbgq4XoH2ruxgPnsXjCPpRxQHC6uX4IwVYyn1WIpyCWkIx/0WTzU2yJtmzFtoiX3reqfEE9kz/t182+WYmp3AAUZKPzzumR8hjUsvfYE63jE4fM1Z2ZM6rBqD6uzOlLs+LbxOSnYNfrUUc65ZXo7dQj3LUrhw4F1MnxToYOE+dmIYtM3a6/h0t4OI0dsJWD0O38HOMmTkrUYyImyYN5djULaDGHxY1KoZyW+Qs3ORGcrCId1P6Dt1ksYctktyhuqJzP4qrOHX+FyVgN/llZ7KW2azyMw3ym9iNDQY6vHskvMJVU6lmPJ6eRkYjqXJN9qyRO/8NenYPFn2ANxBMnXRrm24VVeItKUHNSPynRo5UPtFB7bThwtmWlHxFCDnDo+Q/c7jqPAjVlufkGjGU/qFn4LIhS9XgRCMwvfEV/+LsdIWoaEbK/kCsIarCy/byWhEqQ+Pj6T/pIolSXwsiH7Acs8ohMMPnU38fdE/ojaDSmNSRl36yRQlKxHrT5874Z1w0c5YRaLUhcyBGTpVaJhMUThPSFvaHwokJribQCSKRA0iVo+t2lz0KhYAUQye5677ZT31lQyPlZ0H2fP5sw41fDTCWOkXgbgWfirVyScB61jhhvJALxP4Oy9cyhvpkMIZu0HYhDge7v5i+LH7bU376V3rQfy8OFKxc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(2906002)(966005)(86362001)(31696002)(83380400001)(8676002)(6486002)(16576012)(8936002)(31686004)(4326008)(956004)(2616005)(16526019)(26005)(186003)(5660300002)(66946007)(52116002)(66556008)(36756003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SytKamJoN3BwRDhhR2xMME9vZzNXZ3JHdWFpZmh1QnBFaW1PQVlJTkRETUor?=
 =?utf-8?B?STJjUHdnKy96aWZhLzhLa1g4SVBzN1YrSlp0LzdZbGdZY2hyL2tUUUFGbVZx?=
 =?utf-8?B?eW12WEpEdHJiUFdGOWlTN0kxcm94TVBSZHozSldCNmZaa3FKaXg5ZUFlQjNH?=
 =?utf-8?B?VG9iV2U3b1dCbE9RQ3BZNy9qUHR2RUtvWGpFQnRQYTl2RmFxOVZYVDRjOW1T?=
 =?utf-8?B?RzlRUHlSVE5hbU4rRjB3VTN5L2I0WUpHM01MS0JlNzJJMWxNb3ltTW9qQUlo?=
 =?utf-8?B?S2NBWit6VEQ1QlZJa1Rpa2NEZ1hVV25YR0xtVmw4MFZzYmUwdlFGOTVyM01q?=
 =?utf-8?B?bTdZN0QzR0luZmlMM2xSSDV3K1JyUjN2bk1BdUVaK3RYc1FSUThIclhXSWhC?=
 =?utf-8?B?MzR2d0RjdGdsbmY5NHR5aHZnOVNQamFhQWd0ZVk1UWFPREh5b2ZFcU0ydmNK?=
 =?utf-8?B?VCsyc3pzbnVINCtBaGpGTGtkbW5UUGljeEdLK2RTMEF2azhsM1lTNnN6dVVa?=
 =?utf-8?B?eUQxS2tOZlMwcVpPUE1QQXVaSS9RK1BXaFlDb2xJemZLVS92N0RtU09ZOThv?=
 =?utf-8?B?dUxZZWk2N1U4eHRiLy8vTmFQNURVMmhqTGhYYXo2a3UrRXNqaTZDcHE4SWVo?=
 =?utf-8?B?OEdtNnhQTWVTZzJoclhNU1E5UFJSR2JGbUhwcVNyNWVkLzB0UnBELzlxdFM2?=
 =?utf-8?B?QzkzdzBpTE44eVRPQ2RvSXRwejd0ZGl5RWlmWm5DUzNGRllZMHRjUVFPbWNJ?=
 =?utf-8?B?NDlTUVpNQzNuMEhqcUFNa0JEcXU1ZEFzTzY0dmkvRHpldW9JSUpwMWlmK3pP?=
 =?utf-8?B?YlNkTmI4WnFXQUhSd0E1L3hvSmpKcFdHZ3ZVbDZFemtxb1NWQUQwc1RUbmUr?=
 =?utf-8?B?ekI1bk9iTDB2NUZVQzNTLy9UcGFJdVpjUkpjL2xsc1ViTmJmOUxBUFk3Y01W?=
 =?utf-8?B?bUJKVnhiZ0ZmV2ZNMTYyTFhMOHI5SGJiWDJrSEt5TWlvVHIwUkp5SE9zblFM?=
 =?utf-8?B?K1IrZ3VjZ2NLQVUwejB4VDVNRXFwVS9QWkt0VGVmTW1GMmpDYnE4RFdYZTEw?=
 =?utf-8?B?bG5lbmlwRmlVOHVYT2RQK1lsUHgyZzdPb0Ryc3A4dnlvNkdqSDhjMDlhWTF3?=
 =?utf-8?B?UHE4QXFYYWE2MitDdUttcjNMSi9JVnNWZFZrU3ZIeEJrOGZuTFUxV01PL3Bh?=
 =?utf-8?B?VXVId1JqTUJHRGR3SVlZaWZvTm9vaTZsWS9kVEpUU2FiNDYrMENLSzVvdVg3?=
 =?utf-8?B?NTdaVHVRVTJITDhiSS91R2hJdDBNMGhPSTVuajZYanoxWkhyc0poN0ZoVE93?=
 =?utf-8?B?TDIzL0g0WTlJRC9Mc0F4akNPVmJYTEFiUEJyTWNycGtQUkhMNmtMNUNkUHZX?=
 =?utf-8?B?Mmo2cjVFaHlNWlFWSVFRcjVzZFNDdjhnbm1JTFVEcE9KYnBpT1o1b2tXeUZV?=
 =?utf-8?Q?y/6lf4L0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fc49f5-90ae-4c0f-98ba-08d8c69c043c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:27:46.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bdp8/yFnNVnNCvrMW4PS4fQSVL/8EJRsSxwkdAB1e7uCbdTW69q4Yo7qho/3j0VMN1X0dk4qYHtOghw60crU9sSlEMqQieTnMZNs0tB1b5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
Received-SPF: pass client-ip=40.107.8.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Michael Qiu <qiudayu@huayun.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Tanks for fixing and sorry for a delay!

Please send each new version of a patch as a separate branch. It's a rule from https://wiki.qemu.org/Contribute/SubmitAPatch and it is more readable and less probable that your patch will be missed.

28.01.2021 04:30, 08005325@163.com wrote:
> From: Michael Qiu <qiudayu@huayun.com>
> 
> v4: rebase to latest code
> 
> v3: reformat the commit log, remove duplicate content
> 
> v2: modify the coredump backtrace within commit log with the newest
>      qemu with master branch

Such things shouldn't be in a commit message. You may put such comments after --- line[*] in a generated patch email

> 
> Currently, if guest has workloads, IO thread will acquire aio_context
> lock before do io_submit, it leads to segmentfault when do block commit
> after snapshot. Just like below:

Do you have some reproducer script?

> 
> Program received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
> 0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> 1437    ../block/mirror.c: No such file or directory.
> (gdb) p s->job
> $17 = (MirrorBlockJob *) 0x0
> (gdb) p s->stop
> $18 = false
> 
> (gdb) bt
> 
> Switch to qemu main thread:
> /lib/../lib64/libpthread.so.0
> /lib/../lib64/libpthread.so.0
> ../util/qemu-thread-posix.c:79
> qapi/qapi-commands-block-core.c:346
> ../qapi/qmp-dispatch.c:110
> /lib/../lib64/libglib-2.0.so.0

Not very informative bt..

> 
> In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
> is false, this means the MirrorBDSOpaque "s" object has not been initialized yet,
> and this object is initialized by block_job_create(), but the initialize
> process is stuck in acquiring the lock.

Could you show another thread bt?

Hm, so you argue that we come to bdrv_mirror_top_pwritev() (which means that
mirror-top node is already inserted into block graph), but its bs->opaque is
not initialized?

Hmm, really in mirror_start_job we do insert mirror_top_bs before block_job_create() call.

But we should do that all in a drained section, so that no parallel io requests may come.

And we have a drained section but it finishes immediately after bdrv_append, when
bs_opaque is still not initialized. Probably we just need to expand it?


  May be:

diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..0a6bfc1230 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1610,11 +1610,11 @@ static BlockJob *mirror_start_job(
      bdrv_ref(mirror_top_bs);
      bdrv_drained_begin(bs);
      bdrv_append(mirror_top_bs, bs, &local_err);
-    bdrv_drained_end(bs);
  
      if (local_err) {
          bdrv_unref(mirror_top_bs);
          error_propagate(errp, local_err);
+        bdrv_drained_end(bs);
          return NULL;
      }
  
@@ -1789,6 +1789,8 @@ static BlockJob *mirror_start_job(
      trace_mirror_start(bs, s, opaque);
      job_start(&s->common.job);
  
+    bdrv_drained_end(bs);
+
      return &s->common;
  
  fail:
@@ -1813,6 +1815,8 @@ fail:
  
      bdrv_unref(mirror_top_bs);
  
+    bdrv_drained_end(bs);
+
      return NULL;
  }
  


Could you check, does it help?


> 
> The rootcause is that qemu do release/acquire when hold the lock,
> at the same time, IO thread get the lock after release stage, and the crash
> occured.
> 
> Actually, in this situation, job->job.aio_context will not equal to
> qemu_get_aio_context(), and will be the same as bs->aio_context,
> thus, no need to release the lock, becasue bdrv_root_attach_child()
> will not change the context.
> 
> This patch fix this issue.
> 
> Signed-off-by: Michael Qiu <qiudayu@huayun.com>
> ---

[*] here you could add any comments, which will not go into final commit message, like version history.

>   blockjob.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index 98ac8af982..51a09f3b60 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -214,13 +214,15 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>       BdrvChild *c;
>   
>       bdrv_ref(bs);
> -    if (job->job.aio_context != qemu_get_aio_context()) {
> +    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
> +        job->job.aio_context != qemu_get_aio_context()) {
>           aio_context_release(job->job.aio_context);
>       }
>       c = bdrv_root_attach_child(bs, name, &child_job, 0,
>                                  job->job.aio_context, perm, shared_perm, job,
>                                  errp);
> -    if (job->job.aio_context != qemu_get_aio_context()) {
> +    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
> +        job->job.aio_context != qemu_get_aio_context()) {

that's a wrong check, it will never reacquire the lock on success path, as after successful attach, bs context would definitely equal to job context.

I think you need a boolean variable at start of function, initialized to the condition, and after _attach_child() you not recheck the condition but rely on variable.

>           aio_context_acquire(job->job.aio_context);
>       }
>       if (c == NULL) {
> 

The code was introduced by Kevin in 132ada80c4a6 "block: Adjust AioContexts when attaching nodes", so I think we need his opinion.
You also may add "Fixes: 132ada80c4a6fea7b67e8bb0a5fd299994d927c6", especially if you check that your case doesn't fail before this commit.

I think the idea itself is correct, as bdrv_root_attach_child will not call any of *_set_aio_*, and no reason to release the lock. So it shouldn't hurt and it's great if it fixes some crash.

When side effect of a function is temporary releasing some lock, it's hard to be sure that all callers are OK with it...


-- 
Best regards,
Vladimir

