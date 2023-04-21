Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A936EA267
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 05:37:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pphZY-0005AP-6z; Thu, 20 Apr 2023 23:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1pphZT-00057u-0w
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:36:27 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1pphZQ-00073o-9N
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:36:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b5ce4f069so2282196b3a.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 20:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1682048176; x=1684640176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jAyLYhp4ydL9pXoFgTievz8fgHmpFOhj5xccyxtnbM=;
 b=lp2uPGA/zzrUBtwKYaosqKXYbp1Hfuaopw4Et1t12z8UqIEtWDFJUqvZZm8AXxlaCr
 J3D4BRSEP9UPFrmgBm0cFxhBEUg8LGrs1C4Ooa5DbdTjExLLIKiduWFeFqUZegKhy0lO
 PI+OUij8NLg8tdSDSUzWRwOKx0ey59ZTNH3eq4xYsIb0LEp/mIQ3vti5mCr2ciDZ2JMs
 GEfQiIjGOsYrMyGISiiPL/vdzn7T2jZsXypgv0Nc5Fg+66Fc4ppoZfjvKnb8nkPz0ZFC
 ByQBiMwVApRyDGt0M5Dap5+fvdGoz7hgNghs/fgJ1YsLYUm/2yHyvqNlG69gI7Ik3k7r
 H2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682048176; x=1684640176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jAyLYhp4ydL9pXoFgTievz8fgHmpFOhj5xccyxtnbM=;
 b=Ao6jTpSsvkFD9j2AZmTzkdrFgWxosDTeqkpgMJuaxR1WAR4aVl9Ye8MWTqbKT2o0jk
 1SCClKkgSN7ThXbMv0LfpPCZvq7GYXayz6JnGza+hPykGrh3xWdiEBPPBy5CV2xT9CTw
 lk3WuJOyglYb5zPhIWYkx6GoD2/4F1YgfmJLEEDe4a5pumXwaHntQQfpQrkSHkXbbqss
 6JUuKQg502e5kClJcQ4tPr917OHTwpXL85VavRZ76p+YGhADvdWN7mqO7Ku/1YPbQoGK
 PVXekWoUiDCIdH3svLT4J+ZYNq5X7suGWjTUH0Xd/HeBh/ZGJpp+y4hHqYRPUAyeGvyT
 /tqA==
X-Gm-Message-State: AAQBX9dcJe7s/IW8bAgHYBUa8VTowQrUtJBH3K7slbZW8u4Sria/kMR5
 GWyuKUorhfDZjuNWpfWjUC/y7/zx4KViVljGvNDP
X-Google-Smtp-Source: AKy350atzH7REymFEakAtJcBDaAv5k9Z2KJkzzHAI/Sc8hjb+qBg15jiqdI8NG3zUUovGGdTavKfB0tnlOpRCjqsQ48=
X-Received: by 2002:a05:6a21:328d:b0:ee:ac3c:d2de with SMTP id
 yt13-20020a056a21328d00b000eeac3cd2demr6256801pzb.28.1682048176395; Thu, 20
 Apr 2023 20:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230420113732.336620-1-stefanha@redhat.com>
 <20230420113732.336620-14-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-14-stefanha@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Fri, 21 Apr 2023 11:36:02 +0800
Message-ID: <CACycT3suSR+nYhe4z2zuocYsBBVSDBCE+614zT0jfDZCBRveaA@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] block/export: rewrite vduse-blk drain code
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Peter Lieven <pl@kamp.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, 
 Julia Suvorova <jusual@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 xen-devel@lists.xenproject.org, Hanna Reitz <hreitz@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Paul Durrant <paul@xen.org>, Aarushi Mehta <mehta.aaru20@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On Thu, Apr 20, 2023 at 7:39=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> vduse_blk_detach_ctx() waits for in-flight requests using
> AIO_WAIT_WHILE(). This is not allowed according to a comment in
> bdrv_set_aio_context_commit():
>
>   /*
>    * Take the old AioContex when detaching it from bs.
>    * At this point, new_context lock is already acquired, and we are now
>    * also taking old_context. This is safe as long as bdrv_detach_aio_con=
text
>    * does not call AIO_POLL_WHILE().
>    */
>
> Use this opportunity to rewrite the drain code in vduse-blk:
>
> - Use the BlockExport refcount so that vduse_blk_exp_delete() is only
>   called when there are no more requests in flight.
>
> - Implement .drained_poll() so in-flight request coroutines are stopped
>   by the time .bdrv_detach_aio_context() is called.
>
> - Remove AIO_WAIT_WHILE() from vduse_blk_detach_ctx() to solve the
>   .bdrv_detach_aio_context() constraint violation. It's no longer
>   needed due to the previous changes.
>
> - Always handle the VDUSE file descriptor, even in drained sections. The
>   VDUSE file descriptor doesn't submit I/O, so it's safe to handle it in
>   drained sections. This ensures that the VDUSE kernel code gets a fast
>   response.
>
> - Suspend virtqueue fd handlers in .drained_begin() and resume them in
>   .drained_end(). This eliminates the need for the
>   aio_set_fd_handler(is_external=3Dtrue) flag, which is being removed fro=
m
>   QEMU.
>
> This is a long list but splitting it into individual commits would
> probably lead to git bisect failures - the changes are all related.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vduse-blk.c | 132 +++++++++++++++++++++++++++------------
>  1 file changed, 93 insertions(+), 39 deletions(-)
>
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> index f7ae44e3ce..35dc8fcf45 100644
> --- a/block/export/vduse-blk.c
> +++ b/block/export/vduse-blk.c
> @@ -31,7 +31,8 @@ typedef struct VduseBlkExport {
>      VduseDev *dev;
>      uint16_t num_queues;
>      char *recon_file;
> -    unsigned int inflight;
> +    unsigned int inflight; /* atomic */
> +    bool vqs_started;
>  } VduseBlkExport;
>
>  typedef struct VduseBlkReq {
> @@ -41,13 +42,24 @@ typedef struct VduseBlkReq {
>
>  static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
>  {
> -    vblk_exp->inflight++;
> +    if (qatomic_fetch_inc(&vblk_exp->inflight) =3D=3D 0) {

I wonder why we need to use atomic operations here.

> +        /* Prevent export from being deleted */
> +        aio_context_acquire(vblk_exp->export.ctx);
> +        blk_exp_ref(&vblk_exp->export);
> +        aio_context_release(vblk_exp->export.ctx);
> +    }
>  }
>
>  static void vduse_blk_inflight_dec(VduseBlkExport *vblk_exp)
>  {
> -    if (--vblk_exp->inflight =3D=3D 0) {
> +    if (qatomic_fetch_dec(&vblk_exp->inflight) =3D=3D 1) {
> +        /* Wake AIO_WAIT_WHILE() */
>          aio_wait_kick();
> +
> +        /* Now the export can be deleted */
> +        aio_context_acquire(vblk_exp->export.ctx);
> +        blk_exp_unref(&vblk_exp->export);
> +        aio_context_release(vblk_exp->export.ctx);
>      }
>  }
>
> @@ -124,8 +136,12 @@ static void vduse_blk_enable_queue(VduseDev *dev, Vd=
useVirtq *vq)
>  {
>      VduseBlkExport *vblk_exp =3D vduse_dev_get_priv(dev);
>
> +    if (!vblk_exp->vqs_started) {
> +        return; /* vduse_blk_drained_end() will start vqs later */
> +    }
> +
>      aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> -                       true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
> +                       false, on_vduse_vq_kick, NULL, NULL, NULL, vq);
>      /* Make sure we don't miss any kick afer reconnecting */
>      eventfd_write(vduse_queue_get_fd(vq), 1);
>  }
> @@ -133,9 +149,14 @@ static void vduse_blk_enable_queue(VduseDev *dev, Vd=
useVirtq *vq)
>  static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
>  {
>      VduseBlkExport *vblk_exp =3D vduse_dev_get_priv(dev);
> +    int fd =3D vduse_queue_get_fd(vq);
>
> -    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
> -                       true, NULL, NULL, NULL, NULL, NULL);
> +    if (fd < 0) {
> +        return;
> +    }
> +
> +    aio_set_fd_handler(vblk_exp->export.ctx, fd, false,
> +                       NULL, NULL, NULL, NULL, NULL);
>  }
>
>  static const VduseOps vduse_blk_ops =3D {
> @@ -152,42 +173,19 @@ static void on_vduse_dev_kick(void *opaque)
>
>  static void vduse_blk_attach_ctx(VduseBlkExport *vblk_exp, AioContext *c=
tx)
>  {
> -    int i;
> -
>      aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->=
dev),
> -                       true, on_vduse_dev_kick, NULL, NULL, NULL,
> +                       false, on_vduse_dev_kick, NULL, NULL, NULL,
>                         vblk_exp->dev);
>
> -    for (i =3D 0; i < vblk_exp->num_queues; i++) {
> -        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> -        int fd =3D vduse_queue_get_fd(vq);
> -
> -        if (fd < 0) {
> -            continue;
> -        }
> -        aio_set_fd_handler(vblk_exp->export.ctx, fd, true,
> -                           on_vduse_vq_kick, NULL, NULL, NULL, vq);
> -    }
> +    /* Virtqueues are handled by vduse_blk_drained_end() */
>  }
>
>  static void vduse_blk_detach_ctx(VduseBlkExport *vblk_exp)
>  {
> -    int i;
> -
> -    for (i =3D 0; i < vblk_exp->num_queues; i++) {
> -        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> -        int fd =3D vduse_queue_get_fd(vq);
> -
> -        if (fd < 0) {
> -            continue;
> -        }
> -        aio_set_fd_handler(vblk_exp->export.ctx, fd,
> -                           true, NULL, NULL, NULL, NULL, NULL);
> -    }
>      aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->=
dev),
> -                       true, NULL, NULL, NULL, NULL, NULL);
> +                       false, NULL, NULL, NULL, NULL, NULL);
>
> -    AIO_WAIT_WHILE(vblk_exp->export.ctx, vblk_exp->inflight > 0);
> +    /* Virtqueues are handled by vduse_blk_drained_begin() */
>  }
>
>
> @@ -220,8 +218,55 @@ static void vduse_blk_resize(void *opaque)
>                              (char *)&config.capacity);
>  }
>
> +static void vduse_blk_stop_virtqueues(VduseBlkExport *vblk_exp)
> +{
> +    for (uint16_t i =3D 0; i < vblk_exp->num_queues; i++) {
> +        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> +        vduse_blk_disable_queue(vblk_exp->dev, vq);
> +    }
> +
> +    vblk_exp->vqs_started =3D false;
> +}
> +
> +static void vduse_blk_start_virtqueues(VduseBlkExport *vblk_exp)
> +{
> +    vblk_exp->vqs_started =3D true;
> +
> +    for (uint16_t i =3D 0; i < vblk_exp->num_queues; i++) {
> +        VduseVirtq *vq =3D vduse_dev_get_queue(vblk_exp->dev, i);
> +        vduse_blk_enable_queue(vblk_exp->dev, vq);
> +    }
> +}
> +
> +static void vduse_blk_drained_begin(void *opaque)
> +{
> +    BlockExport *exp =3D opaque;
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +
> +    vduse_blk_stop_virtqueues(vblk_exp);
> +}
> +
> +static void vduse_blk_drained_end(void *opaque)
> +{
> +    BlockExport *exp =3D opaque;
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +
> +    vduse_blk_start_virtqueues(vblk_exp);
> +}
> +
> +static bool vduse_blk_drained_poll(void *opaque)
> +{
> +    BlockExport *exp =3D opaque;
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +
> +    return qatomic_read(&vblk_exp->inflight) > 0;
> +}
> +
>  static const BlockDevOps vduse_block_ops =3D {
> -    .resize_cb =3D vduse_blk_resize,
> +    .resize_cb     =3D vduse_blk_resize,
> +    .drained_begin =3D vduse_blk_drained_begin,
> +    .drained_end   =3D vduse_blk_drained_end,
> +    .drained_poll  =3D vduse_blk_drained_poll,
>  };
>
>  static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *op=
ts,
> @@ -268,6 +313,7 @@ static int vduse_blk_exp_create(BlockExport *exp, Blo=
ckExportOptions *opts,
>      vblk_exp->handler.serial =3D g_strdup(vblk_opts->serial ?: "");
>      vblk_exp->handler.logical_block_size =3D logical_block_size;
>      vblk_exp->handler.writable =3D opts->writable;
> +    vblk_exp->vqs_started =3D true;
>
>      config.capacity =3D
>              cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BIT=
S);
> @@ -322,14 +368,20 @@ static int vduse_blk_exp_create(BlockExport *exp, B=
lockExportOptions *opts,
>          vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
>      }
>
> -    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), true,
> +    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), false,
>                         on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->de=
v);
>
>      blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_det=
ach,
>                                   vblk_exp);
> -
>      blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
>
> +    /*
> +     * We handle draining ourselves using an in-flight counter and by di=
sabling
> +     * virtqueue fd handlers. Do not queue BlockBackend requests, they n=
eed to
> +     * complete so the in-flight counter reaches zero.
> +     */
> +    blk_set_disable_request_queuing(exp->blk, true);
> +
>      return 0;
>  err:
>      vduse_dev_destroy(vblk_exp->dev);
> @@ -344,6 +396,9 @@ static void vduse_blk_exp_delete(BlockExport *exp)
>      VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
>      int ret;
>
> +    assert(qatomic_read(&vblk_exp->inflight) =3D=3D 0);
> +
> +    vduse_blk_detach_ctx(vblk_exp);
>      blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_=
detach,
>                                      vblk_exp);
>      blk_set_dev_ops(exp->blk, NULL, NULL);
> @@ -355,13 +410,12 @@ static void vduse_blk_exp_delete(BlockExport *exp)
>      g_free(vblk_exp->handler.serial);
>  }
>
> +/* Called with exp->ctx acquired */
>  static void vduse_blk_exp_request_shutdown(BlockExport *exp)
>  {
>      VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
>
> -    aio_context_acquire(vblk_exp->export.ctx);
> -    vduse_blk_detach_ctx(vblk_exp);
> -    aio_context_acquire(vblk_exp->export.ctx);
> +    vduse_blk_stop_virtqueues(vblk_exp);

Can we add a AIO_WAIT_WHILE() here? Then we don't need to
increase/decrease the BlockExport refcount during I/O processing.

Thanks,
Yongji

