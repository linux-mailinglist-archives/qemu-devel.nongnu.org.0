Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5646F478A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:45:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pts9k-00084q-2C; Tue, 02 May 2023 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pts9h-00084Q-Vw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pts9g-0007XM-96
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683042181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xl8B7Hoag5VEXFozvo4Ia9rRJMwFaCM8mAYKxZI+zJE=;
 b=BF7/GlcHdRmWRANPu3gFbydxQelORZTeHJo9gofW36xmZJUiF2/HuxZfFn6728srGVGeoF
 diygddfxRJGOjq9KW+GrOqc9n0fOMO10Ey6TwDrx6QEZBIime9UyP+qzaD/Li9ve2vDZ0U
 F+qAPzgn2dkxMKuuV/GubBgQrclKbCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-kgZznv_pOqGm5hBR5_5Thg-1; Tue, 02 May 2023 11:42:57 -0400
X-MC-Unique: kgZznv_pOqGm5hBR5_5Thg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D3FA0F389;
 Tue,  2 May 2023 15:42:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F17404E4AD;
 Tue,  2 May 2023 15:42:52 +0000 (UTC)
Date: Tue, 2 May 2023 17:42:51 +0200
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
Subject: Re: [PATCH v4 06/20] block/export: wait for vhost-user-blk requests
 when draining
Message-ID: <ZFEve2GfI0TqsItA@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-7-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-7-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> Each vhost-user-blk request runs in a coroutine. When the BlockBackend
> enters a drained section we need to enter a quiescent state. Currently
> any in-flight requests race with bdrv_drained_begin() because it is
> unaware of vhost-user-blk requests.
> 
> When blk_co_preadv/pwritev()/etc returns it wakes the
> bdrv_drained_begin() thread but vhost-user-blk request processing has
> not yet finished. The request coroutine continues executing while the
> main loop thread thinks it is in a drained section.
> 
> One example where this is unsafe is for blk_set_aio_context() where
> bdrv_drained_begin() is called before .aio_context_detached() and
> .aio_context_attach(). If request coroutines are still running after
> bdrv_drained_begin(), then the AioContext could change underneath them
> and they race with new requests processed in the new AioContext. This
> could lead to virtqueue corruption, for example.
> 
> (This example is theoretical, I came across this while reading the
> code and have not tried to reproduce it.)
> 
> It's easy to make bdrv_drained_begin() wait for in-flight requests: add
> a .drained_poll() callback that checks the VuServer's in-flight counter.
> VuServer just needs an API that returns true when there are requests in
> flight. The in-flight counter needs to be atomic.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/vhost-user-server.h     |  4 +++-
>  block/export/vhost-user-blk-server.c | 16 ++++++++++++++++
>  util/vhost-user-server.c             | 14 ++++++++++----
>  3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
> index bc0ac9ddb6..b1c1cda886 100644
> --- a/include/qemu/vhost-user-server.h
> +++ b/include/qemu/vhost-user-server.h
> @@ -40,8 +40,9 @@ typedef struct {
>      int max_queues;
>      const VuDevIface *vu_iface;
>  
> +    unsigned int in_flight; /* atomic */
> +
>      /* Protected by ctx lock */
> -    unsigned int in_flight;
>      bool wait_idle;
>      VuDev vu_dev;
>      QIOChannel *ioc; /* The I/O channel with the client */
> @@ -62,6 +63,7 @@ void vhost_user_server_stop(VuServer *server);
>  
>  void vhost_user_server_inc_in_flight(VuServer *server);
>  void vhost_user_server_dec_in_flight(VuServer *server);
> +bool vhost_user_server_has_in_flight(VuServer *server);
>  
>  void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
>  void vhost_user_server_detach_aio_context(VuServer *server);
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 841acb36e3..092b86aae4 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -272,7 +272,20 @@ static void vu_blk_exp_resize(void *opaque)
>      vu_config_change_msg(&vexp->vu_server.vu_dev);
>  }
>  
> +/*
> + * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
> + *
> + * Called with vexp->export.ctx acquired.
> + */
> +static bool vu_blk_drained_poll(void *opaque)
> +{
> +    VuBlkExport *vexp = opaque;
> +
> +    return vhost_user_server_has_in_flight(&vexp->vu_server);
> +}
> +
>  static const BlockDevOps vu_blk_dev_ops = {
> +    .drained_poll  = vu_blk_drained_poll,
>      .resize_cb = vu_blk_exp_resize,
>  };

You're adding a new function pointer to an existing BlockDevOps...

> @@ -314,6 +327,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
>      vu_blk_initialize_config(blk_bs(exp->blk), &vexp->blkcfg,
>                               logical_block_size, num_queues);
>  
> +    blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
>      blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
>                                   vexp);
>  
>      blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);

..but still add a second blk_set_dev_ops(). Maybe a bad merge conflict
resolution with commit ca858a5fe94?

> @@ -323,6 +337,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
>                                   num_queues, &vu_blk_iface, errp)) {
>          blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
>                                          blk_aio_detach, vexp);
> +        blk_set_dev_ops(exp->blk, NULL, NULL);
>          g_free(vexp->handler.serial);
>          return -EADDRNOTAVAIL;
>      }
> @@ -336,6 +351,7 @@ static void vu_blk_exp_delete(BlockExport *exp)
>  
>      blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
>                                      vexp);
> +    blk_set_dev_ops(exp->blk, NULL, NULL);
>      g_free(vexp->handler.serial);
>  }

These two hunks are then probably already fixes for ca858a5fe94 and
should be a separate patch if so.

> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index 1622f8cfb3..2e6b640050 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -78,17 +78,23 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
>  void vhost_user_server_inc_in_flight(VuServer *server)
>  {
>      assert(!server->wait_idle);
> -    server->in_flight++;
> +    qatomic_inc(&server->in_flight);
>  }
>  
>  void vhost_user_server_dec_in_flight(VuServer *server)
>  {
> -    server->in_flight--;
> -    if (server->wait_idle && !server->in_flight) {
> -        aio_co_wake(server->co_trip);
> +    if (qatomic_fetch_dec(&server->in_flight) == 1) {
> +        if (server->wait_idle) {
> +            aio_co_wake(server->co_trip);
> +        }
>      }
>  }
>  
> +bool vhost_user_server_has_in_flight(VuServer *server)
> +{
> +    return qatomic_load_acquire(&server->in_flight) > 0;
> +}
> +

Any reason why you left the server->in_flight accesses in
vu_client_trip() non-atomic?

Kevin


