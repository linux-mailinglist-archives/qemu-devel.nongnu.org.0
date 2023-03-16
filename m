Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E16BD56D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqLb-0007Ur-Et; Thu, 16 Mar 2023 12:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcqLX-0007SC-L1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:20:55 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcqLU-0006gl-P7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:20:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id l14so1455492pfc.11
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678983650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFgIDPbqsnXzqx3Vty279gehkfWFFbWBdkzN+/5PV60=;
 b=ubZPhnxWFlI56WfbRtnjcQ/+DPHhp/iZrsKQAJ01EM1I+mckGuAwhMblqoFA/DBhPT
 gtAwSKE5bupo1EuU+O9Vx1FrnHq3gu5ZjmZ4WNKUxquayESiqK/pGS3H1cps1/ZYU4QA
 IwKKtY9nEedSavaj67lwkbZJI3Zgt8B2xThW/B2AZOLvgDy40HKQT4iVNoffqxHIum7F
 /hY2GoiGbnHfZijSYB7/GNo22OVioNBqnsAUjCIEK5e7qFaa2eAdTzYrBuO5bmjmhKsb
 ANITPeh27znHL46PR1NL6RzGFWxP7/1V0K659m32CJW6f5vQDTICKWGcd0dhwmTIWys6
 xDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFgIDPbqsnXzqx3Vty279gehkfWFFbWBdkzN+/5PV60=;
 b=ZuBG9YRYQxwWic9BWLfivZTUPcKGBpXYs/EyGc+8YC2xtvJBfEAoHZz58c7SyAahlB
 upCN81Jqys+ZPus/N4+WeoCgJpFtcUDg/YZ9ys1lusFWe8sKLQ0Hvd76loaYpCOsZRJM
 6bcilk4+T2A0V5Ef8FWekEV1lazVT94GJFYTPw/NDn03D57nwjfGkh4rP55FLp7OWOOr
 2drteP8FtmEVMLmKPtv3m2L1cH15vMXRxrgB09QM0v9NPwArKz3NrZNAFBvmiF3wI456
 RAmiMDIGn3mVHxaTPNSdNTq0wC+xrypA2kSyAv9/fdGPTz/Vj+CHwi/dgCTdLFyN6Nuu
 FXWg==
X-Gm-Message-State: AO0yUKUrstzP0rI/bD0dZKrsxJY9Sv7R43i6js9OJbhucMencju4qiiW
 wO7ZBDnzOZOVs9IqcGMcAAm8E16JZvE+ppOnXl3FXg==
X-Google-Smtp-Source: AK7set+fXiEGtlPvULAeOc7eh3lJnjYVc0JZvXHbfBbqDAMR+2lKTwWBr75L3MLWp+3AYnANNssTgg==
X-Received: by 2002:a62:7bc7:0:b0:5ce:ef1b:a86 with SMTP id
 w190-20020a627bc7000000b005ceef1b0a86mr3848525pfc.2.1678983650195; 
 Thu, 16 Mar 2023 09:20:50 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa78d8b000000b005ded4825201sm5679779pfr.112.2023.03.16.09.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:20:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 v3] memory: Prevent recursive memory access
Date: Fri, 17 Mar 2023 01:20:44 +0900
Message-Id: <20230316162044.31607-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A guest may request ask a memory-mapped device to perform DMA. If the
address specified for DMA is the device performing DMA, it will create
recursion. It is very unlikely that device implementations are prepared
for such an abnormal access, which can result in unpredictable behavior.

In particular, such a recursion breaks e1000e, a network device. If
the device is configured to write the received packet to the register
to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
This causes use-after-free since the Rx logic is not re-entrant.

As there should be no valid reason to perform recursive memory access,
check for recursion before accessing memory-mapped device.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
V1 -> V2: Marked the variable thread-local. Introduced linked list.

 softmmu/memory.c | 81 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4699ba55ec..6be33a9e3e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -61,6 +61,15 @@ struct AddrRange {
     Int128 size;
 };
 
+typedef struct AccessedRegion AccessedRegion;
+
+struct AccessedRegion {
+    const Object *owner;
+    const AccessedRegion *next;
+};
+
+static __thread const AccessedRegion *accessed_region;
+
 static AddrRange addrrange_make(Int128 start, Int128 size)
 {
     return (AddrRange) { start, size };
@@ -1394,6 +1403,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
         return false;
     }
 
+    for (const AccessedRegion *ar = accessed_region; ar; ar = ar->next) {
+        if (ar->owner == mr->owner) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                          ", size %u, region '%s', reason: recursive access\n",
+                          is_write ? "write" : "read",
+                          addr, size, memory_region_name(mr));
+            return false;
+        }
+    }
+
     /* Treat zero as compatibility all valid */
     if (!mr->ops->valid.max_access_size) {
         return true;
@@ -1413,6 +1432,29 @@ bool memory_region_access_valid(MemoryRegion *mr,
     return true;
 }
 
+static bool memory_region_access_start(MemoryRegion *mr,
+                                       hwaddr addr,
+                                       unsigned size,
+                                       bool is_write,
+                                       MemTxAttrs attrs,
+                                       AccessedRegion *ar)
+{
+    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
+        return false;
+    }
+
+    ar->owner = mr->owner;
+    ar->next = accessed_region;
+    accessed_region = ar->next;
+
+    return true;
+}
+
+static void memory_region_access_end(void)
+{
+    accessed_region = accessed_region->next;
+}
+
 static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
                                                 hwaddr addr,
                                                 uint64_t *pval,
@@ -1443,6 +1485,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         MemTxAttrs attrs)
 {
     unsigned size = memop_size(op);
+    AccessedRegion ar;
     MemTxResult r;
 
     if (mr->alias) {
@@ -1450,12 +1493,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                            mr->alias_offset + addr,
                                            pval, op, attrs);
     }
-    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
+    if (!memory_region_access_start(mr, addr, size, false, attrs, &ar)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
     }
 
     r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
+    memory_region_access_end();
     adjust_endianness(mr, pval, op);
     return r;
 }
@@ -1493,13 +1537,15 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          MemTxAttrs attrs)
 {
     unsigned size = memop_size(op);
+    AccessedRegion ar;
+    MemTxResult result;
 
     if (mr->alias) {
         return memory_region_dispatch_write(mr->alias,
                                             mr->alias_offset + addr,
                                             data, op, attrs);
     }
-    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
+    if (!memory_region_access_start(mr, addr, size, true, attrs, &ar)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
     }
@@ -1508,23 +1554,24 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
 
     if ((!kvm_eventfds_enabled()) &&
         memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)) {
-        return MEMTX_OK;
-    }
-
-    if (mr->ops->write) {
-        return access_with_adjusted_size(addr, &data, size,
-                                         mr->ops->impl.min_access_size,
-                                         mr->ops->impl.max_access_size,
-                                         memory_region_write_accessor, mr,
-                                         attrs);
+        result = MEMTX_OK;
+    } else if (mr->ops->write) {
+        result = access_with_adjusted_size(addr, &data, size,
+                                           mr->ops->impl.min_access_size,
+                                           mr->ops->impl.max_access_size,
+                                           memory_region_write_accessor, mr,
+                                           attrs);
     } else {
-        return
-            access_with_adjusted_size(addr, &data, size,
-                                      mr->ops->impl.min_access_size,
-                                      mr->ops->impl.max_access_size,
-                                      memory_region_write_with_attrs_accessor,
-                                      mr, attrs);
+        result = access_with_adjusted_size(addr, &data, size,
+                                           mr->ops->impl.min_access_size,
+                                           mr->ops->impl.max_access_size,
+                                           memory_region_write_with_attrs_accessor,
+                                           mr, attrs);
     }
+
+    memory_region_access_end();
+
+    return result;
 }
 
 void memory_region_init_io(MemoryRegion *mr,
-- 
2.39.2


