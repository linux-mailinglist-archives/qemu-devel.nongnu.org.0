Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B14337640
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:56:22 +0100 (CET)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMjd-0007Vb-5h
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUF-0003SN-IZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:27 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUD-0006Qe-8G
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:27 -0500
Received: by mail-qt1-x82d.google.com with SMTP id r14so1262430qtt.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cto0meToeqhl4dng/D5GTO+M9plTBCVNCtbljoyaQQ8=;
 b=hVZoQLATVz5KDqzQr+QxlFEHazpfyEYtOr1ikPMdPTW+6GlRcaf5U+nWXfbpesLs5W
 YUU95/OV1OS+WzsYfggc0X3+tx91+erv+C6nxq+nzZhd2kBRp1t8pet1IOrK28KE3be7
 fDJ5+fcEzNC3WNWaVePmUQtFDhEPXk2jtt6+YSoezAa45SDypG1Nv4FXrPKBOqxbR9se
 PcUkZWXy8pkkntXiPWOYA5GZEsSBTLPnJc1myuQlMZmnz2FZxjQ4unbZ9XF+OQfClobm
 0d0Dwdkv0Wb9Kbjw6e3t9toUMZxwhwF4gYY+WdHvO47oGLByQ64LrSLDqyaDFCT5qmvS
 r72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cto0meToeqhl4dng/D5GTO+M9plTBCVNCtbljoyaQQ8=;
 b=i5xOsBe0Tx93EThqfjsAMIlWRMawpPcvY4MSQOnT9BlJ4iuLB4M3UVJI7KBPAnJtq3
 5ytk3TURPosUanjskHUyccuDHmE4r4go7nHEfSmGU60G2qwA5lq+pVw3uvYSPpY2DPBi
 D6Gv3r/EVsh5TIvl+vzyDCh9jAL+/R8AE4EP90nrGklQ5NcfsU8Nv8s6szffsJq0lVq/
 /llyKYrJ9VqqrPgSSsQcX745DGGw/Lv8mTHrOrRvNLQnX2Ao1JeNY51XATuyK6lDqVhw
 kiT5lpMOdxuREkU6uuXIG3F3Jcq4nzbOSOkBmaljSvc/HXR1yPLYdGIwDeH3ungmvULB
 Kmgg==
X-Gm-Message-State: AOAM532ssW9M/2l0swGGrx05cIXMgj1Zfy4/o+Xa1cC8bVqq86tFuyp1
 XtLvPZ4p8KO+zTwyqi4Vxt+G3Fm71A3TEsgw
X-Google-Smtp-Source: ABdhPJzwU7pRq2GoAzx6yqlpn+qkcCHhCScH+cffCA8loGGkCA6Vv7218RyfJ6Sgtzn+JrKt2DjYnw==
X-Received: by 2002:ac8:4918:: with SMTP id e24mr7586433qtq.79.1615473623860; 
 Thu, 11 Mar 2021 06:40:23 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/57] tcg/tci: Hoist op_size checking into tci_args_*
Date: Thu, 11 Mar 2021 08:39:20 -0600
Message-Id: <20210311143958.562625-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This performs the size check while reading the arguments,
which means that we don't have to arrange for it to be
done after the operation.  Which tidies all of the branches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 14 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index f6cc5a3ab0..6b63beea28 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -24,7 +24,7 @@
 #if defined(CONFIG_DEBUG_TCG)
 # define tci_assert(cond) assert(cond)
 #else
-# define tci_assert(cond) ((void)0)
+# define tci_assert(cond) ((void)(cond))
 #endif
 
 #include "qemu-common.h"
@@ -135,146 +135,217 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void check_size(const uint8_t *start, const uint8_t **tb_ptr)
+{
+    const uint8_t *old_code_ptr = start - 2;
+    uint8_t op_size = old_code_ptr[1];
+    tci_assert(*tb_ptr == old_code_ptr + op_size);
+}
+
 static void tci_args_l(const uint8_t **tb_ptr, void **l0)
 {
+    const uint8_t *start = *tb_ptr;
+
     *l0 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_ri(const uint8_t **tb_ptr,
                         TCGReg *r0, tcg_target_ulong *i1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *i1 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 #if TCG_TARGET_REG_BITS == 64
 static void tci_args_rI(const uint8_t **tb_ptr,
                         TCGReg *r0, tcg_target_ulong *i1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *i1 = tci_read_i(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 #endif
 
 static void tci_args_rrm(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGMemOpIdx *m2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *m2 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *i2 = tci_read_s32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrcl(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *c2 = tci_read_b(tb_ptr);
     *l3 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *c3 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrm(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGMemOpIdx *m3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *m3 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, uint8_t *i3, uint8_t *i4)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *i3 = tci_read_b(tb_ptr);
     *i4 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrm(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, TCGReg *r3, TCGMemOpIdx *m4)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *m4 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 #if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *c4 = tci_read_b(tb_ptr);
     *l5 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *r4 = tci_read_r(tb_ptr);
     *r5 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 #endif
 
@@ -423,10 +494,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
-        uint8_t op_size = tb_ptr[1];
-        const uint8_t *old_code_ptr = tb_ptr;
-#endif
         TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
@@ -476,7 +543,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_br:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
@@ -629,9 +695,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i32:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare32(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
 #if TCG_TARGET_REG_BITS == 32
@@ -652,7 +716,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T1 = tci_uint64(regs[r1], regs[r0]);
             T2 = tci_uint64(regs[r3], regs[r2]);
             if (tci_compare64(T1, T2, condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
                 continue;
             }
@@ -786,9 +849,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i64:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare64(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
         case INDEX_op_ext32s_i64:
@@ -817,9 +878,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_goto_tb:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = *(void **)ptr;
-            continue;
+            break;
 
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
@@ -997,6 +1057,5 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         default:
             g_assert_not_reached();
         }
-        tci_assert(tb_ptr == old_code_ptr + op_size);
     }
 }
-- 
2.25.1


