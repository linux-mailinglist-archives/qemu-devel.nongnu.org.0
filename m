Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4652EE70B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:40:08 +0100 (CET)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc4g-0006r5-A2
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh6-0001Nt-61
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:40 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh3-0001ea-N4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id j1so4165206pld.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vS8wJ/iNPyRl3pgmKuFkCd5a4WmbW3WD3BdbgSErfg=;
 b=iSfwg+owDfwgoLHj9v6crVpM3LXFewuxozctCyLg4vC2uir/Hq/Usk4vPtb+rWo2Pe
 SNCpU7i+3CIWHu9Klt/bYvSog0vTI/C0Ga0zKAcqwIDv9QfummrgyKYPuQsI8ldFZZUK
 JouM+Y0JDVTXCNpfERVSGTgXikP5pes5q6h8JYlfd3bMCzHZYGgPlg1VFgme9qzUG2vH
 RrRnCnehw941d06ad0CCYqPH84BPWxT6PZ9orCqSOpuQqgGLAThWZ5F1bsqc+bE3oYtw
 w6xdIpzKHv1qZB2iswqQoH9mcrWOx2QircArcU7/XrXFJX+/eFV2m6IgBQf5av8GOqI/
 kdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vS8wJ/iNPyRl3pgmKuFkCd5a4WmbW3WD3BdbgSErfg=;
 b=ks7LklHnouKO1MwNC/qyv9z/HvuHihZGu0qKHa9R1JO5NLeih4F37pEcvE+mgWqbYN
 eHrlhqfn0fy0uSzlevHZYQO5SVoDhfg+/492AmfFuEO/t8+uMC0SmJkgcU1E1dhFy7qC
 k02Y4wbpiuwC5xj+/IMtsMleU6mJqoWyRHmLIbgJpe5tBd0XWwVkKtBtvo8mjXC06hnF
 EK8uQ4nuTThimQOnk3Bnp8Enx0n/hDWlpCxexpO0fztF8uzunnx4YXt7s29nnHkrWOMr
 2GD0kuAlrJqH2Blq5BEH3wPXTezgz/LMaEwvmKJMzQ2h8cegTG6EoltNUUcV1lZIkKgL
 9LMQ==
X-Gm-Message-State: AOAM533YG9JEHxkS4IkcMoSaauQJlmCSuPkkZ5V55UW37AYi2/PWFZXa
 H5vDBOC00vbglVqS/P7hs8pBy4omUvgq+Q==
X-Google-Smtp-Source: ABdhPJwOl7yu98TJM+J/xcumW2DeoF8OIYumqjGJJiR3FQSlplZp0dDZ2kgrPmSlxRTHx/OmHldWTg==
X-Received: by 2002:a17:902:854b:b029:db:c725:edcd with SMTP id
 d11-20020a170902854bb02900dbc725edcdmr534548plo.64.1610050536144; 
 Thu, 07 Jan 2021 12:15:36 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/47] tcg/i386: Support split-wx code generation
Date: Thu,  7 Jan 2021 10:14:26 -1000
Message-Id: <20210107201448.1152301-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 73aa45a665..cb1b138b66 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d272975ff1..34bf0b9a35 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -164,7 +164,7 @@ static bool have_lzcnt;
 # define have_lzcnt 0
 #endif
 
-static tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *tb_ret_addr;
 
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
@@ -172,7 +172,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
     value += addend;
     switch(type) {
     case R_386_PC32:
-        value -= (uintptr_t)code_ptr;
+        value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int32_t)value) {
             return false;
         }
@@ -181,7 +181,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         tcg_patch32(code_ptr, value);
         break;
     case R_386_PC8:
-        value -= (uintptr_t)code_ptr;
+        value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int8_t)value) {
             return false;
         }
@@ -1015,7 +1015,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 
     /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
-    diff = arg - ((uintptr_t)s->code_ptr + 7);
+    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
     if (diff == (int32_t)diff) {
         tcg_out_opc(s, OPC_LEA | P_REXW, ret, 0, 0);
         tcg_out8(s, (LOWREGMASK(ret) << 3) | 5);
@@ -1624,7 +1624,7 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
     tcg_out_branch(s, 1, dest);
 }
 
-static void tcg_out_jmp(TCGContext *s, tcg_insn_unit *dest)
+static void tcg_out_jmp(TCGContext *s, const tcg_insn_unit *dest)
 {
     tcg_out_branch(s, 0, dest);
 }
@@ -1795,7 +1795,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
         label->label_ptr[1] = label_ptr[1];
@@ -2253,7 +2254,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             /* jump displacement must be aligned for atomic patching;
              * see if we need to add extra nops before jump
              */
-            gap = tcg_pcrel_diff(s, QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4));
+            gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
             if (gap != 1) {
                 tcg_out_nopn(s, gap - 1);
             }
@@ -3803,11 +3804,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
 
     tcg_out_addi(s, TCG_REG_CALL_STACK, stack_addend);
 
-- 
2.25.1


