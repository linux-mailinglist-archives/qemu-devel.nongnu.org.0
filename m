Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6F596B78
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:39:32 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEaJ-00068p-6I
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOEVX-0003JG-OV
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOEVT-0005PU-VG
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660725270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wplYt7eBJVUtIkrROSaHUAJQYrZAGjjYZ8Jl+gLAd0I=;
 b=StwX1xpyYga2PqRM2H7dkHzOSPj42/aKhOM9uz1cIeGjGduAmUybKGXNkT9E7joBDb7ppG
 sbfGD1XUHqrqcI5tAFGoL+G2NKl3sj24kA/6VbUPzLJhBWFJ6xYdb+jan5lrRPAa9bqRyy
 eCxPQGl+qrAeMeTxWnwg7hUXewT/hhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-4Dg2tFy9NVe_AsZD8uyQ2Q-1; Wed, 17 Aug 2022 04:34:26 -0400
X-MC-Unique: 4Dg2tFy9NVe_AsZD8uyQ2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BB1E1019CA1;
 Wed, 17 Aug 2022 08:34:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E2640CFD0A;
 Wed, 17 Aug 2022 08:34:23 +0000 (UTC)
Date: Wed, 17 Aug 2022 10:34:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 13/21] job: detect change of aiocontext within job
 coroutine
Message-ID: <YvyoDpWPINx6IwPu@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-14-eesposit@redhat.com>
 <YuzWy1wQPf6HXl+0@redhat.com>
 <85f03feb-0502-b32d-9bdf-f3239d759c87@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f03feb-0502-b32d-9bdf-f3239d759c87@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 16.08.2022 um 17:09 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 05/08/2022 um 10:37 schrieb Kevin Wolf:
> > Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> >> From: Paolo Bonzini <pbonzini@redhat.com>
> >>
> >> We want to make sure access of job->aio_context is always done
> >> under either BQL or job_mutex.
> > 
> > Is this the goal of this series? If so, it would have been useful to
> > state somewhere more obvious, because I had assumed that holding the BQL
> > would not be considered enough, but everyone needs to hold the job_mutex.
> 
> It is the goal for this patch :)
> The whole job API can't rely on BQL since there are coroutines running
> in another aiocontext.

Yes, as I saw in patch 14, which describes the goal more clearly in the
commit message and also adds the corresponding documentation to
Job.aio_context. Maybe it would have been clearer if the documentation
were already in this patch.

> >> The problem is that using
> >> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
> >> makes the coroutine immediately resume, so we can't hold the job lock.
> >> And caching it is not safe either, as it might change.
> >>
> >> job_start is under BQL, so it can freely read job->aiocontext, but
> >> job_enter_cond is not. In order to fix this, use aio_co_wake():
> >> the advantage is that it won't use job->aiocontext, but the
> >> main disadvantage is that it won't be able to detect a change of
> >> job AioContext.
> >>
> >> Calling bdrv_try_set_aio_context() will issue the following calls
> >> (simplified):
> >> * in terms of  bdrv callbacks:
> >>   .drained_begin -> .set_aio_context -> .drained_end
> >> * in terms of child_job functions:
> >>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
> >> * in terms of job functions:
> >>   job_pause_locked -> job_set_aio_context -> job_resume_locked
> >>
> >> We can see that after setting the new aio_context, job_resume_locked
> >> calls again job_enter_cond, which then invokes aio_co_wake(). But
> >> while job->aiocontext has been set in job_set_aio_context,
> >> job->co->ctx has not changed, so the coroutine would be entering in
> >> the wrong aiocontext.
> >>
> >> Using aio_co_schedule in job_resume_locked() might seem as a valid
> >> alternative, but the problem is that the bh resuming the coroutine
> >> is not scheduled immediately, and if in the meanwhile another
> >> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
> >> test-block-iothread.c), we would have the first schedule in the
> >> wrong aiocontext, and the second set of drains won't even manage
> >> to schedule the coroutine, as job->busy would still be true from
> >> the previous job_resume_locked().
> >>
> >> The solution is to stick with aio_co_wake(), but then detect every time
> >> the coroutine resumes back from yielding if job->aio_context
> >> has changed. If so, we can reschedule it to the new context.
> > 
> > Hm, but with this in place, what does aio_co_wake() actually buy us
> > compared to aio_co_enter()?
> > 
> > I guess it's a bit simpler code because you don't have to explicitly
> > specify the AioContext, but we're still going to enter the coroutine in
> > the wrong AioContext occasionally and have to reschedule it, just like
> > in the existing code (except that the rescheduling doesn't exist there
> > yet).
> > 
> > So while I don't disagree with the change, I don't think the
> > justification in the commit message is right for this part.
> 
> What do you suggest to change?

The commit message shouldn't pretend that aio_co_wake() solves the
problem (it says "In order to fix this, use aio_co_wake"), even if
that's what you thought at first before you saw that the problem wasn't
fully fixed by it.

I would move the real solution up in the commit message ("In order to
fix this, detect every time..."), and then maybe mention why
aio_co_wake() doesn't solve the problem, but you're leaving it in anyway
because it's nicer than the previous sequence or something like that.

> >> Check for the aiocontext change in job_do_yield_locked because:
> >> 1) aio_co_reschedule_self requires to be in the running coroutine
> >> 2) since child_job_set_aio_context allows changing the aiocontext only
> >>    while the job is paused, this is the exact place where the coroutine
> >>    resumes, before running JobDriver's code.
> >>
> >> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> >> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Kevin


