Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE321337657
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:00:22 +0100 (CET)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMnV-0006IX-SR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUx-0003th-Oc
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:12 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUl-0006eu-VI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:10 -0500
Received: by mail-qv1-xf35.google.com with SMTP id h13so2640324qvu.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=ujddlbDp0iDGiwL2KQzyRl+W88O33tLngbGTc6kSb8B9MT/MDnF0kCX+26OocA8mQW
 0T2b7FsngafNgdktUqtoSP85/uzNxbA6gtrYe8S7VIWLRMaxHd12lOFvz+nuPAjIkADz
 np4e3SYGDDsJJcCWRfWm7NVqfsG84/cHeVHBMnAxLow1Isp7l+5/QWBJeBWe89Ar3tiR
 ScgYRwDjGqHQH5Oi/opkKfjgKuDLWhcjxJi9ZWP57H3TwvhlaajvfHZN0DLebC16zkjH
 oGkd8vfTgI5FYLtnZvqaXhPCAEeozbOlIY4FWSaB5ZAkopllzf/rrZ+9dMQU2rysOe83
 yIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtDE8Pm65Grc/U22TwT0AwuyG4b+N8yR6xVz8cz41eM=;
 b=r0o+wPdN4I0YA89wsCwBIkK4zhQVduvMOGjuNCubdpjT9B3K5v8FKLv6wFEkQ5uuTO
 /53MQmmuJmVP40HwzyY0+F0sTD/Jak5Gg9+eSbasvJslJwY/yQv7Q+3jPVEfUPTkkQjg
 2NcHELi89ZhF5QCAtQ4aBFUEzMGc0hqspeqjz5IbasXYH0HKEO3clrKvjgmcvgqtYQ7j
 lH9Ev8wvQHHWw7ArZYlEsKsZXNJUl0rRhyx0/34bvb56xj/HrunPCt2MVO3bfdFvRGTA
 LP4BrAqLSrG6cn8ckq/3aLN8uUiShoZ2iTQc/8t7vo5AkdctysXpC6O5fEgg+BzZGtUR
 FiWw==
X-Gm-Message-State: AOAM531KFvzpw4wQ8OcCXwiagI54vAKDN6UEk+QT73POVCm1cwoWKytM
 wRI/G8qZ4+K+i6xLxo1uKqbnVqIDI5u/MM5i
X-Google-Smtp-Source: ABdhPJxgO3/5dS3AQiPwE1qUEzxJyG+nqRfJ+ZU+B81eo+QOcxGr/O1Ye8gEBcHnw5ojvTIVS0wN4w==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr7974202qva.18.1615473653477;
 Thu, 11 Mar 2021 06:40:53 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 39/57] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Thu, 11 Mar 2021 08:39:40 -0600
Message-Id: <20210311143958.562625-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


