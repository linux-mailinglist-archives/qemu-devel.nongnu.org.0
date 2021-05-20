Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1EB389FC7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:27:57 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje28-0005tM-BX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0005NV-Ef
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxV-0001Wj-Rt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so16713811wrr.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOmCbiEylv+BfpPB3BvKqjoJGXomxSB65srB+i+LnhU=;
 b=Op+UybUh6jkIjjkbH75pLuRpUK85tznaIUaqiGd5NWZT3YaifjDoeQuLwVOZRreEhh
 AZaiyesiQGtO5yq8H3K1HW2dU2+EBVUmT4Tbg4nLufqydfiyZ1q6dY9EDf5r65hmpvtG
 DPMI2UH80p2XEp5cVyzM+aGo3ui/IvhQ8VeBKZ+jGEjj+262zW9iaswGsifEOzR4gsQv
 EETK5KttM8fjKKRT1FdWJj0oWSGj8MhgHkaRNCz1CJKYcCd5AFi7DXMNxiNHQXyAWVWy
 POJguB34+qqBaM9AwgcEOBfHIiXCa9R+qeUjmRkqpqW+wejE/PrPXZvJy/9ZOH1GoTXv
 jaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wOmCbiEylv+BfpPB3BvKqjoJGXomxSB65srB+i+LnhU=;
 b=ZGiRZ2FXhSiDZ/W2Rj4QAfdCa4PujALvCHwPjbQtqnF4J6CHbOJJzmEd6bVzcnLEbs
 YMDffd/ANbGme0PWQgPubYqYuDj2HIh9zdEZP8a+aHAUrHReuVQg31NgrpfjZWK3hJTz
 y3KwN6pPNn8In04QtvZCGoymP0ZKtZmX7/FW/FEnJSlMInGiTj/H4lrrnGEcfJzknCu1
 sfr75dbEa98t3HMfwE5kQ1DKpSvQCrzD9AuOVn2ZjgvwKKKQmycHaxO3uyMzFmNj9hpe
 kSdELMHudK/jMg9CnZj/Zqxx8hJ+rp4gD45wDMzj2bDhtYMxcIJ7T93bJSqcBpZVuU7I
 vBZg==
X-Gm-Message-State: AOAM5301PYOy7PqS2i0yksoLNnRXZg6VD60xZqMj30hJJlARgs1zgWSI
 u8pnrUYL/2Bs7tNvJqKFWmVR4O4LVBnWBg==
X-Google-Smtp-Source: ABdhPJxTO4Bagl4lV0/KfiurZe94KWAhZCU8N3gwmt+6EtxrftYilKQZEVWcTlt3yLoyPnXnKFp25g==
X-Received: by 2002:adf:e484:: with SMTP id i4mr2929470wrm.117.1621498985145; 
 Thu, 20 May 2021 01:23:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] memory: Introduce log_sync_global() to memory listener
Date: Thu, 20 May 2021 10:22:41 +0200
Message-Id: <20210520082257.187061-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



