Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF5542C8B7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:33:04 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj3n-0001Xk-BY
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu6-0004Gd-Bd
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:23:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu3-00038w-GP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:23:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id 21so2386467plo.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INby5Ty0QNa/n9lUmBDAx1irZEcQEUrI7v6tJBuf6ho=;
 b=T3XnN9B1RsrDodhgwXPGRkUSZYRc9dlKyZyuTu2YDYHy0z9pf/rM+ug/B94NhV7qXa
 FaDaRySGpxs+A7EZ1dKK0hJheygDgFRB/mf4/I9cEFrzrVNKJTWhZW3tAT/EInXsSLkz
 zDAtqTFqpCNqZV5TMUAFW14BPQArQ+y+zIooiycwcnIYuARZaDn5ImmDMIhid/t2z4AO
 BA4NDCAsC0EzgqH75I1OP19BsXhhv20haucUaoBd7Il5aByAfFhq7wjIghsbaopvWdgk
 12JkjcyzTS+XhCGEomTbYn8By1bnlV50/kQWDddT3Dj2lYhs47CudjBTffPpCgB8fRdC
 4d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INby5Ty0QNa/n9lUmBDAx1irZEcQEUrI7v6tJBuf6ho=;
 b=H5nFZx9DLFPI2ySJOsJNJJ24ygqs6WTcGpiMD/n83i1ktkR00gd30rOBzLZ5cvusJW
 +N+qYZxLfUTuwFdIkFZAHEgeeu09/XtIjvfQz8c8dz9KhlfigWbXjQuLgcGuwFoOnBOX
 1MU/jdzQScuy4f5w+w09BZJCU+rBuBWvPGpYLWA9CYv4Pm5egnmOtFfmIwMMRqCeHqzX
 TYjLJhImEzetcY9LXue4px8hoACA9u3FI8Vlu4dUMvPZGpcIDKElPYlfrhOiSX6gfF6y
 FFlsIJCHg3l8zRYc8GqbhhHes1+Ot8LklzXeH9Scwyv7IwQCTBzwJ9VqfFu34l5Z//Dc
 tDCw==
X-Gm-Message-State: AOAM530jwqHp/yW8gHH743JoKYSU6XF5BILpriYr+GK2Uf07BUPg1aTa
 HLFf9Us8sznHerepS354JojsVu8vs61tug==
X-Google-Smtp-Source: ABdhPJyguXEwUOpPhsA6ncOg3dqVV+0aemvFz0rcOLa7MqNMFOqVZWBGwvIMvgptLD+02nDniF+JVA==
X-Received: by 2002:a17:90a:4207:: with SMTP id
 o7mr933539pjg.192.1634149378054; 
 Wed, 13 Oct 2021 11:22:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
Date: Wed, 13 Oct 2021 11:22:38 -0700
Message-Id: <20211013182239.991127-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions have been replaced by cpu_*_mmu as the
most proper interface to use from target code.

Hide these declarations from code that should not use them.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 74 ++++++++++++++++++++++++++++++++++++++++++
 include/tcg/tcg.h      | 71 ----------------------------------------
 accel/tcg/cputlb.c     |  1 +
 tcg/tcg.c              |  1 +
 tcg/tci.c              |  1 +
 5 files changed, 77 insertions(+), 71 deletions(-)
 create mode 100644 include/tcg/tcg-ldst.h

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
new file mode 100644
index 0000000000..8c86365611
--- /dev/null
+++ b/include/tcg/tcg-ldst.h
@@ -0,0 +1,74 @@
+/*
+ * Memory helpers that will be used by TCG generated code.
+ *
+ * Copyright (c) 2008 Fabrice Bellard
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
+#ifndef TCG_LDST_H
+#define TCG_LDST_H 1
+
+#ifdef CONFIG_SOFTMMU
+
+/* Value zero-extended to tcg register size.  */
+tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                     MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
+                           MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
+                           MemOpIdx oi, uintptr_t retaddr);
+
+/* Value sign-extended to tcg register size.  */
+tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                     MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                    MemOpIdx oi, uintptr_t retaddr);
+
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                        MemOpIdx oi, uintptr_t retaddr);
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                       MemOpIdx oi, uintptr_t retaddr);
+
+#endif /* CONFIG_SOFTMMU */
+#endif /* TCG_LDST_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 83e38487cf..7069a401f1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1240,77 +1240,6 @@ uint64_t dup_const(unsigned vece, uint64_t c);
      :  (target_long)dup_const(VECE, C))
 #endif
 
-/*
- * Memory helpers that will be used by TCG generated code.
- */
-#ifdef CONFIG_SOFTMMU
-/* Value zero-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
-
-/* Value sign-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                        MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-
-/* Temporary aliases until backends are converted.  */
-#ifdef TARGET_WORDS_BIGENDIAN
-# define helper_ret_ldsw_mmu  helper_be_ldsw_mmu
-# define helper_ret_lduw_mmu  helper_be_lduw_mmu
-# define helper_ret_ldsl_mmu  helper_be_ldsl_mmu
-# define helper_ret_ldul_mmu  helper_be_ldul_mmu
-# define helper_ret_ldl_mmu   helper_be_ldul_mmu
-# define helper_ret_ldq_mmu   helper_be_ldq_mmu
-# define helper_ret_stw_mmu   helper_be_stw_mmu
-# define helper_ret_stl_mmu   helper_be_stl_mmu
-# define helper_ret_stq_mmu   helper_be_stq_mmu
-#else
-# define helper_ret_ldsw_mmu  helper_le_ldsw_mmu
-# define helper_ret_lduw_mmu  helper_le_lduw_mmu
-# define helper_ret_ldsl_mmu  helper_le_ldsl_mmu
-# define helper_ret_ldul_mmu  helper_le_ldul_mmu
-# define helper_ret_ldl_mmu   helper_le_ldul_mmu
-# define helper_ret_ldq_mmu   helper_le_ldq_mmu
-# define helper_ret_stw_mmu   helper_le_stw_mmu
-# define helper_ret_stl_mmu   helper_le_stl_mmu
-# define helper_ret_stq_mmu   helper_le_stq_mmu
-#endif
-#endif /* CONFIG_SOFTMMU */
-
 #ifdef CONFIG_DEBUG_TCG
 void tcg_assert_listed_vecop(TCGOpcode);
 #else
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b350cafa3d..b69a953447 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -39,6 +39,7 @@
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
 #endif
+#include "tcg/tcg-ldst.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
 /* #define DEBUG_TLB */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 658be0c6b6..024a22cf39 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -58,6 +58,7 @@
 
 #include "elf.h"
 #include "exec/log.h"
+#include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
 
 #ifdef CONFIG_TCG_INTERPRETER
diff --git a/tcg/tci.c b/tcg/tci.c
index 5c08dc0a9a..e76087ccac 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -22,6 +22,7 @@
 #include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-ldst.h"
 #include "qemu/compiler.h"
 #include <ffi.h>
 
-- 
2.25.1


