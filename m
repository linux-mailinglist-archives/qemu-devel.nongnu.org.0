Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD37C53C0AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:16:49 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt7Y-0004YA-Nb
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh8-00056J-Pj
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh4-00005u-TA
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id g205so5773136pfb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iaX51RzKkNkmjJGOwJXKVNsxoyHghI2U9FbxI6i+VnE=;
 b=d0rKmwUvB6yPZwyGwCyJfXCSzA9YcAC8VhLaIRccw6LtWR1VfuxiBIswfCO1W2wl53
 Zu58g3SMNM0rIkgsd2A2e7/5EKjAgkl4u/C2Qcz7t7FrGlXwWYUmXcBRiXXOM4cs0Vat
 oC2+etbWcV1kevfEjBfLYFRExTUTO5lpWI2A0LX6QiZwIKSUHPKgJB3f+Y+UVj8y1Qbj
 qW5OK3FU4ON+wfssG9p5zbG0QP51yl3PNQF3Ekn2ltZtDPSzRpadvvLIR+6P5MV6Zwqd
 INiRNECn/6MQg3jboaFxSu2/8Nj3VxDRUFARvTjOGbA3qVW3CxruJdYtQ96QnAyzvrNv
 itmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaX51RzKkNkmjJGOwJXKVNsxoyHghI2U9FbxI6i+VnE=;
 b=DwSjp50LHPwxHMFd36feZU+e+ZQ/d7TuKtfdqtjTB8XymqFa4I3C5wQ/UCLJeH1/h3
 O7KY5aTX78VRkovFEnNmx77eZedaBSmCANAAmpWridTm6xp5vHzcxSLz9J9Il046ghQx
 JsmeOY35y+BA/7/6qxOCYmmSLMYIa7QZQSSlhAwHhgJXAuPIhu130qKEKYDOK73iBjjs
 CkbIa8UAj16fvEhvLT1BLmgITM5cCYZHzOhuuvz6GW3WCijhicV/fpEhwYUu2eXkUocu
 taCI/BYKPj5z45yZhjqEASsTga/TfApc1dgIspID1wJYm+c8KPtjrOM+BsBBG1Wob6vK
 vVeA==
X-Gm-Message-State: AOAM531vpxlUQsAz39MVhREV9YLq1/FpBAVS/K8b/rlqzizPxLK30hgG
 d7D44JJpRfsVSK42EoKazQTWViO0ugFF/w==
X-Google-Smtp-Source: ABdhPJyOYfwVB1iJ8TrB8eYkmDcTeq7eRUC8ZCWWzgz6ULgkvTPidb6PHSRQzH3vE85476IWooOKQQ==
X-Received: by 2002:a63:86c3:0:b0:3fb:de4b:4de1 with SMTP id
 x186-20020a6386c3000000b003fbde4b4de1mr5891328pgd.198.1654206566071; 
 Thu, 02 Jun 2022 14:49:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/71] target/arm: Unexport aarch64_add_*_properties
Date: Thu,  2 Jun 2022 14:48:18 -0700
Message-Id: <20220602214853.496211-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

These functions are not used outside cpu64.c,
so make them static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3999152f1a..60f84ba033 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,8 +1097,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
-void aarch64_add_pauth_properties(Object *obj);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
@@ -1130,7 +1128,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c5bfc3d082..9ae9be6698 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -689,7 +689,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-void aarch64_add_sve_properties(Object *obj)
+static void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -752,7 +752,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-void aarch64_add_pauth_properties(Object *obj)
+static void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.34.1


