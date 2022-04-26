Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF05108E6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:24:21 +0200 (CEST)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQnM-0001Cw-HG
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq6-0001wJ-6x
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:06 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq3-0005WD-N2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id d15so30989882pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3naWy5W9s9QUNBHvEd2IV7OasikpkGCP8dcpLW6o6A=;
 b=r+ZcJTyedtMurRSO1bGPvTL5hY5ZnQoqRVK+OQEKtIIs6Ph4kOpF5vqK0p4JfG8/Uu
 bSscVyeRjN619oO+8bXVcp6M3f6HsaTUCd8GvRIOWtg/WM52O+QszbF4IwgoP8H7ZWiA
 ntnLq37uVgace2xvjxujo0Pnizt97fDAAxQgZuP/lYgvyAykVk3LTmXOwGcjoJ+4OmbQ
 Vxiw+FAHSXoeDNvcug8ngAhi2E1+tCSMaMKvg0l1LO0QYidG2pXOWIcNa11WxlD5Leg/
 1YVvbizpgWxkkrYLQswoxiW6eiFZzNhyLGkHESbinyhT1K8DvyWFG4B0E6L3Fhj+t1DR
 fQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3naWy5W9s9QUNBHvEd2IV7OasikpkGCP8dcpLW6o6A=;
 b=Uf2jHfgkRWbZhJEV1+uhbK27FLJeUZMHZUb4mg3nUm1AU9cN3h7Ti0Wg3WBWbZc9kO
 9RRUQfQQT9kRFTnAzyctoEr/wdUwmxeolkgg2/ppanI+YNcTTuyF8zKKCaJoXMbWuTKe
 j7nmBYbAMmNNoLzEJ5xEsJEd2i7QT/RxVTaF7bCPErhtSuYfuAGp52PaeS2ECNRCH2je
 Xn5eTQYLiF/RUdmMWwN8rQ20VlKO9ZbSwmoHJzGqsJqrp4TSaGsOROovN1Xum9s0EN1M
 ayZZjTuT9rraAsGu1ROFf6628DpqfbJH1mAokDVukNuXlGuhHW9RSob6hsGpiQXJra7Q
 28Cg==
X-Gm-Message-State: AOAM531NQlreYdfMY3ofVKJih7zl/uNKEc7ZpPJVE3h3WDeBmzkPkw6w
 /ZsRunVHPjdPnh922PZkchfRZG7fkp+0bg==
X-Google-Smtp-Source: ABdhPJz5qkjWM14ucxkvFtpXDxB1wjtLX7P3nfXcBBdoojSBO0gBcnthVo83p/gGseesgjiAcLMuxQ==
X-Received: by 2002:a17:902:e34b:b0:15d:4d1:614 with SMTP id
 p11-20020a170902e34b00b0015d04d10614mr13877277plc.14.1650997382476; 
 Tue, 26 Apr 2022 11:23:02 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/68] target/nios2: Update helper_eret for shadow registers
Date: Tue, 26 Apr 2022 11:18:58 -0700
Message-Id: <20220426181907.103691-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

When CRS = 0, we restore from estatus; otherwise from sstatus.
Update for the new CRS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-56-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/op_helper.c | 10 +++++++---
 target/nios2/translate.c | 13 ++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index cca821cf80..eb171a33e6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -82,6 +82,7 @@ enum {
     R_FP     = 28,
     R_EA     = 29,
     R_BA     = 30,
+    R_SSTATUS = 30,
     R_RA     = 31,
 };
 
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a3164f5356..94040102f4 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -73,14 +73,18 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     }
 
     /*
-     * Both estatus and bstatus have no constraints on write;
+     * None of estatus, bstatus, or sstatus have constraints on write;
      * do not allow reserved fields in status to be set.
-     * TODO: more than this is required for shadow registers.
+     * When shadow registers are enabled, eret *does* restore CRS.
+     * Rather than testing eic_present to decide, mask CRS out of
+     * the set of readonly fields.
      */
-    new_status &= cpu->cr_state[CR_STATUS].writable;
+    new_status &= cpu->cr_state[CR_STATUS].writable |
+                  (cpu->cr_state[CR_STATUS].readonly & R_CR_STATUS_CRS_MASK);
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
+    nios2_update_crs(env);
     cpu_loop_exit(cs);
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e566175db5..b52f98180d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -496,11 +496,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-    tcg_temp_free(tmp);
-
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, CRS0)) {
+        TCGv tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
+        gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
+        tcg_temp_free(tmp);
+    } else {
+        gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
+    }
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
-- 
2.34.1


