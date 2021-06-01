Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2A39779E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:57 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6zk-0006Di-6A
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo6wr-0003bz-JF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo6wo-0006LQ-6o
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622563732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYjukQrmh6nz0geADNfrKfmH4j9iga6rGL6RjXkrUb0=;
 b=LcOQEzaioFrbd/WkzFlnjanjwWfPQgPe4dg8VVMWIkOQUfR70IVBCxiqOY8uGM1t8Gwli9
 v09KrjrCIooLm0ahlCu4YV1RLdDGh+jW2/ygnVugd8v2PAkeLw8uFeqN9UfsNhtba9m4sx
 gUQksCJ2mjla/scnFXZgXDjapDGdcdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-pV7VxA7IN1Wtn29CjFTXzg-1; Tue, 01 Jun 2021 12:08:48 -0400
X-MC-Unique: pV7VxA7IN1Wtn29CjFTXzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D849E180FD64;
 Tue,  1 Jun 2021 16:08:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 511F55D751;
 Tue,  1 Jun 2021 16:08:43 +0000 (UTC)
Date: Tue, 1 Jun 2021 18:08:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <YLZbibzZFibabhm/@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-3-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601055728.90849-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.06.2021 um 07:57 hat Sergio Lopez geschrieben:
> Before switching between AioContexts we need to make sure that we're
> fully quiesced ("nb_requests == 0" for every client) when entering the
> drained section.
> 
> To do this, we set "quiescing = true" for every client on
> ".drained_begin" to prevent new coroutines to be created, and check if
> "nb_requests == 0" on ".drained_poll". Finally, once we're exiting the
> drained section, on ".drained_end" we set "quiescing = false" and
> call "nbd_client_receive_next_request()" to resume the processing of
> new requests.
> 
> With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> reverted to be as simple as they were before f148ae7d36.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  nbd/server.c | 99 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 75 insertions(+), 24 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 86a44a9b41..33e55479d7 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -132,7 +132,7 @@ struct NBDClient {
>      CoMutex send_lock;
>      Coroutine *send_coroutine;
>  
> -    bool read_yielding;
> +    GSList *yield_co_list; /* List of coroutines yielding on nbd_read_eof */
>      bool quiescing;

Hm, how do you get more than one coroutine per client yielding in
nbd_read_eof() at the same time? I thought the model is that you always
have one coroutine reading the next request (which is
client->recv_coroutine) and all the others are just processing the
request they had read earlier. Multiple coroutines reading from the
same socket would sound like a bad idea.

>      QTAILQ_ENTRY(NBDClient) next;
> @@ -1367,6 +1367,7 @@ static inline int coroutine_fn
>  nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
>  {
>      bool partial = false;
> +    Coroutine *co;
>  
>      assert(size);
>      while (size > 0) {
> @@ -1375,9 +1376,12 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
>  
>          len = qio_channel_readv(client->ioc, &iov, 1, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
> -            client->read_yielding = true;
> +            co = qemu_coroutine_self();
> +
> +            client->yield_co_list = g_slist_prepend(client->yield_co_list, co);
>              qio_channel_yield(client->ioc, G_IO_IN);
> -            client->read_yielding = false;
> +            client->yield_co_list = g_slist_remove(client->yield_co_list, co);
> +
>              if (client->quiescing) {
>                  return -EAGAIN;
>              }
> @@ -1513,6 +1517,11 @@ static void nbd_request_put(NBDRequestData *req)
>      g_free(req);
>  
>      client->nb_requests--;
> +
> +    if (client->quiescing && client->nb_requests == 0) {
> +        aio_wait_kick();
> +    }
> +
>      nbd_client_receive_next_request(client);
>  
>      nbd_client_put(client);
> @@ -1530,49 +1539,75 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
>      QTAILQ_FOREACH(client, &exp->clients, next) {
>          qio_channel_attach_aio_context(client->ioc, ctx);
>  
> +        assert(client->nb_requests == 0);
>          assert(client->recv_coroutine == NULL);
>          assert(client->send_coroutine == NULL);
> -
> -        if (client->quiescing) {
> -            client->quiescing = false;
> -            nbd_client_receive_next_request(client);
> -        }
>      }
>  }
>  
> -static void nbd_aio_detach_bh(void *opaque)
> +static void blk_aio_detach(void *opaque)
>  {
>      NBDExport *exp = opaque;
>      NBDClient *client;
>  
> +    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> +
>      QTAILQ_FOREACH(client, &exp->clients, next) {
>          qio_channel_detach_aio_context(client->ioc);
> +    }
> +
> +    exp->common.ctx = NULL;
> +}
> +
> +static void nbd_drained_begin(void *opaque)
> +{
> +    NBDExport *exp = opaque;
> +    NBDClient *client;
> +
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
>          client->quiescing = true;
> +    }
> +}
>  
> -        if (client->recv_coroutine) {
> -            if (client->read_yielding) {
> -                qemu_aio_coroutine_enter(exp->common.ctx,
> -                                         client->recv_coroutine);
> -            } else {
> -                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
> -            }
> -        }
> +static void nbd_drained_end(void *opaque)
> +{
> +    NBDExport *exp = opaque;
> +    NBDClient *client;
>  
> -        if (client->send_coroutine) {
> -            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
> -        }
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
> +        client->quiescing = false;
> +        nbd_client_receive_next_request(client);
>      }
>  }
>  
> -static void blk_aio_detach(void *opaque)
> +static bool nbd_drained_poll(void *opaque)
>  {
>      NBDExport *exp = opaque;
> +    NBDClient *client;
> +    Coroutine *co;
> +    GSList *entry;
> +    GSList *coroutine_list;
>  
> -    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
> +        if (client->nb_requests != 0) {
> +            /*
> +             * Enter coroutines waiting for new requests on nbd_read_eof(), so
> +             * we don't depend on the client to wake us up.
> +             */
> +            coroutine_list = g_slist_copy(client->yield_co_list);
> +            for (entry = coroutine_list;
> +                 entry != NULL;
> +                 entry = g_slist_next(entry)) {
> +                co = entry->data;
> +                qemu_aio_coroutine_enter(exp->common.ctx, co);
> +            }
> +            g_slist_free(coroutine_list);
>  
> -    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
> +            return 1;

This would be more accurately spelt true...

> +        }
> +    }
>  
> -    exp->common.ctx = NULL;
> +    return 0;

...and this false.

>  }
>  
>  static void nbd_eject_notifier(Notifier *n, void *data)

The patch looks correct to me, though I'm not sure if yield_co_list is
an unnecessary complication (and if it isn't, whether that's safe).

I would be happy enough to apply it anyway if you can explain the
yield_co_list thing, but I'll give Eric some time to have a look, too.

Kevin


