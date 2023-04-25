Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4B6EE955
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 23:05:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPpe-0005uW-7d; Tue, 25 Apr 2023 17:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPpc-0005u8-7g
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPpZ-00009g-59
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682456647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vx+FGRpevBfWpWiIoF3Nz4HjMtcf3j0Bwg+ecYj3e1M=;
 b=P9xeoJT9t2LK30dIsAbM3PMtNQk6SDG2M7AW9s8xk3NaEcZvjRNG7pEQPW1hNdyfmfrML8
 YBaSQmrN5PoZ2zRnsQyBsFj4wyU7W62EDX3zL4Ru+LG5/F6ivdWDoNrw1BnHNxZPjbNgsz
 Kfq1YIn9w1zGpU64XhGCAhVcQb4l2ys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-IRmT0zJkO5CZd_d8XIK8lw-1; Tue, 25 Apr 2023 17:04:03 -0400
X-MC-Unique: IRmT0zJkO5CZd_d8XIK8lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14C0B87A9EA;
 Tue, 25 Apr 2023 21:04:03 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648D71121314;
 Tue, 25 Apr 2023 21:04:02 +0000 (UTC)
Date: Tue, 25 Apr 2023 16:04:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 08/20] block: .bdrv_open is non-coroutine and unlocked
Message-ID: <ribderbmrmehseiqsxke6ebezylhewqjgi4eoxb2e5pog2cjkl@2upgls3ye72m>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-9-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-9-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 07:31:46PM +0200, Kevin Wolf wrote:
> Drivers were a bit confused about whether .bdrv_open can run in a
> coroutine and whether or not it holds a graph lock.
> 
> It cannot keep a graph lock from the caller across the whole function
> because it both changes the graph (requires a writer lock) and does I/O
> (requires a reader lock). Therefore, it should take these locks
> internally as needed.
> 
> The functions used to be called in coroutine context during image
> creation. This was buggy for other reasons, and as of commit 32192301,
> all block drivers go through no_co_wrappers. So it is not called in
> coroutine context any more.
> 
> Fix qcow2 and qed to work with the correct assumptions: The graph lock
> needs to be taken internally instead of just assuming it's already
> there, and the coroutine path is dead code that can be removed.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block_int-common.h |  8 ++++----
>  block.c                          |  6 +++---
>  block/qcow2.c                    | 15 ++++++---------
>  block/qed.c                      | 18 ++++++++----------
>  4 files changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 013d419444..6fb28cd8fa 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -236,12 +236,12 @@ struct BlockDriver {
>      void (*bdrv_reopen_abort)(BDRVReopenState *reopen_state);
>      void (*bdrv_join_options)(QDict *options, QDict *old_options);
>  
> -    int (*bdrv_open)(BlockDriverState *bs, QDict *options, int flags,
> -                     Error **errp);
> +    int GRAPH_UNLOCKED_PTR (*bdrv_open)(
> +        BlockDriverState *bs, QDict *options, int flags, Error **errp);
>  
>      /* Protocol drivers should implement this instead of bdrv_open */
> -    int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
> -                          Error **errp);
> +    int GRAPH_UNLOCKED_PTR (*bdrv_file_open)(
> +        BlockDriverState *bs, QDict *options, int flags, Error **errp);

May conflict with Paolo's work to eliminate bdrv_file_open as
redundant.  But that should be easy to figure out.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


