Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DD509BD7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:10:07 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSpC-0005Uj-Nj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhS8t-00027K-Ey
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:26:23 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:42177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhS8r-0007dF-Vh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:26:23 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-HVmGIxzrNTu9uC_xViXEtQ-1; Thu, 21 Apr 2022 04:26:14 -0400
X-MC-Unique: HVmGIxzrNTu9uC_xViXEtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35C401014A60;
 Thu, 21 Apr 2022 08:26:14 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17CED404D2E2;
 Thu, 21 Apr 2022 08:26:12 +0000 (UTC)
Date: Thu, 21 Apr 2022 10:26:11 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 5/5] 9pfs: fix removing non-existent POSIX ACL xattr on
 macOS host
Message-ID: <20220421102611.5a2a0564@bahia>
In-Reply-To: <284de6154d7ad57ac6539a7318aa2364261da105.1650370027.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <284de6154d7ad57ac6539a7318aa2364261da105.1650370027.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Apr 2022 13:43:30 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> When mapped POSIX ACL is used, we are ignoring errors when trying
> to remove a POSIX ACL xattr that does not exist. On Linux hosts we
> would get ENODATA in such cases, on macOS hosts however we get
> ENOATTR instead, so ignore ENOATTR errors as well.
> 
> This patch fixes e.g. a command on Linux guest like:
> 
>   cp --preserve=mode old new
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-posix-acl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
> index eadae270dd..2bf155f941 100644
> --- a/hw/9pfs/9p-posix-acl.c
> +++ b/hw/9pfs/9p-posix-acl.c
> @@ -65,7 +65,13 @@ static int mp_pacl_removexattr(FsContext *ctx,
>      int ret;
>  
>      ret = local_removexattr_nofollow(ctx, path, MAP_ACL_ACCESS);
> -    if (ret == -1 && errno == ENODATA) {
> +    if (ret == -1 &&
> +          (errno == ENODATA
> +#ifdef ENOATTR
> +          || errno == ENOATTR
> +#endif
> +          )

We already have this in <qemu/xattr.h> which is included by
9p-posix-acl.c :

/*
 * Modern distributions (e.g. Fedora 15), have no libattr.so, place attr.h
 * in /usr/include/sys, and don't have ENOATTR.
 */


#ifdef CONFIG_LIBATTR
#  include <attr/xattr.h>
#else
#  if !defined(ENOATTR)
#    define ENOATTR ENODATA
#  endif
#  include <sys/xattr.h>
#endif

I guess this patch could just s/ENODATA/ENOATTR/ to avoid the
extra ifdefery.

> +    ) {
>          /*
>           * We don't get ENODATA error when trying to remove a
>           * posix acl that is not present. So don't throw the error


