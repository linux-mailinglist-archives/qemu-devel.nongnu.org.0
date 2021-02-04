Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5F30EA70
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:52:02 +0100 (CET)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UkT-0006Eb-3z
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tqy-0007Cd-Ay
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:54:40 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tqw-0006Ln-Dl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:54:39 -0500
Received: by mail-pg1-x52d.google.com with SMTP id j2so1069460pgl.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=u6ullSMDVXLwPqxrbWnTkJeGO3pZIbyXBvFEzgashLynv0lPcI20KeRDJZ3Ty6aeLN
 f4KF/oJpnGcHvik6dmHXXMAECdTjJBy3yIZrDWC9uK+2TaVYiLGhGE6OGapoGUUqWmN2
 oSx9MlYr1E4vc+I+3e6IVWsl4IlC13tIbAkzQeU1k3THrdx5/ira4eXDESS1CdolLjgT
 4WQ1bIK+sOcMRiTuB3wLzQbFSYvdY5qG5rpo6dhQdS96kRrWHOLomihGY46rvzbT84If
 uWLOhUMTYINwkrNAr0VOaxUzBq+NRPYSQ9ASHkwbJMIMEXb3vJpLg2QUP/W6WHqyXnf5
 AcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=sLzCBiGJWxsPJ3NVMY0bIOe99RL1eWHd7VhtsgDrFcS+k81hZj/HFeir+qNNEs+rBJ
 LGeOuz03cZk/iYlXzxWl09x8TvZpTq1l+TIDw25AcJVN8yM7fiJKWrLh+R8KqFMBnnt5
 wnFI4M0/VI11jF2TgH7W+wCKlHV7JIfKSA+PU3oYyQ8LFSWcUiyNF7Vtjtnq/67c4Gnq
 3xSjVVLhsfuGoR9fpPXL+MFNptgVyjQz+dK4cnoChU8h/cbSMESuJ2Nfg84a+Dn29xMw
 zQ01DQHubaBaLHnPF18zPCMx0YKupD/3oh2CJF1YkNqkOmH5KFFOBYR4OMCXWi5EFwhQ
 LrZQ==
X-Gm-Message-State: AOAM533rtYTQj2Oxy5vNPoXyGX9Ef0aOpu46UbxbHBI5fTZ3gngsLCml
 hGX8qfmapWY5KnFVWAzSvDR86W0Uu4iBIu4/
X-Google-Smtp-Source: ABdhPJyk2/7ABTNidCC1XmV5D3NZmdExL+TWC3PyPs4VmqDWOV7k2h22aNgjs8RwJquLbq3yoJnWQQ==
X-Received: by 2002:aa7:8698:0:b029:1be:aef7:449d with SMTP id
 d24-20020aa786980000b02901beaef7449dmr5734506pfo.60.1612403676680; 
 Wed, 03 Feb 2021 17:54:36 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q17sm3694217pfl.143.2021.02.03.17.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:54:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 79/93] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Wed,  3 Feb 2021 15:54:33 -1000
Message-Id: <20210204015433.885239-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 tcg/tci/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fb4aacaca3..f93772f01f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -314,6 +314,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrm(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, TCGArg m2)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out32(s, m2);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, TCGReg r2)
 {
@@ -369,6 +382,20 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrm(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGArg m3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out32(s, m3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
                              TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
 {
@@ -384,6 +411,21 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrm(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, TCGReg r3, TCGArg m4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out32(s, m4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
@@ -663,29 +705,23 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, *args++);
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
+        if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
+        } else {
+            tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
         }
-        tcg_out32(s, *args++);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, *args++);
-        if (TCG_TARGET_REG_BITS == 32) {
-            tcg_out_r(s, *args++);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_op_rrm(s, opc, args[0], args[1], args[2]);
+        } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
+            tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
+        } else {
+            tcg_out_op_rrrrm(s, opc, args[0], args[1],
+                             args[2], args[3], args[4]);
         }
-        tcg_out_r(s, *args++);
-        if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-            tcg_out_r(s, *args++);
-        }
-        tcg_out32(s, *args++);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     case INDEX_op_mb:
-- 
2.25.1


