Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE695523BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:19:41 +0200 (CEST)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lzw-0003EX-BW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La1-0005wX-Fj
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:53 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZy-0001NP-Ew
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10896574pgc.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zqd1McNM5D2fBRbn3StkKgKGGJ4F/qdBrurXM1jISUg=;
 b=sZZqb05L7zDr93Qf5Rl6MxSUx+E3E4dOSgNXdo4x6Ju22a9BTa4/2+MfoRD4iCLlZq
 nRCKVNas0EKKKianNUqnTsqNUov4ViaO7gFyMoNwYT7g464hoCsrhOnLGAWVrJ7cc19I
 maxUMLTiBwzZfp/0GTDNGMYVEq7AkPtyApJlrGMDbzawI+fd452oX0mu5YVoGZseOFBh
 kWegP/kRzjd/KHYcT9RvKxf/mkCNRIsQYNw3OHbynHkcBJyL7TMX6X5FII6wLQRbaszW
 /oe+z8vEELkSchxbkP8Cgy2hWQ7A1ZAQ3vPfZHkmAPzuADauDYOIstL048pbJdMPdSYJ
 T8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zqd1McNM5D2fBRbn3StkKgKGGJ4F/qdBrurXM1jISUg=;
 b=M7vC3vE3kiNW/5E4ryHTIoIByMrHpA3gUJMOiiiMY2CiIyBbU6m/7AdzaAF7kt6RIO
 Aivf3GN7OISzdReTLTTScnMGeBEoeZiUe0vjwifu7MYpTJm5fk168/2oXAD5IHbXJWsr
 sHRMEP+aKJXoBLUae8JZGqJVm/cLnOCNtHZFH0oUqqpzRVNvDKoEKMHZpyPx3OVTqTs/
 QlP/AylDkIZjLF4091qHjwE1elXEtpEpDwYb4/O6n/jfgCpoLm1ZZsSo9FyEN9/Tlu8d
 4TvL95W8wyEA91FSdftyxhRbRV0XdEWoPTW4eDZTItcSjC7VlihCK1um5PtUAWaU6swx
 hvbg==
X-Gm-Message-State: AJIora+UA5klLysMro2PtF6L1RW0ZC7ysMaKTviTIG59x11NKUfNCjiv
 ZeER7s3sVAfJfhSV4xDmbGeid45G0EMPLw==
X-Google-Smtp-Source: AGRyM1tIxKYRajwVtpoF3QTwY4vmq6YjjX7DA1+wmMIc8aC0mpkvNuf51WD2kxFhfyBrMW/KhCTGmg==
X-Received: by 2002:a63:3fce:0:b0:40c:23a5:2827 with SMTP id
 m197-20020a633fce000000b0040c23a52827mr19903446pga.314.1655747569722; 
 Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/51] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Mon, 20 Jun 2022 10:51:59 -0700
Message-Id: <20220620175235.60881-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ece720a757..d8ff78d96d 100644
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
index 6f94f3019d..aef568adf7 100644
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
index 1b5d535788..b5276fa944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1421,6 +1421,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1440,6 +1441,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
-- 
2.34.1


