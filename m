Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4E3F1F78
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 20:00:30 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGmL6-00015N-WD
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 14:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGmJn-0000DO-Pl
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGmJj-0006HT-Eu
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629395941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SebhoJzxtK52qncBsoNztkY6rroMQUoPMbpJH9xxz3Y=;
 b=GOQGLSjhzBZ+ravoL7RFQDrrcNBg+7MjEICOYOy2we5mdMPjQA1di60qGucIxW0nRQll4t
 P0lDrpgycfX3MRau+CeE8JazICI5p18Iiee9KQA9+IJLpCDtM+UlZWvrASd9UqqarCdgXe
 AiS5OvHn1kI/Zo4Zlu2uR2lPV2iWOsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-R6T3X9_jMkGT9Vmg9jzrGA-1; Thu, 19 Aug 2021 13:58:58 -0400
X-MC-Unique: R6T3X9_jMkGT9Vmg9jzrGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589318A6BFF;
 Thu, 19 Aug 2021 17:58:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF5469280;
 Thu, 19 Aug 2021 17:58:19 +0000 (UTC)
Date: Thu, 19 Aug 2021 12:58:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/3] qcow2: refactor handle_dependencies() loop body
Message-ID: <20210819175818.v4i4hgdmwknvjp2k@redhat.com>
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210724133846.64614-3-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-732-28786f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 24, 2021 at 04:38:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> No logic change, just prepare for the following commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-cluster.c | 49 ++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index bd0597842f..967121c7e6 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1400,29 +1400,36 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
>  
>          if (end <= old_start || start >= old_end) {
>              /* No intersection */
> -        } else {
> -            if (start < old_start) {
> -                /* Stop at the start of a running allocation */
> -                bytes = old_start - start;
> -            } else {
> -                bytes = 0;
> -            }
> +            continue;
> +        }
>  
> -            /* Stop if already an l2meta exists. After yielding, it wouldn't

Pre-existing, but...

> -             * be valid any more, so we'd have to clean up the old L2Metas
> -             * and deal with requests depending on them before starting to
> -             * gather new ones. Not worth the trouble. */
> -            if (bytes == 0 && *m) {
> -                *cur_bytes = 0;
> -                return 0;
> -            }
> +        /* Conflict */
>  
> -            if (bytes == 0) {
> -                /* Wait for the dependency to complete. We need to recheck
> -                 * the free/allocated clusters when we continue. */
> -                qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
> -                return -EAGAIN;
> -            }
> +        if (start < old_start) {
> +            /* Stop at the start of a running allocation */
> +            bytes = old_start - start;
> +        } else {
> +            bytes = 0;
> +        }
> +
> +        /*
> +         * Stop if already an l2meta exists. After yielding, it wouldn't

...might as well fix the grammar:  Stop if an l2meta already exists.

> +         * be valid any more, so we'd have to clean up the old L2Metas
> +         * and deal with requests depending on them before starting to
> +         * gather new ones. Not worth the trouble.
> +         */
> +        if (bytes == 0 && *m) {
> +            *cur_bytes = 0;
> +            return 0;
> +        }
> +
> +        if (bytes == 0) {
> +            /*
> +             * Wait for the dependency to complete. We need to recheck
> +             * the free/allocated clusters when we continue.
> +             */
> +            qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
> +            return -EAGAIN;

So the change adds a short-circuiting 'continue', then reduces the
indentation of the rest of the loop body.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


