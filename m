Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F02FD323
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:53:37 +0100 (CET)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ErU-0007J3-1w
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2EjO-0006Pm-4P
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2EjI-0004ji-RS
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611153903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neKQbXZbuT6Q+t6mozsBCuSa97GrBNLIL1fO3QLrTKA=;
 b=cPq19GebuQiBOlMe9UkoUVVmw9GncYNU1fYCgCrMbXIPP886sJbet/yp5j+CPoQQpJdbVN
 rvlF+runkPEUy0qH+VfI6XjbXI8sXT1GFLQsc1cLrsTYXOzwSN7QSP9k9A/IHq8iqp46oI
 JN89uTYrSROcICWK3sBRKAx1UWPibb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-YjMIbW1POoOHGX0PPu395g-1; Wed, 20 Jan 2021 09:44:59 -0500
X-MC-Unique: YjMIbW1POoOHGX0PPu395g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A201801817;
 Wed, 20 Jan 2021 14:44:57 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-178.ams2.redhat.com
 [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A30608BA;
 Wed, 20 Jan 2021 14:44:53 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
 <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
 <29cccc86-a450-3326-2d70-f3022e32b5db@redhat.com>
 <ccb47c7c-051d-6df4-9a73-ace9b23b67a2@redhat.com>
 <cfe3b7dd-8a1f-7e49-e576-ebca82ee4d98@redhat.com>
Message-ID: <3db87f48-b628-8000-a46a-6d07cdf1ccc3@redhat.com>
Date: Wed, 20 Jan 2021 15:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cfe3b7dd-8a1f-7e49-e576-ebca82ee4d98@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.01.21 15:34, Max Reitz wrote:
> On 20.01.21 14:50, Max Reitz wrote:
>> On 20.01.21 11:39, Max Reitz wrote:
>>> On 19.01.21 20:22, Vladimir Sementsov-Ogievskiy wrote:
>>>> 19.01.2021 21:40, Max Reitz wrote:
>>>>> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> Hi Max!
>>>>>> I applied my series onto yours 129-fixing and found, that 129 
>>>>>> fails for backup.
>>>>>> And setting small max-chunk and even max-workers to 1 doesn't 
>>>>>> help! (setting
>>>>>> speed like in v3 still helps).
>>>>>>
>>>>>> And I found, that the problem is that really, the whole backup job 
>>>>>> goes during
>>>>>> drain, because in new architecture we do just job_yield() during 
>>>>>> the whole
>>>>>> background block-copy.
>>>>>>
>>>>>> This leads to modifying the existing patch in the series, which 
>>>>>> does job_enter()
>>>>>> from job_user_pause: we just need call job_enter() from 
>>>>>> job_pause() to cover
>>>>>> not only user pauses but also drained_begin.
>>>>>>
>>>>>> So, now I don't need any additional fixing of 129.
>>>>>>
>>>>>> Changes in v4:
>>>>>> - add a lot of Max's r-b's, thanks!
>>>>>>
>>>>>> 03: fix over-80 line (in comment), add r-b
>>>>>> 09: was "[PATCH v3 10/25] job: call job_enter from job_user_pause",
>>>>>>      now changed to finally fix 129 iotest, drop r-b
>>>>>>
>>>>>> 10: squash-in additional wording on max-chunk, fix error message, 
>>>>>> keep r-b
>>>>>> 17: drop extra include, assert job_is_cancelled() instead of 
>>>>>> check, add r-b
>>>>>> 18: adjust commit message, add r-b
>>>>>> 23: add comments and assertion, about the fact that test doesn't 
>>>>>> support
>>>>>>      paths with colon inside
>>>>>>      fix s/disable-copy-range/use-copy-range/
>>>>>
>>>>> Hmmm, for me, 129 sometimes fails still, because it completes too 
>>>>> quickly...  (The error then is that 'return[0]' does not exist in 
>>>>> query-block-jobs’s result, because the job is already gone.)
>>>>>
>>>>> When I insert a print(result) after the query-block-jobs, I can see 
>>>>> that the job has always progressed really far, even if its still 
>>>>> running. (Like, generally the offset is just one MB shy of 1G.)
>>>>>
>>>>> I suspect the problem is that block-copy just copies too much from 
>>>>> the start (by default); i.e., it starts 64 workers with, hm, well, 
>>>>> 1 MB of chunk size?  Shouldn’t fill the 128 MB immediately...
>>>>>
>>>>> Anyway, limiting the number of workers (to 1) and the chunk size 
>>>>> (to 64k) with x-perf does ensure that the backup job’s progress is 
>>>>> limited to 1 MB or so, which looks fine to me.
>>>>>
>>>>> I suppose we should do that, then (in 129), before patch 17?
>>>>
>>>> Yes, that sounds reasonable
>>>>
>>>>>
>>>>> (PS: I can also see a MacOS failure in iotest 256.  I suspect it’s 
>>>>> related to this series, because 256 is a backup test (with 
>>>>> iothreads), but I’m not sure yet.  The log is here:
>>>>>
>>>>> https://cirrus-ci.com/task/5276331753603072
>>>>> )
>>>>>
>>>>
>>>> qemu received signal 31 ?
>>>>
>>>> googling for MacOS...
>>>>
>>>>   31    SIGUSR2      terminate process    User defined signal 2
>>>
>>> coroutine-sigaltstack uses SIGUSR2 to set up new coroutines.  Perhaps 
>>> it’s unrelated to backup?  Guess I’ll just run the test one more 
>>> time. O:)
>>
>> I ran it again, got the same error.  There is no error on master, or 
>> before backup uses block_copy.
>>
>> I’m trying to run a test directly on the “move to block-copy” commit, 
>> but so far Cirrus doesn’t seem to want me to do another test run right 
>> now.
>>
>> (Though I’m pretty sure if there is no error before the block-copy 
>> commit, then using block-copy must be the problem.  The remaining 
>> patches in my block branch are just disabling copy_range, some 
>> clean-up, the simplebench patches, the locking code error reporting 
>> change, and a new iotest.)
> 
> I was able to reproduce the signal on Linux, by passing
> --with-coroutine=sigaltstack to configure (sometimes takes like 10 runs 
> to fail, though).  “move to block-copy” is indeed the first failing 
> commiit.
> 
> Letting qemu_coroutine_new() set up an aborting signal handler for 
> SIGUSR2 instead of restoring the default action (i.e. exiting without 
> core dump) yields this back trace:
> 
> Thread 1:
> 
> #0  0x00007f61870ba9d5 in raise () at /lib64/libc.so.6
> #1  0x00007f61870a38a4 in abort () at /lib64/libc.so.6
> #2  0x0000562cd2be7350 in sigusr2_handler (s=<optimized out>) at 
> ../util/coroutine-sigaltstack.c:151
> #3  0x00007f6187cee1e0 in <signal handler called> () at 
> /lib64/libpthread.so.0
> #4  0x00007f61870bad8a in sigsuspend () at /lib64/libc.so.6
> #5  0x0000562cd30d9e48 in qemu_coroutine_new () at 
> ../util/coroutine-sigaltstack.c:220
> #6  0x0000562cd3106206 in qemu_coroutine_create
>      (entry=entry@entry=0x562cd303c950 <block_copy_async_co_entry>, 
> opaque=opaque@entry=0x7f6170002c00)
>      at ../util/qemu-coroutine.c:75
> #7  0x0000562cd303cd0e in block_copy_async
>      (s=0x562cd4f94400, offset=offset@entry=0, bytes=67108864, 
> max_workers=64, max_chunk=0, cb=cb@entry=0x562cd301dfe0 
> <backup_block_copy_callback>, cb_opaque=0x562cd6256940) at 
> ../block/block-copy.c:752
> #8  0x0000562cd301dd4e in backup_loop (job=<optimized out>) at 
> ../block/backup.c:156
> #9  backup_run (job=0x562cd6256940, errp=<optimized out>) at 
> ../block/backup.c:299
> #10 0x0000562cd2fc84d2 in job_co_entry (opaque=0x562cd6256940) at 
> ../job.c:911
> #11 0x0000562cd30da04b in coroutine_bootstrap 
> (self=self@entry=0x562cd6262ef0, co=co@entry=0x562cd6262ef0)
>      at ../util/coroutine-sigaltstack.c:105
> #12 0x0000562cd30da0e1 in coroutine_trampoline (signal=<optimized out>) 
> at ../util/coroutine-sigaltstack.c:146
> #13 0x00007f6187cee1e0 in <signal handler called> () at 
> /lib64/libpthread.so.0
> #14 0x00007f61870bad8a in sigsuspend () at /lib64/libc.so.6
> 
> Thread 2:
> 
> (gdb) bt
> #0  0x00007f6187cee2b6 in __libc_sigaction () at /lib64/libpthread.so.0
> #1  0x0000562cd30d9dc7 in qemu_coroutine_new () at 
> ../util/coroutine-sigaltstack.c:194
> #2  0x0000562cd3106206 in qemu_coroutine_create
>      (entry=entry@entry=0x562cd3016c20 <aio_task_co>, 
> opaque=opaque@entry=0x7f616c0063d0)
>      at ../util/qemu-coroutine.c:75
> #3  0x0000562cd3016dd4 in aio_task_pool_start_task (pool=0x7f616c0067d0, 
> task=0x7f616c0063d0)
>      at ../block/aio_task.c:94
> #4  0x0000562cd303c193 in block_copy_task_run (task=<optimized out>, 
> pool=<optimized out>)
>      at ../block/block-copy.c:330
> #5  block_copy_dirty_clusters (call_state=0x7f616c002c00) at 
> ../block/block-copy.c:646
> #6  block_copy_common (call_state=0x7f616c002c00) at 
> ../block/block-copy.c:696
> #7  0x0000562cd30da04b in coroutine_bootstrap 
> (self=self@entry=0x7f616c003660, co=co@entry=0x7f616c003660)
>      at ../util/coroutine-sigaltstack.c:105
> #8  0x0000562cd30da0e1 in coroutine_trampoline (signal=<optimized out>) 
> at ../util/coroutine-sigaltstack.c:146
> #9  0x00007f6187cee1e0 in <signal handler called> () at 
> /lib64/libpthread.so.0
> #10 0x00007f61870bad8a in sigsuspend () at /lib64/libc.so.6
> #11 0x0000562cd30d9f61 in qemu_coroutine_new () at 
> ../util/coroutine-sigaltstack.c:254
> #12 0x0000562cd61b40d0 in  ()
> #13 0x00007f6163fff930 in  ()
> #14 0x00007f6187cecc5f in annobin_pt_longjmp.c_end () at 
> /lib64/libpthread.so.0
> #15 0x0000562cd30da00d in qemu_coroutine_switch
>      (from_=0x562cd5cc3400, to_=0x7f616c003108, 
> action=action@entry=COROUTINE_YIELD)
>      at ../util/coroutine-sigaltstack.c:284
> #16 0x0000562cd31065f0 in qemu_coroutine_yield () at 
> ../util/qemu-coroutine.c:193
> #17 0x0000562cd2fc751d in job_do_yield (job=0x562cd5cc3400, 
> ns=18446744073709551615) at ../job.c:478
> #18 0x0000562cd2fc855f in job_yield (job=0x562cd5cc3400) at ../job.c:525
> #19 0x0000562cd301dd74 in backup_loop (job=<optimized out>) at 
> ../block/backup.c:164
> #20 backup_run (job=0x562cd5cc3400, errp=<optimized out>) at 
> ../block/backup.c:299
> #21 0x0000562cd2fc84d2 in job_co_entry (opaque=0x562cd5cc3400) at 
> ../job.c:911
> #22 0x0000562cd30da04b in coroutine_bootstrap 
> (self=self@entry=0x562cd61b40d0, co=co@entry=0x562cd61b40d0)
>      at ../util/coroutine-sigaltstack.c:105
> #23 0x0000562cd30da0e1 in coroutine_trampoline (signal=<optimized out>) 
> at ../util/coroutine-sigaltstack.c:146
> #24 0x00007f6187cee1e0 in <signal handler called> () at 
> /lib64/libpthread.so.0
> #25 0x00007f61870bad8a in sigsuspend () at /lib64/libc.so.6
> #26 0x0000000000000001 in  ()
> #27 0x0000000000000000 in  ()
> 
>  From a glance, it looks to me like two coroutines are created 
> simultaneously in two threads, and so one thread sets up a special 
> SIGUSR2 action, then another reverts SIGUSR2 to the default, and then 
> the first one kills itself with SIGUSR2.
> 
> Not sure what this has to do with backup, though it is interesting that 
> backup_loop() runs in two threads.  So perhaps some AioContext problem.

Oh, 256 runs two backups concurrently.  So it isn’t that interesting, 
but perhaps part of the problem still.  (I have no idea, still looking.)

Max


