Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADA47D331
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:51:36 +0100 (CET)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n021n-0003XG-8R
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wF-0008U1-4C; Wed, 22 Dec 2021 08:45:51 -0500
Received: from [2607:f8b0:4864:20::830] (port=44584
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wD-0004bn-Bz; Wed, 22 Dec 2021 08:45:50 -0500
Received: by mail-qt1-x830.google.com with SMTP id a1so1896799qtx.11;
 Wed, 22 Dec 2021 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4vnV+34LS00hqGjUJM9oubs2x+ordorJ8i9lKjwwzU=;
 b=CqnA/epjN4IinCH2DtwfrsqXIhpNsqSj0jsWIYP+YrdusVJ/ihf7RhJWWtsuhI0vkw
 zzXnb276g4vo+HAp+s4Z1orq/GJMM5E7eKMmllLuLFBrkAeVLJo2zXiJU7+lbp799khA
 HGV9Xo70lY1DxXA7vl4095X8HnufYhbsNOHiFHF7x0TD3MIQjqAqc19QYASDCPTPZ5EM
 lU8/hCVpcjwTTn/PY+Atvo97nsfLYTUSEuKfXy+uF9bTUMDGrS9o+4UaCBcJok0nCJt4
 EuEvDISO7j1ljlp6hD/tVUrhVHsGusUHR5q/n/8Jh8T4iUvtWH9pzwWqQfhXEt/RkU86
 TuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4vnV+34LS00hqGjUJM9oubs2x+ordorJ8i9lKjwwzU=;
 b=2hOaOTiB6D8Mz6pNvmQg5Z5QmmafGYrZeHGzGWagYNHhUQs/O99Ia7Eu5bLW/uYSSP
 LMouQ1YkVLoOmZIIpWA6UoPkEWxyUEmQHoHBgcn5IQnO37F1YC4+goBQiSG8c7Hqc3nX
 kdDTqZDA3o7UOKnNGT/SrnEUT++0wWLKmA22v+WyHQZ5hIz5HVNCzycWHTWfZAvDJ6zW
 zkQP6EKGsjBbtqsx0ubzIUs7G6n5iEKGlErWXf0jEC6fdq5oEhOF4KD5M9zKZzR86q2q
 eLBoUdX6woudAxzgaqc2ps0XH63f76oh60BNFd4xfzKXrsVKp52tDZsgBdemPQ/LXhBZ
 owWw==
X-Gm-Message-State: AOAM533dD2dd8dXEqNvyBawOoMQzTuXBhCBM90Q09c4lHv7PHSkIWz+Y
 eVJQiI53/xKJbOQg6YxC1C0Qk4Npn+A=
X-Google-Smtp-Source: ABdhPJyyt1zS8H0jo3kNmYJAqKMgU26NTG1nX52xmQVdpXa9hBf4CsHU69u9g2BxPWsUnwLQneghgg==
X-Received: by 2002:ac8:5a0d:: with SMTP id n13mr2065776qta.555.1640180748074; 
 Wed, 22 Dec 2021 05:45:48 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc1()
Date: Wed, 22 Dec 2021 10:45:15 -0300
Message-Id: <20211222134520.587877-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
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

pmu_inc_pmc1() will use TCG Ops to increment the PMC1 counter when
it's counting PM_INST_CMPL events. At this moment we're supporting two
values of MMCR1_PMC1SEL for this event: 0x02 and 0xFE.

This function, and all the soon to be added PMC2-4 insn count functions,
does not check if MMCR0_FC14 is set. This check is done inside
pmu_count_insns, which will allow us to skip all PMC1-4 instruction
count functions at once if the proper conditions aren't met.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index c683573104..3661fb0022 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -11,6 +11,56 @@
  */
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+#define MMCR1_PMC1_INS_CNT        0x02000000
+#define MMCR1_PMC1_INS_CNT2       0xFE000000
+
+/*
+ * Increments PMC1 checking if MMCR1_PMC1SEL has one of the following
+ * events:
+ *
+ * - 0x02: implementation dependent PM_INSN_CMPL
+ * - 0xFE: ISA architected PM_INSN_CMPL
+ *
+ * This function assumes that MMCR0_FC14 is cleared.
+ */
+static void pmu_inc_pmc1(DisasContext *ctx)
+{
+    TCGv t0, t1, t2;
+    TCGLabel *l_inc_pmc;
+    TCGLabel *l_skip_pmc;
+
+    /*
+     * PMC1 will be incremented if MMCR1_PMC1SEL = 0x2
+     * or 0xFE.
+     */
+    l_inc_pmc = gen_new_label();
+    l_skip_pmc = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t0, t0, MMCR1_PMC1_INS_CNT);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, MMCR1_PMC1_INS_CNT, l_inc_pmc);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t1, t1, MMCR1_PMC1_INS_CNT2);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, MMCR1_PMC1_INS_CNT2, l_skip_pmc);
+
+    gen_set_label(l_inc_pmc);
+
+    t2 = tcg_temp_new();
+    gen_load_spr(t2, SPR_POWER_PMC1);
+    tcg_gen_addi_tl(t2, t2, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC1, t2);
+
+    gen_set_label(l_skip_pmc);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
 /*
  * Increments PMC5 if MMCR0_FC is cleared.
  */
@@ -55,8 +105,34 @@ static void pmu_count_insns(DisasContext *ctx)
 
  #if !defined(CONFIG_USER_ONLY)
 
+    TCGv t_mmcr0, t_mmcr1;
+    TCGLabel *l_skip_pmc14;
+
     pmu_inc_pmc5(ctx);
 
+    /*
+     * Skip PMC1-4 increment if:
+     * - MMCR0_FC14 is set OR
+     * - MMCR1 is cleared
+     */
+    l_skip_pmc14 = gen_new_label();
+
+    t_mmcr0 = tcg_temp_new();
+    gen_load_spr(t_mmcr0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t_mmcr0, t_mmcr0, MMCR0_FC14);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t_mmcr0, MMCR0_FC14, l_skip_pmc14);
+
+    t_mmcr1 = tcg_temp_new();
+    gen_load_spr(t_mmcr1, SPR_POWER_MMCR1);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t_mmcr1, 0x0, l_skip_pmc14);
+
+    pmu_inc_pmc1(ctx);
+
+    gen_set_label(l_skip_pmc14);
+
+    tcg_temp_free(t_mmcr0);
+    tcg_temp_free(t_mmcr1);
+
 #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
-- 
2.33.1


