Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19364DC6F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5oXh-0005En-SA; Thu, 15 Dec 2022 08:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5oXc-0005Dz-FD
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5oXa-0002IX-5Z
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671111888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d2KfQzkziYpXJruwbm2ovvJBXZZrBJ+X/KZRpyTD6YU=;
 b=LDUeEhecTGM7pzhJgioCxL86uwzYxtfGcDdYpmaDBJYCFNhLhjobOibz7kyHUrRxlQy6a2
 ydJFqHZwetWcYTkhl8G9iLF6AOv9ocRRDoOYfNVFb6wOyeM3FV569GchTF9mCFpGleqiTd
 J7MSeHeknhAA070dZECBZPlfjZHnddE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-xnaB6c2MMgKzW6RVmjpusA-1; Thu, 15 Dec 2022 08:44:47 -0500
X-MC-Unique: xnaB6c2MMgKzW6RVmjpusA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1475138164C2;
 Thu, 15 Dec 2022 13:44:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0574085720;
 Thu, 15 Dec 2022 13:44:46 +0000 (UTC)
Date: Thu, 15 Dec 2022 14:44:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Message-ID: <Y5skyhXBfKbkNjux@redhat.com>
References: <20221215130225.476477-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215130225.476477-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 15.12.2022 um 14:02 hat Paolo Bonzini geschrieben:
> blkdebug events can be called from either non-coroutine or coroutine
> contexts.  However, suspend actions only make sense from within
> a coroutine.  Currently, using those action would lead to an abort() in
> qemu_coroutine_yield() ("Co-routine is yielding to no one").  Catch them
> and print an error instead.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c                          |  2 +-
>  block/blkdebug.c                 | 10 ++++++++--
>  include/block/block-io.h         |  2 +-
>  include/block/block_int-common.h |  3 ++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 3f2bd128570e..49c66475c73e 100644
> --- a/block.c
> +++ b/block.c
> @@ -6334,7 +6334,7 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
>      return drv->bdrv_get_specific_stats(bs);
>  }
>  
> -void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
> +void coroutine_mixed_fn bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)

coroutine_mixed_fn isn't a thing. I assume this depends on some patch
you haven't sent yet?

Kevin


