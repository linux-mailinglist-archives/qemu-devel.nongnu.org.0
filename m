Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E0532999
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:44:14 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntSxQ-0000bf-BK
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntRuO-0000dV-PW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntRuM-0007rI-Uc
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653388617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGgFkrWJ8wpXPclw2uIuesXF7BKkgwxvHzjdrqQlv6M=;
 b=Tx4IKbFRyyFKX3oVRBDGzLm97jFAT1UWxXlaiIwfuTVXXkp4VJR1CJGraYGflLSEGrqfGH
 6VH47T5HxgjHvGilqtoK5ah8d82XmJaaXqNby0dw4945h+8UXFW34HrVxAMIq0/Dy5TgQP
 3OoDyV0O44rWmqYMu8xqo+xYcNGbS2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-QTPkv-PPOICzy0RrUmNkMw-1; Tue, 24 May 2022 06:36:48 -0400
X-MC-Unique: QTPkv-PPOICzy0RrUmNkMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 511AC101A52C;
 Tue, 24 May 2022 10:36:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A076C08087;
 Tue, 24 May 2022 10:36:45 +0000 (UTC)
Date: Tue, 24 May 2022 12:36:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <Yoy1PJW2Ff6Xb8Ut@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 18.05.2022 um 14:43 hat Paolo Bonzini geschrieben:
> On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
> > For example, all callers of bdrv_open() always take the AioContext lock.
> > Often it is taken very high in the call stack, but it's always taken.
> 
> I think it's actually not a problem of who takes the AioContext lock or
> where; the requirements are contradictory:

Okay, now that I have explained which challenges I see with the drain
solution, I'd also like to understand the problem that even motivates
you to go back to drains.

> * IO_OR_GS_CODE() functions, when called from coroutine context, expect to
> be called with the AioContext lock taken (example: bdrv_co_yield_to_drain)

Am I right to say this is not inherently part of the definition of
IO_OR_GS_CODE(), but just a property that these functions have in
practice?

In practice, the functions that are IO_OR_GS_CODE() are those that call
AIO_WAIT_WHILE() - which drops the lock, so it must have been taken
first. Of course, when calling from coroutine context, AIO_WAIT_WHILE()
is wrong, so these functions all have a different code path for
coroutines (or they aren't suitable to be called in coroutines at all).

Using a different code path means that the restrictions from
AIO_WAIT_WHILE() don't really apply any more and these functions become
effectively IO_CODE() when called in a coroutine. (At least I'm not
aware of any other piece of code apart from AIO_WAIT_WHILE() that makes
a function IO_OR_GS_CODE().)

Surrounding IO_CODE() with aio_context_acquire/release() is in the
definition of IO_CODE(), so your assumption seems right. (Not sure if
it's actually necessary in all cases and whether all callers do this
correctly, but with this definition we have declared that expections to
this are in fact bugs.)

(You mention bdrv_co_yield_to_drain() as an example. I don't think it's
a good example. The function isn't annotated, but it seems to me that
the correct annotation would be IO_CODE() anyway, i.e. safe to call from
any thread, not just IO_OR_GS_CODE().)

> * to call these functions with the lock taken, the code has to run in the
> BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that cannot
> happen without releasing the aiocontext lock)

This problem can't happen in the main thread itself, AIO_WAIT_WHILE() is
safe both in the home thread and the main thread (at least as long as
you lock only once) because it temporarily drops the lock. It has also
become the definition of IO_OR_GS_CODE(): This code has to run in the
home thread or the main thread.


Of course, above I just concluded that when called from coroutines, in
practice IO_OR_GS_CODE() essentially turns into IO_CODE(). This is
supposed to allow much more:

 * I/O API functions. These functions are thread-safe, and therefore
 * can run in any thread as long as the thread has called
 * aio_context_acquire/release().

Come to think of it, I believe that many of the functions we declared
IO_CODE() are actually just IO_OR_GS_CODE() (at best; for iothreads,
they certainly require running in the home thread, but the main thread
allowed by IO_OR_GS_CODE() might not work). We have all the coroutine
machinery so that the AioContext lock of the current thread is
automatically released and reacquired across yield. However, this is the
wrong AioContext when called from a different thread, so we need an
additional lock - which should be dropped during yield, too, but it
doesn't happen.

Maybe this is really the scenario you mean with this point?

Switching to drain for locking doesn't solve the problem, but only
possibly defer it. In order to complete the multiqueue work, we need
to make IO_CODE() functions actually conform to the definition of
IO_CODE().

Do we have a plan what this should look like in the final state when all
the multiqueue work is completed? Will it require replacing the more or
less automatic AioContext lock handling that we currently have in
coroutines with explicit unlock/lock around all yield points? I assume
that some kind of lock will still have to be held and it wouldn't just
disappear with the removal of the AioContext lock? Or will we only have
coroutine locks which don't have this problem?

> * running the code in the BDS's home iothread is not possible for
> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
> thread, but that cannot be guaranteed in general)

There is nothing that stops GLOBAL_STATE_CODE() from scheduling work in
the home iothread of a BDS and then waiting for it - or if it is a
coroutine, even to reschedule itself into the BDS home thread
temporarily.

This is essentially what all of the generated_co_wrapper functions do,
and the coroutine case is what bdrv_co_enter() does.

So I'm not sure what you mean by this?

Kevin


