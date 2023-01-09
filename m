Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC91661C17
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBj-0000lM-L5; Sun, 08 Jan 2023 20:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBh-0000km-RB
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBg-0001Wa-1E
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:57 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso7825977pjf.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=grVx4B5QIXEtO36ehyBBMBW63QQU1Dpe8dKQILJNBJI=;
 b=SdZSjTlqnS4ZYbEYB/E6hmAepm36ot9Au2m7krN4H8o51uPvB6b9YIz+bDkSu18r9N
 +/RoAC98SCKwNGdum0DUXbzyqmIuGe+fCo5C94UnnQBz5dv5jowJFEU3hY3++AGkwqaH
 J+w9lteCl/EiENdRId6DHgxVMlBMXxw/Gc0ydMB6a34xsdjpubmRGFknf+HE7Lc7CFCV
 nrAhBpnfns6ZArfOer5pQDF2SY8iQ3wcdqcsJmIDJVRryLlpOVu8m/+1/i/HE+WtCjV8
 /4LlH64s+IndX4XLoNc7o5Oy9CpFDbB0E+hcz6It6VN1EzTy45e+5fNcI3evY5MQo/EW
 UIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grVx4B5QIXEtO36ehyBBMBW63QQU1Dpe8dKQILJNBJI=;
 b=4sqaQZiDdoFKAqXji8Lr/HctpD+rrgY2/xyXhz1v1fPx2Co9KoAoRO+JQgqJ7WID8m
 jxZOfoHjBcjVRhPUH83f5UjNMs+nmUozHXhLUTND1gQZrk/gNG8e3WauNssvtTzslcBi
 TrSquFo6oD+1U6fsi4VUwWTESzPkeWn/EeJjg9QqGU9c4FT+tMgJjMjIrI4YfZaGocvE
 /TDUAbxEzyAw0nVDn2F2voT/H8nT7eL/ZuRuB1+DFsEOLkVdUOyUb4j8nO3xNap2FIlJ
 udi6AzCEC6jGXkRhhk3ZH5cg1HAILZuT/rbRXsPye8w9ItA7OkVpm8zZasJS51efTVRa
 kTEQ==
X-Gm-Message-State: AFqh2kp1fZxGjylNomD6PkChOus4VLa12VABpK7Gzm8H+0ebn10zTwAl
 QtgyB8B1EQ3slkVvk7UdVHVKbbsNYCQ8FkEV
X-Google-Smtp-Source: AMrXdXuneIDhqmcwLUCzmgslTJGJ2jkV2nNfZRBIRD1uzENkwbOhedMNu3LJUOd5CAhjQRqYLfNPcg==
X-Received: by 2002:a17:903:328c:b0:193:37c2:89d7 with SMTP id
 jh12-20020a170903328c00b0019337c289d7mr377617plb.17.1673228574760; 
 Sun, 08 Jan 2023 17:42:54 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/22] tcg: Replace asserts on tcg_jmp_insn_offset
Date: Sun,  8 Jan 2023 17:42:31 -0800
Message-Id: <20230109014248.2894281-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc     | 2 +-
 tcg/arm/tcg-target.c.inc         | 2 +-
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 tcg/mips/tcg-target.c.inc        | 2 +-
 tcg/riscv/tcg-target.c.inc       | 2 +-
 tcg/tci/tcg-target.c.inc         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 501b77c215..90af096c11 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1918,7 +1918,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
          * write can be used to patch the target address.
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 799cf13536..033ff90daa 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1953,7 +1953,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             intptr_t ptr, dif, dil;
             TCGReg base = TCG_REG_PC;
 
-            tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+            qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
             ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 29e4bfcb49..5dd645fd17 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1090,7 +1090,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that patch area is 8-byte aligned so that an
          * atomic write can be used to patch the target address.
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 52881abd35..02887d7cb1 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1987,7 +1987,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     switch (opc) {
     case INDEX_op_goto_tb:
         /* indirect jump method */
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9b42cb4b2e..b977c8025d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1311,7 +1311,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                    (uintptr_t)(s->tb_jmp_target_addr + a0));
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 2f3bcce3a7..ad356f1875 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -603,7 +603,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method. */
         tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
         set_jmp_reset_offset(s, args[0]);
-- 
2.34.1


