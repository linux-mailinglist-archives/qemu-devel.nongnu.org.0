Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B94B4FCB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:13:40 +0100 (CET)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaEd-00017B-PO
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJa6E-0000Sg-B8
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJa6A-0006WO-N2
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644840282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RGY7xOM77hLNjQ0SrJw0p7sPspRAoR6c5q6RYc3SgTs=;
 b=BHAU/am0uJPi3w7CnHmDbhurWBhAksYDHuAlDMjxqSy1Bj8gxEDNFknym8tlyEChdEtQEs
 AtWopfcLKRPh82Ot2knE/0APoVL20o5m9FTu+ZLaQjYxFrthMppxCITld1DDD7ALs4s21o
 uQcb029Z+DUckA9IUsG1wgpa89gxqQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-enBHkFNZMmmsJtQz80LvuQ-1; Mon, 14 Feb 2022 07:04:39 -0500
X-MC-Unique: enBHkFNZMmmsJtQz80LvuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6221853026;
 Mon, 14 Feb 2022 12:04:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 100E37B9D6;
 Mon, 14 Feb 2022 12:03:57 +0000 (UTC)
Date: Mon, 14 Feb 2022 13:03:55 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
Message-ID: <YgpFK/315s9bHC8Z@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com>
 <YgZOdni4B7/mIQQ6@redhat.com>
 <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.02.2022 um 11:27 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> On 11/02/2022 12:54, Kevin Wolf wrote:
> > Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
> >> Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_begin()
> >> is not a good idea: the callback might be called when running
> >> a drain in a coroutine, and bdrv_drained_begin_poll() does not
> >> handle that case, resulting in assertion failure.
> > 
> > I remembered that we talked about this only recently on IRC, but it
> > didn't make any sense to me again when I read this commit message. So I
> > think we need --verbose.
> > 
> > The .drained_begin callback was always meant to run outside of coroutine
> > context, so the unexpected part isn't that it calls a function that
> > can't run in coroutine context, but that it is already called itself in
> > coroutine context.
> > 
> > The problematic path is bdrv_replace_child_noperm() which then calls
> > bdrv_parent_drained_begin_single(poll=true). Polling in coroutine
> > context is dangerous, it can cause deadlocks because the caller of the
> > coroutine can't make progress. So I believe this call is already wrong
> > in coroutine context.
> 
> Ok, you added this assertion in dcf94a23, but at that time there was no
> bdrv_parent_drained_begin_single, and the polling was only done in
> bdrv_do_drained_begin. So I think that to keep the same logic, the
> assertion should be moved in bdrv_parent_drained_begin_single()? And
> even more specifically, only if the poll flag is true.

I wouldn't necessarily say move, but copying it there makes sense to me.
In order to keep the interface constraints simple, I would assert it
independent of the poll parameter.

> I triggered this by adding additional drains in the callers of
> bdrv_replace_child_noperm(), and I think some test (probably unit test)
> was failing because of either the drained_begin callback itself called
> by the drain, or as you suggested the callbacks called by
> bdrv_parent_drained_begin_single from bdrv_replace_child_noperm.
> 
> Anyways, I think that in addition to the fix in this patch, we should
> also fix bdrv_parent_drained_begin_single(poll=true) in
> bdrv_replace_child_noperm, with something similar to what is done in
> bdrv_co_yield_to_drain? ie if we are in coroutine, schedule a BH that
> runs the same logic but in the main loop, but then somehow wait that it
> finishes before continuing?
> Even though at that point we would have a coroutine waiting for the main
> loop, which I don't think it's something we want.

Coroutines are waiting for the main loop all the time, why would this be
a problem?

Yes, I think a mechanism similar to bdrv_co_yield_to_drain() is needed
if we want to allow callers to be in coroutine context.

And once we have this mechanism, it's actually not in addition to this
patch, but instead of it, because this patch isn't needed any more when
we know that we can't be in coroutine context.

> Alternatively, we would forbid polling in coroutines at all. And the
> only place I can see that is using the drain in coroutine is mirror
> (see below).

Well, my point is that it is already forbidden because it can deadlock.
Code that polls in coroutine context anyway is probably buggy, unless it
can guarantee very specific circumstances that make a deadlock
impossible.

Maybe we can actually assert this in AIO_WAIT_WHILE().

> Additional question: I also noticed that there is a bdrv_drained_begin()
> call in mirror.c in the JobDriver run() callback. How can this even
> work? If a parent uses bdrv_child_cb_drained_begin (which should not be
> so rare) it will crash because of the assertion.

bdrv_co_yield_to_drain() lets this code run in the main loop.

> Further additional question: actually I don't understand also the
> polling logic of mirror (mirror_drained_poll), as if we are draining in
> the coroutine with in_drain = true I think we can have a deadlock if
> in_flight>0?

You mean for a drain issued by the mirror job itself? The in-flight
requests are still processed by the polling loop, so eventually
in_flight should become 0.

Kevin


