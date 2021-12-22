Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADF47D336
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:54:18 +0100 (CET)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n024P-0000Z3-Md
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wB-0008Jw-RK; Wed, 22 Dec 2021 08:45:47 -0500
Received: from [2607:f8b0:4864:20::733] (port=45916
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01w9-0004Zz-8T; Wed, 22 Dec 2021 08:45:47 -0500
Received: by mail-qk1-x733.google.com with SMTP id e16so2270176qkl.12;
 Wed, 22 Dec 2021 05:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0tPWroKf8+zwMZ81fuDdcOR55HvCkDzSknyMhykBjvk=;
 b=XS2uP2iBEdBvT64xBshNOvgwVVkmzSMw5IC+XAvWwALvALbOzpFPyEogIG67u/EfnG
 Sh8ATA3dXS2x8EjurYsbXXyJi3oFydeZzhs9M8iljBmrKPw5b8LOERsOXKkIU86dpHZb
 hNdxV84Zp2GEx67qrfnwEKsO/UfLYqE4na7SHU6/AaCAFHTiUHiBj4aNIx2FkCq96xJ1
 6TS4GLPEfz6nPyiujAZYgvTN2/+fgyEZgzkF+sRFcHBRji2HQfIlon9BJN5GGs2HE7eY
 ww9/k+b7aNPpQV13dVq+iKl4pkuBn2Knplv3Pf5bFrDY3U0X0lxYWJBgwHqvjgZqGpQL
 Di8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0tPWroKf8+zwMZ81fuDdcOR55HvCkDzSknyMhykBjvk=;
 b=14jinDBWozVojtFM9HnqImbmPfg8853PbZRO4/t6HyhWnlICZygVJe5iLSe+T/pfvf
 VfrfuEIZBHVYEUUyoNXJ4jsRlXVArdHsKrL3ZPXSvEutCbtSuJCnFJMagDt4LCAG4qn3
 Lu9uyHrABggMHTQKmF0auAbmHUeSVvzGZxRjpVA7k1loOKFYIXA++E8ni+37yeeMOXGQ
 NZ0xRS/8gdmvTwljOFCUlVNDaGdem29wbaSrUVsnkPPc5dfIV+IcPDJmIJHvW/Psigrv
 McA/KaGrlVkiD3tECbWmPbCHtZ+eYQJjXHZ7PBiFb1KLupgRgvSiBR+FMYS8uBLWJEm7
 AFPg==
X-Gm-Message-State: AOAM532zn28NYGAHm5/TdIL7uFYtMB/9mjjiE9KgPq4lSOZ44cxtNPO6
 SDNS7kE1d5Ml0nyUVubqRnSLfnTt6hg=
X-Google-Smtp-Source: ABdhPJzN0G/LM5/TfAlzFWwWTcbfExMZxBT7k8ESARyyAeKe668hVWWpNDRO6re2gt2Zb+HgWFBTuQ==
X-Received: by 2002:a05:620a:e13:: with SMTP id
 y19mr1924102qkm.112.1640180743782; 
 Wed, 22 Dec 2021 05:45:43 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/ppc: introduce power8-pmu-insn-cnt.c.inc
Date: Wed, 22 Dec 2021 10:45:13 -0300
Message-Id: <20211222134520.587877-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to add a significant amount of TCG ops code for
instruction counting, eventually getting rid of the 'helper_insn_inc'
helper entirely.

Create a new file to avoid putting even more stuff on the already
crowded target/ppc/translate.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 54 ++++++++++++++++++++++++++++
 target/ppc/translate.c               | 44 ++---------------------
 2 files changed, 56 insertions(+), 42 deletions(-)
 create mode 100644 target/ppc/power8-pmu-insn-cnt.c.inc

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
new file mode 100644
index 0000000000..2febbcc27e
--- /dev/null
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -0,0 +1,54 @@
+/*
+ * PMU instruction counting for TCG IBM POWER chips
+ *
+ * Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#if defined(TARGET_PPC64)
+static void pmu_count_insns(DisasContext *ctx)
+{
+    /*
+     * Do not bother calling the helper if the PMU isn't counting
+     * instructions.
+     */
+    if (!ctx->pmu_insn_cnt) {
+        return;
+    }
+
+ #if !defined(CONFIG_USER_ONLY)
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+#else
+    /*
+     * User mode can read (but not write) PMC5 and start/stop
+     * the PMU via MMCR0_FC. In this case just increment
+     * PMC5 with base.num_insns.
+     */
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_spr(t0, SPR_POWER_PMC5);
+    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC5, t0);
+
+    tcg_temp_free(t0);
+#endif /* #if !defined(CONFIG_USER_ONLY) */
+}
+#else
+static void pmu_count_insns(DisasContext *ctx)
+{
+    return;
+}
+#endif /* #if defined(TARGET_PPC64) */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 114456148c..44773bc6cd 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4183,48 +4183,8 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
-#if defined(TARGET_PPC64)
-static void pmu_count_insns(DisasContext *ctx)
-{
-    /*
-     * Do not bother calling the helper if the PMU isn't counting
-     * instructions.
-     */
-    if (!ctx->pmu_insn_cnt) {
-        return;
-    }
-
- #if !defined(CONFIG_USER_ONLY)
-    /*
-     * The PMU insns_inc() helper stops the internal PMU timer if a
-     * counter overflows happens. In that case, if the guest is
-     * running with icount and we do not handle it beforehand,
-     * the helper can trigger a 'bad icount read'.
-     */
-    gen_icount_io_start(ctx);
-
-    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
-#else
-    /*
-     * User mode can read (but not write) PMC5 and start/stop
-     * the PMU via MMCR0_FC. In this case just increment
-     * PMC5 with base.num_insns.
-     */
-    TCGv t0 = tcg_temp_new();
-
-    gen_load_spr(t0, SPR_POWER_PMC5);
-    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
-    gen_store_spr(SPR_POWER_PMC5, t0);
-
-    tcg_temp_free(t0);
-#endif /* #if !defined(CONFIG_USER_ONLY) */
-}
-#else
-static void pmu_count_insns(DisasContext *ctx)
-{
-    return;
-}
-#endif /* #if defined(TARGET_PPC64) */
+/* For pmu_count_insns */
+#include "target/ppc/power8-pmu-insn-cnt.c.inc"
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-- 
2.33.1


