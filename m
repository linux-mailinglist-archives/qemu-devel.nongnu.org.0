Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFED6DB4A7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pksK3-0006W3-So; Fri, 07 Apr 2023 16:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksK1-0006Vn-Ko
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksK0-0005Jh-9z
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680897871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T+NrTQCRRemossuN8Ns6C691CX+ZNCNp2ElCIGl+5pA=;
 b=MIA+KsKSW/XS4oPh4Uvqu71PIiC4l8twXtsvx8QDLabj1ipaqDsyeLO+vRYrmK6SvsrYE/
 kAMlb5YBHZoBNaaM5qq3NmsdfJYSa4fBbmEL7O93gYZV1q60PsKELyYV8GO66JHrB1w5Uk
 8ThT1dEgipkljnTu9UpD1Uxlj7kEBL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-MnuyBEDCPamR4YGaF8ZnKQ-1; Fri, 07 Apr 2023 16:04:28 -0400
X-MC-Unique: MnuyBEDCPamR4YGaF8ZnKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6DFB85C064;
 Fri,  7 Apr 2023 20:04:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0C140C6EC4;
 Fri,  7 Apr 2023 20:04:26 +0000 (UTC)
Date: Fri, 7 Apr 2023 15:04:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 8/8] block, block-backend: write some hot coroutine
 wrappers by hand
Message-ID: <efzg2o4orxbbtaxxw2wqxao3jfqh7bgomd2wni63ck4zxhzrbz@ma6uxp4msloy>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Fri, Apr 07, 2023 at 05:33:03PM +0200, Paolo Bonzini wrote:
> The introduction of the graph lock is causing blk_get_geometry, a hot function
> used in the I/O path, to create a coroutine.  However, the only part that really
> needs to run in coroutine context is the call to bdrv_co_refresh_total_sectors,
> which in turn only happens in the rare case of host CD-ROM devices.
> 
> So, write by hand the three wrappers on the path from blk_co_get_geometry to
> bdrv_co_refresh_total_sectors, so that the coroutine wrapper is only created
> if bdrv_nb_sectors actually calls bdrv_refresh_total_sectors.
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c                           | 22 ++++++++++++++++++++++
>  block/block-backend.c             | 27 +++++++++++++++++++++++++++
>  
>  include/sysemu/block-backend-io.h |  5 ++---
>  4 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index dbbc8de30c24..3390efd18cf6 100644
> --- a/block.c
> +++ b/block.c
> @@ -5859,6 +5859,28 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
>      return bs->total_sectors;
>  }
>  
> +/*
> + * This wrapper is written by hand because this function is in the hot I/O path,
> + * via blk_get_geometry.
> + */
> +int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs)
> +{
> +    BlockDriver *drv = bs->drv;
> +    IO_CODE();
> +
> +    if (!drv)
> +        return -ENOMEDIUM;
> +
> +    if (!bs->bl.has_variable_length) {
> +        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);

Is this logic backwards?  Why are we only refreshing the total sectors
when we don't have variable length?

> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
> +    return bs->total_sectors;
> +}
> +

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


