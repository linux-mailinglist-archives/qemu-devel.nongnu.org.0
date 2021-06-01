Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C95397672
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:22:32 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Dv-0005NV-8D
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tz-0002d5-Rt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:56 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5to-0002kC-RA
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:55 -0400
Received: by mail-io1-xd33.google.com with SMTP id z24so15644711ioi.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=APNxwyn+SOCNhTn6sZcrE1IfW/qdMLVYwisrSdWE+FY=;
 b=ICTITf+dliAEYDpc414trLyZOxpHm8o5hNXbdRmE1zrTYi2Ci4hG0Uz46rUVdZVlPB
 RrolNvIBJUM8CC73f1VGqHjenLgz3Wnd+wH/owwO3iVq80xlIIA62qTm3sNieekrilVX
 apVjrBHrfI7leikSZIKYMy426KKjutQ07VDnVvm4MK2Uoahe4rYRbQnkdbkw2LTaTI9P
 dHUUMSgJswCrWHr8i03pDwtNkcSD44oxy3ghrmMXs3ZasuQbmdTmUNecw39f8Mo0y/nk
 OhzMkdsUMlc8iWGO7TolNur8BjlMFHtD9Ag9OwPgGeR4XWoQyhbUegOOuxsAH3I8/1w0
 4sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=APNxwyn+SOCNhTn6sZcrE1IfW/qdMLVYwisrSdWE+FY=;
 b=sViC4COE1UeupZEAdceREr7NVX4Os2PzQcvRzULYgWvYHo8IyXZ5fxovp8ax4/NvCV
 h2adwQ9Tmx9b++zn7F5RLZ9G9aJyeIL0PqS0qQdg/ovxvNoKpnIGgukwpAwC1defswY6
 nNtKlqWe7h16Dq7NzPurlEL/1SjpnLVcUthuNpBWqPoCca/a/6kVJ6+eJwxeYFb67Izu
 uxqhTPD/uWGLjYCkE4x8BRQeXS1zOStgwx8IS+RwvJ18g0lt6TNb/GUrGLIZ7DbLNNjM
 M8X6XRNR700HcbhlprEGzuXbzF/yDfwIwHhycZsu32BLpFCmalFjHjz0OMVbQEprIx3+
 D1Cw==
X-Gm-Message-State: AOAM530nnTB+IPXCjgDfO6cHtBhmunm4GgF4PVREUpbEMXaiuRBIulpm
 Ecmzq2JoaKpZX6ijf5aharF9HV7cs+nTjC1E
X-Google-Smtp-Source: ABdhPJzTeTMuYAiR2Fhg5eKcIH4inKcr8UEK7qS9+x26F2vIs0JFCFBmRnra52xXxt5d3g67livkng==
X-Received: by 2002:a05:6638:191f:: with SMTP id
 p31mr10297266jal.117.1622559699827; 
 Tue, 01 Jun 2021 08:01:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/27] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
Date: Tue,  1 Jun 2021 08:01:02 -0700
Message-Id: <20210601150106.12761-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can share this code between 32-bit and 64-bit loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 183 +++++++++++++++++++++---------------------------------
 1 file changed, 71 insertions(+), 112 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index eb9b1ab463..36558210a1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -315,6 +315,73 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #define qemu_st_beq(X) \
     cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
 
+static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
+                            TCGMemOpIdx oi, const void *tb_ptr)
+{
+    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+
+    switch (mop) {
+    case MO_UB:
+        return qemu_ld_ub;
+    case MO_SB:
+        return (int8_t)qemu_ld_ub;
+    case MO_LEUW:
+        return qemu_ld_leuw;
+    case MO_LESW:
+        return (int16_t)qemu_ld_leuw;
+    case MO_LEUL:
+        return qemu_ld_leul;
+    case MO_LESL:
+        return (int32_t)qemu_ld_leul;
+    case MO_LEQ:
+        return qemu_ld_leq;
+    case MO_BEUW:
+        return qemu_ld_beuw;
+    case MO_BESW:
+        return (int16_t)qemu_ld_beuw;
+    case MO_BEUL:
+        return qemu_ld_beul;
+    case MO_BESL:
+        return (int32_t)qemu_ld_beul;
+    case MO_BEQ:
+        return qemu_ld_beq;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
+                        TCGMemOpIdx oi, const void *tb_ptr)
+{
+    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+
+    switch (mop) {
+    case MO_UB:
+        qemu_st_b(val);
+        break;
+    case MO_LEUW:
+        qemu_st_lew(val);
+        break;
+    case MO_LEUL:
+        qemu_st_lel(val);
+        break;
+    case MO_LEQ:
+        qemu_st_leq(val);
+        break;
+    case MO_BEUW:
+        qemu_st_bew(val);
+        break;
+    case MO_BEUL:
+        qemu_st_bel(val);
+        break;
+    case MO_BEQ:
+        qemu_st_beq(val);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #if TCG_TARGET_REG_BITS == 64
 # define CASE_32_64(x) \
         case glue(glue(INDEX_op_, x), _i64): \
@@ -907,34 +974,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
-            case MO_UB:
-                tmp32 = qemu_ld_ub;
-                break;
-            case MO_SB:
-                tmp32 = (int8_t)qemu_ld_ub;
-                break;
-            case MO_LEUW:
-                tmp32 = qemu_ld_leuw;
-                break;
-            case MO_LESW:
-                tmp32 = (int16_t)qemu_ld_leuw;
-                break;
-            case MO_LEUL:
-                tmp32 = qemu_ld_leul;
-                break;
-            case MO_BEUW:
-                tmp32 = qemu_ld_beuw;
-                break;
-            case MO_BESW:
-                tmp32 = (int16_t)qemu_ld_beuw;
-                break;
-            case MO_BEUL:
-                tmp32 = qemu_ld_beul;
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tmp32 = tci_qemu_ld(env, taddr, oi, tb_ptr);
             regs[r0] = tmp32;
             break;
 
@@ -950,46 +990,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 taddr = tci_uint64(regs[r3], regs[r2]);
                 oi = regs[r4];
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
-            case MO_UB:
-                tmp64 = qemu_ld_ub;
-                break;
-            case MO_SB:
-                tmp64 = (int8_t)qemu_ld_ub;
-                break;
-            case MO_LEUW:
-                tmp64 = qemu_ld_leuw;
-                break;
-            case MO_LESW:
-                tmp64 = (int16_t)qemu_ld_leuw;
-                break;
-            case MO_LEUL:
-                tmp64 = qemu_ld_leul;
-                break;
-            case MO_LESL:
-                tmp64 = (int32_t)qemu_ld_leul;
-                break;
-            case MO_LEQ:
-                tmp64 = qemu_ld_leq;
-                break;
-            case MO_BEUW:
-                tmp64 = qemu_ld_beuw;
-                break;
-            case MO_BESW:
-                tmp64 = (int16_t)qemu_ld_beuw;
-                break;
-            case MO_BEUL:
-                tmp64 = qemu_ld_beul;
-                break;
-            case MO_BESL:
-                tmp64 = (int32_t)qemu_ld_beul;
-                break;
-            case MO_BEQ:
-                tmp64 = qemu_ld_beq;
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tmp64 = tci_qemu_ld(env, taddr, oi, tb_ptr);
             if (TCG_TARGET_REG_BITS == 32) {
                 tci_write_reg64(regs, r1, r0, tmp64);
             } else {
@@ -1006,25 +1007,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
             tmp32 = regs[r0];
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
-            case MO_UB:
-                qemu_st_b(tmp32);
-                break;
-            case MO_LEUW:
-                qemu_st_lew(tmp32);
-                break;
-            case MO_LEUL:
-                qemu_st_lel(tmp32);
-                break;
-            case MO_BEUW:
-                qemu_st_bew(tmp32);
-                break;
-            case MO_BEUL:
-                qemu_st_bel(tmp32);
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tci_qemu_st(env, taddr, tmp32, oi, tb_ptr);
             break;
 
         case INDEX_op_qemu_st_i64:
@@ -1043,31 +1026,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 }
                 tmp64 = tci_uint64(regs[r1], regs[r0]);
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
-            case MO_UB:
-                qemu_st_b(tmp64);
-                break;
-            case MO_LEUW:
-                qemu_st_lew(tmp64);
-                break;
-            case MO_LEUL:
-                qemu_st_lel(tmp64);
-                break;
-            case MO_LEQ:
-                qemu_st_leq(tmp64);
-                break;
-            case MO_BEUW:
-                qemu_st_bew(tmp64);
-                break;
-            case MO_BEUL:
-                qemu_st_bel(tmp64);
-                break;
-            case MO_BEQ:
-                qemu_st_beq(tmp64);
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tci_qemu_st(env, taddr, tmp64, oi, tb_ptr);
             break;
 
         case INDEX_op_mb:
-- 
2.25.1


