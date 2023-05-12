Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA1700CC0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:17:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVRU-0006iF-44; Fri, 12 May 2023 12:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVRH-0006gV-SE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVRC-00058y-FX
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683908168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DbLSM4woTnGi4SHmnadHjZlBQi+OwXgYnHTXGlixFFg=;
 b=M1MZrNiWZQ5UZoTIdFwPE8UEadffTW9kYehY60xNPkZRUTSJwnvN8FAjyi9I5ye+iCAWgu
 78r5w9GFRn1haR43/C3I/Qn0v3eqXDv3aigzqQffQRBFUMj/S6Mnc7zQ/NViml0bzRV52e
 H8ufIPsBA7EowPQ/VyaCAnOtQqgS9SM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-2ZJuGA4ZMFGz9IayedQJrg-1; Fri, 12 May 2023 12:16:06 -0400
X-MC-Unique: 2ZJuGA4ZMFGz9IayedQJrg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A3E63801ECA;
 Fri, 12 May 2023 16:16:06 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A5D492C13;
 Fri, 12 May 2023 16:16:05 +0000 (UTC)
Date: Fri, 12 May 2023 11:16:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/8] block/export: Fix null pointer dereference in error
 path
Message-ID: <o7omdrdgit2m5pktwdzblyp255lk4qegqizmhlnx5gm7v6tz32@xjfyu7h6za2a>
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-3-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510203601.418015-3-kwolf@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


On Wed, May 10, 2023 at 10:35:55PM +0200, Kevin Wolf wrote:
> 
> There are some error paths in blk_exp_add() that jump to 'fail:' before
> 'exp' is even created. So we can't just unconditionally access exp->blk.
> 
> Add a NULL check, and switch from exp->blk to blk, which is available
> earlier, just to be extra sure that we really cover all cases where
> BlockDevOps could have been set for it (in practice, this only happens
> in drv->create() today, so this part of the change isn't strictly
> necessary).
> 
> Fixes: de79b52604e43fdeba6cee4f5af600b62169f2d2

Sorry for missing that on my first review, and this does look better.

I'm assuming you plan to take this in with the rest of the series
through your tree, but let me know if I should push it faster through
the NBD tree.

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/export/export.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/export/export.c b/block/export/export.c
> index 62c7c22d45..a5c8f42f53 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -192,8 +192,10 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>      return exp;
>  
>  fail:
> -    blk_set_dev_ops(exp->blk, NULL, NULL);
> -    blk_unref(blk);
> +    if (blk) {
> +        blk_set_dev_ops(blk, NULL, NULL);
> +        blk_unref(blk);
> +    }
>      aio_context_release(ctx);
>      if (exp) {
>          g_free(exp->id);
> -- 
> 2.40.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


