Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA745930C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 17:31:48 +0100 (CET)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpCEM-0007jV-Cf
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 11:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpCDA-0006jY-Qe
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpCD7-0004eo-NO
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637598629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nohvYLdn/xqX6AHuzRWHXXSsEyGcuh9G7ifTPCNsKls=;
 b=VMN3b+V/X8Q0ECnEM4iy3XLtbdlTuyiTe2lpSRhNHHkI+ZyYBWig4KhM9qpuLaPEh6WsGO
 4xMi/xhv/pNuszvpEF2/LyJdlHlIW/JPtKDjGU9s7+gnWYYPe9D6cIcnO6MZZrTG8zzOv1
 biFbVdRxsQOk/T+5XXQRNV3XyflHI0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-N5TEOEqXPkmDKwVdQd1joQ-1; Mon, 22 Nov 2021 11:30:25 -0500
X-MC-Unique: N5TEOEqXPkmDKwVdQd1joQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC0DB1851726;
 Mon, 22 Nov 2021 16:30:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D94AADCB;
 Mon, 22 Nov 2021 16:30:03 +0000 (UTC)
Date: Mon, 22 Nov 2021 10:30:01 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 20/32] nbd/client-connection: implement connection retry
Message-ID: <20211122163001.ahvcby7rrg4hc23n@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-21-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-21-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviving this thread, as a good as place as any for my question:

On Thu, Jun 10, 2021 at 01:07:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add an option for a thread to retry connection until succeeds. We'll
> use nbd/client-connection both for reconnect and for initial connection
> in nbd_open(), so we need a possibility to use same NBDClientConnection
> instance to connect once in nbd_open() and then use retry semantics for
> reconnect.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/nbd.h     |  2 ++
>  nbd/client-connection.c | 56 +++++++++++++++++++++++++++++++----------
>  2 files changed, 45 insertions(+), 13 deletions(-)

>  NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>                                                 bool do_negotiation,
>                                                 const char *export_name,
> @@ -154,23 +164,43 @@ static void *connect_thread_func(void *opaque)
>      NBDClientConnection *conn = opaque;
>      int ret;
>      bool do_free;
> +    uint64_t timeout = 1;
> +    uint64_t max_timeout = 16;
>  
> -    conn->sioc = qio_channel_socket_new();
> +    while (true) {
> +        conn->sioc = qio_channel_socket_new();
>  
> -    error_free(conn->err);
> -    conn->err = NULL;
> -    conn->updated_info = conn->initial_info;
> +        error_free(conn->err);
> +        conn->err = NULL;
> +        conn->updated_info = conn->initial_info;
>  
> -    ret = nbd_connect(conn->sioc, conn->saddr,
> -                      conn->do_negotiation ? &conn->updated_info : NULL,
> -                      conn->tlscreds, &conn->ioc, &conn->err);

This says that on each retry attempt, we reset whether to ask the
server for structured replies back to our original initial_info
values.

But when dealing with NBD retries in general, I suspect we have a bug.
Consider what happens if our first connection requests structured
replies and base:allocation block status, and we are successful.  But
later, the server disconnects, triggering a retry.  Suppose that on
our retry, we encounter a different server that no longer supports
structured replies.  We would no longer be justified in sending
NBD_CMD_BLOCK_STATUS requests to the reconnected server.  But I can't
find anywhere in the code base that ensures that on a reconnect, the
new server supplies at least as many extensions as the original
server, nor anywhere that we would be able to gracefully handle an
in-flight block status command that can no longer be successfully
continued because the reconnect landed on a downgraded server.

In general, you don't expect a server to downgrade its capabilities
across restarts, so assuming that a retried connection will hit a
server at least as capable as the original server is typical, even if
unsafe.  But it is easy enough to use nbdkit to write a server that
purposefully downgrades its abilities after the first client
connection, for testing how qemu falls apart if it continues making
assumptions about the current server based solely on what it learned
prior to retrying from the first server.

Is this something we need to address quickly for inclusion in 6.2?
Maybe by having a retry connect fail if the new server does not have
the same capabilities as the old?  Do we also need to care about a
server reporting a different size export than the old server?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


