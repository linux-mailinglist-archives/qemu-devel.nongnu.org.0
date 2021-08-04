Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB843DFF71
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:35:46 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBEFU-0005eh-Ml
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBEEX-0004m7-0u
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBEET-0001jl-VZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 06:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628073280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rc5R40qMNaqwSHw+ah/lPhCRYRtytfnN9s0lVEzX9hI=;
 b=hcaW/fFWbKFTLLSv7LI7pY4cO9XEzyfXFa+53vZtxEf+S82cx2qxJ4aIDOtAVrkw+MKu+U
 o2fH01VwgI8Axgz5cOC9UsbIu2tdRPCWC3fkqwgrxCiyBo+aPeFSCZU3oFMsP58USgWnw9
 +sVH07w4xQ3+cpL7QyQsDD0eJg6grx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-VLVsb-hIPnisuX8H28jXCw-1; Wed, 04 Aug 2021 06:34:39 -0400
X-MC-Unique: VLVsb-hIPnisuX8H28jXCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E92CC73A0;
 Wed,  4 Aug 2021 10:34:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCBB5F724;
 Wed,  4 Aug 2021 10:34:32 +0000 (UTC)
Date: Wed, 4 Aug 2021 12:34:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
Message-ID: <YQptN0CLpV5MN5kb@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <YQlRzOzXOxeBLb0B@redhat.com>
 <13d07f4b-9659-4576-1757-a7d75f7e16c2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <13d07f4b-9659-4576-1757-a7d75f7e16c2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 pkrempa@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Peter, the question for you is at the end. ]

Am 04.08.2021 um 10:07 hat Max Reitz geschrieben:
> On 03.08.21 16:25, Kevin Wolf wrote:
> > Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
> > > Most callers of job_is_cancelled() actually want to know whether the job
> > > is on its way to immediate termination.  For example, we refuse to pause
> > > jobs that are cancelled; but this only makes sense for jobs that are
> > > really actually cancelled.
> > > 
> > > A mirror job that is cancelled during READY with force=false should
> > > absolutely be allowed to pause.  This "cancellation" (which is actually
> > > a kind of completion) may take an indefinite amount of time, and so
> > > should behave like any job during normal operation.  For example, with
> > > on-target-error=stop, the job should stop on write errors.  (In
> > > contrast, force-cancelled jobs should not get write errors, as they
> > > should just terminate and not do further I/O.)
> > > 
> > > Therefore, redefine job_is_cancelled() to only return true for jobs that
> > > are force-cancelled (which as of HEAD^ means any job that interprets the
> > > cancellation request as a request for immediate termination), and add
> > > job_cancel_request() as the general variant, which returns true for any
> > > jobs which have been requested to be cancelled, whether it be
> > > immediately or after an arbitrarily long completion phase.
> > > 
> > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > ---
> > >   include/qemu/job.h |  8 +++++++-
> > >   block/mirror.c     | 10 ++++------
> > >   job.c              |  7 ++++++-
> > >   3 files changed, 17 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/include/qemu/job.h b/include/qemu/job.h
> > > index 8aa90f7395..032edf3c5f 100644
> > > --- a/include/qemu/job.h
> > > +++ b/include/qemu/job.h
> > > @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
> > >   /** Returns true if the job should not be visible to the management layer. */
> > >   bool job_is_internal(Job *job);
> > > -/** Returns whether the job is scheduled for cancellation. */
> > > +/** Returns whether the job is being cancelled. */
> > >   bool job_is_cancelled(Job *job);
> > > +/**
> > > + * Returns whether the job is scheduled for cancellation (at an
> > > + * indefinite point).
> > > + */
> > > +bool job_cancel_requested(Job *job);
> > I don't think non-force blockdev-cancel for mirror should actually be
> > considered cancellation, so what is the question that this function
> > answers?
> > 
> > "Is this a cancelled job, or a mirror block job that is supposed to
> > complete soon, but only if it doesn't switch over the users to the
> > target on completion"?
> 
> Well, technically yes, but it was more intended as “Has the user ever
> invoked (block-)job-cancel on this job?”.

I understand this, but is this much more useful to know than "Has the
user ever called HMP 'change'?", if you know what I mean?

> > Is this ever a reasonable question to ask, except maybe inside the
> > mirror implementation itself?
> 
> I asked myself the same for v3, but found two places in job.c where I
> would like to keep it:
> 
> First, there’s an assertion in job_completed_txn_abort().  All jobs
> other than @job have been force-cancelled, and so job_is_cancelled()
> would be true for them.  As for @job itself, the function is mostly
> called when the job’s return value is not 0, but a soft-cancelled
> mirror does have a return value of 0 and so would not end up in that
> function.
> But job_cancel() invokes job_completed_txn_abort() if the job has been
> deferred to the main loop, which mostly correlates with the job having
> been completed (in which case the assertion is skipped), but not 100 %
> (there’s a small window between setting deferred_to_main_loop and the
> job changing to a completed state).
> So I’d prefer to keep the assertion as-is functionally, i.e. to only
> check job->cancelled.

Well, you don't. It's still job_is_cancelled() after this patch.

So the scenario you're concerned about is a job that has just finished
successfully (job->ret = 0) and then gets a cancel request?

With force=false, I'm pretty sure the code is wrong anyway because
calling job_completed_txn_abort() is not the right response. It should
return an error because you're trying to complete twice, possibly with
conflicting completion modes. Second best is just ignoring the cancel
request because we obviously already fulfilled the request of completing
the job (the completion mode might be different, though).

With force=true, arguably still letting the job fail is correct.
However, letting it fail involves more than just letting the transaction
fail. We would have to call job_update_rc() as well so that instead of
reporting success for the job, ECANCELED is returned and the job
transitions to JOB_STATUS_ABORTING (after which job_is_completed()
returns true).

So, just bugs to be fixed.

After this, I think we could even assert(job->ret != 0 ||
job->status == JOB_STATUS_PENDING) in job_completed_txn_abort().
ret == 0 can only happen when called from job_do_finalize(), when the
job is only failing because other jobs in the same transaction have
failed in their .prepare callback.

> Second, job_complete() refuses to let a job complete that has been
> cancelled.  This function is basically only invoked by the user
> (through qmp_block_job_complete()/qmp_job_complete(), or
> job_complete_sync(), which comes from qemu-img), so I believe that it
> should correspond to the external interface we have right now; i.e.,
> if the user has invoked (block-)job-cancel at one point,
> job_complete() should generally return an error.

True. But it should also return an error if the user has invoked
job-complete at some point. The distinction between complete and
non-force cancel doesn't make sense there.

And cancelling with force=false should fail, too, when either job-cancel
or job-complete was called for the job before.

> > job_complete() is the only function outside of mirror that seems to use
> > it. But even there, it feels wrong to make a difference. Either we
> > accept redundant completion requests, or we don't. It doesn't really
> > matter how the job reconfigures the graph on completion. (Also, I feel
> > this should really have been part of the state machine, but I'm not sure
> > if we want to touch it now...)
> 
> Well, yes, I don’t think it makes a difference because I don’t think
> anyone will first tell the job via block-job-cancel to complete
> without pivoting, and then change their mind and call
> block-job-complete after all.  (Not least because that’s an error
> pre-series.)

Right, I'm just arguing that we shouldn't allow the opposite order
either. Currently I think we do, and it's buggy, as explained above.

> Also, I’m not even sure whether completing after a soft cancel request
> works.  I don’t think any of our code accounts for such a case, so I’d
> rather avoid allowing it if there’s no need to allow it anyway.

Yes, definitely avoid it. We should allow only one completion request
(be it with job-complete or block-job-cancel) and return an error for
all future completion requests for the same job.

We could in theory keep allowing redundant completion requests when the
completion mode doesn't conflict, but I don't see the point of that.

Unless libvirt can actually issue multiple completion requests (again,
this includes both (block-)job-complete and non-force block-job-cancel
for mirror) for the same block job - Peter, I hope it doesn't?

Kevin


