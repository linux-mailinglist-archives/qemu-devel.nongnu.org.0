Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C130A741
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:10:02 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Y1p-0003eI-C1
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1l6Y0G-0002YD-3k; Mon, 01 Feb 2021 07:08:25 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1l6Y08-00027P-6i; Mon, 01 Feb 2021 07:08:23 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DTmrD4fy4z5MkD;
 Mon,  1 Feb 2021 20:06:20 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Feb 2021 20:07:57 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 20:07:57 +0800
Subject: Re: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
To: =?UTF-8?B?5LuH5aSn546J?= <qiudayu@huayun.com>, "Vladimir
 Sementsov-Ogievskiy" <vsementsov@virtuozzo.com>, "08005325@163.com"
 <08005325@163.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>, "jsnow@redhat.com"
 <jsnow@redhat.com>
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
 <ce0a7f2b-ccf1-f898-4bf5-5b256e9c2f3b@virtuozzo.com>
 <BJXPR01MB0776C4B34AEED1F927EBA870CFB69@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <3058f4e4-fdec-6ffa-498c-66f609158451@huawei.com>
Date: Mon, 1 Feb 2021 20:07:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <BJXPR01MB0776C4B34AEED1F927EBA870CFB69@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I encountered the problem months ago too.  Could we move the creation of
the block job (block_job_create) before appending the new bs to
mirror_top_bs (bdrv_append) as I wrote in [*]?  I found that after
bdrv_append, qemu will use mirror_top_bs to do write.  And when writing,
qemu will use bs->opaque, which maybe NULL.

[*]
http://patchwork.ozlabs.org/project/qemu-devel/patch/20200826131910.1879079-1-liangpeng10@huawei.com/

Thanks,
Peng

On 2/1/2021 7:26 PM, 仇大玉 wrote:
> I'm so sorry, forgive my mail client(outlook)
> 
> I have try your solution, It doesn't work, still cause crash.
> 
> The reason is:  we come to bdrv_mirror_top_pwritev() (which means that mirror-top node is already inserted into block graph), but its bs->opaque->job is not initialized"
> 
> But the root cause is that in block_job_create() we released(unnecessary) the aio_context, and the iothread get the context.
> 
> Script has to part, one is run in the VM (to give some workload) we named script A:
> #!/bin/sh
> For((i=1;i<=100000000;i++));
> Do
> dd if=/dev/zero of=./xxx bs=1M count=200
> sleep 6
> done
> 
> Another one is in the hypervisor, we named script B:
> #!/bin/sh
> for((i=1;i<=10000000;i++));
> do
> virsh snapshot-create-as fqtest --atomic --no-metadata --name fq6 --disk-only  --diskspec vda,snapshot=external,file=/home/michael/snapshot/fq6.qcow2;
> virsh blockcommit fqtest /home/michael/snapshot/fq6.qcow2 --shallow --verbose --wait --pivot --top /home/michael/snapshot/fq6.qcow2;
> rm -r fq6.qcow2
> done
> 
> How to reproduce:
> 1. start a VM, my case is use libvirt, named fqtest
> 2. run script B in hypervisor
> 3. after guest boot up, login and run script A in vda.
> 
> Make sure, the IO thread enabled for vda.
> 
> Mostly, just wait for several minutes, it will crash. 
> 
> The whole thread backtrace is:
> 
> [Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
> 0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> 1437    ../block/mirror.c: No such file or directory.
> (gdb) p s->job
> $17 = (MirrorBlockJob *) 0x0
> (gdb) p s->stop
> $18 = false
> 
> (gdb) bt
> #0  0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> #1  0x00005576d0f7f3ab in bdrv_driver_pwritev at ../block/io.c:1174
> #2  0x00005576d0f8139d in bdrv_aligned_pwritev at ../block/io.c:1988
> #3  0x00005576d0f81b65 in bdrv_co_pwritev_part at ../block/io.c:2156
> #4  0x00005576d0f8e6b7 in blk_do_pwritev_part at ../block/block-backend.c:1260
> #5  0x00005576d0f8e84d in blk_aio_write_entry at ../block/block-backend.c:1476
> #6  0x00005576d1060ddb in coroutine_trampoline at ../util/coroutine-ucontext.c:173
> #7  0x00007f7c8d3be0d0 in __start_context at /lib/../lib64/libc.so.6
> #8  0x00007f7b52beb1e0 in  ()
> #9  0x0000000000000000 in  ()
> 
> Switch to qemu main thread:
> #0  0x00007f903be704ed in __lll_lock_wait at
> /lib/../lib64/libpthread.so.0
> #1  0x00007f903be6bde6 in _L_lock_941 at /lib/../lib64/libpthread.so.0
> #2  0x00007f903be6bcdf in pthread_mutex_lock at
> /lib/../lib64/libpthread.so.0
> #3  0x0000564b21456889 in qemu_mutex_lock_impl at
> ../util/qemu-thread-posix.c:79
> #4  0x0000564b213af8a5 in block_job_add_bdrv at ../blockjob.c:224
> #5  0x0000564b213b00ad in block_job_create at ../blockjob.c:440
> #6  0x0000564b21357c0a in mirror_start_job at ../block/mirror.c:1622
> #7  0x0000564b2135a9af in commit_active_start at ../block/mirror.c:1867
> #8  0x0000564b2133d132 in qmp_block_commit at ../blockdev.c:2768
> #9  0x0000564b2141fef3 in qmp_marshal_block_commit at
> qapi/qapi-commands-block-core.c:346
> #10 0x0000564b214503c9 in do_qmp_dispatch_bh at
> ../qapi/qmp-dispatch.c:110
> #11 0x0000564b21451996 in aio_bh_poll at ../util/async.c:164
> #12 0x0000564b2146018e in aio_dispatch at ../util/aio-posix.c:381
> #13 0x0000564b2145187e in aio_ctx_dispatch at ../util/async.c:306
> #14 0x00007f9040239049 in g_main_context_dispatch at
> /lib/../lib64/libglib-2.0.so.0
> #15 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:232
> #16 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:255
> #17 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:531
> #18 0x0000564b212304e1 in qemu_main_loop at ../softmmu/runstate.c:721
> #19 0x0000564b20f7975e in main at ../softmmu/main.c:50
> 
> Thanks,
> Michael
> 
> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> 
> Sent: 2021年2月1日 18:28
> To: 08005325@163.com; kwolf@redhat.com; mreitz@redhat.com; jsnow@redhat.com
> Cc: 仇大玉 <qiudayu@huayun.com>; qemu-devel@nongnu.org; qemu-block@nongnu.org
> Subject: Re: [PATCH v4] blockjob: Fix crash with IOthread when block commit after snapshot
> 
> Hi!
> 
> Tanks for fixing and sorry for a delay!
> 
> Please send each new version of a patch as a separate branch. It's a rule from https://wiki.qemu.org/Contribute/SubmitAPatch and it is more readable and less probable that your patch will be missed.
> 
> 28.01.2021 04:30, 08005325@163.com wrote:
>> From: Michael Qiu <qiudayu@huayun.com>
>>
>> v4: rebase to latest code
>>
>> v3: reformat the commit log, remove duplicate content
>>
>> v2: modify the coredump backtrace within commit log with the newest
>>      qemu with master branch
> 
> Such things shouldn't be in a commit message. You may put such comments after --- line[*] in a generated patch email
> 
>>
>> Currently, if guest has workloads, IO thread will acquire aio_context 
>> lock before do io_submit, it leads to segmentfault when do block 
>> commit after snapshot. Just like below:
> 
> Do you have some reproducer script?
> 
>>
>> Program received signal SIGSEGV, Segmentation fault.
>> [Switching to Thread 0x7f7c7d91f700 (LWP 99907)] 0x00005576d0f65aab in 
>> bdrv_mirror_top_pwritev at ../block/mirror.c:1437
>> 1437    ../block/mirror.c: No such file or directory.
>> (gdb) p s->job
>> $17 = (MirrorBlockJob *) 0x0
>> (gdb) p s->stop
>> $18 = false
>>
>> (gdb) bt
>>
>> Switch to qemu main thread:
>> /lib/../lib64/libpthread.so.0
>> /lib/../lib64/libpthread.so.0
>> ../util/qemu-thread-posix.c:79
>> qapi/qapi-commands-block-core.c:346
>> ../qapi/qmp-dispatch.c:110
>> /lib/../lib64/libglib-2.0.so.0
> 
> Not very informative bt..
> 
>>
>> In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and 
>> stop field is false, this means the MirrorBDSOpaque "s" object has not 
>> been initialized yet, and this object is initialized by 
>> block_job_create(), but the initialize process is stuck in acquiring the lock.
> 
> Could you show another thread bt?
> 
> Hm, so you argue that we come to bdrv_mirror_top_pwritev() (which means that mirror-top node is already inserted into block graph), but its bs->opaque is not initialized?
> 
> Hmm, really in mirror_start_job we do insert mirror_top_bs before block_job_create() call.
> 
> But we should do that all in a drained section, so that no parallel io requests may come.
> 
> And we have a drained section but it finishes immediately after bdrv_append, when bs_opaque is still not initialized. Probably we just need to expand it?
> 
> 
>   May be:
> 
> diff --git a/block/mirror.c b/block/mirror.c index 8e1ad6eceb..0a6bfc1230 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1610,11 +1610,11 @@ static BlockJob *mirror_start_job(
>       bdrv_ref(mirror_top_bs);
>       bdrv_drained_begin(bs);
>       bdrv_append(mirror_top_bs, bs, &local_err);
> -    bdrv_drained_end(bs);
>   
>       if (local_err) {
>           bdrv_unref(mirror_top_bs);
>           error_propagate(errp, local_err);
> +        bdrv_drained_end(bs);
>           return NULL;
>       }
>   
> @@ -1789,6 +1789,8 @@ static BlockJob *mirror_start_job(
>       trace_mirror_start(bs, s, opaque);
>       job_start(&s->common.job);
>   
> +    bdrv_drained_end(bs);
> +
>       return &s->common;
>   
>   fail:
> @@ -1813,6 +1815,8 @@ fail:
>   
>       bdrv_unref(mirror_top_bs);
>   
> +    bdrv_drained_end(bs);
> +
>       return NULL;
>   }
>   
> 
> 
> Could you check, does it help?
> 
> 
>>
>> The rootcause is that qemu do release/acquire when hold the lock, at 
>> the same time, IO thread get the lock after release stage, and the 
>> crash occured.
>>
>> Actually, in this situation, job->job.aio_context will not equal to 
>> qemu_get_aio_context(), and will be the same as bs->aio_context, thus, 
>> no need to release the lock, becasue bdrv_root_attach_child() will not 
>> change the context.
>>
>> This patch fix this issue.
>>
>> Signed-off-by: Michael Qiu <qiudayu@huayun.com>
>> ---
> 
> [*] here you could add any comments, which will not go into final commit message, like version history.
> 
>>   blockjob.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/blockjob.c b/blockjob.c
>> index 98ac8af982..51a09f3b60 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -214,13 +214,15 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>>       BdrvChild *c;
>>   
>>       bdrv_ref(bs);
>> -    if (job->job.aio_context != qemu_get_aio_context()) {
>> +    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
>> +        job->job.aio_context != qemu_get_aio_context()) {
>>           aio_context_release(job->job.aio_context);
>>       }
>>       c = bdrv_root_attach_child(bs, name, &child_job, 0,
>>                                  job->job.aio_context, perm, shared_perm, job,
>>                                  errp);
>> -    if (job->job.aio_context != qemu_get_aio_context()) {
>> +    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
>> +        job->job.aio_context != qemu_get_aio_context()) {
> 
> that's a wrong check, it will never reacquire the lock on success path, as after successful attach, bs context would definitely equal to job context.
> 
> I think you need a boolean variable at start of function, initialized to the condition, and after _attach_child() you not recheck the condition but rely on variable.
> 
>>           aio_context_acquire(job->job.aio_context);
>>       }
>>       if (c == NULL) {
>>
> 
> The code was introduced by Kevin in 132ada80c4a6 "block: Adjust AioContexts when attaching nodes", so I think we need his opinion.
> You also may add "Fixes: 132ada80c4a6fea7b67e8bb0a5fd299994d927c6", especially if you check that your case doesn't fail before this commit.
> 
> I think the idea itself is correct, as bdrv_root_attach_child will not call any of *_set_aio_*, and no reason to release the lock. So it shouldn't hurt and it's great if it fixes some crash.
> 
> When side effect of a function is temporary releasing some lock, it's hard to be sure that all callers are OK with it...
> 
> 
> --
> Best regards,
> Vladimir
> 


