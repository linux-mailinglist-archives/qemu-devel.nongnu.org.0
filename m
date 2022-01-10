Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81C489C85
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:47:57 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wtn-0001Kd-UG
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1n6wrB-00077e-D9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:45:15 -0500
Received: from [2a00:1450:4864:20::432] (port=33288
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1n6wr9-0002fO-Cz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:45:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id r9so25802575wrg.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OB0RT1wqDqTi/8KrKQ19w/d9gd63fkzl+d88FjAyxOM=;
 b=T1mHLD9NCcbrcoKTJlJyfvIDacHZ6Kol6G0QQIb5EJixYHF9otI4xrRi9VPJyoJwcg
 HVjrVeVYBbH9ZKLctJ62eQXFqGkwU80GSNCkjQsl/+yaA6k0t2AHo4gQYRoKbqaKV7UF
 sTknVuuHcv9WW6uICfNz6fIgbHHWr47JUiNJq/PYtuPSXZC8mFKNead0oUYfnbS/zk4P
 ucO/2z8LDgT1G4nPUoqAU0exqVq6rfjx5f+6aLdrBaKN8EYGtZNu2UrSnXlCylQ5f8XO
 K6fiZM+mmBBcCPRCt/JTTw1LSBwaXG2Yl5JCJjrtK8VU1ibdWG07NQHgON9RkbzI+U4a
 aViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OB0RT1wqDqTi/8KrKQ19w/d9gd63fkzl+d88FjAyxOM=;
 b=tVzkelQyx0jgOko+vFWJ2lFEyakrdUGL2ZIwP1ofc07txlKTfeolo3CPvtbAg9ef4K
 9ud/yyKoIkbgdjtw99Z/DtNpEEzlp3+v52GVE2JxqvwGrkF0M1U5kEugOSQACBTwDaGJ
 +XI1lz9I3HFknjNdlVbzNCYH0cBwTNgwI/elSMmz+TnItaivsxk5zQTZDgbanwi6T/sd
 IQFr1a2ODoUoz1UY1tIRVoGhNeusp6XwtAz8M1qy7+TyVXT+D4eUuuL9BzHNCfNM2Qx6
 Tw3ReC8MgHwXIYTBM+74tQB5zhd2UVGm2Oth+7hB51tESV8/gKgCnvMXHnbRzMfaompZ
 ZFqw==
X-Gm-Message-State: AOAM530EweLYia/+xTfeDpJJXHUz1JJr+ZMTHr+RHpfopGOXlZ5bc7Nn
 YqL5u7RkNyUzrh3D96xbZ6A=
X-Google-Smtp-Source: ABdhPJzqmsKJXPs4e2PFyeh8psGxJd2yqUc2wqjA6FxwJZhLl3NQEiMG/PK9ZEhSSbje0p1xcxU7bA==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr203029wrp.306.1641829508584; 
 Mon, 10 Jan 2022 07:45:08 -0800 (PST)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id b14sm7395765wri.112.2022.01.10.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 07:45:07 -0800 (PST)
Date: Mon, 10 Jan 2022 15:45:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Message-ID: <YdxUgnmY0bt8nV6A@stefanha-x1.localdomain>
References: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
 <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rdBJTP8pJxCHutOM"
Content-Disposition: inline
In-Reply-To: <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aoiwa@yahoo-corp.jp, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rdBJTP8pJxCHutOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 05:20:57PM +0900, Hiroki Narukawa wrote:

Phil, thanks for notifying me.

> Coroutine pool size was 64 from long ago, and the basis was organized in =
the commit message in c740ad92.
>=20
> At that time, virtio-blk queue-size and num-queue were not configuable, a=
nd equivalent values were 128 and 1.
>=20
> Coroutine pool size 64 was fine then.
>=20
> Later queue-size and num-queue got configuable, and default values were i=
ncreased.
>=20
> Coroutine pool with size 64 exhausts frequently with random disk IO in ne=
w size, and slows down.
>=20
> This commit adjusts coroutine pool size adaptively with new values.
>=20
> This commit adds 64 by default, but now coroutine is not only for block d=
evices,
>=20
> and is not too much burdon comparing with new default.
>=20
> pool size of 128 * vCPUs.
>=20
> Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> ---
>  hw/block/virtio-blk.c    |  3 +++
>  include/qemu/coroutine.h |  5 +++++
>  util/qemu-coroutine.c    | 15 +++++++++++----
>  3 files changed, 19 insertions(+), 4 deletions(-)

Have you measured with QEMU 6.1 or later? Commit
d7ddd0a1618a75b31dc308bb37365ce1da972154 ("linux-aio: limit the batch
size using `aio-max-batch` parameter") can hide this issue so it may not
be apparent in recent QEMU releases.

I like your approach better than what I tried recently (I ended up
dropping the patch from my queue because it doesn't handle coroutines
created in one thread and terminated in another thread correctly):
https://patchew.org/QEMU/20210913153524.1190696-1-stefanha@redhat.com/

>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7cc9..726dbe14de 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -32,6 +32,7 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "migration/qemu-file-types.h"
>  #include "hw/virtio/virtio-access.h"
> +#include "qemu/coroutine.h"
> =20
>  /* Config size before the discard support (hide associated config fields=
) */
>  #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
> @@ -1222,6 +1223,8 @@ static void virtio_blk_device_realize(DeviceState *=
dev, Error **errp)
>      for (i =3D 0; i < conf->num_queues; i++) {
>          virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_outpu=
t);
>      }
> +    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->que=
ue_size
> +                                            / 2);

This over-provisions coroutine pools when IOThreads are configured,
because --device virtio-blk-pci,iothread=3Diothread2 will only submit I/O
requests in iothread2, for example. Other threads don't need to increase
their limit.

However, I think it's okay to use this inexact approach. It's still
better than the current hardcoded 64 coroutine pool size.

>      virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 4829ff373d..e52ed76ab2 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -331,6 +331,11 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
>   */
>  void coroutine_fn yield_until_fd_readable(int fd);
> =20
> +/**
> + * Increase coroutine pool size
> + */
> +void qemu_coroutine_increase_pool_batch_size(unsigned int additional_poo=
l_size);
> +
>  #include "qemu/lockable.h"
> =20
>  #endif /* QEMU_COROUTINE_H */
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index 38fb6d3084..080a1e0126 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -20,12 +20,14 @@
>  #include "qemu/coroutine_int.h"
>  #include "block/aio.h"
> =20
> +/** Initial batch size is 64, and is increased on demand */
>  enum {
> -    POOL_BATCH_SIZE =3D 64,
> +    POOL_INITIAL_BATCH_SIZE =3D 64,
>  };
> =20
>  /** Free list to speed up creation */
>  static QSLIST_HEAD(, Coroutine) release_pool =3D QSLIST_HEAD_INITIALIZER=
(pool);
> +static unsigned int pool_batch_size =3D POOL_INITIAL_BATCH_SIZE;
>  static unsigned int release_pool_size;
>  static __thread QSLIST_HEAD(, Coroutine) alloc_pool =3D QSLIST_HEAD_INIT=
IALIZER(pool);
>  static __thread unsigned int alloc_pool_size;
> @@ -49,7 +51,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry,=
 void *opaque)
>      if (CONFIG_COROUTINE_POOL) {
>          co =3D QSLIST_FIRST(&alloc_pool);
>          if (!co) {
> -            if (release_pool_size > POOL_BATCH_SIZE) {
> +            if (release_pool_size > pool_batch_size) {
>                  /* Slow path; a good place to register the destructor, t=
oo.  */
>                  if (!coroutine_pool_cleanup_notifier.notify) {
>                      coroutine_pool_cleanup_notifier.notify =3D coroutine=
_pool_cleanup;
> @@ -86,12 +88,12 @@ static void coroutine_delete(Coroutine *co)
>      co->caller =3D NULL;
> =20
>      if (CONFIG_COROUTINE_POOL) {
> -        if (release_pool_size < POOL_BATCH_SIZE * 2) {
> +        if (release_pool_size < pool_batch_size * 2) {
>              QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
>              qatomic_inc(&release_pool_size);
>              return;
>          }
> -        if (alloc_pool_size < POOL_BATCH_SIZE) {
> +        if (alloc_pool_size < pool_batch_size) {
>              QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
>              alloc_pool_size++;
>              return;
> @@ -202,3 +204,8 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_conte=
xt(Coroutine *co)
>  {
>      return co->ctx;
>  }
> +
> +void qemu_coroutine_increase_pool_batch_size(unsigned int additional_poo=
l_size)
> +{
> +    qatomic_add(&pool_batch_size, additional_pool_size);

If atomic_add() is used to modify pool_batch_size then qatomic_read()
should be used for loads. At a minimum it serves as documentation that
this is an atomic variable.

--rdBJTP8pJxCHutOM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcVIIACgkQnKSrs4Gr
c8jN9ggAhsfd9KFgJy4jhiVUPiGIkHRfmpvBb2/V+o3DAhZpgMvzvwNwt/5z4KnG
JYafevSB6IjdijHYLrP3EkdkW/f7KFYxcsbJ/T2Ff2IYUHQIw+CIFldbsG0Z7r7x
XbpNzx4u+g4UhiFlbnXBHDbVbcteBcYxSvkBFtrMJLHIY+BLBzZYChyrE25otnqI
WT+fbDaa9cED444ih+4R9HC+tjxGOyn/JE+ezZxnh6TgyuEBt501xtBBWqdHMph7
bWy86vRr6c5Qqb6wxL7cl0rb9GC09w0pnGjhqZOm5avZ6XGb6FvNU5Rn5PQT/+Kv
pnhvI2Zco/C3zYykDF/vzUiuJU4ADA==
=SGQo
-----END PGP SIGNATURE-----

--rdBJTP8pJxCHutOM--

