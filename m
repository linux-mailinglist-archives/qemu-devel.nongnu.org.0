Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75D3DF047
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:28:11 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvOt-0005u2-1R
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvMC-00081R-5x
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvM9-0001Fq-Gs
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aemI1GdFWv9dfT8mhU27IANo6bvC0yu6VSAfW4Tgfbg=;
 b=XT9Gt7W9jhntPaypXXazSBl+VuaRa2XN8oU5cQK2rhPU1yMDtL9owq23WXljZpNb2Q5rIw
 TGEd7U1nXftJ7//kuVmbyw+qyNn6NIDaUxDq4mOSgbm6d88Oyk74nvb23vV0gMgC3LCvxU
 +E8gzkXcU9onNEvHnEIw/kVMLGpIMSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-XI46M4DTPmqcAV0C7cw9-A-1; Tue, 03 Aug 2021 10:25:19 -0400
X-MC-Unique: XI46M4DTPmqcAV0C7cw9-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B23041006C80;
 Tue,  3 Aug 2021 14:25:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91BFC5D6A8;
 Tue,  3 Aug 2021 14:25:17 +0000 (UTC)
Date: Tue, 3 Aug 2021 16:25:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
Message-ID: <YQlRzOzXOxeBLb0B@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-6-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
> Most callers of job_is_cancelled() actually want to know whether the job
> is on its way to immediate termination.  For example, we refuse to pause
> jobs that are cancelled; but this only makes sense for jobs that are
> really actually cancelled.
> 
> A mirror job that is cancelled during READY with force=false should
> absolutely be allowed to pause.  This "cancellation" (which is actually
> a kind of completion) may take an indefinite amount of time, and so
> should behave like any job during normal operation.  For example, with
> on-target-error=stop, the job should stop on write errors.  (In
> contrast, force-cancelled jobs should not get write errors, as they
> should just terminate and not do further I/O.)
> 
> Therefore, redefine job_is_cancelled() to only return true for jobs that
> are force-cancelled (which as of HEAD^ means any job that interprets the
> cancellation request as a request for immediate termination), and add
> job_cancel_request() as the general variant, which returns true for any
> jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/qemu/job.h |  8 +++++++-
>  block/mirror.c     | 10 ++++------
>  job.c              |  7 ++++++-
>  3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 8aa90f7395..032edf3c5f 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>  /** Returns true if the job should not be visible to the management layer. */
>  bool job_is_internal(Job *job);
>  
> -/** Returns whether the job is scheduled for cancellation. */
> +/** Returns whether the job is being cancelled. */
>  bool job_is_cancelled(Job *job);
>  
> +/**
> + * Returns whether the job is scheduled for cancellation (at an
> + * indefinite point).
> + */
> +bool job_cancel_requested(Job *job);

I don't think non-force blockdev-cancel for mirror should actually be
considered cancellation, so what is the question that this function
answers?

"Is this a cancelled job, or a mirror block job that is supposed to
complete soon, but only if it doesn't switch over the users to the
target on completion"?

Is this ever a reasonable question to ask, except maybe inside the
mirror implementation itself?

job_complete() is the only function outside of mirror that seems to use
it. But even there, it feels wrong to make a difference. Either we
accept redundant completion requests, or we don't. It doesn't really
matter how the job reconfigures the graph on completion. (Also, I feel
this should really have been part of the state machine, but I'm not sure
if we want to touch it now...)

Kevin


