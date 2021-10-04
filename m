Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7D421467
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 18:49:42 +0200 (CEST)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXR9o-0004HZ-PS
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 12:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXR7R-0002aV-57
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 12:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXR7O-0006jA-4K
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 12:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633366029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ym+poDTcszjKCvp1Fth/QsmfonZlJkBsJ1CQnYdTsy4=;
 b=iM2R/Zzfk4XM4s+h/yDXNfxZyf9EGj0SRJdUO/wNG7V0xnereX7zYqeXDd2O0rO1ihYtuT
 UGs68X/vB4ujBdbdl5GWVyC10cJhRWrT61BWIoXncoddbDASxKR9+BqGRU3N60nXpY72tk
 8qg19odgG6fBnh5XC03fOH8iFAQo8PI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HN8Rp4OjMwy6QufdtSyd3g-1; Mon, 04 Oct 2021 12:47:04 -0400
X-MC-Unique: HN8Rp4OjMwy6QufdtSyd3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so154961wms.7
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ym+poDTcszjKCvp1Fth/QsmfonZlJkBsJ1CQnYdTsy4=;
 b=gfpw+FKMDjf69fc/FYxFYrRQDmwkK1MYEHyn3HaYul4oqVVmA4JiW3EFAipSq3crs4
 cKXqLLDuSkBM7Tqn3uLV5kQczG0kTcItraN3MTzjZLTsuEQsFCn7letx84Ubx7YSm10d
 WTKIurh3x8K84lGvdC1XynAKcysqBKBRIqj8cfZCEPJbOCi7jUvESapcYn2rILi5O2sh
 CYZJbpy96rhc733n+jApa0RFI/YNhrDtakNfrcqCl704WJIq72X3/+vcL5+B7c/wUW/V
 IIipKR2dQpZPd9XBcqUnl74ns7sJwotoTHXZR6qd9eWLRLuOb1Mc0RvBARCf8EdsYkvo
 H6BQ==
X-Gm-Message-State: AOAM532u6IH6GvXn9LR1ReytxnJkBTF4UXBKfMIh0zLSAj/lyuWlW8QI
 BJvef/NEYmx+ILBBUVnWxAf9fgoGc7FnLhX0VvfC+srTvV2DmHDOuzjo1WUBxH5h2o55oq2qGd7
 Day7cB4clp2Ti3h8=
X-Received: by 2002:adf:a415:: with SMTP id d21mr10241825wra.236.1633366023225; 
 Mon, 04 Oct 2021 09:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA4aXJa0aZGo4WhxpegGKo+dh5QQCuhokyNIgh3o5IuFz5QJktXLOQ+1ZdXO3X8SCxWLCViA==
X-Received: by 2002:adf:a415:: with SMTP id d21mr10241785wra.236.1633366022874; 
 Mon, 04 Oct 2021 09:47:02 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id d8sm7840056wrz.84.2021.10.04.09.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 09:47:02 -0700 (PDT)
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
 <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
 <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
 <085e9e5a-56b5-21ce-e1af-0500acd39937@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <dedd1e5a-bb91-1ba7-5cd4-06f03dce37a3@redhat.com>
Date: Mon, 4 Oct 2021 18:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <085e9e5a-56b5-21ce-e1af-0500acd39937@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24.09.21 00:01, Vladimir Sementsov-Ogievskiy wrote:
> 22.09.2021 22:19, Vladimir Sementsov-Ogievskiy wrote:
>> 22.09.2021 19:05, Richard Henderson wrote:
>>> On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> The following changes since commit 
>>>> 326ff8dd09556fc2e257196c49f35009700794ac:
>>>>
>>>>    Merge remote-tracking branch 
>>>> 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 
>>>> 16:17:05 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://src.openvz.org/scm/~vsementsov/qemu.git 
>>>> tags/pull-jobs-2021-09-21
>>>>
>>>> for you to fetch changes up to 
>>>> c9489c04319cac75c76af8fc27c254f46e10214c:
>>>>
>>>>    iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 
>>>> +0300)
>>>>
>>>> ----------------------------------------------------------------
>>>> mirror: Handle errors after READY cancel
>>>>
>>>> ----------------------------------------------------------------
>>>> Hanna Reitz (12):
>>>>        job: Context changes in job_completed_txn_abort()
>>>>        mirror: Keep s->synced on error
>>>>        mirror: Drop s->synced
>>>>        job: Force-cancel jobs in a failed transaction
>>>>        job: @force parameter for job_cancel_sync()
>>>>        jobs: Give Job.force_cancel more meaning
>>>>        job: Add job_cancel_requested()
>>>>        mirror: Use job_is_cancelled()
>>>>        mirror: Check job_is_cancelled() earlier
>>>>        mirror: Stop active mirroring after force-cancel
>>>>        mirror: Do not clear .cancelled
>>>>        iotests: Add mirror-ready-cancel-error test
>>>
>>> This fails testing with errors like so:
>>>
>>> Running test test-replication
>>> test-replication: ../job.c:186: job_state_transition: Assertion 
>>> `JobSTT[s0][s1]' failed.
>>> ERROR test-replication - too few tests run (expected 13, got 8)
>>> make: *** [Makefile.mtest:816: run-test-100] Error 1
>>> Cleaning up project directory and file based variables
>>> ERROR: Job failed: exit code 1
>>>
>>> https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures
>>>
>>
>>
>> Interesting :(
>>
>> I've reproduced, starting test-replication in several parallel loops. 
>> (it doesn't reproduce for me if just start in one loop). So, that's 
>> some racy bug..
>>
>> Hmm, and seems it doesn't reproduce so simple on master. I'll try to 
>> bisect the series tomorrow.
>>
>> ====
>>
>> (gdb) bt
>> #0  0x00007f034a3d09d5 in raise () from /lib64/libc.so.6
>> #1  0x00007f034a3b9954 in abort () from /lib64/libc.so.6
>> #2  0x00007f034a3b9789 in __assert_fail_base.cold () from 
>> /lib64/libc.so.6
>> #3  0x00007f034a3c9026 in __assert_fail () from /lib64/libc.so.6
>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, 
>> s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>> #5  0x000055d3b503e7c2 in job_conclude (job=0x55d3b5e67020) at 
>> ../job.c:652
>> #6  0x000055d3b503eaa1 in job_finalize_single (job=0x55d3b5e67020) at 
>> ../job.c:722
>> #7  0x000055d3b503ecd1 in job_completed_txn_abort 
>> (job=0x55d3b5e67020) at ../job.c:801
>> #8  0x000055d3b503f2ea in job_cancel (job=0x55d3b5e67020, 
>> force=false) at ../job.c:973
>> #9  0x000055d3b503f360 in job_cancel_err (job=0x55d3b5e67020, 
>> errp=0x7fffcc997a80) at ../job.c:992
>> #10 0x000055d3b503f576 in job_finish_sync (job=0x55d3b5e67020, 
>> finish=0x55d3b503f33f <job_cancel_err>, errp=0x0) at ../job.c:1054
>> #11 0x000055d3b503f3d0 in job_cancel_sync (job=0x55d3b5e67020, 
>> force=false) at ../job.c:1008
>> #12 0x000055d3b4ff14a3 in replication_close (bs=0x55d3b5e6ef80) at 
>> ../block/replication.c:152
>> #13 0x000055d3b50277fc in bdrv_close (bs=0x55d3b5e6ef80) at 
>> ../block.c:4677
>> #14 0x000055d3b50286cf in bdrv_delete (bs=0x55d3b5e6ef80) at 
>> ../block.c:5100
>> #15 0x000055d3b502ae3a in bdrv_unref (bs=0x55d3b5e6ef80) at 
>> ../block.c:6495
>> #16 0x000055d3b5023a38 in bdrv_root_unref_child 
>> (child=0x55d3b5e4c690) at ../block.c:3010
>> #17 0x000055d3b5047998 in blk_remove_bs (blk=0x55d3b5e73b40) at 
>> ../block/block-backend.c:845
>> #18 0x000055d3b5046e38 in blk_delete (blk=0x55d3b5e73b40) at 
>> ../block/block-backend.c:461
>> #19 0x000055d3b50470dc in blk_unref (blk=0x55d3b5e73b40) at 
>> ../block/block-backend.c:516
>> #20 0x000055d3b4fdb20a in teardown_secondary () at 
>> ../tests/unit/test-replication.c:367
>> #21 0x000055d3b4fdb632 in test_secondary_continuous_replication () at 
>> ../tests/unit/test-replication.c:504
>> #22 0x00007f034b26979e in g_test_run_suite_internal () from 
>> /lib64/libglib-2.0.so.0
>> #23 0x00007f034b26959b in g_test_run_suite_internal () from 
>> /lib64/libglib-2.0.so.0
>> #24 0x00007f034b26959b in g_test_run_suite_internal () from 
>> /lib64/libglib-2.0.so.0
>> #25 0x00007f034b269c8a in g_test_run_suite () from 
>> /lib64/libglib-2.0.so.0
>> #26 0x00007f034b269ca5 in g_test_run () from /lib64/libglib-2.0.so.0
>> #27 0x000055d3b4fdb9c0 in main (argc=1, argv=0x7fffcc998138) at 
>> ../tests/unit/test-replication.c:613
>> (gdb) fr 4
>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, 
>> s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>> 186         assert(JobSTT[s0][s1]);
>> (gdb) list
>> 181         JobStatus s0 = job->status;
>> 182         assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
>> 183         trace_job_state_transition(job, job->ret,
>> 184                                    JobSTT[s0][s1] ? "allowed" : 
>> "disallowed",
>> 185                                    JobStatus_str(s0), 
>> JobStatus_str(s1));
>> 186         assert(JobSTT[s0][s1]);
>> 187         job->status = s1;
>> 188
>> 189         if (!job_is_internal(job) && s1 != s0) {
>> 190             qapi_event_send_job_status_change(job->id, job->status);
>> (gdb) p s0
>> $1 = JOB_STATUS_NULL
>> (gdb) p s1
>> $2 = JOB_STATUS_CONCLUDED
>>
>>
>>
>
>
> bisect points to "job: Add job_cancel_requested()"
>
> And "bisecting" within this commit shows that the following helps:
>
> diff --git a/job.c b/job.c
> index be878ca5fc..bb52a1b58f 100644
> --- a/job.c
> +++ b/job.c
> @@ -655,7 +655,7 @@ static void job_conclude(Job *job)
>
>  static void job_update_rc(Job *job)
>  {
> -    if (!job->ret && job_is_cancelled(job)) {
> +    if (!job->ret && job_cancel_requested(job)) {
>          job->ret = -ECANCELED;
>      }
>      if (job->ret) {
>
>
> - this returns job_update_rc to pre-patch behavior.
>
> But why, I don't know:) More investigation is needed. probably 
> replication code is doing something wrong..

 From what I can tell, this is what happens:

(1) The mirror job completes, we go to job_co_entry(), and schedule 
job_exit().  It doesn’t run yet, though.
(2) replication_close() cancels the job.
(3) We get to job_completed_txn_abort().
(4) The job isn’t completed yet, so we invoke job_finish_sync().
(5) Now job_exit() finally gets to run, and this is how we end up in a 
situation where .cancelled is true, but .force_cancel is false: Yes, 
mirror clears .cancelled before exiting its main loop, but if the job is 
cancelled between it having been deferred to the main loop and 
job_exit() running, it may become true again.
(6) job_exit() leads to job_completed(), which invokes job_update_rc(), 
which however leaves job->ret == 0.
(7) job_completed() also calls job_completed_txn_success(), which is 
weird, because we still have job_completed_txn_abort() running 
concurrently...
(8) job_completed_txn_success() invokes job_do_finalize(), which goes to 
job_finalize_single(), which leaves the job in status null.
(9) job_finish_sync() is done, so we land back in 
job_completed_txn_abort(): We call job_finalize_single(), which tries to 
conclude the job, and that gives us the failed assertion (attempted 
transition from null to concluded).

(When everything works, it seems like the job is completed before 
replication_close() can cancel it.  Cancelling is then a no-op and 
nothing breaks.)

So now we could say the problem is that once a job completes and is 
deferred to the main loop, non-force cancel should do nothing. 
job_cancel_async() should not set job->cancelled to true if `!force && 
job->deferred_to_main_loop`.  job_cancel() should invoke 
job_completed_txn_abort() not if `job->deferred_to_main_loop`, but if 
`job->deferred_to_main_loop && job_is_cancelled(job)`. (Doing this seems 
to fix the bug for me.)

That I think would conform to the reasoning laid out in patch 7’s commit 
message, namely that some functions are called after the job has been 
deferred to the main loop, and because mirror clears .cancelled when it 
has been soft-cancelled, it’d be impossible to observe 
`.deferred_to_main_loop == true && .cancelled == true && 
.force_cancelled == false`.


Or we continue having soft-cancelled jobs still be -ECANCELED, which 
seems like the safe choice?  But it goes against what we’ve decided for 
patch 7, namely that soft-cancelled jobs should be treated like they’d 
complete as normal.

Hanna


