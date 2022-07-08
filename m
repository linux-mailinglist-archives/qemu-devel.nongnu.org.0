Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A556BCD2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:18:47 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pkk-0005Jy-9X
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi4-00027m-Ss
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:02 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9phy-00024n-S2
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:00 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2218928pjo.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=UqFq1/TVBNhb5c6+fH4hnMe/83viqNxKg4+zV/SzExDiHGApEDwulsois1HrtFeYVj
 9CQPdoGjcBhfJOeeDF+s8TzY6WJfogWWGcw2PaM1BGO2vdS7lw7+i16yHi0i5zNFBhs0
 RzgrEFP3G/KOO0mlzVrzeeBNlafsEEMf1pnSUl6JyHS1yrd3lYY6jUlwP8s/s5oR5Ux5
 wqKs8lI8rP39U2lxdnaTmmBi/qaaXd3KPY4hv4cQhFKPgFFrJ+bgDWKo2vJU2tFH8tFB
 Lw1biauhMlSqalUF9elGyX9MozDGe7ur3uBICA0akQObjZFUKECTN0qfB/WS8rRu2O2z
 ZCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROIaR2/2j+a5heyURGySBxjwOTFvMLYqmlHWrVr1ZCs=;
 b=dzEA0RdEHLq4SDIqA6UGjxe8hus4LolHWgU46gnHBEUj7lCDjOyYIZ6fGXOR/x8rXl
 YQvDwu+cMMUbJX/Tkz7DuwrYEFfHaytG2/Z7yrraVyooROWpbXKGc5IbCGYgG4LZU6BS
 4LBKxxNolDk0w/Oqk1G03dLjbAeBGslS9+ITLy8ixUg2sGgtXZasypxKDhSg4agJYS/b
 yGBeVRKMA4vih9FV5AYh30mUOp6el1kvHluDfwDswvTszIfWEnzjzaMlbWCZEJcP8vGj
 WDquBKDRrrkloejgfA55tmqKbOqsElBVZ4ujyzNI2aO7ZZbwqcQViAnTdc+McCNz9M2M
 d0ag==
X-Gm-Message-State: AJIora+j5yZEb9Bi6zwlbrSdZA2zOWEosnVJJCEPdgl9nxB++CbiMNVk
 w2k2xKY5exGdobbPyMGhelQionieaxJojNks
X-Google-Smtp-Source: AGRyM1sOiqn3tFwfWfcNh2WQVUQkmDUX/+xb9BIgSAbly0f4kOBeSYMljygV7e4HdPeF/fJkCnNVMw==
X-Received: by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id
 i4-20020a17090332c400b0016a4227cd68mr4070860plr.173.1657293349602; 
 Fri, 08 Jul 2022 08:15:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:15:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Date: Fri,  8 Jul 2022 20:44:56 +0530
Message-Id: <20220708151540.18136-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Dump SVCR, plus use the correct access check for Streaming Mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae6dca2f01..9c58be8b14 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -878,6 +878,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int i;
     int el = arm_current_el(env);
     const char *ns_status;
+    bool sve;
 
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
@@ -904,6 +905,12 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  el,
                  psr & PSTATE_SP ? 'h' : 't');
 
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        qemu_fprintf(f, "  SVCR=%08" PRIx64 " %c%c",
+                     env->svcr,
+                     (FIELD_EX64(env->svcr, SVCR, ZA) ? 'Z' : '-'),
+                     (FIELD_EX64(env->svcr, SVCR, SM) ? 'S' : '-'));
+    }
     if (cpu_isar_feature(aa64_bti, cpu)) {
         qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
     }
@@ -918,7 +925,15 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+    if (cpu_isar_feature(aa64_sme, cpu) && FIELD_EX64(env->svcr, SVCR, SM)) {
+        sve = sme_exception_el(env, el) == 0;
+    } else if (cpu_isar_feature(aa64_sve, cpu)) {
+        sve = sve_exception_el(env, el) == 0;
+    } else {
+        sve = false;
+    }
+
+    if (sve) {
         int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
-- 
2.34.1


