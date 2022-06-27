Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58955B94E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:56:45 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mQ8-0007eX-QH
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltO-0002Oz-Ty
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltN-0004rL-6P
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n1so12308150wrg.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EeDydKWKnx270Po7PJkxSD0CsPsoZG7caWBOvCNY4hc=;
 b=Mis8lEefL3isVnrEdh+atC4/6B0KMFMkT8AFQaQ82hs3O3OrkY4zLU1sJ0k67pFqT7
 ReHPmrV8pkkOviY+msuG8eE11ivAcBYN2QsPtVZzEqVgQV4qZeuyD+0GIocjk8H8Uz0W
 NqCvikyffk2InTsm0/Z41qsrdU5sNQI2IevPzcVfnozD5sqtT248ej0PaK/L5pXNAaWJ
 DYQao+ldCa/z5pBzRNKSzPk8NZxL9H/AFRqidMaW7v4+fbBToUacQtOjJFtM1SdJX3L5
 h8NGrwYmNGk7Va+TMVaDP4WU6+kxpOVyUh/dgQ8lmQA+PBXYGUShbb28puJy3oN4nQND
 45Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeDydKWKnx270Po7PJkxSD0CsPsoZG7caWBOvCNY4hc=;
 b=lra8peRJhnzEpT3YmIlBXVTtDY60UE5Bh8yADgtZONyPVMtWnp5GyUiVMD6PuPh0HT
 E5VUpmHP9XU7r3EZCN8+4as18N/mT3rRsNNLGMisrE6/qakeDUOsbUYOS8df1aIk5Sg0
 iGcaPKs2wTuNq32vmn4vky32mB7e6rpkRqzqKnCOB6OfbDa4UBgJ1OCouUs5dhh1wC1X
 ZI08+fDh3Pzd4AOR8laDxfI9FGjEvy6o5th/mYxdme6y9QCKtAHLpJ3adb0TebOlQYtn
 K2PhiI2Zqk2eDNWhTT7p8IklX7T+MHhJhFEg1YMtJd36qZshAHX/EQDOoqETiQBjx5PD
 4Aag==
X-Gm-Message-State: AJIora9lNWBQhbB4pwatlnWNpwhyWSnj+YK6YcADVkDWjYMy5pGqunMg
 gc4utTxkX3GmLAlEzpotowGsPPZO4TFCNw==
X-Google-Smtp-Source: AGRyM1tFpXqeawAfpAjtHp1SMRJPNy+cuVBCCzF6fv3UUXaK9b4nWsK7YIHAT6NXKrTf4Pnu8BXrkw==
X-Received: by 2002:a5d:69d2:0:b0:21b:8e3f:8557 with SMTP id
 s18-20020a5d69d2000000b0021b8e3f8557mr11394348wrw.422.1656325372468; 
 Mon, 27 Jun 2022 03:22:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] target/arm: Unexport aarch64_add_*_properties
Date: Mon, 27 Jun 2022 11:22:30 +0100
Message-Id: <20220627102236.3097629-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

These functions are not used outside cpu64.c,
so make them static.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 675c49f93e0..d2b005f76c8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1111,8 +1111,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
-void aarch64_add_pauth_properties(Object *obj);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
@@ -1144,7 +1142,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b15a0d398ad..6f6ee57a914 100644
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
2.25.1


