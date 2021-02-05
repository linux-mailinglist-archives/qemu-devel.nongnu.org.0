Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A439831165C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:04:14 +0100 (CET)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A97-0001hx-Mp
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2E-0001Sw-PW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2D-0003D4-1l
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:06 -0500
Received: by mail-pl1-x636.google.com with SMTP id u11so4289774plg.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GERD/esKSxShFOguv3KoJ5qwPYQvSGdHFbj2dQY7+2M=;
 b=o0lNxANib8fu5MqZ0FUHOgr5gkOwK8PgPdachVt11ZErBZ5rYLKp7SEEfR4VN6kqw6
 SFIe5rA4n2DY6He+7uBmdHGKH0y0lwI3xcOCMsMf8vmDyl/hNWM57i7DUvxdzYLMnOSj
 A84PJzmzWfNsYf7E5Hc2ibe6edvTn+E0oB5MOlUc/o4u8UAr/D+V8L+RbCFBRiLqyxxs
 RQjxspaARavgBABsJS0tYNhal91t7uErOrh+gMh8zwVPjEc08leEPIxPbZXQPvE8hXxi
 j2cgcbsl6J3uPtSPUCUbiUt9pdNjvCpw8UlW+pyufuj3H4BWb2fiFvyuD4VMAGMlV75+
 9gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GERD/esKSxShFOguv3KoJ5qwPYQvSGdHFbj2dQY7+2M=;
 b=PbiQyhxL2HeaMJgVCdufAqe3gR20K8m97uW3YJxws447H9vm9X2JBfb7YAzxq5Uf47
 kD6cNOvRw5VPyPpKIM3fjVNMBwvWT6Tn7xoZSCnRyecaWxfg9Rd6Gf2r33AzZdwdMlQh
 dk9NqHtgC/jZlY5IaZJQKynZq4ljFbOUtOcoSpsp1A4KiGeXydTqixwWgppsqO6OrcC4
 f7BabFCzcn1MB8hmWMqi3YfqYVeIinvfdOSGnxDJDMH2bgW6aXGrb7c+tNSJqGzANL6d
 zRjl0NABchi6wlPdX3/3X+npDLf/FTvi149AqDEfGIFq4FkLF5j1PRuQ3Qy6xJfVcL4J
 yg2A==
X-Gm-Message-State: AOAM530+ap6No+GnkQfr1Yt463J/DGQhAXq2rrcs4TXCiYjrcXWYfE6w
 /17Y78G/E2FCsZvrrkUHlmTfBqFJmkHBbxMV
X-Google-Smtp-Source: ABdhPJyYwDcT5IbXGgWcf3KtAMScf746HDlfO+ykkmHR1z5blqC900dVhRnIeU+IGrGaXPQqBnsYyw==
X-Received: by 2002:a17:90a:f416:: with SMTP id
 ch22mr6233955pjb.61.1612565823735; 
 Fri, 05 Feb 2021 14:57:03 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/46] tcg/tci: Make tci_tb_ptr thread-local
Date: Fri,  5 Feb 2021 12:56:09 -1000
Message-Id: <20210205225650.1330794-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each thread must have its own pc, even under TCI.

Remove the GETPC ifdef, because GETPC is always available for
helpers, and thus is always required.  Move the assignment
under INDEX_op_call, because the value is only visible when
we make a call to a helper function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210204014509.882821-6-richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 tcg/tcg-common.c        | 4 ----
 tcg/tci.c               | 7 +++----
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 125000bcf7..f933c74c44 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -544,7 +544,7 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
 #if defined(CONFIG_TCG_INTERPRETER)
-extern uintptr_t tci_tb_ptr;
+extern __thread uintptr_t tci_tb_ptr;
 # define GETPC() tci_tb_ptr
 #else
 # define GETPC() \
diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index 7e1992e79e..aa0c4f60c9 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -25,10 +25,6 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 
-#if defined(CONFIG_TCG_INTERPRETER)
-uintptr_t tci_tb_ptr;
-#endif
-
 TCGOpDef tcg_op_defs[] = {
 #define DEF(s, oargs, iargs, cargs, flags) \
          { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
diff --git a/tcg/tci.c b/tcg/tci.c
index 3fc82d3c79..b3f9531a73 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,6 +57,8 @@ typedef uint64_t (*helper_function)(tcg_target_ulong, tcg_target_ulong,
                                     tcg_target_ulong, tcg_target_ulong);
 #endif
 
+__thread uintptr_t tci_tb_ptr;
+
 static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
 {
     tci_assert(index < TCG_TARGET_NB_REGS);
@@ -526,16 +528,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         TCGMemOpIdx oi;
 
-#if defined(GETPC)
-        tci_tb_ptr = (uintptr_t)tb_ptr;
-#endif
-
         /* Skip opcode and size entry. */
         tb_ptr += 2;
 
         switch (opc) {
         case INDEX_op_call:
             t0 = tci_read_ri(regs, &tb_ptr);
+            tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
             tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
                                           tci_read_reg(regs, TCG_REG_R1),
-- 
2.25.1


