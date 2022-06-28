Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B055BE29
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:25:43 +0200 (CEST)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62nF-00053n-Sa
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jA-00014Y-3M
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62j8-0003d4-IQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id x8so6401790pgj.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGqw0sxa6NjptPHDaNA2dvYv/+Ms1B8A00v4y3WH0Pc=;
 b=YedXqtbOcueLJpv1nlhqQBHEoDo7moGeUJAAO9TBdRYClIowsNiM7cuRnhDk+ESOj0
 DvFmTZpCwqbwW8IZ8z20tWNPZbku4Mh1oD3A7btb0MGeGEDZVm6MLY+uxYWwxnAoRDmD
 lCOzhplMMCZ5CBMDI2JNqW29+hzjsOZ5ubGV5oBclp5HhbRzfYKV4XpmI9/ZosG0V4j/
 9l+u2QKH80TU3pohhwY0VhXKWrP297zZYA06IIIbiwtfHy+6jIp1x6Uc9aQ3r4jqRyKX
 dnC6dZImPoH+jmBkdXN8V447zxjsLzC9pnQAw70htbLB4szUcIgrEugVSboH5CVy1s4m
 JDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGqw0sxa6NjptPHDaNA2dvYv/+Ms1B8A00v4y3WH0Pc=;
 b=UBtZlqSZxR1f42rvy2E5gf+f05WoI5MQ8CAqAhKPuwpsV0HgRQw6/FcnVfOnB6ur9u
 hc9STLuRy51daFZgTQiN+/O9YkRvXbvuue1Awb1wisot2lyauXgRvAnBu7a1glQTzO2/
 sZiRTZUwa45sRqHauvObzSWDnWix1YiZbEVAiD/Qm8iBT7ybjhucElVCm8vIfIAy7XwA
 Sca6qSq4FfKTkc980LzYSW5Olv4RMVgC1vvwLVQvZToodxq1PRXM0rkhTKIecJhU/JhT
 4QhpEzKbg+olafHsmmsGOs8Vz1HO/lrAkgbZY9ebQcbDqexPyFkhv9V57hzYAciME2bE
 4UIg==
X-Gm-Message-State: AJIora923ldC+L+zSxXvjBiu9u4q9OJl1f7flSIfo+wKMg3px6xOpb/G
 JpmrUTgFiJWUrpOY96HyYrjx8db5kdS77Q==
X-Google-Smtp-Source: AGRyM1sGBUQx0Z68q+b6BHSDKZP3VFFL72R83cruMbzHedtUT/CcmdU4n+07Iw2JLEmSyvA97R/bBg==
X-Received: by 2002:a65:604a:0:b0:3f9:f423:b474 with SMTP id
 a10-20020a65604a000000b003f9f423b474mr15397374pgp.527.1656390085093; 
 Mon, 27 Jun 2022 21:21:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Date: Tue, 28 Jun 2022 09:50:33 +0530
Message-Id: <20220628042117.368549-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Dump SVCR, plus use the correct access check for Streaming Mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bb44ad45aa..4a35890853 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -885,6 +885,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int i;
     int el = arm_current_el(env);
     const char *ns_status;
+    bool sve;
 
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
@@ -911,6 +912,12 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
@@ -925,7 +932,15 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


