Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A375839236F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:55:30 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3N3-0003ju-O8
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FN-0005ia-V2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:33 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0004VJ-Jc
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id e22so2281269pgv.10
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V0x5rhNypIV83U052hVYT2YxxA7KW5j5yi40Zz65eM0=;
 b=WGUXzQI5FvWCdNAJKffI18rImwH4kUi99S9qL/nzqHys9ywXvN5MMVwVAQccXze8/u
 R6U1QAzFzZW52oUv7qqGAz7ZMQR7oXuN3aBN5PsbXImrXtwDIFDwnhKyDIkVQb3VSqxu
 TdiPqaO8mWQR995mpXJwEEVLs7kljZqqhvCRaDqjgRTFHLxoj/YSMWUHJ/yhibxu1rVD
 1y+GlU0hUatmWM9Xe86M7ITLtJlD2zogbIqbaA2qKphPIzCi/AJhV2HGH1kin1eN16/E
 8oSmX0f+2ht6p9dvyz+uMut+nhxeYBoMfCh/TCZRC5RyIZ/JMpKfhmCkKvL4j92Zf2k/
 ZElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V0x5rhNypIV83U052hVYT2YxxA7KW5j5yi40Zz65eM0=;
 b=Cui1Th90MgRahDmNLfWHkbboJBjLo6shSj9ZbSw4RQsJPFfayfdXVUOJpJU3d32ILm
 aOMfgIIaXPCnBbYbKFGuaZzwMDd62G+2bZZVrqGYnqrXx4gF9nnBZ7JkvboF257JRxVV
 Li4kG1p8MaOakv6orC9X6InqovWsdDRPp5k6+iHVlikb0sDIdWBeLzDCsZB0bhHwOqSq
 uFNXWiEeYuBBGPsUgzVNQK3D7/Ytl0hC2qLWa1w3Xd5s5cb0b4FYXE7X5wquwuQp7sCt
 xcfYpxS+HBn0wG9MyuWYhBCbUcEX6OSC2lmQHLdoNagGL/egbH+Jmov0kZQhXIisw7aj
 AKCA==
X-Gm-Message-State: AOAM532IXmy13uMCN7wZGlqlTuWxUtNjA3nyZJ9fAy0ioDP82hnbgz4V
 PzBfJg3wO5/gpq7wQP3qytsXb1Ahf41P8g==
X-Google-Smtp-Source: ABdhPJzfr/UigQPe6RA7LhsWBJjHe9lHNU57lA3LQBjH04EP1eGs5hT7apX1nPkv+9ZfKes7cnvE+w==
X-Received: by 2002:a62:7e41:0:b029:249:287:3706 with SMTP id
 z62-20020a627e410000b029024902873706mr914470pfc.76.1622072842864; 
 Wed, 26 May 2021 16:47:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/31] cpu: Split as cpu-common / cpu-sysemu
Date: Wed, 26 May 2021 16:46:51 -0700
Message-Id: <20210526234710.125396-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The current cpu.c contains sysemu-specific methods.
To avoid building them in user-mode builds, split the
current cpu.c as cpu-common.c / cpu-sysemu.c.

Start by moving cpu_get_crash_info().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/{cpu.c => cpu-common.c} | 17 -----------------
 hw/core/cpu-sysemu.c            | 34 +++++++++++++++++++++++++++++++++
 hw/core/meson.build             |  3 ++-
 3 files changed, 36 insertions(+), 18 deletions(-)
 rename hw/core/{cpu.c => cpu-common.c} (96%)
 create mode 100644 hw/core/cpu-sysemu.c

diff --git a/hw/core/cpu.c b/hw/core/cpu-common.c
similarity index 96%
rename from hw/core/cpu.c
rename to hw/core/cpu-common.c
index 919dc3435a..ddddf4b10e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu-common.c
@@ -190,23 +190,6 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
     return target_words_bigendian();
 }
 
-/*
- * XXX the following #if is always true because this is a common_ss
- * module, so target CONFIG_* is never defined.
- */
-#if !defined(CONFIG_USER_ONLY)
-GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    GuestPanicInformation *res = NULL;
-
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
-    }
-    return res;
-}
-#endif
-
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
new file mode 100644
index 0000000000..f517ef5d46
--- /dev/null
+++ b/hw/core/cpu-sysemu.c
@@ -0,0 +1,34 @@
+/*
+ * QEMU CPU model (system emulation specific)
+ *
+ * Copyright (c) 2012-2014 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/core/cpu.h"
+
+GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    GuestPanicInformation *res = NULL;
+
+    if (cc->get_crash_info) {
+        res = cc->get_crash_info(cpu);
+    }
+    return res;
+}
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 59f1605bb0..18f44fb7c2 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -13,7 +13,7 @@ hwcore_files = files(
   'qdev-clock.c',
 )
 
-common_ss.add(files('cpu.c'))
+common_ss.add(files('cpu-common.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
 common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
@@ -25,6 +25,7 @@ common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
+  'cpu-sysemu.c',
   'fw-path-provider.c',
   'loader.c',
   'machine-hmp-cmds.c',
-- 
2.25.1


