Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A45108CE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:17:19 +0200 (CEST)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQgY-0004ZZ-63
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpr-0001nv-Up
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpq-0005MM-9t
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:51 -0400
Received: by mail-pf1-x429.google.com with SMTP id a11so7479479pff.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1DWNIJERXpZmtblRaXcb0XPGH7uKHZT6j2hdc+1VfWU=;
 b=lQ3SMUA15RscWulhrEmMAzLqxPIB/uVaZKFlJvSB+3qmMcSwgixY8k8MkFteoGC8Lo
 YmDPuVkFK4YopQH4i5eCR8qVhnVMYkR/UQciZLbQ6D6m/5gbazBInjtDv8vT2q5AG+LL
 Ta4F+LvlcOypzjLzjSYHqDsQkbYtdhT3ypmrsSa+/2l8fRxX7msx5BN+O+u8wBteJqVh
 fDILOdWBpJSe1zXq8ikbnc9tx//+7dKGPKEfG+RJoAnvoor6dOMWRQvNqisZ1A+S8rH2
 QVj4s6IFkvmm+/Xnc9eSF/TcnrV3DLeVDxEBuHovUV695E7GbdbD+Gbi5+Mg4G1qv/25
 pxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1DWNIJERXpZmtblRaXcb0XPGH7uKHZT6j2hdc+1VfWU=;
 b=x7tv3hKbeZY/JkZx9uoJkOMoqVRbdXmbga631CAkW5yCP+SUa4KBI5g8uEg5/uZHjE
 e4BbFz7scBHe2IpJHEWdTbh17CsyKZe+7I5ETyn1n4o8dcv2GvK2w9yzZu0MXjFABqsV
 GpmILD8koHbgXNMVj1J/5fcuD6eA0L3mvq6yolHJcqB8qRy9/jDJcMFNsLmMPOxfhzv0
 d2p9h5hq4T33q+6c/jiC5fpJTusVNha9DsYr0ixxCb1CuBWQP5B7AJ+gsVDbv4VW1ELu
 AhTqhh7s6cEIq4A2ykGhHpeaTIvbBW0TlIaav1E3b2RbMox3tp19fOyrVmMc4P2oIDz9
 wd9A==
X-Gm-Message-State: AOAM531AkZJS5hEZONADIILPpWaj3tnJPbe6+nIJzP8tpHKWAJAbw4ba
 5uCQaRHo3pgF91WZPAnf7gvjYO/fMeMvrA==
X-Google-Smtp-Source: ABdhPJwKZ4Ju6mq4kc5bgHt1vdwz4T8A1FV28n0ZxVU3gm+89rUEDiqFykIvw7p65NnMdCdUrEwntg==
X-Received: by 2002:a05:6a00:1d24:b0:50c:f8b5:974d with SMTP id
 a36-20020a056a001d2400b0050cf8b5974dmr21479759pfx.76.1650997368673; 
 Tue, 26 Apr 2022 11:22:48 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/68] target/nios2: Split out named structs for [IRJ]_TYPE
Date: Tue, 26 Apr 2022 11:18:42 -0700
Message-Id: <20220426181907.103691-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the structures are anonymous within the macro.
Pull them out to standalone types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-44-richard.henderson@linaro.org>
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


