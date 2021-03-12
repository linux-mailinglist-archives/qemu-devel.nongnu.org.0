Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED833917B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:36:57 +0100 (CET)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjqT-0004cq-1N
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKje8-0001ys-09
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKje4-0006Yc-Mo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615562647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eHMl/f7d0cubsDNQhPfGpztaGnv7vKaQexeV0hnbgWQ=;
 b=IiBotR+QkgDVM7N+ePrgy0OswFoEXCwZmc/fy0QrvULMCmJx92eg+XWYOOogqhLUi0QjcX
 usIjPLc1KU6aaVxyKzRmgaoOvtVHZW/gwCXyd/KMNrSb47Dr2Oz7zlzoy5nxxbI9GblnLP
 iSjaQBpX0EhWSDJMbNY2z0q9e2B48Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-B1cRoCTtPVKIHO9ozWl4AQ-1; Fri, 12 Mar 2021 10:24:05 -0500
X-MC-Unique: B1cRoCTtPVKIHO9ozWl4AQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A35C107ACCD;
 Fri, 12 Mar 2021 15:24:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7FF05C1C5;
 Fri, 12 Mar 2021 15:24:01 +0000 (UTC)
Date: Fri, 12 Mar 2021 16:24:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
Message-ID: <YEuHkB4Uz0lAiSqm@merkur.fritz.box>
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210225115205.249923-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 12:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all! It occurs that nothing prevents discarding and reallocating host
> cluster during data writing. This way data writing will pollute another
> newly allocated cluster of data or metadata.
> 
> OK, v2 is a try to solve the problem with CoRwlock.. And it is marked
> RFC, because of a lot of iotest failures.. Some of problems with v2:
> 
> 1. It's a more complicated to make a test, as everything is blocking
> and I can't just break write and do discard.. I have to implement
> aio_discard in qemu-io and rewrite test into several portions of io
> commands splitted by "sleep 1".. OK, it's not a big problem, and I've
> solved it.

Right, this just demonstrates that it's doing what it's supposed to.

> 2. iotest 7 fails with several leaked clusters. Seems, that it depend on
> the fact that discard may be done in parallel with writes. Iotest 7 does
> snapshots, so I think l1 table is updated to the moment when discard is
> finally unlocked.. But I didn't dig into it, it's all my assumptions.

This one looks a bit odd, but it may be related to the bug in your code
that you forgot that qcow2_cluster_discard() is not a coroutine_fn.
Later tests fail during the unlock:

qemu-img: ../util/qemu-coroutine-lock.c:358: qemu_co_rwlock_unlock: Assertion `qemu_in_coroutine()' failed.

#0  0x00007ff33f7d89d5 in raise () from /lib64/libc.so.6
#1  0x00007ff33f7c18a4 in abort () from /lib64/libc.so.6
#2  0x00007ff33f7c1789 in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007ff33f7d1026 in __assert_fail () from /lib64/libc.so.6
#4  0x0000556f4ffd3c94 in qemu_co_rwlock_unlock (lock=0x556f51f63ca0) at ../util/qemu-coroutine-lock.c:358
#5  0x0000556f4fef5e09 in qcow2_cluster_discard (bs=0x556f51f56a80, offset=37748736, bytes=0, type=QCOW2_DISCARD_NEVER, full_discard=false) at ../block/qcow2-cluster.c:1970
#6  0x0000556f4ff46c23 in qcow2_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/qcow2-snapshot.c:736
#7  0x0000556f4ff0d7b6 in bdrv_snapshot_create (bs=0x556f51f56a80, sn_info=0x7fff89fb9a30) at ../block/snapshot.c:227
#8  0x0000556f4fe85526 in img_snapshot (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:3337
#9  0x0000556f4fe8a227 in main (argc=4, argv=0x7fff89fb9d30) at ../qemu-img.c:5375

> 3. iotest 13 (and I think a lot more iotests) crashes on
> assert(!to->locks_held); .. So with this assertion we can't keep rwlock
> locked during data writing...
> 
>   #3  in __assert_fail () from /lib64/libc.so.6
>   #4  in qemu_aio_coroutine_enter (ctx=0x55762120b700, co=0x55762121d700)
>       at ../util/qemu-coroutine.c:158
>   #5  in aio_co_enter (ctx=0x55762120b700, co=0x55762121d700) at ../util/async.c:628
>   #6  in aio_co_wake (co=0x55762121d700) at ../util/async.c:612
>   #7  in thread_pool_co_cb (opaque=0x7f17950daab0, ret=0) at ../util/thread-pool.c:279
>   #8  in thread_pool_completion_bh (opaque=0x5576211e5070) at ../util/thread-pool.c:188
>   #9  in aio_bh_call (bh=0x557621205df0) at ../util/async.c:136
>   #10 in aio_bh_poll (ctx=0x55762120b700) at ../util/async.c:164
>   #11 in aio_poll (ctx=0x55762120b700, blocking=true) at ../util/aio-posix.c:659
>   #12 in blk_prw (blk=0x557621205790, offset=4303351808, 
>       buf=0x55762123e000 '\364' <repeats 199 times>, <incomplete sequence \364>..., bytes=12288, 
>       co_entry=0x557620d9dc97 <blk_write_entry>, flags=0) at ../block/block-backend.c:1335
>   #13 in blk_pwrite (blk=0x557621205790, offset=4303351808, buf=0x55762123e000, 
>       count=12288, flags=0) at ../block/block-backend.c:1501

This is another bug in your code: A taken lock belongs to its coroutine.
You can't lock in one coroutine and unlock in another.

The changes you made to the write code seem unnecessarily complicated
anyway: Why not just qemu_co_rwlock_rdlock() right at the start of
qcow2_co_pwritev_part() and unlock at its end, without taking and
dropping the lock repeatedly? It makes both the locking more obviously
correct and also fixes the bug (013 passes with this change).

> So now I think that v1 is simpler.. It's more complicated (but not too
> much) in code. But it keeps discards and data writes non-blocking each
> other and avoids yields in critical sections.

I think an approach with additional data structures is almost certainly
more complex and harder to maintain (and as the review from Max showed,
also to understand). I wouldn't give up yet on the CoRwlock based
approach, it's almost trivial code in comparison.

True, making qcow2_cluster_discard() a coroutine_fn requires a
preparational patch that is less trivial, but at least this can be seen
as something that we would want to do sooner or later anyway.

Kevin


