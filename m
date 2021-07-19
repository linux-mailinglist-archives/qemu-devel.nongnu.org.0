Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7153CD1D8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:27:24 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QUd-0005V8-MW
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5QSP-0004dK-Sz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5QSK-0005dz-Fg
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jU158tnTEkOcJ0oVjbOyCWy6NGEy/P/0mB1+SkVfzY=;
 b=bj5x7f6l3Z+M7+5/Xfh0y96z1C87ZIxBAoyAYjXdUUGk7hBaEBqUyY7TN+3vaYYnxQjnao
 q3HY6OJtOiHjgymwGe2AR+Js6cr3fI1T8dObTJ6AD9lh9V7PtNbkbUvIqzKpu0gIq8ZuZK
 ZvSiPgH+nPpcFyc1/4QW1eakgNePfFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Yi_BjTG4N3m1ZrkqiCmQ5w-1; Mon, 19 Jul 2021 06:24:57 -0400
X-MC-Unique: Yi_BjTG4N3m1ZrkqiCmQ5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A10D804140;
 Mon, 19 Jul 2021 10:24:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 642205C22A;
 Mon, 19 Jul 2021 10:24:55 +0000 (UTC)
Date: Mon, 19 Jul 2021 12:24:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Subject: Re: [PATCH 1/1] block: Do not poll in bdrv_set_aio_context_ignore()
 when acquiring new_context
Message-ID: <YPVS9ZnMFXEJ6c9H@redhat.com>
References: <20210712053831.51722-1-yezhiyong@bytedance.com>
 <20210712053831.51722-2-yezhiyong@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210712053831.51722-2-yezhiyong@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.07.2021 um 07:38 hat Zhiyong Ye geschrieben:
> When bdrv_set_aio_context_ignore() is called in the main loop to change
> the AioContext onto the IO thread, the bdrv_drain_invoke_entry() never
> gets to run and the IO thread hangs at co_schedule_bh_cb().
> 
> This is because the AioContext is occupied by the main thread after
> being attached to the IO thread, and the main thread poll in
> bdrv_drained_end() waiting for the IO request to be drained, but the IO
> thread cannot acquire the AioContext, which leads to deadlock.

This shouldn't be the case:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

Then bdrv_set_aio_context_ignore() switches the AioContext of bs, and
then calls bdrv_drained_end() while holding only the lock for the new
context. AIO_WAIT_WHILE() will temporarily drop that lock, so aio_poll()
should run without holding any AioContext locks.

If I'm not missing anything, the scenario you're seeing means that the
caller already held a lock for the new AioContext, so that it's locked
twice while AIO_WAIT_WHILE() drops the lock only once. This would be a
bug in the caller because the documentation I quoted explicitly forbids
holding the AioContext lock for the new context.

> Just like below:
> 
> <------>
> [Switching to thread 1 (Thread 0x7fd810bbef40 (LWP 533312))]
> (gdb) bt
> ...
> 3  0x00005601f6ea93aa in fdmon_poll_wait at ../util/fdmon-poll.c:80
> 4  0x00005601f6e81a1c in aio_poll at ../util/aio-posix.c:607
> 5  0x00005601f6dcde87 in bdrv_drained_end at ../block/io.c:496
> 6  0x00005601f6d798cd in bdrv_set_aio_context_ignore at ../block.c:6502
> 7  0x00005601f6d7996c in bdrv_set_aio_context_ignore at ../block.c:6472
> 8  0x00005601f6d79cb8 in bdrv_child_try_set_aio_context at ../block.c:6587
> 9  0x00005601f6da86f2 in blk_do_set_aio_context at ../block/block-backend.c:2026
> 10 0x00005601f6daa96d in blk_set_aio_context at ../block/block-backend.c:2047
> 11 0x00005601f6c71883 in virtio_scsi_hotplug at ../hw/scsi/virtio-scsi.c:831

Which version of QEMU are you using? In current git master, line 831 is
something entirely different.

Are you using something before commit c7040ff6? Because this is a commit
that fixed a virtio-scsi bug where it would hold the wrong lock before
calling blk_set_aio_context().

> 
> [Switching to thread 4 (Thread 0x7fd8092e7700 (LWP 533315))]
> (gdb) bt
> ...
> 4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
> 5  0x00005601f6e7ce88 in co_schedule_bh_cb at ../util/async.c:489
> 6  0x00005601f6e7c404 in aio_bh_poll at ../util/async.c:164
> 7  0x00005601f6e81a46 in aio_poll at ../util/aio-posix.c:659
> 8  0x00005601f6d5ccf3 in iothread_run at ../iothread.c:73
> 9  0x00005601f6eab512 in qemu_thread_start at ../util/qemu-thread-posix.c:521
> 10 0x00007fd80d7b84a4 in start_thread at pthread_create.c:456
> 11 0x00007fd80d4fad0f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:97
> (gdb) f 4
> 4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
> (gdb) p *mutex
> $2 = {lock = {__data = {__lock = 2, __count = 1, __owner = 533312, __nusers = 1,
>       __kind = 1, __spins = 0, __elision = 0, __list = {__prev = 0x0, __next = 0x0}},
>       __size = "\002\000\000\000\001\000\000\000@#\b\000\001\000\000\000\001",
>       '\000' <repeats 22 times>, __align = 4294967298}, initialized = true}
> <------>
> 
> Therefore, we should never poll anywhere in
> bdrv_set_aio_context_ignore() when acquiring the new context. In fact,
> commit e037c09c has also already elaborated on why we can't poll at
> bdrv_do_drained_end().
> 
> Signed-off-by: Zhiyong Ye <yezhiyong@bytedance.com>
> ---
>  block.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index be083f389e..ebbea72d64 100644
> --- a/block.c
> +++ b/block.c
> @@ -6846,6 +6846,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>      GSList *parents_to_process = NULL;
>      GSList *entry;
>      BdrvChild *child, *parent;
> +    int drained_end_counter = 0;
>  
>      g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>  
> @@ -6907,7 +6908,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>          aio_context_release(old_context);
>      }
>  
> -    bdrv_drained_end(bs);
> +    bdrv_drained_end_no_poll(bs, &drained_end_counter);
>  
>      if (qemu_get_aio_context() != old_context) {
>          aio_context_acquire(old_context);
> @@ -6915,6 +6916,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>      if (qemu_get_aio_context() != new_context) {
>          aio_context_release(new_context);
>      }
> +    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);

This would be wrong because bs is already in the new context, but you
wouldn't hold the lock for it. AIO_WAIT_WHILE() would try to drop the
lock for a context that isn't even locked, resulting in a crash.

>  }
>  
>  static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,

Kevin


