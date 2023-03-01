Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92976A65F2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf6-0001v3-6l; Tue, 28 Feb 2023 21:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeq-0000zb-Hz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeo-0003Fc-W6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:32 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a2so2121083plm.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UogLDo1FAQewsA7Du/sRuTEP7c2MtAWy7Ed+ICEx2Lc=;
 b=SE4chiZE3B2IDLAaXnFRj20rQkmzAjH3xPh7dnIws2d/A2EJC6y1XVFLWCWa3yqhmL
 W6D+kt1tLDML9RTu22/3W0rukRKV3oLq2KPUQdPaqN7VHzbf67Q0hTLz1s9Bggyvl5EC
 yUkpMjJLXkKGMga6Cho3KI5On+TPl83VJzTP9xArjmMNWrezwP8DtzBpde4NfZeEUFe9
 rCXbXjL1ayJ9Mpi3sqW75RIH4kllk5RA8Ll3kaPO5/NwKSL93JKlFaIaBxMaLi7R0BvU
 Za0jYIOX5mDDZ5Oc5vgqZ7JdKGhwoM9o8kou7L3OxpPojZxDGvafk/i9rj+i76bdSQJ/
 5ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UogLDo1FAQewsA7Du/sRuTEP7c2MtAWy7Ed+ICEx2Lc=;
 b=t47zRCsUxx6/j5dOcEcf7EKpDOHKNSyxUYAb+/BB36Wb1KUnJWI3ArCTotvoWkiZIq
 4U5WUEuVcpJ449jhCPnjKvp4ao3eofB2SvnVEGArb/FahfpBCQXOIIjZYkQxetaqBjdw
 iQTsRxrBcMjadlmWq+dtQ7sdAZClhzM8ipe57xqSpsGsqPKO5Aa54Knb8+bFhMSc4aUq
 EA+wh6xFqmn8womL/BaIdAO6mGbhbWTH+pNHzCTsikY24/4/iofLrijGMoHBy9nOVJHu
 9zjSnlYlmKpzjXsSeiG8v+Ev4Sz35TdEx7Q4fblGdLL1ROkbTyHVUuiABJlE2lohD5KS
 eu6w==
X-Gm-Message-State: AO0yUKWSz6+O5kCFAH37kNJ2+hefPS4IoY265jF6WOInDVV9jRL1vmup
 Va7NELf7hbv7mZzGq6iB9yrB+JID/YkA9f6NbCo=
X-Google-Smtp-Source: AK7set+8Y+rOk6rme+51BCRrHEb5swOGNsbtPo6PCbjvolaE3Yb5Oq/YLeE/xVfjFLbhq5Yg6jJIwg==
X-Received: by 2002:a17:903:244e:b0:19c:e484:b4e with SMTP id
 l14-20020a170903244e00b0019ce4840b4emr4474315pls.59.1677639449377; 
 Tue, 28 Feb 2023 18:57:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/62] target/loongarch: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:06 -1000
Message-Id: <20230301025643.1227244-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-22-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 290ab4d526..e5efe4ebd7 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,6 +18,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
+#include "tcg/tcg.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -321,7 +322,8 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
 
-    env->pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->pc = tb->pc;
 }
 
 static void loongarch_restore_state_to_opc(CPUState *cs,
@@ -599,7 +601,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 
     oc = object_class_by_name(cpu_model);
     if (!oc) {
-        g_autofree char *typename 
+        g_autofree char *typename
             = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
         oc = object_class_by_name(typename);
         if (!oc) {
-- 
2.34.1


