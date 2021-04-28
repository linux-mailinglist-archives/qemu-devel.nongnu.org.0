Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC7936D209
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 08:10:47 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdPG-0000Qb-Hw
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 02:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbdNe-0008LP-An; Wed, 28 Apr 2021 02:09:02 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:37302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lbdNZ-0006uV-7Q; Wed, 28 Apr 2021 02:09:00 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 293AC2E19E4;
 Wed, 28 Apr 2021 09:08:49 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 IyymRnPeyH-8l14t6Qt; Wed, 28 Apr 2021 09:08:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619590129; bh=HN3Mh4j2TJwoReE+FGMGwIKfjCdb2Jr3OLreyCmdCN4=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=Puk6+2a1pzNzRV8nwiSbEBkK520EEgus2k5YHrS6OXv1HZqlxwW3pTzk6b4uS+Id9
 8CH9667zaMEpojWnpgM7AklaVHySjy/HHxg/0UzDu+YGInQyoUkswDLtaI/W6agNLV
 l8ktoFfd1dmIFRmeOurDsGvqnyw9jNX0JBsgCX5A=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8024::1:3])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bpgeZfX9KH-8koGSEdq; Wed, 28 Apr 2021 09:08:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 28 Apr 2021 09:08:43 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 15/33] nbd/client-connection: use QEMU_LOCK_GUARD
Message-ID: <YIj760DlBIIE3pIR@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-16-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-16-vsementsov@virtuozzo.com>
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

On Fri, Apr 16, 2021 at 11:08:53AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 94 ++++++++++++++++++-----------------------
>  1 file changed, 42 insertions(+), 52 deletions(-)
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 4e39a5b1af..b45a0bd5f6 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -87,17 +87,16 @@ static void *connect_thread_func(void *opaque)
>          conn->sioc = NULL;
>      }
>  
> -    qemu_mutex_lock(&conn->mutex);
> -
> -    assert(conn->running);
> -    conn->running = false;
> -    if (conn->wait_co) {
> -        aio_co_schedule(NULL, conn->wait_co);
> -        conn->wait_co = NULL;
> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
> +        assert(conn->running);
> +        conn->running = false;
> +        if (conn->wait_co) {
> +            aio_co_schedule(NULL, conn->wait_co);
> +            conn->wait_co = NULL;
> +        }
>      }
>      do_free = conn->detached;

->detached is now accessed outside the mutex

>  
> -    qemu_mutex_unlock(&conn->mutex);
>  
>      if (do_free) {
>          nbd_client_connection_do_free(conn);
> @@ -136,61 +135,54 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>  QIOChannelSocket *coroutine_fn
>  nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>  {
> -    QIOChannelSocket *sioc = NULL;
>      QemuThread thread;
>  
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
> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
> +        /*
> +         * Don't call nbd_co_establish_connection() in several coroutines in
> +         * parallel. Only one call at once is supported.
> +         */
> +        assert(!conn->wait_co);
> +
> +        if (!conn->running) {
> +            if (conn->sioc) {
> +                /* Previous attempt finally succeeded in background */
> +                return g_steal_pointer(&conn->sioc);
> +            }
> +
> +            conn->running = true;
> +            error_free(conn->err);
> +            conn->err = NULL;
> +            qemu_thread_create(&thread, "nbd-connect",
> +                               connect_thread_func, conn, QEMU_THREAD_DETACHED);
>          }
>  
> -        conn->running = true;
> -        error_free(conn->err);
> -        conn->err = NULL;
> -        qemu_thread_create(&thread, "nbd-connect",
> -                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
> +        conn->wait_co = qemu_coroutine_self();
>      }
>  
> -    conn->wait_co = qemu_coroutine_self();
> -
> -    qemu_mutex_unlock(&conn->mutex);
> -
>      /*
>       * We are going to wait for connect-thread finish, but
>       * nbd_co_establish_connection_cancel() can interrupt.
>       */
>      qemu_coroutine_yield();
>  
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
> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
> +        if (conn->running) {
> +            /*
> +             * Obviously, drained section wants to start. Report the attempt as
> +             * failed. Still connect thread is executing in background, and its
> +             * result may be used for next connection attempt.
> +             */
> +            error_setg(errp, "Connection attempt cancelled by other operation");
> +            return NULL;
> +        } else {
> +            error_propagate(errp, conn->err);
> +            conn->err = NULL;
> +            return g_steal_pointer(&conn->sioc);
> +        }
>      }
>  
> -    qemu_mutex_unlock(&conn->mutex);
> -
> -    return sioc;
> +    abort(); /* unreachable */
>  }
>  
>  /*
> @@ -201,12 +193,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>   */
>  void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
>  {
> -    qemu_mutex_lock(&conn->mutex);
> +    QEMU_LOCK_GUARD(&conn->mutex);
>  
>      if (conn->wait_co) {
>          aio_co_schedule(NULL, conn->wait_co);
>          conn->wait_co = NULL;
>      }
> -
> -    qemu_mutex_unlock(&conn->mutex);
>  }
> -- 
> 2.29.2
> 

