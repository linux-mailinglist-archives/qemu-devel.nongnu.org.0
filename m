Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7DA6DB49E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pksEJ-0004Vv-5j; Fri, 07 Apr 2023 15:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksED-0004VX-Mb
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksEC-0003YG-6Q
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680897511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIxE3XJyoIDFaAXpGbaNkr3Ih8M5NFm0SdVuDRTBkJM=;
 b=BImxePHglG9ZspmsCLGGoRJWBqEXzbnsKdyku3HqZi7Z518l2+TAVFmIwlbrU3xlZrw3fO
 W6sF4M2vf/pcqJJnaeeZRlWmaWesVvaBzBBGAUNa9l6iBxZ4WSTZPrfi2l+S0f6dgw3j4Z
 wAcPJjkkb+zxJ5hEU2F3ZUCRgfNQI2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-m9fZMyD0MbmFkk9hBqrHoA-1; Fri, 07 Apr 2023 15:58:28 -0400
X-MC-Unique: m9fZMyD0MbmFkk9hBqrHoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5638811E7C;
 Fri,  7 Apr 2023 19:58:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 216072027062;
 Fri,  7 Apr 2023 19:58:27 +0000 (UTC)
Date: Fri, 7 Apr 2023 14:58:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 6/8] block-backend: inline bdrv_co_get_geometry
Message-ID: <ef2o7ozcqsy2di6n6nh7tqdxecd4fi33ih63pj2qgrvpk3f2ou@bu7g6gh2kxvi>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-7-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Fri, Apr 07, 2023 at 05:33:01PM +0200, Paolo Bonzini wrote:
> bdrv_co_get_geometry is only used in blk_co_get_geometry.  Inline it in
> there, to reduce the number of wrappers for bs->total_sectors.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c                  | 10 ----------
>  block/block-backend.c    |  8 ++++++--
>  include/block/block-io.h |  3 ---
>  3 files changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block.c b/block.c
> index 9de50ac7c811..dbbc8de30c24 100644
> --- a/block.c
> +++ b/block.c
> @@ -5879,16 +5879,6 @@ int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
>      return ret * BDRV_SECTOR_SIZE;
>  }
>  
> -/* return 0 as number of sectors if no device present or error */
> -void coroutine_fn bdrv_co_get_geometry(BlockDriverState *bs,
> -                                       uint64_t *nb_sectors_ptr)
> -{
> -    int64_t nb_sectors = bdrv_co_nb_sectors(bs);
> -    IO_CODE();

Pre-patch, we called bdrv_co_nb_sectors() before the IO_CODE guard...

> +/* return 0 as number of sectors if no device present or error */
>  void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
>                                        uint64_t *nb_sectors_ptr)
>  {
> +    BlockDriverState *bs = blk_bs(blk);
> +
>      IO_CODE();
>      GRAPH_RDLOCK_GUARD();
>  
> -    if (!blk_bs(blk)) {
> +    if (!bs) {
>          *nb_sectors_ptr = 0;
>      } else {
> -        bdrv_co_get_geometry(blk_bs(blk), nb_sectors_ptr);
> +        int64_t nb_sectors = bdrv_co_nb_sectors(bs);

...post-patch the order swaps.  That actually feels better to me, (the
guard is supposed to do sanity checks to detect coding bugs at the
soonest possible moment; if we have a bug, doing the work and only
later failing the check is not as safe as failing fast) - but probably
no impact to correctly written code.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


