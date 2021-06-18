Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61493AD388
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:21:45 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKzo-0002SK-Pd
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luKya-0001Ow-Gm
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luKyY-0000Fr-Mc
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624047625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dkHwplhS1nYMxinZPxSNlIgFZxePa5QwQgW/cwEdZyI=;
 b=hgbozSHBlu8jzRw1Lod2EpjXRJF1WZng6E5mac6a1S7FFK7kqGbWEb4lqK9PXUmHtvy49u
 Eojx2l7Oq+PgtbMugxWETPSXAVrr5cpI0AqxW6inJwDqQtGiU8wtxhcTB+QRKOR3VUEmOS
 B4f9ZjiJB/MM7KFjA2HFMrFTVo+/VLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-syy-ykH0OgqqKGQi7zZrFw-1; Fri, 18 Jun 2021 16:20:23 -0400
X-MC-Unique: syy-ykH0OgqqKGQi7zZrFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E86A800C78;
 Fri, 18 Jun 2021 20:20:22 +0000 (UTC)
Received: from redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E995718AD4;
 Fri, 18 Jun 2021 20:20:21 +0000 (UTC)
Date: Fri, 18 Jun 2021 15:20:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
Message-ID: <20210618202020.3t777osf6doytjal@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617155247.442150-6-mreitz@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:52:46PM +0200, Max Reitz wrote:
> bdrv_co_block_status() does it for us, we do not need to do it here.
> 
> The advantage of not capping *pnum is that bdrv_co_block_status() can
> cache larger data regions than requested by its caller.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 616f9ae6c4..930bd234de 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -1702,7 +1702,7 @@ static int coroutine_fn nbd_client_co_block_status(
>          .type = NBD_CMD_BLOCK_STATUS,
>          .from = offset,
>          .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
> -                   MIN(bytes, s->info.size - offset)),
> +                   s->info.size - offset),
>          .flags = NBD_CMD_FLAG_REQ_ONE,

I'd love to someday get rid of using NBD_CMD_FLAG_REQ_ONE (so the
server can reply with more extents in one go), but that's a bigger
task and unrelated to your block-layer cache.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


