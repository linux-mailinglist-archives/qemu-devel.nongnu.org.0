Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED737B064
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:56:33 +0200 (CEST)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZQe-0005WC-U8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgZP8-0003Zv-RY; Tue, 11 May 2021 16:54:59 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgZP4-0004bk-7p; Tue, 11 May 2021 16:54:56 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E34382E166C;
 Tue, 11 May 2021 23:54:48 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (myt6-76f0a6db1a7e.qloud-c.yandex.net [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 1N7R3gz7Mq-sm0W69KH; Tue, 11 May 2021 23:54:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1620766488; bh=uf+DUNCrt+xFYl9lrc85CvXqDyiVUE+ImzDWSfcldYc=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=BI6V3MUnzW23vnDCwwUEzJoQ3RkQwg3q6POpOEIwxFCXgCQBv06xyj/d9u3ZiB1zx
 KcqtymHMozHraWqeJ9UlizpiTETKMPAWDRWGk4La7oQlrf7jZ2Hxvk4iIeie5FOn18
 LWAPMdVTQ7RnacBWhrvwEgLCNsD0vSZyqVHMDRWg=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1211::1:8])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ILIse82GMk-smouievh; Tue, 11 May 2021 23:54:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 11 May 2021 23:54:45 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 17/33] nbd/client-connection: implement connection retry
Message-ID: <YJrvFbUbEx7woi//@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-18-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-18-vsementsov@virtuozzo.com>
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

On Fri, Apr 16, 2021 at 11:08:55AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add an option for thread to retry connection until success. We'll use
> nbd/client-connection both for reconnect and for initial connection in
> nbd_open(), so we need a possibility to use same NBDClientConnection
> instance to connect once in nbd_open() and then use retry semantics for
> reconnect.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |  2 ++
>  nbd/client-connection.c | 55 +++++++++++++++++++++++++++++------------
>  2 files changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 5d86e6a393..5bb54d831c 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -409,6 +409,8 @@ const char *nbd_err_lookup(int err);
>  /* nbd/client-connection.c */
>  typedef struct NBDClientConnection NBDClientConnection;
>  
> +void nbd_client_connection_enable_retry(NBDClientConnection *conn);
> +
>  NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>                                                 bool do_negotiation,
>                                                 const char *export_name,
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index ae4a77f826..002bd91f42 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -36,6 +36,8 @@ struct NBDClientConnection {
>      NBDExportInfo initial_info;
>      bool do_negotiation;
>  
> +    bool do_retry;
> +
>      /*
>       * Result of last attempt. Valid in FAIL and SUCCESS states.
>       * If you want to steal error, don't forget to set pointer to NULL.
> @@ -52,6 +54,15 @@ struct NBDClientConnection {
>      Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>  };
>  
> +/*
> + * The function isn't protected by any mutex, so call it when thread is not
> + * running.
> + */
> +void nbd_client_connection_enable_retry(NBDClientConnection *conn)
> +{
> +    conn->do_retry = true;
> +}
> +
>  NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>                                                 bool do_negotiation,
>                                                 const char *export_name,
> @@ -144,24 +155,37 @@ static void *connect_thread_func(void *opaque)
>      NBDClientConnection *conn = opaque;
>      bool do_free;
>      int ret;
> +    uint64_t timeout = 1;
> +    uint64_t max_timeout = 16;
> +
> +    while (true) {
> +        conn->sioc = qio_channel_socket_new();
> +
> +        error_free(conn->err);
> +        conn->err = NULL;
> +        conn->updated_info = conn->initial_info;
> +
> +        ret = nbd_connect(conn->sioc, conn->saddr,
> +                          conn->do_negotiation ? &conn->updated_info : NULL,
> +                          conn->tlscreds, &conn->ioc, &conn->err);
> +        conn->updated_info.x_dirty_bitmap = NULL;
> +        conn->updated_info.name = NULL;
> +
> +        if (ret < 0) {
> +            object_unref(OBJECT(conn->sioc));
> +            conn->sioc = NULL;
> +            if (conn->do_retry) {
> +                sleep(timeout);
> +                if (timeout < max_timeout) {
> +                    timeout *= 2;
> +                }
> +                continue;
> +            }
> +        }

How is it supposed to get canceled?

Roman.

> -    conn->sioc = qio_channel_socket_new();
> -
> -    error_free(conn->err);
> -    conn->err = NULL;
> -    conn->updated_info = conn->initial_info;
> -
> -    ret = nbd_connect(conn->sioc, conn->saddr,
> -                      conn->do_negotiation ? &conn->updated_info : NULL,
> -                      conn->tlscreds, &conn->ioc, &conn->err);
> -    if (ret < 0) {
> -        object_unref(OBJECT(conn->sioc));
> -        conn->sioc = NULL;
> +        break;
>      }
>  
> -    conn->updated_info.x_dirty_bitmap = NULL;
> -    conn->updated_info.name = NULL;
> -
>      WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>          assert(conn->running);
>          conn->running = false;
> @@ -172,7 +196,6 @@ static void *connect_thread_func(void *opaque)
>          do_free = conn->detached;
>      }
>  
> -
>      if (do_free) {
>          nbd_client_connection_do_free(conn);
>      }
> -- 
> 2.29.2
> 

