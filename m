Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C8382B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:45:53 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libh2-0006vw-IS
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libA6-0004US-VQ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libA4-0000d6-Q2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so5969469wrr.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fh8JZNfaRTAyd35OyZJZlm411xR5tEWJA9zZrpAqL0s=;
 b=fx0k8U5d2cZZsHIWix9fsFxGTUBHR2k5hkduFXNepuv6k54DXMn3miPMYjpqVTLS7v
 FNnKB3N3/dNh/pyGdyQriO0LjdqR6GcscOGgas3xzsz3iwGfg8Fyb0X12Tmy9PRn9XZ9
 cq9ITwop/bbmFFa9Ib3UICNcDiCf/b6ktgkY6URbk1JDdkqoLgzgTU5tAR71DaVwQ2EP
 M32vMWHlRXB0QudvmbhpftUncDpYRIMlGctqW2t5FN/fXWbd8uwxIXV9NTO6AXS4ATJr
 FtusnoByEduwgtK0lE2t5Veqg9xJVcz3vSJlTZ/LZ8rBtfo+rf3uz27kl6EzNOb4Din6
 YdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fh8JZNfaRTAyd35OyZJZlm411xR5tEWJA9zZrpAqL0s=;
 b=jc+1zqtVHgZkGH9aTxcSF8T6roZe7DBFwYdSffp53FM6NqUrl6+sulV2Uu7rr40gs9
 /0FenAtZXA348O7zWrrYyzv3tBJlLz0rwXBjS8adHk8UnM1AK8BWOjTSgWeMoo0DsCPK
 mRhNuDKVvBm8TwfJ6iLT+tRqmyWi9FLsdSzYF02d95PExu/FHZHAhPsUUzM/0R2nbBYq
 jJ5uSdW5ZeJrDWhHBVd/v94qWbjkQz4RWm3NgI2+aBguO9Z0D1MiAPPx7tysat3MaMD4
 v+2MJIkDKqwfUwcgV5gbbq3uCBEPa34N8VNcvKt5DJENq2c9TPL3s/KU+cipH1XU2iQz
 sCLw==
X-Gm-Message-State: AOAM533VSkrCWKkCfZ4C8wz19DYFJwH3YWtVurL11RvrOMPhJ2WsJIme
 r/ACuv9GpHkjjYGECPC8DHjggQ5yJTXL4g==
X-Google-Smtp-Source: ABdhPJyWHvAvihaYh9Y/yoFNZc2L+1afBCVDOKn+teWTckfcuNhE0X3AHXzodctYHuC/7CQ+gnmfWw==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr73349866wrs.17.1621249906773; 
 Mon, 17 May 2021 04:11:46 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g16sm17587223wmh.32.2021.05.17.04.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] exec: Extract CPU I/O instructions to "cpu-io.h"
Date: Mon, 17 May 2021 13:11:07 +0200
Message-Id: <20210517111111.1068153-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all architectures use an I/O bus. Extract the CPU I/O
instruction helpers into a specific unit named cpu-io.c
(and its equivalent "cpu-io.h" header).

Since what is left in ioport.c is no more target specific,
build the file with the other softmmu objects by moving the
file to the softmmu_ss Meson source set.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-io.h             | 30 +++++++++++
 include/exec/ioport.h             |  7 ---
 hw/i386/xen/xen-hvm.c             |  1 +
 monitor/misc.c                    |  2 +-
 softmmu/cpu-io.c                  | 88 +++++++++++++++++++++++++++++++
 softmmu/ioport.c                  | 60 ---------------------
 softmmu/qtest.c                   |  1 +
 tests/qtest/fuzz/qtest_wrappers.c |  3 +-
 softmmu/meson.build               |  3 +-
 9 files changed, 125 insertions(+), 70 deletions(-)
 create mode 100644 include/exec/cpu-io.h
 create mode 100644 softmmu/cpu-io.c

diff --git a/include/exec/cpu-io.h b/include/exec/cpu-io.h
new file mode 100644
index 00000000000..6538c451177
--- /dev/null
+++ b/include/exec/cpu-io.h
@@ -0,0 +1,30 @@
+/*
+ * QEMU CPU I/O instructions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
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
+#ifndef CPU_IO_H
+#define CPU_IO_H
+
+void cpu_outb(uint32_t addr, uint8_t val);
+void cpu_outw(uint32_t addr, uint16_t val);
+void cpu_outl(uint32_t addr, uint32_t val);
+uint8_t cpu_inb(uint32_t addr);
+uint16_t cpu_inw(uint32_t addr);
+uint32_t cpu_inl(uint32_t addr);
+
+#endif /* CPU_IO_H */
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index d5ca8abff76..f94f71b19f0 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -44,13 +44,6 @@ typedef struct MemoryRegionPortio {
 extern const MemoryRegionOps unassigned_io_ops;
 #endif
 
-void cpu_outb(uint32_t addr, uint8_t val);
-void cpu_outw(uint32_t addr, uint16_t val);
-void cpu_outl(uint32_t addr, uint32_t val);
-uint8_t cpu_inb(uint32_t addr);
-uint16_t cpu_inw(uint32_t addr);
-uint32_t cpu_inl(uint32_t addr);
-
 typedef struct PortioList {
     const struct MemoryRegionPortio *ports;
     Object *owner;
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 9b432773f02..c8de325a809 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -33,6 +33,7 @@
 #include "sysemu/xen.h"
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
+#include "exec/cpu-io.h"
 
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
diff --git a/monitor/misc.c b/monitor/misc.c
index c1fcd995805..60ee9c91a9f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -76,7 +76,7 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
-
+#include "exec/cpu-io.h"
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
 #include "hw/s390x/storage-attributes.h"
diff --git a/softmmu/cpu-io.c b/softmmu/cpu-io.c
new file mode 100644
index 00000000000..98da9d693f9
--- /dev/null
+++ b/softmmu/cpu-io.c
@@ -0,0 +1,88 @@
+/*
+ * QEMU CPU I/O instructions
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/sysemu/address-spaces.h"
+#include "exec/cpu-io.h"
+#include "cpu.h"
+#include "trace.h"
+
+void cpu_outb(uint32_t addr, uint8_t val)
+{
+    trace_cpu_out(addr, 'b', val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        &val, 1);
+}
+
+void cpu_outw(uint32_t addr, uint16_t val)
+{
+    uint8_t buf[2];
+
+    trace_cpu_out(addr, 'w', val);
+    stw_p(buf, val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        buf, 2);
+}
+
+void cpu_outl(uint32_t addr, uint32_t val)
+{
+    uint8_t buf[4];
+
+    trace_cpu_out(addr, 'l', val);
+    stl_p(buf, val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        buf, 4);
+}
+
+uint8_t cpu_inb(uint32_t addr)
+{
+    uint8_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                       &val, 1);
+    trace_cpu_in(addr, 'b', val);
+    return val;
+}
+
+uint16_t cpu_inw(uint32_t addr)
+{
+    uint8_t buf[2];
+    uint16_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
+    val = lduw_p(buf);
+    trace_cpu_in(addr, 'w', val);
+    return val;
+}
+
+uint32_t cpu_inl(uint32_t addr)
+{
+    uint8_t buf[4];
+    uint32_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
+    val = ldl_p(buf);
+    trace_cpu_in(addr, 'l', val);
+    return val;
+}
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index 6ace5ec966a..6f297027cfe 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/sysemu/memory.h"
 #include "exec/sysemu/address-spaces.h"
@@ -54,65 +53,6 @@ const MemoryRegionOps unassigned_io_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void cpu_outb(uint32_t addr, uint8_t val)
-{
-    trace_cpu_out(addr, 'b', val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        &val, 1);
-}
-
-void cpu_outw(uint32_t addr, uint16_t val)
-{
-    uint8_t buf[2];
-
-    trace_cpu_out(addr, 'w', val);
-    stw_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 2);
-}
-
-void cpu_outl(uint32_t addr, uint32_t val)
-{
-    uint8_t buf[4];
-
-    trace_cpu_out(addr, 'l', val);
-    stl_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 4);
-}
-
-uint8_t cpu_inb(uint32_t addr)
-{
-    uint8_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                       &val, 1);
-    trace_cpu_in(addr, 'b', val);
-    return val;
-}
-
-uint16_t cpu_inw(uint32_t addr)
-{
-    uint8_t buf[2];
-    uint16_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
-    val = lduw_p(buf);
-    trace_cpu_in(addr, 'w', val);
-    return val;
-}
-
-uint32_t cpu_inl(uint32_t addr)
-{
-    uint8_t buf[4];
-    uint32_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
-    val = ldl_p(buf);
-    trace_cpu_in(addr, 'l', val);
-    return val;
-}
-
 void portio_list_init(PortioList *piolist,
                       Object *owner,
                       const MemoryRegionPortio *callbacks,
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f1ee4fbc369..2551296c727 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
 #endif
+#include "exec/cpu-io.h"
 
 #define MAX_IRQ 256
 
diff --git a/tests/qtest/fuzz/qtest_wrappers.c b/tests/qtest/fuzz/qtest_wrappers.c
index 0580f8df860..25cf1b72705 100644
--- a/tests/qtest/fuzz/qtest_wrappers.c
+++ b/tests/qtest/fuzz/qtest_wrappers.c
@@ -12,8 +12,9 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/sysemu/address-spaces.h"
+#include "exec/cpu-io.h"
 #include "hw/core/cpu.h"
-#include "exec/ioport.h"
 
 #include "fuzz.h"
 
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018abf..ebf063b8990 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -2,11 +2,11 @@
   'arch_init.c',
   'balloon.c',
   'cpus.c',
+  'cpu-io.c',
   'cpu-throttle.c',
   'datadir.c',
   'globals.c',
   'physmem.c',
-  'ioport.c',
   'rtc.c',
   'runstate.c',
   'memory.c',
@@ -24,6 +24,7 @@
 softmmu_ss.add(files(
   'bootdevice.c',
   'dma-helpers.c',
+  'ioport.c',
   'qdev-monitor.c',
 ), sdl, libpmem, libdaxctl)
 
-- 
2.26.3


