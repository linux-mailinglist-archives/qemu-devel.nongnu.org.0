Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF33E2FC2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 21:23:40 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC5RS-0008Eu-8l
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 15:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC5QH-0007PA-89
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC5QF-0003W8-Ce
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628277742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAAMkfUwyxilt43tLGpLcbOtaVi5QIAWlC2bOnAy/TM=;
 b=K48ph68rXPp9uSu3fwVvTyyr0bMtPZdToFs0M+RplUO15PJRu4VPhdP6YftR8zly/A9tOj
 CU4P074vL0tzkBlMFKgrfHe9maW/GfnA//2M1IopTPbh01slGK7poQl4Z07TXx2WwnxywX
 4pt3TBT8Ibr52+7MxUpaKXHKjr+pmww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ewXnMTmmO5eF18QCkEGAmg-1; Fri, 06 Aug 2021 15:22:21 -0400
X-MC-Unique: ewXnMTmmO5eF18QCkEGAmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83E1D8799E0;
 Fri,  6 Aug 2021 19:22:20 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAB0319C59;
 Fri,  6 Aug 2021 19:22:19 +0000 (UTC)
Date: Fri, 6 Aug 2021 14:22:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.2 v3 04/12] job: Force-cancel jobs in a failed
 transaction
Message-ID: <20210806192218.isczd32bksumuth7@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-5-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210806093859.706464-5-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Fri, Aug 06, 2021 at 11:38:51AM +0200, Max Reitz wrote:
> When a transaction is aborted, no result matters, and so all jobs within
> should be force-cancelled.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  job.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/job.c b/job.c
> index 3fe23bb77e..24e7c4fcb7 100644
> --- a/job.c
> +++ b/job.c
> @@ -766,7 +766,12 @@ static void job_completed_txn_abort(Job *job)
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
> -- 
> 2.31.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


