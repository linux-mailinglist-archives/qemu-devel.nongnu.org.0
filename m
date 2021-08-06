Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BD3E3061
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:36:02 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6ZV-0005NC-9S
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6YI-0004Jp-Lr
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6YF-0003NA-EA
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628282082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZzN3kDgWkzO62QFVIekkgtyAjmYhzNZLUR8SMjR+pOc=;
 b=SycB5W9UPA0WWkwpA3d4uGIS9K6q9iU7vZGVOTh2rdyPsCCPhIarbmttroq+hjPMue536X
 yDi1XEN8oJcTPCyY4wH2c2gb2fL9MC4mgEKyOrKH2NDtayacJMPp5dP4F7cecrHgCDH6/E
 nAq8xCccfQOdX5cr1RxMpeRQ1j55zSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-puMAkvwmNx-26hwMz5C0AA-1; Fri, 06 Aug 2021 16:34:39 -0400
X-MC-Unique: puMAkvwmNx-26hwMz5C0AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD3221084F54;
 Fri,  6 Aug 2021 20:34:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1801E7BE5B;
 Fri,  6 Aug 2021 20:34:38 +0000 (UTC)
Date: Fri, 6 Aug 2021 15:34:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.2 v3 07/12] job: Add job_cancel_requested()
Message-ID: <20210806203436.kew7g7kyte7p2dml@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-8-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210806093859.706464-8-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06, 2021 at 11:38:54AM +0200, Max Reitz wrote:
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
> job_cancel_requested() as the general variant, which returns true for
> any jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Finally, here is a justification for how different job_is_cancelled()
> invocations are treated by this patch:

Thanks for this list; it's really thorough and helpful.

> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Although it is fixing a bug, the bug has been long-standing, so I
agree with your claim that this is 6.2 material.

> ---
>  include/qemu/job.h |  8 +++++++-
>  block/mirror.c     | 10 ++++------
>  job.c              |  9 +++++++--
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 

> +++ b/job.c
> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>  }
>  
>  bool job_is_cancelled(Job *job)
> +{
> +    return job->cancelled && job->force_cancel;
> +}
> +
> +bool job_cancel_requested(Job *job)
>  {
>      return job->cancelled;
>  }

Works out rather nicely.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


