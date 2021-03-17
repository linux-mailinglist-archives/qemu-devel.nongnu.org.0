Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF333F4CE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:59:04 +0100 (CET)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYZb-00077q-Nh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCq-0005N6-OC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:33 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCg-0007JC-UO
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:31 -0400
Received: by mail-oi1-x235.google.com with SMTP id y131so39324039oia.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmnDEWcNjBI0CV2v+4la8ocEzwYbaD/h2AKvp5PoRaQ=;
 b=kicFyuMaTDrZfHZIcDo6QPxj1BaobnhlzHUPUFK9vTnmC8TdiCtK7euaXMLsEtlpTm
 lpW52QCMscu4d8nVfd5MNgZX7C85dc8iyq38zSISxvikQQZN5dWvpgXuuD3k3wN/3rZZ
 4mwl3QPaQ0Bosi5r68a+f45DTj2GdnPXI9OszR2IsBItV7OgO/+zVCwRaEK2diZ8KAMH
 p5xVjwZtwLQByPUeNgjjr0+e2UCBbaAUSW4d2VbX4nY5vepuXGxAnzVzJeXL1/Myhxy9
 0E4opSW7uwUfKUz5l518y4tD6EDxM3eno9RtSRZpPBC0PRKvXPijuTGWrClfagC8sQmJ
 VqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmnDEWcNjBI0CV2v+4la8ocEzwYbaD/h2AKvp5PoRaQ=;
 b=JxnD/swvD2FjozL6izROMUsQ1dlpnMmc5SC38vtx5iGKlFkCaCsQKSF/9OnNOXMz6Y
 NQ2ZKEy1WICCR1P/3JvUzN9Bz1/Lw4LBMqZM+UKu5YOYVB0OCUy/VlOip3DJgVScDyBB
 H+3ROoK9vkTHWAloqTiTGNJJbMOKvEERoK2yLg0zQkG3XBiw6tdN3ytAx3067CSel1mp
 ZdarbtL/sf6NCAI9tEJ+OVD9Ze1j0NwHIqFzDNMgjQjbtyA6GPLZUSkPDZLwaA972sGt
 K0zl3Jr1okPx4kO9DGVY0Ha6vd4uGalKpr0yYwtVJT6llk6rPxtDuGbT4RbPEqTL62Nb
 1R0Q==
X-Gm-Message-State: AOAM531rJ4j5gBfz5pc6ejZa6MVvFkeTinz83m56loTJfVEavM5sHqX+
 DS2LnQVfT9FRJr5Z8sJfeqMBNXVTZYWCy4JI
X-Google-Smtp-Source: ABdhPJyhSGvTcdqtTunIysa4i8+D2ewkFEAfA5tOurGPjZtekD5rX3b41EXFEbUFlDKov/OF5Da8JQ==
X-Received: by 2002:a05:6808:2d5:: with SMTP id
 a21mr3270143oid.88.1615995321315; 
 Wed, 17 Mar 2021 08:35:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/38] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Wed, 17 Mar 2021 09:34:41 -0600
Message-Id: <20210317153444.310566-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 86b59179bb..2aa0997ae9 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -328,6 +328,19 @@ static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
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
@@ -383,6 +396,20 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
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
@@ -398,6 +425,21 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
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


