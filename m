Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34C4AD359
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:27:45 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLqg-0007yH-U3
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkp-0000R2-FH
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:37 -0500
Received: from [2607:f8b0:4864:20::102d] (port=38560
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkn-00018z-0d
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:35 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so1295144pja.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/YZ4Y+tth+cY5venKo3+zC18iniWfePDGcuQD9g22E=;
 b=h5SGgLCIv3YD/fPge8X2RwmcYvtCK9pAYMdQ2fOpN0dL1gcEMGirx838uMw5cF+qTP
 zqiyUtJnMyModc3vFpPXAUpnQrB1CFBI32DwXgnBGHJZf547lNLe0lIvi9rgRAfy+6yb
 MWa0homJDuvuabYN7VheiVTxv8hcLewl2kjDsRi9EWtlB8QiwJpiyma+ix72or/kCjLf
 vMwwwdrQy49wP3qJPsctrilgj56KhYK4Eu+PGgqGSmDGp/izv56fWHbibwwUI3KTM4/5
 PNOsV5Ktc3vRFHei1qjVhisYTu8h5MEBkRDTttTJye+aCcZlKESY6aw/cWQnaKAXMyHi
 jbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/YZ4Y+tth+cY5venKo3+zC18iniWfePDGcuQD9g22E=;
 b=7VzkaBK/PwSHIXvqRTt0UoUqaQruxzM2cno0v4vVHsszSo8DZst8NU2REGVS1TpAqa
 xOEq0ErpRWFQ1pxXpdXfsIY6vt1AsHFgJ9xMrMoJYguzdDJkTL9az9cL9Soy2Uxbhyot
 SfcRxoh7S6/t+uAPuKrsiRMccoIWImtu1+oNj7cYLbk628ak9fSBomgUTf5X5zm5attt
 VLNL2f5JIYu3O64SWPO6UeHpxbuFUZ2a2hQYdtVpvi8BdOw12mrkntEQ05nfx76ld6NF
 x4iVej7Ggmv2hVN/LAJaco7PgwxlukAp8bnSGZGPJCKqDN9ZI3dN6QIoooabb5eAMuC6
 bp/A==
X-Gm-Message-State: AOAM530UhU6hw+l77IilU/E3SNcFExWtewy/IhxjLrEuZrm9indYyMCt
 1+qtZfBoRLAhRHL1hIuZaYpmb0+UOO/+AA==
X-Google-Smtp-Source: ABdhPJwjrOWk8LQJujQ3Bk0DLrg3mLKGz5Qg1GOjcI7wpktuffw6vQg1mZByUpaYi2YFXHImT0DUAA==
X-Received: by 2002:a17:902:da91:: with SMTP id
 j17mr3007359plx.89.1644304651239; 
 Mon, 07 Feb 2022 23:17:31 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/8] tcg/sparc: Add tcg_out_jmpl_const for better tail calls
Date: Tue,  8 Feb 2022 18:17:09 +1100
Message-Id: <20220208071710.320122-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Due to mapping changes, we now rarely place the code_gen_buffer
near the main executable.  Which means that direct calls will
now rarely be in range.

So, always use indirect calls for tail calls, which allows us to
avoid clobbering %o7, and therefore we need not save and restore it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 21b0dd6734..ed83e2dcd7 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -858,6 +858,19 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     tcg_out_mov(s, TCG_TYPE_I64, rl, tmp);
 }
 
+static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
+                               bool in_prologue, bool tail_call)
+{
+    uintptr_t desti = (uintptr_t)dest;
+
+    /* Be careful not to clobber %o7 for a tail call. */
+    tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
+                     desti & ~0xfff, in_prologue,
+                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+    tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
+                   TCG_REG_T1, desti & 0xfff, JMPL);
+}
+
 static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
                                  bool in_prologue)
 {
@@ -866,10 +879,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     if (disp == (int32_t)disp) {
         tcg_out32(s, CALL | (uint32_t)disp >> 2);
     } else {
-        uintptr_t desti = (uintptr_t)dest;
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue, TCG_REG_O7);
-        tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
+        tcg_out_jmpl_const(s, dest, in_prologue, false);
     }
 }
 
@@ -960,11 +970,10 @@ static void build_trampolines(TCGContext *s)
 
         /* Set the retaddr operand.  */
         tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_ld_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_ld_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 
     for (i = 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
@@ -1006,14 +1015,14 @@ static void build_trampolines(TCGContext *s)
         if (ra >= TCG_REG_O6) {
             tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
                        TCG_TARGET_CALL_STACK_OFFSET);
-            ra = TCG_REG_G1;
+        } else {
+            tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
         }
-        tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        /* Set the env operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O0, TCG_AREG0);
+
         /* Tail call.  */
-        tcg_out_call_nodelay(s, qemu_st_helpers[i], true);
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
+        tcg_out_jmpl_const(s, qemu_st_helpers[i], true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 }
 #endif
-- 
2.25.1


