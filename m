Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3175700D07
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVcE-0006Vo-KB; Fri, 12 May 2023 12:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVcC-0006Mg-Dd
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVcA-0000FI-VE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683908850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIsjv4pFOl1/XowOtPD40tlB1h1ERrIoOvdTLLAHDnU=;
 b=KJ7aGP6qMLUsnZsP+ZyhBQVWDMb31tDIvDD6cjzEYG2bt8za6GGpB/i2EwojkZKLQNlHhl
 u2hZhFYdTz56yxYhOGcPNlIKsqyC+jEKAM0k4DaDUVGRR42j9oHzY1TqtynBDa7hZKJWFv
 +hde8p9IcE+9uFN2Wa4jxO/jPl2DhFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-nn-9_tf3NpuNNIIb4ah9YQ-1; Fri, 12 May 2023 12:27:27 -0400
X-MC-Unique: nn-9_tf3NpuNNIIb4ah9YQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F32E101A551;
 Fri, 12 May 2023 16:27:26 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02CAB40C2076;
 Fri, 12 May 2023 16:27:25 +0000 (UTC)
Date: Fri, 12 May 2023 11:27:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/8] test-bdrv-drain: Call bdrv_co_unref() in coroutine
 context
Message-ID: <zrt2l6bgaml3izjbkwugpiq7ngtzgwebyyd6bmfamzhlam5b7g@3tf7j2k6pcz2>
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-7-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510203601.418015-7-kwolf@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


On Wed, May 10, 2023 at 10:35:59PM +0200, Kevin Wolf wrote:
> 
> bdrv_unref() is a no_coroutine_fn, so calling it from coroutine context
> is invalid. Use bdrv_co_unref() instead.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index ae4299ccfa..08bb0f9984 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -1019,7 +1019,7 @@ static void coroutine_fn test_co_delete_by_drain(void *opaque)
>      g_assert_cmpint(bs->refcnt, ==, 1);
>  
>      if (!dbdd->detach_instead_of_delete) {
> -        blk_unref(blk);
> +        blk_co_unref(blk);
>      } else {
>          BdrvChild *c, *next_c;
>          QLIST_FOREACH_SAFE(c, &bs->children, next, next_c) {
> -- 
> 2.40.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


