Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8279C6F51F3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:40:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tg-0004yw-NS; Wed, 03 May 2023 03:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0004OZ-8q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tN-0005dk-L6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29320565e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098832; x=1685690832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHIV1x80MQi9VIzKztAv6bCrxSYd5fIk3YaQuzcgVB4=;
 b=VMm+c3o0dKAUU3qTdaeCbdth1/SUOo6wyi+HufJBbZ39zVj848X9wPDqYudGCgBiJ3
 NbjNtD8c2ZRs8iBBC7vekxjG+2B+YFJw+FXfZ2U2EF+oMhWT62619XynBNfdFcsGEWta
 az5eF1zcb3kxXgP4PWvKpRlmNksnhBhIrvYHQ1OjgCbssVjnCS1bE47tSXrwnbdk92Ic
 lNgwVmpaRzyHLQZqVxrV1kxcmpjHd27CKyVIxZJ2i2MO5XyIw3q9FQlJwir+GGtq+NHK
 VrqB5WhGZ7zmjVm89+hv9CE42Xc+LFZafRZExg8a0sNQKp9BfFO6hPFReFE23zPGUvyv
 U1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098832; x=1685690832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHIV1x80MQi9VIzKztAv6bCrxSYd5fIk3YaQuzcgVB4=;
 b=N4DaVNduwnUAOIIUJyb3ySocoHJrcdID0qhVL9nMKgjWsklUET/nc9GiePwV2PNvKP
 LPPzd9BpIgAuShDUs6GrKmGLrLj4uQw8Ed1+znAYeI7hs8xuKYN37MCiMeldNv233iR8
 mHFrhFSdi+ndAErZnocccveyOQusEL0O1zEBgfJ/pj+sN2C+f5XWp7lBGPPJsiYfRwvj
 LO41L6F6ii3Xnk4EV8L8IixPpuhy8qMWehGy1VSq+r/SeIuxGHMAlqQxs49tsSsqT8yn
 lEKEen9bACEAO9v4WtJqkm9qNGl8r3gOoabmQLOSteylrzV536jn3PqsH/Ay0D4NTzDz
 Uu+Q==
X-Gm-Message-State: AC+VfDzazb0hmqeA1VBmUm9W2csoUygxkTLmRmqeZx1qv3uCxTAqRzd7
 k/wN28xFsVjxWesylS65gz8JJNindn3SMoRDO05lgg==
X-Google-Smtp-Source: ACHHUZ44jaJ2+dF/+BU+MwaYtOCsqt+bFYGNqPvemA5ULKDvC9pLf6o8SsYnQZ1nwQYrrkceTD2DfQ==
X-Received: by 2002:a7b:cb89:0:b0:3ed:a80e:6dfa with SMTP id
 m9-20020a7bcb89000000b003eda80e6dfamr13482740wmi.40.1683098832018; 
 Wed, 03 May 2023 00:27:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 52/84] tcg: Split helper-gen.h
Date: Wed,  3 May 2023 08:22:59 +0100
Message-Id: <20230503072331.1747057-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Create helper-gen-common.h without the target specific portion.
Use that in tcg-op-common.h.  Reorg headers in target/arm to
ensure that helper-gen.h is included before helper-info.c.inc.
All other targets are already correct in this regard.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-gen-common.h |  17 ++++++
 include/exec/helper-gen.h        | 101 ++-----------------------------
 include/tcg/tcg-op-common.h      |   2 +-
 target/arm/tcg/translate.c       |   8 +--
 include/exec/helper-gen.h.inc    | 101 +++++++++++++++++++++++++++++++
 5 files changed, 126 insertions(+), 103 deletions(-)
 create mode 100644 include/exec/helper-gen-common.h
 create mode 100644 include/exec/helper-gen.h.inc

diff --git a/include/exec/helper-gen-common.h b/include/exec/helper-gen-common.h
new file mode 100644
index 0000000000..cb01ed49c5
--- /dev/null
+++ b/include/exec/helper-gen-common.h
@@ -0,0 +1,17 @@
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one expands generation functions for tcg opcodes.
+ */
+
+#ifndef HELPER_GEN_COMMON_H
+#define HELPER_GEN_COMMON_H
+
+#define HELPER_H "accel/tcg/tcg-runtime.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
+#define HELPER_H "accel/tcg/plugin-helpers.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
+#endif /* HELPER_GEN_COMMON_H */
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index 7c93ef70bc..ca88e07182 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -1,108 +1,15 @@
 /*
  * Helper file for declaring TCG helper functions.
  * This one expands generation functions for tcg opcodes.
- * Define HELPER_H for the header file to be expanded,
- * and static inline to change from global file scope.
  */
 
 #ifndef HELPER_GEN_H
 #define HELPER_GEN_H
 
-#include "tcg/tcg.h"
-#include "tcg/helper-info.h"
-#include "exec/helper-head.h"
+#include "exec/helper-gen-common.h"
 
-#define DEF_HELPER_FLAGS_0(name, flags, ret)                            \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl0(ret))        \
-{                                                                       \
-    tcg_gen_call0(&glue(helper_info_, name), dh_retvar(ret));           \
-}
-
-#define DEF_HELPER_FLAGS_1(name, flags, ret, t1)                        \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1))                                                 \
-{                                                                       \
-    tcg_gen_call1(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1));                                       \
-}
-
-#define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2)                    \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2))                             \
-{                                                                       \
-    tcg_gen_call2(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2));                        \
-}
-
-#define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3)                \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3))         \
-{                                                                       \
-    tcg_gen_call3(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3));         \
-}
-
-#define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4)            \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2),                             \
-    dh_arg_decl(t3, 3), dh_arg_decl(t4, 4))                             \
-{                                                                       \
-    tcg_gen_call4(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2),                         \
-                  dh_arg(t3, 3), dh_arg(t4, 4));                        \
-}
-
-#define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5)        \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
-    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5))                             \
-{                                                                       \
-    tcg_gen_call5(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
-                  dh_arg(t4, 4), dh_arg(t5, 5));                        \
-}
-
-#define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6)    \
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
-    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6))         \
-{                                                                       \
-    tcg_gen_call6(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
-                  dh_arg(t4, 4), dh_arg(t5, 5), dh_arg(t6, 6));         \
-}
-
-#define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7)\
-extern TCGHelperInfo glue(helper_info_, name);                          \
-static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
-    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
-    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6),         \
-    dh_arg_decl(t7, 7))                                                 \
-{                                                                       \
-    tcg_gen_call7(&glue(helper_info_, name), dh_retvar(ret),            \
-                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
-                  dh_arg(t4, 4), dh_arg(t5, 5), dh_arg(t6, 6),          \
-                  dh_arg(t7, 7));                                       \
-}
-
-#include "helper.h"
-#include "accel/tcg/tcg-runtime.h"
-#include "accel/tcg/plugin-helpers.h"
-
-#undef DEF_HELPER_FLAGS_0
-#undef DEF_HELPER_FLAGS_1
-#undef DEF_HELPER_FLAGS_2
-#undef DEF_HELPER_FLAGS_3
-#undef DEF_HELPER_FLAGS_4
-#undef DEF_HELPER_FLAGS_5
-#undef DEF_HELPER_FLAGS_6
-#undef DEF_HELPER_FLAGS_7
+#define HELPER_H "helper.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
 
 #endif /* HELPER_GEN_H */
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index 04a9ca1fc6..f6f05469c5 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -10,7 +10,7 @@
 
 #include "tcg/tcg.h"
 #include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
+#include "exec/helper-gen-common.h"
 
 /* Basic output routines.  Not for general consumption.  */
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 4d84850d74..ce50531dff 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -32,6 +32,9 @@
 #include "semihosting/semihost.h"
 #include "exec/log.h"
 #include "cpregs.h"
+#include "translate.h"
+#include "translate-a32.h"
+#include "exec/gen-icount.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
@@ -48,9 +51,6 @@
 #define ENABLE_ARCH_7     arm_dc_feature(s, ARM_FEATURE_V7)
 #define ENABLE_ARCH_8     arm_dc_feature(s, ARM_FEATURE_V8)
 
-#include "translate.h"
-#include "translate-a32.h"
-
 /* These are TCG temporaries used only by the legacy iwMMXt decoder */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 /* These are TCG globals which alias CPUARMState fields */
@@ -59,8 +59,6 @@ TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
 
-#include "exec/gen-icount.h"
-
 static const char * const regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
diff --git a/include/exec/helper-gen.h.inc b/include/exec/helper-gen.h.inc
new file mode 100644
index 0000000000..83bfa5b23f
--- /dev/null
+++ b/include/exec/helper-gen.h.inc
@@ -0,0 +1,101 @@
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one expands generation functions for tcg opcodes.
+ * Define HELPER_H for the header file to be expanded,
+ * and static inline to change from global file scope.
+ */
+
+#include "tcg/tcg.h"
+#include "tcg/helper-info.h"
+#include "exec/helper-head.h"
+
+#define DEF_HELPER_FLAGS_0(name, flags, ret)                            \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl0(ret))        \
+{                                                                       \
+    tcg_gen_call0(&glue(helper_info_, name), dh_retvar(ret));           \
+}
+
+#define DEF_HELPER_FLAGS_1(name, flags, ret, t1)                        \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1))                                                 \
+{                                                                       \
+    tcg_gen_call1(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1));                                       \
+}
+
+#define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2)                    \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2))                             \
+{                                                                       \
+    tcg_gen_call2(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2));                        \
+}
+
+#define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3)                \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3))         \
+{                                                                       \
+    tcg_gen_call3(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3));         \
+}
+
+#define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4)            \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2),                             \
+    dh_arg_decl(t3, 3), dh_arg_decl(t4, 4))                             \
+{                                                                       \
+    tcg_gen_call4(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2),                         \
+                  dh_arg(t3, 3), dh_arg(t4, 4));                        \
+}
+
+#define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5)        \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
+    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5))                             \
+{                                                                       \
+    tcg_gen_call5(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
+                  dh_arg(t4, 4), dh_arg(t5, 5));                        \
+}
+
+#define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6)    \
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
+    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6))         \
+{                                                                       \
+    tcg_gen_call6(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
+                  dh_arg(t4, 4), dh_arg(t5, 5), dh_arg(t6, 6));         \
+}
+
+#define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7)\
+extern TCGHelperInfo glue(helper_info_, name);                          \
+static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
+    dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
+    dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6),         \
+    dh_arg_decl(t7, 7))                                                 \
+{                                                                       \
+    tcg_gen_call7(&glue(helper_info_, name), dh_retvar(ret),            \
+                  dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
+                  dh_arg(t4, 4), dh_arg(t5, 5), dh_arg(t6, 6),          \
+                  dh_arg(t7, 7));                                       \
+}
+
+#include HELPER_H
+
+#undef DEF_HELPER_FLAGS_0
+#undef DEF_HELPER_FLAGS_1
+#undef DEF_HELPER_FLAGS_2
+#undef DEF_HELPER_FLAGS_3
+#undef DEF_HELPER_FLAGS_4
+#undef DEF_HELPER_FLAGS_5
+#undef DEF_HELPER_FLAGS_6
+#undef DEF_HELPER_FLAGS_7
-- 
2.34.1


