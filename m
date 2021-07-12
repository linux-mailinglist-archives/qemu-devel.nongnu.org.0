Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C23C437E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 07:33:05 +0200 (CEST)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2oYx-0005Ig-VW
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 01:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2mrK-0007SW-1p
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 23:43:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1m2mrF-0001xe-Nv
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 23:43:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id n11so9345367pjo.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 20:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0UPJEWy7KCGGXec/MbDU7xIgvNTe5rdeqVh83pd+CE=;
 b=PjdORWwzZdzQhmSlUDQD5r3fz6OhmIR2hf1qi1pb+8HdKhv9Jv9/ipA/8Ba5a8uvJD
 xkEddua3D98JyMH1LIdVEVmzPzRzdL8szHl6RUp/kvaboJCqa77MbrnPuNmYWtua0hyy
 1S+cloV6i3AwoT+3N9ayeRUOVFifbZ59qbZTrXXczrIRagPBycuAkbQQj6Ka/t1rUmPA
 1dAMiSNoTM6DmfohJudAflbAq7S+SHGdSmcYOKPkNr2MXkFALzPATEAT7cxO5x4PSOcL
 boVnb/i3R+lBnzRQloBvaV2i1Atvc9VPpFSsql/1p/0UIoZE41E4YaFNhFyObi5feosu
 3Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0UPJEWy7KCGGXec/MbDU7xIgvNTe5rdeqVh83pd+CE=;
 b=fjYsEgFF0NjcHjTkD09EjxruJqcH/mstXOO1bzWTJzDX4vYUMeBr0SIeRli1BqDIZj
 TstSpcR+oZ1v8xosOz1VGCzkn/cNNJtI0RJUyOsxSYLtJcdeSiz6NaQieWc7079zmbG3
 35nFZ+XfRGT0oAfmmbBaEavjUJuzq+UybZFapErRw24gF8flzpqHUu/+3lRrI6B0zYp/
 yP6OpgZYkgN2IrZx2aGzcDnkzocvEEQ6RV3InEB4Tpnn6M5Hsk14k2urbVyEpMIziPDI
 Mx8iBaYjWVXmrZOPSSws69MqPE+DnpmVVbtcjwW5my/ScL8oY3mpZFE9CSkEtXkg6poF
 11GA==
X-Gm-Message-State: AOAM532Eyq8zk055lObGiZaK/hq5H5EAkSb7b4p7OwZpCDLOk/T8JPCM
 yDJKYLH1vetdDTGpanP/9UAqfA==
X-Google-Smtp-Source: ABdhPJz81japP30wHYLBpSohMXDd6lG1oi9O/BLGQxqrkHCyqrFg2rlbn1f6bfHkSWRXTPpo0Adp9w==
X-Received: by 2002:a17:90a:420c:: with SMTP id
 o12mr50479386pjg.101.1626061427110; 
 Sun, 11 Jul 2021 20:43:47 -0700 (PDT)
Received: from C02D383UML85.bytedance.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id w9sm10085345pfu.112.2021.07.11.20.43.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Jul 2021 20:43:46 -0700 (PDT)
From: Zhiyong Ye <yezhiyong@bytedance.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: Do not poll in bdrv_set_aio_context_ignore() when
 acquiring new_context
Date: Mon, 12 Jul 2021 11:43:03 +0800
Message-Id: <20210712034303.49531-1-yezhiyong@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Jul 2021 01:30:51 -0400
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
Cc: kwolf@redhat.com, Zhiyong Ye <yezhiyong@bytedance.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com
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


