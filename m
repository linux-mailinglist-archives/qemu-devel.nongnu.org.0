Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9153CCF0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:09:38 +0200 (CEST)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx9rk-0000Z9-Ja
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nx9j7-0003pC-18
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nx9j3-0007IB-S4
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654272028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whdWu22mNeCAQUmQLlfp+9Nymbc5mSYLJxmt0wqP6lA=;
 b=NUWrp3SZpgi0dUF7ibc5ggTejAR96or/N79xPipN4k7gQJPemao/beiEEGZ7qpy8AJlt9c
 /lSUBbfoMtY/Mx5GW9+3XoWjvV9OpBoz5MPSHyuRPq6/Pe/ziVM8a6AV2vPLueXk9ZbFxL
 zE2+jYGnjYeuIunPITszANDpN1s3rEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-VOf98Wh2OHGI-Pt5qV5H6Q-1; Fri, 03 Jun 2022 12:00:25 -0400
X-MC-Unique: VOf98Wh2OHGI-Pt5qV5H6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB0C585A5B9;
 Fri,  3 Jun 2022 16:00:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 476A92026D64;
 Fri,  3 Jun 2022 16:00:22 +0000 (UTC)
Date: Fri, 3 Jun 2022 18:00:20 +0200
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
Subject: Re: [PATCH v6 02/18] job.h: categorize fields in struct Job
Message-ID: <YpowFFFD0hKOFtWF@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I suppose it might be a result of moving things back and forth between
patches, but this patch doesn't really define separate categories.

>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index d1192ffd61..86ec46c09e 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>   * Long-running operation.
>   */
>  typedef struct Job {
> +
> +    /* Fields set at initialization (job_create), and never modified */

This is clearly a comment starting a category, but I can't see any other
comment indicating that another category would start.

>      /** The ID of the job. May be NULL for internal jobs. */
>      char *id;
>  
> -    /** The type of this job. */
> +    /**
> +     * The type of this job.
> +     * All callbacks are called with job_mutex *not* held.
> +     */
>      const JobDriver *driver;
>  
> -    /** Reference count of the block job */
> -    int refcnt;
> -
> -    /** Current state; See @JobStatus for details. */
> -    JobStatus status;
> -
> -    /** AioContext to run the job coroutine in */
> -    AioContext *aio_context;
> -
>      /**
>       * The coroutine that executes the job.  If not NULL, it is reentered when
>       * busy is false and the job is cancelled.
> +     * Initialized in job_start()
>       */
>      Coroutine *co;
>  
> +    /** True if this job should automatically finalize itself */
> +    bool auto_finalize;
> +
> +    /** True if this job should automatically dismiss itself */
> +    bool auto_dismiss;
> +
> +    /** The completion function that will be called when the job completes.  */
> +    BlockCompletionFunc *cb;
> +
> +    /** The opaque value that is passed to the completion function.  */
> +    void *opaque;
> +
> +    /* ProgressMeter API is thread-safe */
> +    ProgressMeter progress;
> +
> +

And the end of the series, this is where the cutoff is and the rest is:

    /** Protected by job_mutex */

With this in mind, it seems correct to me that everything above progress
is indeed never changed after creating the job. Of course, it's hard to
tell without looking at the final result, so if you have to respin for
some reason, it would be good to mark the end of the section more
clearly for the intermediate state to make sense.

Kevin


