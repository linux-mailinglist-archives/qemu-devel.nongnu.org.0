Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E9518CA3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:54:20 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlxf9-00040d-GZ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxcV-0001W7-S0
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxcU-0003yg-1A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651603880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ii6bpoOAFhsNCNad559iDBuDBifd+IUwJf14cwSErkI=;
 b=KwF8gX1/NTCi+idNQ6OOQlLUAe3e1NZ7J7NA7gywFGJwKgwb9oWYl5ri5qbxfzZzgVJjZs
 TZIA5s2ryK8blsppVp+XledVMQt/nUbcDKUwfQDbJ/mybq3uzBbuo+TPSlvRRxq2dHf2YE
 4rVtmloMmPf/ufp2Dgs7DYZHhLvyr4o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-PXbH8d_FOmyckEqEcC0lZg-1; Tue, 03 May 2022 14:50:52 -0400
X-MC-Unique: PXbH8d_FOmyckEqEcC0lZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05073950B9B;
 Tue,  3 May 2022 18:50:50 +0000 (UTC)
Received: from redhat.com (unknown [10.22.10.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FF809E71;
 Tue,  3 May 2022 18:50:49 +0000 (UTC)
Date: Tue, 3 May 2022 13:50:47 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] block/file: Add file-specific image info
Message-ID: <20220503185047.4w4ulpdrzn2wbpdq@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-5-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-5-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 04:55:29PM +0200, Hanna Reitz wrote:
> Add some (optional) information that the file driver can provide for
> image files, namely the extent size.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  qapi/block-core.json | 26 ++++++++++++++++++++++++--
>  block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 

> +++ b/block/file-posix.c
> @@ -3068,6 +3068,34 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>      return 0;
>  }
>  
> +static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
> +                                                Error **errp)
> +{
> +    BDRVRawState *s = bs->opaque;
> +    ImageInfoSpecificFile *file_info = g_new0(ImageInfoSpecificFile, 1);
> +    ImageInfoSpecific *spec_info = g_new(ImageInfoSpecific, 1);
> +
> +    *spec_info = (ImageInfoSpecific){
> +        .type = IMAGE_INFO_SPECIFIC_KIND_FILE,
> +        .u.file.data = file_info,
> +    };
> +
> +#ifdef FS_IOC_FSGETXATTR
> +    {
> +        struct fsxattr attr;
> +        int ret;
> +
> +        ret = ioctl(s->fd, FS_IOC_FSGETXATTR, &attr);
> +        if (!ret && attr.fsx_extsize != 0) {
> +            file_info->has_extent_size = true;
> +            file_info->extent_size = attr.fsx_extsize;
> +        }
> +    }
> +#endif

Can/should we fall back to stat's st_blksize when the ioctl produces
nothing?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


