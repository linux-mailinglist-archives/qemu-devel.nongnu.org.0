Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637206BCF4F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmbW-0002yv-Ts; Thu, 16 Mar 2023 08:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmbU-0002yj-SA
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:21:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmbS-0000rS-0k
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:21:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso5210639pjb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678969264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aiFE+JXZjnXVcnflnkzhrmIYOBgtl1lEZX6c1WWpjbM=;
 b=SEHjaEU2vvcqaFxu2ooFiV3Ui8GGxK43UV7zW7yGJkRgJAHMetuI0pIEtzosoYoxT/
 TEf0aMbYCM7Qsk+XchfqgW7z6tYQc1qdEKdrMeRSblE7NFbMk9Pa50XbdvFhkx7Mmqhz
 vAW2j7EkCgVJBBEE9K6EKY0aJ65Kj+IJsuAgyQ3aljv6nlNRhRlQXzkLWnpDwP5YW9J1
 pXhMC7YdClsqIFyFX0p92zeoNb+2EL+GWwt1S8m1fbN1ZBqHQYtD8db0FTnn8+Iay6UN
 OUx5jglCry4vhtq9iqpllWtGxAXitb0D4roohL+V5xQvEQBJsnyeB+EnUMKrYhnzcPc/
 eQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678969264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiFE+JXZjnXVcnflnkzhrmIYOBgtl1lEZX6c1WWpjbM=;
 b=GYKTjsKv+YD2dzUXRUELQjh4ilKZRwIDgijtRyr0M+6Yv5ZbhWy8CKc97A0vnfZOfW
 I8K+NWHCO0R6P+8DUiUKJt4FlKsUnuYljqo7SpznLb+TOJoJ4F8kuzXN/3lwF9sssbqa
 eXuF4N8TOeEkiYlkV1lvfjKcjw3/9RwOYGHwEC848cJq0k65MwdUzM7H9oJVw4/DPg35
 BN/7PL/MwiRde13C3llvVgLBhPGdz4R3OMLKKqQ7Kb+nogD8HfY55amNWSIoKGYB+hLl
 ApZqt2qllYsARhZ/a+GPritH3XqEQGWx/vbEPFwIw+wl5tOrYib3+Mxoyx2XCpxs706+
 HI+w==
X-Gm-Message-State: AO0yUKVrFKEbF7l8CtiuvSIBrMbzEGmG23rEWfpDl+tP/Xw+kCs9qpAT
 yEpZF2gWhr2Cyo/WpkjKkICPAs7a1i3aeZdRCUg7Tg==
X-Google-Smtp-Source: AK7set+8XSB+4mUJoRrwCqwP0R1+z5+ZZXDp9mkl6BttGQhZSOAx/U4P+Jngcd3m2eq7Wey1wRuG4Q==
X-Received: by 2002:a17:903:6c5:b0:1a0:5bb1:3f0a with SMTP id
 kj5-20020a17090306c500b001a05bb13f0amr2908639plb.47.1678969264016; 
 Thu, 16 Mar 2023 05:21:04 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a1709026b8b00b001a042f532cfsm5506555plk.27.2023.03.16.05.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 05:21:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0] memory: Prevent recursive memory access
Date: Thu, 16 Mar 2023 21:20:45 +0900
Message-Id: <20230316122045.8896-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
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
 softmmu/memory.c | 79 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 17 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4699ba55ec..0743aff3d3 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -50,6 +50,10 @@ static QTAILQ_HEAD(, AddressSpace) address_spaces
 
 static GHashTable *flat_views;
 
+static const Object **accessed_region_owners;
+static size_t accessed_region_owners_capacity;
+static size_t accessed_region_owners_num;
+
 typedef struct AddrRange AddrRange;
 
 /*
@@ -1394,6 +1398,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
         return false;
     }
 
+    for (size_t i = 0; i < accessed_region_owners_num; i++) {
+        if (accessed_region_owners[i] == mr->owner) {
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
@@ -1413,6 +1427,34 @@ bool memory_region_access_valid(MemoryRegion *mr,
     return true;
 }
 
+static bool memory_region_access_start(MemoryRegion *mr,
+                                       hwaddr addr,
+                                       unsigned size,
+                                       bool is_write,
+                                       MemTxAttrs attrs)
+{
+    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
+        return false;
+    }
+
+    accessed_region_owners_num++;
+    if (accessed_region_owners_num >= accessed_region_owners_capacity) {
+        accessed_region_owners_capacity = accessed_region_owners_num;
+        accessed_region_owners = g_realloc_n(accessed_region_owners,
+                                             accessed_region_owners_num,
+                                             sizeof(*accessed_region_owners));
+    }
+
+    accessed_region_owners[accessed_region_owners_num - 1] = mr->owner;
+
+    return true;
+}
+
+static void memory_region_access_end(void)
+{
+    accessed_region_owners_num--;
+}
+
 static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
                                                 hwaddr addr,
                                                 uint64_t *pval,
@@ -1450,12 +1492,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                            mr->alias_offset + addr,
                                            pval, op, attrs);
     }
-    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
+    if (!memory_region_access_start(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
     }
 
     r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
+    memory_region_access_end();
     adjust_endianness(mr, pval, op);
     return r;
 }
@@ -1493,13 +1536,14 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          MemTxAttrs attrs)
 {
     unsigned size = memop_size(op);
+    MemTxResult result;
 
     if (mr->alias) {
         return memory_region_dispatch_write(mr->alias,
                                             mr->alias_offset + addr,
                                             data, op, attrs);
     }
-    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
+    if (!memory_region_access_start(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
     }
@@ -1508,23 +1552,24 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
 
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


