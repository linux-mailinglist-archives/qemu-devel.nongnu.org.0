Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9F3E3062
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:36:24 +0200 (CEST)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6Zr-0006XJ-87
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6Ym-0004yF-Iq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC6Yk-0003m0-AZ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628282113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwrZEoI+3a//xGI+R1iqSRyPxwZYNfCcOxNBnXZ9E2U=;
 b=CXhykfV6IO1Z5ta39+lNFXCWid6NzQAs3WPW6HTp/yN8j7vKKO4Tl+U/n2cBaQY4Lx+N75
 I9q+IYp73GmOJ1JjwwXzidScujaYDYNVnZVWrZYjuQyDFno/GlKmpLQWrB4mAfnkGKO8AJ
 I4ULfkAhGyrinRwk+KZOsFTcoG5fA4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-CnXLybXQMzegVQ3r80Rw4g-1; Fri, 06 Aug 2021 16:35:12 -0400
X-MC-Unique: CnXLybXQMzegVQ3r80Rw4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B94B871810;
 Fri,  6 Aug 2021 20:35:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1AE069FAD;
 Fri,  6 Aug 2021 20:35:10 +0000 (UTC)
Date: Fri, 6 Aug 2021 15:35:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.2 v3 08/12] mirror: Use job_is_cancelled()
Message-ID: <20210806203509.zg3gv25mloiq4zhh@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-9-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210806093859.706464-9-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Fri, Aug 06, 2021 at 11:38:55AM +0200, Max Reitz wrote:
> mirror_drained_poll() returns true whenever the job is cancelled,
> because "we [can] be sure that it won't issue more requests".  However,
> this is only true for force-cancelled jobs, so use job_is_cancelled().
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/mirror.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 72e02fa34e..024fa2dcea 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1177,7 +1177,7 @@ static bool mirror_drained_poll(BlockJob *job)
>       * from one of our own drain sections, to avoid a deadlock waiting for
>       * ourselves.
>       */
> -    if (!s->common.job.paused && !s->common.job.cancelled && !s->in_drain) {
> +    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
>          return true;
>      }

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


