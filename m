Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D6B50BEBC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:31:31 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx7y-0000uh-4H
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwac-0008Dw-K4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:02 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaa-0007yP-3o
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:02 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p21so9219018ioj.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1DWNIJERXpZmtblRaXcb0XPGH7uKHZT6j2hdc+1VfWU=;
 b=GayDKhGpbmDIIHh3Y1uFVAzEEV9qZernKnwihxKnj0jmyXRIwnfWQzNFLq+mS6/Ear
 g5ee94kHIzffNwr+2Rc+cgG/r8QUsw6FiomLLXAqLOdBijM2nkguQNxZgqvcHJ2oY+dS
 XnJLEOOC883VV4pM9GCCe28G7JloCtzLsesm9gzrMAeq6iCWq/lD+mPCR5LWpfpQkVb7
 KQAiL0CcO+C2rjgld0tCVCEoLpWiEmy70b52GEYSLbRjBPfqgFCyvh1sVSdaNRNF6QH2
 CjFgz+AfbHdodeBCEgS10d/2pGje/slrsHOxvv5z7haKPgZByLWt6/khKWfsuLScJ/UA
 fV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1DWNIJERXpZmtblRaXcb0XPGH7uKHZT6j2hdc+1VfWU=;
 b=irmJTi0QBTtPN2LzLG2PiCb8Fxz9gAOPQ9dm8HWxy6L/m63qIRWPJh5v6NSXxjByv8
 /FABBbvkskq07AOQ4BWbxvtqdM6DtOx1trgqIdERuOIUgG3ntFxFZJJR17i2q++TI5Bv
 N35BdjC4DKUwTWhmd6Nifxr+E4kipXmHB/Qwllf0SHnoqs0y3ydimfck+LWMOl55vnX0
 r66D5jsnxcPcQ+3GALiYItvcaVC7L1DsNdxgTWPpydHpw/wYpfcG2aS6VmbF8Ry0t/tR
 ya+LbjyqLU/gatnSUntKffJD0YXrpq/ciReRy09MysGb8H4kA669fddEaNpNUfVdgnsk
 vxnA==
X-Gm-Message-State: AOAM531d2+/4BqhPw5TBCTwGWt287OuDf6EpS37HQ/tcExiRTcL/oFNm
 3j/Fw5C6ZYPLeHymqU43BNZL9zLSI3GfyWL0
X-Google-Smtp-Source: ABdhPJy1zOMtnZerhafFGdwW428v4xcyy+swmBSmsg3w+XDebB6QRaKBiQBn7Fw/oivcNN4dgj1ltA==
X-Received: by 2002:a05:6602:3787:b0:654:9cab:b681 with SMTP id
 be7-20020a056602378700b006549cabb681mr2426783iob.154.1650646619065; 
 Fri, 22 Apr 2022 09:56:59 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:56:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 43/68] target/nios2: Split out named structs for [IRJ]_TYPE
Date: Fri, 22 Apr 2022 09:52:13 -0700
Message-Id: <20220422165238.1971496-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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


