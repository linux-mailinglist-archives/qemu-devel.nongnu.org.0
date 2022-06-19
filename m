Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672765507A7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 02:17:53 +0200 (CEST)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2idU-0001Pe-Ah
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 20:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibf-0007XU-Jg
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:59 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2ibR-0001ww-Eg
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:15:58 -0400
Received: by mail-pl1-x632.google.com with SMTP id y6so6827228plg.0
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fyCK09yDw/jVGyY/tTStAMtSUFUHJ5jHv1xqBw5ZNE=;
 b=pAvlLLNGFb5QnYjnb04QXZDcyvTRYb5lW33oaEZcAbQP4A9PONhICVf/Kis0TU+Jnp
 j6MXA64SUHXT2P+7wb0AySvY+N8R2Cbc5GMch6fLAiVEXRIckcf+b8yUMJPWxx+nNRiY
 FZR/8Idt5kZSOSzw0oNU4vNhPMy+knGOCyaG/EdCiAncYBbx5x1mewwW5eFQLLe6+LsC
 yzKGNnYn1LP0zavOTXfOr42uGKofJkMwg6Ektt1bAkP6RKhnLfME9RbH78oLdHnj/LMv
 85C80/uS02MWaGnSy1UgXM/M9XBv6x9BiaFxTCAC38L4I9BYUXRw3LPgnB+FdTw4ZFbg
 Lv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fyCK09yDw/jVGyY/tTStAMtSUFUHJ5jHv1xqBw5ZNE=;
 b=ZOZFvBSMBmDGSK47QPeiQ8xFDH52VIQsg5ewynduCl+z4aLpQ1xb9sv+KeJwSNWxjV
 4teAYJPRP37KvzxQiEFuJLlWPF1AY6jS4MYoqroQ3hoMT7LiSypzegQ/wlSd+8yI51vT
 Hpx/1PNHlgcEv+v26Jm++k/cbXhcQFVAR0sTQIqBMLKRQuDDO7cTTWyLUo167oOwI7hE
 2Sy+cqhTpfSwUACxu1qXF89K6A47wGNPo/XPlJH7OBXauM7bZgbFTDlUFOo3A3grEaMC
 xk9v0HnQA6B/Wfi8j1wEA+UUNZEU2F5a8j72WvWL1OzL8RLiJvGVHyGKk4SxgVXc6kxg
 hCwA==
X-Gm-Message-State: AJIora/bnKFujkeVJSgO4HLTGv4lzhI/Rb0wgSNJRW4BTy5fGra/615C
 Csz0b3ic9nm663Wy8fRr4PxdX23SmiGoSQ==
X-Google-Smtp-Source: AGRyM1vcnzDtBZ+8enJk0x85u8/A72s53wujv7YFrEHbn38qKV5obj9Uig1nspCjIb2n+EQeFNjYXA==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id
 q17-20020a170902edd100b001588318b51emr16969311plk.89.1655597743660; 
 Sat, 18 Jun 2022 17:15:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:848a:b814:8a9c:88d6])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a17090a5d1100b001e0d4169365sm7790724pji.17.2022.06.18.17.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 17:15:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Extend arm_pamax to more than aarch64
Date: Sat, 18 Jun 2022 17:15:40 -0700
Message-Id: <20220619001541.131672-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
References: <20220619001541.131672-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Move the code from hw/arm/virt.c that is supposed
to handle v7 into the one function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c    | 10 +---------
 target/arm/ptw.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 097238faa7..5502aa60c8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2010,15 +2010,7 @@ static void machvirt_init(MachineState *machine)
         cpuobj = object_new(possible_cpus->cpus[0].type);
         armcpu = ARM_CPU(cpuobj);
 
-        if (object_property_get_bool(cpuobj, "aarch64", NULL)) {
-            pa_bits = arm_pamax(armcpu);
-        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
-            /* v7 with LPAE */
-            pa_bits = 40;
-        } else {
-            /* Anything else */
-            pa_bits = 32;
-        }
+        pa_bits = arm_pamax(armcpu);
 
         object_unref(cpuobj);
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4d97a24808..07f7a21861 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -36,15 +36,23 @@ static const uint8_t pamax_map[] = {
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
 unsigned int arm_pamax(ARMCPU *cpu)
 {
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        unsigned int parange =
+            FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
-    /*
-     * id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.
-     */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
+        /*
+         * id_aa64mmfr0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        assert(parange < ARRAY_SIZE(pamax_map));
+        return pamax_map[parange];
+    }
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+        /* v7 with LPAE */
+        return 40;
+    }
+    /* Anything else */
+    return 32;
 }
 
 /*
-- 
2.34.1


