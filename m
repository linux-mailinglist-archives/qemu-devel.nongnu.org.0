Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AF6F51D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:38:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6te-0004uC-RE; Wed, 03 May 2023 03:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0004Ox-Q1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tO-0005dy-5T
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so31046935e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098832; x=1685690832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+z2hKn4diH8tIbH+Wd7F+QLB6VsqZEE8U9fAOfDDWtA=;
 b=cjY0yuuHHvdZwA/BbFOXf69cBvPqyskxhm5e+MEs5N9TZdNZgwmPcc8BjGAIIf1qLJ
 zPU0b8mapj2PV32D3I/74rVjHgLSYflE7rmMaAxrXjvRsPfVROVi/yK4JAPKz6/yRcXe
 4068vDLQC3+2AKL9OSPxzkpYKOheFDVbIOT4zyT9+besqFdcYn6BbvP77C8TG4+u+T76
 PKTxunBqw/Mj9xKTJgEVSrOgtmWtgwbyUZcJF7yH3rPed4FKF0DnbD66EeLdCBGEZThD
 TtLQJ0XlRBGYmTlL2F4Yyl373RyDzSzalQbFUajD2ArQMggoSKafBb8llWktyKa8w1DL
 j1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098832; x=1685690832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+z2hKn4diH8tIbH+Wd7F+QLB6VsqZEE8U9fAOfDDWtA=;
 b=jPvL99YTPDRIbw/uA3iifyd62v2+QzVDy2jzfenLG8YbzjzBepXIuGNCQpIY5s7c8J
 +HKZmn8bHzlJ6XmxwMtyT8Ywj4PvE+mOqx8xXSGYvOo3UVGi29509BrFkzxX7gL0QH2Z
 8ki8Sz9Fp5zGo0jTr1Ux60mgA7FPZJQReQtEUyHxbxsjYyL93rJRHd1Lt8QMY8b55pHY
 VY71YSCu+aSVqst7ZWLeeWEu1q+j6Y5mjGz6g1vA1GJPKxQGLYafCxWm5IV0thuwM8gB
 zoCdCqbQV0hW8Ve7MrG1zBU3P0JcktyKpiI5koLWz4++edoVlg4+hK72SP16spuqpdsG
 meZg==
X-Gm-Message-State: AC+VfDzbusVsacK9Q2AKzYl6mcTfdAfGgdBvuoln7X9zJJh5I5ol78W2
 KnKppgNn4TwV/Wb7OmjZbI1dra0bnGR9EJCjGgHnCA==
X-Google-Smtp-Source: ACHHUZ75j02amoemRFUgWbJicOgxo7SdmrokO6NjLL09M+VUEdM0ioKNSU3XFqamkGLGAx8tXlvyBA==
X-Received: by 2002:adf:dc0f:0:b0:2e4:eebe:aee3 with SMTP id
 t15-20020adfdc0f000000b002e4eebeaee3mr13767527wri.60.1683098832591; 
 Wed, 03 May 2023 00:27:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 53/84] tcg: Split helper-proto.h
Date: Wed,  3 May 2023 08:23:00 +0100
Message-Id: <20230503072331.1747057-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Create helper-proto-common.h without the target specific portion.
Use that in tcg-op-common.h.  Include helper-proto.h in target/arm
and target/hexagon before helper-info.c.inc; all other targets are
already correct in this regard.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-proto-common.h | 17 +++++++
 include/exec/helper-proto.h        | 72 ++++--------------------------
 include/tcg/tcg-op-common.h        |  2 +-
 accel/tcg/cputlb.c                 |  3 +-
 accel/tcg/plugin-gen.c             |  2 +-
 accel/tcg/tcg-runtime-gvec.c       |  2 +-
 accel/tcg/tcg-runtime.c            |  2 +-
 target/arm/tcg/translate.c         |  1 +
 target/hexagon/translate.c         |  1 +
 include/exec/helper-proto.h.inc    | 67 +++++++++++++++++++++++++++
 10 files changed, 99 insertions(+), 70 deletions(-)
 create mode 100644 include/exec/helper-proto-common.h
 create mode 100644 include/exec/helper-proto.h.inc

diff --git a/include/exec/helper-proto-common.h b/include/exec/helper-proto-common.h
new file mode 100644
index 0000000000..666778473e
--- /dev/null
+++ b/include/exec/helper-proto-common.h
@@ -0,0 +1,17 @@
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one expands prototypes for the helper functions.
+ */
+
+#ifndef HELPER_PROTO_COMMON_H
+#define HELPER_PROTO_COMMON_H
+
+#define HELPER_H "accel/tcg/tcg-runtime.h"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
+#define HELPER_H "accel/tcg/plugin-helpers.h"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
+#endif /* HELPER_PROTO_COMMON_H */
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 7a3f04b58c..aac684dbbf 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -1,71 +1,15 @@
-/* Helper file for declaring TCG helper functions.
-   This one expands prototypes for the helper functions.  */
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one expands prototypes for the helper functions.
+ */
 
 #ifndef HELPER_PROTO_H
 #define HELPER_PROTO_H
 
-#include "exec/helper-head.h"
+#include "exec/helper-proto-common.h"
 
-/*
- * Work around an issue with --enable-lto, in which GCC's ipa-split pass
- * decides to split out the noreturn code paths that raise an exception,
- * taking the __builtin_return_address() along into the new function,
- * where it no longer computes a value that returns to TCG generated code.
- * Despite the name, the noinline attribute affects splitter, so this
- * prevents the optimization in question.  Given that helpers should not
- * otherwise be called directly, this should have any other visible effect.
- *
- * See https://gitlab.com/qemu-project/qemu/-/issues/1454
- */
-#define DEF_HELPER_ATTR  __attribute__((noinline))
-
-#define DEF_HELPER_FLAGS_0(name, flags, ret) \
-dh_ctype(ret) HELPER(name) (void) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_1(name, flags, ret, t1) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), \
-                            dh_ctype(t3)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5), \
-                            dh_ctype(t6)) DEF_HELPER_ATTR;
-
-#define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
-                            dh_ctype(t7)) DEF_HELPER_ATTR;
-
-#define IN_HELPER_PROTO
-
-#include "helper.h"
-#include "accel/tcg/tcg-runtime.h"
-#include "accel/tcg/plugin-helpers.h"
-
-#undef IN_HELPER_PROTO
-
-#undef DEF_HELPER_FLAGS_0
-#undef DEF_HELPER_FLAGS_1
-#undef DEF_HELPER_FLAGS_2
-#undef DEF_HELPER_FLAGS_3
-#undef DEF_HELPER_FLAGS_4
-#undef DEF_HELPER_FLAGS_5
-#undef DEF_HELPER_FLAGS_6
-#undef DEF_HELPER_FLAGS_7
-#undef DEF_HELPER_ATTR
+#define HELPER_H "helper.h"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
 
 #endif /* HELPER_PROTO_H */
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index f6f05469c5..be382bbf77 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -9,7 +9,7 @@
 #define TCG_TCG_OP_COMMON_H
 
 #include "tcg/tcg.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 #include "exec/helper-gen-common.h"
 
 /* Basic output routines.  Not for general consumption.  */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 7d3cd877ff..207da51772 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -29,7 +29,7 @@
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
 #include "exec/translate-all.h"
@@ -41,7 +41,6 @@
 #endif
 #include "tcg/tcg-ldst.h"
 #include "tcg/oversized-guest.h"
-#include "exec/helper-proto.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 802aa459bc..36dc1ea39c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -49,7 +49,7 @@
 #include "exec/exec-all.h"
 #include "exec/plugin-gen.h"
 #include "exec/translator.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 
 #define HELPER_H  "accel/tcg/plugin-helpers.h"
 #include "exec/helper-info.c.inc"
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index 97399493d5..6c99f952ca 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 #include "tcg/tcg-gvec-desc.h"
 
 
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 14b59a36e5..9fa539ad3d 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
+#include "exec/helper-proto-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "disas/disas.h"
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ce50531dff..379f266256 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -35,6 +35,7 @@
 #include "translate.h"
 #include "translate-a32.h"
 #include "exec/gen-icount.h"
+#include "exec/helper-proto.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index c1eff55c9e..8fb5c38a4e 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -21,6 +21,7 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "exec/helper-gen.h"
+#include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
diff --git a/include/exec/helper-proto.h.inc b/include/exec/helper-proto.h.inc
new file mode 100644
index 0000000000..f6f0cfcacd
--- /dev/null
+++ b/include/exec/helper-proto.h.inc
@@ -0,0 +1,67 @@
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one expands prototypes for the helper functions.
+ * Define HELPER_H for the header file to be expanded.
+ */
+
+#include "exec/helper-head.h"
+
+/*
+ * Work around an issue with --enable-lto, in which GCC's ipa-split pass
+ * decides to split out the noreturn code paths that raise an exception,
+ * taking the __builtin_return_address() along into the new function,
+ * where it no longer computes a value that returns to TCG generated code.
+ * Despite the name, the noinline attribute affects splitter, so this
+ * prevents the optimization in question.  Given that helpers should not
+ * otherwise be called directly, this should have any other visible effect.
+ *
+ * See https://gitlab.com/qemu-project/qemu/-/issues/1454
+ */
+#define DEF_HELPER_ATTR  __attribute__((noinline))
+
+#define DEF_HELPER_FLAGS_0(name, flags, ret) \
+dh_ctype(ret) HELPER(name) (void) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_1(name, flags, ret, t1) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), \
+                            dh_ctype(t3)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
+                            dh_ctype(t4)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
+                            dh_ctype(t4), dh_ctype(t5)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
+                            dh_ctype(t4), dh_ctype(t5), \
+                            dh_ctype(t6)) DEF_HELPER_ATTR;
+
+#define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7) \
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
+                            dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
+                            dh_ctype(t7)) DEF_HELPER_ATTR;
+
+#define IN_HELPER_PROTO
+
+#include HELPER_H
+
+#undef IN_HELPER_PROTO
+
+#undef DEF_HELPER_FLAGS_0
+#undef DEF_HELPER_FLAGS_1
+#undef DEF_HELPER_FLAGS_2
+#undef DEF_HELPER_FLAGS_3
+#undef DEF_HELPER_FLAGS_4
+#undef DEF_HELPER_FLAGS_5
+#undef DEF_HELPER_FLAGS_6
+#undef DEF_HELPER_FLAGS_7
+#undef DEF_HELPER_ATTR
-- 
2.34.1


