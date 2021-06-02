Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E413399330
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:06:43 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWCQ-0006fS-C1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loWB5-0005Jq-OL
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loWB3-0005go-4N
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622660714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yO+bcUaddCzSKZpDO9kBEODFE7ZBdLfmeXnw/JvsPwk=;
 b=Rqv/RLXPUZvfu9VtqD4cVKEiP7Yt0/U+5AIWfxdjY8+FFsjMJ8ggCjT+HQoRWmV01+RkNS
 iFqwx26QkfUnartAnMGvsN5gkC9GpUI3bdmnvdBRqfz5FClBMOfae08OYP7kEkTMBG0Ted
 bQzhW4kC5qGFUtwenEu8hvTcWNfrnV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-VT4ORtWrOeCOIHdZ1dJzew-1; Wed, 02 Jun 2021 15:05:10 -0400
X-MC-Unique: VT4ORtWrOeCOIHdZ1dJzew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283E5107ACCA;
 Wed,  2 Jun 2021 19:05:09 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3979E13470;
 Wed,  2 Jun 2021 19:05:08 +0000 (UTC)
Date: Wed, 2 Jun 2021 14:05:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 07/33] block/nbd: simplify waking of
 nbd_co_establish_connection()
Message-ID: <20210602190506.vdmvpgi7mkfqvhle@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-8-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Fri, Apr 16, 2021 at 11:08:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:

Grammar suggestions:

> Instead of connect_bh, bh_ctx and wait_connect fields we can live with
> only one link to waiting coroutine, protected by mutex.

Instead of managing connect_bh, bh_ctx, and wait_connect fields, we
can use a single link to the waiting coroutine with proper mutex
protection.

> 
> So new logic is:
> 
> nbd_co_establish_connection() sets wait_co under mutex, release the
> mutex and do yield(). Note, that wait_co may be scheduled by thread
> immediately after unlocking the mutex. Still, in main thread (or
> iothread) we'll not reach the code for entering the coroutine until the
> yield() so we are safe.

nbd_co_establish_connection() sets wait_co under the mutex, releases
the mutex, then yield()s.  Note that wait_co may be scheduled by the
thread immediately after unlocking the mutex.  Still, the main thread
(or iothread) will not reach the code for entering the coroutine until
the yield(), so we are safe.

> 
> Both connect_thread_func() and nbd_co_establish_connection_cancel() do
> the following to handle wait_co:
> 
> Under mutex, if thr->wait_co is not NULL, call aio_co_wake() (which
> never tries to acquire aio context since previous commit, so we are
> safe to do it under thr->mutex) and set thr->wait_co to NULL.
> This way we protect ourselves of scheduling it twice.

Under the mutex, if thr_wait_co is not NULL, call aio_co_wake() (the
previous commit ensures it never tries to acquire the aio context, so
we are safe even while under thr->mutex), then sets thr->wait_co to
NULL.  This way, we avoid scheduling the coroutine twice.

> 
> Also this commit make nbd_co_establish_connection() less connected to
> bs (we have generic pointer to the coroutine, not use s->connection_co
> directly). So, we are on the way of splitting connection API out of
> nbd.c (which is overcomplicated now).

Also, this commit reduces the dependence of
nbd_co_establish_connection() on the internals of bs (we now use a
generic pointer to the coroutine, instead of direct use of
s->connection_co).  This is a step towards splitting the connection
API out of nbd.c.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 49 +++++++++----------------------------------------
>  1 file changed, 9 insertions(+), 40 deletions(-)
> 

> +++ b/block/nbd.c

> @@ -101,10 +95,10 @@ typedef struct NBDConnectThread {
>      QIOChannelSocket *sioc;
>      Error *err;
>  
> -    /* state and bh_ctx are protected by mutex */
>      QemuMutex mutex;
> +    /* All further fields are protected by mutex */
>      NBDConnectThreadState state; /* current state of the thread */
> -    AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
> +    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */

I'm not sure if that comment is the most legible, but I'm not coming
up with an alternative.  Maybe:

/*
 * if non-NULL, which coroutine to wake in
 * nbd_co_establish_connection() after yield()
 */


But the simplification looks nice, and I didn't spot any obvious
problems with the refactoring.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


