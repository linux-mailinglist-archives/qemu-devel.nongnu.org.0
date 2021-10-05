Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2840422C26
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:15:37 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmAK-0007eL-An
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXlyd-0001PI-77
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXlyX-0008U3-9Z
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7DNo6j3oTKoz//h/qqu7DwEC2+imBWUEcqW1zZuSgQ=;
 b=NeJpHihXFNWI3qnZNrSlTZcBWOC/leZ+cNHOR32LFnYUNbE1U5krv0iT+N4ehP5u9un7E3
 nxJfPNWit2P2PVjyAS/1bZj168OWYPDS1RwHjYg1c0CfoznlnXVW6vqhI/7XkBKKNHLdnY
 BWlbX1Awt4kLHkcsa5MOQKuhQzXZzVc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-MzumV1tiN7SDMlE5FtNpoQ-1; Tue, 05 Oct 2021 11:03:17 -0400
X-MC-Unique: MzumV1tiN7SDMlE5FtNpoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5811307wrg.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q7DNo6j3oTKoz//h/qqu7DwEC2+imBWUEcqW1zZuSgQ=;
 b=c5zpkU/NHSw/O9nMQx4ohLRK1QAduxSSDYyJQt09lr/L92NW7qP0bEw5R0rtaCDN3J
 c7kq7QUE1WhpnwSbXwH34Yqu4dinoU6ZshzNxMz8bsQb2bb39WZqQ8PGdu1aIC4C1kw0
 XE5Wk431NX/p+9Yx98rHJTQABcWdez5Fw+WRQ6Md1aEN2IFqnl/UntMPKlhaDZeSmRIh
 a5p+q6bvES4rIFbfBRQ+AIiDz67KAup2xpaE9slRma7sA18gckiYEwu3ym8/0TxAv2Ub
 fBpf3QF4/1aMXrx6Ym62uxeOdpO0JCOaIu5I1zkaPc5gUZ8Y3KGJPd+ak9Ea362Lq8Y6
 3qTg==
X-Gm-Message-State: AOAM532pMBFJ+6/KR56SoE+Iln6Qml/1mr1vFU6gWyeVikuPIYaWkBVF
 neLBpFUJL2v9bNF500Sf2Mm0i/Q+LmRDVmtpc4QBBBFzLieVLgpVHAmo+5cwF4p8Hrr6T/GRya9
 2LmEtmHou4sRh+IA=
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr23102145wra.144.1633446192472; 
 Tue, 05 Oct 2021 08:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweio7R/7fUROA9fB6nT0eN5yJzHZlDObSWL9fu0JmzISH0UQgoUjNgzdZkkElIxUnZj/im6A==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr23101964wra.144.1633446191169; 
 Tue, 05 Oct 2021 08:03:11 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id i14sm2449006wmq.29.2021.10.05.08.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 08:03:08 -0700 (PDT)
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
 <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
 <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
 <085e9e5a-56b5-21ce-e1af-0500acd39937@virtuozzo.com>
 <dedd1e5a-bb91-1ba7-5cd4-06f03dce37a3@redhat.com>
 <8f382e34-60ca-d848-abb3-531ae369d443@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <87f25084-8c5b-2565-95d8-9baa9edceeee@redhat.com>
Date: Tue, 5 Oct 2021 17:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8f382e34-60ca-d848-abb3-531ae369d443@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 19:59, Vladimir Sementsov-Ogievskiy wrote:
> 10/4/21 19:47, Hanna Reitz wrote:
>> On 24.09.21 00:01, Vladimir Sementsov-Ogievskiy wrote:
>>> 22.09.2021 22:19, Vladimir Sementsov-Ogievskiy wrote:
>>>> 22.09.2021 19:05, Richard Henderson wrote:
>>>>> On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> The following changes since commit 
>>>>>> 326ff8dd09556fc2e257196c49f35009700794ac:
>>>>>>
>>>>>>    Merge remote-tracking branch 
>>>>>> 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 
>>>>>> 16:17:05 +0100)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>    https://src.openvz.org/scm/~vsementsov/qemu.git 
>>>>>> tags/pull-jobs-2021-09-21
>>>>>>
>>>>>> for you to fetch changes up to 
>>>>>> c9489c04319cac75c76af8fc27c254f46e10214c:
>>>>>>
>>>>>>    iotests: Add mirror-ready-cancel-error test (2021-09-21 
>>>>>> 11:56:11 +0300)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> mirror: Handle errors after READY cancel
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Hanna Reitz (12):
>>>>>>        job: Context changes in job_completed_txn_abort()
>>>>>>        mirror: Keep s->synced on error
>>>>>>        mirror: Drop s->synced
>>>>>>        job: Force-cancel jobs in a failed transaction
>>>>>>        job: @force parameter for job_cancel_sync()
>>>>>>        jobs: Give Job.force_cancel more meaning
>>>>>>        job: Add job_cancel_requested()
>>>>>>        mirror: Use job_is_cancelled()
>>>>>>        mirror: Check job_is_cancelled() earlier
>>>>>>        mirror: Stop active mirroring after force-cancel
>>>>>>        mirror: Do not clear .cancelled
>>>>>>        iotests: Add mirror-ready-cancel-error test
>>>>>
>>>>> This fails testing with errors like so:
>>>>>
>>>>> Running test test-replication
>>>>> test-replication: ../job.c:186: job_state_transition: Assertion 
>>>>> `JobSTT[s0][s1]' failed.
>>>>> ERROR test-replication - too few tests run (expected 13, got 8)
>>>>> make: *** [Makefile.mtest:816: run-test-100] Error 1
>>>>> Cleaning up project directory and file based variables
>>>>> ERROR: Job failed: exit code 1
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures
>>>>>
>>>>
>>>>
>>>> Interesting :(
>>>>
>>>> I've reproduced, starting test-replication in several parallel 
>>>> loops. (it doesn't reproduce for me if just start in one loop). So, 
>>>> that's some racy bug..
>>>>
>>>> Hmm, and seems it doesn't reproduce so simple on master. I'll try 
>>>> to bisect the series tomorrow.
>>>>
>>>> ====
>>>>
>>>> (gdb) bt
>>>> #0  0x00007f034a3d09d5 in raise () from /lib64/libc.so.6
>>>> #1  0x00007f034a3b9954 in abort () from /lib64/libc.so.6
>>>> #2  0x00007f034a3b9789 in __assert_fail_base.cold () from 
>>>> /lib64/libc.so.6
>>>> #3  0x00007f034a3c9026 in __assert_fail () from /lib64/libc.so.6
>>>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, 
>>>> s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>>>> #5  0x000055d3b503e7c2 in job_conclude (job=0x55d3b5e67020) at 
>>>> ../job.c:652
>>>> #6  0x000055d3b503eaa1 in job_finalize_single (job=0x55d3b5e67020) 
>>>> at ../job.c:722
>>>> #7  0x000055d3b503ecd1 in job_completed_txn_abort 
>>>> (job=0x55d3b5e67020) at ../job.c:801
>>>> #8  0x000055d3b503f2ea in job_cancel (job=0x55d3b5e67020, 
>>>> force=false) at ../job.c:973
>>>> #9  0x000055d3b503f360 in job_cancel_err (job=0x55d3b5e67020, 
>>>> errp=0x7fffcc997a80) at ../job.c:992
>>>> #10 0x000055d3b503f576 in job_finish_sync (job=0x55d3b5e67020, 
>>>> finish=0x55d3b503f33f <job_cancel_err>, errp=0x0) at ../job.c:1054
>>>> #11 0x000055d3b503f3d0 in job_cancel_sync (job=0x55d3b5e67020, 
>>>> force=false) at ../job.c:1008
>>>> #12 0x000055d3b4ff14a3 in replication_close (bs=0x55d3b5e6ef80) at 
>>>> ../block/replication.c:152
>>>> #13 0x000055d3b50277fc in bdrv_close (bs=0x55d3b5e6ef80) at 
>>>> ../block.c:4677
>>>> #14 0x000055d3b50286cf in bdrv_delete (bs=0x55d3b5e6ef80) at 
>>>> ../block.c:5100
>>>> #15 0x000055d3b502ae3a in bdrv_unref (bs=0x55d3b5e6ef80) at 
>>>> ../block.c:6495
>>>> #16 0x000055d3b5023a38 in bdrv_root_unref_child 
>>>> (child=0x55d3b5e4c690) at ../block.c:3010
>>>> #17 0x000055d3b5047998 in blk_remove_bs (blk=0x55d3b5e73b40) at 
>>>> ../block/block-backend.c:845
>>>> #18 0x000055d3b5046e38 in blk_delete (blk=0x55d3b5e73b40) at 
>>>> ../block/block-backend.c:461
>>>> #19 0x000055d3b50470dc in blk_unref (blk=0x55d3b5e73b40) at 
>>>> ../block/block-backend.c:516
>>>> #20 0x000055d3b4fdb20a in teardown_secondary () at 
>>>> ../tests/unit/test-replication.c:367
>>>> #21 0x000055d3b4fdb632 in test_secondary_continuous_replication () 
>>>> at ../tests/unit/test-replication.c:504
>>>> #22 0x00007f034b26979e in g_test_run_suite_internal () from 
>>>> /lib64/libglib-2.0.so.0
>>>> #23 0x00007f034b26959b in g_test_run_suite_internal () from 
>>>> /lib64/libglib-2.0.so.0
>>>> #24 0x00007f034b26959b in g_test_run_suite_internal () from 
>>>> /lib64/libglib-2.0.so.0
>>>> #25 0x00007f034b269c8a in g_test_run_suite () from 
>>>> /lib64/libglib-2.0.so.0
>>>> #26 0x00007f034b269ca5 in g_test_run () from /lib64/libglib-2.0.so.0
>>>> #27 0x000055d3b4fdb9c0 in main (argc=1, argv=0x7fffcc998138) at 
>>>> ../tests/unit/test-replication.c:613
>>>> (gdb) fr 4
>>>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, 
>>>> s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>>>> 186         assert(JobSTT[s0][s1]);
>>>> (gdb) list
>>>> 181         JobStatus s0 = job->status;
>>>> 182         assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
>>>> 183         trace_job_state_transition(job, job->ret,
>>>> 184                                    JobSTT[s0][s1] ? "allowed" : 
>>>> "disallowed",
>>>> 185                                    JobStatus_str(s0), 
>>>> JobStatus_str(s1));
>>>> 186         assert(JobSTT[s0][s1]);
>>>> 187         job->status = s1;
>>>> 188
>>>> 189         if (!job_is_internal(job) && s1 != s0) {
>>>> 190 qapi_event_send_job_status_change(job->id, job->status);
>>>> (gdb) p s0
>>>> $1 = JOB_STATUS_NULL
>>>> (gdb) p s1
>>>> $2 = JOB_STATUS_CONCLUDED
>>>>
>>>>
>>>>
>>>
>>>
>>> bisect points to "job: Add job_cancel_requested()"
>>>
>>> And "bisecting" within this commit shows that the following helps:
>>>
>>> diff --git a/job.c b/job.c
>>> index be878ca5fc..bb52a1b58f 100644
>>> --- a/job.c
>>> +++ b/job.c
>>> @@ -655,7 +655,7 @@ static void job_conclude(Job *job)
>>>
>>>  static void job_update_rc(Job *job)
>>>  {
>>> -    if (!job->ret && job_is_cancelled(job)) {
>>> +    if (!job->ret && job_cancel_requested(job)) {
>>>          job->ret = -ECANCELED;
>>>      }
>>>      if (job->ret) {
>>>
>>>
>>> - this returns job_update_rc to pre-patch behavior.
>>>
>>> But why, I don't know:) More investigation is needed. probably 
>>> replication code is doing something wrong..
>>
>>  From what I can tell, this is what happens:
>>
>> (1) The mirror job completes, we go to job_co_entry(), and schedule 
>> job_exit().  It doesn’t run yet, though.
>> (2) replication_close() cancels the job.
>> (3) We get to job_completed_txn_abort().
>> (4) The job isn’t completed yet, so we invoke job_finish_sync().
>> (5) Now job_exit() finally gets to run, and this is how we end up in 
>> a situation where .cancelled is true, but .force_cancel is false: 
>> Yes, mirror clears .cancelled before exiting its main loop, but if 
>> the job is cancelled between it having been deferred to the main loop 
>> and job_exit() running, it may become true again.
>> (6) job_exit() leads to job_completed(), which invokes 
>> job_update_rc(), which however leaves job->ret == 0.
>> (7) job_completed() also calls job_completed_txn_success(), which is 
>> weird, because we still have job_completed_txn_abort() running 
>> concurrently...
>> (8) job_completed_txn_success() invokes job_do_finalize(), which goes 
>> to job_finalize_single(), which leaves the job in status null.
>> (9) job_finish_sync() is done, so we land back in 
>> job_completed_txn_abort(): We call job_finalize_single(), which tries 
>> to conclude the job, and that gives us the failed assertion 
>> (attempted transition from null to concluded).
>>
>> (When everything works, it seems like the job is completed before 
>> replication_close() can cancel it.  Cancelling is then a no-op and 
>> nothing breaks.)
>>
>> So now we could say the problem is that once a job completes and is 
>> deferred to the main loop, non-force cancel should do nothing. 
>> job_cancel_async() should not set job->cancelled to true if `!force 
>> && job->deferred_to_main_loop`. job_cancel() should invoke 
>> job_completed_txn_abort() not if `job->deferred_to_main_loop`, but if 
>> `job->deferred_to_main_loop && job_is_cancelled(job)`. (Doing this 
>> seems to fix the bug for me.)
>>
>> That I think would conform to the reasoning laid out in patch 7’s 
>> commit message, namely that some functions are called after the job 
>> has been deferred to the main loop, and because mirror clears 
>> .cancelled when it has been soft-cancelled, it’d be impossible to 
>> observe `.deferred_to_main_loop == true && .cancelled == true && 
>> .force_cancelled == false`.
>>
>>
>> Or we continue having soft-cancelled jobs still be -ECANCELED, which 
>> seems like the safe choice?  But it goes against what we’ve decided 
>> for patch 7, namely that soft-cancelled jobs should be treated like 
>> they’d complete as normal.
>>
>
> I think, I can live with either way:)  I still think that best way is 
> implementing "no graph change" mode for mirror instead of 
> soft-cancelling and deprecate soft-cancel (together with 
> block-job-cancel), but that doesn't work in short-term.

Yes, sure.  When it’s just another completion mode, we won’t have this 
problem at all anyway, because then we’d skip job_cancel() altogether 
(and so nothing in the code would get the idea to invoke 
job_completed_txn_abort()).

(Btw, I’ll send a new version of the mirror series tomorrow.)

Hanna


