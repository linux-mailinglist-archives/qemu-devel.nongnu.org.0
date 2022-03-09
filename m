Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2B4D3090
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:52:14 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwjd-0004Dp-Ec
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRwiB-0002hB-V5
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRwi8-0000Kt-DO
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646833838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ggemj0iI5mgiSOrmoF3mLYmy0yJyoAdp3w/J+LourJo=;
 b=ijBIzHaicXr5nR56iVwcF/PBi7GVmb7aU2JKL/H4iqvVSbuHAWkj0tcme7HEHTGz/Kju3m
 8hcbCwRNKEJwCf6/tv3Nr6OgHtnUXAw11wbQ18r/gUD+xuwadB3yaeorzry2tgMnKKYu9w
 YuCOCf8ndx/Zkr2Or1cluELXwBCIMGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-ECviigOgN8-KTiJ77YKqrA-1; Wed, 09 Mar 2022 08:50:36 -0500
X-MC-Unique: ECviigOgN8-KTiJ77YKqrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB93A1006AA5;
 Wed,  9 Mar 2022 13:50:34 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A98E8495C;
 Wed,  9 Mar 2022 13:49:45 +0000 (UTC)
Date: Wed, 9 Mar 2022 07:49:43 -0600
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/5] introduce BDRV_POLL_WHILE_UNLOCKED
Message-ID: <20220309134943.5etrc52yr7nne2gf@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <20220301142113.163174-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301142113.163174-3-eesposit@redhat.com>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 09:21:10AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.
> See doc comment for more info.

This sentence implies there is a doc comment...

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index e1713ee306..5a7a850c16 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -512,6 +512,11 @@ void bdrv_drain_all(void);
>      AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
>                     cond); })
>  
> +#define BDRV_POLL_WHILE_UNLOCKED(bs, cond) ({              \
> +    BlockDriverState *bs_ = (bs);                          \
> +    AIO_WAIT_WHILE_UNLOCKED(bdrv_get_aio_context(bs_),     \
> +                            cond); })
> +

but none is added here.  I'm presuming that the comment is already in
the file (not shown in the limited context view here), but it may be
worth tweaking the commit message to mention that.

>  int generated_co_wrapper bdrv_pdiscard(BdrvChild *child, int64_t offset,
>                                         int64_t bytes);
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> -- 
> 2.31.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


