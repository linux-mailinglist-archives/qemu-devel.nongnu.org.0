Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59237A56A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:05:14 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQCP-0000Ys-RJ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgPtW-0005EH-9G; Tue, 11 May 2021 06:45:42 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:58768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgPtN-000471-UK; Tue, 11 May 2021 06:45:40 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id BBF3F2E18F6;
 Tue, 11 May 2021 13:45:27 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AT7vstLcUl-jR1mMviC; Tue, 11 May 2021 13:45:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1620729927; bh=HP8CDcRlZWuQAs/2u4MBynWe0ZYiBYbc/0v4lt/gxqE=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=SiuJe/j/6Dak9cetkFkQpiFEWT40Vh877A6KcbjT2M+SbxJLqKluWSwIX2iF/1KjM
 uEoi4u3Zo0W0nSbOySJdPfVfQwLXKdmU6CK08JBuQA7obg2C72L37utCYmUUBf+F9K
 KlRlr7j+QgSJks5Ffg4SJVj2hYKy7qwS0QEjEENA=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1211::1:1e])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YxkzwhlEaC-jRpSWqu1; Tue, 11 May 2021 13:45:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 11 May 2021 13:45:23 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 16/33] nbd/client-connection: add possibility of
 negotiation
Message-ID: <YJpgQ3/9buUGwTMC@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-17-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-17-vsementsov@virtuozzo.com>
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

On Fri, Apr 16, 2021 at 11:08:54AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add arguments and logic to support nbd negotiation in the same thread
> after successful connection.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |   9 +++-
>  block/nbd.c             |   4 +-
>  nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 109 insertions(+), 9 deletions(-)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 57381be76f..5d86e6a393 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
>  /* nbd/client-connection.c */
>  typedef struct NBDClientConnection NBDClientConnection;
>  
> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
> +                                               bool do_negotiation,
> +                                               const char *export_name,
> +                                               const char *x_dirty_bitmap,
> +                                               QCryptoTLSCreds *tlscreds);
>  void nbd_client_connection_release(NBDClientConnection *conn);
>  
>  QIOChannelSocket *coroutine_fn
> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
> +                            QIOChannel **ioc, Error **errp);
>  
>  void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>  
> diff --git a/block/nbd.c b/block/nbd.c
> index 9bd68dcf10..5e63caaf4b 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -361,7 +361,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>          s->ioc = NULL;
>      }
>  
> -    s->sioc = nbd_co_establish_connection(s->conn, NULL);
> +    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
>      if (!s->sioc) {
>          ret = -ECONNREFUSED;
>          goto out;
> @@ -2033,7 +2033,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail;
>      }
>  
> -    s->conn = nbd_client_connection_new(s->saddr);
> +    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
>  
>      /*
>       * establish TCP connection, return error if it fails
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index b45a0bd5f6..ae4a77f826 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -30,14 +30,19 @@
>  #include "qapi/clone-visitor.h"
>  
>  struct NBDClientConnection {
> -    /* Initialization constants */
> +    /* Initialization constants, never change */
>      SocketAddress *saddr; /* address to connect to */
> +    QCryptoTLSCreds *tlscreds;
> +    NBDExportInfo initial_info;
> +    bool do_negotiation;
>  
>      /*
>       * Result of last attempt. Valid in FAIL and SUCCESS states.
>       * If you want to steal error, don't forget to set pointer to NULL.
>       */
> +    NBDExportInfo updated_info;
>      QIOChannelSocket *sioc;
> +    QIOChannel *ioc;
>      Error *err;
>  
>      QemuMutex mutex;
> @@ -47,12 +52,25 @@ struct NBDClientConnection {
>      Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>  };
>  
> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
> +                                               bool do_negotiation,
> +                                               const char *export_name,
> +                                               const char *x_dirty_bitmap,
> +                                               QCryptoTLSCreds *tlscreds)
>  {
>      NBDClientConnection *conn = g_new(NBDClientConnection, 1);
>  
> +    object_ref(OBJECT(tlscreds));
>      *conn = (NBDClientConnection) {
>          .saddr = QAPI_CLONE(SocketAddress, saddr),
> +        .tlscreds = tlscreds,
> +        .do_negotiation = do_negotiation,
> +
> +        .initial_info.request_sizes = true,
> +        .initial_info.structured_reply = true,
> +        .initial_info.base_allocation = true,
> +        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
> +        .initial_info.name = g_strdup(export_name ?: "")
>      };
>  
>      qemu_mutex_init(&conn->mutex);
> @@ -68,9 +86,59 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
>      }
>      error_free(conn->err);
>      qapi_free_SocketAddress(conn->saddr);
> +    object_unref(OBJECT(conn->tlscreds));
> +    g_free(conn->initial_info.x_dirty_bitmap);
> +    g_free(conn->initial_info.name);
>      g_free(conn);
>  }
>  
> +/*
> + * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
> + * given @outioc is provided. @outioc is provided only on success.  The call may

s/given/are given/
s/provided/returned/g

> + * be cancelled in parallel by simply qio_channel_shutdown(sioc).

I assume by "in parallel" you mean "from another thread", I'd suggest to
spell this out.  I'm also wondering how safe it really is.  In general
sockets should be fine with concurrent send()/recv() and shutdown(): the
sender/receiver will be woken up with an error.  Dunno if it's true for
an arbitrary qio_channel.  Also it may be worth documenting that the
code path that cancels must leave all the cleanup up to the negotiation
code, otherwise it risks conflicting.

> + */
> +static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
> +                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
> +                       QIOChannel **outioc, Error **errp)
> +{
> +    int ret;
> +
> +    if (outioc) {
> +        *outioc = NULL;
> +    }
> +
> +    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (!info) {
> +        return 0;
> +    }
> +
> +    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
> +                                tlscreds ? addr->u.inet.host : NULL,
> +                                outioc, info, errp);
> +    if (ret < 0) {
> +        /*
> +         * nbd_receive_negotiate() may setup tls ioc and return it even on
> +         * failure path. In this case we should use it instead of original
> +         * channel.
> +         */
> +        if (outioc && *outioc) {
> +            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
> +            object_unref(OBJECT(*outioc));
> +            *outioc = NULL;
> +        } else {
> +            qio_channel_close(QIO_CHANNEL(sioc), NULL);
> +        }
> +
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  static void *connect_thread_func(void *opaque)
>  {
>      NBDClientConnection *conn = opaque;
> @@ -81,12 +149,19 @@ static void *connect_thread_func(void *opaque)
>  
>      error_free(conn->err);
>      conn->err = NULL;
> -    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
> +    conn->updated_info = conn->initial_info;
> +
> +    ret = nbd_connect(conn->sioc, conn->saddr,
> +                      conn->do_negotiation ? &conn->updated_info : NULL,
> +                      conn->tlscreds, &conn->ioc, &conn->err);
>      if (ret < 0) {
>          object_unref(OBJECT(conn->sioc));
>          conn->sioc = NULL;
>      }
>  
> +    conn->updated_info.x_dirty_bitmap = NULL;
> +    conn->updated_info.name = NULL;
> +
>      WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>          assert(conn->running);
>          conn->running = false;
> @@ -94,8 +169,8 @@ static void *connect_thread_func(void *opaque)
>              aio_co_schedule(NULL, conn->wait_co);
>              conn->wait_co = NULL;
>          }
> +        do_free = conn->detached;
>      }
> -    do_free = conn->detached;

This looks like the response to my earlier comment ;)  This hunk just
needs to be squashed into the previous patch.

>  
>  
>      if (do_free) {
> @@ -131,12 +206,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>   *   if thread is already succeeded in background, and user didn't get the
>   *     result, just return it now
>   *   otherwise if thread is not running, start a thread and wait for completion
> + *
> + * If @info is not NULL, also do nbd-negotiation after successful connection.
> + * In this case info is used only as out parameter, and is fully initialized by
> + * nbd_co_establish_connection(). "IN" fields of info as well as related only to
> + * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
> + * include/block/nbd.h).
>   */
>  QIOChannelSocket *coroutine_fn
> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
> +                            QIOChannel **ioc, Error **errp)
>  {
>      QemuThread thread;
>  
> +    if (conn->do_negotiation) {
> +        assert(info);
> +        assert(ioc);
> +    }
> +
>      WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>          /*
>           * Don't call nbd_co_establish_connection() in several coroutines in
> @@ -147,6 +234,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>          if (!conn->running) {
>              if (conn->sioc) {
>                  /* Previous attempt finally succeeded in background */
> +                if (conn->do_negotiation) {
> +                    *ioc = g_steal_pointer(&conn->ioc);
> +                    memcpy(info, &conn->updated_info, sizeof(*info));
> +                }
>                  return g_steal_pointer(&conn->sioc);
>              }
>  
> @@ -178,6 +269,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>          } else {
>              error_propagate(errp, conn->err);
>              conn->err = NULL;
> +            if (conn->sioc && conn->do_negotiation) {
> +                *ioc = g_steal_pointer(&conn->ioc);
> +                memcpy(info, &conn->updated_info, sizeof(*info));
> +            }
>              return g_steal_pointer(&conn->sioc);
>          }
>      }
> -- 
> 2.29.2
> 

