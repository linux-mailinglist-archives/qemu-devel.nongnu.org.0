Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A936CDF1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 23:48:16 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVZ1-0000j0-8j
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 17:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbVVb-0008KH-FW; Tue, 27 Apr 2021 17:44:43 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:44218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbVVW-0006E3-U2; Tue, 27 Apr 2021 17:44:42 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C26432E15AC;
 Wed, 28 Apr 2021 00:44:29 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RPtdN08RMt-iT1qLdwu; Wed, 28 Apr 2021 00:44:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619559869; bh=sh07wPlwiZwrdHOPf7lagSwhjKq0zCy1U+D5H9A5zuk=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=JSvJIqNzJZaUuRyl0PZHOS6ID03rPLZJxLzv3gt4CHyZZWbG5WNNN8RORCloLdC5S
 zlB+g2DYA+wpipdKwFaqQQ+fYX2/31CakwN8sJSBg/s0JAqgNM6aVW8MplEZGbYllk
 pzscFI8KSZTcQnO3XtetvNtOG6FDArzOIwZdL1ec=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:4])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 h0hw1T0Afx-iSoiOOSh; Wed, 28 Apr 2021 00:44:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 28 Apr 2021 00:44:25 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 07/33] block/nbd: simplify waking of
 nbd_co_establish_connection()
Message-ID: <YIiFuVz/mHY0xOWP@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-8-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Instead of connect_bh, bh_ctx and wait_connect fields we can live with
> only one link to waiting coroutine, protected by mutex.
> 
> So new logic is:
> 
> nbd_co_establish_connection() sets wait_co under mutex, release the
> mutex and do yield(). Note, that wait_co may be scheduled by thread
> immediately after unlocking the mutex. Still, in main thread (or
> iothread) we'll not reach the code for entering the coroutine until the
> yield() so we are safe.
> 
> Both connect_thread_func() and nbd_co_establish_connection_cancel() do
> the following to handle wait_co:
> 
> Under mutex, if thr->wait_co is not NULL, call aio_co_wake() (which
> never tries to acquire aio context since previous commit, so we are
> safe to do it under thr->mutex) and set thr->wait_co to NULL.
> This way we protect ourselves of scheduling it twice.
> 
> Also this commit make nbd_co_establish_connection() less connected to
> bs (we have generic pointer to the coroutine, not use s->connection_co
> directly). So, we are on the way of splitting connection API out of
> nbd.c (which is overcomplicated now).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 49 +++++++++----------------------------------------
>  1 file changed, 9 insertions(+), 40 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index d67556c7ee..e1f39eda6c 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -87,12 +87,6 @@ typedef enum NBDConnectThreadState {
>  typedef struct NBDConnectThread {
>      /* Initialization constants */
>      SocketAddress *saddr; /* address to connect to */
> -    /*
> -     * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
> -     * NULL
> -     */
> -    QEMUBHFunc *bh_func;
> -    void *bh_opaque;
>  
>      /*
>       * Result of last attempt. Valid in FAIL and SUCCESS states.
> @@ -101,10 +95,10 @@ typedef struct NBDConnectThread {
>      QIOChannelSocket *sioc;
>      Error *err;
>  
> -    /* state and bh_ctx are protected by mutex */
>      QemuMutex mutex;
> +    /* All further fields are protected by mutex */
>      NBDConnectThreadState state; /* current state of the thread */
> -    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
> +    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>  } NBDConnectThread;
>  
>  typedef struct BDRVNBDState {
> @@ -138,7 +132,6 @@ typedef struct BDRVNBDState {
>      char *x_dirty_bitmap;
>      bool alloc_depth;
>  
> -    bool wait_connect;
>      NBDConnectThread *connect_thread;
>  } BDRVNBDState;
>  
> @@ -374,15 +367,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
>      return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>  }
>  
> -static void connect_bh(void *opaque)
> -{
> -    BDRVNBDState *state = opaque;
> -
> -    assert(state->wait_connect);
> -    state->wait_connect = false;
> -    aio_co_wake(state->connection_co);
> -}
> -
>  static void nbd_init_connect_thread(BDRVNBDState *s)
>  {
>      s->connect_thread = g_new(NBDConnectThread, 1);
> @@ -390,8 +374,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
>      *s->connect_thread = (NBDConnectThread) {
>          .saddr = QAPI_CLONE(SocketAddress, s->saddr),
>          .state = CONNECT_THREAD_NONE,
> -        .bh_func = connect_bh,
> -        .bh_opaque = s,
>      };
>  
>      qemu_mutex_init(&s->connect_thread->mutex);
> @@ -429,11 +411,9 @@ static void *connect_thread_func(void *opaque)
>      switch (thr->state) {
>      case CONNECT_THREAD_RUNNING:
>          thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
> -        if (thr->bh_ctx) {
> -            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
> -
> -            /* play safe, don't reuse bh_ctx on further connection attempts */
> -            thr->bh_ctx = NULL;
> +        if (thr->wait_co) {
> +            aio_co_schedule(NULL, thr->wait_co);
> +            thr->wait_co = NULL;
>          }
>          break;
>      case CONNECT_THREAD_RUNNING_DETACHED:
> @@ -487,20 +467,14 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>          abort();
>      }
>  
> -    thr->bh_ctx = qemu_get_current_aio_context();
> +    thr->wait_co = qemu_coroutine_self();
>  
>      qemu_mutex_unlock(&thr->mutex);
>  
> -
>      /*
>       * We are going to wait for connect-thread finish, but
>       * nbd_client_co_drain_begin() can interrupt.
> -     *
> -     * Note that wait_connect variable is not visible for connect-thread. It
> -     * doesn't need mutex protection, it used only inside home aio context of
> -     * bs.
>       */
> -    s->wait_connect = true;
>      qemu_coroutine_yield();
>  
>      qemu_mutex_lock(&thr->mutex);
> @@ -555,24 +529,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
>  {
>      BDRVNBDState *s = bs->opaque;
>      NBDConnectThread *thr = s->connect_thread;
> -    bool wake = false;
>  
>      qemu_mutex_lock(&thr->mutex);
>  
>      if (thr->state == CONNECT_THREAD_RUNNING) {

This check looks redundant and can probably go.  This patch may be quite
appropriate for this: the logic becomes even more straightforward.

>          /* We can cancel only in running state, when bh is not yet scheduled */
> -        thr->bh_ctx = NULL;
> -        if (s->wait_connect) {
> -            s->wait_connect = false;
> -            wake = true;
> +        if (thr->wait_co) {
> +            aio_co_schedule(NULL, thr->wait_co);

This will probably be replaced by a new function per our discussion of
the previous patch.

Note however that if that one doesn't fly for whatever reason you can
retain the aio_context on NBDConnectThread and pass it explicitly into
aio_co_schedule here.

Roman.

> +            thr->wait_co = NULL;
>          }
>      }
>  
>      qemu_mutex_unlock(&thr->mutex);
>  
> -    if (wake) {
> -        aio_co_wake(s->connection_co);
> -    }
>  }
>  
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)

