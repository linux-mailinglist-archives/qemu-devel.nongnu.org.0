Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD450BA071
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Sep 2019 05:57:43 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBt0H-0003Pw-CV
	for lists+qemu-devel@lfdr.de; Sat, 21 Sep 2019 23:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsxm-0001Kw-0M
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsxk-00084v-Gw
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:05 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:47021)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBsxk-00084c-AQ
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:04 -0400
Received: by mail-pg1-x543.google.com with SMTP id a3so5972490pgm.13
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 20:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Znbphz4Wbz+jf1FVrRPd7yeYKp+P9bp2bimJSC5rLFA=;
 b=VHbIbLG0jV9poZAsAaMNnwZ6Eyci4TVnMSFKiHJM1K0dPaSJjGDoGSn6v8Es+tX009
 2M/1w79duh4+XopXIEFfBUPAYKEiTVSwamHg82U/d5d760nJ+Vwd1RTexBRjW3TtLkua
 T6ewSV9mP6rxDrPsCSvgvYDphjehNGSN+RHi62v2AjFVKgJdUWGGDI/iuVWaEVnn3P0+
 YNa/2PHpylcUO+0bpqrakTooz375Ph3bAkbCiGL2+7Dffp2UiY9rQfpAm3ljlezn5dFJ
 kHi0JsN3O+Nv8x3YjvrHQEnJzLm7+yi/UDsjwpo24eJEiCYh+nGsJoJnnDpCzxWKjn20
 JDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Znbphz4Wbz+jf1FVrRPd7yeYKp+P9bp2bimJSC5rLFA=;
 b=ZVXWmXvdaAGEYrAqfS7VnQpl2pC8zPHvt86fJg8aMaj7t6r/J34Bye/Styg6tEPBw7
 troEeKR5sMrwoa4aalP6BVXLEOa21immk8Vg5mglu4tuP5JD+D6NKTZODm/lDxXX3+/g
 +C0AWeLjkPYkKjzVMjjpPLltjL3NmI1msxwOdn0OF7OkdNOqSa5rBpCcteUdU1qIb31k
 vr0SpNjYoXiz+7lod1iPEeaS1kcmBit3xx6mbp9Q/A5XopSKIcuBSKX0yUbRXdGIVbn0
 KUEn5i9NnJ2WHckyu24GZ4SU2JjEYYayZ+TcIT4SrbDUx1lEuMe3KngZ3SII9yueOEpa
 /mHQ==
X-Gm-Message-State: APjAAAXohsImw7goZ+oD1+PasUYndTU+viCY1PF+ytJBedZe2NLng2QS
 vukOMBvkzEz1nXY0kzEjQxGpjVSsBAY=
X-Google-Smtp-Source: APXvYqxQJzLhMSg2pEmiRu30SQVfI5MJdiQdI1hZnLUCw9DgS6gQz+iUTLResdgWsrzzlIUTnq9jXg==
X-Received: by 2002:aa7:9ddd:: with SMTP id g29mr27122349pfq.146.1569124502979; 
 Sat, 21 Sep 2019 20:55:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z4sm6452921pjt.17.2019.09.21.20.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 20:55:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/20] exec: Split out variable page size support to
 exec-vary.c
Date: Sat, 21 Sep 2019 20:54:40 -0700
Message-Id: <20190922035458.14879-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190922035458.14879-1-richard.henderson@linaro.org>
References: <20190922035458.14879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch will play a trick with "const" that will
confuse the compiler about the uses of target_page_bits
within exec.c.  Moving everything to a new file prevents
this confusion.

No functional change so far.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile.target       |  2 +-
 include/qemu-common.h |  6 +++++
 exec-vary.c           | 57 +++++++++++++++++++++++++++++++++++++++++++
 exec.c                | 34 --------------------------
 4 files changed, 64 insertions(+), 35 deletions(-)
 create mode 100644 exec-vary.c

diff --git a/Makefile.target b/Makefile.target
index 5e916230c4..ca3d14efe1 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -107,7 +107,7 @@ obj-y += trace/
 
 #########################################################
 # cpu emulator library
-obj-y += exec.o
+obj-y += exec.o exec-vary.o
 obj-y += accel/
 obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
 obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 8d84db90b0..082da59e85 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -74,6 +74,12 @@ void cpu_exec_step_atomic(CPUState *cpu);
  */
 bool set_preferred_target_page_bits(int bits);
 
+/**
+ * finalize_target_page_bits:
+ * Commit the final value set by set_preferred_target_page_bits.
+ */
+void finalize_target_page_bits(void);
+
 /**
  * Sends a (part of) iovec down a socket, yielding when the socket is full, or
  * Receives data into a (part of) iovec from a socket,
diff --git a/exec-vary.c b/exec-vary.c
new file mode 100644
index 0000000000..48c0ab306c
--- /dev/null
+++ b/exec-vary.c
@@ -0,0 +1,57 @@
+/*
+ * Variable page size handling
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/exec-all.h"
+
+#ifdef TARGET_PAGE_BITS_VARY
+int target_page_bits;
+bool target_page_bits_decided;
+#endif
+
+bool set_preferred_target_page_bits(int bits)
+{
+    /*
+     * The target page size is the lowest common denominator for all
+     * the CPUs in the system, so we can only make it smaller, never
+     * larger. And we can't make it smaller once we've committed to
+     * a particular size.
+     */
+#ifdef TARGET_PAGE_BITS_VARY
+    assert(bits >= TARGET_PAGE_BITS_MIN);
+    if (target_page_bits == 0 || target_page_bits > bits) {
+        if (target_page_bits_decided) {
+            return false;
+        }
+        target_page_bits = bits;
+    }
+#endif
+    return true;
+}
+
+void finalize_target_page_bits(void)
+{
+#ifdef TARGET_PAGE_BITS_VARY
+    if (target_page_bits == 0) {
+        target_page_bits = TARGET_PAGE_BITS_MIN;
+    }
+    target_page_bits_decided = true;
+#endif
+}
diff --git a/exec.c b/exec.c
index 8b998974f8..33bd0e36c1 100644
--- a/exec.c
+++ b/exec.c
@@ -92,11 +92,6 @@ MemoryRegion io_mem_rom, io_mem_notdirty;
 static MemoryRegion io_mem_unassigned;
 #endif
 
-#ifdef TARGET_PAGE_BITS_VARY
-int target_page_bits;
-bool target_page_bits_decided;
-#endif
-
 CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
 
 /* current CPU in the current thread. It is only valid inside
@@ -110,37 +105,8 @@ int use_icount;
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
-bool set_preferred_target_page_bits(int bits)
-{
-    /* The target page size is the lowest common denominator for all
-     * the CPUs in the system, so we can only make it smaller, never
-     * larger. And we can't make it smaller once we've committed to
-     * a particular size.
-     */
-#ifdef TARGET_PAGE_BITS_VARY
-    assert(bits >= TARGET_PAGE_BITS_MIN);
-    if (target_page_bits == 0 || target_page_bits > bits) {
-        if (target_page_bits_decided) {
-            return false;
-        }
-        target_page_bits = bits;
-    }
-#endif
-    return true;
-}
-
 #if !defined(CONFIG_USER_ONLY)
 
-static void finalize_target_page_bits(void)
-{
-#ifdef TARGET_PAGE_BITS_VARY
-    if (target_page_bits == 0) {
-        target_page_bits = TARGET_PAGE_BITS_MIN;
-    }
-    target_page_bits_decided = true;
-#endif
-}
-
 typedef struct PhysPageEntry PhysPageEntry;
 
 struct PhysPageEntry {
-- 
2.17.1


