Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F132362610D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiq-00083o-AY; Fri, 11 Nov 2022 13:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-00081M-I8
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005FO-9f
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w14so7487410wru.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnKrKEY1uLyQf2qXKEQwvTPUiYfi6aVs4dXdbcR/wWc=;
 b=FYLJBbYRqzKlFJ87eihxA+mx9Vk2O8F0L5bkxpfEMsqJvTWGMpjzXAAOTWk8xxq9cA
 d6blwBV8UwlwjDkLmxaQpUqUjCM4g2pCvCnxHAMb06V+CuTikEFTgHLsYrjzQ+KXr69d
 P/h3Re9m6SObv02o8PsgAYuD5capryBOAMOM7ERTI0Bhnj4vKSzRFo3hdfHjJ4HpvKbG
 Gdhr1nF1MYhMpI9DGp3mnqNFMpgPNKyuGkG3T1zPRbcO2YZC+KcjmYWk2HLSUDFSbU9z
 ptd2QQ3sOhIq4Mm+2XGkaGf09YwbZfr3CZNKgV33j2/B6s6TAg3kf9OApEt78rMaHBFF
 RBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnKrKEY1uLyQf2qXKEQwvTPUiYfi6aVs4dXdbcR/wWc=;
 b=K/gplTKMME6SrcRgLJe7YsLT0h/5+bSH2XgBLEdQBOMlGI82I9dwgiBu7pqoQrsZrp
 QTMR6zWXca4YrqKQrJ7OrQp+mxymqN9gNR/R8QsDfrrAWCKV0knmtXm9+XqFXsR/6zXx
 FHAvds4HT8GTyk+ibcY7K+djUHhF2KJw4hDoiW3lAksMq9U2yOvwgk/zyOWtWJ2JQ8Ub
 SMhDvisdEfJABrI2eGY+hubZ4ju0ZcA1aWPj2BqALtz4bCVLUx9s3h3kpcviQaHr9aKJ
 p4Oa9N7gLvLZXh5oLDHPcCnfujEkKKs3XvBdpj6Vg72dTOAZFtvHcAwF9sDeL3k3NHcc
 5ghQ==
X-Gm-Message-State: ANoB5plShgixPIfrHxQygmXDCvkUou0DUZpCFvoEvckNa6L3kFL7FYCd
 nk4ibb6lCzYBMU77iZk8kjedLg==
X-Google-Smtp-Source: AA0mqf43PD1eLo+0iAw/SRf0Pj5LKeyJGTDGi2cFSaeZxom+FV87OdSWKFo681N7/VZSJrXw6y1DRw==
X-Received: by 2002:adf:ff85:0:b0:235:c5de:75c3 with SMTP id
 j5-20020adfff85000000b00235c5de75c3mr1967895wrr.285.1668191139613; 
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c1d9900b003c64c186206sm3651008wms.16.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 233261FFBD;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v5 05/20] target/arm: ensure m-profile helpers set appropriate
 MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:20 +0000
Message-Id: <20221111182535.64844-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There are a number of helpers for M-profile that deal with CPU
initiated access to the vector and stack areas. While it is unlikely
these coincided with memory mapped IO devices it is not inconceivable.
Embedded targets tend to attract all sorts of interesting code and for
completeness we should tag the transaction appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - rebase fixes for refactoring
---
 target/arm/m_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..2fb1ef95cd 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -272,7 +272,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -665,7 +665,7 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     MemTxResult result;
     uint32_t addr = env->v7m.vecbase[targets_secure] + exc * 4;
     uint32_t vector_entry;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     ARMMMUIdx mmu_idx;
     bool exc_secure;
 
@@ -1999,7 +1999,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     V8M_SAttributes sattrs = {};
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
@@ -2047,7 +2047,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
@@ -2805,7 +2805,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
-        GetPhysAddrResult res = {};
+        GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(env_cpu(env)) };
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-- 
2.34.1


