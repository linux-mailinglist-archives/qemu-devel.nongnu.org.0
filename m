Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92536CEA8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:37:08 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbWKI-0004IW-UH
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbWIo-0003cy-JK; Tue, 27 Apr 2021 18:35:34 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbWIj-0002pW-K5; Tue, 27 Apr 2021 18:35:32 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id EC0742E19CE;
 Wed, 28 Apr 2021 01:35:24 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (myt6-76f0a6db1a7e.qloud-c.yandex.net [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 91eXsifZZR-ZO0i6rXJ; Wed, 28 Apr 2021 01:35:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619562924; bh=Ra8YtthODmbFNq6xiDhojhXkCyNn1wSA2+PcgkIqrTw=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=XEor8utcZmlP5bO6zk7Q4UUMg4OJhvOAp7Y/35k9nUYAI/+6IAuTCRPERr6WAK1id
 rxdD1vSvnj2lEiPVLBhkam1diEzloNuGccrJpbUwj4zMPaNqLm4Jgnm2aOF9ogc6VY
 s+Xe+y694is+joZDNkQAnKVsP+MnNbrOpqRElURs=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:4])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 eRgPS6qRPY-ZOoWd7Tt; Wed, 28 Apr 2021 01:35:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 28 Apr 2021 01:35:20 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
Message-ID: <YIiRqLT56H0BUtgA@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-14-vsementsov@virtuozzo.com>
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

On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 21a4039359..8531d019b2 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
>      NBDClientConnection *conn;
>  } BDRVNBDState;
>  
> -static void nbd_free_connect_thread(NBDClientConnection *conn);
> +static void nbd_client_connection_release(NBDClientConnection *conn);
>  static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
>                                      Error **errp);
>  static coroutine_fn QIOChannelSocket *
> @@ -130,20 +130,9 @@ static void nbd_yank(void *opaque);
>  static void nbd_clear_bdrvstate(BlockDriverState *bs)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> -    NBDClientConnection *conn = s->conn;
> -    bool do_free;
> -
> -    qemu_mutex_lock(&conn->mutex);
> -    if (conn->running) {
> -        conn->detached = true;
> -    }
> -    do_free = !conn->running && !conn->detached;
> -    qemu_mutex_unlock(&conn->mutex);
>  
> -    /* the runaway thread will clean it up itself */
> -    if (do_free) {
> -        nbd_free_connect_thread(conn);
> -    }
> +    nbd_client_connection_release(s->conn);
> +    s->conn = NULL;
>  
>      yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
>  
> @@ -365,7 +354,7 @@ nbd_client_connection_new(const SocketAddress *saddr)
>      return conn;
>  }
>  
> -static void nbd_free_connect_thread(NBDClientConnection *conn)
> +static void nbd_client_connection_do_free(NBDClientConnection *conn)
>  {
>      if (conn->sioc) {
>          qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
> @@ -379,8 +368,8 @@ static void nbd_free_connect_thread(NBDClientConnection *conn)
>  static void *connect_thread_func(void *opaque)
>  {
>      NBDClientConnection *conn = opaque;
> +    bool do_free;
>      int ret;
> -    bool do_free = false;
>  

This hunk belongs in patch 8.

Roman.

>      conn->sioc = qio_channel_socket_new();
>  
> @@ -405,12 +394,32 @@ static void *connect_thread_func(void *opaque)
>      qemu_mutex_unlock(&conn->mutex);
>  
>      if (do_free) {
> -        nbd_free_connect_thread(conn);
> +        nbd_client_connection_do_free(conn);
>      }
>  
>      return NULL;
>  }
>  
> +static void nbd_client_connection_release(NBDClientConnection *conn)
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
>  /*
>   * Get a new connection in context of @conn:
>   *   if thread is running, wait for completion
> -- 
> 2.29.2
> 

