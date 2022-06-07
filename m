Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF3541E54
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:29:15 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhhK-0007Vg-JH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5l-0007H3-Tn
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:23 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5k-0001P6-9R
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: by mail-pg1-x536.google.com with SMTP id s135so1341699pgs.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVpqLWTsPExWd6f8jF1EY/VDSSozWoVLxOFKhLPqh5c=;
 b=SJknkGx8/pq3lb6/gLJhL5UIi8p3mx6c+Syrkssfa6HTjwfxO/RpyTMHGGucB/Mc+J
 2mgK6QA3TUB3I1VZj9Z6aDt2u5yBNWsSigGIXTDOqRBxI3yAGg0Tm8z9dJ9Ujgxr4HiI
 acREI4cU041T48qwwToCodtav5vaGwpxTREivyi/agY+7NqIrfsM3xJYpxG/sp5b3FJz
 nTeCeHJV3Y5NwFhPkly8MrbGUS8t4Kenu8wUjwD7DCiPXRklRJTzKegZ1bM86R842xAG
 8NopC2f7EGxooYxB8QeSiO90iEq/M0LPD3lt2V91hDOd/4fq2QVPndbaTdJWuFCsbv5L
 qn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVpqLWTsPExWd6f8jF1EY/VDSSozWoVLxOFKhLPqh5c=;
 b=VFM98XspYR+ZR+9nhY9FYtwRg18/tVAd4Zk21JocaK/XNVUSZEvRL4CGLcbeoghwoa
 jW1kkf9YjATejushQxww44NmQxhX8U3JxyldP9XjFiiZU6f8CO/ip4pdbqIq3bozKG8C
 cIh7IfwaXyqbPeC8nQBiOcfVSors8eDD+LdjI01bz6qwVSdI0lqtQOdGfs7fBCPk5CEg
 I6I3yn6ZulV/3JHziTH5gA7z8aQfeyqUqn3Xj1ppKzD0UD7JjNnB5RXWH9rxqgL6pihZ
 7SyaTwWW8oei3KnRwpPEcBTR+opYGnId536lqAm/w98l54bAOZSzEJCSTiuCDvUGKD63
 maow==
X-Gm-Message-State: AOAM530ceP6KL9/IukCb7rEhW0wc4ZWAQbdw6vZPabTQ1c3Lan+vcT2E
 qWlEKtJoh+IZGgpj0eDFZ9pNoYzyKGqgPw==
X-Google-Smtp-Source: ABdhPJz2gQf9UDXhWV8N9aDCeSaVYxjWbMM5rZOCyjwVnwfHfobuZNcjL9N0z31Tby4DrgbTMzRsDg==
X-Received: by 2002:a63:4a4b:0:b0:3fa:8a72:b2 with SMTP id
 j11-20020a634a4b000000b003fa8a7200b2mr27283079pgl.544.1654634779024; 
 Tue, 07 Jun 2022 13:46:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 22/53] semihosting: Split common_semi_flen_buf per target
Date: Tue,  7 Jun 2022 13:45:26 -0700
Message-Id: <20220607204557.658541-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

We already have some larger ifdef blocks for ARM and RISCV;
split out common_semi_stack_bottom per target.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d2ce214078..7550dce622 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -217,6 +217,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -246,6 +253,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
 #endif
 
 /*
@@ -301,31 +315,15 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Return an address in target memory of 64 bytes where the remote
+ * gdb should write its stat struct. (The format of this structure
+ * is defined by GDB's remote protocol and is not target-specific.)
+ * We put this on the guest's stack just below SP.
+ */
 static target_ulong common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp;
-#ifdef TARGET_ARM
-    /* Return an address in target memory of 64 bytes where the remote
-     * gdb should write its stat struct. (The format of this structure
-     * is defined by GDB's remote protocol and is not target-specific.)
-     * We put this on the guest's stack just below SP.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-#endif
-#ifdef TARGET_RISCV
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-
-    sp = env->gpr[xSP];
-#endif
-
+    target_ulong sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
-- 
2.34.1


