Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89754F809D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:32:29 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSFQ-0001ay-Ty
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAr-00078I-AZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:45 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAp-0007uf-2t
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:45 -0400
Received: by mail-lj1-x234.google.com with SMTP id g24so7448926lja.7
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvQQSHE9cIjkkCBV8X6+ve07fQ3mAxwTpit9o/QrGXE=;
 b=LNIk3lD1G9f2YGTqecyZIT30yk6wLPQfK9/a2PJyEFLFivtw1FLtiyp9nbWDTls/n7
 2XPbr/9s7Uyb9DPbz39vIFVxji+9kN/j8R2Ol0ZBsBD+E5GngL7hJbS95F6qyF4rC+Vt
 DTx1+as8qgXFPkzDTa6K8lBNQKsW26K8TZy6r3oXR7ykTQ9lu9FB0Pl7C0Nk7yVqDl8l
 5NySNShjuucGshvmKaHSyW7lkma2D8AJTtLeBUuIBj7K2tcIB5aGpaAnPzgVD12qnOys
 B/5IWVL4f1bdA/jzYi9spWtTqQZXLvM5Zvt9Gx3AijVTWMMa6ITUI9+lR/K6dmTF4moX
 dPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvQQSHE9cIjkkCBV8X6+ve07fQ3mAxwTpit9o/QrGXE=;
 b=JfDtT/2BT82XvEupOffWAgtRDwwilwmqaXbOIAYm3HibTowdJw9PurQtRDV764paiK
 3MRumr9TeSXeQahrD4jTKc8jRS1bgiNQJWyamcmSHPr8mSZrVHEkO+4XbLz+nIClByA5
 XLe1BH8V0HxnwxLHAgNg1B4lUHATa8FLXVHKQZRFUWHaFvghieBTL86LycEtLqR+YfhS
 QYa4XCj8LplbnxcW/hB8SrHA0Ga2MEkoInQhi9Fp2EnwXVzGXKknjEzr79PUHP1pEJ0D
 vmu/zwaxCB5OcutM28TeePJyGl/a5yPgDvsrmeBeSLnQCLBHzLQkYiuWL+Zx6Xb7+pap
 gHGg==
X-Gm-Message-State: AOAM532hSaf0m5YMH+SYVPkeBwLC4XQEuN2xJpLbosQ1R4eDT1N2WVH8
 4qEUjkHV2jvAXqOMwm8W9nVXtg==
X-Google-Smtp-Source: ABdhPJw3HzvhuzLHL6iQK90Gvb5mt/qpYK7RtWa2IzY5Am1ZVjcUQflFlUczqyf97sXkcM5TNgeRCA==
X-Received: by 2002:a05:651c:243:b0:24a:fb54:31d3 with SMTP id
 x3-20020a05651c024300b0024afb5431d3mr8844984ljn.242.1649338061252; 
 Thu, 07 Apr 2022 06:27:41 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:40 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
Date: Thu,  7 Apr 2022 16:27:24 +0300
Message-Id: <20220407132726.85114-6-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add possibility to limit block_copy() call in time. To be used in the
next commit.

As timed-out block_copy() call will continue in background anyway (we
can't immediately cancel IO operation), it's important also give user a
possibility to pass a callback, to do some additional actions on
block-copy call finish.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  4 +++-
 block/block-copy.c         | 33 ++++++++++++++++++++++++++-------
 block/copy-before-write.c  |  2 +-
 3 files changed, 30 insertions(+), 9 deletions(-)

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
-- 
2.35.1


