Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06074FFA8E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 17:44:27 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefAQ-0002mh-C2
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 11:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nef90-0001WM-7L
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nef8x-0001XX-Gb
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649864575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8crzsj/ks5JVzrilq0k3tC5d9+edaa4ib26eRPGB5k=;
 b=iAAGcny1OEwVSc7IDRLx171UA5mOwaej4Tg3GyQgxok2ogE70XEKQ1cVskXEJ9MoJGbfN3
 /x+hLiDqLhbQMCIUMEnjVCuh859kLoS/3NZv55jze715uT2qXEkaAR9bahk537J1bvPDui
 rfvI61DVY0NqTmKddiDpXn9Z5bpj9oQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-rUxffBqiPJqIvPOXmitW0A-1; Wed, 13 Apr 2022 11:42:53 -0400
X-MC-Unique: rUxffBqiPJqIvPOXmitW0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FD5A1014A61
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 15:42:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E800B2166B4F;
 Wed, 13 Apr 2022 15:42:52 +0000 (UTC)
Date: Wed, 13 Apr 2022 10:42:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 4/8] nbd: keep send_mutex/free_sema handling
 outside nbd_co_do_establish_connection
Message-ID: <20220413154251.nk33rcipdvvsuvso@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 09:42:00PM +0200, Paolo Bonzini wrote:
> Elevate s->in_flight early so that other incoming requests will wait
> on the CoQueue in nbd_co_send_request; restart them after getting back
> from nbd_reconnect_attempt.  This could be after the reconnect timer or
> nbd_cancel_in_flight have cancelled the attempt, so there is no
> need anymore to cancel the requests there.
> 
> nbd_co_send_request now handles both stopping and restarting pending
> requests after a successful connection, and there is no need to
> hold send_mutex in nbd_co_do_establish_connection.  The current setup
> is confusing because nbd_co_do_establish_connection is called both with
> send_mutex taken and without it.  Before the patch it uses free_sema which
> (at least in theory...) is protected by send_mutex, after the patch it
> does not anymore.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/coroutines.h |  4 +--
>  block/nbd.c        | 66 ++++++++++++++++++++++------------------------
>  2 files changed, 33 insertions(+), 37 deletions(-)
> 

> +++ b/block/nbd.c

> @@ -359,25 +354,25 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>  /* called under s->send_mutex */
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>  {
> -    assert(nbd_client_connecting(s));
> -    assert(s->in_flight == 0);
> -
> -    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
> -        !s->reconnect_delay_timer)
> -    {
> -        /*
> -         * It's first reconnect attempt after switching to
> -         * NBD_CLIENT_CONNECTING_WAIT
> -         */
> -        reconnect_delay_timer_init(s,
> -            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> -            s->reconnect_delay * NANOSECONDS_PER_SECOND);
> -    }
> +    bool blocking = nbd_client_connecting_wait(s);
>  
>      /*
>       * Now we are sure that nobody is accessing the channel, and no one will
>       * try until we set the state to CONNECTED.
>       */
> +    assert(nbd_client_connecting(s));
> +    assert(s->in_flight == 1);
> +
> +    if (blocking && !s->reconnect_delay_timer) {
> +        /*
> +         * It's first reconnect attempt after switching to

While moving this, we could add the missing article: "It's the first"

> +         * NBD_CLIENT_CONNECTING_WAIT
> +         */
> +        g_assert(s->reconnect_delay);
> +        reconnect_delay_timer_init(s,
> +            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> +            s->reconnect_delay * NANOSECONDS_PER_SECOND);
> +    }
>  
>      /* Finalize previous connection if any */
>      if (s->ioc) {
> @@ -388,7 +383,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>          s->ioc = NULL;
>      }
>  
> -    nbd_co_do_establish_connection(s->bs, NULL);
> +    qemu_co_mutex_unlock(&s->send_mutex);
> +    nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    qemu_co_mutex_lock(&s->send_mutex);
>  
>      /*
>       * The reconnect attempt is done (maybe successfully, maybe not), so
> @@ -474,21 +471,21 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>      qemu_co_mutex_lock(&s->send_mutex);
>  
>      while (s->in_flight == MAX_NBD_REQUESTS ||
> -           (!nbd_client_connected(s) && s->in_flight > 0))
> -    {
> +           (!nbd_client_connected(s) && s->in_flight > 0)) {

Mixing in a style change here.  Not the end of the world.

The cosmetics are trivial, and the real change of enlarging the scope
of in_flight makes sense to me.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


