Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF803596BA8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:54:48 +0200 (CEST)
Received: from localhost ([::1]:47284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEp5-0008QC-IR
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOEhh-0004W6-9f
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOEhe-0002ki-22
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660726024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dgaBIAZCIMZNKM7L3ODClQ6VTEKzM5EHOFLUMEWJ/zc=;
 b=MkyGYX/0kOEzDra0y+hLy+khlg7/RfUAw7FRHZPduzZ3+fuli2/xoh7eGSUm6YEv4QY86g
 YSk6Dxa/VYpLOb645xYK7QTZA0FHYDpmoYnouERflKoroTkuDGaV4Mz6N0F2tCYJF+MkNh
 Hyv3BBtbE7kV2cs/aFIro1jiPVRoxWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-Gc0O9wIoNg2pIcWoBXV6vA-1; Wed, 17 Aug 2022 04:47:01 -0400
X-MC-Unique: Gc0O9wIoNg2pIcWoBXV6vA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79A8E811E7A;
 Wed, 17 Aug 2022 08:46:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BC7094585;
 Wed, 17 Aug 2022 08:46:55 +0000 (UTC)
Date: Wed, 17 Aug 2022 10:46:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v10 11/21] jobs: group together API calls under the same
 job lock
Message-ID: <Yvyq/jhJ0B0W6mtF@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-12-eesposit@redhat.com>
 <Yuv9cKJotWg0NEno@redhat.com>
 <1ed3c1c5-8393-2dc8-c930-606b73778a6b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed3c1c5-8393-2dc8-c930-606b73778a6b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Am 16.08.2022 um 16:54 hat Emanuele Giuseppe Esposito geschrieben:
> Am 04/08/2022 um 19:10 schrieb Kevin Wolf:
> > Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> >> Now that the API offers also _locked() functions, take advantage
> >> of it and give also the caller control to take the lock and call
> >> _locked functions.
> >>
> >> This makes sense especially when we have for loops, because it
> >> makes no sense to have:
> >>
> >> for(job = job_next(); ...)
> >>
> >> where each job_next() takes the lock internally.
> >> Instead we want
> >>
> >> JOB_LOCK_GUARD();
> >> for(job = job_next_locked(); ...)
> >>
> >> In addition, protect also direct field accesses, by either creating a
> >> new critical section or widening the existing ones.
> > 
> > "In addition" sounds like it should be a separate patch. I was indeed
> > surprised when after a few for loops where you just pulled the existing
> > locking up a bit, I saw some hunks that add completely new locking.
> 
> Would it be okay if we don't split it in two? There would be two
> microscopical patches.

If it would be just a hunk or two, fair enough.

> >> Note: at this stage, job_{lock/unlock} and job lock guard macros
> >> are *nop*.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> ---
> >>  block.c            | 17 ++++++++++-------
> >>  blockdev.c         | 12 +++++++++---
> >>  blockjob.c         | 35 ++++++++++++++++++++++-------------
> >>  job-qmp.c          |  4 +++-
> >>  job.c              |  7 +++++--
> >>  monitor/qmp-cmds.c |  7 +++++--
> >>  qemu-img.c         | 37 +++++++++++++++++++++----------------
> >>  7 files changed, 75 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/block.c b/block.c
> >> index 2c00dddd80..7559965dbc 100644
> >> --- a/block.c
> >> +++ b/block.c
> >> @@ -4978,8 +4978,8 @@ static void bdrv_close(BlockDriverState *bs)
> >>  
> >>  void bdrv_close_all(void)
> >>  {
> >> -    assert(job_next(NULL) == NULL);
> >>      GLOBAL_STATE_CODE();
> >> +    assert(job_next(NULL) == NULL);
> >>  
> >>      /* Drop references from requests still in flight, such as canceled block
> >>       * jobs whose AIO context has not been polled yet */
> >> @@ -6165,13 +6165,16 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
> >>          }
> >>      }
> >>  
> >> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> >> -        GSList *el;
> >> +    WITH_JOB_LOCK_GUARD() {
> >> +        for (job = block_job_next_locked(NULL); job;
> >> +             job = block_job_next_locked(job)) {
> >> +            GSList *el;
> >>  
> >> -        xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
> >> -                           job->job.id);
> >> -        for (el = job->nodes; el; el = el->next) {
> >> -            xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
> >> +            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
> >> +                                job->job.id);
> >> +            for (el = job->nodes; el; el = el->next) {
> >> +                xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
> >> +            }
> >>          }
> >>      }
> >>  
> >> diff --git a/blockdev.c b/blockdev.c
> >> index 71f793c4ab..5b79093155 100644
> >> --- a/blockdev.c
> >> +++ b/blockdev.c
> >> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
> >>          return;
> >>      }
> >>  
> >> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> >> +    JOB_LOCK_GUARD();
> >> +
> >> +    for (job = block_job_next_locked(NULL); job;
> >> +         job = block_job_next_locked(job)) {
> >>          if (block_job_has_bdrv(job, blk_bs(blk))) {
> > 
> > Should this be renamed to block_job_has_bdrv_locked() now?
> > 
> > It looks to me like it does need the locking. (Which actually makes
> > this patch a fix and not just an optimisation as the commit message
> > suggests.)
> 
> Nope, as GSList *nodes; is always read and written under BQL.

Ah, right. I wonder if we should later take the lock anyway even for
fields where it's not strictly necessary to simplify the locking rules.
Having to check the rules for each field separately is kind of hard. But
let's do only the necessary things in this series.

> > 
> >>              AioContext *aio_context = job->job.aio_context;
> >>              aio_context_acquire(aio_context);
> >>  
> >> -            job_cancel(&job->job, false);
> >> +            job_cancel_locked(&job->job, false);
> >>  
> >>              aio_context_release(aio_context);
> >>          }
> >> @@ -3745,7 +3748,10 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
> >>      BlockJobInfoList *head = NULL, **tail = &head;
> >>      BlockJob *job;
> >>  
> >> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> >> +    JOB_LOCK_GUARD();
> >> +
> >> +    for (job = block_job_next_locked(NULL); job;
> >> +         job = block_job_next_locked(job)) {
> >>          BlockJobInfo *value;
> >>          AioContext *aio_context;
> > 
> > More context:
> > 
> >         BlockJobInfo *value;
> >         AioContext *aio_context;
> > 
> >         if (block_job_is_internal(job)) {
> >             continue;
> >         }
> >         aio_context = block_job_get_aio_context(job);
> >         aio_context_acquire(aio_context);
> >         value = block_job_query(job, errp);
> >         aio_context_release(aio_context);
> > 
> > This should become block_job_query_locked(). (You do that in patch 18,
> > but it looks a bit out of place there - which is precisely because it
> > really belongs in this one.)
> 
> Ok
> > 
> >> diff --git a/blockjob.c b/blockjob.c
> >> index 0d59aba439..96fb9d9f73 100644
> >> --- a/blockjob.c
> >> +++ b/blockjob.c
> >> @@ -111,8 +111,10 @@ static bool child_job_drained_poll(BdrvChild *c)
> >>      /* An inactive or completed job doesn't have any pending requests. Jobs
> >>       * with !job->busy are either already paused or have a pause point after
> >>       * being reentered, so no job driver code will run before they pause. */
> >> -    if (!job->busy || job_is_completed(job)) {
> >> -        return false;
> >> +    WITH_JOB_LOCK_GUARD() {
> >> +        if (!job->busy || job_is_completed_locked(job)) {
> >> +            return false;
> >> +        }
> >>      }
> >>  
> >>      /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
> > 
> > Assuming that the job status can actually change, don't we need the
> > locking for the rest of the function, too? Otherwise we might call
> > drv->drained_poll() for a job that has already paused or completed.
> > 
> > Of course, this goes against the assumption that all callbacks are
> > called without holding the job lock. Maybe it's not a good assumption.
> > 
> >> @@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
> >>      job->ready_notifier.notify = block_job_event_ready;
> >>      job->idle_notifier.notify = block_job_on_idle;
> >>  
> >> -    notifier_list_add(&job->job.on_finalize_cancelled,
> >> -                      &job->finalize_cancelled_notifier);
> >> -    notifier_list_add(&job->job.on_finalize_completed,
> >> -                      &job->finalize_completed_notifier);
> >> -    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> >> -    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> >> -    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> >> +    WITH_JOB_LOCK_GUARD() {
> >> +        notifier_list_add(&job->job.on_finalize_cancelled,
> >> +                          &job->finalize_cancelled_notifier);
> >> +        notifier_list_add(&job->job.on_finalize_completed,
> >> +                          &job->finalize_completed_notifier);
> >> +        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> >> +        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> >> +        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> >> +    }
> >>  
> >>      error_setg(&job->blocker, "block device is in use by block job: %s",
> >>                 job_type_str(&job->job));
> > 
> > Why is this the right scope for the lock? It looks very arbitrary to
> > lock only here, but not for the assignments above or the function calls
> > below.
> > 
> > Given that job_create() already puts the job in the job_list so it
> > becomes visible for other code, should we not keep the job lock from the
> > moment that we create the job until it is fully initialised?
> 
> I try to protect only what needs protection, nothing more. Otherwise
> then it is not clear what are we protecting and why. According to the
> split I made in job.h, things like job_type_str and whatever I did not
> protect are not protected because they don't need the lock.

I think the last paragraph above explains what it would protect?

Having a half-initialised job in the job list without holding the lock
sounds dangerous to me. Maybe it's actually okay in practice because
this is GLOBAL_STATE_CODE() and we can assume that code accessing
the job list outside of the main thread probably skips over the
half-initialised job, but it's another case where relying on the BQL is
confusing when there would be a more specific lock for it.

> > 
> >> @@ -558,10 +562,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
> >>                                          action);
> >>      }
> >>      if (action == BLOCK_ERROR_ACTION_STOP) {
> >> -        if (!job->job.user_paused) {
> >> -            job_pause(&job->job);
> >> -            /* make the pause user visible, which will be resumed from QMP. */
> >> -            job->job.user_paused = true;
> >> +        WITH_JOB_LOCK_GUARD() {
> >> +            if (!job->job.user_paused) {
> >> +                job_pause_locked(&job->job);
> >> +                /*
> >> +                 * make the pause user visible, which will be
> >> +                 * resumed from QMP.
> >> +                 */
> >> +                job->job.user_paused = true;
> >> +            }
> >>          }
> >>          block_job_iostatus_set_err(job, error);
> > 
> > Why is this call not in the critical section? It accesses job->iostatus.
> 
> But the blockjob is not yet "classified". Comes after.

Ok.

Kevin


