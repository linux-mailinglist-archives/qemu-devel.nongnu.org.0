Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3AA2EB16E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:33:09 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqCi-0008Qh-8Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0a-0002PD-Eg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Y-0006cP-5o
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id iq13so16540pjb.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vS8wJ/iNPyRl3pgmKuFkCd5a4WmbW3WD3BdbgSErfg=;
 b=o2xisyRU+c8hmwTNzYfwaXCYLs4rdKbUG5N/c+x18La3hBuXYAeV3edTRn+2XdGZRn
 DYBy9EkFB651EwLY3wksIxrtfidoumkZzPKgkt/+catU7YcgYHtzaA+xPkCHSjEmnFcv
 Z3ePKhymOHl87HVUxVIvIN6u76FJkVrq4nNWLXDk97gptGs94wrP/ctofRebqLgWIOZz
 amPErX6pBOpe7b+X6eSHczICYqwDoMpn7iAVVsO5kS+OLf/D8bEXinuquAW4LH7oDw31
 pFJRfqOpRzbygylBHkVdCzgrCzR3lbYIMfoEczBIHl8uc8Q45IjglahJuOigdqvVzVry
 Uq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vS8wJ/iNPyRl3pgmKuFkCd5a4WmbW3WD3BdbgSErfg=;
 b=tdI72OUwWIrK4huuQa9msNrW3SoTHCcm+omwcSBPQ9gJ/n4yTkdtI8gPh4caPlYURO
 sW5KKPCy00z5PuQZ65fgyAqysSIjosgwvVvC+oXmtaPKOYuCzvtzEvWfUVU1eSxI4btk
 td8BJhJmlhoN0pmRDvdI0evS/h3egWcNn0wA4INBHlP4YmctLQiNv4iEEPWms5UpAldL
 XJLp+Dhk3CY08wiEywwTypOIuhwkBMi/ImAiYteVvWNPmLdt2xC9KjFDOIPUcbtw2vmy
 DVSJUiZm/LiKdw+UfC5+S5QqthymznKXdLnqA8Po6xB0bGJcIPOiZHnPu0QnB6FUH8Lb
 vY+w==
X-Gm-Message-State: AOAM532Y+pS6U8tgd3SbVg+OLl/wMvdqHMAv6ml6OCGOzmDgzRtuTCs0
 gc2LGnE2sE0V5SMe9KfoY6b+TWvFK13b/A==
X-Google-Smtp-Source: ABdhPJz2p3lpwbI8DDy/EqSGtaZl5T9OA1PAbWYxnbLacdsuOIRkUSWAKw6bIp4AV3ov5JEduwY7TQ==
X-Received: by 2002:a17:902:848e:b029:dc:b38:98f0 with SMTP id
 c14-20020a170902848eb02900dc0b3898f0mr545666plo.82.1609867232423; 
 Tue, 05 Jan 2021 09:20:32 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/43] tcg/i386: Support split-wx code generation
Date: Tue,  5 Jan 2021 07:19:28 -1000
Message-Id: <20210105171950.415486-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
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


