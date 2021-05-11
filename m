Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE5C37B090
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:09:44 +0200 (CEST)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZdP-00072t-7T
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgZcN-0006Ca-UF; Tue, 11 May 2021 17:08:39 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lgZcJ-0004kQ-H9; Tue, 11 May 2021 17:08:38 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 673282E1818;
 Wed, 12 May 2021 00:08:30 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 mYyQGPYMca-8T0aiG7a; Wed, 12 May 2021 00:08:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1620767310; bh=pMuLBobOkO0gFSJv5NbYHGXb/4r9jDuzlFyzcOHOyOA=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=d7dwK/x6LsYQ2cSVKvqDOpdbkHj61yzexdmbFUbp6TIsXOvf8nO4Y2XjBcN15Xn4l
 4p07ZWDL81QkgXVsAV4g/3o4KOnoxaHLfh38u5ZtDSL1Yl/9xRkTrJll4/IDfjc3GB
 aI8aESaX0d31NyuxitJVywPCFDHOaTj1g/BLIoDY=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1211::1:8])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 T84VrKAvB9-8To4q2Y1; Wed, 12 May 2021 00:08:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 12 May 2021 00:08:26 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 18/33] nbd/client-connection: shutdown connection on
 release
Message-ID: <YJryStl6HOR9VJIa@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-19-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-19-vsementsov@virtuozzo.com>
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

On Fri, Apr 16, 2021 at 11:08:56AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Now, when thread can do negotiation and retry, it may run relatively
> long. We need a mechanism to stop it, when user is not interested in
> result anymore. So, on nbd_client_connection_release() let's shutdown
> the socked, and do not retry connection if thread is detached.

This kinda answers my question to the previous patch about reconnect
cancellation.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 002bd91f42..54f73c6c24 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -158,9 +158,13 @@ static void *connect_thread_func(void *opaque)
>      uint64_t timeout = 1;
>      uint64_t max_timeout = 16;
>  
> -    while (true) {
> +    qemu_mutex_lock(&conn->mutex);
> +    while (!conn->detached) {
> +        assert(!conn->sioc);
>          conn->sioc = qio_channel_socket_new();
>  
> +        qemu_mutex_unlock(&conn->mutex);
> +
>          error_free(conn->err);
>          conn->err = NULL;
>          conn->updated_info = conn->initial_info;
> @@ -171,14 +175,20 @@ static void *connect_thread_func(void *opaque)
>          conn->updated_info.x_dirty_bitmap = NULL;
>          conn->updated_info.name = NULL;
>  
> +        qemu_mutex_lock(&conn->mutex);
> +
>          if (ret < 0) {
>              object_unref(OBJECT(conn->sioc));
>              conn->sioc = NULL;
> -            if (conn->do_retry) {
> +            if (conn->do_retry && !conn->detached) {
> +                qemu_mutex_unlock(&conn->mutex);
> +
>                  sleep(timeout);
>                  if (timeout < max_timeout) {
>                      timeout *= 2;
>                  }
> +
> +                qemu_mutex_lock(&conn->mutex);
>                  continue;
>              }
>          }
> @@ -186,15 +196,17 @@ static void *connect_thread_func(void *opaque)
>          break;
>      }
>  
> -    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
> -        assert(conn->running);
> -        conn->running = false;
> -        if (conn->wait_co) {
> -            aio_co_schedule(NULL, conn->wait_co);
> -            conn->wait_co = NULL;
> -        }
> -        do_free = conn->detached;
> +    /* mutex is locked */
> +
> +    assert(conn->running);
> +    conn->running = false;
> +    if (conn->wait_co) {
> +        aio_co_schedule(NULL, conn->wait_co);
> +        conn->wait_co = NULL;
>      }
> +    do_free = conn->detached;
> +
> +    qemu_mutex_unlock(&conn->mutex);

This basically reverts some hunks from patch 15 "nbd/client-connection:
use QEMU_LOCK_GUARD".  How about dropping them there (they weren't an
obvious improvement even then).

Roman.

>  
>      if (do_free) {
>          nbd_client_connection_do_free(conn);
> @@ -215,6 +227,10 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>      if (conn->running) {
>          conn->detached = true;
>      }
> +    if (conn->sioc) {
> +        qio_channel_shutdown(QIO_CHANNEL(conn->sioc),
> +                             QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +    }
>      do_free = !conn->running && !conn->detached;
>      qemu_mutex_unlock(&conn->mutex);
>  
> -- 
> 2.29.2
> 

