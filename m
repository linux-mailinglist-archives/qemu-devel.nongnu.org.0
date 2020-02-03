Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063611508C0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:49:06 +0100 (CET)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyd28-0008LU-NV
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0T-0006ZP-CK
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iyd0S-000327-Aj
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:21 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iyd0S-00031S-4P
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:47:20 -0500
Received: by mail-wm1-x342.google.com with SMTP id a9so17456790wmj.3
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xi6aqLCGsPeAJ9MPcbLlXNLY3ZKVruAB+cLB8Mn+tIk=;
 b=MttvHJ2xCMZHuTGoMqa90tqvmau2Jmp8Q4nQtntH9cvhZ1/VNUt/abjrgnTY+ayn+Z
 yAsklnLTWIRxZe7ua9qZYlL8MLz6fz7xhuRX1YAIRMl/APfSA2yZ3TvpwyDpyj49ajIy
 3nuKZgezNCqc2+owNYMV6MrvWHpeq1HXHhpCV1WHtbUN5QwTSStRf/rVIN/WZ/lS+425
 dEtkw4P20v/cq0tkI3tJBb+E20YbpOSCHpPbPQfayl2jQt88vf9fGkQI1dIQaSzHGpeU
 hQflvBSSvx7e8GTs5UCwnF2cILva6zCdY55AhbwtK4q4xr76aeVyoXWeXkUGIJdchfgE
 jfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xi6aqLCGsPeAJ9MPcbLlXNLY3ZKVruAB+cLB8Mn+tIk=;
 b=VjnlxrKFSgyLBGFa+favbQjeWTCu2T/21A2qcaSAPltQVIlMaUQrQb7YL9YOi0BBJi
 5Do8EYutLY38YkZdjhucqIAdCoGqL6WBMp7dQLJeAlaL6f/Pzi1S1oF3VXKVSCqvOXFB
 M1ercNk6+dGchsixybDytbB7wDYK8/0N+NfPWza7KU5c9W5QMr5DjvEQQLzVXH20g83b
 3zyPrY3YUdPW9D2w+QWAF0NdEdLBIMloKBDK6+EIwAgyrABm2BqEhLKwQPt5UmRO/GyZ
 gV/EMh2I13hB/mqjpUe2+eF4mRZR1P11aLH24x0Ilbpq8wzOa+xfXEiym2zkZBK9L4BY
 r2eg==
X-Gm-Message-State: APjAAAXanCyq1qg3qKz0lZclJ2eOz1B0lW+kj2lOZ7hv5hmtddD0woXC
 9ClGeY0KUEGLRn6lyiM6hETKgoa4jJcUvQ==
X-Google-Smtp-Source: APXvYqwDZPi239Ub9VfO7AzLDa1tqZvZis5Qctar/4+nn2opTZTQQnB0YNuwG0A5QRaJRh6yyZyoJQ==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr29292787wmi.75.1580741238750; 
 Mon, 03 Feb 2020 06:47:18 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id h2sm26429739wrt.45.2020.02.03.06.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 06:47:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/20] target/arm: Add arm_mmu_idx_is_stage1_of_2
Date: Mon,  3 Feb 2020 14:46:57 +0000
Message-Id: <20200203144716.32204-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203144716.32204-1-richard.henderson@linaro.org>
References: <20200203144716.32204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a common predicate for querying stage1-ness.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Rename from arm_mmu_idx_is_stage1 to arm_mmu_idx_is_stage1_of_2
---
 target/arm/internals.h | 18 ++++++++++++++++++
 target/arm/helper.c    |  8 +++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6d4a942bde..1f8ee5f573 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1034,6 +1034,24 @@ static inline ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env);
 #endif
 
+/**
+ * arm_mmu_idx_is_stage1_of_2:
+ * @mmu_idx: The ARMMMUIdx to test
+ *
+ * Return true if @mmu_idx is a NOTLB mmu_idx that is the
+ * first stage of a two stage regime.
+ */
+static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /*
  * Parameters of a given virtual address, as extracted from the
  * translation control register (TCR) for a given regime.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 70b10428c5..852fd71dcc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3261,8 +3261,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         bool take_exc = false;
 
         if (fi.s1ptw && current_el == 1 && !arm_is_secure(env)
-            && (mmu_idx == ARMMMUIdx_Stage1_E1 ||
-                mmu_idx == ARMMMUIdx_Stage1_E0)) {
+            && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
             /*
              * Synchronous stage 2 fault on an access made as part of the
              * translation table walk for AT S1E0* or AT S1E1* insn
@@ -9294,8 +9293,7 @@ static inline bool regime_translation_disabled(CPUARMState *env,
         }
     }
 
-    if ((env->cp15.hcr_el2 & HCR_DC) &&
-        (mmu_idx == ARMMMUIdx_Stage1_E0 || mmu_idx == ARMMMUIdx_Stage1_E1)) {
+    if ((env->cp15.hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
         return true;
     }
@@ -9604,7 +9602,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, MemTxAttrs txattrs,
                                ARMMMUFaultInfo *fi)
 {
-    if ((mmu_idx == ARMMMUIdx_Stage1_E0 || mmu_idx == ARMMMUIdx_Stage1_E1) &&
+    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
         target_ulong s2size;
         hwaddr s2pa;
-- 
2.20.1


