Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4272B589B45
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:57:13 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZTU-0002kk-08
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJZJr-0000YR-UX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJZJp-00039V-Ga
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659613632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K9gg693YDOItybrzTF0maJxAjciZ7GcfCrXEu70TO8U=;
 b=Xwg56SkGaA8O4ksH8VlzbgrCKDMTYUg+YvL+wVpN9ux/c0ce0PYeTBoqGkzwnFWeCJfM9Y
 5ywODnL8YO83l52vPSDlpcoZomhUUTerpbuKjlS/xRc0/BKdRV4/buILsaf2vQKA/rznPU
 tfXLGaeKLzWnvC/LxpbvP19FfyK2nUY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-bKUMmMDhPt-KrpNYE_stJQ-1; Thu, 04 Aug 2022 07:47:11 -0400
X-MC-Unique: bKUMmMDhPt-KrpNYE_stJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27DF138149B4;
 Thu,  4 Aug 2022 11:47:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A340C18EB7;
 Thu,  4 Aug 2022 11:47:07 +0000 (UTC)
Date: Thu, 4 Aug 2022 13:47:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 08/21] jobs: add job lock in find_* functions
Message-ID: <Yuuxui06OkJcGnBp@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
> they first search for the job and then perform an action on it.
> Therefore, we need to do the search + action under the same
> job mutex critical section.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> diff --git a/job-qmp.c b/job-qmp.c
> index 829a28aa70..ac11a6c23c 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -29,14 +29,19 @@
>  #include "qapi/error.h"
>  #include "trace/trace-root.h"
>  
> -/* Get a job using its ID and acquire its AioContext */
> -static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
> +/*
> + * Get a block job using its ID and acquire its AioContext.

This should still be just a job, not specifically a block job.

> + * Called with job_mutex held.
> + */
> +static Job *find_job_locked(const char *id,
> +                            AioContext **aio_context,
> +                            Error **errp)
>  {
>      Job *job;
>  
>      *aio_context = NULL;
>  
> -    job = job_get(id);
> +    job = job_get_locked(id);
>      if (!job) {
>          error_setg(errp, "Job not found");
>          return NULL;

With this fixed:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


