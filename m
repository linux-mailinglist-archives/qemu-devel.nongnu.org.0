Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDD35810D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:46:51 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSBW-0006Ua-KI
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUS9h-0005tF-VK; Thu, 08 Apr 2021 06:44:58 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:39404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUS9Y-0001aW-U2; Thu, 08 Apr 2021 06:44:56 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id CA8A92E153C;
 Thu,  8 Apr 2021 13:44:40 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 TYMFpSH3P3-id00bpoV; Thu, 08 Apr 2021 13:44:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617878680; bh=XNGQWl9GFVhseEfGWNv8H1sG5dUVN0eQl5ToqEZeH8c=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=nwSgsC3RF1bGwQ5AFnhV+pbQJFh7uOaESwFDzPzPHcTAMoANBDUoXVdR4AH7MwFj6
 XIJodbJtCDCPvs4uOQllXIqCDdTN8VAbra/aUOmr+Zx3hmN6zpBHfcP6UKjjmWM0b/
 AJA07TvAlLNUWfap3PXliYQVUrA8VvpjxC7PxNPU=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5F4QuysmVI-idpSYXMV; Thu, 08 Apr 2021 13:44:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 13:44:35 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 06/14] block/nbd: further segregation of connect-thread
Message-ID: <YG7ek9FHO59jlBUw@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
 <20210407104637.36033-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407104637.36033-7-vsementsov@virtuozzo.com>
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

On Wed, Apr 07, 2021 at 01:46:29PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add personal state NBDConnectThread for connect-thread and
> nbd_connect_thread_start() function. Next step would be moving
> connect-thread to a separate file.
> 
> Note that we stop publishing thr->sioc during
> qio_channel_socket_connect_sync(). Which probably means that we can't
> early-cancel qio_channel_socket_connect_sync() call in
> nbd_free_connect_thread(). Still, when thread is detached it doesn't
> make big sense, and we have no guarantee anyway.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 57 ++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index e16c6d636a..23eb8adab1 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -85,8 +85,6 @@ typedef enum NBDConnectThreadState {
>  } NBDConnectThreadState;
>  
>  typedef struct NBDConnectCB {
> -    /* Initialization constants */
> -    SocketAddress *saddr; /* address to connect to */
>      /*
>       * Bottom half to schedule on completion. Scheduled only if bh_ctx is not
>       * NULL
> @@ -103,6 +101,15 @@ typedef struct NBDConnectCB {
>      AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
>  } NBDConnectCB;
>  
> +typedef void (*NBDConnectThreadCallback)(QIOChannelSocket *sioc, int ret,
> +                                         void *opaque);
> +
> +typedef struct NBDConnectThread {
> +    SocketAddress *saddr; /* address to connect to */
> +    NBDConnectThreadCallback cb;
> +    void *cb_opaque;
> +} NBDConnectThread;
> +
>  typedef struct BDRVNBDState {
>      QIOChannelSocket *sioc; /* The master data channel */
>      QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
> @@ -367,7 +374,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
>      s->connect_thread = g_new(NBDConnectCB, 1);
>  
>      *s->connect_thread = (NBDConnectCB) {
> -        .saddr = QAPI_CLONE(SocketAddress, s->saddr),
>          .state = CONNECT_THREAD_NONE,
>          .bh_func = connect_bh,
>          .bh_opaque = s,
> @@ -378,20 +384,18 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
>  
>  static void nbd_free_connect_thread(NBDConnectCB *thr)
>  {
> -    if (thr->sioc) {
> -        qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
> -    }

Doesn't this result in an open channel leak?  (The original code here
seems to be missing an unref, too.)

> -    qapi_free_SocketAddress(thr->saddr);
>      g_free(thr);
>  }
>  
> -static void connect_thread_cb(int ret, void *opaque)
> +static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
>  {
>      NBDConnectCB *thr = opaque;
>      bool do_free = false;
>  
>      qemu_mutex_lock(&thr->mutex);
>  
> +    thr->sioc = sioc;
> +
>      switch (thr->state) {
>      case CONNECT_THREAD_RUNNING:
>          thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
> @@ -418,27 +422,45 @@ static void connect_thread_cb(int ret, void *opaque)
>  
>  static void *connect_thread_func(void *opaque)
>  {
> -    NBDConnectCB *thr = opaque;
> +    NBDConnectThread *thr = opaque;
>      int ret;
> +    QIOChannelSocket *sioc = qio_channel_socket_new();
>  
> -    thr->sioc = qio_channel_socket_new();
> -
> -    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, NULL);
> +    ret = qio_channel_socket_connect_sync(sioc, thr->saddr, NULL);
>      if (ret < 0) {
> -        object_unref(OBJECT(thr->sioc));
> -        thr->sioc = NULL;
> +        object_unref(OBJECT(sioc));
> +        sioc = NULL;
>      }
>  
> -    connect_thread_cb(ret, thr);
> +    thr->cb(sioc, ret, thr->cb_opaque);
> +
> +    qapi_free_SocketAddress(thr->saddr);
> +    g_free(thr);
>  
>      return NULL;
>  }
>  
> +static void nbd_connect_thread_start(const SocketAddress *saddr,
> +                                     NBDConnectThreadCallback cb,
> +                                     void *cb_opaque)
> +{
> +    QemuThread thread;
> +    NBDConnectThread *thr = g_new(NBDConnectThread, 1);
> +
> +    *thr = (NBDConnectThread) {
> +        .saddr = QAPI_CLONE(SocketAddress, saddr),
> +        .cb = cb,
> +        .cb_opaque = cb_opaque,
> +    };
> +
> +    qemu_thread_create(&thread, "nbd-connect",
> +                       connect_thread_func, thr, QEMU_THREAD_DETACHED);
> +}
> +
>  static int coroutine_fn
>  nbd_co_establish_connection(BlockDriverState *bs)
>  {
>      int ret;
> -    QemuThread thread;
>      BDRVNBDState *s = bs->opaque;
>      NBDConnectCB *thr = s->connect_thread;
>  
> @@ -448,8 +470,7 @@ nbd_co_establish_connection(BlockDriverState *bs)
>      case CONNECT_THREAD_FAIL:
>      case CONNECT_THREAD_NONE:
>          thr->state = CONNECT_THREAD_RUNNING;
> -        qemu_thread_create(&thread, "nbd-connect",
> -                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
> +        nbd_connect_thread_start(s->saddr, connect_thread_cb, thr);
>          break;
>      case CONNECT_THREAD_SUCCESS:
>          /* Previous attempt finally succeeded in background */
> -- 
> 2.29.2
> 

