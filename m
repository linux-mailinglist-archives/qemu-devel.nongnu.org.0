Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1083F0CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:29:39 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSBu-000376-VL
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2M-00084o-94
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:46 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2J-0006CP-BD
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id 18so3336699pfh.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xt/P1E35n4DoR7F0qpGvXqATfrrFWhQKn4h1puAkVi4=;
 b=TSZ6T+I6Fl9kPGjkAKvDxNK0uP7j5dR81C22y7LXAt0RPAm/iRkK38hJT9nN6apw3l
 ocrirZtthdWmRwDHLJYrEC9XTWuN0D7a9/Y3Sof1LpM+whOZL32X3vMU0hxtvoi4oB6G
 zNZKxGmMry2+HEpQDHZZSAyYH2Bx9DxrMDcWCb4ZbP0BXA7z1q2XAtlQI+MFYdOGwIld
 ZVsrq5j7WDZUWN2IxHaw1ON4ET+gXHH/RipY4Idkn+YRI4TSdnf57Jzx5qyNanAPMDWS
 2Gpw+GO0TxQVUDEzzStoSrC2siDVskNe2PnPJiS0EWtkbOtMU3vdw7/BMyShQF1YsT/G
 4KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xt/P1E35n4DoR7F0qpGvXqATfrrFWhQKn4h1puAkVi4=;
 b=WRgajeqAHpcDOjcbd/aCHGuiQVwf+zjIMMSE+V2K5N8v68/1NJzoCBwkytkrocHveV
 kLSVS6xVAYmnOaH7byGXgLDOSFNuyPGrmN+/fWEeAg4bkyRyE/6qreKO2FQyTfbjeeFW
 snCicgmG2rpiw2hXbWmEBibqlRxlPXqCKYWDVN8fGY1GUN1utyHk2xFTxn077VqE+feD
 EMTi5xVW/JDj6OeRUEzlTtu+646OL7eCQIcfwDBKu/Qjlt0Dd2mpCfE20UTlILFlHS9o
 z7VFxeH9CYawWdEyolB7MsLCvASSpPf8aOsWiKc4eoD4l3oxH+LWO2vb+cePLruzLa9Q
 qQrw==
X-Gm-Message-State: AOAM533c6e9qnu4No50Yz1NeALel1TwOBnEzH5RaxonUdRX+iHdSkim6
 vOisb4zGPVD+XrzjDpOzfGLAzmnCFPgmpA==
X-Google-Smtp-Source: ABdhPJyMNAn41mKO8Jay6cd+S83XhOQZECVw45E2mhEdcPqXNmiikLXruKLnxqvQpoVpFXVPpgxYow==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr10395763pgq.300.1629317982062; 
 Wed, 18 Aug 2021 13:19:42 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/16] tcg/mips: Unset TCG_TARGET_HAS_direct_jump
Date: Wed, 18 Aug 2021 10:19:23 -1000
Message-Id: <20210818201931.393394-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Only use indirect jumps.  Finish weaning away from the
unique alignment requirements for code_gen_buffer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     | 12 +++++-------
 tcg/mips/tcg-target.c.inc | 23 +++++------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c34cccebd3..28c42e23e1 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -39,11 +39,7 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define TCG_TARGET_NB_REGS 32
 
-/*
- * We have a 256MB branch region, but leave room to make sure the
- * main executable is also within that region.
- */
-#define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_ZERO = 0,
@@ -136,7 +132,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
-#define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_direct_jump      0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
@@ -207,7 +203,9 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
+    QEMU_ERROR("code path is reachable");
 
 #define TCG_TARGET_NEED_LDST_LABELS
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c65c4ee1f8..1c5c0854c7 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1977,17 +1977,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            /* Avoid clobbering the address during retranslation.  */
-            tcg_out32(s, OPC_J | (*(uint32_t *)s->code_ptr & 0x3ffffff));
-        } else {
-            /* indirect jump method */
-            tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                       (uintptr_t)(s->tb_jmp_target_addr + a0));
-            tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        }
+        /* indirect jump method */
+        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
+                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
         tcg_out_nop(s);
         set_jmp_reset_offset(s, a0);
         break;
@@ -2861,13 +2855,6 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
-{
-    qatomic_set((uint32_t *)jmp_rw, deposit32(OPC_J, 0, 26, addr >> 2));
-    flush_idcache_range(jmp_rx, jmp_rw, 4);
-}
-
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
-- 
2.25.1


