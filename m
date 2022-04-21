Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F350A4E6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:59:52 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZDj-0002ah-A6
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcv-0005LS-GP
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:49 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcs-00075e-AR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:49 -0400
Received: by mail-il1-x12f.google.com with SMTP id y16so3246274ilc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=53MZZNDB0rhSLJpIhEdQDdsMsfXozPnpLTtHb5F2LMY=;
 b=Mog8qViM69Oo9Ol8+uPv9Ady9VlEjh8mTqWt0wI1ngSr+oMxuyHeOpTs/5PCCbYBaW
 Kv2pukagCZ39cX7NWrrw310cBHYrXED2SD+GkpgU6k+5GPBjLHe038JSxFOYUz5TNjlg
 zNKvA2TF52lQovVd587pGfOGp0nECjMyLVo6SIRoLseokkF75Ls+F5smWeuIyoFueXb0
 rsLdLAg1+kyzIRAhnJbQ29LbD+mKYtFjpOJn1OdzKc44C704fsvt6X5ICpqsPcDHBMhL
 yNavWkVuzZQA9WFJkeai19Q9/mq0ozt+zy9uKsCtWngNJ4ODcwbpz0etk14z1T6fVb++
 Ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53MZZNDB0rhSLJpIhEdQDdsMsfXozPnpLTtHb5F2LMY=;
 b=DpMw8b1okRCVKuk3AUOWfV59nJdESDNeynBWeW2MYfYJYlJrrym9NP5DjMdFE+dfrY
 nF+xnpNZrFiODAxwRQ0fG5u06L5nOwr3bBUu78NcJkpgIvBtUJ4tXaHaBz3wh/b3H9FJ
 IUIr2H5HnoKsoIFj4pL9QGgHohHG6gGVtsy/OoDoG2IswCGOPu8Rp41wgIBTsSLyUdPc
 T7Sl9LrBu5pres5BRyKPxzvabKavvOI+eW3ZuyRpUHcXSc1AV8vvcF/NryB91gJP+v7p
 HgbJtXbKiXIVORLx0XKfxCON3uYUXNzZDio5keJX8G6N5ImjFbAlEt9jLg6Svrm640C5
 Fhjg==
X-Gm-Message-State: AOAM5328F/i5LleCuEXOgVDP+91qYInZeEjRDH7FWkDYnLofrSsWD0ME
 107wHGC1hM2cAtWZx/8RDSCsFsCbY2iscQ==
X-Google-Smtp-Source: ABdhPJwu86edo05NQ259BwXJ/SQ3+DqnxsdBsUWBM+JumfyJ0YFCI5C5sihZdMcMTL3A6X3ldlo2Mg==
X-Received: by 2002:a92:d212:0:b0:2cb:7635:9940 with SMTP id
 y18-20020a92d212000000b002cb76359940mr86318ily.132.1650554505232; 
 Thu, 21 Apr 2022 08:21:45 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 43/64] target/nios2: Split out named structs for [IRJ]_TYPE
Date: Thu, 21 Apr 2022 08:17:14 -0700
Message-Id: <20220421151735.31996-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the structures are anonymous within the macro.
Pull them out to standalone types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 48 ++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f33015f942..a3c63dbbbd 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -53,16 +53,18 @@
 #define INSN_R_TYPE 0x3A
 
 /* I-Type instruction parsing */
+typedef struct {
+    uint8_t op;
+    union {
+        uint16_t u;
+        int16_t s;
+    } imm16;
+    uint8_t b;
+    uint8_t a;
+} InstrIType;
+
 #define I_TYPE(instr, code)                \
-    struct {                               \
-        uint8_t op;                        \
-        union {                            \
-            uint16_t u;                    \
-            int16_t s;                     \
-        } imm16;                           \
-        uint8_t b;                         \
-        uint8_t a;                         \
-    } (instr) = {                          \
+    InstrIType (instr) = {                 \
         .op    = extract32((code), 0, 6),  \
         .imm16.u = extract32((code), 6, 16), \
         .b     = extract32((code), 22, 5), \
@@ -70,15 +72,17 @@
     }
 
 /* R-Type instruction parsing */
+typedef struct {
+    uint8_t op;
+    uint8_t imm5;
+    uint8_t opx;
+    uint8_t c;
+    uint8_t b;
+    uint8_t a;
+} InstrRType;
+
 #define R_TYPE(instr, code)                \
-    struct {                               \
-        uint8_t op;                        \
-        uint8_t imm5;                      \
-        uint8_t opx;                       \
-        uint8_t c;                         \
-        uint8_t b;                         \
-        uint8_t a;                         \
-    } (instr) = {                          \
+    InstrRType (instr) = {                 \
         .op    = extract32((code), 0, 6),  \
         .imm5  = extract32((code), 6, 5),  \
         .opx   = extract32((code), 11, 6), \
@@ -88,11 +92,13 @@
     }
 
 /* J-Type instruction parsing */
+typedef struct {
+    uint8_t op;
+    uint32_t imm26;
+} InstrJType;
+
 #define J_TYPE(instr, code)                \
-    struct {                               \
-        uint8_t op;                        \
-        uint32_t imm26;                    \
-    } (instr) = {                          \
+    InstrJType (instr) = {                 \
         .op    = extract32((code), 0, 6),  \
         .imm26 = extract32((code), 6, 26), \
     }
-- 
2.34.1


