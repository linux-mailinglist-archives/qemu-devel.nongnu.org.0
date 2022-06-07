Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5E53F433
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:58:04 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPPv-0007bY-Er
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG5-00075O-9b
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFt-0000Hf-73
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:52 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so14214012pjs.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SyvEw0v6kbVYTBLHikS3UDLCGmQvw9Yz1NNALVd/Wyo=;
 b=MBUKvjyrwR4arOEVmAGOy6mwQkAapGNZLmSgHPucF0q9w2GSR+Y3ddqNSh1gthAq74
 r2GXkomWUFne7L8d1dIR3sElpL8NCx0pzCiM5WEmEtvYZoQZ0e6vxaZ7gcsOPXJo8kXe
 T/vmE2fE0LEWsIUfpzrxQgqETP+yZyyrob6g4Gm4mRUJqleVVw+wuF3wNJ5Bj9eptgu4
 0KxNEL2YkrhOozC8AeYABroTwCP8SQ0ej3Hk9v0boo+5qsOnyKo2M+AzSA0r8yrMO/S9
 G+b9uU4LzHmEoJn+7fxBo3Tolt/jpOlMluQtnPL5VJFZhzJbDgOcTDquQg5lpAX19I+N
 SIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyvEw0v6kbVYTBLHikS3UDLCGmQvw9Yz1NNALVd/Wyo=;
 b=XJaMScvWfrb7Cu9YU277S2+jGSghcmXzjDpbpQ1LWhB1ouAVUqXBJcalW2RBuxJtDm
 VBtM/V6ExUWkWKwNSfP9OS5Gn9wF3LIPX0FfPmOPS/0kg3eecdX6a6berI/g7T2iYuU/
 cMSDFwcPcOZ/wUe3yxPJi2CGJqS7E+MnCyZUXJV1oWcI7PQBuWjQ70OdNQmpOcYOrVqR
 8AC/FjxQCGmDKm4Ho0sI3e7GPutqKCjeCTA8HFC/cbdE9y/SPujsRnYoaCMT0XdMdNri
 i20zWgFJ6VAxf7Cxz6hjunxARVtRIxX6yzV5Aayai2rwkcxc4/sdIiTdamSdMqGsr8+d
 lPVw==
X-Gm-Message-State: AOAM53366mlwoduiL0LPQJfEhNmmXOibWo3m0y+IerN1AXJakRCq/9zF
 uw06KCnCCwknYXLSq4BIMtUnN+PtWgPpAw==
X-Google-Smtp-Source: ABdhPJz0j3sQlrWw6x7dTm0YLq2c6XRuDv/egWJq4/VDKK1mNXkpyZd96Qy9tU3mVDiSLGWRaReVCA==
X-Received: by 2002:a17:90b:170b:b0:1e8:6d34:eba6 with SMTP id
 ko11-20020a17090b170b00b001e86d34eba6mr12740077pjb.105.1654570059849; 
 Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/25] target/arm: Move arm_singlestep_active out of line
Date: Mon,  6 Jun 2022 19:47:14 -0700
Message-Id: <20220607024734.541321-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Move the function to debug_helper.c, and the
declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 10 ----------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 12 ++++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..2e115a0281 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3087,16 +3087,6 @@ static inline bool arm_generate_debug_exceptions(CPUARMState *env)
     }
 }
 
-/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
- * implicitly means this always returns false in pre-v8 CPUs.)
- */
-static inline bool arm_singlestep_active(CPUARMState *env)
-{
-    return extract32(env->cp15.mdscr_el1, 0, 1)
-        && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 36c33a6ac5..148f2a9252 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1315,5 +1315,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
+bool arm_singlestep_active(CPUARMState *env);
 
 #endif
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 46893697cc..1abf41c5f8 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,18 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/*
+ * Is single-stepping active? (Note that the "is EL_D AArch64?" check
+ * implicitly means this always returns false in pre-v8 CPUs.)
+ */
+bool arm_singlestep_active(CPUARMState *env)
+{
+    return extract32(env->cp15.mdscr_el1, 0, 1)
+        && arm_el_is_aa64(env, arm_debug_target_el(env))
+        && arm_generate_debug_exceptions(env);
+}
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
-- 
2.34.1


