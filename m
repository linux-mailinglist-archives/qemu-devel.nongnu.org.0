Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C739ACDA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:28:50 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loutV-0005q1-15
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lousi-0004sM-KX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lousf-0000Ai-Ar
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622755676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjH25FhjuvemhwhGIvIDr24XPBnm6wfBs7JWfxzyV/I=;
 b=H/fSJGAWpwAdmT24xFyPYGy6MfizVzNHsxJbfjm1yCqx7Iq3tLINDvc5UlWu39mXPppCqP
 lOFt6CXyy193BbDx3QXn8SeXK0Mj9YlSkHjk25vTuI5amWZ5BMIRugmFf7LVTe0T1sir+F
 ZmDncDuLzvEmQdo7qUSTTNa5j9jfAdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-B8y2_HmKMGellH5ZyXMiTw-1; Thu, 03 Jun 2021 17:27:50 -0400
X-MC-Unique: B8y2_HmKMGellH5ZyXMiTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DEFB107ACCA;
 Thu,  3 Jun 2021 21:27:49 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3841260D06;
 Thu,  3 Jun 2021 21:27:48 +0000 (UTC)
Date: Thu, 3 Jun 2021 16:27:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 33/33] block/nbd: drop connection_co
Message-ID: <20210603212746.45kjkbxit62w3hup@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-34-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-34-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Fri, Apr 16, 2021 at 11:09:11AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> OK, that's a big rewrite of the logic.
> 
> Pre-patch we have an always running coroutine - connection_co. It does
> reply receiving and reconnecting. And it leads to a lot of difficult
> and unobvious code around drained sections and context switch. We also
> abuse bs->in_flight counter which is increased for connection_co and
> temporary decreased in points where we want to allow drained section to
> begin. One of these place is in another file: in nbd_read_eof() in
> nbd/client.c.
> 
> We also cancel reconnect and requests waiting for reconnect on drained
> begin which is not correct.
> 
> Let's finally drop this always running coroutine and go another way:
> 
> 1. reconnect_attempt() goes to nbd_co_send_request and called under
>    send_mutex
> 
> 2. We do receive headers in request coroutine. But we also should
>    dispatch replies for another pending requests. So,
>    nbd_connection_entry() is turned into nbd_receive_replies(), which
>    does reply dispatching until it receive another request headers, and
>    returns when it receive the requested header.
> 
> 3. All old staff around drained sections and context switch is dropped.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c  | 376 ++++++++++++++++-----------------------------------
>  nbd/client.c |   2 -
>  2 files changed, 119 insertions(+), 259 deletions(-)
> 

> -static coroutine_fn void nbd_connection_entry(void *opaque)
> +static coroutine_fn void nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
>  {
> -    BDRVNBDState *s = opaque;
>      uint64_t i;
>      int ret = 0;
>      Error *local_err = NULL;
>  
> -    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
> -        /*
> -         * The NBD client can only really be considered idle when it has
> -         * yielded from qio_channel_readv_all_eof(), waiting for data. This is
> -         * the point where the additional scheduled coroutine entry happens
> -         * after nbd_client_attach_aio_context().
> -         *
> -         * Therefore we keep an additional in_flight reference all the time and
> -         * only drop it temporarily here.
> -         */
> +    i = HANDLE_TO_INDEX(s, handle);
> +    if (s->receive_co) {
> +        assert(s->receive_co != qemu_coroutine_self());
>  
> -        if (nbd_client_connecting(s)) {
> -            nbd_co_reconnect_loop(s);
> -        }
> +        /* Another request coroutine is receiving now */
> +        s->requests[i].receiving = true;
> +        qemu_coroutine_yield();
> +        assert(!s->requests[i].receiving);
>  
> -        if (!nbd_client_connected(s)) {
> -            continue;
> +        if (s->receive_co != qemu_coroutine_self()) {
> +            /*
> +             * We are either failed or done, caller uses nbd_client_connected()
> +             * to distinguish.
> +             */
> +            return;
>          }
> +    }
> +
> +    assert(s->receive_co == 0 || s->receive_co == qemu_coroutine_self());

s/0/NULL/ here

> +    s->receive_co = qemu_coroutine_self();
>  
> +    while (nbd_client_connected(s)) {
>          assert(s->reply.handle == 0);
>          ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, &local_err);
>  
> @@ -522,8 +380,21 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
>              local_err = NULL;
>          }
>          if (ret <= 0) {
> -            nbd_channel_error(s, ret ? ret : -EIO);
> -            continue;
> +            ret = ret ? ret : -EIO;
> +            nbd_channel_error(s, ret);
> +            goto out;
> +        }
> +
> +        if (!nbd_client_connected(s)) {
> +            ret = -EIO;
> +            goto out;
> +        }
> +
> +        i = HANDLE_TO_INDEX(s, s->reply.handle);
> +
> +        if (s->reply.handle == handle) {
> +            ret = 0;
> +            goto out;
>          }
>  
>          /*

I know your followup said there is more work to do before v4, but I
look forward to seeing it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


