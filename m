Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77583480D7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:44:40 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Uh-0001TT-MO
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QJ-0007HF-J4
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QF-0006W3-GT
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rC712/DPw5bCFyqsNpzp3vrOKQtQcPcqk0rALenCWhY=;
 b=X0/Po8N+j+ooCNw0/SXFLemp3ZCtnqoE5oJpuWMO373hsx2izuSEGhZdksbKSRWVe8l9hf
 dfVDb7C52ZaTQiKGdrr/Sn651PCbYXRsH0tE4FN8aQtCathc52TM4Az+6pUDGCvZeULtfe
 4iHQ2JcpdfpK0nehSdyDkPleZ4o6p68=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-r54RtOjAP6K2GfLl7b2OqQ-1; Wed, 24 Mar 2021 14:40:00 -0400
X-MC-Unique: r54RtOjAP6K2GfLl7b2OqQ-1
Received: by mail-qk1-f200.google.com with SMTP id y22so2252073qkb.23
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rC712/DPw5bCFyqsNpzp3vrOKQtQcPcqk0rALenCWhY=;
 b=FPXIW30y1eBUPeuEhUr+j2iKIamePID3020m+c/EmuYsRs8kFX/7aF4FD2Yr6VKaAF
 CMYCpustw986P4LqlxYwR/zxhglF3ODPi/qs5zh/DfG9DIYERV7Fex/QzTmqUqsHvdfY
 LqN2oIhmPBZKdHY+tr1Q6tPB9TVoaJFddYnhmBRq/X6DUWDaME+DIRy2vng+qHj/h8h2
 Ihj1iMKt0Bs+dpdO9r+gi4cSgAzM7xBP4cRyOj7M4XLc7Mr1LNooJ8G4+i/eazIlQfOP
 2vjl7BsXpZY7S3Cb+Ew7vsV9nHx6zM0Z/m5EHOChmxXixQ95/U+fV45nm8G+qBM0Tb5r
 B6ew==
X-Gm-Message-State: AOAM5338dXy8Pzc+i41sKhlKass7YXWPhYnW8X/TzLLjzqybUsp/wtUL
 Rhy1gf3eREGOxeFpWnYCoMkSYw5H7T9swnqj2V1aflqcEyKxowxPxHICzD2a6tWJaMXYVtXMMtb
 OXJ9HKRFwSwIVjKnl7ZpQ5x//OLpcP6UXimJul1YeUOp3hyMs8TvyFEShJRxya/zq
X-Received: by 2002:a37:a785:: with SMTP id q127mr4278297qke.425.1616611199243; 
 Wed, 24 Mar 2021 11:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweYeb91rQVVwEQWufN0a2uPDHOjzryD/NMJyiKTkffZtb9bNSLXsidzt7dE2YbPP2nhxq8yg==
X-Received: by 2002:a37:a785:: with SMTP id q127mr4278268qke.425.1616611198894; 
 Wed, 24 Mar 2021 11:39:58 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:39:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/10] memory: Introduce log_sync_global() to memory
 listener
Date: Wed, 24 Mar 2021 14:39:45 -0400
Message-Id: <20210324183954.345629-2-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 include/exec/memory.h | 12 ++++++++++++
 softmmu/memory.c      | 33 +++++++++++++++++++++++----------
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27..97de5a8fa1e 100644
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
index d4493ef9e43..ea36805e2e9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2057,6 +2057,10 @@ void memory_region_set_dirty(MemoryRegion *mr, hwaddr addr,
                                         memory_region_get_dirty_log_mask(mr));
 }
 
+/*
+ * If memory region `mr' is NULL, do global sync.  Otherwise, sync
+ * dirty bitmap for the specified memory region.
+ */
 static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
 {
     MemoryListener *listener;
@@ -2070,18 +2074,24 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
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
 
@@ -2769,6 +2779,9 @@ void memory_listener_register(MemoryListener *listener, AddressSpace *as)
 {
     MemoryListener *other = NULL;
 
+    /* Only one of them can be defined for a listener */
+    assert(!(listener->log_sync && listener->log_sync_global));
+
     listener->address_space = as;
     if (QTAILQ_EMPTY(&memory_listeners)
         || listener->priority >= QTAILQ_LAST(&memory_listeners)->priority) {
-- 
2.26.2


