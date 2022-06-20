Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DF55238F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:08:23 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lp0-0007Bt-Qr
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La4-00065y-JW
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:56 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZz-0001S2-Oo
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id 128so3865167pfv.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GkGtDVAyt+ZiAYpm1KJyv57Q9M+Q57+AxwceX30tYs=;
 b=dsq/UyEPLkSSnX//nUKplY2EL2+fM3/aQQhDBOk69b/OZKsayqxlMXYeiNWzcDcdeR
 C50pQuSJzHP2FlPzZvt1u1RSC+XQULc5V2MRGbR8h8OFgGKe3l7gEiXcQRMzS1QzstgD
 KH6riiFY9GHH9u+tVKJ4IIF2qo1rS3qvTHIgBYGDDFmvxknJh7oPxK+BTm6nhSAuGbLx
 pztGn1B0IDs5ZH7Y4dVeBpymWAW+eZ/P9uZRVrvsHf28AKdwXFY0sUgeXY6ySQ2YWG3y
 lJ3sJp8xROIWazdHAjCU/DIkl50ZLhdbFR57S1ZHod6/tCPFAPt0cc+2hNV0L/jx47Ic
 Zesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GkGtDVAyt+ZiAYpm1KJyv57Q9M+Q57+AxwceX30tYs=;
 b=6V7ore3gTe8yjumAjLmMyWg2kRkl4FqBV+t4d4FQ4vdgTtSLwNvUz5lyV/uqFNrX4g
 xpwCexxer4g2+3rhZ/jWYwX0QrE9LfL4uLFtIaUNqbd4Hn9fcF88VVrS32uCeH+cVFij
 7ZuIZpUNa3HxNxYbOmW+nFDG2atkplUUmsAZziA2IB3sQMZdIcyuFGyyjIRUKzD5JF0S
 zENDaWtJZ6jQ5iqrqEvmK/qipTqirstsWHTaWfkTzT9a60JZEoWCoOMBfN5yd0Kc43Fz
 zasE5RlMraVsFs5iJzgFBmETMahOZA0VQB0iM0yq24eJatGnPKpo/HV//2qdmQgEFUcy
 trpw==
X-Gm-Message-State: AJIora9r7fo4re2MwjmLgNJ8/W0kJvUGjF6DiQ7bgKTTp7Ai2Lebo5XW
 8bK9F+Vtx/xqSab2gYOGZmt7hNhOzGugrA==
X-Google-Smtp-Source: AGRyM1vk+eJCQA2iSApRQ0tSSBIMPCCNKjiDV3acfzEeEeKTl4Xanoh2RwroWtDRVp1NJ5TsrUd2Lg==
X-Received: by 2002:a63:7248:0:b0:40c:762e:c866 with SMTP id
 c8-20020a637248000000b0040c762ec866mr12090026pgn.558.1655747570639; 
 Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 16/51] target/arm: Unexport aarch64_add_*_properties
Date: Mon, 20 Jun 2022 10:52:00 -0700
Message-Id: <20220620175235.60881-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d8ff78d96d..c73f289125 100644
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
index b15a0d398a..6f6ee57a91 100644
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


