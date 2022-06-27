Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD255B934
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:39:22 +0200 (CEST)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m9J-0005wd-Ez
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltO-0002Nn-5b
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltM-0004sY-Gt
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so1319529wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qQ9xMY+fBwqOtzYbC4O5Fev27/fyhXhJftbNfnRNex0=;
 b=MFei5Lb2ysYgFDN2S+smEI1uvZB7d1NJlax1CdPZF2mlcKyvYTK47JjxfCgd00m2Pu
 lIMNpOUk+xBlDP8SKsWW6a2ZQ1vVbVKpJh+FP//azhN66T6rFZBGUrsGYkszZ7bG3QRD
 /pK3J6xmItjlzuqTfKskpYBnl9AQ02CoTFZEtNOhSJ9TCiCFYoVWKmQZHO9zHdiWV195
 5cTNLVtYVpqw76woWMRFv+2aK6Tk9256/MnTOCzfBl0yci/iC68zKf6C1EkZUu41JNJK
 PGo7uyfDD0mbsJqa6YP3mCYLA7bs3WXNzsDM9uVCovjW0HbDwcmKmuM76arRdc9pEFOf
 BTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQ9xMY+fBwqOtzYbC4O5Fev27/fyhXhJftbNfnRNex0=;
 b=hhnXehMfihg2X4ja54q62XYzod2lvwndRqw07FbbycK4L2hq2Fn4AVCHLfiFczJgQT
 063ZR1saYNOf9E5BTGb0TaTI4tuZU7MQ7CqxbrbB+5VZM6KRLWB9iVXOdDOPrtAxuTFA
 uSjjKSMgCdYnXKrmVlS8OgTr8a2z8HIgyWvPNy9S1Rx3/2DNIw0D5UG8iMzQ3Y5k1xE/
 ntXOlHqSfLcwvKsx3Dj1+9s29OUvKTMJLG9tlEGjPjFNsygcKWCTjovKXdRKvSetGp0T
 S5LQxCmcUEzzDcArU+USI/Ulc1kZLtn3ySzRHNU8O1T5NuXJKcTOcPpjap/qqOjW00/h
 vvyw==
X-Gm-Message-State: AJIora/PLPA1LwhIVidOGYjtWx9DVxQFrF00UcjrubBxBYn5lLDnib7r
 QCF4tnea3smJgBX0PGYet9s7XYkf3k/1Dw==
X-Google-Smtp-Source: AGRyM1vSSn94kX8DI7ogrmygnnR7xtOeMIiBaj5fZgMk0Kq3QYn3MpCLinjJsTCw1/MVsWFMmd0ezw==
X-Received: by 2002:a05:600c:3b04:b0:39c:951e:6813 with SMTP id
 m4-20020a05600c3b0400b0039c951e6813mr14439060wms.193.1656325371806; 
 Mon, 27 Jun 2022 03:22:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Mon, 27 Jun 2022 11:22:29 +0100
Message-Id: <20220627102236.3097629-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2ce47f8d29f..675c49f93e0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -205,14 +205,8 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6f94f3019db..aef568adf75 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1288,6 +1288,9 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
 int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d9c4a9f56d2..660fd8b8b90 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1422,6 +1422,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1441,6 +1442,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
-- 
2.25.1


