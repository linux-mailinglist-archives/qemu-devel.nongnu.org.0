Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875976F47F1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:06:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsUh-0000cU-7f; Tue, 02 May 2023 12:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptsUZ-0000aZ-SB
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptsUX-0007k2-NF
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683043476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErZ2aQ2HUcNIqx2OSDpVI+Y5PzprxF1vRVAtic0RH4k=;
 b=EgkcipQjNz4YPm2gSa1mi88Ay8gP+OaCYderdbuazMZvrv5e6e0o1UXy4P8GSWvo03TXRm
 Euqy6BYSHb1d+syBjtYYno32mfBCuQQRXXjDTr/kXIJWu0TkMiGu8kFF0squJIAdcRc1D9
 VO1E1uPzrIZreMZyPgHCd01XRsL5q7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-NtVPAAg0PAGoLecNFhMJ8Q-1; Tue, 02 May 2023 12:04:32 -0400
X-MC-Unique: NtVPAAg0PAGoLecNFhMJ8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 506A218E5380;
 Tue,  2 May 2023 16:04:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F2C1410F24;
 Tue,  2 May 2023 16:04:25 +0000 (UTC)
Date: Tue, 2 May 2023 18:04:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 07/20] block/export: stop using is_external in
 vhost-user-blk server
Message-ID: <ZFE0iFnbr2ey0A7X@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-8-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> vhost-user activity must be suspended during bdrv_drained_begin/end().
> This prevents new requests from interfering with whatever is happening
> in the drained section.
> 
> Previously this was done using aio_set_fd_handler()'s is_external
> argument. In a multi-queue block layer world the aio_disable_external()
> API cannot be used since multiple AioContext may be processing I/O, not
> just one.
> 
> Switch to BlockDevOps->drained_begin/end() callbacks.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
>  util/vhost-user-server.c             | 10 +++----
>  2 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 092b86aae4..d20f69cd74 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface = {
>      .process_msg           = vu_blk_process_msg,
>  };
>  
> -static void blk_aio_attached(AioContext *ctx, void *opaque)
> -{
> -    VuBlkExport *vexp = opaque;
> -
> -    vexp->export.ctx = ctx;
> -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> -}
> -
> -static void blk_aio_detach(void *opaque)
> -{
> -    VuBlkExport *vexp = opaque;
> -
> -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> -    vexp->export.ctx = NULL;
> -}

So for changing the AioContext, we now rely on the fact that the node to
be changed is always drained, so the drain callbacks implicitly cover
this case, too?

>  static void
>  vu_blk_initialize_config(BlockDriverState *bs,
>                           struct virtio_blk_config *config,
> @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
>      vu_config_change_msg(&vexp->vu_server.vu_dev);
>  }
>  
> +/* Called with vexp->export.ctx acquired */
> +static void vu_blk_drained_begin(void *opaque)
> +{
> +    VuBlkExport *vexp = opaque;
> +
> +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> +}

Compared to the old code, we're losing the vexp->export.ctx = NULL. This
is correct at this point because after drained_begin we still keep
processing requests until we arrive at a quiescent state.

However, if we detach the AioContext because we're deleting the
iothread, won't we end up with a dangling pointer in vexp->export.ctx?
Or can we be certain that nothing interesting happens before drained_end
updates it with a new valid pointer again?

Kevin


