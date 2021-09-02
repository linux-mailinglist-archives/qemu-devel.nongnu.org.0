Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C23FEA72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:12:12 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhpT-0007LA-9D
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLho7-0006VK-QD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLho5-0007v0-As
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630570244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aOLdvMzj0t7XZz70F3eT/WC8oT0YTqb9RAioc1bghqw=;
 b=cPBKaGLpr5fVLno45w/yiqV3DsmTMKGDuMzhCwqj7B443+27WJASmSTmknLTqCSxprzWVa
 5z8sCSCa4YYMM4ENu5evPvTqzmMR8XIu6ZKbmSky82TJO4hJOSk5y6OFkKK4AJiXygZTiD
 txC/gRPI2Z3duJXWxbSBGdceobK1lAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-Yu-IgYzDNcuoovY8LMFx1A-1; Thu, 02 Sep 2021 04:10:41 -0400
X-MC-Unique: Yu-IgYzDNcuoovY8LMFx1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C465801ADA;
 Thu,  2 Sep 2021 08:10:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717B661093;
 Thu,  2 Sep 2021 08:10:39 +0000 (UTC)
Date: Thu, 2 Sep 2021 09:10:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YTCG/pLmM4d0TTeH@stefanha-x1.localdomain>
References: <20210901160923.525651-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210901160923.525651-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XBqjEpHLIEvp2dYY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, atheurer@redhat.com,
 Tingting Mao <timao@redhat.com>, jhopper@redhat.com,
 Honghao Wang <wanghonghao@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XBqjEpHLIEvp2dYY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> It was reported that enabling SafeStack reduces IOPS significantly
> (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> block device:
>=20
>   # fio --rw=3Drandrw --bs=3D4k --iodepth=3D64 --runtime=3D1m --direct=3D=
1 \
> =09--filename=3D/dev/vdb --name=3Djob1 --ioengine=3Dlibaio --thread \
> =09--group_reporting --numjobs=3D16 --time_based \
>         --output=3D/tmp/fio_result
>=20
> Serge Guelton and I found that SafeStack is not really at fault, it just
> increases the cost of coroutine creation. This fio workload exhausts the
> coroutine pool and coroutine creation becomes a bottleneck. Previous
> work by Honghao Wang also pointed to excessive coroutine creation.
>=20
> Creating new coroutines is expensive due to allocating new stacks with
> mmap(2) and mprotect(2). Currently there are thread-local and global
> pools that recycle old Coroutine objects and their stacks but the
> hardcoded size limit of 64 for thread-local pools and 128 for the global
> pool is insufficient for the fio benchmark shown above.
>=20
> This patch changes the coroutine pool algorithm to a simple thread-local
> pool without a size limit. Threads periodically shrink the pool down to
> a size sufficient for the maximum observed number of coroutines.
>=20
> This is a very simple algorithm. Fancier things could be done like
> keeping a minimum number of coroutines around to avoid latency when a
> new coroutine is created after a long period of inactivity. Another
> thought is to stop the timer when the pool size is zero for power saving
> on threads that aren't using coroutines. However, I'd rather not add
> bells and whistles unless they are really necessary.
>=20
> The global pool is removed by this patch. It can help to hide the fact
> that local pools are easily exhausted, but it's doesn't fix the root
> cause. I don't think there is a need for a global pool because QEMU's
> threads are long-lived, so let's keep things simple.
>=20
> Performance of the above fio benchmark is as follows:
>=20
>       Before   After
> IOPS     60k     97k
>=20
> Memory usage varies over time as needed by the workload:
>=20
>             VSZ (KB)             RSS (KB)
> Before fio  4705248              843128
> During fio  5747668 (+ ~100 MB)  849280
> After fio   4694996 (- ~100 MB)  845184
>=20
> This confirms that coroutines are indeed being freed when no longer
> needed.
>=20
> Thanks to Serge Guelton for working on identifying the bottleneck with
> me!
>=20
> Reported-by: Tingting Mao <timao@redhat.com>
> Cc: Serge Guelton <sguelton@redhat.com>
> Cc: Honghao Wang <wanghonghao@bytedance.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/coroutine-pool-timer.h | 36 +++++++++++++++++
>  include/qemu/coroutine.h            |  7 ++++
>  iothread.c                          |  6 +++
>  util/coroutine-pool-timer.c         | 35 ++++++++++++++++
>  util/main-loop.c                    |  5 +++
>  util/qemu-coroutine.c               | 62 ++++++++++++++---------------
>  util/meson.build                    |  1 +
>  7 files changed, 119 insertions(+), 33 deletions(-)
>  create mode 100644 include/qemu/coroutine-pool-timer.h
>  create mode 100644 util/coroutine-pool-timer.c

Adding Andrew and Jenifer in case they have thoughts on improving QEMU's
coroutine pool algorithm.

>=20
> diff --git a/include/qemu/coroutine-pool-timer.h b/include/qemu/coroutine=
-pool-timer.h
> new file mode 100644
> index 0000000000..c0b520ce99
> --- /dev/null
> +++ b/include/qemu/coroutine-pool-timer.h
> @@ -0,0 +1,36 @@
> +/*
> + * QEMU coroutine pool timer
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or=
 later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +#ifndef COROUTINE_POOL_TIMER_H
> +#define COROUTINE_POOL_TIMER_H
> +
> +#include "qemu/osdep.h"
> +#include "block/aio.h"
> +
> +/**
> + * A timer that periodically resizes this thread's coroutine pool, freei=
ng
> + * memory if there are too many unused coroutines.
> + *
> + * Threads that make heavy use of coroutines should use this. Failure to=
 resize
> + * the coroutine pool can lead to large amounts of memory sitting idle a=
nd
> + * never being used after the first time.
> + */
> +typedef struct {
> +    QEMUTimer *timer;
> +} CoroutinePoolTimer;
> +
> +/* Call this before the thread runs the AioContext */
> +void coroutine_pool_timer_init(CoroutinePoolTimer *pt, AioContext *ctx);
> +
> +/* Call this before the AioContext from the init function is destroyed *=
/
> +void coroutine_pool_timer_cleanup(CoroutinePoolTimer *pt);
> +
> +#endif /* COROUTINE_POOL_TIMER_H */
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 4829ff373d..fdb2955ff9 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -122,6 +122,13 @@ bool qemu_in_coroutine(void);
>   */
>  bool qemu_coroutine_entered(Coroutine *co);
> =20
> +/**
> + * Optionally call this function periodically to shrink the thread-local=
 pool
> + * down. Spiky workloads can create many coroutines and then never reach=
 that
> + * level again. Shrinking the pool reclaims memory in this case.
> + */
> +void qemu_coroutine_pool_periodic_resize(void);
> +
>  /**
>   * Provides a mutex that can be used to synchronise coroutines
>   */
> diff --git a/iothread.c b/iothread.c
> index ddbbde61f7..39a24f1a55 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -23,6 +23,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/rcu.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/coroutine-pool-timer.h"
> =20
>  typedef ObjectClass IOThreadClass;
> =20
> @@ -42,6 +43,7 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>  static void *iothread_run(void *opaque)
>  {
>      IOThread *iothread =3D opaque;
> +    CoroutinePoolTimer co_pool_timer;
> =20
>      rcu_register_thread();
>      /*
> @@ -53,6 +55,8 @@ static void *iothread_run(void *opaque)
>      iothread->thread_id =3D qemu_get_thread_id();
>      qemu_sem_post(&iothread->init_done_sem);
> =20
> +    coroutine_pool_timer_init(&co_pool_timer, iothread->ctx);
> +
>      while (iothread->running) {
>          /*
>           * Note: from functional-wise the g_main_loop_run() below can
> @@ -74,6 +78,8 @@ static void *iothread_run(void *opaque)
>          }
>      }
> =20
> +    coroutine_pool_timer_cleanup(&co_pool_timer);
> +
>      g_main_context_pop_thread_default(iothread->worker_context);
>      rcu_unregister_thread();
>      return NULL;
> diff --git a/util/coroutine-pool-timer.c b/util/coroutine-pool-timer.c
> new file mode 100644
> index 0000000000..36d3216718
> --- /dev/null
> +++ b/util/coroutine-pool-timer.c
> @@ -0,0 +1,35 @@
> +/*
> + * QEMU coroutine pool timer
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or=
 later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +#include "qemu/coroutine-pool-timer.h"
> +
> +static void coroutine_pool_timer_cb(void *opaque)
> +{
> +    CoroutinePoolTimer *pt =3D opaque;
> +    int64_t expiry_time_ns =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> +                             15 * NANOSECONDS_PER_SECOND;
> +
> +    qemu_coroutine_pool_periodic_resize();
> +    timer_mod(pt->timer, expiry_time_ns);
> +}
> +
> +void coroutine_pool_timer_init(CoroutinePoolTimer *pt, AioContext *ctx)
> +{
> +    pt->timer =3D aio_timer_new(ctx, QEMU_CLOCK_REALTIME, SCALE_NS,
> +                              coroutine_pool_timer_cb, pt);
> +    coroutine_pool_timer_cb(pt);
> +}
> +
> +void coroutine_pool_timer_cleanup(CoroutinePoolTimer *pt)
> +{
> +    timer_free(pt->timer);
> +    pt->timer =3D NULL;
> +}
> diff --git a/util/main-loop.c b/util/main-loop.c
> index 06b18b195c..23342e2215 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -33,6 +33,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/queue.h"
>  #include "qemu/compiler.h"
> +#include "qemu/coroutine-pool-timer.h"
> =20
>  #ifndef _WIN32
>  #include <sys/wait.h>
> @@ -131,6 +132,7 @@ static int qemu_signal_init(Error **errp)
> =20
>  static AioContext *qemu_aio_context;
>  static QEMUBH *qemu_notify_bh;
> +static CoroutinePoolTimer main_loop_co_pool_timer;
> =20
>  static void notify_event_cb(void *opaque)
>  {
> @@ -181,6 +183,9 @@ int qemu_init_main_loop(Error **errp)
>      g_source_set_name(src, "io-handler");
>      g_source_attach(src, NULL);
>      g_source_unref(src);
> +
> +    coroutine_pool_timer_init(&main_loop_co_pool_timer, qemu_aio_context=
);
> +
>      return 0;
>  }
> =20
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index 38fb6d3084..105dbfa89e 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -20,15 +20,11 @@
>  #include "qemu/coroutine_int.h"
>  #include "block/aio.h"
> =20
> -enum {
> -    POOL_BATCH_SIZE =3D 64,
> -};
> -
>  /** Free list to speed up creation */
> -static QSLIST_HEAD(, Coroutine) release_pool =3D QSLIST_HEAD_INITIALIZER=
(pool);
> -static unsigned int release_pool_size;
>  static __thread QSLIST_HEAD(, Coroutine) alloc_pool =3D QSLIST_HEAD_INIT=
IALIZER(pool);
>  static __thread unsigned int alloc_pool_size;
> +static __thread unsigned int num_coroutines;
> +static __thread unsigned int max_coroutines_this_slice;
>  static __thread Notifier coroutine_pool_cleanup_notifier;
> =20
>  static void coroutine_pool_cleanup(Notifier *n, void *value)
> @@ -48,26 +44,19 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entr=
y, void *opaque)
> =20
>      if (CONFIG_COROUTINE_POOL) {
>          co =3D QSLIST_FIRST(&alloc_pool);
> -        if (!co) {
> -            if (release_pool_size > POOL_BATCH_SIZE) {
> -                /* Slow path; a good place to register the destructor, t=
oo.  */
> -                if (!coroutine_pool_cleanup_notifier.notify) {
> -                    coroutine_pool_cleanup_notifier.notify =3D coroutine=
_pool_cleanup;
> -                    qemu_thread_atexit_add(&coroutine_pool_cleanup_notif=
ier);
> -                }
> -
> -                /* This is not exact; there could be a little skew betwe=
en
> -                 * release_pool_size and the actual size of release_pool=
.  But
> -                 * it is just a heuristic, it does not need to be perfec=
t.
> -                 */
> -                alloc_pool_size =3D qatomic_xchg(&release_pool_size, 0);
> -                QSLIST_MOVE_ATOMIC(&alloc_pool, &release_pool);
> -                co =3D QSLIST_FIRST(&alloc_pool);
> -            }
> -        }
>          if (co) {
>              QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
>              alloc_pool_size--;
> +        } else {
> +            if (!coroutine_pool_cleanup_notifier.notify) {
> +                coroutine_pool_cleanup_notifier.notify =3D coroutine_poo=
l_cleanup;
> +                qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier)=
;
> +            }
> +        }
> +
> +        num_coroutines++;
> +        if (num_coroutines > max_coroutines_this_slice) {
> +            max_coroutines_this_slice =3D num_coroutines;
>          }
>      }
> =20
> @@ -86,21 +75,28 @@ static void coroutine_delete(Coroutine *co)
>      co->caller =3D NULL;
> =20
>      if (CONFIG_COROUTINE_POOL) {
> -        if (release_pool_size < POOL_BATCH_SIZE * 2) {
> -            QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
> -            qatomic_inc(&release_pool_size);
> -            return;
> -        }
> -        if (alloc_pool_size < POOL_BATCH_SIZE) {
> -            QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
> -            alloc_pool_size++;
> -            return;
> -        }
> +        num_coroutines--;
> +        QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
> +        alloc_pool_size++;
> +        return;
>      }
> =20
>      qemu_coroutine_delete(co);
>  }
> =20
> +void qemu_coroutine_pool_periodic_resize(void)
> +{
> +    unsigned pool_size_target =3D max_coroutines_this_slice - num_corout=
ines;
> +    max_coroutines_this_slice =3D num_coroutines;
> +
> +    while (alloc_pool_size > pool_size_target) {
> +        Coroutine *co =3D QSLIST_FIRST(&alloc_pool);
> +        QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
> +        qemu_coroutine_delete(co);
> +        alloc_pool_size--;
> +    }
> +}
> +
>  void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
>  {
>      QSIMPLEQ_HEAD(, Coroutine) pending =3D QSIMPLEQ_HEAD_INITIALIZER(pen=
ding);
> diff --git a/util/meson.build b/util/meson.build
> index 779f413c86..06241097d2 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -63,6 +63,7 @@ if have_block
>    util_ss.add(files('buffer.c'))
>    util_ss.add(files('bufferiszero.c'))
>    util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTI=
NE_BACKEND'])))
> +  util_ss.add(files('coroutine-pool-timer.c'))
>    util_ss.add(files('hbitmap.c'))
>    util_ss.add(files('hexdump.c'))
>    util_ss.add(files('iova-tree.c'))
> --=20
> 2.31.1
>=20

--XBqjEpHLIEvp2dYY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwhv4ACgkQnKSrs4Gr
c8j8lwgAplT2fO/fln+2JfWuD1aOm+hoSEcyLWhdRob04b4GiKQ7LWdaVS2jEiNT
iN3QxA6qfyuFsbOBaHNhma+LgpmvVr/oYSVHrWUeJtXj7NiQPVczfr+c/rbqQnub
PFZpPjMsD22vD+hzsLoVT1OUoolwG+c5uRjCQcVg7WIdtu3FPLsLc9qzHNaMe3NG
oZ3VIWeAmWK/D2zSLZzIxu1tOI8TEbB2Ef0EWPsgVazf4pNOj2iKY27zLMgr4aOS
4oLL+kimh8ZfR0qJNk+Sxw7de4RknbbPbNxWfHpT0tYvwlQe3A+uemg5tfGEXvyg
V/kT9ZUzPJb77LdH5il4fTfEGowQzA==
=/FYh
-----END PGP SIGNATURE-----

--XBqjEpHLIEvp2dYY--


