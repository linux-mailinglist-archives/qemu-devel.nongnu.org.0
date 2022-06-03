Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A253CD66
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:43:46 +0200 (CEST)
Received: from localhost ([::1]:33748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAOn-0002YO-GQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nxAMC-0000Om-Pc
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nxAM8-0000lq-Kn
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654274459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dnJm8l9nQahvZ66klwWDDcByX9qZYoZkIzEd+scaXM=;
 b=hAXpGkxxPfAi0S5x6UABfniZ0/T8Apg0GONDs5TaMXOkm1lp2PTwerr3L8MXsOTLU+4HOQ
 qxcbYvztxiEcyAvzedywZ1ZAEAz4BxW36XWT94eezD8Ki/RrcBJQVEdyd1iyGrM0RNUEaH
 zjOMi6Bb1We/izRS0nBjEcKo36mHRHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-x1GRpdfMMWeo2b2zp2XPqw-1; Fri, 03 Jun 2022 12:40:56 -0400
X-MC-Unique: x1GRpdfMMWeo2b2zp2XPqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC4C101A54E;
 Fri,  3 Jun 2022 16:40:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C9640CF8E7;
 Fri,  3 Jun 2022 16:40:53 +0000 (UTC)
Date: Fri, 3 Jun 2022 18:40:52 +0200
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
Subject: Re: [PATCH v6 06/18] jobs: protect jobs with job_lock/unlock
Message-ID: <Ypo5lHwqTc2FtyNh@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
> Introduce the job locking mechanism through the whole job API,
> following the comments  in job.h and requirements of job-monitor
> (like the functions in job-qmp.c, assume lock is held) and
> job-driver (like in mirror.c and all other JobDriver, lock is not held).
> 
> Use the _locked helpers introduced before to differentiate
> between functions called with and without job_mutex.
> This only applies to function that are called under both
> cases, all the others will be renamed later.
> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c             |  18 ++++---
>  block/replication.c |   8 ++-
>  blockdev.c          |  17 ++++--
>  blockjob.c          |  56 +++++++++++++-------
>  job-qmp.c           |   2 +
>  job.c               | 125 +++++++++++++++++++++++++++++++-------------
>  monitor/qmp-cmds.c  |   6 ++-
>  qemu-img.c          |  41 +++++++++------
>  8 files changed, 187 insertions(+), 86 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 718e4cae8b..5dc46fde11 100644
> --- a/block.c
> +++ b/block.c
> @@ -4978,7 +4978,9 @@ static void bdrv_close(BlockDriverState *bs)
>  
>  void bdrv_close_all(void)
>  {
> -    assert(job_next(NULL) == NULL);
> +    WITH_JOB_LOCK_GUARD() {
> +        assert(job_next(NULL) == NULL);
> +    }
>      GLOBAL_STATE_CODE();

This series seems really hard to review patch by patch, in this case
because I would have to know whether you intended job_next() to be
called with the lock held or not. Nothing in job.h indicates either way
at this point in the series.

Patch 11 answers this by actually renaming it job_next_locked(), but
always having to refer to the final state after the whole series is
applied is really not how things should work. We're splitting the work
into individual patches so that the state after each single patch makes
sense on its own. Otherwise the whole series could as well be a single
patch. :-(

So I'd argue that patch 11 should probably come before this one.

Anyway, I guess I'll try to make my way to the end of the series quickly
and then somehow try to verify whatever the state is then.

Kevin


