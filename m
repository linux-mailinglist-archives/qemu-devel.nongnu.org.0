Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6612E9C26
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:39:04 +0100 (CET)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTot-00064V-P0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlN-0003sP-8V
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:30 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlJ-0005yG-H5
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:25 -0500
Received: by mail-pl1-x631.google.com with SMTP id x12so14896053plr.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=syv5POQauWlsA/GaWvGPwJkQ5na4OEjJVqqBKvu8/Fw=;
 b=tB+dKXTI6oe6ldQxxCgTfUF6DTiISZ44bVnRYHmpW5PFJgYehfRHANDUsV4jN/Vg7r
 n1f2oNoz3dcC8ApitV0rFLwNhd00+/uS6mNoBoEP4k3XnhfNzGtSwTlvb5qdkONxPzUd
 4rCEVFe4/g+6rAVv/T9V8S/8Djz7DFvWpLCCuPFkYC7I4R9FwS+zGjfPhHcgJH68me1T
 BwpHkvYQIb9WcNi4kiRZh647SUAIUqv7H3i5Pn8ITyTAoUCtlRDs6iCCUlCeUy1Bm5YK
 +oZUh61UHzQEvb17rP6zGDiHC2bdUSsaoE/pV5Wjnm81tcamO9jRfjAXeMmXixHjNKwc
 uOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=syv5POQauWlsA/GaWvGPwJkQ5na4OEjJVqqBKvu8/Fw=;
 b=cdzRNbPsXpGLzptb7yBikr9S44raYJJeVwLvuNy1ErgZ9wClZ+yHVOjOiilvQYEj8Y
 FhSGM1a4ipA7s81k7HzGlQm04VXAKAPXWP/o1ewP2zM/70elCX7662+ZsPUfc99EIQ3+
 vMwI6wnxvhcUgE2IfqBe33OzuKI9ycw9bG77FULn579zIfHhYsCn1Si51G92JKTPzA1U
 meZTvK2zW0KbyP0VMjY8dUkaQYoiGI707b8fgYSUClSYUVW01Hs9ekXrDhyvnd7R4Hkc
 /ZZVG6fO41D1ajXRIgMEnAFp7JxOOVKGCSIr+Ef7vpBgtwQzC9d9//uM2RNY/Ia8ADTc
 Sk/Q==
X-Gm-Message-State: AOAM530bDrttUpAwitewloN3FkfaCluIIi1v63G9mY0DdK/cAiDQJbdL
 EtnF0CePICQL0HEnCOOwNmR72eNIFKMO3g==
X-Google-Smtp-Source: ABdhPJxqMoRgJtYOgoPYmjEMKmXa2n5qhB8+yvTKU0MAbObvOzWkUpkLqcWanN/yF7t+G4RwCClWsA==
X-Received: by 2002:a17:90a:4096:: with SMTP id
 l22mr30291130pjg.114.1609781719860; 
 Mon, 04 Jan 2021 09:35:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm50706933pfd.171.2021.01.04.09.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 09:35:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] tcg: Use memset for large vector byte replication
Date: Mon,  4 Jan 2021 07:35:13 -1000
Message-Id: <20210104173515.198921-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104173515.198921-1-richard.henderson@linaro.org>
References: <20210104173515.198921-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In f47db80cc07, we handled odd-sized tail clearing for
the case of hosts that have vector operations, but did
not handle the case of hosts that do not have vector ops.

This was ok until e2e7168a214b, which changed the encoding
of simd_desc such that the odd sizes are impossible.

Add memset as a tcg helper, and use that for all out-of-line
byte stores to vectors.  This includes, but is not limited to,
the tail clearing operation in question.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1907817
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h     | 11 +++++++++++
 include/exec/helper-proto.h |  4 ++++
 tcg/tcg-op-gvec.c           | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 4eda24e63a..2e36d6eb0c 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -28,6 +28,17 @@ DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env)
 
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
+#ifndef IN_HELPER_PROTO
+/*
+ * Pass calls to memset directly to libc, without a thunk in qemu.
+ * Do not re-declare memset, especially since we fudge the type here;
+ * we assume sizeof(void *) == sizeof(size_t), which is true for
+ * all supported hosts.
+ */
+#define helper_memset memset
+DEF_HELPER_FLAGS_3(memset, TCG_CALL_NO_RWG, ptr, ptr, int, ptr)
+#endif /* IN_HELPER_PROTO */
+
 #ifdef CONFIG_SOFTMMU
 
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index a0a8d9aa46..659f9298e8 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -35,11 +35,15 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
                             dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
                             dh_ctype(t7));
 
+#define IN_HELPER_PROTO
+
 #include "helper.h"
 #include "trace/generated-helpers.h"
 #include "tcg-runtime.h"
 #include "plugin-helpers.h"
 
+#undef IN_HELPER_PROTO
+
 #undef DEF_HELPER_FLAGS_0
 #undef DEF_HELPER_FLAGS_1
 #undef DEF_HELPER_FLAGS_2
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index ddbe06b71a..1a41dfa908 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -547,6 +547,9 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         in_c = dup_const(vece, in_c);
         if (in_c == 0) {
             oprsz = maxsz;
+            vece = MO_8;
+        } else if (in_c == dup_const(MO_8, in_c)) {
+            vece = MO_8;
         }
     }
 
@@ -628,6 +631,35 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
     /* Otherwise implement out of line.  */
     t_ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_ptr, cpu_env, dofs);
+
+    /*
+     * This may be expand_clr for the tail of an operation, e.g.
+     * oprsz == 8 && maxsz == 64.  The size of the clear is misaligned
+     * wrt simd_desc and will assert.  Simply pass all replicated byte
+     * stores through to memset.
+     */
+    if (oprsz == maxsz && vece == MO_8) {
+        TCGv_ptr t_size = tcg_const_ptr(oprsz);
+        TCGv_i32 t_val;
+
+        if (in_32) {
+            t_val = in_32;
+        } else if (in_64) {
+            t_val = tcg_temp_new_i32();
+            tcg_gen_extrl_i64_i32(t_val, in_64);
+        } else {
+            t_val = tcg_const_i32(in_c);
+        }
+        gen_helper_memset(t_ptr, t_ptr, t_val, t_size);
+
+        if (!in_32) {
+            tcg_temp_free_i32(t_val);
+        }
+        tcg_temp_free_ptr(t_size);
+        tcg_temp_free_ptr(t_ptr);
+        return;
+    }
+
     t_desc = tcg_const_i32(simd_desc(oprsz, maxsz, 0));
 
     if (vece == MO_64) {
-- 
2.25.1


