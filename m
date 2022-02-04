Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C00F4A94C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:53:49 +0100 (CET)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFtPg-0001r0-8H
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsaM-0006gv-CN
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:51 -0500
Received: from [2607:f8b0:4864:20::f2e] (port=42694
 helo=mail-qv1-xf2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsaH-0006UJ-OO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:45 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id k9so4637869qvv.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0ZkQ1X6XeXxAobJERi5w3sTXAysUl6elMTzRVCZxPk=;
 b=J4CjSjDrJ1yHaOHhu4o07+uQV9aRHBd19us2cPXqAC2n7F/Xu69tH7j5BfPfm7ndV9
 IV0O2mswJYpRlIQcuPkqcBKZa+3Vq9Xc2L2mYpBa/jSPSQClBgS5AWxY7/VEK3JLUrI9
 /NV53H0s9OMku7qN6ef1UaVr5wV48TaStWN862GoFLr9kYJKk1hvZAr1c+Yq35JzfreK
 yc7+I8UTjU2ipSmrsq9InMe7Fyd4ewNRIkYbVPgDx/lFejcFuu6Wa/phWu+dsOSiILqU
 ks+uumGnym54wAQOYrA5rIC8tWk0hzu0bCoBzbyeOpKw5JubnwbY1Lx+2ki7OCJwQFLO
 UXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0ZkQ1X6XeXxAobJERi5w3sTXAysUl6elMTzRVCZxPk=;
 b=XW5nXTwxgSxJ9J4lfXR6kCMHOYzQxHxVGsv1K4D9NuSUsnKuddwOyLBl1fueOfyBmS
 XYFmw6fsbBfDQ+wi6JsuXF17mPrXd67T2dR08Zf2Y15jHqL36lHkrFrUU9dUwWBXcMpJ
 ZfKRsBKQ/Ry9emBFx7/a3elIwXSfZcSSj1oZNPNIGqdW6H5vRgfG7/K1uQNzTZIjS681
 /+f0SpvlLyxlSmM8AuKAp/x5Zl4ccGkFV/yF+gNym2GAt5UniYeYRqdbBN8DWYtrRNhq
 1bXfBnJRsUmCRx2Id3zLPMyG04+5u1YC3VDn7dAOxd3CLa2eeXGmZicTT/gW16qgSmTu
 TBEQ==
X-Gm-Message-State: AOAM533ZFsrpf/pAz046foi4E7xIZO7gS1LxjC/9ciwdjJrSDzEsJuZO
 TLOFt4bECq3qrpyKxslsIMOWTAqXjy3wUivO
X-Google-Smtp-Source: ABdhPJxK+BSv69qlB+GpgM8lWFl3ExX54+sGtcxtNmNy8CX1kja5Y8PV1XdjPYyZSAyZmKCVZNMZBw==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr1784274pfq.17.1643958026807;
 Thu, 03 Feb 2022 23:00:26 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] tcg/sparc: Add tcg_out_jmpl_const for better tail calls
Date: Fri,  4 Feb 2022 18:00:10 +1100
Message-Id: <20220204070011.573941-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204070011.573941-1-richard.henderson@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to mapping changes, we now rarely place the code_gen_buffer
near the main executable.  Which means that direct calls will
now rarely be in range.

So, always use indirect calls for tail calls, which allows us to
avoid clobbering %o7, and therefore we need not save and restore it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 47bdf314a0..82a9d88816 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -845,6 +845,19 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
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
@@ -853,10 +866,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
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
 
@@ -947,11 +957,10 @@ static void build_trampolines(TCGContext *s)
 
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
@@ -993,14 +1002,14 @@ static void build_trampolines(TCGContext *s)
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


