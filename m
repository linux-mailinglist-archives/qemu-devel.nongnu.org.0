Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE122CF5E8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:58:50 +0100 (CET)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klIAC-0007Km-Vz
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klFzW-0003bY-7J
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klFzH-0002Wd-I5
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607107158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqtGrcnOAjJRcUBBkz73+Nzqv0AcCdN71ysdvW66lQM=;
 b=RMfVmF2Vs+PQJB7cHw+oEYaeIUEMvb1ZbP2ahGKB9as5QO4JTgqP2J4kJQz4adRXDefqCx
 zah7NNNTvzGn3ZjH1igKb/2kNKxrnTOxLj+rxNB0wgSni4jXmPoj34lTkjSPqU49oo9ZYH
 UnhGzEVtQimaDMQ0yoD8w/Ai6se8nL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-gBsdiHScMK6kmIFuOf1Z6w-1; Fri, 04 Dec 2020 13:39:15 -0500
X-MC-Unique: gBsdiHScMK6kmIFuOf1Z6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289481927800;
 Fri,  4 Dec 2020 18:39:14 +0000 (UTC)
Received: from [10.3.112.195] (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B316A5C1D1;
 Fri,  4 Dec 2020 18:39:07 +0000 (UTC)
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-3-slp@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/2] nbd/server: Quiesce coroutines on context switch
Message-ID: <2a1a0d48-5c0c-fa6a-a648-c65fc8140156@redhat.com>
Date: Fri, 4 Dec 2020 12:39:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204165347.73542-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 10:53 AM, Sergio Lopez wrote:
> When switching between AIO contexts we need to me make sure that both
> recv_coroutine and send_coroutine are not scheduled to run. Otherwise,
> QEMU may crash while attaching the new context with an error like
> this one:
> 
> aio_co_schedule: Co-routine was already scheduled in 'aio_co_schedule'
> 
> To achieve this we need a local implementation of
> 'qio_channel_readv_all_eof' named 'nbd_read_eof' (a trick already done
> by 'nbd/client.c') that allows us to interrupt the operation and to
> know when recv_coroutine is yielding.
> 
> With this in place, we delegate detaching the AIO context to the
> owning context with a BH ('nbd_aio_detach_bh') scheduled using
> 'aio_wait_bh_oneshot'. This BH signals that we need to quiesce the
> channel by setting 'client->quiescing' to 'true', and either waits for
> the coroutine to finish using AIO_WAIT_WHILE or, if it's yielding in
> 'nbd_read_eof', actively enters the coroutine to interrupt it.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900326
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  nbd/server.c | 120 +++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 106 insertions(+), 14 deletions(-)

A complex patch, so I'd appreciate a second set of eyes.

> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 613ed2634a..7229f487d2 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -132,6 +132,9 @@ struct NBDClient {
>      CoMutex send_lock;
>      Coroutine *send_coroutine;
>  
> +    bool read_yielding;
> +    bool quiescing;

Will either of these fields need to be accessed atomically once the
'yank' code is added, or are we still safe with direct access because
coroutines are not multithreaded?

> +
>      QTAILQ_ENTRY(NBDClient) next;
>      int nb_requests;
>      bool closing;
> @@ -1352,14 +1355,60 @@ static coroutine_fn int nbd_negotiate(NBDClient *client, Error **errp)
>      return 0;
>  }
>  
> -static int nbd_receive_request(QIOChannel *ioc, NBDRequest *request,
> +/* nbd_read_eof
> + * Tries to read @size bytes from @ioc. This is a local implementation of
> + * qio_channel_readv_all_eof. We have it here because we need it to be
> + * interruptible and to know when the coroutine is yielding.
> + * Returns 1 on success
> + *         0 on eof, when no data was read (errp is not set)
> + *         negative errno on failure (errp is set)
> + */
> +static inline int coroutine_fn
> +nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
> +{
> +    bool partial = false;
> +
> +    assert(size);
> +    while (size > 0) {
> +        struct iovec iov = { .iov_base = buffer, .iov_len = size };
> +        ssize_t len;
> +
> +        len = qio_channel_readv(client->ioc, &iov, 1, errp);
> +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            client->read_yielding = true;
> +            qio_channel_yield(client->ioc, G_IO_IN);
> +            client->read_yielding = false;

nbd/client.c:nbd_read_eof() uses bdrv_dec/inc_in_flight instead of
read_yielding...

> +            if (client->quiescing) {
> +                return -EAGAIN;
> +            }

and the quiescing check is new; otherwise, these two functions look
identical.  Having two static functions with the same name makes gdb a
bit more annoying (which one of the two did you want your breakpoint
on?).  Is there any way we could write this code only once in
nbd/common.c for reuse by both client and server?  But I can live with
it as written.

> @@ -2151,20 +2223,23 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
>  
>  /* nbd_co_receive_request
>   * Collect a client request. Return 0 if request looks valid, -EIO to drop
> - * connection right away, and any other negative value to report an error to
> - * the client (although the caller may still need to disconnect after reporting
> - * the error).
> + * connection right away, -EAGAIN to indicate we were interrupted and the
> + * channel should be quiesced, and any other negative value to report an error
> + * to the client (although the caller may still need to disconnect after
> + * reporting the error).
>   */
>  static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
>                                    Error **errp)
>  {
>      NBDClient *client = req->client;
>      int valid_flags;
> +    int ret;
>  
>      g_assert(qemu_in_coroutine());
>      assert(client->recv_coroutine == qemu_coroutine_self());
> -    if (nbd_receive_request(client->ioc, request, errp) < 0) {
> -        return -EIO;
> +    ret = nbd_receive_request(client, request, errp);
> +    if (ret < 0) {
> +        return  ret;

Why the double space?

The old code slams to EIO, you preserve errors.  Is that going to bite
us by causing us to see a different errno leaked through?

>      }
>  
>      trace_nbd_co_receive_request_decode_type(request->handle, request->type,
> @@ -2507,6 +2582,17 @@ static coroutine_fn void nbd_trip(void *opaque)
>          return;
>      }
>  
> +    if (client->quiescing) {
> +        /*
> +         * We're switching between AIO contexts. Don't attempt to receive a new
> +         * request and kick the main context which may be waiting for us.

s/request/request,/

> +         */
> +        nbd_client_put(client);
> +        client->recv_coroutine = NULL;
> +        aio_wait_kick();
> +        return;
> +    }
> +
>      req = nbd_request_get(client);
>      ret = nbd_co_receive_request(req, &request, &local_err);
>      client->recv_coroutine = NULL;
> @@ -2519,6 +2605,11 @@ static coroutine_fn void nbd_trip(void *opaque)
>          goto done;
>      }
>  
> +    if (ret == -EAGAIN) {
> +        assert(client->quiescing);
> +        goto done;
> +    }
> +
>      nbd_client_receive_next_request(client);
>      if (ret == -EIO) {
>          goto disconnect;
> @@ -2565,7 +2656,8 @@ disconnect:
>  
>  static void nbd_client_receive_next_request(NBDClient *client)
>  {
> -    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS) {
> +    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS &&
> +        !client->quiescing) {
>          nbd_client_get(client);
>          client->recv_coroutine = qemu_coroutine_create(nbd_trip, client);
>          aio_co_schedule(client->exp->common.ctx, client->recv_coroutine);
> 

Overall looks okay to me,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


