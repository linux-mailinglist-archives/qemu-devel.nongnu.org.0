Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A712031294C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:24:00 +0100 (CET)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x9b-00031W-OM
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSa-0002kx-QI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:32 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSZ-0006AN-0W
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:32 -0500
Received: by mail-pg1-x532.google.com with SMTP id o21so7854032pgn.12
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=AOplEWi9iVKeLJiKb5R1Zxw9IuUZ18qYjbAv6LZ6F+drllUpyFCArhzW09N0GR1Mvc
 IV7/lYLoUU7hQbn8TgNwv4NmuLVDPTFLFlA9VXiCaO7GwrwuXdcTDV6M0b/RL8EnvVar
 TbcWen8nqdRFpvOKnFAqygD4nRgAAI7aqWjD8r4NwcZdGRiR28VUbN7jg38YXlrv+Ekw
 fZ/DXfMfGv5jogfHuToqeTToeD8WMYUasmA4cB/AGuvNHtTnQDU/GUYycKvEJNyg01YK
 SeqjMiEDvD8mBOfR0JaGcU9NlknX8C/84SWaBSrYlsVtUh/saVye98M6CA/raJ72HhkS
 /9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=L+PmWJwN/MM+aupK6cXeHsn666lrRImfC4pYjuwSGcs/4DgVaEBsBOCug4P1Pw7vl7
 PehxrlZHl+q+9GWtNT9E3hjM5QSvaKR5UTtk2XIyOtlOhqgFC5WitGTftrOiqIsl2mv2
 RbPCwITyu6nuUy91SGfcaNtWDHYsqlsn8hJOksMIkrHgS7HHaBNpoum8O25owIaV4Gc2
 K1tbslSgNR/Hysb8J2sZ9U6vFt5rVwbLKEMKlITrYrQtNxEb99zBeBtJp6gpOvoj7Zpa
 TGBwe2GTEr798aeqrRkgHwCG2nt6CGph2lZGiwpGK6K9MANsOXAVmaI0QHyUxgNJMQZ7
 AqmQ==
X-Gm-Message-State: AOAM5317nNCXfHPtgLho3Tb72ufbXo6Ga7zNXqOgyBJFXxboXj8VcvB6
 rcOzWyzbBoA9n4yhH2jc1MHPz9QjM0EnYg==
X-Google-Smtp-Source: ABdhPJydGXEDI31/lre9gd9lVUn0c1EiQkJpM1kjgYGT8ClShqVqRmEESO4gb1Xt436TW/tE6nHEEA==
X-Received: by 2002:aa7:8497:0:b029:1bf:47c6:523a with SMTP id
 u23-20020aa784970000b02901bf47c6523amr15913113pfn.0.1612751969468; 
 Sun, 07 Feb 2021 18:39:29 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 54/70] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Sun,  7 Feb 2021 18:37:36 -0800
Message-Id: <20210208023752.270606-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


