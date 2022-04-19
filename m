Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB050656D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:12:19 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi27-0006e8-1n
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm6-0001Bn-70
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm3-0004SO-GI
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id q20so9939184wmq.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Maj9x9vK/TMpGaFGhZ6yBeM1OJoIqE8ObWE/BKs+2Pw=;
 b=L2BdsWM0wC3LB/zXAAkjKb+OEvOMp6iSgCve+FTIB6z/XO8dgh41d/gyoIl11j9K+5
 s9TaoU5DydWM9WuP/OefF+NK8651R6I5LmBf+tlJx/WVzUnvcpHYvx6wVKg40n6OQIKp
 YQSXYGoIbyUbpA1dHHS6VrLELCKchhNHM0TppF/AVLrKJfHFKV8WGKfwpPvyCw+ZLCi2
 O8lSAzeoJljS/LZKzbNsk7SMAA8EOb7Lg8nLl+/K+ThDZWT3IasPQQq3j+Itu7JrIWDW
 v7jP+5JWe/LSiSvDFvCeC6HEGLoQ8TLtrlzia60ZvlCGhQoKGWjHFxoqRn69Fl0lK9F+
 YKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Maj9x9vK/TMpGaFGhZ6yBeM1OJoIqE8ObWE/BKs+2Pw=;
 b=zd/+9g7BlGDvddq1rGdwIv1kC84JfNrF3BpepJdP0Gx+5T9q1giLaT7H5xyiY8FNKx
 nqCS0Kjsevy3nXyY7mqf0cFqmyP59qR0xH9UJE30HuZ3gZoGTQ2ynZnXrTasusDuHHIy
 WE6yujT2hNcEzceVUAf+Zto5wSr7lQY8OVekbF8Etx6It42PV0mTBaL6NubOkUciyj+j
 p/4+qykBABKm40n3zI3+2ZpZjQIe8LnEdlOPa1valM5rE8ybSNTGC9AgjxPw3iGm5Yev
 p85pmRi3fM75DE2BwsX9fTLr1hcBjS9lmKGruNEBdc+hFNgapHtxTj1XtHwUEIOFVqpe
 zTPg==
X-Gm-Message-State: AOAM533JPROVl4QI3lrmvQgRTStVV9ft+NQ8/+ZJuewiOQvu7WlOcqjw
 0/tUkueA+2dSsspX9IXsHSxHVX6rfvIs0A==
X-Google-Smtp-Source: ABdhPJzr8SdyI6AoJM/a9mJBYuJBWH8jMAIFclpXCPfR3FzMCUlHDsCP/AgY9jEWU9gjJq0ojgfINQ==
X-Received: by 2002:a1c:f605:0:b0:37b:b5de:89a0 with SMTP id
 w5-20020a1cf605000000b0037bb5de89a0mr14047279wmc.88.1650347496004; 
 Mon, 18 Apr 2022 22:51:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/53] Move CPU softfloat unions to cpu-float.h
Date: Tue, 19 Apr 2022 07:50:49 +0200
Message-Id: <20220419055109.142788-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The types are no longer used in bswap.h since commit
f930224fffe ("bswap.h: Remove unused float-access functions"), there
isn't much sense in keeping it there and having a dependency on fpu/.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-29-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/bswap.h      | 60 ------------------------------------
 include/qemu/cpu-float.h  | 64 +++++++++++++++++++++++++++++++++++++++
 migration/vmstate-types.c |  1 +
 target/alpha/cpu.h        |  1 +
 target/arm/cpu.h          |  1 +
 target/hppa/cpu.h         |  1 +
 target/i386/cpu.h         |  1 +
 target/m68k/cpu.h         |  1 +
 target/microblaze/cpu.h   |  2 +-
 target/openrisc/cpu.h     |  1 +
 target/ppc/cpu.h          |  1 +
 target/riscv/cpu.h        |  2 +-
 target/rx/cpu.h           |  1 +
 target/s390x/cpu.h        |  1 +
 target/sh4/cpu.h          |  1 +
 target/sparc/cpu.h        |  1 +
 target/tricore/cpu.h      |  1 +
 target/xtensa/cpu.h       |  1 +
 18 files changed, 80 insertions(+), 62 deletions(-)
 create mode 100644 include/qemu/cpu-float.h

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 9dff7c7dbb..346d05f2aa 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -19,8 +19,6 @@
 extern "C" {
 #endif
 
-#include "fpu/softfloat-types.h"
-
 #ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
@@ -202,64 +200,6 @@ CPU_CONVERT(le, 64, uint64_t)
 # define const_le16(_x) (_x)
 #endif
 
-/* Unions for reinterpreting between floats and integers.  */
-
-typedef union {
-    float32 f;
-    uint32_t l;
-} CPU_FloatU;
-
-typedef union {
-    float64 d;
-#if HOST_BIG_ENDIAN
-    struct {
-        uint32_t upper;
-        uint32_t lower;
-    } l;
-#else
-    struct {
-        uint32_t lower;
-        uint32_t upper;
-    } l;
-#endif
-    uint64_t ll;
-} CPU_DoubleU;
-
-typedef union {
-     floatx80 d;
-     struct {
-         uint64_t lower;
-         uint16_t upper;
-     } l;
-} CPU_LDoubleU;
-
-typedef union {
-    float128 q;
-#if HOST_BIG_ENDIAN
-    struct {
-        uint32_t upmost;
-        uint32_t upper;
-        uint32_t lower;
-        uint32_t lowest;
-    } l;
-    struct {
-        uint64_t upper;
-        uint64_t lower;
-    } ll;
-#else
-    struct {
-        uint32_t lowest;
-        uint32_t lower;
-        uint32_t upper;
-        uint32_t upmost;
-    } l;
-    struct {
-        uint64_t lower;
-        uint64_t upper;
-    } ll;
-#endif
-} CPU_QuadU;
-
 /* unaligned/endian-independent pointer access */
 
 /*
diff --git a/include/qemu/cpu-float.h b/include/qemu/cpu-float.h
new file mode 100644
index 0000000000..911099499f
--- /dev/null
+++ b/include/qemu/cpu-float.h
@@ -0,0 +1,64 @@
+#ifndef QEMU_CPU_FLOAT_H_
+#define QEMU_CPU_FLOAT_H_
+
+#include "fpu/softfloat-types.h"
+
+/* Unions for reinterpreting between floats and integers.  */
+
+typedef union {
+    float32 f;
+    uint32_t l;
+} CPU_FloatU;
+
+typedef union {
+    float64 d;
+#if HOST_BIG_ENDIAN
+    struct {
+        uint32_t upper;
+        uint32_t lower;
+    } l;
+#else
+    struct {
+        uint32_t lower;
+        uint32_t upper;
+    } l;
+#endif
+    uint64_t ll;
+} CPU_DoubleU;
+
+typedef union {
+     floatx80 d;
+     struct {
+         uint64_t lower;
+         uint16_t upper;
+     } l;
+} CPU_LDoubleU;
+
+typedef union {
+    float128 q;
+#if HOST_BIG_ENDIAN
+    struct {
+        uint32_t upmost;
+        uint32_t upper;
+        uint32_t lower;
+        uint32_t lowest;
+    } l;
+    struct {
+        uint64_t upper;
+        uint64_t lower;
+    } ll;
+#else
+    struct {
+        uint32_t lowest;
+        uint32_t lower;
+        uint32_t upper;
+        uint32_t upmost;
+    } l;
+    struct {
+        uint64_t lower;
+        uint64_t upper;
+    } ll;
+#endif
+} CPU_QuadU;
+
+#endif /* QEMU_CPU_FLOAT_H_ */
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index bf4d440308..e83bfccb9e 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cpu-float.h"
 #include "qemu-file.h"
 #include "migration.h"
 #include "migration/vmstate.h"
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 58f00b7814..994a018b91 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ccf635ac5c..cb5359a747 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -21,6 +21,7 @@
 #define ARM_CPU_H
 
 #include "kvm-consts.h"
+#include "qemu/cpu-float.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 4cc936b6bf..c43b93a68f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ccf627d2c5..8422f6c18e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -25,6 +25,7 @@
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#include "qemu/cpu-float.h"
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 872e8ce637..9b3bf7a448 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -22,6 +22,7 @@
 #define M68K_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 #include "cpu-qom.h"
 
 #define OS_BYTE     0
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 0a0ce71b6a..67aa88b8db 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -22,7 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat-types.h"
+#include "qemu/cpu-float.h"
 
 typedef struct CPUArchState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bdf29d2dc4..b9584f10d4 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -21,6 +21,7 @@
 #define OPENRISC_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "fpu/softfloat-types.h"
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 627e574127..473436a49e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -21,6 +21,7 @@
 #define PPC_CPU_H
 
 #include "qemu/int128.h"
+#include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..e1d976bdef 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -23,7 +23,7 @@
 #include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat-types.h"
+#include "qemu/cpu-float.h"
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index b4abd90ccd..1c267f83bf 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -24,6 +24,7 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* PSW define */
 REG32(PSW, 0)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index c49c8466e7..7d6d01325b 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -28,6 +28,7 @@
 #include "cpu-qom.h"
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index c72a30edfd..14d490ac47 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index abb38db674..dd9e2f5cdb 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,6 +4,7 @@
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 108d6b8288..3b9c533a7c 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
 struct tricore_boot_info;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index f10cfabdc3..71142ea8f4 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -29,6 +29,7 @@
 #define XTENSA_CPU_H
 
 #include "cpu-qom.h"
+#include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"
 
-- 
2.35.1



