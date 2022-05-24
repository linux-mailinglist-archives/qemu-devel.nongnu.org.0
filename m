Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA9532A57
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:28:31 +0200 (CEST)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTeI-0003UB-6r
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTMb-0003YS-AC
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTMY-0006k8-EO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653394209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N3dpTDhoSpOPXC4uSbJm4lLWrwzTnkQiWHaAvAZ+r/g=;
 b=THyalllJ2AHyVmY2F5JX4H0iKpI7ybBq3ecTb34jB/u4Gk9NhPgxGZTwh3Z/TNbNdokg1N
 QjtjBuYYY1moEoOCSelYG0iuh4R1mmPiOaJrMQZFqsTkW2i6iq4dM7pmMg8wci/6kwWEJy
 gdQ64l7Fk7ddHIj6Rrg/lNi1TGW/zq0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-LxAkvP8LM7KBKxX600qMYA-1; Tue, 24 May 2022 08:10:08 -0400
X-MC-Unique: LxAkvP8LM7KBKxX600qMYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAF231C0514C;
 Tue, 24 May 2022 12:10:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4431F4087D63;
 Tue, 24 May 2022 12:10:05 +0000 (UTC)
Date: Tue, 24 May 2022 14:10:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YozLHPif/jCmOfei@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2022 um 14:28 hat Emanuele Giuseppe Esposito geschrieben:
> label: // read till the end to see why I wrote this here
> 
> I was hoping someone from the "No" party would answer to your question,
> because as you know we reached this same conclusion together.
> 
> We thought about dropping the drain for various reasons, the main one
> (at least as far as I understood) is that we are not sure if something
> can still happen in between drain_begin/end, and it is a little bit
> confusing to use the same mechanism to block I/O and protect the graph.
> 
> We then thought about implementing a rwlock. A rdlock would clarify what
> we are protecting and who is using the lock. I had a rwlock draft
> implementation sent in this thread, but this also lead to additional
> problems.
> Main problem was that this new lock would introduce nested event loops,
> that together with such locking would just create deadlocks.
> If readers are in coroutines and writers are not (because graph
> operations are not running in coroutines), we have a lot of deadlocks.
> If a writer has to take the lock, it must wait all other readers to
> finish. And it does it by internally calling AIO_WAIT_WHILE, creating
> nested event loop. We don't know what could execute when polling for
> events, and for example another writer could be resumed.

Why is this a problem? Your AIO_WAIT_WHILE() condition would be that
there are neither readers nor writers, so you would just keep waiting
until the other writer is done.

> Ideally, we want writers in coroutines too.
>
> Additionally, many readers are running in what we call "mixed"
> functions: usually implemented automatically with generated_co_wrapper
> tag, they let a function (usually bdrv callback) run always in a
> coroutine, creating one if necessary. For example, bdrv_flush() makes
> sure hat bs->bdrv_co_flush() is always run in a coroutine.
> Such mixed functions are used in other callbacks too, making it really
> difficult to understand if we are in a coroutine or not, and mostly
> important make rwlock usage very difficult.

How do they make rwlock usage difficult?

*goes back to old IRC discussions*

Ah, the problem was not the AIO_WAIT_WHILE() while taking the lock, but
taking the lock first and then running an AIO_WAIT_WHILE() inside the
locked section. This is forbidden because the callbacks that run during
AIO_WAIT_WHILE() may in turn wait for the lock that you own, causing a
deadlock.

This is indeed a problem that running in coroutines would avoid because
the inner waiter would just yield and the outer one could complete its
job as soon as it's its turn.

My conclusion in the IRC discussion was that maybe we need to take the
graph locks when we're entering coroutine context, i.e. the "mixed"
functions would rdlock the graph when called from non-coroutine context
and would assume that it's already locked when called from coroutine
context.

> Which lead us to stepping back once more and try to convert all
> BlockDriverState callbacks in coroutines. This would greatly simplify
> rwlock usage, because we could make the rwlock coroutine-frendly
> (without any AIO_WAIT_WHILE, allowing a writer to wait for readers by
> just yielding and queuing itself in coroutine queues).
> 
> First step was then to convert all callbacks in coroutines, using
> generated_coroutine_wrapper (g_c_w).
> A typical g_c_w is implemented in this way:
> 	if (qemu_in_coroutine()) {
> 		callback();
> 	} else { // much simplified
> 		co = qemu_coroutine_create(callback);
> 		bdrv_coroutine_enter(bs, co);
> 		BDRV_POLL_WHILE(bs, coroutine_in_progress);
> 	}
> Once all callbacks are implemented using g_c_w, we can start splitting
> the two sides of the if function to only create a coroutine when we are
> outside from a bdrv callback.
> 
> However, we immediately found a problem while starting to convert the
> first callbacks: the AioContext lock is taken around some non coroutine
> callbacks! For example, bs->bdrv_open() is always called with the
> AioContext lock taken. In addition, callbacks like bdrv_open are
> graph-modifying functions, which is probably why we are taking the
> Aiocontext lock, and they do not like to run in coroutines.
> Anyways, the real problem comes when we create a coroutine in such
> places where the AioContext lock is taken and we have a graph-modifying
> function.
> 
> bdrv_coroutine_enter() calls aio_co_enter(), which in turns first checks
>  if the coroutine is entering another context from the current (which is
> not the case for open) and if we are already in coroutine (for sure
> not). Therefore it resorts to the following calls;
> 	aio_context_acquire(ctx);
>         qemu_aio_coroutine_enter(ctx, co);
>         aio_context_release(ctx);
> Which is clearly a problem, because we are taking the lock twice: once
> from the original caller of the callback, and once here due to the
> coroutine. This creates a lot of deadlock situations.

What are the deadlock situations that are created by locking twice?

The only problem I'm aware of is AIO_WAIT_WHILE(), which wants to
temporarily unlock the AioContext It calls aio_context_release() once to
achieve this, which obviously isn't enough when the context was locked
twice.

But AIO_WAIT_WHILE() isn't allowed in coroutines anyway. So how are we
running into deadlocks here?

Note that we're probably already doing this inside the .bdrv_open
implementations: They will ususally read something from the image file,
calling bdrv_preadv() which is already a generated_coroutine_wrapper
today and creates a coroutine internally with the same locking pattern
applied that you describe as problematic here.

Making .bdrv_open itself a generated_coroutine_wrapper wouldn't really
change anything fundamental, it would just pull the existing mechanism
one function higher in the call stack.

> For example, all callers of bdrv_open() always take the AioContext lock.
> Often it is taken very high in the call stack, but it's always taken.
> 
> Getting rid of the lock around qemu_aio_coroutine_enter() is difficult
> too, because coroutines expect to have the lock taken. For example, if
> we want to drain from a coroutine, bdrv_co_yield_to_drain releases the
> lock for us.

It's not difficult at all in your case where you know that you're
already in the right thread and the lock is taken: You can call
qemu_aio_coroutine_enter() directly instead of bdrv_coroutine_enter() in
this case.

But as I said, I'm not sure why we need to get rid of it at all.

Kevin


