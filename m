Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6136CEBD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:47:02 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbWTs-0007Od-Od
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbWT0-0006ts-Fx; Tue, 27 Apr 2021 18:46:06 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:49878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbWSv-0000k0-25; Tue, 27 Apr 2021 18:46:04 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id DB2DC2E19D4;
 Wed, 28 Apr 2021 01:45:55 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 M0RIojXpHJ-jt1mxFud; Wed, 28 Apr 2021 01:45:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619563555; bh=R46KLTu/6IuqyxkZAyiuH6sr7I7D7G/Z1DBqQWcySRk=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=vsWfL8XT4Epy7KUUPgb3C99UcYpN0G8tdTGCa0QauyrnIzwSDuQTBuahmNRO6+yB9
 t+XwU+g1JQnTwTku5rW+vBBNF6h6gmvvtJkqRmMTy6eCpebWocS7WYKPXu642SIZUz
 dnH3pQF+vmjm+zM1eA+p9z++G24PSX9OGQsHcxEk=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:4])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 CNZ0c4xjxV-jsoCJYQf; Wed, 28 Apr 2021 01:45:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 28 Apr 2021 01:45:51 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 14/33] nbd: move connection code from block/nbd to
 nbd/client-connection
Message-ID: <YIiUH3m0GYUajo5P@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-15-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-15-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Apr 16, 2021 at 11:08:52AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We now have bs-independent connection API, which consists of four
> functions:
> 
>   nbd_client_connection_new()
>   nbd_client_connection_unref()
>   nbd_co_establish_connection()
>   nbd_co_establish_connection_cancel()
> 
> Move them to a separate file together with NBDClientConnection
> structure which becomes private to the new API.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |  11 +++
>  block/nbd.c             | 187 -----------------------------------
>  nbd/client-connection.c | 212 ++++++++++++++++++++++++++++++++++++++++
>  nbd/meson.build         |   1 +
>  4 files changed, 224 insertions(+), 187 deletions(-)
>  create mode 100644 nbd/client-connection.c
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 5f34d23bb0..57381be76f 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
>  const char *nbd_cmd_lookup(uint16_t info);
>  const char *nbd_err_lookup(int err);
>  
> +/* nbd/client-connection.c */
> +typedef struct NBDClientConnection NBDClientConnection;
> +
> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
> +void nbd_client_connection_release(NBDClientConnection *conn);
> +
> +QIOChannelSocket *coroutine_fn
> +nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
> +
> +void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
> +
>  #endif
> diff --git a/block/nbd.c b/block/nbd.c
> index 8531d019b2..9bd68dcf10 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -66,24 +66,6 @@ typedef enum NBDClientState {
>      NBD_CLIENT_QUIT
>  } NBDClientState;
>  
> -typedef struct NBDClientConnection {
> -    /* Initialization constants */
> -    SocketAddress *saddr; /* address to connect to */
> -
> -    /*
> -     * Result of last attempt. Valid in FAIL and SUCCESS states.
> -     * If you want to steal error, don't forget to set pointer to NULL.
> -     */
> -    QIOChannelSocket *sioc;
> -    Error *err;
> -
> -    QemuMutex mutex;
> -    /* All further fields are protected by mutex */
> -    bool running; /* thread is running now */
> -    bool detached; /* thread is detached and should cleanup the state */
> -    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
> -} NBDClientConnection;
> -
>  typedef struct BDRVNBDState {
>      QIOChannelSocket *sioc; /* The master data channel */
>      QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
> @@ -118,12 +100,8 @@ typedef struct BDRVNBDState {
>      NBDClientConnection *conn;
>  } BDRVNBDState;
>  
> -static void nbd_client_connection_release(NBDClientConnection *conn);
>  static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
>                                      Error **errp);
> -static coroutine_fn QIOChannelSocket *
> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
> -static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>  static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
>  static void nbd_yank(void *opaque);
>  
> @@ -340,171 +318,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
>      return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>  }
>  
> -static NBDClientConnection *
> -nbd_client_connection_new(const SocketAddress *saddr)
> -{
> -    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
> -
> -    *conn = (NBDClientConnection) {
> -        .saddr = QAPI_CLONE(SocketAddress, saddr),
> -    };
> -
> -    qemu_mutex_init(&conn->mutex);
> -
> -    return conn;
> -}
> -
> -static void nbd_client_connection_do_free(NBDClientConnection *conn)
> -{
> -    if (conn->sioc) {
> -        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
> -        object_unref(OBJECT(conn->sioc));
> -    }
> -    error_free(conn->err);
> -    qapi_free_SocketAddress(conn->saddr);
> -    g_free(conn);
> -}
> -
> -static void *connect_thread_func(void *opaque)
> -{
> -    NBDClientConnection *conn = opaque;
> -    bool do_free;
> -    int ret;
> -
> -    conn->sioc = qio_channel_socket_new();
> -
> -    error_free(conn->err);
> -    conn->err = NULL;
> -    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
> -    if (ret < 0) {
> -        object_unref(OBJECT(conn->sioc));
> -        conn->sioc = NULL;
> -    }
> -
> -    qemu_mutex_lock(&conn->mutex);
> -
> -    assert(conn->running);
> -    conn->running = false;
> -    if (conn->wait_co) {
> -        aio_co_schedule(NULL, conn->wait_co);
> -        conn->wait_co = NULL;
> -    }
> -    do_free = conn->detached;
> -
> -    qemu_mutex_unlock(&conn->mutex);
> -
> -    if (do_free) {
> -        nbd_client_connection_do_free(conn);
> -    }
> -
> -    return NULL;
> -}
> -
> -static void nbd_client_connection_release(NBDClientConnection *conn)
> -{
> -    bool do_free;
> -
> -    if (!conn) {
> -        return;
> -    }
> -
> -    qemu_mutex_lock(&conn->mutex);
> -    if (conn->running) {
> -        conn->detached = true;
> -    }
> -    do_free = !conn->running && !conn->detached;
> -    qemu_mutex_unlock(&conn->mutex);
> -
> -    if (do_free) {
> -        nbd_client_connection_do_free(conn);
> -    }
> -}
> -
> -/*
> - * Get a new connection in context of @conn:
> - *   if thread is running, wait for completion
> - *   if thread is already succeeded in background, and user didn't get the
> - *     result, just return it now
> - *   otherwise if thread is not running, start a thread and wait for completion
> - */
> -static coroutine_fn QIOChannelSocket *
> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
> -{
> -    QIOChannelSocket *sioc = NULL;
> -    QemuThread thread;
> -
> -    qemu_mutex_lock(&conn->mutex);
> -
> -    /*
> -     * Don't call nbd_co_establish_connection() in several coroutines in
> -     * parallel. Only one call at once is supported.
> -     */
> -    assert(!conn->wait_co);
> -
> -    if (!conn->running) {
> -        if (conn->sioc) {
> -            /* Previous attempt finally succeeded in background */
> -            sioc = g_steal_pointer(&conn->sioc);
> -            qemu_mutex_unlock(&conn->mutex);
> -
> -            return sioc;
> -        }
> -
> -        conn->running = true;
> -        error_free(conn->err);
> -        conn->err = NULL;
> -        qemu_thread_create(&thread, "nbd-connect",
> -                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
> -    }
> -
> -    conn->wait_co = qemu_coroutine_self();
> -
> -    qemu_mutex_unlock(&conn->mutex);
> -
> -    /*
> -     * We are going to wait for connect-thread finish, but
> -     * nbd_co_establish_connection_cancel() can interrupt.
> -     */
> -    qemu_coroutine_yield();
> -
> -    qemu_mutex_lock(&conn->mutex);
> -
> -    if (conn->running) {
> -        /*
> -         * Obviously, drained section wants to start. Report the attempt as
> -         * failed. Still connect thread is executing in background, and its
> -         * result may be used for next connection attempt.
> -         */
> -        error_setg(errp, "Connection attempt cancelled by other operation");
> -    } else {
> -        error_propagate(errp, conn->err);
> -        conn->err = NULL;
> -        sioc = g_steal_pointer(&conn->sioc);
> -    }
> -
> -    qemu_mutex_unlock(&conn->mutex);
> -
> -    return sioc;
> -}
> -
> -/*
> - * nbd_co_establish_connection_cancel
> - * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
> - * stop the thread itself neither close the socket. It just safely wakes
> - * nbd_co_establish_connection() sleeping in the yield().
> - */
> -static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
> -{
> -    qemu_mutex_lock(&conn->mutex);
> -
> -    if (conn->wait_co) {
> -        aio_co_schedule(NULL, conn->wait_co);
> -        conn->wait_co = NULL;
> -    }
> -
> -    qemu_mutex_unlock(&conn->mutex);
> -}
> -
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>  {
>      int ret;
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> new file mode 100644
> index 0000000000..4e39a5b1af
> --- /dev/null
> +++ b/nbd/client-connection.c
> @@ -0,0 +1,212 @@
> +/*
> + * QEMU Block driver for  NBD
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "block/nbd.h"
> +
> +#include "qapi/qapi-visit-sockets.h"
> +#include "qapi/clone-visitor.h"
> +
> +struct NBDClientConnection {
> +    /* Initialization constants */
> +    SocketAddress *saddr; /* address to connect to */
> +
> +    /*
> +     * Result of last attempt. Valid in FAIL and SUCCESS states.
> +     * If you want to steal error, don't forget to set pointer to NULL.
> +     */
> +    QIOChannelSocket *sioc;
> +    Error *err;

These two are also manipulated under the mutex.  Consider also updating
the comment: both these pointers are to be "stolen" by the caller, with
the former being valid when the connection succeeds and the latter
otherwise.

Roman.

> +
> +    QemuMutex mutex;
> +    /* All further fields are protected by mutex */
> +    bool running; /* thread is running now */
> +    bool detached; /* thread is detached and should cleanup the state */
> +    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
> +};
> +
> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
> +{
> +    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
> +
> +    *conn = (NBDClientConnection) {
> +        .saddr = QAPI_CLONE(SocketAddress, saddr),
> +    };
> +
> +    qemu_mutex_init(&conn->mutex);
> +
> +    return conn;
> +}
> +
> +static void nbd_client_connection_do_free(NBDClientConnection *conn)
> +{
> +    if (conn->sioc) {
> +        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
> +        object_unref(OBJECT(conn->sioc));
> +    }
> +    error_free(conn->err);
> +    qapi_free_SocketAddress(conn->saddr);
> +    g_free(conn);
> +}
> +
> +static void *connect_thread_func(void *opaque)
> +{
> +    NBDClientConnection *conn = opaque;
> +    bool do_free;
> +    int ret;
> +
> +    conn->sioc = qio_channel_socket_new();
> +
> +    error_free(conn->err);
> +    conn->err = NULL;
> +    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
> +    if (ret < 0) {
> +        object_unref(OBJECT(conn->sioc));
> +        conn->sioc = NULL;
> +    }
> +
> +    qemu_mutex_lock(&conn->mutex);
> +
> +    assert(conn->running);
> +    conn->running = false;
> +    if (conn->wait_co) {
> +        aio_co_schedule(NULL, conn->wait_co);
> +        conn->wait_co = NULL;
> +    }
> +    do_free = conn->detached;
> +
> +    qemu_mutex_unlock(&conn->mutex);
> +
> +    if (do_free) {
> +        nbd_client_connection_do_free(conn);
> +    }
> +
> +    return NULL;
> +}
> +
> +void nbd_client_connection_release(NBDClientConnection *conn)
> +{
> +    bool do_free;
> +
> +    if (!conn) {
> +        return;
> +    }
> +
> +    qemu_mutex_lock(&conn->mutex);
> +    if (conn->running) {
> +        conn->detached = true;
> +    }
> +    do_free = !conn->running && !conn->detached;
> +    qemu_mutex_unlock(&conn->mutex);
> +
> +    if (do_free) {
> +        nbd_client_connection_do_free(conn);
> +    }
> +}
> +
> +/*
> + * Get a new connection in context of @conn:
> + *   if thread is running, wait for completion
> + *   if thread is already succeeded in background, and user didn't get the
> + *     result, just return it now
> + *   otherwise if thread is not running, start a thread and wait for completion
> + */
> +QIOChannelSocket *coroutine_fn
> +nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
> +{
> +    QIOChannelSocket *sioc = NULL;
> +    QemuThread thread;
> +
> +    qemu_mutex_lock(&conn->mutex);
> +
> +    /*
> +     * Don't call nbd_co_establish_connection() in several coroutines in
> +     * parallel. Only one call at once is supported.
> +     */
> +    assert(!conn->wait_co);
> +
> +    if (!conn->running) {
> +        if (conn->sioc) {
> +            /* Previous attempt finally succeeded in background */
> +            sioc = g_steal_pointer(&conn->sioc);
> +            qemu_mutex_unlock(&conn->mutex);
> +
> +            return sioc;
> +        }
> +
> +        conn->running = true;
> +        error_free(conn->err);
> +        conn->err = NULL;
> +        qemu_thread_create(&thread, "nbd-connect",
> +                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
> +    }
> +
> +    conn->wait_co = qemu_coroutine_self();
> +
> +    qemu_mutex_unlock(&conn->mutex);
> +
> +    /*
> +     * We are going to wait for connect-thread finish, but
> +     * nbd_co_establish_connection_cancel() can interrupt.
> +     */
> +    qemu_coroutine_yield();
> +
> +    qemu_mutex_lock(&conn->mutex);
> +
> +    if (conn->running) {
> +        /*
> +         * Obviously, drained section wants to start. Report the attempt as
> +         * failed. Still connect thread is executing in background, and its
> +         * result may be used for next connection attempt.
> +         */
> +        error_setg(errp, "Connection attempt cancelled by other operation");
> +    } else {
> +        error_propagate(errp, conn->err);
> +        conn->err = NULL;
> +        sioc = g_steal_pointer(&conn->sioc);
> +    }
> +
> +    qemu_mutex_unlock(&conn->mutex);
> +
> +    return sioc;
> +}
> +
> +/*
> + * nbd_co_establish_connection_cancel
> + * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
> + * stop the thread itself neither close the socket. It just safely wakes
> + * nbd_co_establish_connection() sleeping in the yield().
> + */
> +void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
> +{
> +    qemu_mutex_lock(&conn->mutex);
> +
> +    if (conn->wait_co) {
> +        aio_co_schedule(NULL, conn->wait_co);
> +        conn->wait_co = NULL;
> +    }
> +
> +    qemu_mutex_unlock(&conn->mutex);
> +}
> diff --git a/nbd/meson.build b/nbd/meson.build
> index 2baaa36948..b26d70565e 100644
> --- a/nbd/meson.build
> +++ b/nbd/meson.build
> @@ -1,5 +1,6 @@
>  block_ss.add(files(
>    'client.c',
> +  'client-connection.c',
>    'common.c',
>  ))
>  blockdev_ss.add(files(
> -- 
> 2.29.2
> 

