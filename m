Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BB5415DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:43:18 +0200 (CEST)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg2n-00009G-Eg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftH-0007gX-7P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:27 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftB-0007Fu-CG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso14595086pjb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4rHpbD5Ee0Gqq7jh/rhx4dfJgd9LnpoppwR09o1CsY=;
 b=tdMBZUC2+4GoI7c+aGmgfzgEQf+8lUH9yat8svm0wK6ChLFtKKZLTQwh043JhUNrzI
 TEfZ2jeQVIUPbVJq7GhJ5PkOSN33XkXiFwsx1SCFvXlA3Shex6aaoA00cJ55TlttIwYB
 oa9BcRuLTAOkNPt+kyUpIqK3F+n6sqX3HkA2A9ngMsgazNAtCGfeZKHdPiCfKsZLUmj3
 WCAOJ9poMcsK/D+jjIvH3Y/7i7kPOt3vozNkEIO0VQtWD2lQ9CwizU6sdE7f6XMvz+z0
 JDhjMZ0xdsz9EfUe4ofE8lBEJBQaFMo7y61Q/ldlca8qw7N61bqKPr7bbxhVHb5yDo+P
 72cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4rHpbD5Ee0Gqq7jh/rhx4dfJgd9LnpoppwR09o1CsY=;
 b=a2T6VXVIf2n1pOCOopbbq+JpKG+VFc6jvXMZYGSaPqb3Rlig33Qmn+tGidfZwdQQ75
 f5ryAY8jPocLG7G8x/ODaFa7hmhQkrGgeUJ+dzhY2Wf9mk7Vf0Vz0p/ojDWlC5UuPm45
 9t1lnI3uQC3THAU6sLxGs1geJ4dHGQRnd2zLt+ElKqrl4bBG/zLbtti8K8MR6z6se9nV
 Bi5hPu3M5n1zOHLpaeUaHniVFkrThHcF9u2MspjyvJOq1xP8XuilUmTi04DIwhmK5N8A
 W0lvBN9Fukac3jKBATtyttaKmx2JEMmE5Tk1qLHMMz38MaX7bJHvSZJlQ1pJWEn9A8hT
 gn+A==
X-Gm-Message-State: AOAM530XHlLo4U2Gw+mAufkfFRAQIP6kL0lOiTszB8s8p9LX3bQZPCzh
 twPQpz8zm8+aTh9G8/lArXFFenxRfHi4LQ==
X-Google-Smtp-Source: ABdhPJxY/FjjnU6bTlKiO/ZoDAuuAjzlCgHa781qIvFPUrvvucunU7mzRtcdOUnarT9u7I9ZGrrIaQ==
X-Received: by 2002:a17:903:1c8:b0:167:67ff:323d with SMTP id
 e8-20020a17090301c800b0016767ff323dmr17055776plh.22.1654633999510; 
 Tue, 07 Jun 2022 13:33:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 13/71] target/arm: Split out load/store primitives to
 sve_ldst_internal.h
Date: Tue,  7 Jun 2022 13:32:08 -0700
Message-Id: <20220607203306.657998-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin creation of sve_ldst_internal.h by moving the primitives
that access host and tlb memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_ldst_internal.h | 127 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c        | 107 +--------------------------
 2 files changed, 128 insertions(+), 106 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h

diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
new file mode 100644
index 0000000000..ef9117e84c
--- /dev/null
+++ b/target/arm/sve_ldst_internal.h
@@ -0,0 +1,127 @@
+/*
+ * ARM SVE Load/Store Helpers
+ *
+ * Copyright (c) 2018-2022 Linaro
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
+#ifndef TARGET_ARM_SVE_LDST_INTERNAL_H
+#define TARGET_ARM_SVE_LDST_INTERNAL_H
+
+#include "exec/cpu_ldst.h"
+
+/*
+ * Load one element into @vd + @reg_off from @host.
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
+
+/*
+ * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
+                              target_ulong vaddr, uintptr_t retaddr);
+
+/*
+ * Generate the above primitives.
+ */
+
+#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = HOST(host); *(TYPEE *)(vd + H(reg_off)) = val; }
+
+#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = *(TYPEE *)(vd + H(reg_off)); HOST(host, val); }
+
+#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = TLB(env, useronly_clean_ptr(addr), ra);                    \
+    *(TYPEE *)(vd + H(reg_off)) = val;                                     \
+}
+
+#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = *(TYPEE *)(vd + H(reg_off));                               \
+    TLB(env, useronly_clean_ptr(addr), val, ra);                           \
+}
+
+#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
+    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
+    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
+
+DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
+DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
+DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
+DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
+DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
+DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
+DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
+
+#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
+    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
+    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
+
+DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
+DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
+DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
+DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
+
+#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
+    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
+    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
+    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
+    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
+
+#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
+    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
+    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
+    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
+    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
+
+DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
+DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
+DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
+DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
+DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
+
+DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
+DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
+DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
+
+DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
+DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
+DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
+
+DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
+DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
+
+DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
+DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
+
+#undef DO_LD_TLB
+#undef DO_ST_TLB
+#undef DO_LD_HOST
+#undef DO_LD_PRIM_1
+#undef DO_ST_PRIM_1
+#undef DO_LD_PRIM_2
+#undef DO_ST_PRIM_2
+
+#endif /* TARGET_ARM_SVE_LDST_INTERNAL_H */
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3bdcd4ce9d..0c6dde00aa 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -21,12 +21,12 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
 #include "vec_internal.h"
+#include "sve_ldst_internal.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
@@ -5301,111 +5301,6 @@ void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
  * Load contiguous data, protected by a governing predicate.
  */
 
-/*
- * Load one element into @vd + @reg_off from @host.
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
-
-/*
- * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
-                              target_ulong vaddr, uintptr_t retaddr);
-
-/*
- * Generate the above primitives.
- */
-
-#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{                                                                      \
-    TYPEM val = HOST(host);                                            \
-    *(TYPEE *)(vd + H(reg_off)) = val;                                 \
-}
-
-#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{ HOST(host, (TYPEM)*(TYPEE *)(vd + H(reg_off))); }
-
-#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    *(TYPEE *)(vd + H(reg_off)) =                                           \
-        (TYPEM)TLB(env, useronly_clean_ptr(addr), ra);                      \
-}
-
-#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    TLB(env, useronly_clean_ptr(addr),                                      \
-        (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                            \
-}
-
-#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
-    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
-    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
-
-DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
-DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
-DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
-DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
-DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
-DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
-DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
-
-#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
-    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
-    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
-
-DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
-DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
-DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
-DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
-
-#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
-    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
-    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
-    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
-    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
-
-#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
-    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
-    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
-    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
-    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
-
-DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
-DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
-DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
-DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
-DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
-
-DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
-DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
-DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
-
-DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
-DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
-DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
-
-DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
-DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
-
-DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
-DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
-
-#undef DO_LD_TLB
-#undef DO_ST_TLB
-#undef DO_LD_HOST
-#undef DO_LD_PRIM_1
-#undef DO_ST_PRIM_1
-#undef DO_LD_PRIM_2
-#undef DO_ST_PRIM_2
-
 /*
  * Skip through a sequence of inactive elements in the guarding predicate @vg,
  * beginning at @reg_off bounded by @reg_max.  Return the offset of the active
-- 
2.34.1


