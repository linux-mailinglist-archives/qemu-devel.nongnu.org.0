Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389A6F43BC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:24:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptowE-0005Il-PU; Tue, 02 May 2023 08:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoun-0003qK-Cc
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoua-0003F4-ST
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso22098025e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029715; x=1685621715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fxrN2RDaxGJY6MxgQSrXkxjS695soCwz7takF5ubQuo=;
 b=TW6xX1vSAjnWTk81zRM2eigXqaTrd5hP8BjH7oWFm+uq1GPTIXL4rncDqiD/JHvyxx
 0qYgSCqyouOgkVoSQeuvI8rDjdY5Z4ZMztbs51Ote5EViNc4wDeVv41XDmWUmuAb6GWZ
 1jUw/3IoKEJJ7tBvvmw36Z3djORM031oOYn9XCANdEyH3x541dvCskUrHXFlDESuEuie
 MIuHcnHjiu818ajtLzWl4sR0PqKH9o9r99KhX0wvCmIdxlg/cEZnTjtUjDAV1Sp57/9A
 6hMLFUGS2A27tCh3RFa5M+ggHnNt6smF6bbwEjfv2rBlnpUy3lmTf6P7kTls9Q9ugnES
 hVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029715; x=1685621715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fxrN2RDaxGJY6MxgQSrXkxjS695soCwz7takF5ubQuo=;
 b=amHJHiAVJQ1jObHexrlKExcyDRcZBa24ZCfSWwCVAaJDsn26Q/QJpSS65QpXZT2325
 AmOeLWnbGAL4fWHGFhAuHwvDKMZhWAcxUcUO5dBHIRlPb4WfoBB2ZcVZyncqvAyyQv6P
 gMX2Ut2DKwCJRFMDUMvfIa+yOyQwkU1msUekJuSPWc8QuwKWT94dzz3fVLEsNK3oCHNR
 +I40JGExZ6N958TB3y422IrYJsoCqcMjJyVgnVTrdK8izmswRriFz0sXE0BvCUxAmW5k
 iy0FgSLvDVH9faLpnpSBwGz9hEuLJRYDH/wKZfThOSdMY37n9B6lDmgHghgBHFG8m2gc
 y3KQ==
X-Gm-Message-State: AC+VfDz2Z7xQMbrYowzx3GKR5vU6U+XqfehN6a3rklU1FJ4BaOhpgbqe
 NllMQwG5LYzl3heJYjJEi6W7rSFl7BELcnzPz64=
X-Google-Smtp-Source: ACHHUZ52bMpEuvZ7Ze0wEIjZmd6vYJfjCVkPvkkcwXTcHRTa+v2Zjwbbyvm+HZMaAwdwVaTHNDw5YA==
X-Received: by 2002:a7b:cd10:0:b0:3f1:72ec:4020 with SMTP id
 f16-20020a7bcd10000000b003f172ec4020mr12554088wmj.1.1683029715424; 
 Tue, 02 May 2023 05:15:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/35] target/arm: Define and use new load_cpu_field_low32()
Date: Tue,  2 May 2023 13:14:56 +0100
Message-Id: <20230502121459.2422303-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In several places in the 32-bit Arm translate.c, we try to use
load_cpu_field() to load from a CPUARMState field into a TCGv_i32
where the field is actually 64-bit. This works on little-endian
hosts, but gives the wrong half of the register on big-endian.

Add a new load_cpu_field_low32() which loads the low 32 bits
of a 64-bit field into a TCGv_i32. The new macro includes a
compile-time check against accidentally using it on a field
of the wrong size. Use it to fix the two places in the code
where we were using load_cpu_field() on a 64-bit field.

This fixes a bug where on big-endian hosts the guest would
crash after executing an ERET instruction, and a more corner
case one where some UNDEFs for attempted accesses to MSR
banked registers from Secure EL1 might go to the wrong EL.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230424153909.1419369-2-peter.maydell@linaro.org
---
 target/arm/translate-a32.h | 7 +++++++
 target/arm/tcg/translate.c | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 5339c22f1e0..99eea85fa86 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,6 +61,13 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
+/* Load from the low half of a 64-bit field to a TCGv_i32 */
+#define load_cpu_field_low32(name)                                      \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, name) != 8);        \
+        load_cpu_offset(offsetoflow32(CPUARMState, name));              \
+    })
+
 void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
 #define store_cpu_field(var, name)                              \
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 3c8401e9086..74684767249 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -2816,7 +2816,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
             if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
                 dc_isar_feature(aa64_sel2, s)) {
                 /* Target EL is EL<3 minus SCR_EL3.EEL2> */
-                tcg_el = load_cpu_field(cp15.scr_el3);
+                tcg_el = load_cpu_field_low32(cp15.scr_el3);
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
                 tcg_gen_addi_i32(tcg_el, tcg_el, 3);
             } else {
@@ -6396,7 +6396,7 @@ static bool trans_ERET(DisasContext *s, arg_ERET *a)
     }
     if (s->current_el == 2) {
         /* ERET from Hyp uses ELR_Hyp, not LR */
-        tmp = load_cpu_field(elr_el[2]);
+        tmp = load_cpu_field_low32(elr_el[2]);
     } else {
         tmp = load_reg(s, 14);
     }
-- 
2.34.1


