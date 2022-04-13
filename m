Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A94FFB2C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:24:52 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefnV-0000up-An
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nefmD-0000Fc-7s
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nefm7-0001FB-Mg
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649866999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1lCxOP2vIx0xeCOOejdbT/RrrpwMgFlZOnrXACg5P4M=;
 b=FtLM4R6gO2ccso2Lle4qHAFxMyWhY3hrevkyBl/p26KMbGapPAX5TX+H0Mf8LYs9rGlBdD
 5G1Wfjn2CGgXU78wge8bstjK2z+oawqJqMRlFt9QeL+I6hp/qD97AwTab22AtS7logmhWb
 8/UNMM4UsUwkzKq3vRhlF8WvNAjTsZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-zI3UWk3HOKmsDGwsljWFzw-1; Wed, 13 Apr 2022 12:23:18 -0400
X-MC-Unique: zI3UWk3HOKmsDGwsljWFzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCF9A1C0690E
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 16:23:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB0F7AEA;
 Wed, 13 Apr 2022 16:23:15 +0000 (UTC)
Date: Wed, 13 Apr 2022 11:23:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 6/8] nbd: move s->state under requests_lock
Message-ID: <20220413162313.ckrqv6a6vr2jtcjr@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-7-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-7-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Apr 12, 2022 at 09:42:02PM +0200, Paolo Bonzini wrote:
> Remove the confusing, and most likely wrong, atomics.  The only function
> that used to be somewhat in a hot path was nbd_client_connected(),
> but it is not anymore after the previous patches.
> 
> The function nbd_client_connecting_wait() was used mostly to check if
> a request had to be reissued (outside requests_lock), but also
> under requests_lock in nbd_client_connecting_wait().  The two uses have to

"Function A was used mostly..., but also under requests_lock in
function A."  Reading the rest of the patch, I think...[1]

> be separated; for the former we rename it to nbd_client_will_reconnect()
> and make it take s->requests_lock; for the latter the access can simply
> be inlined.  The new name is clearer, and ensures that a missing
> conversion is caught by the compiler.

I take it your experiments with C++ coroutines helped find this ;)

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 88 +++++++++++++++++++++++++++++------------------------
>  1 file changed, 48 insertions(+), 40 deletions(-)

> @@ -226,7 +225,9 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>          s->ioc = NULL;
>      }
>  
> -    s->state = NBD_CLIENT_QUIT;
> +    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
> +        s->state = NBD_CLIENT_QUIT;
> +    }
>  }

This style for protecting s->state at the end of the function takes 3
lines thanks to WITH_QEMU_LOCK_GUARD...[2]

>  
>  static void open_timer_del(BDRVNBDState *s)
> @@ -255,16 +256,13 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>      timer_mod(s->open_timer, expire_time_ns);
>  }
>  
> -static bool nbd_client_connecting(BDRVNBDState *s)
> +static bool nbd_client_will_reconnect(BDRVNBDState *s)

This part of the diff got hard to read, since you mixed shuffling
functions with a rename.  On a closer read, I see that
nbd_client_connecting() was merely moved later[3], while the new name
nbd_client_will_reconnect()...[4]

>  {
> -    NBDClientState state = qatomic_load_acquire(&s->state);
> -    return state == NBD_CLIENT_CONNECTING_WAIT ||
> -        state == NBD_CLIENT_CONNECTING_NOWAIT;
> -}
> -
> -static bool nbd_client_connecting_wait(BDRVNBDState *s)

[4]...is indeed happening to nbd_client_connecting_wait(), as promised
in the commit message.  Which means:

[1]...so it looks like the first 'function A' did indeed want to be
nbd_client_connecting_wait() which got renamed (since
nbd_client_connecting() was moved later in the file), while...[1]

> -{
> -    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
> +    /*
> +     * Called only after a socket error, so this is not performance sensitive.
> +     */
> +    QEMU_LOCK_GUARD(&s->requests_lock);
> +    return s->state == NBD_CLIENT_CONNECTING_WAIT;
>  }

[2]...while here, you only needed two lines, using QEMU_LOCK_GUARD.
Both styles work, but it seems like we should be consistent, and I
would favor the shorter style when all that is being guarded is a
single line.

>  
>  /*
> @@ -351,15 +349,24 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>      qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
>  
>      /* successfully connected */
> -    s->state = NBD_CLIENT_CONNECTED;
> +    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
> +        s->state = NBD_CLIENT_CONNECTED;
> +    }
>  
>      return 0;
>  }

Another place where the shorter QEMU_LOCK_GUARD() would work.

>  
> +/* Called with s->requests_lock held.  */
> +static bool nbd_client_connecting(BDRVNBDState *s)

[3]...here's where the moved function threw me off.  Perhaps splitting
out a preliminary patch to just move the function before converting it
to be under s->requests_lock, so that the rename of a different
function doesn't cause a hard-to-grok diff, would be wise.

> +{
> +    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
> +        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
> +}
> +
>  /* Called with s->requests_lock taken.  */
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>  {
> -    bool blocking = nbd_client_connecting_wait(s);
> +    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;

[1]...and the second instance of 'function A' in the commit message
should have been nbd_reconnect_attempt().

As messy as the diff was, I still think I understood it.  With the
necessary correction to the commit message according to [1], I could
be comfortable with

Reviewed-by: Eric Blake <eblake@redhat.com>

although the suggestion in [3] to split out the function motion to a
separate patch may result in the v2 series looking different enough
that you may want to leave off my R-b to ensure I still review things
carefully.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


