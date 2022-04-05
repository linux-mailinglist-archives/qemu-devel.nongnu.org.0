Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD964F2B98
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:11:44 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbh67-0003VC-RW
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbgq8-0001sh-SO
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbgq6-00017P-JN
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649156109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0oXRtwqzqUt9aD+//tMcoYO6LctjxxFL79LBYu86swM=;
 b=LrxHl7/CFwqtsnbdbGY34441SW9rGmmtyOqKxWZxSkD/yeOFFS/SGTxhEuV17GfnTe8aNo
 EmRya3QzaMUYfhyAWqqSxDa6MqCHRdelygk20Fr42v8ssQeetgiFwXGXL5gsZLYus7LIcr
 OzfBoylRn5iX9R1sZqTzUYPgVM5fNU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-GO-U-AsEOzuSovkxu_yT5w-1; Tue, 05 Apr 2022 06:55:05 -0400
X-MC-Unique: GO-U-AsEOzuSovkxu_yT5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76CC2811E9B;
 Tue,  5 Apr 2022 10:55:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C02E540D1B9B;
 Tue,  5 Apr 2022 10:55:03 +0000 (UTC)
Date: Tue, 5 Apr 2022 12:55:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <YkwgBgc3rHP/hcuN@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
 <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
 <160b0358-b96b-c1ff-e08f-7488366a1755@mail.ru>
 <dd644d13-720f-c720-83bc-bab291b45d7b@redhat.com>
 <6694cad1-058b-d1bf-3f6c-61879799fa22@mail.ru>
 <b1bbf8a5-5d21-64c4-2ecd-f9f7a33d810b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1bbf8a5-5d21-64c4-2ecd-f9f7a33d810b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.03.2022 um 11:58 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 30/03/2022 um 11:52 schrieb Vladimir Sementsov-Ogievskiy:
> > 30.03.2022 12:09, Emanuele Giuseppe Esposito wrote:
> >>>
> >>> Ah seems I understand what you mean.
> >>>
> >>> One of my arguments is that "drain" - is not a lock against other
> >>> clients who want to modify the graph. Because, drained section allows
> >>> nested drained sections.
> >>>
> >>> And you try to solve it, by draining more things, this way, we'll drain
> >>> also the job, which is a possible client, who may want to modify the
> >>> graph in parallel.
> >>>
> >>> So, in other words, when we want to modify the graph, we drain the whole
> >>> connectivity component of the graph. And we think that we are safe from
> >>> other graph modifications because all related jobs are drained.
> >>> Interesting, is that possible that some not drained job from another
> >>> connectivity component will want to connect some node from our drained
> >>> component?
> >>
> >> You mean another job or whathever calling bdrv_find_node() on a random
> >> graph? Yes that is not protected. But can this happen?
> >>
> >> That's the question. What are the invariants here? Can anything happen?
> >>
> >>>
> >>> I just still feel that draining is a wrong mechanism to avoid
> >>> interaction with other clients who want to modify the graph, because:
> >>>
> >>> 1. we stop the whole IO on all subgraph which is not necessary
> >>> 2. draining is not a mutex, it allows nesting and it's ok when two
> >>> different clients drain same nodes. Draining is just a requirement to do
> >>> no IO at these nodes.
> >>>
> >>> And in your way, it seems that to be absolutely safe we'll need to drain
> >>> everything..
> >>>
> >>> In my feeling it's better to keep draining what it is now: requirement
> >>> to have no IO requests. And to isolate graph modifications from each
> >>> other make a new synchronization mechanism, something like a global
> >>> queue, where clients who want to get an access to graph modifications
> >>> wait for their turn.
> >>
> >> This is a matter of definitions. Subtree drains can theoretically work,
> >> I managed to answer to my own doubts in the last email I sent.
> >>
> >> Yes, there is still some completely random case like the one I wrote
> >> above, but I think it is more a matter of what we want to use and what
> >> meaning we want to give to drains.
> >>
> >> Global queue is what Kevin proposes, I will try to implement it.
> >>
> >>>
> >>>
> >>> As I understand:
> >>>
> >>> You want to make drained section to be a kind of lock, so that if we
> >>> take this lock, we can modify the graph and we are sure that no other
> >>> client will modify it in parallel.
> >>
> >> Yes
> >>
> >>>
> >>> But drained sections can be nested. So to solve the problem you try to
> >>> drain more nodes: include subtree for example, or may be we need to
> >>> drain the whole graph connectivity component, or (to be more safe) the
> >>> whole block layer (to be sure that during drained section in one
> >>> connectivity component some not-drained block-job from another
> >>> connectivity component will not try to attach some node from our drained
> >>> connectivity component)..
> >>>
> >>> I still feel that draining is wrong tool for isolating graph modifying
> >>> operations from each other:
> >>>
> >>> 1. Drained sections can be nested, and natively that's not a kind of
> >>> lock. That's just a requirement to have no IO requests. There may be
> >>> several clients that want this condition on same set of nodes.
> >>>
> >>> 2. Blocking IO on the whole connected subgraph or even on the whole
> >>> block layer graph is not necessary, so that's an extra blocking.
> >>>
> >>>
> >>> Could we instead do the following:
> >>>
> >>> 1. Keep draining as is - a mechanism to stop IO on some nodes
> >>>
> >>> 2. To isolate graph-modifying operations implement another mechanism:
> >>> something like a global queue, where clients wait until they gen an
> >>> access to modify block layer.
> >>>
> >>>
> >>> This way, any graph modifying process would look like this:
> >>>
> >>> 1. drained_begin(only where necessary, not the whole subgraph in
> >>> general)
> >>>
> >>> 2. wait in the global queue
> >>>
> >>> 3. Ok, now we can do all the modifications
> >>>
> >>> 4. Kick the global queue, so that next client will get an access
> >>>
> >>> 5. drained_end()
> >>>
> >>>
> >>
> >> Please give a look at what Kevin (described by me) proposed. I think
> >> it's the same as you are suggesting. I am pasting it below.
> >> I will try to implement this and see if it is doable or not.
> >>
> >> I think the advantage of drains is that it isn't so complicated and
> >> doesn't add any complication to the existing code.
> >> But we'll see how it goes with this global queue.
> >>
> >>> His idea is to replicate what blk_wait_while_drained() currently does
> >>> but on a larger scale. It is something in between this subtree_drains
> >>> logic and a rwlock.
> >>>
> >>> Basically if I understood correctly, we could implement
> >>> bdrv_wait_while_drained(), and put in all places where we would put a
> >>> read lock: all the reads to ->parents and ->children.
> >>> This function detects if the bdrv is under drain, and if so it will stop
> >>> and wait that the drain finishes (ie the graph modification).
> >>> On the other side, each write would just need to drain probably both
> >>> nodes (simple drain), to signal that we are modifying the graph. Once
> >>> bdrv_drained_begin() finishes, we are sure all coroutines are stopped.
> >>> Once bdrv_drained_end() finishes, we automatically let all coroutine
> >>> restart, and continue where they left off.
> >>>
> >>> Seems a good compromise between drains and rwlock. What do you think?
> >>>
> >>> I am not sure how painful it will be to implement though.
> >>
> > 
> > Hm, I don't see, where is global queue here? Or
> > bdrv_wait_while_drained() is global and has no bs arguement?
> > 
> > 
> 
> From what I understand, blk_wait_while_drained has a queue internally.
> Yes, the queue would be global, and all coroutines that want to perform
> a read will have to wait until the modification is ended.
> 
> Whether to wake the queue up with a drain or a write lock is also
> another point worth discussion maybe.

I think I intended it to be per-BDS (just like blk_wait_while_drained()
uses a per-BB queue). Obviously, you can always replace a finer grained
lock with a coarse one without losing correctness. I'm not sure if that
simplifies things enough to justify using a single global lock (which
would be a step backwards even from AioContext locks). On the other
hand, graph modifications are rare, so maybe it's not too bad.

Kevin


