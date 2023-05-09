Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356C6FC356
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:58:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwK5x-0003Yj-Mn; Tue, 09 May 2023 05:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwK5v-0003YY-Sv
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwK5r-0006qb-E6
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683626234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q92g8g0kbkEwxGLCTvSdKo45lrlKljvflBm2Daa9Gws=;
 b=b7azvfJNIUxXQR73LnAqgdnCHPtXlwwJkUtjqL1l8Bfs8YOxQIVyczKSm48kWD8hQxsJ7P
 wy1l1lG+mg+Ruq+yIMbDNWin2JXTtJq0YFqnELkmhhXGncTdgY1rNTU/SDqGbIvWwzCsVO
 u0CldKn2XWZpTNtfpgjJuL35p2L2to0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-vzS_pYz9Nd-0lNOsRjY0rA-1; Tue, 09 May 2023 05:57:11 -0400
X-MC-Unique: vzS_pYz9Nd-0lNOsRjY0rA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08FD3C11790;
 Tue,  9 May 2023 09:57:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90BC340C6E67;
 Tue,  9 May 2023 09:57:09 +0000 (UTC)
Date: Tue, 9 May 2023 11:57:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH] block/export: call blk_set_dev_ops(blk, NULL, NULL)
Message-ID: <ZFoY9I5835SRksgb@redhat.com>
References: <20230502211119.720647-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502211119.720647-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Am 02.05.2023 um 23:11 hat Stefan Hajnoczi geschrieben:
> Most export types install BlockDeviceOps pointers. It is easy to forget
> to remove them because that happens automatically via the "drive" qdev
> property in hw/ but not block/export/.
> 
> Put blk_set_dev_ops(blk, NULL, NULL) calls in the core export.c code so
> the export types don't need to remember.
> 
> This fixes the nbd and vhost-user-blk export types.
> 
> Fixes: fd6afc501a01 ("nbd/server: Use drained block ops to quiesce the server")
> Fixes: ca858a5fe94c ("vhost-user-blk-server: notify client about disk resize")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/export.c    | 2 ++
>  block/export/vduse-blk.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/export/export.c b/block/export/export.c
> index e3fee60611..62c7c22d45 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -192,6 +192,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>      return exp;
>  
>  fail:
> +    blk_set_dev_ops(exp->blk, NULL, NULL);
>      blk_unref(blk);
>      aio_context_release(ctx);
>      if (exp) {

The last line of the context already shows that dereferencing exp
unconditionally is wrong. I'll fix it in my next series that tries to
address Fiona's concern that we need to take the graph lock even in the
main thread if we're in a coroutine.

Kevin


