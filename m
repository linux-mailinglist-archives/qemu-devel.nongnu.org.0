Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA57700A81
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:42:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxL-0006m6-CH; Fri, 12 May 2023 10:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxJ-0006lE-7i
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxF-0004gz-JG
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso59001995e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902468; x=1686494468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHxiI1NhG4rA3nZaGSdOO6mlH5N9NfHL+3owTRsYSs4=;
 b=GrJuo8N9eY+5PfV4Ljz11Zy9T+NVtMeGfoDrQhP8XpZfgOnSOoY7cAhiVnJcAmgYoA
 Oy269pkMkVqKaPEr8gJEJJ3z1OXXAdEXlbwAAgKQSbGBf7qNoDJV0scONurbf5wl7B1h
 t/1WxxWqQydzVTNrB6AOdEFoBhN4I006WptYZZ3FBshEYnDzRMfBYBzGpnFRfPFiUGvg
 CI/uBrurOmvuZ5OQsthqYFZDAFyoKEap5UmT640NMw0bb42M6ddp/fEyykEZKW5fUwyz
 xmpV94Sy56rPT3eh+M3wrYFwF4yDjTH3+OyoA+/f3CnJBbfVI39RRP6rb1UQs6lHNyQU
 5wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902468; x=1686494468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHxiI1NhG4rA3nZaGSdOO6mlH5N9NfHL+3owTRsYSs4=;
 b=d3COHZdsxZsfknGb4gQPb05tQoi70/dtC+Yx9AM0OdSAaxtFGQz3UJF3+OV6QVhjMn
 1uzewxKLo81c2yaWf3ql0avOBxMBKxufQih6BagOhx5ho3yfQjX66QMGI/1NJsD8EuF4
 AbJ30Y3vqi2IC2lfLAY657xyEImRRvHAQBwr8Gw404p2wet/y0rYrI/5oTuW8Ix/7ZYy
 ihbvr+vzpFAEpOqNaPF4y1f76AOmls4X5sEBQEHZaN+v8wk1qZDytyywMOm+ygasdR4T
 3ZW+m/0BHKnvKEQUFFHhwHL+NTQDx2EheyZHKpsdpGUU421Jpnu3xRu7eAj/Eemi354D
 yEZQ==
X-Gm-Message-State: AC+VfDyDM5V6QfRwQ7IQEKNSUCiUnSnBfXQvEu3EuqzLdNYPOOBg4q2s
 qoIksxsw5AqyVeY8O1ZUksL/JA==
X-Google-Smtp-Source: ACHHUZ6z/VCrKYGCkPaMtPAiTWDojk+erVjyRBesN7e/kUc0Y7PAXnk1BzYLh8YBdpsSTNh19nIYYA==
X-Received: by 2002:a7b:cb94:0:b0:3f4:ec32:69fd with SMTP id
 m20-20020a7bcb94000000b003f4ec3269fdmr3500814wmi.40.1683902468052; 
 Fri, 12 May 2023 07:41:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 01/20] target/arm: Split out disas_a64_legacy
Date: Fri, 12 May 2023 15:40:47 +0100
Message-Id: <20230512144106.3608981-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Split out all of the decode stuff from aarch64_tr_translate_insn.
Call it disas_a64_legacy to indicate it will be replaced.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 82 ++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index dff391bfe24..8a0ede96440 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14200,6 +14200,49 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
     return false;
 }
 
+/* C3.1 A64 instruction index by encoding */
+static void disas_a64_legacy(DisasContext *s, uint32_t insn)
+{
+    switch (extract32(insn, 25, 4)) {
+    case 0x0:
+        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x1: case 0x3: /* UNALLOCATED */
+        unallocated_encoding(s);
+        break;
+    case 0x2:
+        if (!disas_sve(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x8: case 0x9: /* Data processing - immediate */
+        disas_data_proc_imm(s, insn);
+        break;
+    case 0xa: case 0xb: /* Branch, exception generation and system insns */
+        disas_b_exc_sys(s, insn);
+        break;
+    case 0x4:
+    case 0x6:
+    case 0xc:
+    case 0xe:      /* Loads and stores */
+        disas_ldst(s, insn);
+        break;
+    case 0x5:
+    case 0xd:      /* Data processing - register */
+        disas_data_proc_reg(s, insn);
+        break;
+    case 0x7:
+    case 0xf:      /* Data processing - SIMD and floating point */
+        disas_data_proc_simd_fp(s, insn);
+        break;
+    default:
+        assert(FALSE); /* all 15 cases should be handled above */
+        break;
+    }
+}
+
 static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
                                           CPUState *cpu)
 {
@@ -14401,44 +14444,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         disas_sme_fa64(s, insn);
     }
 
-    switch (extract32(insn, 25, 4)) {
-    case 0x0:
-        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x1: case 0x3: /* UNALLOCATED */
-        unallocated_encoding(s);
-        break;
-    case 0x2:
-        if (!disas_sve(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x8: case 0x9: /* Data processing - immediate */
-        disas_data_proc_imm(s, insn);
-        break;
-    case 0xa: case 0xb: /* Branch, exception generation and system insns */
-        disas_b_exc_sys(s, insn);
-        break;
-    case 0x4:
-    case 0x6:
-    case 0xc:
-    case 0xe:      /* Loads and stores */
-        disas_ldst(s, insn);
-        break;
-    case 0x5:
-    case 0xd:      /* Data processing - register */
-        disas_data_proc_reg(s, insn);
-        break;
-    case 0x7:
-    case 0xf:      /* Data processing - SIMD and floating point */
-        disas_data_proc_simd_fp(s, insn);
-        break;
-    default:
-        assert(FALSE); /* all 15 cases should be handled above */
-        break;
-    }
+    disas_a64_legacy(s, insn);
 
     /*
      * After execution of most insns, btype is reset to 0.
-- 
2.34.1


