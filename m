Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED439A5DC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:38:37 +0200 (CEST)
Received: from localhost ([::1]:35342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqMe-0006Lt-Ar
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loq2R-0007ce-Ut
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loq2O-0001L0-TC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622737059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NoqvP5cLfihqLlsIpyVbczFAsLghEo0/Q7KrV2r/vC4=;
 b=ACaLpJp21pKy/kdHDpItps67NXqQbesvNAZnRnog+NMYN9VhJy9c59sw0fV/EkG4PSsQUW
 zDkL3mysDLKT2/LyGELbJmp6hqvxR40X5CU1pOgcWtDQcVsw2VVHbdxgXH8ntq3AxyE2mm
 9y5JgvHok1iWm/2AcM4nR32odOTQ7hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-DgxmW9rbN5SlP9_xuzXk7w-1; Thu, 03 Jun 2021 12:17:25 -0400
X-MC-Unique: DgxmW9rbN5SlP9_xuzXk7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F0A1020C47;
 Thu,  3 Jun 2021 16:17:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C01955C232;
 Thu,  3 Jun 2021 16:17:23 +0000 (UTC)
Date: Thu, 3 Jun 2021 11:17:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 17/33] nbd/client-connection: implement connection retry
Message-ID: <20210603161722.benugy4v7jsropwv@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-18-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-18-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:55AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add an option for thread to retry connection until success. We'll use

for a thread to retry connection until it succeeds.

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

so only call it when the thread is not yet running

or maybe even

only call it when the client connection attempt has not yet started

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

I'm not quite sure I follow the allocation here: if we passed in
&conn->updated_info which got modified in-place by nbd_connect, then
are we risking a memory leak by ignoring the x_dirty_bitmap and name
set by that call?

> +
> +        if (ret < 0) {
> +            object_unref(OBJECT(conn->sioc));
> +            conn->sioc = NULL;
> +            if (conn->do_retry) {
> +                sleep(timeout);

This is a bare sleep in a function not marked as coroutine_fn.  Do we
need to instead use coroutine sleep for better response to an early
exit if initialization is taking too long?

> +                if (timeout < max_timeout) {
> +                    timeout *= 2;
> +                }
> +                continue;
> +            }
> +        }
>  
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

Spurious hunk?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


