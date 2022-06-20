Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA0B552392
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:09:02 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lpd-0000tx-7X
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZv-0005h8-Rj
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZt-0001Nz-Q6
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c205so4147669pfc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZQ/+9oH8WDS9FGV3y9tSTDQVCQZ26UllDhjGlm8djg=;
 b=pUchknfOpwJ/0g5CCmOSVvKIsUzP8B/CnSDyLfgjxFK1W8mNMMK6eFY/IcB48g33jK
 SAccq0K76KO8PS9d3nkvbnTpCq+bWAzWz/Tbsa1AjhYgMQmWGSOZVFFMpWPBdckkzhWt
 l5Ud3XAsb/xPhITnYmHiw/uxdFu7BPCFbjwc1vJyXVMBGmBq/sTsojON5KxC64wU99r1
 JxtqlbvVJe+yggCfEkRUVE8LtpWD5RyYzLbl6oLHPGtHNOBhr3sLb4ybXR/VC4ciNm8D
 Yx/vOF1sFgzSMqE3e9F8JcluopLqmSAmrMLXj98iZlPo0CM+eSB7HTpP0hwLOqj8hdGN
 +Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZQ/+9oH8WDS9FGV3y9tSTDQVCQZ26UllDhjGlm8djg=;
 b=HyQIS6FS8hK86OS5gkPglnK1vjHaKYc4CwkHAx9ZjyRamSEyUSAOBDn2WfbatYYVPi
 5xUFZ8R+3tKTFWxzfHSu/rxdxmwrJnwKOCkxmqnH0QY9xWKaY45Ircg+3MXfKaOLLHjh
 Lo+hM1V1cTWuhBto8y9yU/wS9ahHNCTOZoP7NkdS+4c5p8FSFVP69AGar77m3OY/Scaz
 rVsQZcN3LkJ2X5+O2YTGaUByij/8cS729kI3Kb9fCPeDU82Z/yyTeoAyykaR/vrJCRSS
 Dzkk6A5EUv19Zbi6aFdVyfaIroCH6++v60Ur0KUlkg+sJm9zyXphWA1RzrB70PP1vWBh
 SEWw==
X-Gm-Message-State: AJIora+015cCRmN1tYDL4CIA3/z7BhUvngl7FP2shqMdjSErSrXGwOT5
 f9aUQlxMwGfXsE45JCzriWj3NTAKWs6plg==
X-Google-Smtp-Source: AGRyM1uRk9mFVAvmnK8EWZKbQ+eQP2p0n280NzKfuEg7cbGjRpWt03dyW4i5/D6esPx/lt5U4a+0BQ==
X-Received: by 2002:a05:6a00:23ca:b0:525:28b4:9e3b with SMTP id
 g10-20020a056a0023ca00b0052528b49e3bmr3563538pfc.43.1655747564483; 
 Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/51] target/arm: Add the SME ZA storage to CPUARMState
Date: Mon, 20 Jun 2022 10:51:53 -0700
Message-Id: <20220620175235.60881-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/machine.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05d369e690..c3c7ec697d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,14 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  Because this is so large, keep this toward
+     * the end of the reset area, to keep the offsets into the rest of the
+     * structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c..54c5c62433 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_vreg = {
+    .name = "vreg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_vreg, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -884,6 +917,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
 #ifdef TARGET_AARCH64
         &vmstate_sve,
+        &vmstate_za,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.34.1


