Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA194FFABD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 17:56:42 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefMG-0007qQ-RE
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 11:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nefLR-0006zs-Di
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nefLN-0004D2-4B
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649865341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6iI/I91v8wtOKAITTbLvL/cx4hZI369FLBalUfawxb4=;
 b=QsaXidLBY6X+KUuoFwIo6Y/D/xOxGrTLtwv+VByAFItkPfMGm4VsCdJEi05Y6BKI5QArCx
 UZ7UQBQvtnJobZitHWh/uURb4hxX31A1UcBSt017P8NSpLmhYDD6JerPhbHi4eQHrCJCE0
 cMWYOfMURD1cBtgoUhdz5MoBTF0ohdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-qBStC0g3OGif8Kl8HKClNw-1; Wed, 13 Apr 2022 11:55:39 -0400
X-MC-Unique: qBStC0g3OGif8Kl8HKClNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8596885CE0B
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 15:55:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA902024CC2;
 Wed, 13 Apr 2022 15:55:35 +0000 (UTC)
Date: Wed, 13 Apr 2022 10:55:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 5/8] nbd: use a QemuMutex to synchronize
 reconnection with coroutines
Message-ID: <20220413155534.otfxvsfzhgasefmw@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-6-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-6-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Tue, Apr 12, 2022 at 09:42:01PM +0200, Paolo Bonzini wrote:
> The condition for waiting on the s->free_sema queue depends on
> both s->in_flight and s->state.  The latter is currently using
> atomics, but this is quite dubious and probably wrong.
> 
> Because s->state is written in the main thread too, for example by
> the reconnect timer callback, it cannot be protected by a CoMutex.
> Introduce a separate lock that can be used by nbd_co_send_request();
> later on this lock will also be used for s->state.  There will not
> be any contention on the lock unless there is a reconnect, so this
> is not performance sensitive.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 46 +++++++++++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 0ff41cb914..c908ea6ae3 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -72,17 +72,22 @@ typedef struct BDRVNBDState {
>      QIOChannel *ioc; /* The current I/O channel */
>      NBDExportInfo info;
>  
> -    CoMutex send_mutex;
> +    /*
> +     * Protects free_sema, in_flight, requests[].coroutine,
> +     * reconnect_delay_timer.
> +     */
> +    QemuMutex requests_lock;
>      CoQueue free_sema;
> -
> -    CoMutex receive_mutex;
>      int in_flight;
> +    NBDClientRequest requests[MAX_NBD_REQUESTS];
> +    QEMUTimer *reconnect_delay_timer;
> +
> +    CoMutex send_mutex;
> +    CoMutex receive_mutex;
>      NBDClientState state;
>  
> -    QEMUTimer *reconnect_delay_timer;
>      QEMUTimer *open_timer;
>  
> -    NBDClientRequest requests[MAX_NBD_REQUESTS];

Reordering of the struct makes sense.

> @@ -468,11 +473,10 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>      int rc, i = -1;
>  
> -    qemu_co_mutex_lock(&s->send_mutex);
> -
> +    qemu_mutex_lock(&s->requests_lock);
>      while (s->in_flight == MAX_NBD_REQUESTS ||
>             (!nbd_client_connected(s) && s->in_flight > 0)) {
> -        qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
> +        qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
>      }
>  
>      s->in_flight++;
> @@ -493,14 +497,14 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>          }
>      }
>  
> -    g_assert(qemu_in_coroutine());

Why is this assert dropped?  Is it because we've marked the function
with coroutine_fn?  If so, should we drop it earlier in the series,
when you added the label?

Otherwise, the patch makes sense to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


