Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F344B1BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:09:30 +0100 (CET)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILNJ-0003Dd-VJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo6-0005Sz-3Y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: from [2607:f8b0:4864:20::42d] (port=46008
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnz-0007Tj-CT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:05 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 9so10601489pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6gT0loTTikTyP62uuClYFZJH9vRBsPpRKE1y+i3/wdg=;
 b=BsuUbaQLM8NeBTan1cTZznV/P+3CR+Y6Ymphp4h+sekgf+ttt0utJncGD1VHAiCwju
 6ca0xEIXcbzbcRQh7ITHGxCqq+JjyGQerHOT/4cUIdgYNwad/nvWAQ554vLGaG6DiXge
 U9SGICYgBrLKG4rk8t8/Vv718q6z/Rzl0KnF53OXJfqJY7eYAExsMULekSaGmfBspvyb
 nWpcZQ/V01VUWkZC1sDzgs22XJwH898rBWUx8w3eflUdtR3I8o4O71yIAWvxu6ESeZvh
 vhd0ZDp1Avz3Fmy0m93aA4OQ+TECbXBmix8S1TGDA2ucluQSkMZ9y0lVATUK/MB4j59H
 shew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6gT0loTTikTyP62uuClYFZJH9vRBsPpRKE1y+i3/wdg=;
 b=DiUXvNNv4wtclngYU+jhskodyKs/lsJ/x5Ju+Vn83ef81KlUbmv8aHOkkQTri5dawU
 UHXLeC+zNbdWpHqaO4eIsC4pOqDwOMMPsv5OSbw0tvpJNoohoBvPKB/l+NtxdBzKAxBW
 X9qVIeE09MeofFkZbusuvOpkp0D3NrbsnzfNX/YV510Zpz4UNUoEXkPAVal3GXUgBTBY
 pJcqhdW5dWHcSURKMplIUqBOrN5RCe6T2N+YzoVdFDBMK8h3RJQMLPQzQGc1NXGm3YBa
 vCs+M8/a7xF5nFkd5haOKUo13zq0fNv1Yq+tSYChgawi24BoDF3mYDCuXjDmIdy9kHYI
 4AUA==
X-Gm-Message-State: AOAM532XcSGLJ+SmHQCGRrKhDoNu9XGg2bSctOuOsZIN8qERxKwgkd6M
 Uz1YsE7MySvJ0LkXIeOXB2LFgnybM60YIVHD
X-Google-Smtp-Source: ABdhPJzAW8QLKeQf/2EET0IbcrxMhrByZQWNEe1vNgIKQbjHCvHgHirdC7aA+mgAIUNV0EzF/ltQCQ==
X-Received: by 2002:aa7:8c0b:: with SMTP id c11mr10255201pfd.62.1644543165187; 
 Thu, 10 Feb 2022 17:32:45 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/34] tcg/sparc: Add scratch argument to tcg_out_movi_int
Date: Fri, 11 Feb 2022 12:30:53 +1100
Message-Id: <20220211013059.17994-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to control exactly what scratch register is
used for loading the constant.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 2f7c8dcb0a..7a8f20ee9a 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -428,7 +428,8 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             tcg_target_long arg, bool in_prologue,
+                             TCGReg scratch)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
@@ -483,16 +484,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     } else {
         hi = arg >> 32;
         tcg_out_movi_imm32(s, ret, hi);
-        tcg_out_movi_imm32(s, TCG_REG_T2, lo);
+        tcg_out_movi_imm32(s, scratch, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
-        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
+        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_out_movi_int(s, type, ret, arg, false);
+    tcg_debug_assert(ret != TCG_REG_T2);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
@@ -847,7 +849,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     } else {
         uintptr_t desti = (uintptr_t)dest;
         tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue);
+                         desti & ~0xfff, in_prologue, TCG_REG_O7);
         tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
     }
 }
@@ -1023,7 +1025,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != 0) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG,
+                         guest_base, true, TCG_REG_T1);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
-- 
2.25.1


