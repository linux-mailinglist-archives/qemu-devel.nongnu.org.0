Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B4643C2D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POh-0003Na-7h; Mon, 05 Dec 2022 23:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POa-0003LO-RL
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:29 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POY-0006wN-MQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:28 -0500
Received: by mail-oi1-x22e.google.com with SMTP id h132so15591079oif.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QmeEoNvi3/gFzSY8V7j6nN4NuJzUHgEhMQK1/FSFS4=;
 b=WFMlXzRZ+4rhrGTbHRrz4XXMPapbLw6vyVV+5hK6v5/RaFyMn6okaKQNo1PPCYQb1b
 PpNJYIqXTXMr5W5ApKunRkXxjChvTE48AH5TcHzWMOi2JsJ/K7Tpy/uyO9E7nWBF+N3n
 DA5P7X0lQP9t4awt7kp8P6TxPVgWw84uxTT1BrD1L8Tu1tPV54V2kCWL/h1WAMVnDi0E
 vv5xBfqPfuA0mKF+oIpZnQgYmXmx/9b6MIC2T7Hjd35pFYI51FSESBkI/xrHx8Tl4r5F
 myPfYa2e1TGXQLEcjUXP8FTGZ9+8M8Ieqx1d7YRScpzPUIvZPk2t7tHAIo2RZnYvdnH+
 71Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QmeEoNvi3/gFzSY8V7j6nN4NuJzUHgEhMQK1/FSFS4=;
 b=DjCc9UYlzq2zDPBIMagIpj5mxEEda5xbNfu1PS06XSAiSJgETzGLTPc5tiLI+DiRGB
 LTWPI4VIPyDYA0ywAOlybBInHJTjbCgiZ0oPFOMpxkY4mb2rjD5fm87VF+Wq5MfOPKsK
 rZUADlP3/gkTq/dLNjJXurNg/DTai/0cMCDsqzofiZDzTfLtl8TdWjDuCOLSq7yhAhce
 VT3mmpKiwsceRkQDaYS23AS4Dcn61IYabAHrdbDbEdhDoI+4p1JFLbs1i3uOpm7H3+5o
 V9frEGBndVmKRREEHUTRDQ1cWn5M4nKDCF4jwh72axeyjeQ4/KFw+Wbgua9Rs6AzJHoX
 iwIg==
X-Gm-Message-State: ANoB5pk5aelqWqZUMUXCq7fcbKhKKYZvE27xqhrokI9i1UOuaqO7rG7F
 u7KHAnkj9/qN4HBL5PNd/QPoYHnhRGaH96YYSqc=
X-Google-Smtp-Source: AA0mqf5XLukppLEps5bo41OpOmSCTs2JyhSrX8METgVd4rBIa9KfTvojytZvEN5A4W4vjUZwc7EJkg==
X-Received: by 2002:aca:a815:0:b0:35c:dee:db96 with SMTP id
 r21-20020acaa815000000b0035c0deedb96mr5988905oie.235.1670300243665; 
 Mon, 05 Dec 2022 20:17:23 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 04/22] tcg/sparc64: Remove unused goto_tb code for indirect
 jump
Date: Mon,  5 Dec 2022 22:16:57 -0600
Message-Id: <20221206041715.314209-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 1e3351a4e8..f035bf7dd2 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -537,17 +537,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
-{
-    intptr_t diff = tcg_tbrel_diff(s, arg);
-    if (USE_REG_TB && check_fit_ptr(diff, 13)) {
-        tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
-        return;
-    }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
-}
-
 static void tcg_out_sety(TCGContext *s, TCGReg rs)
 {
     tcg_out32(s, WRY | INSN_RS1(TCG_REG_G0) | INSN_RS2(rs));
@@ -1462,27 +1451,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            if (USE_REG_TB) {
-                /* make sure the patch is 8-byte aligned.  */
-                if ((intptr_t)s->code_ptr & 4) {
-                    tcg_out_nop(s);
-                }
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out_sethi(s, TCG_REG_T1, 0);
-                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-                tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-                tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-            } else {
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out32(s, CALL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (USE_REG_TB) {
+            /* make sure the patch is 8-byte aligned.  */
+            if ((intptr_t)s->code_ptr & 4) {
                 tcg_out_nop(s);
             }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out_sethi(s, TCG_REG_T1, 0);
+            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+            tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
         } else {
-            /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
-            tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out32(s, CALL);
             tcg_out_nop(s);
         }
         set_jmp_reset_offset(s, a0);
-- 
2.34.1


