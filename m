Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D347E8B3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:21:46 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Uat-00068S-W4
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXn-0003Kz-V6; Thu, 23 Dec 2021 15:18:31 -0500
Received: from [2607:f8b0:4864:20::929] (port=46856
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXm-0004Lh-Bk; Thu, 23 Dec 2021 15:18:31 -0500
Received: by mail-ua1-x929.google.com with SMTP id 30so11763143uag.13;
 Thu, 23 Dec 2021 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLWaNvqAqmmsAsLdcy1M52Mog4MXVSPT/Aa3cq/UbCI=;
 b=l4N0WO4VPd3pRY7eytiutBn5HQ916Dud2sXBUMhkKjU5OkkGDq8xcBzsdKQn1f6cNH
 sY4bI/0SM2xIufF0YxumJB++mvFgQF4xtsEO/NTNWs8TqCpcCDb+PzfvtZ+v0qppU2GG
 KcOmGuBIYyz8h5eSqW6NITlOctRHz8VcmxbsYyxSMMW/p92zB1iwmr0An+yZEV+w3l+R
 Crg2npJzRy74bjPNd7OeC3LDCmbjbB0BihihBwmsPW5JVPCB9PxvFnEO+XGV8NwB7t5g
 MbyILJpn3JMZQpwkqzzbXwaxC8T9FJQ82iLwLin+2mnPeGFDsUmjNLGK7GALgUJGYW5x
 SvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hLWaNvqAqmmsAsLdcy1M52Mog4MXVSPT/Aa3cq/UbCI=;
 b=LTJffKIEQ2dw8CtUUK4nTKCCddHDKW1QoD1HhKGF/VtxZyCUvVUbmKBwp9mHH2APnB
 ozIzzxXZYQTbO5XvczUqLvpWinZByBa51ACilSWiowF00UL35AosQ5GHjCWb+VadLCC0
 CvynIk8B/VxparEzc8NQPB5bPux8Si9iqaPoJfxvf4slRidE5UtkNvhnj6XMjGJM2JWl
 qIK9pWhOYQpVYwD55Bmh+z4FeFfYG91G94MjnSBzXOr5RUL4dep4X7fLd/vApMZUMvDn
 Y8CI9FJt/p0ETL9aQfmtyNixlISpD7vfHUKfaKv4BBK/Yd3+4Vq+n3a/e1z6tK+rlomQ
 3Yiw==
X-Gm-Message-State: AOAM533Ohc+M5rM5MchWbYekZZop6eNGRoHjRtz2dTihEZBpb3aKw5aF
 3UIdw8lNVmIzBoZr2l0kFp2ABVwWNE0=
X-Google-Smtp-Source: ABdhPJx1hwp+suwPjjKQYYVnSbydiQHoU6DZdcYJ0OHZkmxh2vHMuzdIfUsUfh82KjtYvrwdE0xHoQ==
X-Received: by 2002:a05:6102:50a0:: with SMTP id
 bl32mr253753vsb.72.1640290705166; 
 Thu, 23 Dec 2021 12:18:25 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/ppc: introduce power8-pmu-insn-cnt.c.inc
Date: Thu, 23 Dec 2021 17:18:08 -0300
Message-Id: <20211223201812.846495-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
References: <20211223201812.846495-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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
index 0000000000..6cdf2d2d88
--- /dev/null
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -0,0 +1,54 @@
+/*
+ * IBM Power8+ PMU TCG instruction count functions
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


