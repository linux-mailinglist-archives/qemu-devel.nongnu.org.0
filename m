Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B63C716C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:47:01 +0200 (CEST)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IkW-0007ax-9k
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbV-0008Q6-BG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003db-FQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v5so30525282wrt.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b4VQqETNkuWXD+kQmUy6tGq0WaqyAHDpekMK+m6bk54=;
 b=ZSQfSA14kv+/1OFQDQD+YjYnebZt37mbZi19Ck7a+WPp4L08vUjtLxBtWjtrSnAOep
 WemdCHnj/TTpbejaCOB3u80/Xklj9V8La6w22oROFbRMAPtuUKVOaEIpIXDvzX0RUgbH
 tL7BBZGX3AUFVAnpYlk2vvEw++MHYlb/vY+npvVOLAiKRYw7hFkeApjeKmVE57vr8JFv
 PugNmc+vo8sWJT04sS5/1DpxWKYQrh/G/oGS/TbVhsywDDaURmwFn/0FdW40svnystbH
 B3ptJ0bUYRQt7vz+OMDlD9MNxvzh6jJ5Rd7Ro6kdkaUEhfW0x+Z8JGxvmYg80kC09CKV
 jYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4VQqETNkuWXD+kQmUy6tGq0WaqyAHDpekMK+m6bk54=;
 b=fbFaRR66yoJ4TPPmhSzkBVPhN0c68L2C7ZLmmcSN30BAx+ZE2HiK6S8fRtpyaq7NG2
 SCh+YgbEcU11S0duFfYUlXuZIOH6bDEGFKbMAjyytJZpaN9bqkXnf8JZYyhACxFphuKG
 eU3dpVTIvjNrPK5bKJJ6Dm8rpeKeVDo1CMA3vMpuuOsOadRx8pjI2XjIIKi7MXLWWjnw
 kh2sX694DqhRb2aFpQPBlfZPQ7IATGqDS88ZduqGZZNAFiPZ1dgE15F3sYz40D8g3GsA
 BXiELaNuu/BlZZLqwN6af3z4L5Q3kfOeE56Hy9nE3MsPcIy4RvaCjRwh9RIjKW1axri5
 71cw==
X-Gm-Message-State: AOAM532FEa3u4ZT/qLSJ0RuprVnB6G0PcigCfAXAzVzwOfD1n/egOk1G
 1dBQppW7iacPgeyksOV1hDbEjRn08lE48oLq
X-Google-Smtp-Source: ABdhPJyiKb9ZrW5qt9E0PN1OHy7UGQvATnu5VNL2W/Yflh3HHZDoXFwCwP2iU1Z4huDa4WIpw0gjoQ==
X-Received: by 2002:adf:ba13:: with SMTP id o19mr5756299wrg.7.1626183455268;
 Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/34] target/arm: Fix VPT advance when ECI is non-zero
Date: Tue, 13 Jul 2021 14:37:00 +0100
Message-Id: <20210713133726.26842-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were not paying attention to the ECI state when advancing the VPT
state.  Architecturally, VPT state advance happens for every beat
(see the pseudocode VPTAdvance()), so on every beat the 4 bits of
VPR.P0 corresponding to the current beat are inverted if required,
and at the end of beats 1 and 3 the VPR MASK fields are updated.
This means that if the ECI state says we should not be executing all
4 beats then we need to skip some of the updating of the VPR that we
currently do in mve_advance_vpt().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c75432c5fef..b111ba3b106 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -100,9 +100,11 @@ static void mve_advance_vpt(CPUARMState *env)
     /* Advance the VPT and ECI state if necessary */
     uint32_t vpr = env->v7m.vpr;
     unsigned mask01, mask23;
+    int eci = ECI_NONE;
 
     if ((env->condexec_bits & 0xf) == 0) {
-        env->condexec_bits = (env->condexec_bits == (ECI_A0A1A2B0 << 4)) ?
+        eci = env->condexec_bits >> 4;
+        env->condexec_bits = (eci == ECI_A0A1A2B0) ?
             (ECI_A0 << 4) : (ECI_NONE << 4);
     }
 
@@ -111,17 +113,32 @@ static void mve_advance_vpt(CPUARMState *env)
         return;
     }
 
+    /* Invert P0 bits if needed, but only for beats we actually executed */
     mask01 = FIELD_EX32(vpr, V7M_VPR, MASK01);
     mask23 = FIELD_EX32(vpr, V7M_VPR, MASK23);
     if (mask01 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff;
+        if (eci == ECI_NONE) {
+            /* high bit set, but not 0b1000: invert the relevant half of P0 */
+            vpr ^= 0xff;
+        } else if (eci == ECI_A0) {
+            /* Invert only the beat 1 P0 bits, as we didn't execute beat 0 */
+            vpr ^= 0xf0;
+        } /* otherwise we didn't execute either beat 0 or beat 1 */
     }
     if (mask23 > 8) {
-        /* high bit set, but not 0b1000: invert the relevant half of P0 */
-        vpr ^= 0xff00;
+        if (eci != ECI_A0A1A2 && eci != ECI_A0A1A2B0) {
+            /* high bit set, but not 0b1000: invert the relevant half of P0 */
+            vpr ^= 0xff00;
+        } else {
+            /* We didn't execute beat 2, only invert the beat 3 P0 bits */
+            vpr ^= 0xf000;
+        }
     }
-    vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    /* Only update MASK01 if beat 1 executed */
+    if (eci == ECI_NONE || eci == ECI_A0) {
+        vpr = FIELD_DP32(vpr, V7M_VPR, MASK01, mask01 << 1);
+    }
+    /* Beat 3 always executes, so update MASK23 */
     vpr = FIELD_DP32(vpr, V7M_VPR, MASK23, mask23 << 1);
     env->v7m.vpr = vpr;
 }
-- 
2.20.1


