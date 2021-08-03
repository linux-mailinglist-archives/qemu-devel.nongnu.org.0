Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FE3DEF99
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:02:29 +0200 (CEST)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuzz-0004tF-M2
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAuyP-00040Q-Q2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAuyM-00011U-D9
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627999244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aHN7ZgfzcMDnuTBe8cBytNSFAxbEBMbKjBraV71+b7w=;
 b=Ddq6EGkmCGWfc9OVAejCJQ1rAh2lAhGQTLYaNye+t4haqfaamEDrQLt1LTzduOjTEcL8P9
 XUHPobEjgERWFlY8TlFoIvC1bWjuRGpzgoR1xPlY+d7aQ3k7oz3r36b+YTxFL97YOxrst0
 ptaXLyw/2bpCnjuo8HXivcxA8MmN210=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-busUDQwIN5WdVLg07QBz7w-1; Tue, 03 Aug 2021 10:00:40 -0400
X-MC-Unique: busUDQwIN5WdVLg07QBz7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C2F93928;
 Tue,  3 Aug 2021 14:00:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2D56E6E2;
 Tue,  3 Aug 2021 14:00:36 +0000 (UTC)
Date: Tue, 3 Aug 2021 16:00:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 3/7] job: @force parameter for
 job_cancel_sync{,_all}()
Message-ID: <YQlMAwbMs0IEIsQq@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-4-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> diff --git a/job.c b/job.c
> index e7a5d28854..9e971d64cf 100644
> --- a/job.c
> +++ b/job.c
> @@ -763,7 +763,12 @@ static void job_completed_txn_abort(Job *job)
>          if (other_job != job) {
>              ctx = other_job->aio_context;
>              aio_context_acquire(ctx);
> -            job_cancel_async(other_job, false);
> +            /*
> +             * This is a transaction: If one job failed, no result will matter.
> +             * Therefore, pass force=true to terminate all other jobs as quickly
> +             * as possible.
> +             */
> +            job_cancel_async(other_job, true);
>              aio_context_release(ctx);
>          }
>      }

Sneaking in a hunk that is unrelated to what the commit message
promises? How naughty! :-)

(But I guess the change makes sense.)

Kevin


