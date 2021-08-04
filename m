Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF53DFF02
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:07:13 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDns-0003MC-6T
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBDWM-0001bI-5z
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mBDWK-0005mS-FO
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628070541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctBx/d3Ka+3unEVznh9Lnu5Nd8oejj0Uvq745aZHmm0=;
 b=Ia7lE4XioPl2wQ9pI8RFW5iqLk3omqEPQqVPQrt7aAF9wf/gNYY8V/+vqN1vbPZYaN0X23
 0Whw9IjTzQCepTlJTPdOaTm224NdOgoq2Touixnnrry6h3RLdEtk+Y3PH5cXmAWxO6P7WM
 OsWr4tDkUGUPmLw2fjJzIzCN5Fw/ewM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-07f9znszOEmEMEOjTezcQA-1; Wed, 04 Aug 2021 05:48:57 -0400
X-MC-Unique: 07f9znszOEmEMEOjTezcQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACE98192FDA1;
 Wed,  4 Aug 2021 09:48:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93CA419C44;
 Wed,  4 Aug 2021 09:48:55 +0000 (UTC)
Date: Wed, 4 Aug 2021 11:48:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
Message-ID: <YQpihpmOeswUGSlh@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com>
 <YQlT4rO9OoykGl/b@redhat.com>
 <cbf2f3c8-6e7a-b277-f90a-483699828b6f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cbf2f3c8-6e7a-b277-f90a-483699828b6f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.08.2021 um 10:25 hat Max Reitz geschrieben:
> On 03.08.21 16:34, Kevin Wolf wrote:
> > Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
> > > We must check whether the job is force-cancelled early in our main loop,
> > > most importantly before any `continue` statement.  For example, we used
> > > to have `continue`s before our current checking location that are
> > > triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
> > > failing, force-cancelling the job would not terminate it.
> > > 
> > > A job being force-cancelled should be treated the same as the job having
> > > failed, so put the check in the same place where we check `s->ret < 0`.
> > > 
> > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > ---
> > >   block/mirror.c | 7 +------
> > >   1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/block/mirror.c b/block/mirror.c
> > > index 72e02fa34e..46d1a1e5a2 100644
> > > --- a/block/mirror.c
> > > +++ b/block/mirror.c
> > > @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
> > >               mirror_wait_for_any_operation(s, true);
> > >           }
> > > -        if (s->ret < 0) {
> > > +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
> > >               ret = s->ret;
> > >               goto immediate_exit;
> > >           }
> > > @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
> > >               break;
> > >           }
> > > -        ret = 0;
> > > -
> > >           if (job_is_ready(&s->common.job) && !should_complete) {
> > >               delay_ns = (s->in_flight == 0 &&
> > >                           cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
> > > @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
> > >           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
> > >                                     delay_ns);
> > >           job_sleep_ns(&s->common.job, delay_ns);
> > > -        if (job_is_cancelled(&s->common.job)) {
> > > -            break;
> > > -        }
> > I think it was intentional that the check is here because it means
> > skipping the job_sleep_ns() and instead cancelling immediately, and we
> > probably still want that. Between your check above and here, the
> > coroutine can yield, so cancellation could have been newly requested.
> 
> I’m afraid I don’t quite understand.

Hm, I don't either. Somehow I thought job_sleep_ns() was after the
check, while quoting the exact hunk that shows that it comes before
it...

I'm still not sure if sleeping before exiting is really useful, but it
seems we never cared about that.

Kevin


