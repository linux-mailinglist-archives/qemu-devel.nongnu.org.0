Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75D700D1D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:36:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVjs-0001ff-1r; Fri, 12 May 2023 12:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVjp-0001fW-Vy
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVjo-0002M6-BQ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683909321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3YoeGApV0BALkjBejErp3XLI4qmlMxUhicMH0RDYAk=;
 b=b6hqWzgi5NWoLWPjqhfUcvwv2Uu8s0dq2eDnDoqrHSgviI4ySaEZFuxuBrzDXjZFlKwmQZ
 LikPAAFKo+psOrTvTLpVvsIUYjRoDkkLeXubBLSDxeJzveMBr8LGNCZYZZRyo+FGW5hC5W
 VBgYzDr8xNFLEIEbfsWaX+LaO7TBGEc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-hya3fnxXO1GeOprX7PZ7dw-1; Fri, 12 May 2023 12:35:17 -0400
X-MC-Unique: hya3fnxXO1GeOprX7PZ7dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD3C3815EE7;
 Fri, 12 May 2023 16:35:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9F135443;
 Fri, 12 May 2023 16:35:15 +0000 (UTC)
Date: Fri, 12 May 2023 11:35:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] blockjob: Adhere to rate limit even when reentered
 early
Message-ID: <djuclsyttbhocn6y43vprzgx6to2amayqtmbyvknhi5lyir5rg@omovqhtzbngp>
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-8-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510203601.418015-8-kwolf@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On Wed, May 10, 2023 at 10:36:00PM +0200, Kevin Wolf wrote:
> 
> When jobs are sleeping, for example to enforce a given rate limit, they
> can be reentered early, in particular in order to get paused, to update
> the rate limit or to get cancelled.
> 
> Before this patch, they behave in this case as if they had fully
> completed their rate limiting delay. This means that requests are sped
> up beyond their limit, violating the constraints that the user gave us.

Aha - our tests ARE non-deterministic!  Good find.

> 
> Change the block jobs to sleep in a loop until the necessary delay is
> completed, while still allowing cancelling them immediately as well
> pausing (handled by the pause point in job_sleep_ns()) and updating the
> rate limit.
> 
> This change is also motivated by iotests cases being prone to fail
> because drain operations pause and unpause them so often that block jobs
> complete earlier than they are supposed to. In particular, the next
> commit would fail iotests 030 without this change.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/blockjob_int.h | 14 ++++++++++----
>  block/commit.c               |  7 ++-----
>  block/mirror.c               | 23 ++++++++++-------------
>  block/stream.c               |  7 ++-----
>  blockjob.c                   | 22 ++++++++++++++++++++--
>  5 files changed, 44 insertions(+), 29 deletions(-)
> 
> +++ b/blockjob.c
> @@ -319,10 +319,28 @@ static bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>      return block_job_set_speed_locked(job, speed, errp);
>  }
>  
> -int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
> +void block_job_ratelimit_processed_bytes(BlockJob *job, uint64_t n)
>  {
>      IO_CODE();
> -    return ratelimit_calculate_delay(&job->limit, n);
> +    ratelimit_calculate_delay(&job->limit, n);
> +}
> +
> +void block_job_ratelimit_sleep(BlockJob *job)
> +{
> +    uint64_t delay_ns;
> +
> +    /*
> +     * Sleep at least once. If the job is reentered early, keep waiting until
> +     * we've waited for the full time that is necessary to keep the job at the
> +     * right speed.
> +     *
> +     * Make sure to recalculate the delay after each (possibly interrupted)
> +     * sleep because the speed can change while the job has yielded.
> +     */
> +    do {
> +        delay_ns = ratelimit_calculate_delay(&job->limit, 0);
> +        job_sleep_ns(&job->job, delay_ns);
> +    } while (delay_ns && !job_is_cancelled(&job->job));
>  }

Yes, that looks more robust.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


