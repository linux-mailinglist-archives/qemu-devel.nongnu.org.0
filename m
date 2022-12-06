Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF3643C32
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POg-0003MT-Or; Mon, 05 Dec 2022 23:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POc-0003Lg-6z
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:30 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POY-0006wU-QH
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:29 -0500
Received: by mail-oi1-x233.google.com with SMTP id q83so2083610oif.7
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PS3WVtbyd0Q5s5TKsXuaE9o3KEk3XDb4ASNc/tl64so=;
 b=Cu/npn+Upuu7olVNS1d2qrxdBlpzS6p5foCx7DYe6gQ7I+8vqhY7AKcdHtJ1lw1OpN
 ZGY7A2snno4YPfXeciAXPEcvyuatOtfaGaDYeVTV9GYUuPIkocIrC39QjKbQv7nS3Ape
 oytEH4V6654IlhuwTYeIh2fQrOn2GU9GpIEPyy5RliWbmVpR3kBODNobCjV6DM8wJxuw
 SoHec3G0wyohV5897L2+qKgF0lH63Ue6y7jFMP2K2uwzG/2C4Tw3XBReHTqqUv64k31S
 QdDp5ptBCY6uFYM1whbo9UArLapNDyyN6ulbxwuaXkCGNPqVW7qqSctecDiVRrO9xBoT
 3EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PS3WVtbyd0Q5s5TKsXuaE9o3KEk3XDb4ASNc/tl64so=;
 b=0Zsqvn3cAsksbsW0/n1SYOumUMIu/xcbfwP4v5J6mgmEvve8uWHwEclaneRjcxLZhL
 37aHpo4d1IgXzCarWmDqt5v6fruqVZ8hu1EkD2ntM5RktzltO61oHEi9lpGSxlLljq4W
 0dvn9dNXm7AfnjpCEymRgwMOf8GnEqO1rEpYULK9cp4ejUK8He6XH8BHJyPc3xdVZf7A
 Z5yIu6KGITZ2TSU/+6Tvqwv1pXxvzDuU/oF74KNNu5YpqBFORMjhfpA2NCisuPPx+dm+
 mU4f6EMlTMw8iHBFZFG3418HIDfDpd8CRUO+r3Ljwfey7KMlX4gBQF2dJl8jVsQ14Z7M
 T0vA==
X-Gm-Message-State: ANoB5pl9I3gMt2JIwVGfEZSrz/TzSF+4AlL4PleVJEy/zs2HheBeBOmA
 33yG6UVFb5VSMjjP6+A80b66YUyCDq2rG9x/h4U=
X-Google-Smtp-Source: AA0mqf5nD7NM/PZv6hw0339B3l7TIckUAwvJ8/jKdw3ZMl5IVPdfQD/sVWmtpJiDA4yITha3LP3Pyw==
X-Received: by 2002:a05:6808:3006:b0:35b:d281:9063 with SMTP id
 ay6-20020a056808300600b0035bd2819063mr13504209oib.252.1670300245019; 
 Mon, 05 Dec 2022 20:17:25 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 05/22] tcg: Replace asserts on tcg_jmp_insn_offset
Date: Mon,  5 Dec 2022 22:16:58 -0600
Message-Id: <20221206041715.314209-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Test TCG_TARGET_HAS_direct_jump instead of testing an
implementation pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc     | 2 +-
 tcg/arm/tcg-target.c.inc         | 2 +-
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 tcg/mips/tcg-target.c.inc        | 2 +-
 tcg/riscv/tcg-target.c.inc       | 2 +-
 tcg/s390x/tcg-target.c.inc       | 2 +-
 tcg/tci/tcg-target.c.inc         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 16c5e33b69..8e97da3a39 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1917,7 +1917,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
          * write can be used to patch the target address.
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5c2eae5a5..31f8c5b7a7 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1947,7 +1947,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             intptr_t ptr, dif, dil;
             TCGReg base = TCG_REG_PC;
 
-            tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+            qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
             ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 41fc5ffa91..78398684cd 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1089,7 +1089,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that patch area is 8-byte aligned so that an
          * atomic write can be used to patch the target address.
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 819648b100..5fc96e4406 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1986,7 +1986,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_goto_tb:
         /* indirect jump method */
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1381c835af..1e8406b8c1 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1286,7 +1286,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 9568452773..9498694564 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2095,7 +2095,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_goto_tb:
         a0 = args[0];
-        if (s->tb_jmp_insn_offset) {
+        if (TCG_TARGET_HAS_direct_jump) {
             /*
              * branch displacement must be aligned for atomic patching;
              * see if we need to add extra nop before branch
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 34583a3499..d1cc41261a 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -606,7 +606,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method. */
         tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
         set_jmp_reset_offset(s, args[0]);
-- 
2.34.1


