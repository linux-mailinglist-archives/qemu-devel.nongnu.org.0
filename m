Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E054AE77
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:37:42 +0200 (CEST)
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13vZ-0005O4-Lj
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13ny-0001LJ-2q; Tue, 14 Jun 2022 06:29:50 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:57648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nh-0000ke-He; Tue, 14 Jun 2022 06:29:49 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 868D52E0D43;
 Tue, 14 Jun 2022 13:29:24 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AcoUs8LFkf-TOJ4lu3p; Tue, 14 Jun 2022 13:29:24 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202564; bh=BNgD/KiMpl4g2nP+eF8gjfR8XFJvAFN8LW/9MVbgWXM=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=Z/VY6LZ0gzYigqMuz8Wao8ijg/aSHLF0a4Z2KCBJX3/qZsHabrEDTn7AtUvuP9+JG
 QwyV59viEoZobyDqGjV0gW5JpQvTod+F10ayGAEcl/nh75gMmX7qvSAF7NI1Z7VUGX
 ZiXV6IngnqeVwiB/hQ0ZOwbcHej9xZHzLXZsV0Vc=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TNMm7BW2; Tue, 14 Jun 2022 13:29:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 05/10] block/block-copy: block_copy(): add timeout_ns parameter
Date: Tue, 14 Jun 2022 13:29:05 +0300
Message-Id: <20220614102910.1431380-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Add possibility to limit block_copy() call in time. To be used in the
next commit.

As timed-out block_copy() call will continue in background anyway (we
can't immediately cancel IO operation), it's important also give user a
possibility to pass a callback, to do some additional actions on
block-copy call finish.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/block-copy.c         | 33 ++++++++++++++++++++++++++-------
 block/copy-before-write.c  |  2 +-
 include/block/block-copy.h |  4 +++-
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ec46775ea5..bb947afdda 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -883,23 +883,42 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     return ret;
 }
 
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
+{
+    block_copy_common(opaque);
+}
+
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit)
+                            bool ignore_ratelimit, uint64_t timeout_ns,
+                            BlockCopyAsyncCallbackFunc cb,
+                            void *cb_opaque)
 {
-    BlockCopyCallState call_state = {
+    int ret;
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
         .s = s,
         .offset = start,
         .bytes = bytes,
         .ignore_ratelimit = ignore_ratelimit,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
+        .cb = cb,
+        .cb_opaque = cb_opaque,
     };
 
-    return block_copy_common(&call_state);
-}
+    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
+                          g_free);
+    if (ret < 0) {
+        assert(ret == -ETIMEDOUT);
+        block_copy_call_cancel(call_state);
+        /* call_state will be freed by running coroutine. */
+        return ret;
+    }
 
-static void coroutine_fn block_copy_async_co_entry(void *opaque)
-{
-    block_copy_common(opaque);
+    ret = call_state->ret;
+    g_free(call_state);
+
+    return ret;
 }
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c8a11a09d2..fc13c7cd44 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -111,7 +111,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true, 0, NULL, NULL);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 68bbd344b2..ba0b425d78 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -40,7 +40,9 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit);
+                            bool ignore_ratelimit, uint64_t timeout_ns,
+                            BlockCopyAsyncCallbackFunc cb,
+                            void *cb_opaque);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
-- 
2.25.1


