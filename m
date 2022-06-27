Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AE55B93C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:44:48 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mEa-0006nc-17
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltT-0002TH-63
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltR-0004x2-J4
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:58 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so4526785wmp.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9KeQmq+koa3iMWt7CG401QEinMf8dAeAjDC93KnxL1Y=;
 b=WTtXv+yep0k+Us+Fh0Lkzm2X22DkELBYI9ny9P13z0as4hEYxCwRF3wcy6dIbeSgZH
 rj7X54qYy5EghohkBl2MAZDvsXSRtrdqGi7Tq8YtRxYZYpf8aVF7oip5sDy4ahOrnI4A
 H6DCycEupdtCeXqN3PY9EZcTI/S+tsh8yy0QSagtDbICAl9WZ7mVqe2wbtzS/221XTJe
 KfrZUOeRytDlZbrpdtVB9edDSasxwXmao1+ZuK/zonzdui8VA/fB/fhWWoCB/m0iZ/s3
 RNsVLZL2Ypo8EbQD0v5PN7pDT/ECmgBqt4fWAKuLeIUcPdGeftJVcgQxpRIZHoi6E29s
 qQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KeQmq+koa3iMWt7CG401QEinMf8dAeAjDC93KnxL1Y=;
 b=RqKjtbjcuc6bQnCYQ7Wh0R2FJ2/p4cAn0ScHLZ0I8aYZZS0un0XoCetKW6hVTxgjYU
 U/o1rnLyBxpmXndXPy15YUoV5Hs9kkKi2h3WPYNgt49geONsJkzk1+fJ4JZYxhktMXNZ
 Jh2Q3Y7Za44OYJVpXK+ka1r5QYE+4c/8bbBKU/NJLoeHxxB05ueAChIHmlZUPpFvl19m
 rJGoJQrxsKeF7AiUhZqG7xVRk4llC9/ctv2TXPBsDxwYS4iqnloDbn+IACG7zAwvQdDs
 OBonICBbgGlvvA/SAZkiAoza/zqZ7i6nqwNE4gbSQ43zuCdAINuLYZ5P34xzixA5rCEJ
 Bpvg==
X-Gm-Message-State: AJIora8yDo8L3b031bWcTST8WnKBi748OeZRsvVkFaNHZ3UGL8SFM+hP
 rHXRZcipvz6eoACqK+9TlEPAKuGlfmyTZQ==
X-Google-Smtp-Source: AGRyM1vn26DDKXXy7x7a8Z8w4QQUsIVzjyhumjHK1FpM/hQVZEIbnlRqudAxndLhVTmPlSSszXvWPA==
X-Received: by 2002:a1c:1906:0:b0:39d:bc9d:a54f with SMTP id
 6-20020a1c1906000000b0039dbc9da54fmr19071644wmz.128.1656325376312; 
 Mon, 27 Jun 2022 03:22:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/25] target/arm: Extend arm_pamax to more than aarch64
Date: Mon, 27 Jun 2022 11:22:35 +0100
Message-Id: <20220627102236.3097629-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Move the code from hw/arm/virt.c that is supposed
to handle v7 into the one function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reported-by: He Zhe <zhe.he@windriver.com>
Message-id: 20220619001541.131672-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c    | 10 +---------
 target/arm/ptw.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 097238faa7a..5502aa60c83 100644
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
index 4d97a248084..07f7a218611 100644
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
2.25.1


