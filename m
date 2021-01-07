Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021F2EE6F8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:34:00 +0100 (CET)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbyp-0006It-42
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhg-0001fu-CT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:16 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhc-0001lC-Lv
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:16 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v1so2111162pjr.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCTNNZGR2Nv/YxZ5iu2Rwl94cKut5s9Wts7t2uaTEAo=;
 b=Jnruojja2wwFBxlXpPKxeytFNIhlxz/oniKPV+L01BoJi5bN+zj26WlNzK02SBcIH4
 X5QpDcPsR/R1DjQ8W+1VbPmlK25VkGJBORbp9QECcoT+TuetO1Bgq8Gtie80pVJ5wn17
 CWcUItQc4PD/BbVFYvKS+qIDDGEDSlsClwQO/nHXCPsbxXrugWrs+eqV4womzlvrlipk
 bCa15GjUyOQnFwlfPhpE2ArxxAPVBqvmRMCcQlK4dW2JFxc3XvWXFarEXeQ+92GgyGkw
 GKfBMLJMZHPXnjax0iMucjKCXLAiy2mq7Ndm6T/Kd7zvfQs1zzEV20iGb+vKxlAp3rfB
 OGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCTNNZGR2Nv/YxZ5iu2Rwl94cKut5s9Wts7t2uaTEAo=;
 b=dV7CEneU0eobNLVx/4kHoWK05UMWxn+Ir3BntYk2sm/hxKBuwKzb/CtLskBfOPJUgj
 hX6eMRaShyozh6YXzVTWJs0hjaQlO23aTbImzPbM2BPx6QmbJyf/NLQZQfZXH8QQHYD2
 L3t0AeoW25nHMnfbPvEliq2rP1hoPVc6AHmwDHg92GfPeQJo8d5aC78JhzNUflXLid9f
 rjQEwHBgnzPGsmuXif7ggvkM9URFHkzRB0NmIR80UUzDaOnN+O9JsHKp7pmXvUEfu7Rm
 dAmkJqD/D1njtlwlVpgorq14Sf13zdk7/hyCLqsJ41/JjmWUM26dANoLmZcWD+Ss3t6g
 mVRA==
X-Gm-Message-State: AOAM532NW9Oa19McN1QzxNr2PBnHQ/72PxIg0N3VJvSwELFeeEhc6sZ6
 DDUvTbT2d7/VntB/W+1AD/e/j60u+t7ZZg==
X-Google-Smtp-Source: ABdhPJxx+8x9oCJPC0CDbQzp34CZ0Lqa9Xsjf7uG9dZmAJMzoKNkDeEBcbdznYy41dKxTS0f43nC7Q==
X-Received: by 2002:a17:90a:d307:: with SMTP id
 p7mr186629pju.214.1610050568448; 
 Thu, 07 Jan 2021 12:16:08 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:16:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/47] tcg: Remove TCG_TARGET_SUPPORT_MIRROR
Date: Thu,  7 Jan 2021 10:14:46 -1000
Message-Id: <20210107201448.1152301-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx, remove the define.
Replace the one use with a test for CONFIG_TCG_INTERPRETER.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h  |  1 -
 tcg/arm/tcg-target.h      |  1 -
 tcg/i386/tcg-target.h     |  1 -
 tcg/mips/tcg-target.h     |  1 -
 tcg/ppc/tcg-target.h      |  1 -
 tcg/riscv/tcg-target.h    |  1 -
 tcg/s390/tcg-target.h     |  1 -
 tcg/sparc/tcg-target.h    |  1 -
 tcg/tci/tcg-target.h      |  1 -
 accel/tcg/translate-all.c | 16 +++++++++-------
 10 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 079828ea71..5ec30dba25 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,6 +155,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index fdf75ba93f..8d1fee6327 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,6 +142,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index cb1b138b66..b693d3692d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index ed5c347374..c2c32fb38f 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -201,7 +201,6 @@ extern bool use_mips32r2_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index ec51f474a7..d1339afc66 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index c50ecf4dab..727c8df418 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,6 +171,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_SUPPORT_MIRROR   1
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 4edcb06044..641464eea4 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,6 +159,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 6426e24f17..95ab9af955 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -172,6 +172,5 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index d8c78d1dc7..bb784e018e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -198,7 +198,6 @@ void tci_disas(uint8_t opc);
 #define TCG_TARGET_DEFAULT_MO  (0)
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-#define TCG_TARGET_SUPPORT_MIRROR       0
 
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 02e1b05c42..e9de6ff9dd 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1132,6 +1132,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     return true;
 }
 
+#ifndef CONFIG_TCG_INTERPRETER
 #ifdef CONFIG_POSIX
 #include "qemu/memfd.h"
 
@@ -1254,17 +1255,18 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     return true;
 }
 #endif /* CONFIG_DARWIN */
+#endif /* CONFIG_TCG_INTERPRETER */
 
 static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
-    if (TCG_TARGET_SUPPORT_MIRROR) {
-#ifdef CONFIG_DARWIN
-        return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+#ifndef CONFIG_TCG_INTERPRETER
+# ifdef CONFIG_DARWIN
+    return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+# endif
+# ifdef CONFIG_POSIX
+    return alloc_code_gen_buffer_splitwx_memfd(size, errp);
+# endif
 #endif
-#ifdef CONFIG_POSIX
-        return alloc_code_gen_buffer_splitwx_memfd(size, errp);
-#endif
-    }
     error_setg(errp, "jit split-wx not supported");
     return false;
 }
-- 
2.25.1


