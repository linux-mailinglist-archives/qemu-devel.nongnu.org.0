Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B186A4A94C3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:52:31 +0100 (CET)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFtOH-0000yF-NZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa2-0006ak-H5
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:26 -0500
Received: from [2607:f8b0:4864:20::42d] (port=37712
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsZy-0006Sw-8o
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:25 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y5so3403544pfe.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCnxeYPhfwcQZtAYiLYKNj7YwZATR9Ya833+hqWqAR4=;
 b=wBHIBcYMrwzrGPaUHorxI6LoQeOhECUFBmMRfcaTa7ccw/izbR+lCc9Ax+SOeqWn8c
 TlhzR6ZYHjRCwMWULD5s4HMdipcE4YNJk5P0CvUD1s8YqQBywVRof3x23dh0IYOUjg6D
 DnHHaia8P0phyDNXuWkjF87or4ps+fhy7CM2nOY5tdPSXGt8h+M6BjxsdBa3gmzL7VGH
 IbjoxJb8UOBos+ly3vbIF25MRQN5a12rtmGpLf1ADgSTztw79y/ddPVfI3JkfAit7QRV
 XU69xEFp1iE+jAxtb9Rqtfa71uTWqDEgftW1yyfigg7gO3fmqV3zv62qvdr1GqqyOp0T
 g9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCnxeYPhfwcQZtAYiLYKNj7YwZATR9Ya833+hqWqAR4=;
 b=3j7bzP6hIOGO0h54Tx/W9MVeAoySmQOcfRO5BJBI92rmzKaRJ2dvFfjAP8qoZ7z8Gk
 qVseu1/pgr3o3gydqiz8qsbZVnc7IC3BUM9uDYKFi4dlcnrveHS3r583miBgUIpM04s5
 neagsFH7LmNbVVpPsBf09DyQMMU6EaJHD1rbzvZlb5+CjHjp2rvuaO2MQiDG9NFe+De9
 Rs0ooeJ+VNeOLoZjVCZ9m8ED3jt+5T7KCaZuld+HN3tx0jpDaDj4twdCDWdcpdAfGhtk
 V7GYf+1nIbLp8CrmAw7J4ALGDl0Dnlmszn/Svfv/teHAnqnAM1rwHTKXz0vKU4nj/xw/
 pTow==
X-Gm-Message-State: AOAM532Fcdiq5V3QoVeCmLvPDAvwyvy47p03SS9fBBHkmBpevU9iHabC
 rP1Cv2QLmfsFrWji95Evs0nGC8ZtylAp856p
X-Google-Smtp-Source: ABdhPJwnbNRS9W+OWUQTd9LrgAKqCHOUgjdcb7WOH5gcXNdg6yH8iWCf05X27z8iMZftLPe3mCDEyw==
X-Received: by 2002:a63:6983:: with SMTP id e125mr1337224pgc.574.1643958019969; 
 Thu, 03 Feb 2022 23:00:19 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] tcg/sparc: Add scratch argument to tcg_out_movi_int
Date: Fri,  4 Feb 2022 18:00:07 +1100
Message-Id: <20220204070011.573941-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204070011.573941-1-richard.henderson@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to control exactly what scratch register is
used for loading the constant.  Also, fix a theoretical problem
in recursing through tcg_out_movi, which may provide a different
value for in_prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 0c062c60eb..7e3758b798 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -414,7 +414,8 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             tcg_target_long arg, bool in_prologue,
+                             TCGReg scratch)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
@@ -471,22 +472,24 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
+        tcg_debug_assert(scratch != TCG_REG_G0);
         hi = arg >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
+        tcg_out_movi_int(s, TCG_TYPE_I32, scratch, lo, in_prologue, TCG_REG_G0);
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
@@ -837,7 +840,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     } else {
         uintptr_t desti = (uintptr_t)dest;
         tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue);
+                         desti & ~0xfff, in_prologue, TCG_REG_O7);
         tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
     }
 }
@@ -1013,7 +1016,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != 0) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base,
+                         true, TCG_REG_T1);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
-- 
2.25.1


