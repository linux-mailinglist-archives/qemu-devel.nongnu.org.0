Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22983C4385
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 07:41:48 +0200 (CEST)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ohP-0005HU-Hm
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 01:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2oee-00034C-2y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:38:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2oec-0005Po-G6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:38:55 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 17so15366824pfz.4
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 22:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0UPJEWy7KCGGXec/MbDU7xIgvNTe5rdeqVh83pd+CE=;
 b=OonEL6kx7M32+6LkQPVYlI4Dr0wCuv+mMLz+8i5tHkCLt7C4cYPgIGTEAXNjB+0ZVV
 hlzVs9Y0SjcLBs/Gfw1XnEZS3sNqrH+Aul4dpiSdXdC1fB4WaoJc9vnnIY9lxmrhr0t9
 SZGrjVlM1SV2r5iwOemHV+BKmc/tQ6xVjWNTf8nVXs4Y440rpDnN7RIya5dBt9lpsxvd
 1xn4MbvMBH5OITXQDG08zBB/9c/VwtW/EiEBxKmG6pw9A74/CBLEoBhtu74gebZ9Y79h
 8tPH/6/XfsDK4SSaoJXYx44M+unXl14eVdcGFdKOFpk3N+aH9GjVoO7MrA6Yn3A3oJAV
 N74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0UPJEWy7KCGGXec/MbDU7xIgvNTe5rdeqVh83pd+CE=;
 b=G79w/2va4z/1mBka2cvc7w2R1jk1cITtuJD8k3tleAnvva/qaS2jd8XSd9E3o2/LSY
 PDcMfsL/inDryAmTSo5+ZWSVKaIV4HHyeO7oDXUmnkRdb7hfyc7h0VPi0P+8rKs6DQDd
 pt0M8KZcku8y0RSn49+MB5b1X9NmNmEmF/ZAhAvT3ddKrJV5oi/ophn6R+5Y/LBplZOs
 VKp+NDErgD4dG7piXMUAyBHjvlESffpS4gPwnEcoVKs8QNbLnxxFnXfiYgG9FIPf0Chf
 K1bwtewD0/zrCctoA5JSHVXw+WBLw6uKffq4px3lxA5y8g5j0W3M7MrcTqN8u/0oncmP
 p5QQ==
X-Gm-Message-State: AOAM533TztIOimGrA4Ce82ctRbySuQeYfJ1R3MaAZm579cI7jSDol5Oi
 0FOFctKlbJJJjzDIEbXT4zU5cA==
X-Google-Smtp-Source: ABdhPJxasV6kiUIyVZFtWef1Ef5fYTNPPqsdsy0eky4yZMJSnGPFB28iymNQNXgGBBSCqiHj5wlbmg==
X-Received: by 2002:a63:4746:: with SMTP id w6mr7793527pgk.442.1626068333358; 
 Sun, 11 Jul 2021 22:38:53 -0700 (PDT)
Received: from C02D383UML85.bytedance.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id 92sm20240766pjv.29.2021.07.11.22.38.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Jul 2021 22:38:52 -0700 (PDT)
From: Zhiyong Ye <yezhiyong@bytedance.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] block: Do not poll in bdrv_set_aio_context_ignore() when
 acquiring new_context
Date: Mon, 12 Jul 2021 13:38:31 +0800
Message-Id: <20210712053831.51722-2-yezhiyong@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210712053831.51722-1-yezhiyong@bytedance.com>
References: <20210712053831.51722-1-yezhiyong@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Zhiyong Ye <yezhiyong@bytedance.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bdrv_set_aio_context_ignore() is called in the main loop to change
the AioContext onto the IO thread, the bdrv_drain_invoke_entry() never
gets to run and the IO thread hangs at co_schedule_bh_cb().

This is because the AioContext is occupied by the main thread after
being attached to the IO thread, and the main thread poll in
bdrv_drained_end() waiting for the IO request to be drained, but the IO
thread cannot acquire the AioContext, which leads to deadlock.

Just like below:

<------>
[Switching to thread 1 (Thread 0x7fd810bbef40 (LWP 533312))]
(gdb) bt
...
3  0x00005601f6ea93aa in fdmon_poll_wait at ../util/fdmon-poll.c:80
4  0x00005601f6e81a1c in aio_poll at ../util/aio-posix.c:607
5  0x00005601f6dcde87 in bdrv_drained_end at ../block/io.c:496
6  0x00005601f6d798cd in bdrv_set_aio_context_ignore at ../block.c:6502
7  0x00005601f6d7996c in bdrv_set_aio_context_ignore at ../block.c:6472
8  0x00005601f6d79cb8 in bdrv_child_try_set_aio_context at ../block.c:6587
9  0x00005601f6da86f2 in blk_do_set_aio_context at ../block/block-backend.c:2026
10 0x00005601f6daa96d in blk_set_aio_context at ../block/block-backend.c:2047
11 0x00005601f6c71883 in virtio_scsi_hotplug at ../hw/scsi/virtio-scsi.c:831
...

[Switching to thread 4 (Thread 0x7fd8092e7700 (LWP 533315))]
(gdb) bt
...
4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
5  0x00005601f6e7ce88 in co_schedule_bh_cb at ../util/async.c:489
6  0x00005601f6e7c404 in aio_bh_poll at ../util/async.c:164
7  0x00005601f6e81a46 in aio_poll at ../util/aio-posix.c:659
8  0x00005601f6d5ccf3 in iothread_run at ../iothread.c:73
9  0x00005601f6eab512 in qemu_thread_start at ../util/qemu-thread-posix.c:521
10 0x00007fd80d7b84a4 in start_thread at pthread_create.c:456
11 0x00007fd80d4fad0f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:97
(gdb) f 4
4  0x00005601f6eab6a8 in qemu_mutex_lock_impl at ../util/qemu-thread-posix.c:79
(gdb) p *mutex
$2 = {lock = {__data = {__lock = 2, __count = 1, __owner = 533312, __nusers = 1,
      __kind = 1, __spins = 0, __elision = 0, __list = {__prev = 0x0, __next = 0x0}},
      __size = "\002\000\000\000\001\000\000\000@#\b\000\001\000\000\000\001",
      '\000' <repeats 22 times>, __align = 4294967298}, initialized = true}
<------>

Therefore, we should never poll anywhere in
bdrv_set_aio_context_ignore() when acquiring the new context. In fact,
commit e037c09c has also already elaborated on why we can't poll at
bdrv_do_drained_end().

Signed-off-by: Zhiyong Ye <yezhiyong@bytedance.com>
---
 block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index be083f389e..ebbea72d64 100644
--- a/block.c
+++ b/block.c
@@ -6846,6 +6846,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     GSList *parents_to_process = NULL;
     GSList *entry;
     BdrvChild *child, *parent;
+    int drained_end_counter = 0;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
 
@@ -6907,7 +6908,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
         aio_context_release(old_context);
     }
 
-    bdrv_drained_end(bs);
+    bdrv_drained_end_no_poll(bs, &drained_end_counter);
 
     if (qemu_get_aio_context() != old_context) {
         aio_context_acquire(old_context);
@@ -6915,6 +6916,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     if (qemu_get_aio_context() != new_context) {
         aio_context_release(new_context);
     }
+    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
 static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
-- 
2.11.0


