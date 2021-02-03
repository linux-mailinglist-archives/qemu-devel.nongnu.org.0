Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF830D46B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:57:05 +0100 (CET)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7D28-0001um-GT
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Cql-0004kq-5p; Wed, 03 Feb 2021 02:45:20 -0500
Received: from mail-eopbgr80092.outbound.protection.outlook.com
 ([40.107.8.92]:40772 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Cqg-0000NF-2x; Wed, 03 Feb 2021 02:45:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OThWbI5KACrIQ1D9eK090dF3TLgoTDQ6nCJTxcmdCovf9Be3EkLgLTh7FK2cPUbd1SCtOjBINeksmuZb7IfwmCk/Z6yqSe/yN61bJkR3u8tSB89jZ5pG4i1/tLqAiNovt8bDXXgbLlml9kQehGE+pIYlYJvBPgJ7BB4XDO0z7/J9Y2p9KKo7oYgxzUeZ7f5ODVccav6/RekB0TbvrzAjzNLFfCfwd4Um/lel2YAmXIo79k0Yowy+5B0resDc8xURiwhY5nX77Hw3KUwdhzn8IkQjQxUUU9UL3xZkTl2wOssYSZlKX6vqPj9LxPQhYY3n18mNSe6Ykqpl2e1ZwQa83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fq8Vw9rzw5svs0EyDqa0LcNscYtOdiHFf0ebxNginw=;
 b=AdwuSEaB6U3xnPrCLpg/hTnZ1Z3Tuq7J1Nrsg/s3v9FIdJlKwDsCeHjOr4a6COsmJbfziTpytf8Ozj7voL6sNfdtq6YxXh/D2YKgFqSu6ex/d1kH2/UWSxkioqJlGNwd5SqQcbsZouBKXvpP2ksminYtbPBkUxkAygG7B4M2mrHqblzfyVLizBXn274qg1m51gMxR8ZmIdySAiwJJIzlxIUMA9LAc4d7eyS8QiXY8AL4JWi/Q9lmX5PRKh1GunXtkWkLPByCJOLv/E969Fz6MYbd1VAvg/6pEpA9nAlF1gMXS4eewZTBz97Su+QoNQHhS7dX7AtaV2At5kyEfKqyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fq8Vw9rzw5svs0EyDqa0LcNscYtOdiHFf0ebxNginw=;
 b=rF/ycOAFk6sv24SZE5tE210H88FyISDRjTJ7laX45CvpWMZyf+7Ddh+W53FWTLC3TAgfC7SILEvBmgrxHn0oWhfxh+umT17BE8OlPK2+oi9J9RnoJ6FX64THICUibgO+MZTiTEJc6y3XO7pvGPDuRLs25rZ9uXbhyweJAMp6jvg=
Authentication-Results: huayun.com; dkim=none (message not signed)
 header.d=none;huayun.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 07:45:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 07:45:10 +0000
Subject: Re: [PATCH] blockjob: Fix crash with IOthread when block commit after
 snapshot
To: 08005325@163.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210203024059.52683-1-08005325@163.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4a1d2a61-0c6c-7d44-092b-26a05798e54a@virtuozzo.com>
Date: Wed, 3 Feb 2021 10:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203024059.52683-1-08005325@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0218.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR02CA0218.eurprd02.prod.outlook.com (2603:10a6:20b:28f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Wed, 3 Feb 2021 07:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a9ff701-a026-446a-70b7-08d8c817a1bd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-Microsoft-Antispam-PRVS: <AS8PR08MB65029BA97EDBE1611854E990C1B49@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lonCslLpIKeuYVkZRmlkoWvHMwPFW0GiHMW22otl8uaWxLF0cIC6ycZUMhdhwtAptO2Q4As2IOVLX/g0lE1LLyerHNrjpXao/NG6K5pqDY8QZsLCwGN0kDHnrA5kTc/n/mIOV8hDUGbDoHv+wbaAOUPT2TUNyoZqyZzqXXIAWX4epoU+AQLzA32lDSkZ6+MiVdSzPjOSgnqO/p+UbPVc8nghjT/DOvL7ORA1vak8TKYn5NARKRfThrnmdru1cAIMsIxTGMTWE5sgX1fA5aIvcjhjOQ5JJ1XhQg57ACXReJj4mAaO/GCHU3RwcoRqspW6cURmg87pGy96NfVzSy8ZdGvuYUlLqyimt1mAa0W5DfuaZKPmjYvpwaY7Wkjot3WF7kyFcu8DOd6NaBgTjghnwPSWFCRXOAwUBM4fU5Y7plaOT9EeInOM0e2Izn+HPtOoYJNFFVU0UTLajnKooEWLeW3h/WIVGm8LoZiTnCczJex7g5EQr5wBEwJlj/cWLQRNSt9fV1ltExQvL/VePrxBvf8iMJ2IL3vY2UK8UX4Z2WFV8WfM/9Jt7As0Y9RH3OLWhvx10NQirlh6Odg8wMdoOfenh2FCBnFzSQlnJ/lf/pU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(8936002)(2616005)(31696002)(2906002)(52116002)(6486002)(16526019)(26005)(956004)(316002)(4326008)(16576012)(31686004)(478600001)(66946007)(5660300002)(66556008)(36756003)(186003)(66476007)(8676002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlVrWnAzcjVEdndPc050bmdRR2dHMnplcjA2V2ttWGZlODh3M2xlcGF1UHAz?=
 =?utf-8?B?eEZ5TXNrdVRIYy9IeWgybnZFcjNuMXhHcjRHc1l6dFU5SXp6QklUSkZxL1gv?=
 =?utf-8?B?K1grT2djK3Y3TXJwdmF4NnJmUUNNWFBvSlJpOHM0Q1U3b1pPcTZIUGNwZHFQ?=
 =?utf-8?B?cUNQWWNBcVJaU0ZEVlFXN2xuOVVpcUg2VzVpYkFLSW4vRG9hdWtsOFVjS0Rs?=
 =?utf-8?B?NFZRVUpIU2w0c1BBYjRGV2thMGtyblVZaklwKzJmeE1PNjVFMlpjdHAzK2pm?=
 =?utf-8?B?KzJlSnVJMkovNlVNaWdxVEV0dlFHUW56UXhrRVRmU3RBMVVNd1JibnFYQ3ZE?=
 =?utf-8?B?NVFEOWJYWm5EYkxtZDkwaitieUJ2eS81U1BmaTcxN3hlbzBxSVp2VytxWGs4?=
 =?utf-8?B?S0haTUswRVJBaUZkRWk1Z1VXSTdJaXBCUHUrSkhaVU45QjFDajlXTGFEWnRo?=
 =?utf-8?B?THZ6ZDRDazg0T25XQUZ4eG9jM1kvSmhCZ2FZMlFSclU3Z1ptN3ZmM01TL2lV?=
 =?utf-8?B?V0lmQnJJQ2pkN2hVdmJLdzhVU3NLRDFDdFcxcFpUblM3QUlhdjlYeG9Ka1l0?=
 =?utf-8?B?cHRGdE8xNXIyWm5TWks5N1prU1YxcTVZM09qYkE1elZjbUNwT0VzMkVMUDRI?=
 =?utf-8?B?TnRrelJlZkNLczRTMVZtWk9vVHBqMnBKN3FXbmtCOEtxQ0VIWlNFcHZ1VUVD?=
 =?utf-8?B?dm40RzcvMVFHTEk5QU9qQ2NMUVVmL1pLYk9uaitkYUtyRUVuT1Q2M1lIS3FR?=
 =?utf-8?B?eXBNcHI0VHZ2eksvWGsxd096N1pxeFhkck5hU3I1aGlKY2llY2Fub014V0JH?=
 =?utf-8?B?TWt2V08yYkF0VUdPdkV1VnBpQWNnVEtyZ2J3T2ZzS1pULzhHdkZsUnFPZkpJ?=
 =?utf-8?B?VkMvQ3VxcnQ0RFdaeGduRHhUSXN2TUFzQXRVeDI2VC9PS21xbVRSYnppcDk5?=
 =?utf-8?B?VTJqT2FGdXVFVlFIZ2V5QkEwUEkwTG43dCttelJmQ2JJTVBtWGZzUmdPR1k2?=
 =?utf-8?B?MG53SmJRSDB3WEtQVytBcW9vbytpVlA3czJDRGdTNERGN2pVQ0ZjSmxVVmg5?=
 =?utf-8?B?TE8rWm5oR1JRQlNZSlBqQitvazBKUUhtRVRObjdncjdTRWtuV3AvMTJya2Jz?=
 =?utf-8?B?Y1hiRWJsVDFDc211R0k5TFBRYmZ2UUFIYmtBT3pDbVl3ei8yMFRFcndDbDM0?=
 =?utf-8?B?ekcwTXkxTU1tNXFHRXBEbHcxTVIyZUg5a0prcG1CanQxYzB2NkgrMlErWDJO?=
 =?utf-8?B?bHh4YXlNMUhMU2RDZi9PWEQyWGpTSnhKTWg5dFZVRWltS1diamxoSWZqNTh1?=
 =?utf-8?B?VDZMOTJrU25vY29wd0I1Rmg5ZUlvbW1oL0JqVk5EcENvM29YWW5mUzdsN0dX?=
 =?utf-8?B?cEtmclpyV1R5RGZuZWJtclZEaFQxUWRCQ0tkVTB5R0NldGpGZy9VNm9EL21O?=
 =?utf-8?B?VXJRbjIxUm1hQWtmdkdFcmtuWFZudlhUU2pzOVNBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9ff701-a026-446a-70b7-08d8c817a1bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 07:45:10.0815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZvBk+dCIOyXXTd6xxiKRtDmdBK3wWJN076/Sdi1GXnrV/9jXPL37wx+0qtANzyaM4CRxUzCTCPJS496mFb+CMltkGRhTq3sj49LC4mlMiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.8.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, Michael Qiu <qiudayu@huayun.com>, mreitz@redhat.com,
 liangpeng10@huawei.com, quweijie@huayun.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

subject should start with [PATCH v5]

03.02.2021 05:40, 08005325@163.com wrote:
> From: Michael Qiu <qiudayu@huayun.com>
> 
> v5: reformat the commit log with backtrace of main thread
>      Add a boolean variable to make main thread could re-acquire
>      aio_context on success path.
> 
> v4: rebase to latest code
> 
> v3: reformat the commit log, remove duplicate content

patch history shouldn't go into commit message. So you should place it under '---' [*], after calling git format-patch

> 
> Currently, if guest has workloads, IO thread will acquire aio_context
> lock before do io_submit, it leads to segmentfault when do block commit
> after snapshot. Just like below:
> 
> Program received signal SIGSEGV, Segmentation fault.
> 
> [Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
> 0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> 1437    ../block/mirror.c: No such file or directory.
> (gdb) p s->job
> $17 = (MirrorBlockJob *) 0x0
> (gdb) p s->stop
> $18 = false
> 
> Call trace of IO thread:
> 0  0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> 1  0x00005576d0f7f3ab in bdrv_driver_pwritev at ../block/io.c:1174
> 2  0x00005576d0f8139d in bdrv_aligned_pwritev at ../block/io.c:1988
> 3  0x00005576d0f81b65 in bdrv_co_pwritev_part at ../block/io.c:2156
> 4  0x00005576d0f8e6b7 in blk_do_pwritev_part at ../block/block-backend.c:1260
> 5  0x00005576d0f8e84d in blk_aio_write_entry at ../block/block-backend.c:1476
> ...
> 
> Switch to qemu main thread:
> 0  0x00007f903be704ed in __lll_lock_wait at
> /lib/../lib64/libpthread.so.0
> 1  0x00007f903be6bde6 in _L_lock_941 at /lib/../lib64/libpthread.so.0
> 2  0x00007f903be6bcdf in pthread_mutex_lock at
> /lib/../lib64/libpthread.so.0
> 3  0x0000564b21456889 in qemu_mutex_lock_impl at
> ../util/qemu-thread-posix.c:79
> 4  0x0000564b213af8a5 in block_job_add_bdrv at ../blockjob.c:224
> 5  0x0000564b213b00ad in block_job_create at ../blockjob.c:440
> 6  0x0000564b21357c0a in mirror_start_job at ../block/mirror.c:1622
> 7  0x0000564b2135a9af in commit_active_start at ../block/mirror.c:1867
> 8  0x0000564b2133d132 in qmp_block_commit at ../blockdev.c:2768
> 9  0x0000564b2141fef3 in qmp_marshal_block_commit at
> qapi/qapi-commands-block-core.c:346
> 10 0x0000564b214503c9 in do_qmp_dispatch_bh at
> ../qapi/qmp-dispatch.c:110
> 11 0x0000564b21451996 in aio_bh_poll at ../util/async.c:164
> 12 0x0000564b2146018e in aio_dispatch at ../util/aio-posix.c:381
> 13 0x0000564b2145187e in aio_ctx_dispatch at ../util/async.c:306
> 14 0x00007f9040239049 in g_main_context_dispatch at
> /lib/../lib64/libglib-2.0.so.0
> 15 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:232
> 16 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:255
> 17 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:531
> 18 0x0000564b212304e1 in qemu_main_loop at ../softmmu/runstate.c:721
> 19 0x0000564b20f7975e in main at ../softmmu/main.c:50
> 
> In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
> is false, this means the MirrorBDSOpaque "s" object has not been initialized
> yet, and this object is initialized by block_job_create(), but the initialize
> process is stuck in acquiring the lock.
> 
> In this situation, IO thread come to bdrv_mirror_top_pwritev(),which means that
> mirror-top node is already inserted into block graph, but its bs->opaque->job
> is not initialized.
> 
> The root cause is that qemu main thread do release/acquire when hold the lock,
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
> Fixes: 132ada80 "block: Adjust AioContexts when attaching nodes"
> 
> Signed-off-by: Michael Qiu <qiudayu@huayun.com>

I feel like there may be more problems (like the fact that drained section should be expanded, and
that expanding doesn't help as Michael said), but I think that temporary releasing locks is unsafe
thing, and if we can avoid it for some cases it's good, especially if it fixes some bug:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---

[*] patch history and anything that you don't want to put into final commit message goes here.

>   blockjob.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index db3a21699c..d9dca36f65 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -212,15 +212,21 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>                          uint64_t perm, uint64_t shared_perm, Error **errp)
>   {
>       BdrvChild *c;
> +    bool need_context_ops;
>   
>       bdrv_ref(bs);
> -    if (job->job.aio_context != qemu_get_aio_context()) {
> +
> +    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;

I'd also put the second condition into same variable, just for less typing. Still it should work as is.

> +
> +    if (need_context_ops &&
> +        job->job.aio_context != qemu_get_aio_context()) {
>           aio_context_release(job->job.aio_context);
>       }
>       c = bdrv_root_attach_child(bs, name, &child_job, 0,
>                                  job->job.aio_context, perm, shared_perm, job,
>                                  errp);
> -    if (job->job.aio_context != qemu_get_aio_context()) {
> +    if (need_context_ops &&
> +        job->job.aio_context != qemu_get_aio_context()) {
>           aio_context_acquire(job->job.aio_context);
>       }
>       if (c == NULL) {
> 


-- 
Best regards,
Vladimir

