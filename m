Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F492359943
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:32:47 +0200 (CEST)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnVO-0005Yv-9B
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUnUR-00053H-NA
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUnUO-0008Fw-Ow
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617960703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQ1buO3MqXqTn0KQM2/c5t9ocUHUWiFzIi4bSOSfiF8=;
 b=SPZ3C0W6YgHC/cdxEjrBzXCpWSMPatWjiwkEA/Z7hX6RU1Q527pABZzb0rolIZAr60ZOt+
 G0p1wRCq5j5zr1U30wfmDOox7vabR4a3nWhA3KxGtY1YP7bYpSekID2iaQdmUj4NXbMo+d
 Ac8Oyd/Uy4ZsSEZbkEbcu8xd+1UhllA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-xy-uL6XwOtuiDFfth1UX4g-1; Fri, 09 Apr 2021 05:31:40 -0400
X-MC-Unique: xy-uL6XwOtuiDFfth1UX4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBFF48143F0;
 Fri,  9 Apr 2021 09:31:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-67.ams2.redhat.com
 [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84AE21B400;
 Fri,  9 Apr 2021 09:31:37 +0000 (UTC)
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <f9827dc5-d154-8995-e505-3481fa3e482f@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a043ce77-2d6f-dd80-ac21-2dd78539221b@redhat.com>
Date: Fri, 9 Apr 2021 11:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f9827dc5-d154-8995-e505-3481fa3e482f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.04.21 18:55, John Snow wrote:
> On 4/8/21 12:20 PM, Max Reitz wrote:
>> block-job-complete can only be applied when the job is READY, not when
>> it is on STANDBY (ready, but paused).  Draining a job technically pauses
>> it (which makes a READY job enter STANDBY), and ending the drained
>> section does not synchronously resume it, but only schedules the job,
>> which will then be resumed.  So attempting to complete a job immediately
>> after a drained section may sometimes fail.
>>
>> That is bad at least because users cannot really work nicely around
>> this: A job may be paused and resumed at any time, so waiting for the
>> job to be in the READY state and then issuing a block-job-complete poses
>> a TOCTTOU problem.  The only way around it would be to issue
>> block-job-complete until it no longer fails due to the job being in the
>> STANDBY state, but that would not be nice.
>>
>> We can solve the problem by allowing block-job-complete to be invoked on
>> jobs that are on STANDBY, if that status is the result of a drained
>> section (not because the user has paused the job), and that section has
>> ended.  That is, if the job is on STANDBY, but scheduled to be resumed.
>>
>> Perhaps we could actually just directly allow this, seeing that mirror
>> is the only user of ready/complete, and that mirror_complete() could
>> probably work under the given circumstances, but there may be many side
>> effects to consider.
>>
>> It is simpler to add a function job_wait_unpaused() that waits for the
>> job to be resumed (under said circumstances), and to make
>> qmp_block_job_complete() use it to delay job_complete() until then.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1945635
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/qemu/job.h | 15 +++++++++++++++
>>   blockdev.c         |  3 +++
>>   job.c              | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 60 insertions(+)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index efc6fa7544..cf3082b6d7 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -563,4 +563,19 @@ void job_dismiss(Job **job, Error **errp);
>>    */
>>   int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), 
>> Error **errp);
>> +/**
>> + * If the job has been paused because of a drained section, and that
>> + * section has ended, wait until the job is resumed.
>> + *
>> + * Return 0 if the job is not paused, or if it has been successfully
>> + * resumed.
>> + * Return an error if the job has been paused in such a way that
>> + * waiting will not resume it, i.e. if it has been paused by the user,
>> + * or if it is still drained.
>> + *
>> + * Callers must be in the home AioContext and hold the AioContext lock
>> + * of job->aio_context.
>> + */
>> +int job_wait_unpaused(Job *job, Error **errp);
>> +
>>   #endif
>> diff --git a/blockdev.c b/blockdev.c
>> index a57590aae4..c0cc2fa364 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -3414,6 +3414,9 @@ void qmp_block_job_complete(const char *device, 
>> Error **errp)
>>           return;
>>       }
>> +    if (job_wait_unpaused(&job->job, errp) < 0) {
>> +        return;
>> +    }
> 
> After which point, we assume we've transitioned back to either RUNNING 
> or READY, and
> 
>>       trace_qmp_block_job_complete(job);
>>       job_complete(&job->job, errp);
> 
> This function checks the usual state table for permission to 
> deliver/perform the verb.
> 
>>       aio_context_release(aio_context);
>> diff --git a/job.c b/job.c
>> index 289edee143..1ea30fd294 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -1023,3 +1023,45 @@ int job_finish_sync(Job *job, void 
>> (*finish)(Job *, Error **errp), Error **errp)
>>       job_unref(job);
>>       return ret;
>>   }
>> +
>> +int job_wait_unpaused(Job *job, Error **errp)
>> +{
>> +    /*
>> +     * Only run this function from the main context, because this is
>> +     * what we need, and this way we do not have to think about what
>> +     * happens if the user concurrently pauses the job from the main
>> +     * monitor.
>> +     */
>> +    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>> +
>> +    /*
>> +     * Quick path (e.g. so we do not get an error if pause_count > 0
>> +     * but the job is not even paused)
>> +     */
>> +    if (!job->paused) {
>> +        return 0;
>> +    }
>> +
>> +    /* If the user has paused the job, waiting will not help */
>> +    if (job->user_paused) {
>> +        error_setg(errp, "Job '%s' has been paused by the user", 
>> job->id);
>> +        return -EBUSY;
>> +    }
>> +
> 
> Or the job has encountered an error if that error policy is set. It is 
> maybe more accurate to say that the job is currently paused/halted (for 
> some reason) and is awaiting the explicit unpause instruction.
> 
> "Job '%s' has been paused and needs to be explicitly resumed with 
> job-resume", maybe?
> 
> Job '%s' has been paused and needs to be [explicitly] resumed
> [by the user] [with job-resume]
> 
> Some combo of those runes.

Sounds good.  I think I’ll go for “Job '%s' has been paused and needs to 
be explicitly resumed”.

>> +    /* Similarly, if the job is still drained, waiting will not help 
>> either */
>> +    if (job->pause_count > 0) {
>> +        error_setg(errp, "Job '%s' is blocked and cannot be 
>> unpaused", job->id);
>> +        return -EBUSY;
>> +    }
>> +
> 
> This leaks an internal state detail out to the caller. In which 
> circumstances does this happen?

Hm.  Now that you ask it.

The circumstance would be a concurrent drain in some other IO thread. 
Probably the IO thread the job runs in?  I don’t know any other thread 
that could concurrently drain, because this function runs in the main 
thread, and there shouldn’t be any drain in the background.

If it is another IO thread, waiting would indeed help, so there would 
not be a need to error out.

Perhaps it’s possible to have a background drain in the main thread?  I 
don’t think so, though...

> Do we expect it to?

I can’t say I do.

> As the user: Why is it blocked? Can I unblock it? Do I wait?

Waiting would be the strategy.

Perhaps we should bite the bullet, drop the condition and indeed just 
wait regardless of pause_count.

>> +    /*
>> +     * This function is specifically for waiting for a job to be
>> +     * resumed after a drained section.  Ending the drained section
>> +     * includes a job_enter(), which schedules the job loop to be run,
>> +     * and once it does, job->paused will be cleared.  Therefore, we
>> +     * do not need to invoke job_enter() here.
>> +     */
>> +    AIO_WAIT_WHILE(job->aio_context, job->paused);
>> +
>> +    return 0;
>> +}
>>
> 
> Looks about right to me, but you'll want Kevin's look-see for the finer 
> details, of course.
> 
> My concern is that this adds a wait of an indefinite period to the 
> job_complete command. We mitigate this by checking for some other 
> internal state criteria first, and then by process of elimination deduce 
> that it's safe to wait, as it will (likely) be very quick.
> 
> Do we open the door for ourselves to get into trouble here, either by a 
> state we are forgetting to rule out (You'd have added it if you know the 
> answer to this) or a hypothetical future change where we forget to 
> update this function?

Well.  Who knows.

The alternatives I see are:

(A) Let drained_end wait for the block jobs to be resumed.  There are 
some details to consider there, I had some discussion around this with 
Kevin on Tuesday.  For example, should every drained_end wait for all 
jobs involved to be resumed?  (That would mean waiting for concurrent 
drained_ends, too.)  Would the drained_end_counter be the right tool for 
the job?  (None of this is unsolvable, I guess, but it would mean having 
another discussion.)
It would also mean that you basically just move the wait to wherever the 
drained_end occurs, for example to qmp_transaction().  Now, every 
drained_end is preceded by a drained_begin that always has to wait, so 
it probably isn’t bad.  OTOH, if qmp_transaction() would be allowed to 
wait for a job to be resumed, I think we can allow the same for 
qmp_block_job_complete().
(And there’s the fact that most of the time not having the block job 
running after drained_end poses no problem.  This is the first time I’m 
aware of a problem, so I think it would be preferable to wait only on 
the rare occasion where we have to.)

(B) Have block-job-complete be kind of asynchronous.  We talked about 
that on IRC yesterday, and the main problem seems to be that we don’t 
know what we’d do with errors.  We could only emit them via an event, or 
let the whole job fail, both of which seem like bad solutions.

(C) Perhaps mirror’s completion function works just fine when the job is 
paused (we just would have to skip the job_enter()).  I don’t know. 
Someone™ would need to find out.


So I can’t see (B) working, (A) is a bit of an ant’s nest that I don’t 
want to poke too much (and for the problem at hand, I don’t think it 
would be a better solution, because it would make us wait on every 
drained_end instead of only when there is a real conflict).  (C) might 
be nice, but it has the potential of giving headaches.


I can’t see future changes posing a problem, but that’s kind of the 
problem with future changes.

> Not necessarily a blocker, I think, and this does solve a real problem 
> fairly inexpensively.
> 
> 
> On good faith that you understand the synchronicity issues here better 
> than I do:

I should let you know that faith is probably misplaced.

> Reviewed-by: John Snow <jsnow@redhat.com>

Well, er, thanks?  I don’t know if I can take this now. O:)

Max


