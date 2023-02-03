Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508FD689FEC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzUi-0000Oq-Cl; Fri, 03 Feb 2023 12:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pNzUh-0000OZ-6O
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pNzUf-0007v9-LL
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675443896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9cjyxwO+9sHn20JSz0LROATzvZFWOerCGYSQtOb9qKg=;
 b=hxuFPMAMGX++p+NZdXPfyvAA0ZT7/UNmOHYTDfpwibjocFJxWeo5IqXOwmm38N2/qP/sBb
 uttVMTStUwgEr3xRr2tBO1/dFYFe5IrXoRHAB7Kft5CBStqxSntKWGkMwsSzap5as/pxrw
 y0UhJ+EjlajWLf5i4m1NFuM6lXTJwH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-zlOX-447OtWYl1G963ohCg-1; Fri, 03 Feb 2023 12:04:53 -0500
X-MC-Unique: zlOX-447OtWYl1G963ohCg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B9A800B24;
 Fri,  3 Feb 2023 17:04:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A80CD492C14;
 Fri,  3 Feb 2023 17:04:52 +0000 (UTC)
Date: Fri, 3 Feb 2023 11:04:50 -0600
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 12/13] block: Fix bdrv_co_create_opts_simple() to open
 images with no_co_wrapper
Message-ID: <20230203170450.esq5o7zaezuc7fwr@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
 <20230126172432.436111-13-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126172432.436111-13-kwolf@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 26, 2023 at 06:24:31PM +0100, Kevin Wolf wrote:
> bdrv_co_create_opts_simpl() runs in a coroutine. Therefore it is not

simple

> allowed to open images directly. Fix the call to use the corresponding
> no_co_wrapper instead.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block.c b/block.c
> index aa9062f2c1..6eac16eac5 100644
> --- a/block.c
> +++ b/block.c
> @@ -657,8 +657,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
>      options = qdict_new();
>      qdict_put_str(options, "driver", drv->format_name);
>  
> -    blk = blk_new_open(filename, NULL, options,
> -                       BDRV_O_RDWR | BDRV_O_RESIZE, errp);
> +    blk = blk_co_new_open(filename, NULL, options,
> +                          BDRV_O_RDWR | BDRV_O_RESIZE, errp);
>      if (!blk) {
>          error_prepend(errp, "Protocol driver '%s' does not support image "
>                        "creation, and opening the image failed: ",
> -- 
> 2.38.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


