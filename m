Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7F1BC1DB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 16:51:10 +0200 (CEST)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTRZk-00061e-73
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 10:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTRXa-000477-9u
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTRVz-0007Dw-MH
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:48:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20746
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jTRVz-0007DC-43
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588085231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuWi6k4/wVEazaDF/wSmOUS72nSy4lLoIe95841Yv0k=;
 b=hIRODIULFzZEMyDSPkwiF4W6101lQLPm690vEd/1uSkRWZpHVLSKFEN/r/IunMDXby1Kpg
 ZMOZI9ES+ztfQXoVYb7e4tWEY7h5syLCcLpx/8H6aZA69ADaivxPRsHNUQ1LsPfJvOniQT
 tlcIRo7vBuhuWvrWVACuKnmhWDlUUWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-0ASkzUwtO2m15NPWNYtEUg-1; Tue, 28 Apr 2020 10:47:09 -0400
X-MC-Unique: 0ASkzUwtO2m15NPWNYtEUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FFB100A614;
 Tue, 28 Apr 2020 14:47:08 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-37.ams2.redhat.com [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9125D9E2;
 Tue, 28 Apr 2020 14:47:07 +0000 (UTC)
Date: Tue, 28 Apr 2020 16:47:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 3/4] block: Add blk_make_empty()
Message-ID: <20200428144706.GJ5789@linux.fritz.box>
References: <20200428132629.796753-1-mreitz@redhat.com>
 <20200428132629.796753-4-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200428132629.796753-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.04.2020 um 15:26 hat Max Reitz geschrieben:
> Two callers of BlockDriver.bdrv_make_empty() remain that should not call
> this method directly.  Both do not have access to a BdrvChild, but they
> can use a BlockBackend, so we add this function that lets them use it.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/sysemu/block-backend.h | 2 ++
>  block/block-backend.c          | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backen=
d.h
> index d37c1244dd..14338b76dc 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -266,4 +266,6 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_=
in, int64_t off_in,
> =20
>  const BdrvChild *blk_root(BlockBackend *blk);
> =20
> +int blk_make_empty(BlockBackend *blk, Error **errp);
> +
>  #endif
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 3592066b42..5d36efd32f 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2402,3 +2402,8 @@ const BdrvChild *blk_root(BlockBackend *blk)
>  {
>      return blk->root;
>  }
> +
> +int blk_make_empty(BlockBackend *blk, Error **errp)
> +{
> +    return bdrv_make_empty(blk->root, errp);
> +}

Should we check that blk->root !=3D NULL? Most other functions do that
through blk_is_available().

Kevin


