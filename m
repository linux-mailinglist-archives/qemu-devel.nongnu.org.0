Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA613F62C7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:37:09 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZQ7-00051Q-Ow
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKC-0007ZO-Mk; Tue, 24 Aug 2021 12:30:56 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKA-0008M8-Rx; Tue, 24 Aug 2021 12:30:56 -0400
Received: by mail-qk1-x731.google.com with SMTP id e14so23812155qkg.3;
 Tue, 24 Aug 2021 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqlITwEG+nQaBpubf/bz76C7EtM3eawDjbWHbyrEmHo=;
 b=bshbEA8c/w83KEYYWX1M3P2uLBEby8xlWGHKmTCio8qRJ6XanAvoAOrvqA/f6aIGA7
 L77B1WElSknAih70AyX3g6k2NXBbfXYXdcfbcvN89sRZQMRZ2VkLAbGkqdZgjfwi30oE
 I5adDLhE7U95pHg18AF2ACHWGlVdCYFoccPPBr/DK19oqNLCEXKLAVJdjWgPx66bXT1W
 Qz0jyv1FMmvHM/GWTANL3b0jGBUw8XZ/8+FexEYvNpN/RPF6HFJWYB/LwXapvZSTuwK7
 sRgTLuPMeUXRVr4ep9bHxMjR0nrJxARWXkGiEEC6R04TholDqNF+JYyfQsSUAF7t4JWX
 5Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqlITwEG+nQaBpubf/bz76C7EtM3eawDjbWHbyrEmHo=;
 b=DHQX6DAwcOf/7oTzgfE4wClkZmzg+iOtlFNcb0aPO6wxRbe31Gav/uUtJedLmC02UB
 XszhqcveipiwQEBwp7Q32lr5l6eJxXPD9DOrulkuUAhekr8cXiqOLuM3VewdCxrWctv+
 1mQgYkJZcp6kFC9h+Vlj03qF7jCsq2HX9VM3sDcfLxaPzZ2VAFNV5XeU4iYwtyyOIn70
 dF9AjwrHCzhMJxmR6KEYYorvZKrbt7/bEY5KNehK4+WWJpOC6JVjfNJsumaeNb4gu8Hf
 dQhdm0DLj4XVxjbONLmjoDkTYHAUyz4vKYO9UPBjLXfaVTdKcZ01kLH4WTDL4qs7qnLh
 RYJQ==
X-Gm-Message-State: AOAM532kjz0YoRf1YdjARZuumYJ0kg8lO8VJBy1JKldBRoD+9aujvAfL
 xf8+ZZDKVrJYkcD6PpsJavfMM0sa7CY=
X-Google-Smtp-Source: ABdhPJxSQhukTOyuxqmZwXPuejM5cmAGfiRcIw6ABPYCVt/n+2NHb7j2MHDP4k7xfOu6HqZx3mggfA==
X-Received: by 2002:a05:620a:9c9:: with SMTP id
 y9mr27849705qky.207.1629822653320; 
 Tue, 24 Aug 2021 09:30:53 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] target/ppc: add exclusive user write function for
 MMCR0
Date: Tue, 24 Aug 2021 13:30:19 -0300
Message-Id: <20210824163032.394099-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Similar to the previous patch, user write on some PowerPC
PMU regs, in this case, MMCR0, is limited. Create a new
function to handle that.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c  |  2 +-
 target/ppc/spr_tcg.h   |  1 +
 target/ppc/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5510c3799f..860716da18 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_MMCR0_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 64ef2cd089..5c383dae3d 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -43,6 +43,7 @@ void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ec4160378d..b48eec83e3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -592,11 +592,49 @@ void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
     }
     spr_write_ureg(ctx, sprn, gprn);
 }
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0, t1;
+
+    /*
+     * MMCR0 is a Group A SPR. The same write access control
+     * done in spr_write_PMU_groupA_ureg() applies.
+     */
+    if (ctx->pmcc_clear) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    /*
+     * Filter out all bits but FC, PMAO, and PMAE, according
+     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+     * fourth paragraph.
+     */
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
+                    MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
+    gen_load_spr(t1, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
+    /* Keep all other bits intact */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(SPR_POWER_MMCR0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
 #else
 void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif
 
 /* SPR common to all non-embedded PowerPC */
-- 
2.31.1


