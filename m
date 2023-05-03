Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743A6F51E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tg-0004wD-BT; Wed, 03 May 2023 03:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tb-0004rQ-DW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tZ-0005cC-3z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso29172065e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098844; x=1685690844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdmMkOVSKtBAdRXeqo7CuIXeFIax2JeGXZPWL3EcJNg=;
 b=O3HNVVcWrUjTQcJuJMa2RoSOHRnJybW/jHTn5eMIyZotkGqFk8fzwzeShlftYx4Ida
 A11j+nARMdo6cOchVhxDg99A+NpuKa8EsRwSOd0UhNqt7MeET5Ec5RBere79mX8D5ZJd
 8KRvr9z1JXXTVV9ed108aBUXJnj8rzCnbYG8gimE5GV9VRtUZD74+nuMoywgisFsHGzl
 JQJIulIIRIrHcwoUBj0kJJBuzw23BbKJpT6cUxr+mh60mU2Wmpx6eP7oHhdsGNSbE33Y
 0ehKLkdjXQmHsH8bQVJou0npXmZiHJwF6M+b6RoPWTVcPJWN3EK0mQeam5Vs5vNL7vVJ
 lqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098844; x=1685690844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdmMkOVSKtBAdRXeqo7CuIXeFIax2JeGXZPWL3EcJNg=;
 b=aSRiMyJiNwvbtVWWTJxzOEQtvjY1w2M0lvEOjcOD7S04xqZT4aH0dM/sJuAy5/GbKz
 UY8adgshu1sNNm4h8amM34bZ4ywnZ9nED2RiPNlql93ePmdedSyexQIIf4WN5I2FdrKC
 DgBZhBHnm/3RS1rAKgKd2uxmQvrjbxPeo329AMcde85hGipS8rq0dIgyqnftw61PP/Bj
 VS4Fx3CJtyByY9UB9ga0cVNFx5brkDVQwvDgKDF0YKEfsCDy7lyYgzf5AqwAHYt7ykMB
 n2HhNztyZIaRJavUI2Cqdmc+SqRbPvZ5W67q3FC6FjNMjkzVgG6Q7c6HAJwX6awQ1J7v
 KTLw==
X-Gm-Message-State: AC+VfDy0l8r3qny1d/fatj5LcU2KYP2FDgh6KW3UJ0zPye93aOi4EyXx
 BP0TTEa181RZS4rUeeR84R17ZzYCH8qLlAXcCbdslA==
X-Google-Smtp-Source: ACHHUZ4HJVix3mmrLGqVenNSPNg1Sx/uchDheJWarSv4vXYbt5ZtjEzBBgWcyVC4XS1DaoqH3Sw5hQ==
X-Received: by 2002:a7b:c8c3:0:b0:3f1:7a50:dd66 with SMTP id
 f3-20020a7bc8c3000000b003f17a50dd66mr14525244wml.27.1683098844309; 
 Wed, 03 May 2023 00:27:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 68/84] target/arm: Tidy helpers for translation
Date: Wed,  3 May 2023 08:23:15 +0100
Message-Id: <20230503072331.1747057-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

Move most includes from *translate*.c to translate.h, ensuring
that we get the ordering correct.  Ensure cpu.h is first.
Use disas/disas.h instead of exec/log.h.
Drop otherwise unused includes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h        |  3 +++
 target/arm/tcg/translate-a64.c    | 17 +++++------------
 target/arm/tcg/translate-m-nocp.c |  2 --
 target/arm/tcg/translate-mve.c    |  3 ---
 target/arm/tcg/translate-neon.c   |  3 ---
 target/arm/tcg/translate-sme.c    |  6 ------
 target/arm/tcg/translate-sve.c    |  9 ---------
 target/arm/tcg/translate-vfp.c    |  3 ---
 target/arm/tcg/translate.c        | 17 +++++------------
 9 files changed, 13 insertions(+), 50 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d1a7a829ed..9179521b88 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -1,6 +1,9 @@
 #ifndef TARGET_ARM_TRANSLATE_H
 #define TARGET_ARM_TRANSLATE_H
 
+#include "cpu.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "exec/translator.h"
 #include "exec/helper-gen.h"
 #include "internals.h"
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9bfea23353..6ae92b3353 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -18,20 +18,13 @@
  */
 #include "qemu/osdep.h"
 
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "qemu/log.h"
-#include "arm_ldst.h"
 #include "translate.h"
-#include "internals.h"
-#include "qemu/host-utils.h"
-#include "semihosting/semihost.h"
-#include "exec/log.h"
-#include "cpregs.h"
 #include "translate-a64.h"
-#include "qemu/atomic128.h"
+#include "qemu/log.h"
+#include "disas/disas.h"
+#include "arm_ldst.h"
+#include "semihosting/semihost.h"
+#include "cpregs.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
diff --git a/target/arm/tcg/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
index 9a89aab785..33f6478bb9 100644
--- a/target/arm/tcg/translate-m-nocp.c
+++ b/target/arm/tcg/translate-m-nocp.c
@@ -18,8 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
 #include "translate.h"
 #include "translate-a32.h"
 
diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index 2ad3c40975..bbc7b3f4ce 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -18,9 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
 #include "translate.h"
 #include "translate-a32.h"
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 6fac577abd..03913de047 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -21,9 +21,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
 #include "translate.h"
 #include "translate-a32.h"
 
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b0812d9dd6..d0054e3f77 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -18,14 +18,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "tcg/tcg-gvec-desc.h"
 #include "translate.h"
 #include "translate-a64.h"
-#include "fpu/softfloat.h"
-
 
 /*
  * Include the generated decoder.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 106baf311f..d9d5810dde 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -18,16 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "tcg/tcg-gvec-desc.h"
-#include "qemu/log.h"
-#include "arm_ldst.h"
 #include "translate.h"
-#include "internals.h"
-#include "exec/log.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 95ac8d9db3..359b1e3e96 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -21,9 +21,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
 #include "translate.h"
 #include "translate-a32.h"
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7caf6d802d..a68d3c7f6d 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -20,20 +20,13 @@
  */
 #include "qemu/osdep.h"
 
-#include "cpu.h"
-#include "internals.h"
-#include "disas/disas.h"
-#include "exec/exec-all.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "qemu/log.h"
-#include "qemu/bitops.h"
-#include "arm_ldst.h"
-#include "semihosting/semihost.h"
-#include "exec/log.h"
-#include "cpregs.h"
 #include "translate.h"
 #include "translate-a32.h"
+#include "qemu/log.h"
+#include "disas/disas.h"
+#include "arm_ldst.h"
+#include "semihosting/semihost.h"
+#include "cpregs.h"
 #include "exec/helper-proto.h"
 
 #define HELPER_H "helper.h"
-- 
2.34.1


