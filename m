Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3D308812
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:09:15 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ReM-00084Q-Pk
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW3-0004NN-5c
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVn-0006uP-PS
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o10so6794960wmc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TPZILYkgh6hHHCNCFPKdewpdFM5U2Lja1SNGzqSj66g=;
 b=NTj2LZVunRd2c32EUbiQZgWQ42M6nvRxLlXU/HDTtZJWWxc5gLXfXwDjd06AAiTYVU
 SfYZqmlbIdY5wth+CeklBS5ryOfOIf9Di8pxVsF71Eopk6EpJfARHfI/BhW3upLixWmO
 MFtJfFmAuMeAJemD6ctMw2YSmqBW23V5X+ur/hSi4vogV0V2SIEw87bTNKeVuELc2dpj
 XAFzFCxDYCqyIdWFw0Uw8SDTTUONeCTlqzF0UVz/Q9DREftiuDdcHTzNDI27qK5P+ged
 UUAyTXIvDy0MuSzimSQOABSyHSjsnjuzo8C/jSi6YWOyTdkyt5ZO4s2W9RGEaf0fB7D3
 F3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPZILYkgh6hHHCNCFPKdewpdFM5U2Lja1SNGzqSj66g=;
 b=YZTObGZvZ1faugeLxEF9tyw17SGR5/O7VSWpGOmir87WdRBZIHnLPb+719SHShOCwG
 GGmg4U8p/ZhERa2rOsadxOIaVXlrGQplu8iSAxgIIpxoPtGAqoqRbaZ8OCALAAhyWMOI
 TYhbv77+tBl5bmObvxzg9lNWh2glBPZwzJymmT/KA2GpR7t7iGuLnObUnQ4noTtfktGj
 HxZi/d6cxBvTnyPTi2weq7D639xGaEIkQEaclpGvR2NE9Ic/FyW3E5f+xRw2r/eEVyVW
 O7fYBhmE9pu1hTykGlokOUxSCQJTBy3XyGc9OsB+3YqQXQRRDCTKoImmHH21yGUKMoeS
 pzfw==
X-Gm-Message-State: AOAM530tds0/ndDHbtQ4Cg1CMEKHtPk7XXItkw/vJf3DsDuhcU23DoOu
 OcIsASn4cqja8jOUK6Z5pMVcD8g6JDQheQ==
X-Google-Smtp-Source: ABdhPJxEo1ngYSt23R/bZISdTckFRbCylpLKnKCtMmjQfXiT1mx6Qwjqv5yv6T8Sk8Eo7UINEmHvEA==
X-Received: by 2002:a05:600c:35d6:: with SMTP id
 r22mr3280098wmq.44.1611918021527; 
 Fri, 29 Jan 2021 03:00:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/46] hw/misc: Fix arith overflow in NPCM7XX PWM module
Date: Fri, 29 Jan 2021 10:59:33 +0000
Message-Id: <20210129110012.8660-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Fix potential overflow problem when calculating pwm_duty.
1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
   hardware specification.
2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
   can excceed UINT32_MAX, we convert them to uint64_t in computation
   and converted them back to uint32_t.
   (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)

Fixes: CID 1442342
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Doug Evans <dje@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210127011142.2122790-1-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/npcm7xx_pwm.c          | 23 +++++++++++++++++++----
 tests/qtest/npcm7xx_pwm-test.c |  4 ++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index e99e3cc7ef3..dabcb6c0f95 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -58,6 +58,9 @@ REG32(NPCM7XX_PWM_PWDR3, 0x50);
 #define NPCM7XX_CH_INV              BIT(2)
 #define NPCM7XX_CH_MOD              BIT(3)
 
+#define NPCM7XX_MAX_CMR             65535
+#define NPCM7XX_MAX_CNR             65535
+
 /* Offset of each PWM channel's prescaler in the PPR register. */
 static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
 /* Offset of each PWM channel's clock selector in the CSR register. */
@@ -96,7 +99,7 @@ static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
 
 static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (p->running) {
         if (p->cnr == 0) {
@@ -104,7 +107,7 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
         } else if (p->cmr >= p->cnr) {
             duty = NPCM7XX_PWM_MAX_DUTY;
         } else {
-            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
         }
     } else {
         duty = 0;
@@ -357,7 +360,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CNR2:
     case A_NPCM7XX_PWM_CNR3:
         p = &s->pwm[npcm7xx_cnr_index(offset)];
-        p->cnr = value;
+        if (value > NPCM7XX_MAX_CNR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cnr value: %u", __func__, value);
+            p->cnr = NPCM7XX_MAX_CNR;
+        } else {
+            p->cnr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
@@ -366,7 +375,13 @@ static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
     case A_NPCM7XX_PWM_CMR2:
     case A_NPCM7XX_PWM_CMR3:
         p = &s->pwm[npcm7xx_cmr_index(offset)];
-        p->cmr = value;
+        if (value > NPCM7XX_MAX_CMR) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid cmr value: %u", __func__, value);
+            p->cmr = NPCM7XX_MAX_CMR;
+        } else {
+            p->cmr = value;
+        }
         npcm7xx_pwm_update_output(p);
         break;
 
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 63557d2c061..3d82654b81a 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -272,7 +272,7 @@ static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
 
 static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
 {
-    uint64_t duty;
+    uint32_t duty;
 
     if (cnr == 0) {
         /* PWM is stopped. */
@@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
     } else if (cmr >= cnr) {
         duty = MAX_DUTY;
     } else {
-        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
     }
 
     if (inverted) {
-- 
2.20.1


