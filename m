Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997133F4E8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:03:43 +0100 (CET)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYe6-0002Ra-CG
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCu-0005PR-5s
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:36 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCi-0007Jx-Nf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:35 -0400
Received: by mail-oi1-x22c.google.com with SMTP id y131so39324163oia.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgoAkYC9IFNWuPeH+z6aBzUcnRdada5Ms22SlWibiTM=;
 b=PUSYzYJ98uDRacH5AZgsCz37yxlVZZlCXjwyM1WNYaCUlwM6CPFHMmARXTRErvu+tz
 8RGgyAtSQhDDlCRx7y04hGPooloSqGVu0TV8ttHxkg/fRZ3jmNANXIDeJk28ilhTT1CM
 YEe852Q0FNPHtRSLeudivRrcf3jHTTlMdqA6nmbLGMQIYSpHr9C6fX1pGupqmscUMMTw
 k4fRpBkAgjnEFSuM5560/xFwErm7VHCgHGACy5NQBWnePLJyBh6HE8u+7x/klf/DKQR9
 7z9AvPuzRDywFrSfzbUh15Kp8nyXlJn8HYuvb2BnbcWbrRBI/RKcqHhW8GQ6lSLLNqYl
 2C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgoAkYC9IFNWuPeH+z6aBzUcnRdada5Ms22SlWibiTM=;
 b=cNpbQ0eD4KSit75RDvc/EhYOKuR/FmxnqfF/o/PqWqcL8Cu3Edj/1Hx0M+H6QLWEge
 Ny6HHnUUtHFzrTI6BvSzwxLicqZ20+KOaibuf38VeDnIjpI4j5yQO1Kib56lUqZElwCW
 MTlshCAipGWZrLMMeqNLr68WLflDoXaVipUTt/XHInJmVWm+dllkueg944dg8/WKx3ux
 68rVnMNCXKntmgQH4Ar9wnnOQZGr1ddlKWBycRhPPMzl0+v7gYyFr/v5ELedJE4Fk8Pu
 0BvSGZhQWrT9m8qTJ7qLg4q+mL4YsLGNaNaIryQaG/XFXznKFqplae9zgtEtLGMwZ2dS
 gk1A==
X-Gm-Message-State: AOAM530lT5FXo8mfDcrPRzqVEWfCKEM2KpfCFXzdcLZEuZtrekE6zpIM
 cYJPxcaJli2Jpj85Y/4BhZHHjwDL7NxSQ2AL
X-Google-Smtp-Source: ABdhPJzAq4k59YQ6k85Y/w3JDUPxC+NNnOMbDST9/wc4i+QtOjciyrc2QzJp5VnJ50njHmOu33AILw==
X-Received: by 2002:a05:6808:1405:: with SMTP id
 w5mr3248113oiv.48.1615995323365; 
 Wed, 17 Mar 2021 08:35:23 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/38] tcg/tci: Split out tcg_out_op_r[iI]
Date: Wed, 17 Mar 2021 09:34:43 -0600
Message-Id: <20210317153444.310566-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
 tcg/tci/tcg-target.c.inc | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f93d587493..7e7b9fed44 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -326,6 +326,31 @@ static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out32(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
+                          TCGReg r0, uint64_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out64(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -552,25 +577,20 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg t0, tcg_target_long arg)
+                         TCGReg ret, tcg_target_long arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    uint32_t arg32 = arg;
-    if (type == TCG_TYPE_I32 || arg == arg32) {
-        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
-        tcg_out_r(s, t0);
-        tcg_out32(s, arg32);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
+        break;
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
-        tcg_out_r(s, t0);
-        tcg_out64(s, arg);
-#else
-        TODO();
+    case TCG_TYPE_I64:
+        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
+        break;
 #endif
+    default:
+        g_assert_not_reached();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
-- 
2.25.1


