Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCE6F53E1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IL-0000vn-JA; Wed, 03 May 2023 04:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IJ-0000uP-D0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IG-0006bg-Qy
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so2183316f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104219; x=1685696219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAkfbBkSUOwDhr6+r3Ga4m96gVYkHruiWiQ6F9i3jdI=;
 b=iV4b8AM2+JgZiIobiUGwd1Aoo7aeeFVpVFR8yzPsuwxsb06dnaFqb01vLh9Crhhs00
 P/H8Y0ADUutn9ZXVD/ycHm90Yp0pPm/epG6VZPuYOvS0fGZ54t7VNXyEtiLKE9/yhPYS
 /EIzucY6rEYssbdFsiMNSfS3uK+3Dim5kNNoUOhPFYqIRytKbkoiT79wK+CvQyxqmoaY
 PrysikOmDnp4YA2M8YYid/j0maYXUDX99vXIofBOV4+Y4Ypiw6n5lriAXQbv/179qAUa
 Dq2ur0VJbEkNb5OXgMa+xatIy+em4lnduAG/V922bmfShDZW+/MmBRxMhPjMV3lE1ju1
 P5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104219; x=1685696219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAkfbBkSUOwDhr6+r3Ga4m96gVYkHruiWiQ6F9i3jdI=;
 b=ZCydpJtHUrOAJAI9p36AEVLi8FG2Kr1gTeQxKKqPpEAxy7LUNPYWOefXb/bW24c3RI
 Mad9gFJIPWLO1MYL/SJceZYXfy0wiMLPp2Ez9bNncJfp/yasl+T3Tz7ppwSC3rYCuopJ
 +5pCmYidL/xa6Y22tYCHZs8Hz34EFvTyo+3JwnY8BKcL20S0FIVnzMTPBCGR7OrN7EQ1
 TIf0h+ZPCW0IbST3rbvfipajGgc9dnSehqag6BzOmaVWRR/qPJPP+RWLvUAkmQ9+ilMH
 3sFSg75a5bN1myk+s7axrHAjHpHwUYyy9oN0QUwFmGg3hJoX1mZNziteLDcKhmyc0CB4
 XguA==
X-Gm-Message-State: AC+VfDyAFzMCkM9t8opCbi1T2cMFhp4QWSNtNHSI0mmTT4WJcyJ/KmpF
 /phyTe+y5ZroRltG4ErX5dcAH71qlKkJRsecdo6TeA==
X-Google-Smtp-Source: ACHHUZ7fubJoEavNo/XVfnX3B10mF4Ecxwl+uxgV/9oCcGSGM+OuZ7r9vouxtsHhT0YGg9b8WfaMlQ==
X-Received: by 2002:adf:dccc:0:b0:306:37ac:ef8e with SMTP id
 x12-20020adfdccc000000b0030637acef8emr3808634wrm.56.1683104219420; 
 Wed, 03 May 2023 01:56:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:56:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 02/11] tcg/riscv: Probe for Zba, Zbb, Zicond extensions
Date: Wed,  3 May 2023 09:56:48 +0100
Message-Id: <20230503085657.1814850-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

Define a useful subset of the extensions.  Probe for them
via compiler pre-processor feature macros and SIGILL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  6 +++
 tcg/riscv/tcg-target.c.inc | 96 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 494c986b49..863ac8ba2f 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -90,6 +90,12 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+#if defined(__riscv_arch_test) && defined(__riscv_zbb)
+# define have_zbb true
+#else
+extern bool have_zbb;
+#endif
+
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 4dd33c73e8..49ff9c8b9d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -113,6 +113,20 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_A7,
 };
 
+#ifndef have_zbb
+bool have_zbb;
+#endif
+#if defined(__riscv_arch_test) && defined(__riscv_zba)
+# define have_zba true
+#else
+static bool have_zba;
+#endif
+#if defined(__riscv_arch_test) && defined(__riscv_zicond)
+# define have_zicond true
+#else
+static bool have_zicond;
+#endif
+
 static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 {
     tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
@@ -234,6 +248,34 @@ typedef enum {
 
     OPC_FENCE = 0x0000000f,
     OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
+
+    /* Zba: Bit manipulation extension, address generation */
+    OPC_ADD_UW = 0x0800003b,
+
+    /* Zbb: Bit manipulation extension, basic bit manipulaton */
+    OPC_ANDN   = 0x40007033,
+    OPC_CLZ    = 0x60001013,
+    OPC_CLZW   = 0x6000101b,
+    OPC_CPOP   = 0x60201013,
+    OPC_CPOPW  = 0x6020101b,
+    OPC_CTZ    = 0x60101013,
+    OPC_CTZW   = 0x6010101b,
+    OPC_ORN    = 0x40006033,
+    OPC_REV8   = 0x6b805013,
+    OPC_ROL    = 0x60001033,
+    OPC_ROLW   = 0x6000103b,
+    OPC_ROR    = 0x60005033,
+    OPC_RORW   = 0x6000503b,
+    OPC_RORI   = 0x60005013,
+    OPC_RORIW  = 0x6000501b,
+    OPC_SEXT_B = 0x60401013,
+    OPC_SEXT_H = 0x60501013,
+    OPC_XNOR   = 0x40004033,
+    OPC_ZEXT_H = 0x0800403b,
+
+    /* Zicond: integer conditional operations */
+    OPC_CZERO_EQZ = 0x0e005033,
+    OPC_CZERO_NEZ = 0x0e007033,
 } RISCVInsn;
 
 /*
@@ -1612,8 +1654,62 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_RA, 0);
 }
 
+static volatile sig_atomic_t got_sigill;
+
+static void sigill_handler(int signo, siginfo_t *si, void *data)
+{
+    /* Skip the faulty instruction */
+    ucontext_t *uc = (ucontext_t *)data;
+    uc->uc_mcontext.__gregs[REG_PC] += 4;
+
+    got_sigill = 1;
+}
+
+static void tcg_target_detect_isa(void)
+{
+#if !defined(have_zba) || !defined(have_zbb) || !defined(have_zicond)
+    /*
+     * TODO: It is expected that this will be determinable via
+     * linux riscv_hwprobe syscall, not yet merged.
+     * In the meantime, test via sigill.
+     */
+
+    struct sigaction sa_old, sa_new;
+
+    memset(&sa_new, 0, sizeof(sa_new));
+    sa_new.sa_flags = SA_SIGINFO;
+    sa_new.sa_sigaction = sigill_handler;
+    sigaction(SIGILL, &sa_new, &sa_old);
+
+#ifndef have_zba
+    /* Probe for Zba: add.uw zero,zero,zero. */
+    got_sigill = 0;
+    asm volatile(".insn %0" : : "i"(OPC_ADD_UW) : "memory");
+    have_zba = !got_sigill;
+#endif
+
+#ifndef have_zbb
+    /* Probe for Zba: andn zero,zero,zero. */
+    got_sigill = 0;
+    asm volatile(".insn %0" : : "i"(OPC_ANDN) : "memory");
+    have_zbb = !got_sigill;
+#endif
+
+#ifndef have_zicond
+    /* Probe for Zicond: czero.eqz zero,zero,zero. */
+    got_sigill = 0;
+    asm volatile(".insn %0" : : "i"(OPC_CZERO_EQZ) : "memory");
+    have_zicond = !got_sigill;
+#endif
+
+    sigaction(SIGILL, &sa_old, NULL);
+#endif
+}
+
 static void tcg_target_init(TCGContext *s)
 {
+    tcg_target_detect_isa();
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
 
-- 
2.34.1


