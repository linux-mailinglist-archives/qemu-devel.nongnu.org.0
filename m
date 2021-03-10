Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926A3348F9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:39:31 +0100 (CET)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5cA-00022i-GO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W6-0005tR-6Y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W1-0000bS-Hc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGv4LvH3bqWlkXxLlo/pkxjQ8HX4BfZUoTqpMbfXXe8=;
 b=RPBFuRzqgZhqcxL8fu5Z7pIctDVkwAhTOIfu2a/Hx2fKRlJaSL78utSS+e7kS2/ZUmoCIX
 oup6/7KypVSim+S2Q6pTiVz8oc5GhND9GGHV2VPFhfe5UvYPlzVANpoZUJ8WTjpBlYh1cO
 zJ0VcuFRDUcqIxQ43HCpgN05PLfkQWg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-qgr7BfIrN3qA4jg_b6zaYQ-1; Wed, 10 Mar 2021 15:33:05 -0500
X-MC-Unique: qgr7BfIrN3qA4jg_b6zaYQ-1
Received: by mail-qv1-f71.google.com with SMTP id j3so13624894qvo.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGv4LvH3bqWlkXxLlo/pkxjQ8HX4BfZUoTqpMbfXXe8=;
 b=BTDbcpiONEvtwPoN1+WGkMctaSYM3t6/MFLYJ/zmmFQ3ILlCV/66XHfJfaYJqDH78P
 mjgnRj30npYk4clnlOGwPCyePuL4LAAwUeDcCsl4WBKZmvQ5F9m/b7Ju7gVym1Dr00kR
 YNzJg1IZFJ7L2wBMMnjSU9LXZbxEj3Hf88IrTIB0IzoDDk9iFaIZzJr5MqlHBXj7s5cd
 UjkDgGV9//CMk2mSryfhG0l9zXrg7+p1GUzNfS8ZoNj+fhcwePLM64hWUqIJSD/KcNFD
 v2FP/MoPKOoJqcjBXBI/kFnYT4HMYLzUYDywtWigOuMI7JKmESFHFI9JXudoPNHjz07l
 zcZQ==
X-Gm-Message-State: AOAM5320j+62UHyel3qqgcBHCJno94llGmuxxtr0Ery/L9gwvZjzYvcJ
 girAhK3xG1rFmrdtfzH993g9FO7DxCmnmY9PYOOCAJU/+VWElqtuDgbS8TE/9VnfmFdA/tK/81z
 2fwd6RsFnBz22IbNhsOh0ph0ebJvpKCx4zmGlwwBzTT5QqPKxqy+6S14icD5Na3SQ
X-Received: by 2002:a37:5943:: with SMTP id n64mr4601296qkb.127.1615408384280; 
 Wed, 10 Mar 2021 12:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxftJ4BJjRVAMTt0aH9Ud6oR8MEB0C8ngQvOhXi82o9OFmkftQNzhVhFxTy3h2e7QC0xoTmRw==
X-Received: by 2002:a37:5943:: with SMTP id n64mr4601260qkb.127.1615408383951; 
 Wed, 10 Mar 2021 12:33:03 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:03 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] memory: Introduce log_sync_global() to memory
 listener
Date: Wed, 10 Mar 2021 15:32:52 -0500
Message-Id: <20210310203301.194842-2-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
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
index c6fb714e499..e52e2c31eb7 100644
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
index 874a8fccdee..f655ed83129 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2056,6 +2056,10 @@ void memory_region_set_dirty(MemoryRegion *mr, hwaddr addr,
                                         memory_region_get_dirty_log_mask(mr));
 }
 
+/*
+ * If memory region `mr' is NULL, do global sync.  Otherwise, sync
+ * dirty bitmap for the specified memory region.
+ */
 static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
 {
     MemoryListener *listener;
@@ -2069,18 +2073,24 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
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
 
@@ -2768,6 +2778,9 @@ void memory_listener_register(MemoryListener *listener, AddressSpace *as)
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


