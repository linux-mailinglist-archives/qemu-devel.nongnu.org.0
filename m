Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37AE3629E6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:05:21 +0200 (CEST)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVeS-00068p-Cx
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc0-0003pz-KQ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVbx-0000xu-Fx
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:48 -0400
Received: by mail-pl1-x633.google.com with SMTP id t22so14309078ply.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1Vt8UmYtOZ5Zzksw1iaCjMqU/oXmihF2abTUk6CpYQ=;
 b=WTZX/2ijU82WfMVX/lh+aXZDtZSe2ttLeK4Uy1TpcYW1pruMrGF/bU5FkoxAA4dDk7
 sIW1mb+IR5JvdM+EFfojpuNwA3e0va5YXntX/c491fv2T0n00K8FExBA2AHwD7gcys9v
 WsRvG7VKarqhW4vPHV+1/73XHqB+gmnroNv8WJIRKEWr/gDS3yBxxQOFTcEc6uaclb7M
 Sd7e5U6JJGA3yi3vtliZ+ek9hyyDcncqYCLaTSj0qcYQlsgMh6MG4g/c7BydRuDKzNQ/
 e9TSApZEKV8JIE0rFeKhR0W3psV06O+J2+LgEav85tWKwatJ8HWamQkZQMKepluw5ISi
 0HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1Vt8UmYtOZ5Zzksw1iaCjMqU/oXmihF2abTUk6CpYQ=;
 b=h0Fo2eJwW3q/b2AY7hnvjf9p6in1B3FU/D1+4ndFPNDqKoh2BWsrASHuq7EiX9uZrX
 2Ori5dtzZ58gbBGCoDUp2e3/jMavI8hEX0CmTNmm+k4aorpWZxMzF/x77mAO9tKwaVXQ
 cgBSRy8rBfQsNB+SVirtuNEFso2S/7hPICJZeMobXeb29ZEoJJ7a5Wgt97O5skM534Ea
 zy9Dljm4pLPSN7fTkBEcF938Hp+RJGkfTQCC967ft/pO0C3s/QZEORwE7e3GDHGIdqeN
 3f+UkVCMyHKe8Pb4P2BQsXtGhLazQgK4CEn5bo+EgV4/63je6KPpeh9ZKHs/cvIPv6kG
 1w0w==
X-Gm-Message-State: AOAM531e6jFGHhdpOjIhNsnlV3u5EzXsRkSgvZSpvVOxn8Sh5Unhtse6
 4flPh/cBIST82L8x7MDiY5/7GKIcnB+RTA==
X-Google-Smtp-Source: ABdhPJwbMbucjVwG9gmHZ+/FqJW/O+4DEEh3NPqp2TGcQaRVQ6cn2BSve6GGip4N3NyC2VlnwWLwsQ==
X-Received: by 2002:a17:90a:bb94:: with SMTP id
 v20mr11421140pjr.144.1618606964240; 
 Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/81] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
Date: Fri, 16 Apr 2021 14:01:20 -0700
Message-Id: <20210416210240.1591291-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Do not read zfr0 from kvm unless sve is available.
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 11 +++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b393253..a6e1fa6333 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -947,6 +947,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2034,6 +2035,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
+FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
+FIELD(ID_AA64ZFR0, AES, 4, 4)
+FIELD(ID_AA64ZFR0, BITPERM, 16, 4)
+FIELD(ID_AA64ZFR0, BFLOAT16, 20, 4)
+FIELD(ID_AA64ZFR0, SHA3, 32, 4)
+FIELD(ID_AA64ZFR0, SM4, 40, 4)
+FIELD(ID_AA64ZFR0, I8MM, 44, 4)
+FIELD(ID_AA64ZFR0, F32MM, 52, 4)
+FIELD(ID_AA64ZFR0, F64MM, 56, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -4215,6 +4226,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd92a22689..ec8d477516 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7561,8 +7561,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              /* At present, only SVEver == 0 is defined anyway.  */
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64zfr0 },
             { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..e8729b53fd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -567,6 +567,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
 
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        if (isar_feature_aa64_sve(&ahcf->isar)) {
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
+
         /*
          * Note that if AArch32 support is not present in the host,
          * the AArch32 sysregs are present to be read, but will
-- 
2.25.1


