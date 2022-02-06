Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21EE4AAEDF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:41:40 +0100 (CET)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGezE-000623-0K
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:41:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepr-0004YG-4P
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:59 -0500
Received: from [2607:f8b0:4864:20::1036] (port=41562
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepo-0002P7-Po
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso2682711pjg.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ImT7wzJBDrhz3ovMgkV3A0ihyEm0HORmcQXzqn89pPc=;
 b=Uy6fJCUthr+4oEllnEZR0mp72KfpTdEynQBulcNEnhgNPSJxQZrpz92f9Ybi6eGf8u
 OYkCifs/qPfqekTgTwjodAdFQOihPzYMEVkieTZnBnk6r8CKbFDQndQ9HxVWIC2xTTBT
 bs7DdzowX6W5WAIwe3VMlmSbyl+GU1EJT1gCix1tfsgXMwdobvcIZpwb/EsOD+zg3Hrv
 QB5yXGSCyJXJXOnBkxmO1L1BDAhQDOi+acv5mWt2VyGDCZY4cyZIryiESwR7KXGlgrT2
 oGXok9x2Hdl0GhdUp4o3mUAPz2gBIkOKYfh7Gw4j7bfXnpfS85WCwH1SvN7p7ysSaV2T
 kLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ImT7wzJBDrhz3ovMgkV3A0ihyEm0HORmcQXzqn89pPc=;
 b=LYkHE7aeYjP2wWkLDP+Gb2yHS8cGFFtsWkbxBpzJV2ivmay4nnEFZ7j8RY2baBZbx2
 k3uK03PVy/xt4Uy8XKlhovpIC2RMZ5DzeXrHHFHS7ny8RwLF9tmxsLk53hzbG6OMCP39
 oXcFPc8yoYqQu4DJgh4X4w6EYVuM3kYXyPA3wQ5Ijmn40YttQL5vzLRW81MkU4nQHbcm
 8Y3vPvh9H29KoLikBzJqhvYWkVf8Smbr0epUIQkeMLkirPxhdSrKPizptdMV3JtguiRw
 y+hpuskukcGKig4xIvxDrlWm47b5CluVVErj7cxI6AkJ7WZxv4i/l4iEAbYzNTa0pdXj
 eX6g==
X-Gm-Message-State: AOAM532MWk1aJV2hnt7NQke9/T+9/VvebV1YmWqhlAjW57u3F5rg3AFT
 tR3yN5+GMGMovkmZcF5+clGVbPxItnoBCrFc
X-Google-Smtp-Source: ABdhPJwWsCHLjNtvgZShWJ65Rjx5dj42C2lq2G/nSD3ykn1SN5zCZW/EEcqmRcwy54GMHtWyjA/rXw==
X-Received: by 2002:a17:902:710c:: with SMTP id
 a12mr11515339pll.108.1644143515547; 
 Sun, 06 Feb 2022 02:31:55 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/6] tcg/sparc: Add tcg_out_jmpl_const for better tail calls
Date: Sun,  6 Feb 2022 21:31:37 +1100
Message-Id: <20220206103138.36105-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to mapping changes, we now rarely place the code_gen_buffer
near the main executable.  Which means that direct calls will
now rarely be in range.

So, always use indirect calls for tail calls, which allows us to
avoid clobbering %o7, and therefore we need not save and restore it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 074fb25af2..c81782d6ce 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -850,6 +850,19 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
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
@@ -858,10 +871,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
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
 
@@ -952,11 +962,10 @@ static void build_trampolines(TCGContext *s)
 
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
@@ -998,14 +1007,14 @@ static void build_trampolines(TCGContext *s)
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


