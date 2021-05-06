Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149B375853
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:19:07 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legiQ-0000hf-5r
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVl-0004B1-7D
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVi-0003Xd-85
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5EH2tQeYOTzoLawqab1A0H8FWNrS+FmcJTYEsoxHII=;
 b=Coe4AFCYJaatj3t3B69V1P0w5QsmLsGbngFHqsedzEnU7cQoZh6+yqS8PhDr4Hgx4VXrpd
 iRZcb/uRHDh7H2QH9Ez3LBOmKb4yR4VNnzoRfRKbuS/2dKb7xcw/IJPYu4kPwAfKGXON2Y
 yWgeJnfVRar19xnfkO+M4o7WakzkjqY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-PFiOQoYNMkyZiR7eHKholw-1; Thu, 06 May 2021 12:05:55 -0400
X-MC-Unique: PFiOQoYNMkyZiR7eHKholw-1
Received: by mail-qk1-f200.google.com with SMTP id
 i141-20020a379f930000b02902e94f6d938dso3799202qke.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5EH2tQeYOTzoLawqab1A0H8FWNrS+FmcJTYEsoxHII=;
 b=BIvmAWR/ouZvDhVtcxc+AJCfldQ9betseuvoyhKOgEumz2JpWtI8O6oo8pcvWMFi61
 S6qpSvKj1zhysSofdC7jZNcRqTNMRLcQW4M96euzKcxHxO2S6T+xLtDuLCHBO9PBqHD+
 33u81M9GNPZxmm5nFyjSI+D7NKZsRIP8UIe7/xfXjLD2K84hTXPw+aNvbSDgCjX+iNtH
 F+eMjr8lcXlAwHysc6TN98Z2AKfo9gtHD2UN3lDEenXPirr2GSPneRSQhrtYy7Z1B6IC
 iVgFNA9H1c3WYBsIAC+6lhpIPoS/l027Hm9GAMrVuRX7ByFIm6M1vF6cx4pBtAG4P9CG
 2d/w==
X-Gm-Message-State: AOAM531Vzo9NjialgX900vYcy6C9RWjO5nVorAmH2Einh3Ke4v9EI075
 HRDiucDeuwjmBXurby8DzzYSOar+QBOAiwFcf2BbJ+Y7gJ4oWP+0VEsBqTF0djUatiSfW0jy0yv
 djfKRfHMSK+dQeKkF+JgbRkrVxEavgO3dw6ABX7YL2FgxghT5vis4WrwxBOx+dNc8
X-Received: by 2002:ac8:5810:: with SMTP id g16mr4827089qtg.135.1620317154490; 
 Thu, 06 May 2021 09:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ytoHf79YW0zAU7xlwv8PyqCiwCuCjEi1h+rFUoLq+8aHxmjgrwbC5tJtSnXwmFkWyR8Zwg==
X-Received: by 2002:ac8:5810:: with SMTP id g16mr4827049qtg.135.1620317154093; 
 Thu, 06 May 2021 09:05:54 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:05:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/10] memory: Introduce log_sync_global() to memory
 listener
Date: Thu,  6 May 2021 12:05:40 -0400
Message-Id: <20210506160549.130416-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
References: <20210506160549.130416-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
index 3bb533c0bce..c19b0be6b11 100644
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


