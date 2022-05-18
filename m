Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC552BFB7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:16:03 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMLC-0000La-3u
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrMJg-0007hX-3n
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrMJd-0003fO-Ag
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652890464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q+yYQY6l/NKa8F1avtShOeI5sI1I6xz6me+sODcMwZg=;
 b=BBwucwJuMcWEQ8GBUp1tQtRYBqtG4u9dYBrgLtSOMFShN/F7/wVscIEA3+3zcvsbQ332uW
 hrcoBqTnX+BXimk0ZXw0nBir1t1x56h/LDUroLK5uhg79PrNy+uarA5fT6tpqaES83rmYe
 pwKh/VW75gFU+FNC0+JoVTghJZTUqxo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-3IogRAxhNZmJsckKTWf0lw-1; Wed, 18 May 2022 12:14:20 -0400
X-MC-Unique: 3IogRAxhNZmJsckKTWf0lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C13AE296A607;
 Wed, 18 May 2022 16:14:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DBEEC15E71;
 Wed, 18 May 2022 16:14:18 +0000 (UTC)
Date: Wed, 18 May 2022 18:14:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoUbWYfl0Bft3LiU@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> 
> * IO_OR_GS_CODE() functions, when called from coroutine context, expect to
> be called with the AioContext lock taken (example: bdrv_co_yield_to_drain)
> 
> * to call these functions with the lock taken, the code has to run in the
> BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that cannot
> happen without releasing the aiocontext lock)
> 
> * running the code in the BDS's home iothread is not possible for
> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
> thread, but that cannot be guaranteed in general)
> 
> > We might suppose that many callbacks are called under drain and in
> > GLOBAL_STATE, which should be enough, but from our experimentation in
> > the previous series we saw that currently not everything is under drain,
> > leaving some operations unprotected (remember assert_graph_writable
> > temporarily disabled, since drain coverage for bdrv_replace_child_noperm
> > was not 100%?).
> > Therefore we need to add more drains. But isn't drain what we decided to
> > drop at the beginning? Why isn't drain good?
> 
> To sum up the patch ordering deadlock that we have right now:
> 
> * in some cases, graph manipulations are protected by the AioContext lock
> 
> * eliminating the AioContext lock is needed to move callbacks to coroutine
> contexts (see above for the deadlock scenario)
> 
> * moving callbacks to coroutine context is needed by the graph rwlock
> implementation
> 
> On one hand, we cannot protect the graph across manipulations with a graph
> rwlock without removing the AioContext lock; on the other hand, the
> AioContext lock is what _right now_ protects the graph.
> 
> So I'd rather go back to Emanuele's draining approach.  It may not be
> beautiful, but it allows progress.  Once that is in place, we can remove the
> AioContext lock (which mostly protects virtio-blk/virtio-scsi code right
> now) and reevaluate our next steps.

If we want to use drain for locking, we need to make sure that drain
actually does the job correctly. I see two major problems with it:

The first one is that drain only covers I/O paths, but we need to
protect against _anything_ touching block nodes. This might mean a
massive audit and making sure that everything in QEMU that could
possibly touch a block node is integrated with drain.

I think Emanuele has argued before that because writes to the graph only
happen in the main thread and we believe that currently only I/O
requests are processed in iothreads, this is safe and we don't actually
need to audit everything.

This is true as long as the assumption holds true (how do we ensure that
nobody ever introduces non-I/O code touching a block node in an
iothread?) and as long as the graph writer never yields or polls. I
think the latter condition is violated today, a random example is that
adjusting drain counts in bdrv_replace_child_noperm() does poll. Without
cooperation from all relevant places, the effectively locked code
section ends right there, even if the drained section continues. Even if
we can fix this, verifying that the conditions are met everywhere seems
not trivial.

And that's exactly my second major concern: Even if we manage to
correctly implement things with drain, I don't see a way to meaningfully
review it. I just don't know how to verify with some confidence that
it's actually correct and covering everything that needs to be covered.

Drain is not really a lock. But if you use it as one, the best it can
provide is advisory locking (callers, inside and outside the block
layer, need to explicitly support drain instead of having the lock
applied somewhere in the block layer functions). And even if all
relevant pieces actually make use of it, it still has an awkward
interface for locking:

/* Similar to rdlock(), but doesn't wait for writers to finish. It is
 * the callers responsibility to make sure that there are no writers. */
bdrv_inc_in_flight()

/* Similar to wrlock(). Waits for readers to finish. New readers are not
 * prevented from starting after it returns. Third parties are politely
 * asked not to touch the block node while it is drained. */
bdrv_drained_begin()

(I think the unlock counterparts actually behave as expected from a real
lock.)

Having an actual rdlock() (that waits for writers), and using static
analysis to verify that all relevant places use it (so that wrlock()
doesn't rely on politely asking third parties to leave the node alone)
gave me some confidence that we could verify the result.

I'm not sure at all how to achieve the same with the drain interface. In
theory, it's possible. But it complicates the conditions so much that
I'm pretty much sure that the review wouldn't only be very time
consuming, but I would make mistakes during the review, rendering it
useless.

Maybe throwing some more static analysis on the code can help, not sure.
It's going to be a bit more complex than with the other approach,
though.

Kevin


