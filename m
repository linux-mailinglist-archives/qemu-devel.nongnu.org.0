Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2D2DB302
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:50:45 +0100 (CET)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpETE-0000q0-6d
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpER5-0007to-Gt
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:48:32 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:44868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpER2-0000jj-Ef
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:48:31 -0500
Received: by mail-ot1-x336.google.com with SMTP id f16so20190914otl.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/mRkHuCWI2jcgn+9ywRVxDn11F/WiYpDpR300/jUp8=;
 b=gEobVdRE/FQA+uf1sz7JtYj7tzEYCdvLkP3IkmSpG3r+2JcUVS6Eeaw+iBK2OpCNY5
 m7kEQaVPjGUSa/z8hlTFlcnOMkLkzkHFZv97ddNKHsefJ2ffMas9kOGpHZFG11ptol97
 1cIWqAkiPiMXCW/51t20H5mdn/8LH40ym+2p9nZPAvcvDbm7LYVAGyl+s5RdQ8YyirhX
 Rm4P7mk5ru9abLEguQuK4Xx/jp2YjLaJArogKL0K06vlpw9h7TCi3PSOi/iPsW7eN2Av
 N5sVnc6LCDj/XcTMA05eg/cSfoKZ+MH59KvweF1pcIsyjO7EiZD7OQRoWhXoCBJP1HUw
 gCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/mRkHuCWI2jcgn+9ywRVxDn11F/WiYpDpR300/jUp8=;
 b=d4ai52lf+XNnBAV9424rz1Fp1X7WYd2JqbfKplJwLrvDPBECOu9eVc+ME8/BMVGd7L
 B7+6XRfEExPfWi6/2k05ZTQUTtG8oremNQXHsjxymdjMhxhvCug5CkiCVpUrVfH4vvz2
 xQXb1RVvs0tM5EAoAhs82jUOWqMXVAQv08aAC9zfkSwMPxrKeUr/U16LArvZAVeXfJyM
 9ESOcpko4AQVc6XLJR86brV6xDKxpvBZ9Ml8uY75vUBxKLTZsp5QhlsbtMT+Yd19eS9Y
 wvwy+V/O5W6sSPvp1BVQPewlcQpeSgIYr7vZrCwOv7hM8lqchIAriJi7iUMIEpM2hOlZ
 Nl5Q==
X-Gm-Message-State: AOAM533VVRnlcOxdFJJJ6Xf4sIjY0GfdUMct9Zr0J4HBUdGfuDzkDIfd
 bgDuoQOvwuiD32g8MNzcnElFTCR6KNs4dd8T
X-Google-Smtp-Source: ABdhPJysJafHHfWyhjkX0ebhViENzwYzX3RE3VuIJezrABISznjSJNai4Xr6BoFlctHtIeD6Bl1WDA==
X-Received: by 2002:a9d:2941:: with SMTP id d59mr16349199otb.232.1608054506548; 
 Tue, 15 Dec 2020 09:48:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s23sm570392otr.59.2020.12.15.09.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:48:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Use memset for large vector byte replication
Date: Tue, 15 Dec 2020 11:48:24 -0600
Message-Id: <20201215174824.76017-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Cc: qemu-stable@nongnu.org
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
index ddbe06b71a..6c42d76f3a 100644
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
+        tcg_temp_free_ptr(t_ptr);
+        tcg_temp_free_ptr(t_size);
+        if (!in_32) {
+            tcg_temp_free_i32(t_val);
+        }
+        return;
+    }
+
     t_desc = tcg_const_i32(simd_desc(oprsz, maxsz, 0));
 
     if (vece == MO_64) {
-- 
2.25.1


