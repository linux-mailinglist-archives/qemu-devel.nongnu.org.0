Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1932A8FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:09:28 +0100 (CET)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9SZ-0002bF-4z
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HS-0002nD-Ss
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:58 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HR-0007aK-6L
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:58 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o6so2524533pjf.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fptILMWrA+pDg1XvV+KF1NfoqcnNqb93ja/TFgoMbqs=;
 b=uDDAzS8xJS34EnCEhip/ijO5wTOlGvx30rn3MYETdiHM77Kg+ffb27YRLWyRDZf0is
 BiVHVu/cuyR+ZwBMD1pbAcapOmuFil4rw6CPIkH9WhTAGC2n1c2JWGQKF3Ts0HOTUV+c
 gaENihJQmRK2DatJesGjLo7YoTRufjBvGeHBgdQRu0mYXZfwwLWyjxk+8XLkkwpoZO9s
 j9LEbMUD2RpMFbY2DZjw/Z/qdLMjuErRX5s1Qe0Bodg1RT6N5qGsgYgqtKUZV3Wx1zfr
 oLz+RO/TWkTSBp7zW8LJA3n9F+YIk3RKWIs43l9f5iYRefq3RX+qTmdmtzVxlchAT5j2
 lNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fptILMWrA+pDg1XvV+KF1NfoqcnNqb93ja/TFgoMbqs=;
 b=VX+Uf7SS5tYjI1xtpuwpLFPfeqI7j/afd7kXIl2lJeGkOVqLQaeXLRhAqfUYlwOe5Q
 0DG8CDXicOO8NZQR6xL8hbwZ/DNH5Lvd1yssu/fNaz3kHMQfKcJkZos66tdr+vfkZx3q
 Fszlv7mnWzNe+u9u7wbiVdM8fxgGcfm0qBhO3N/i+JnyVEb+MQYTSVjjP4EG7D1Z906g
 7LL9wWqZX+tGO9KKqwrMK2K4WKfTwaReaG6ZvGJAIOCxTpWuh8E3+ZhCM1S9pIHhtTQ/
 bFjf6yaLCsDFwz+X5xDjMVrJk85vhMDmL+pqcuOt5f5nVgrovwddAcV2KbSezvEFu1YT
 GOZg==
X-Gm-Message-State: AOAM532ofJzcX5nKvkj+FbHCRyhreMa8sRch8mrWG1QzvO9wLH8CEDvD
 RVRbpJWsSTrZut1DrfMi4rnAEUIJW8XfyA==
X-Google-Smtp-Source: ABdhPJxpAzQHc1VXpCNojJUSnWvimTD+/aJ+gmBLj1K22y03K2LffewE+ITSa81ic8HWzEgw4hYuKg==
X-Received: by 2002:a17:90a:e647:: with SMTP id
 ep7mr2168579pjb.122.1614707875889; 
 Tue, 02 Mar 2021 09:57:55 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/27] tcg/tci: Remove tci_read_r8
Date: Tue,  2 Mar 2021 09:57:26 -0800
Message-Id: <20210302175741.1079851-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Use explicit casts for ext8u opcodes, and allow truncation
to happen with the store for st8 opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c667537fe..4ade0ccaf9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint8_t)tci_read_reg(regs, index);
-}
-
 static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint16_t)tci_read_reg(regs, index);
@@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    uint8_t value = tci_read_reg8(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
 static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r8(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
@@ -722,8 +709,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
@@ -916,8 +903,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i64
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


