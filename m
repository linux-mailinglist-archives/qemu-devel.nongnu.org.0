Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A358A9E4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:05:19 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJv8o-0002g5-08
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJuzf-0001PJ-Qd
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJuzc-0005cX-Mm
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659696948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHeGOBPC5GinleQ0rcX3iKuL7pjMHJ/11ZXUcmoG0uc=;
 b=DXWM2KhGdk2QXtKA9eM7ULGEm6cribVoh8aN3yYB8u3ZM+BA1+GKoglpQxRHrgjkf3AOOv
 96SH2abP3sMDZyEHZ8uhlZlxSxz9mNf5fW12KXgH2gG7k5bpq/fHFoFswi3heUXVS214hW
 jARGb4eRfybADgtzhgg4DpuY1596i0w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-0O7rpl2ZOpSeS0LAhM3xZA-1; Fri, 05 Aug 2022 06:55:43 -0400
X-MC-Unique: 0O7rpl2ZOpSeS0LAhM3xZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 614BD381684F;
 Fri,  5 Aug 2022 10:55:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9730F40CF8E4;
 Fri,  5 Aug 2022 10:55:39 +0000 (UTC)
Date: Fri, 5 Aug 2022 12:55:38 +0200
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
Subject: Re: [PATCH v10 17/21] blockjob: protect iostatus field in BlockJob
 struct
Message-ID: <Yuz3KuxGtRdAp6Zw@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-18-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-18-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> iostatus is the only field (together with .job) that needs
> protection using the job mutex.
> 
> It is set in the main loop (GLOBAL_STATE functions) but read
> in I/O code (block_job_error_action).
> 
> In order to protect it, change block_job_iostatus_set_err
> to block_job_iostatus_set_err_locked(), always called under
> job lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index 0663faee2c..448bdb5a53 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -363,7 +363,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>      return block_job_query_locked(job, errp);
>  }
>  
> -static void block_job_iostatus_set_err(BlockJob *job, int error)
> +/* Called with job lock held */
> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>  {
>      if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>          job->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
> @@ -577,8 +578,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                   */
>                  job->job.user_paused = true;
>              }
> +            block_job_iostatus_set_err_locked(job, error);
>          }
> -        block_job_iostatus_set_err(job, error);
>      }
>      return action;
>  }

Ah, so this patch does what I asked for in an earlier patch. I wonder if
it should be squashed there.

Vladimir's finding that we have an access in mirror may need a fix, but
while incomplete, this patch isn't wrong:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


