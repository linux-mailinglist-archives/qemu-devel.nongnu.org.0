Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664930EA21
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:25:23 +0100 (CET)
Received: from localhost ([::1]:51626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UKg-000807-Bq
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjN-0005VN-J5
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:49 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjI-00040L-VX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id lw17so4251471pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eSQe6U/PGZwTawoh3F37z3+OGlTxy4qNiRyYKdayrlc=;
 b=YRgSjIFtqOYC9COao5LQz+NRV/bQHYsFyGVsElMFCX8WRlHoqeENVpeMgRB7HtrpGX
 2H5VjZH9sDJRjvSsi5+Dk3LGXh++v70hitglIRtug4mvFitnCl02Xtj4ElxUECrOY/mw
 /y6aMX8Y1D8Ugzf42r+Ks43WsCqfBMcuz10fz5awsFci+f2TQhbTud2KU7jyk5yNjstt
 zLEHSH88ivBspTNanRfpuYyqPMBtNIEFXJXtucjEEtt/hNlZiltGXkzKtG9aaZLUIo/x
 5FOsirPGkCDCnLYAWv7mkFFndDhpePO0HvybUMQsDtDcks4Aui+rdHo0TJ36Jz0I7qjI
 bC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSQe6U/PGZwTawoh3F37z3+OGlTxy4qNiRyYKdayrlc=;
 b=fleDV2OAKepqD6PDGAtAEl4yGo77U8y2hZe0/baCLT0oeaG0Lx9kOTHHzK7MALg8pl
 EUxWD1nPoj4ArgjfDlh0fIsLGFPxal5Z1Injyhz9qRSiWFMHoVsU1N4Z9rQxP5WsmI4l
 canuyvaw1S287s3/fYHgCxf9I+o1+WG409qdfIKGE8S25JDXqelHHLf13chRMeQ3e8+p
 HcZe2ALYgXOEfq312w8Ne7dF/X3qbhlSPTzCN8gUuGbgMTGh4bt3PARdPvCA2TCcpHyU
 FMr9EOEf7zMe7/6UZjEbt5csrfkReYtgohpG0yrsVMgiBAW2A9AzKVL8uqGBvhod44w+
 aQMA==
X-Gm-Message-State: AOAM532RM+BW7e+aypyGBIGk1TICmWrvMtV3k0XJzuygW0j5kfpv3cXv
 68z5/ul9ft1mygdNgtRFzUlV1ujJrBN5LTA0
X-Google-Smtp-Source: ABdhPJxkopD0x0Nb3yObSHAEeRD0gDnmH5WDH1MEYS8433WJ7OqAWOIinfO8oNJSI6E/Au5WeLuf5A==
X-Received: by 2002:a17:90a:ce89:: with SMTP id
 g9mr5789092pju.42.1612403201943; 
 Wed, 03 Feb 2021 17:46:41 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 50/93] tcg/tci: Split out tci_args_ri and tci_args_rI
Date: Wed,  3 Feb 2021 15:44:26 -1000
Message-Id: <20210204014509.882821-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1e2f78a9f9..5cc05fa554 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -121,16 +121,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-/* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(const uint8_t **tb_ptr)
-{
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-#endif
-
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
 tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -180,6 +170,8 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   i = immediate (uint32_t)
+ *   I = immediate (tcg_target_ulong)
  *   r = register
  *   s = signed ldst offset
  */
@@ -196,6 +188,22 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_ri(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i32(tb_ptr);
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tci_args_rI(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i(tb_ptr);
+}
+#endif
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -498,9 +506,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_ri(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (32 bit). */
@@ -720,9 +727,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_tci_movi_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rI(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (64 bit). */
-- 
2.25.1


