Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A831E0E8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:59:04 +0100 (CET)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTuZ-0001hk-9X
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLb-0008Cr-K5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:55 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLa-0007MF-7C
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:55 -0500
Received: by mail-pl1-x631.google.com with SMTP id u11so8013615plg.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7uiPbIkaltXGyGrTOejJhAFYjDYkkPY5RpXmb9ap/U=;
 b=FNVb6l0ZZN/yAsRyue5pG1InpKjE5TRb2FP5CnT8wuVA+FAdDwwhmXySt4ngzPwVk9
 W4zAbJXCgBk/t2wLB9L2NZd2KEYZXyv5hJHxl7qOPcEExwdib6o/bcoMC2SBi+d38sIa
 R4bP7u0eYUVzec3hCckoYyYrU0DwWnEscyQbjNMxgsdAG0KEgtKQFqxMgr4FBxyCRJTW
 iYJDprKjEeNXbC6B8u/CU3aE2blc3eVaciedX2b5ZHZmw2wnrrKd44p4/mEYzfVlCup8
 2CzXlNpjdW3MFByJBsM/qgewR4dMJn1Id8UDInCOOnWbaSIMKEbdd74uMYsWLD4PKRAK
 fadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7uiPbIkaltXGyGrTOejJhAFYjDYkkPY5RpXmb9ap/U=;
 b=X0YJQ3y6U1HgvHEmuHZwbTfSVN6jL9BUnAUVKWtl7KUjkHMsXu6+z9hmey/zkOWW4o
 qFr8uS/E7b6BZehfkKRTNPjzah9KP/oK3+KZRKJlPjSnKotPgKDv4C1DVcDYOUOl2Pwj
 h8QRh6MrVPctrEnItBqVmli7Gk1vw3/y93T5OQRBs+Ayvwlqp8Q9VhIyLoCQ8FtycS5L
 vzh2EgK3loLFRntFlWhOU0lXTkVYLEMYuk0d0N5HOjjqhDqDGOEuRl9TavBCUGVhiHyT
 iF+zFFxCuLL7tAxW5n4QraGHIaGhbEyZlHcQClE06afQvgqqr1LuL9S2TO46O6OG3+eX
 8/GA==
X-Gm-Message-State: AOAM530Bjts6vXdbyF07OK8+Ouk1z6IsHSzIpcoxLmsnfcJLoHBCbeNm
 kvGqqiVujl1Oa1PGlvFPQsowKH1iUyDxGg==
X-Google-Smtp-Source: ABdhPJxSlYWT9f/yMYhiDPZh6363oRLKOE6OEyaOlrcmXq54oX+vFinBfZowh7aQG8oO/cjaNxhmkQ==
X-Received: by 2002:a17:902:7c11:b029:e1:8692:9137 with SMTP id
 x17-20020a1709027c11b02900e186929137mr785752pll.50.1613593372946; 
 Wed, 17 Feb 2021 12:22:52 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/71] tcg/tci: Split out tci_args_rrrrrr
Date: Wed, 17 Feb 2021 12:19:54 -0800
Message-Id: <20210217202036.1724901-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 tcg/tci.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3fe0831b33..8b38687d9a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -258,6 +258,17 @@ static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
 }
+
+static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *r5 = tci_read_r(tb_ptr);
+}
 #endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
@@ -420,7 +431,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4;
+        TCGReg r3, r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -626,18 +637,16 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_add2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 += tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
         case INDEX_op_sub2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 -= tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
         case INDEX_op_brcond2_i32:
             tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-- 
2.25.1


