Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F032A926
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:17:50 +0100 (CET)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9af-0006BT-IH
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HU-0002sP-SD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:00 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HS-0007aY-Bl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id ba1so12484173plb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYlMX6zlz5iaj2ojk5WvGQj9gx5INTxGM9zOOFclYMU=;
 b=oLtE3ubpg/Gj+aGsUF5aSLaFGEu+ChGvx+gtUT3rYRK7WoFe8QTsEF1FlrJ/T/s2hq
 J/Y4oIeunf939arax4xXehWm8EjzK0oYAzS3sJOWsExmgWmXWN2YLjWcaeC3G73ibFg2
 5DsmdvuCWgbQXKGMyZA/DGp6Eu01lSedcFnKjz78Nw63i8vQyL42o5eP1/jVxYh57x5+
 0hMoF6ojHLQBqUgFzZXYB2Gojf79w7aNKEfGSaQ9Q+JgpHAne7e9xX/Hzz+gbUJuC5qG
 kPUgaEBoPcDc4vMC7wzNCvAeMBV2TopJsYCUanhvqIMjQM8rGs4fouoRGq5LlyCY6IJb
 mfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYlMX6zlz5iaj2ojk5WvGQj9gx5INTxGM9zOOFclYMU=;
 b=LDX/36Ww+cTigGGqjMCBgmsaoucR+3A/Np4o+x1Ac8w9iGDHo5EV3XktIaC3RsVTya
 q72qmnyfGGWETCjmgLFmUtZ4WtenDGFWw6bNur3R2ucBDRtNpvIIrTPWvmQ1f+IhSVdz
 h36ErdlMIMzlgiIJLqsHHHrAI3rItcL5FV7+wkmbUIcze4DkBTav8IQ2W5ewM4//qfK2
 mINNd46NqS7h+pxFxss+yN7ssPAar4M5X8oOpc1DHYbXjQ163tY/g5/3TFHFtVEEH3UV
 y9iP5XtnVZy5CkM2+PYlEOcw3d/rdzdR7DdCqlhEM03nk6p7pKCQpYy8to04+lzy2JK2
 Wqeg==
X-Gm-Message-State: AOAM532SVXvMVPywWy/teRJXUI3hKjA/1EElhob4DdPeEkCnvH+FPM2K
 UiznCeWkXWnlRZgETvHAlpEWvcaRhywYkw==
X-Google-Smtp-Source: ABdhPJwk5eFE/+aCRidLLkPVQkWK9tH5NKLFiSk1TGH4INQRelSJjOIKBC4SYWQrd0+P5wKM8eD0pw==
X-Received: by 2002:a17:90a:f2d5:: with SMTP id
 gt21mr5863139pjb.197.1614707877118; 
 Tue, 02 Mar 2021 09:57:57 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/27] tcg/tci: Remove tci_read_r8s
Date: Tue,  2 Mar 2021 09:57:27 -0800
Message-Id: <20210302175741.1079851-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext8s opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 4ade0ccaf9..7325c8bfd0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-static int8_t tci_read_reg8s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int8_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -164,16 +157,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-/* Read indexed register (8 bit signed) from bytecode. */
-static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    int8_t value = tci_read_reg8s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (16 bit) from bytecode. */
 static uint16_t tci_read_r16(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -695,8 +678,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8s_i32
         case INDEX_op_ext8s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32
@@ -910,8 +893,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8s_i64
         case INDEX_op_ext8s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i64
-- 
2.25.1


