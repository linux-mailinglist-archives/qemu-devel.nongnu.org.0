Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8F359BCF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:19:17 +0200 (CEST)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoEO-0000u7-6Z
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUoD1-0000L9-KR
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUoCz-0002L6-NK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617963468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9BnOuuybkl0tot4kLuqpEzdzkOGKE+9CtPHdJ24ISc=;
 b=PRwsYb3zz7aJ+o2gUWjNFn1l/JjFMtD8ZuRkmPMNgN5Z16Of6QtjHdcwYDllvIeJOcrSlb
 6SwWa4KbMPTaGq95/CG4w/loQOfDMYuJevkLfRQFZTHfcSi+eABMnmASRzrzh1UqluMXdC
 R+WQm91AHRik8U+jizuBaM62iMpKG5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-lF7gJD9uNS-YTaCNQvirZw-1; Fri, 09 Apr 2021 06:17:47 -0400
X-MC-Unique: lF7gJD9uNS-YTaCNQvirZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0CB1020C22;
 Fri,  9 Apr 2021 10:17:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE27D5C3E0;
 Fri,  9 Apr 2021 10:17:44 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:17:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
Message-ID: <YHApxxGsM69c8zKo@merkur.fritz.box>
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <f9827dc5-d154-8995-e505-3481fa3e482f@redhat.com>
 <a043ce77-2d6f-dd80-ac21-2dd78539221b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a043ce77-2d6f-dd80-ac21-2dd78539221b@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2021 um 11:31 hat Max Reitz geschrieben:
> On 08.04.21 18:55, John Snow wrote:
> > On 4/8/21 12:20 PM, Max Reitz wrote:
> > > +    /* Similarly, if the job is still drained, waiting will not
> > > help either */
> > > +    if (job->pause_count > 0) {
> > > +        error_setg(errp, "Job '%s' is blocked and cannot be
> > > unpaused", job->id);
> > > +        return -EBUSY;
> > > +    }
> > > +
> > 
> > This leaks an internal state detail out to the caller. In which
> > circumstances does this happen?
> 
> Hm.  Now that you ask it.
> 
> The circumstance would be a concurrent drain in some other IO thread.
> Probably the IO thread the job runs in?  I don’t know any other thread that
> could concurrently drain, because this function runs in the main thread, and
> there shouldn’t be any drain in the background.
> 
> If it is another IO thread, waiting would indeed help, so there would not be
> a need to error out.
> 
> Perhaps it’s possible to have a background drain in the main thread?  I
> don’t think so, though...

Hm... Maybe like this:

1. bdrv_do_drained_begin() in the main thread
2. BDRV_POLL_WHILE() reenters the QMP dispatcher coroutine
3. qmp_job_complete()
4. Deadlock because we poll here until the job is undrained

This is why nested event loops are evil...

I guess a way to fix this would be making qmp_job_complete() a coroutine
handler and yielding instead of actively polling. Then job_pause_point()
would have to wake the waiting coroutine rather than calling
aio_wait_kick().

On the other hand, this fix would be a lot more complex for -rc3 than
what you posted here.

So maybe take this one for -rc3 and do the coroutine thing for 6.1?

> > Looks about right to me, but you'll want Kevin's look-see for the finer
> > details, of course.
> > 
> > My concern is that this adds a wait of an indefinite period to the
> > job_complete command. We mitigate this by checking for some other
> > internal state criteria first, and then by process of elimination deduce
> > that it's safe to wait, as it will (likely) be very quick.
> > 
> > Do we open the door for ourselves to get into trouble here, either by a
> > state we are forgetting to rule out (You'd have added it if you know the
> > answer to this) or a hypothetical future change where we forget to
> > update this function?
> 
> Well.  Who knows.
> 
> The alternatives I see are:
> 
> (A) Let drained_end wait for the block jobs to be resumed.  There are some
> details to consider there, I had some discussion around this with Kevin on
> Tuesday.  For example, should every drained_end wait for all jobs involved
> to be resumed?  (That would mean waiting for concurrent drained_ends, too.)
> Would the drained_end_counter be the right tool for the job?  (None of this
> is unsolvable, I guess, but it would mean having another discussion.)

The advantage there would be that you don't have to deal with new nested
event loops.

I think the problem you brought up was that we can't wait for the job
resuming if it is at the same time paused externally. But we could just
check that and not increase the drained_end_counter in this case.

This would probably result in a fix that is simple enough for -rc3.

> It would also mean that you basically just move the wait to wherever the
> drained_end occurs, for example to qmp_transaction().  Now, every
> drained_end is preceded by a drained_begin that always has to wait, so it
> probably isn’t bad.  OTOH, if qmp_transaction() would be allowed to wait for
> a job to be resumed, I think we can allow the same for
> qmp_block_job_complete().
> (And there’s the fact that most of the time not having the block job running
> after drained_end poses no problem.  This is the first time I’m aware of a
> problem, so I think it would be preferable to wait only on the rare occasion
> where we have to.)

Yeah, I can see your point, but on the other hand, waiting in
drained_end until we can be sure that the effect of drained_begin has
been undone is a single place that covers all occasions.

I'm not overly confident that we would catch all occasions where we have
to if we try attacking them one by one. As you noticed, this is not some
simple case where things just fail all the time when you get it wrong,
but results in race conditions that are hard to reproduce.

> (B) Have block-job-complete be kind of asynchronous.  We talked about that
> on IRC yesterday, and the main problem seems to be that we don’t know what
> we’d do with errors.  We could only emit them via an event, or let the whole
> job fail, both of which seem like bad solutions.

I guess my suggestion to make it a coroutine QMP handlers is similar,
except that it blocks QMP, so you could still deliver an error.

On the other hand, this wouldn't be able to address the concern that we
might be waiting for too long (but I'm not convinced that this is a
problem anyway).

> (C) Perhaps mirror’s completion function works just fine when the job is
> paused (we just would have to skip the job_enter()).  I don’t know. Someone™
> would need to find out.

Who knows. Apart from Someone™, of course.

Kevin


