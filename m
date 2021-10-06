Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BE4248EC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 23:27:20 +0200 (CEST)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYERb-0006j9-66
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 17:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYEPA-0005qD-Hb
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYEP6-00046Y-Sh
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633555483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RAqmOb2yz+BQpzsPsRPm7SYDS33UclCBn1mUB2pLj1Y=;
 b=g/fJAAsk4BGkLPdc6hx7d7qluoAIT2DACh+TCTscjni0NE1T0xdOYIJaACovLGc8CIqqor
 2lRTOS4Rk8uWbLi4wkm++p7I0RhltQv5RFGDWhPrlvP/d4EBlFRLTq4rlSdWrmOrcE/HLw
 2T4r45AFr2/lsYoTGx+k3I9eomUFKh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-YuXBatdsM9yYY-R2HSTRvQ-1; Wed, 06 Oct 2021 17:24:42 -0400
X-MC-Unique: YuXBatdsM9yYY-R2HSTRvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3085881431D;
 Wed,  6 Oct 2021 21:24:41 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 817595C1C5;
 Wed,  6 Oct 2021 21:24:37 +0000 (UTC)
Date: Wed, 6 Oct 2021 16:24:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 08/13] job: Add job_cancel_requested()
Message-ID: <20211006212436.jcekhpvx3i72fsns@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
 <20211006151940.214590-9-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006151940.214590-9-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 05:19:35PM +0200, Hanna Reitz wrote:
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

Is this reference still accurate with the addition of new patch 7?

> cancellation request as a request for immediate termination), and add
> job_cancel_requested() as the general variant, which returns true for
> any jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Finally, here is a justification for how different job_is_cancelled()
> invocations are treated by this patch:
...
>   - job_update_rc(), job_finalize_single(), job_finish_sync(): These
>     functions are all called after the job has left its main loop.  The
>     mirror job (the only job that can be soft-cancelled) will clear
>     .cancelled before leaving the main loop if it has been
>     soft-cancelled.  Therefore, these functions will observe .cancelled
>     to be true only if the job has been force-cancelled.  We can
>     continue to use job_is_cancelled().
>     (Furthermore, conceptually, a soft-cancelled mirror job should not
>     report to have been cancelled.  It should report completion (see
>     also the block-job-cancel QAPI documentation).  Therefore, it makes
>     sense for these functions not to distinguish between a
>     soft-cancelled mirror job and a job that has completed as normal.)

Thanks for the careful explanation.

> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/qemu/job.h |  8 +++++++-
>  block/mirror.c     | 10 ++++------
>  job.c              | 14 ++++++++++++--
>  3 files changed, 23 insertions(+), 9 deletions(-)

The commit message is loads longer than the patch itself, but for good
reason.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


