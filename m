Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF238F22F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:21:09 +0200 (CEST)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEGK-0001bZ-BS
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeR-0004s3-9Z
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:59 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004Lo-LG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g7so20568166edm.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOmCbiEylv+BfpPB3BvKqjoJGXomxSB65srB+i+LnhU=;
 b=oRZBhBUczjvU1ZqY+UmEqWI7ONxaiedbl6hSLd8ng9WdkOZLYWhGo2TttxfOUUHlu/
 3fCVXI4oPR6eh1gVKL014mnkNfYlR8OS1Pj1BITPUL+joCTnLmkB5G9zy2BUsaIUEcz1
 BwamyvuUD9rEH1OCLdAv9Y4m9rNUNpGVq1MLyiqfVLb3J6A4rwAWlIZ5IsZsJRwJxVt9
 aPM1vd+gz55eCfOWCXIsGi2qCm7nwyn7nkvAEWZOhouGRQZiJySNsnSpE+s3mtlk39UR
 YvOe6P/W0WjVtGqIkMe+KKfMHxSdWQ+2EIlk9YUwzi5q8Av2mJzpjKz5WziR+eBgdXhl
 00Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wOmCbiEylv+BfpPB3BvKqjoJGXomxSB65srB+i+LnhU=;
 b=jitLUVCsW7BtLS2NFG6PqI1eANoXKvmu3z3BlZIaf2HBIYX6NcjQYSfP2d2PRxQfoh
 SZ6W+UtPlabaYnGSflhz3IdRdpTIYrVwW+pfb8Sldk59bW/I4X5gQ8pBpfpuIMHJt0iG
 +6sDxp9fTvbnQvfkeidtyTjMqCXKl6karo+2Cmca7RS9Iv0K9d4YtfgEOZyGWtGIkl16
 oh9VII0njYFZ18nfA5Rw7iif1QF8IuB3xjhRzebBuQxu92Ley6v7jHnLTghUCnRz2y3J
 wRxZ3iV08UVhVmiHOruDHNN2mL1gxLPETWCYxntq81d5mCcnp6yj65hel5J2/1fQ37xy
 ZXhg==
X-Gm-Message-State: AOAM532sBE9TcAfeya1xW+fm/dIX4uuImhp33nOnETD1e46uJe2uvUcR
 p0Ie55FXCfJ4Jcj5H02MGALfIVwJwfzVUA==
X-Google-Smtp-Source: ABdhPJzp4Pr/k3iykJ0txMa/ZfyUS8MoLMex8Ohn8ReECs5E/vOf06m8Xkum/qfsEH1zMNiNfBLaxA==
X-Received: by 2002:a05:6402:424c:: with SMTP id
 g12mr23068130edb.145.1621874498676; 
 Mon, 24 May 2021 09:41:38 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] memory: Introduce log_sync_global() to memory listener
Date: Mon, 24 May 2021 18:41:12 +0200
Message-Id: <20210524164131.383778-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Some of the memory listener may want to do log synchronization without
being able to specify a range of memory to sync but always globally.
Such a memory listener should provide this new method instead of the
log_sync() method.

Obviously we can also achieve similar thing when we put the global
sync logic into a log_sync() handler. However that's not efficient
enough because otherwise memory_global_dirty_log_sync() may do the
global sync N times, where N is the number of flat ranges in the
address space.

Make this new method be exclusive to log_sync().

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-2-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/memory.h | 12 ++++++++++++
 softmmu/memory.c      | 33 +++++++++++++++++++++++----------
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c8b9088924..e38b7e3dce 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -616,6 +616,18 @@ struct MemoryListener {
      */
     void (*log_sync)(MemoryListener *listener, MemoryRegionSection *section);
 
+    /**
+     * @log_sync_global:
+     *
+     * This is the global version of @log_sync when the listener does
+     * not have a way to synchronize the log with finer granularity.
+     * When the listener registers with @log_sync_global defined, then
+     * its @log_sync must be NULL.  Vice versa.
+     *
+     * @listener: The #MemoryListener.
+     */
+    void (*log_sync_global)(MemoryListener *listener);
+
     /**
      * @log_clear:
      *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3bb533c0bc..c19b0be6b1 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2055,6 +2055,10 @@ void memory_region_set_dirty(MemoryRegion *mr, hwaddr addr,
                                         memory_region_get_dirty_log_mask(mr));
 }
 
+/*
+ * If memory region `mr' is NULL, do global sync.  Otherwise, sync
+ * dirty bitmap for the specified memory region.
+ */
 static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
 {
     MemoryListener *listener;
@@ -2068,18 +2072,24 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
      * address space once.
      */
     QTAILQ_FOREACH(listener, &memory_listeners, link) {
-        if (!listener->log_sync) {
-            continue;
-        }
-        as = listener->address_space;
-        view = address_space_get_flatview(as);
-        FOR_EACH_FLAT_RANGE(fr, view) {
-            if (fr->dirty_log_mask && (!mr || fr->mr == mr)) {
-                MemoryRegionSection mrs = section_from_flat_range(fr, view);
-                listener->log_sync(listener, &mrs);
+        if (listener->log_sync) {
+            as = listener->address_space;
+            view = address_space_get_flatview(as);
+            FOR_EACH_FLAT_RANGE(fr, view) {
+                if (fr->dirty_log_mask && (!mr || fr->mr == mr)) {
+                    MemoryRegionSection mrs = section_from_flat_range(fr, view);
+                    listener->log_sync(listener, &mrs);
+                }
             }
+            flatview_unref(view);
+        } else if (listener->log_sync_global) {
+            /*
+             * No matter whether MR is specified, what we can do here
+             * is to do a global sync, because we are not capable to
+             * sync in a finer granularity.
+             */
+            listener->log_sync_global(listener);
         }
-        flatview_unref(view);
     }
 }
 
@@ -2767,6 +2777,9 @@ void memory_listener_register(MemoryListener *listener, AddressSpace *as)
 {
     MemoryListener *other = NULL;
 
+    /* Only one of them can be defined for a listener */
+    assert(!(listener->log_sync && listener->log_sync_global));
+
     listener->address_space = as;
     if (QTAILQ_EMPTY(&memory_listeners)
         || listener->priority >= QTAILQ_LAST(&memory_listeners)->priority) {
-- 
2.31.1



