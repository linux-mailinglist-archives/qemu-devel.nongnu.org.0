Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47443DF069
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:37:03 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvXS-0006pg-Mo
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvUr-0004pD-3d
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvUp-0007gA-CD
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XCXZKKFz3JvgHSl9IpRs0mnn/yet2ZwaKXJFEKkkZ+U=;
 b=J0AAZ1psGAFQmXE+qROBxrC3L0XTF1r2Y6t9BiacDpERSFlauy+toIYjJW+1CeHi/9KbrW
 e2iuDgRQyyE+8z5/S6o1LyLUJ77+Q1CDH8TFTVeOre8Z0WUoQhGjlEspSS7EGBUNRNcKuU
 TfGlPbVgC7H5lwhi+ovzGB2ogrmqSqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-AeY3-pwrNUOUZ4nkqEuCgA-1; Tue, 03 Aug 2021 10:34:15 -0400
X-MC-Unique: AeY3-pwrNUOUZ4nkqEuCgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF6F192D78C;
 Tue,  3 Aug 2021 14:34:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0289D60C0F;
 Tue,  3 Aug 2021 14:34:11 +0000 (UTC)
Date: Tue, 3 Aug 2021 16:34:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
Message-ID: <YQlT4rO9OoykGl/b@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-7-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> We must check whether the job is force-cancelled early in our main loop,
> most importantly before any `continue` statement.  For example, we used
> to have `continue`s before our current checking location that are
> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
> failing, force-cancelling the job would not terminate it.
> 
> A job being force-cancelled should be treated the same as the job having
> failed, so put the check in the same place where we check `s->ret < 0`.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/mirror.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 72e02fa34e..46d1a1e5a2 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>              mirror_wait_for_any_operation(s, true);
>          }
>  
> -        if (s->ret < 0) {
> +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
>              ret = s->ret;
>              goto immediate_exit;
>          }
> @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>              break;
>          }
>  
> -        ret = 0;
> -
>          if (job_is_ready(&s->common.job) && !should_complete) {
>              delay_ns = (s->in_flight == 0 &&
>                          cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
> @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>          trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>                                    delay_ns);
>          job_sleep_ns(&s->common.job, delay_ns);
> -        if (job_is_cancelled(&s->common.job)) {
> -            break;
> -        }

I think it was intentional that the check is here because it means
skipping the job_sleep_ns() and instead cancelling immediately, and we
probably still want that. Between your check above and here, the
coroutine can yield, so cancellation could have been newly requested.

So have the check in both places, I guess? And a comment to explain why
neither is redundant.

>          s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>      }

Kevin


