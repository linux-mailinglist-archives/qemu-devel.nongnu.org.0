Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF0319F70
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:06:43 +0100 (CET)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAY9h-0007Wu-Oc
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAY7D-0006g5-3S
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAY79-0001Dc-13
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613135042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZv6ZEyvMiKz2OMJryZtqqGrVRB8h9d6nvSHg0INd9I=;
 b=cpV0nol4ejXghGnXb659n4gBh5we6E2dXPIk6wD1Hm2EUgAjmbwA82QnOwwLm3pEvFo9Hu
 vdkKsQwpUp4s6aAQqBemymO0kiU0qtOoL2NAJ9lOgKnFaFKBEfFUwhD65lntIrSW1MnjQ/
 RP86/sD5qGHS++0ekf8VlnZDTgQZr1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-6eH8qrp7Oy-cpvntbPP7xA-1; Fri, 12 Feb 2021 08:04:00 -0500
X-MC-Unique: 6eH8qrp7Oy-cpvntbPP7xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A65CFC73A1;
 Fri, 12 Feb 2021 13:03:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 798CA1A262;
 Fri, 12 Feb 2021 13:03:56 +0000 (UTC)
Date: Fri, 12 Feb 2021 14:03:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] blockjob: Fix crash with IOthread when block commit
 after snapshot
Message-ID: <20210212130354.GH6221@merkur.fritz.box>
References: <20210203024059.52683-1-08005325@163.com>
 <4a1d2a61-0c6c-7d44-092b-26a05798e54a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <4a1d2a61-0c6c-7d44-092b-26a05798e54a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, Michael Qiu <qiudayu@huayun.com>,
 qemu-devel@nongnu.org, quweijie@huayun.com, liangpeng10@huawei.com,
 mreitz@redhat.com, jsnow@redhat.com, 08005325@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.02.2021 um 08:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> subject should start with [PATCH v5]
> 
> 03.02.2021 05:40, 08005325@163.com wrote:
> > From: Michael Qiu <qiudayu@huayun.com>
> > 
> > v5: reformat the commit log with backtrace of main thread
> >      Add a boolean variable to make main thread could re-acquire
> >      aio_context on success path.
> > 
> > v4: rebase to latest code
> > 
> > v3: reformat the commit log, remove duplicate content
> 
> patch history shouldn't go into commit message. So you should place it
> under '---' [*], after calling git format-patch
> 
> > 
> > Currently, if guest has workloads, IO thread will acquire aio_context
> > lock before do io_submit, it leads to segmentfault when do block commit
> > after snapshot. Just like below:
> > 
> > Program received signal SIGSEGV, Segmentation fault.
> > 
> > [Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
> > 0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> > 1437    ../block/mirror.c: No such file or directory.
> > (gdb) p s->job
> > $17 = (MirrorBlockJob *) 0x0
> > (gdb) p s->stop
> > $18 = false
> > 
> > Call trace of IO thread:
> > 0  0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
> > 1  0x00005576d0f7f3ab in bdrv_driver_pwritev at ../block/io.c:1174
> > 2  0x00005576d0f8139d in bdrv_aligned_pwritev at ../block/io.c:1988
> > 3  0x00005576d0f81b65 in bdrv_co_pwritev_part at ../block/io.c:2156
> > 4  0x00005576d0f8e6b7 in blk_do_pwritev_part at ../block/block-backend.c:1260
> > 5  0x00005576d0f8e84d in blk_aio_write_entry at ../block/block-backend.c:1476
> > ...
> > 
> > Switch to qemu main thread:
> > 0  0x00007f903be704ed in __lll_lock_wait at
> > /lib/../lib64/libpthread.so.0
> > 1  0x00007f903be6bde6 in _L_lock_941 at /lib/../lib64/libpthread.so.0
> > 2  0x00007f903be6bcdf in pthread_mutex_lock at
> > /lib/../lib64/libpthread.so.0
> > 3  0x0000564b21456889 in qemu_mutex_lock_impl at
> > ../util/qemu-thread-posix.c:79
> > 4  0x0000564b213af8a5 in block_job_add_bdrv at ../blockjob.c:224
> > 5  0x0000564b213b00ad in block_job_create at ../blockjob.c:440
> > 6  0x0000564b21357c0a in mirror_start_job at ../block/mirror.c:1622
> > 7  0x0000564b2135a9af in commit_active_start at ../block/mirror.c:1867
> > 8  0x0000564b2133d132 in qmp_block_commit at ../blockdev.c:2768
> > 9  0x0000564b2141fef3 in qmp_marshal_block_commit at
> > qapi/qapi-commands-block-core.c:346
> > 10 0x0000564b214503c9 in do_qmp_dispatch_bh at
> > ../qapi/qmp-dispatch.c:110
> > 11 0x0000564b21451996 in aio_bh_poll at ../util/async.c:164
> > 12 0x0000564b2146018e in aio_dispatch at ../util/aio-posix.c:381
> > 13 0x0000564b2145187e in aio_ctx_dispatch at ../util/async.c:306
> > 14 0x00007f9040239049 in g_main_context_dispatch at
> > /lib/../lib64/libglib-2.0.so.0
> > 15 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:232
> > 16 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:255
> > 17 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:531
> > 18 0x0000564b212304e1 in qemu_main_loop at ../softmmu/runstate.c:721
> > 19 0x0000564b20f7975e in main at ../softmmu/main.c:50
> > 
> > In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
> > is false, this means the MirrorBDSOpaque "s" object has not been initialized
> > yet, and this object is initialized by block_job_create(), but the initialize
> > process is stuck in acquiring the lock.
> > 
> > In this situation, IO thread come to bdrv_mirror_top_pwritev(),which means that
> > mirror-top node is already inserted into block graph, but its bs->opaque->job
> > is not initialized.
> > 
> > The root cause is that qemu main thread do release/acquire when hold the lock,
> > at the same time, IO thread get the lock after release stage, and the crash
> > occured.
> > 
> > Actually, in this situation, job->job.aio_context will not equal to
> > qemu_get_aio_context(), and will be the same as bs->aio_context,
> > thus, no need to release the lock, becasue bdrv_root_attach_child()
> > will not change the context.
> > 
> > This patch fix this issue.
> > 
> > Fixes: 132ada80 "block: Adjust AioContexts when attaching nodes"
> > 
> > Signed-off-by: Michael Qiu <qiudayu@huayun.com>
> 
> I feel like there may be more problems (like the fact that drained
> section should be expanded, and that expanding doesn't help as Michael
> said), but I think that temporary releasing locks is unsafe thing, and
> if we can avoid it for some cases it's good, especially if it fixes
> some bug:

Yeah, I don't like this patch much because it doesn't really fix the
bug, but it just restricts it to fewer cases. Whenever we add a node to
the job that is in a different AioContext than the job itself, we can
still run into similar problems.

Maybe we should actually make this an error case so that we never
release the lock.

In practice, I think all block jobs call block_job_create() with their
filter node, so the job will always be in the same AioContext and at
least things relating to new requests should never run into this case.

I also don't understand why draining doesn't work. This sounds a bit
concerning and probably deserved some more investigation.

Anyway, if all that remains is theoretical cases, I guess applying this
band-aid fix is better than not doing anything, so I'll apply it.

Kevin


