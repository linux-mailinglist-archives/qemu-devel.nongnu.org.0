Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF213B4D36
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:47:35 +0200 (CEST)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx26I-0003N0-8E
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vr-0002DZ-RZ
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vm-0000Mx-Pw
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id e22so10115150pgv.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GjlKcFtUOLo4ZBmg8lM1encCtfhP3Rvv45Irrywiqg=;
 b=uinMq/uInvk3mF2Jl2Xp121HwNgmOMTtLpYtrKwHvjvcutaIqTLiVoEe56rHfDO+jq
 UM1g67maJfalMj8dvTJyn7+JT0Kf8oEmW6hZdpmJ+0iul6Wmbuf1ySs1FqDGiblImykG
 PdKmA+wMOdCsPU05W9ybnMLIKSiC9PvFLuMnpIhXMAjBaEEJ8ttMSOI3pRh9xaMiJqYC
 y7O6olf84kjjoAxxVeLVgtfS1CAgXKIH7ug4kV77jb2Cn7ESZnPnhnE52yxWgZjw1vei
 42vMgztBCPGxAsE/6qRMKVUHZw1f62FBys6hGBi9z1MiqWfnr2YEyRTyD55M9gS3Pm+/
 PJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GjlKcFtUOLo4ZBmg8lM1encCtfhP3Rvv45Irrywiqg=;
 b=rTxiVZsqyYBFqs6JIno1xpSEdQchKgXih9lHe0YUtBzAs2CVVE3l1LU6lb1+otld3r
 XXH1q23PSGWjLQ7ZiMXLH9PwxjYipZZ7wggkVu3VILBa/k96blbSw7oHIUE0l2hd/FRl
 MAuaSA8KTWWFXfIxQFvFmdmbKCd7hDmnIh4NRIpa7qRvqd1rKeDY3JFLEpbYbbAb7Z23
 xHqApTDkff1ASRUD2FOxzrlvCQ3QmXU1KcgNNFx6OyS3cxGtxamrdWaTt51rhct162Qj
 A3WHZ1AKLicajL3IpeYNI90dulYwrlWFtIt2VLdBbYbB0b8rG65gCvT5AEdcMBwOsAw4
 ZzqA==
X-Gm-Message-State: AOAM531FsgohHgRK3RnDzIYEtcQk1NI4mn+SI7LgINoVtqM8wco0A+f1
 mjUwO5li15ac591Kw4nLzF3vpEq1MmoXPQ==
X-Google-Smtp-Source: ABdhPJyBckeki1MEeeGSM0xIMFBY5UiTHuxFFkd7FJWmDnhigC4+3VK8fNKsW4BE3Uzn6VTwt53nqw==
X-Received: by 2002:a63:5b0d:: with SMTP id p13mr13379988pgb.84.1624689401618; 
 Fri, 25 Jun 2021 23:36:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/29] tcg/mips: Support bswap flags in tcg_out_bswap32
Date: Fri, 25 Jun 2021 23:36:17 -0700
Message-Id: <20210626063631.2411938-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tcg_out_bswap32 and tcg_out_bswap32s.
Use the flags in the internal uses for loads and stores.

For mips32r2 bswap32 with zero-extension, standardize on
WSBH+ROTR+DEXT.  This is the same number of insns as the
previous DSBH+DSHD+DSRL but fits in better with the flags check.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a9f9f527f6..bf0eb84e2d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -579,27 +579,20 @@ static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
     tcg_debug_assert(ok);
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
     if (use_mips32r2_instructions) {
         tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
         tcg_out_opc_sa(s, OPC_ROTR, ret, ret, 16);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_opc_bf(s, OPC_DEXT, ret, ret, 31, 0);
+        }
     } else {
-        tcg_out_bswap_subr(s, bswap32_addr);
-        /* delay slot -- never omit the insn, like tcg_out_mov might.  */
-        tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
-        tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
-    }
-}
-
-static void tcg_out_bswap32u(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_DSBH, ret, 0, arg);
-        tcg_out_opc_reg(s, OPC_DSHD, ret, 0, ret);
-        tcg_out_dsrl(s, ret, ret, 32);
-    } else {
-        tcg_out_bswap_subr(s, bswap32u_addr);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_bswap_subr(s, bswap32u_addr);
+        } else {
+            tcg_out_bswap_subr(s, bswap32_addr);
+        }
         /* delay slot -- never omit the insn, like tcg_out_mov might.  */
         tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
         tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
@@ -1381,7 +1374,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         if (TCG_TARGET_REG_BITS == 64 && is_64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
-                tcg_out_bswap32u(s, lo, lo);
+                tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             } else {
                 tcg_out_bswap_subr(s, bswap32u_addr);
                 /* delay slot */
@@ -1394,7 +1387,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL | MO_BSWAP:
         if (use_mips32r2_instructions) {
             tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_bswap32(s, lo, lo);
+            tcg_out_bswap32(s, lo, lo, 0);
         } else {
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
@@ -1520,7 +1513,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo);
+        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
         lo = TCG_TMP3;
         /* FALLTHRU */
     case MO_32:
@@ -1539,9 +1532,9 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
         } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
         }
         break;
@@ -1946,10 +1939,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap16(s, a0, a1, a2);
         break;
     case INDEX_op_bswap32_i32:
-        tcg_out_bswap32(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, 0);
         break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32u(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, a2);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0, a1);
-- 
2.25.1


