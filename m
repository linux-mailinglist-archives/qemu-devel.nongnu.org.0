Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01249337641
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:56:46 +0100 (CET)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMk0-00009r-Nu
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU2-00039E-29
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:18 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU0-0006FY-Cl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:13 -0500
Received: by mail-qt1-x82e.google.com with SMTP id l13so1266966qtu.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1TX4A2lg1baFpq2pztWBLMIOT18SzH84zy/1htPZ+g=;
 b=mhg9/8rYlKkl/X4he2CwXENxgP4mwyPtzidCOl77UMEEYlRIfMRfBV+JM2L1Bi84Ya
 YIitD5ixE0OLYfPJakGhL73Vc42VhUUvekOFNF6nCJCGbhiSQu/NFRH5/YYxqkllue5v
 Ct3PaeJ1bgy5QY3FLHgN2TjmPaFBYCjhrUmJeddC3TlvQE2DxQ4MS+J9I6zCM9s7888s
 ETBhJW0wL1BeGfWJT+pqxph+i33TWm+tk8LgLsK9adra0XWbkypSSsmRM6CIVgvXxfOs
 XUf7EFZco9b5gtsA5NfSJgX7wD5TBcwub/ON0gG5EJCD1CSrwSmHqrSWr5IHWeIWuHEP
 L9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1TX4A2lg1baFpq2pztWBLMIOT18SzH84zy/1htPZ+g=;
 b=XvYJjzEts2v/kUSmjl70LsN6kMfhSAcSwEw/soV0ALN5cjF3NNAt9yQx/C7oxm09Wg
 NTK5PmbHqpKq8PqxjpTUWEQ9+H85EwiRSqGNMGIR9+HlRS/WOWcVFuQ1wOArHuTEqZNT
 0vBy06hXINrEBRxQIpm1CVAA5QartWt3DzPnGwrZbVu7e4o4SBv3ChfUpOJAL4D93EJg
 tT7wTCTCyAk28Rog98pmZJaotWGrjkILqIFyyGdVQcn75qP0q/DE4Y/UEef+FRM53rBQ
 HrXrffEGl3+USBhKp7uo/snmrwDmwb0AjVarwK7cxKrTzFAkjtpDV3KyUW9h++iW4UDd
 /Vkg==
X-Gm-Message-State: AOAM532obulb2XBm/DFeUMyAbraAsFdM44xtKpsHEalhde+DxmzdqBux
 2OVW43VyK/rDqVlTBn7y1RMCfKbr16X5kyzW
X-Google-Smtp-Source: ABdhPJyY/EdrM/kigyJIpa7czCp+5rJeuD9U2y3Pc3VihUewzvtPkEUrC/yc9LWS7MvygbI2/BNM+Q==
X-Received: by 2002:ac8:534a:: with SMTP id d10mr5727145qto.353.1615473611325; 
 Thu, 11 Mar 2021 06:40:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/57] tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
Date: Thu, 11 Mar 2021 08:39:10 -0600
Message-Id: <20210311143958.562625-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 558d03fd1b..c8df45ce28 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -212,6 +212,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrcl(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *c2 = tci_read_b(tb_ptr);
+    *l3 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -222,6 +231,17 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *c4 = tci_read_b(tb_ptr);
+    *l5 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -388,7 +408,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-        tcg_target_ulong label;
         TCGCond condition;
         target_ulong taddr;
         uint8_t tmp8;
@@ -397,7 +416,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
         TCGReg r3, r4;
-        uint64_t v64, T1, T2;
+        uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -594,13 +613,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare32(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare32(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -620,13 +636,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, tmp64);
             break;
         case INDEX_op_brcond2_i32:
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(tmp64, v64, condition)) {
+            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
+            T1 = tci_uint64(regs[r1], regs[r0]);
+            T2 = tci_uint64(regs[r3], regs[r2]);
+            if (tci_compare64(T1, T2, condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -766,13 +781,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare64(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
-- 
2.25.1


