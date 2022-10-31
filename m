Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779846131E3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:47:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQQy-0001lz-1C; Mon, 31 Oct 2022 04:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opQQt-0001lg-QS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:46:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opQQo-0005Gy-0f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:46:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id k7so414926pll.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4NC4CbXNET7QgKVIkEBX2g1Hrhwce2DSB/31NQyzbcs=;
 b=1hhwDUqKUQAV2Qk9F9ttMxXYnXky+Wl7FQkFWWE2SyhWrJ6IdUzGafxkSlIyc82hL7
 I3zebG2xJDYo2JkOgOB8T+68HOBXD93iMYEm5EvlWwg7Qa0EHpQfEC+gHO0RoagBnbLe
 MfEmuj0FyhLksPTk2DKIOGyNA3lZzA5nTSU6w8tYuQEdq9GgVkkFfQMRSpTLcQoYs+0s
 P1mbDI/6Gnf220/1mFfHu5U5qyKTji5EvIgz5jLP3tvelqHEvkJnu3E0YCt5BNctPVMW
 cV02vovH7Lgnuxl1OTf0A8g8QxYBdj7VaPzyBEUOl9Hei03i5PouZZEjznjg1YnsmITI
 NgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4NC4CbXNET7QgKVIkEBX2g1Hrhwce2DSB/31NQyzbcs=;
 b=vGP54p9S4EI37ZFijUGk1huiPtNp6ihxvSBDfglF6Huar8qLPvJrATtcAhZoOuzKlf
 UqjSc9y8gbaGmf+zhg5udDoDO93jagTmBWyrG76WagPj5hAGPIV/7x9MBSR+B76x81S9
 8l9nl5O3SPteNN6uLV/3XUiBuASkynlNNftAB4gEBWwpnFmYZTsw0LuzjGF/QpQN8Y8H
 9plBuPOQoSkwMjlXJUp9TgcpVO38j7v8S4hgL7GkjazyYDTYVnULLw4rFpecUcDq0gs2
 9+J9+Omvmv4V3bWWu3ahySSyAM3Xktpz0B8F916JdwKGiFbko32slCeHUr71Hk4lai8D
 Eb1A==
X-Gm-Message-State: ACrzQf365Vy3tROFUEZvBi+1EwTLQBGDnrd2n17iDngEVI7mzKVdwQic
 qta2l+E5B9wfq40iPKDjx0nBWS7dA1pRMw==
X-Google-Smtp-Source: AMsMyM6qZkl8oydeFTBRUUBL7h7HegoImY1+Odm0gRWHK4n2pHGbx3m6JxfMtGRxpYCd0xEUIT7abQ==
X-Received: by 2002:a17:902:e54e:b0:187:ba9:4305 with SMTP id
 n14-20020a170902e54e00b001870ba94305mr10012405plf.167.1667205963312; 
 Mon, 31 Oct 2022 01:46:03 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 g139-20020a625291000000b0056d2797bf05sm3478385pfb.217.2022.10.31.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 01:46:02 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Date: Mon, 31 Oct 2022 17:43:25 +0900
Message-Id: <20221031084324.844220-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=ake@igel.co.jp; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We need to check HCR_E2H and HCR_TGE to select the right MMU index for
the correct translation regime.

To check for EL2&0 translation regime:
- For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
- For S1E2* ops, check only HCR_E2H

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---

v2:
- Rebase with the latest upstream
- It turns out that we need to check both HCR_E2H and HCR_TGE for
  S1E0*, S1E1* and S12E* address translation as well according to the
  Architecture Manual.

v1:
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html

 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b070a20f1a..f7b988395a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3501,19 +3501,33 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
+    bool regime_e20 = (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) ==
+                      (HCR_E2H | HCR_TGE);
 
     switch (ri->opc2 & 6) {
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                if (regime_e20) {
+                    mmu_idx = ARMMMUIdx_E20_2_PAN;
+                } else {
+                    mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                }
             } else {
-                mmu_idx = ARMMMUIdx_Stage1_E1;
+                if (regime_e20) {
+                    mmu_idx = ARMMMUIdx_E20_2;
+                } else {
+                    mmu_idx = ARMMMUIdx_Stage1_E1;
+                }
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
+                mmu_idx = ARMMMUIdx_E20_2;
+            } else {
+                mmu_idx = ARMMMUIdx_E2;
+            }
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
@@ -3524,13 +3538,25 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = ARMMMUIdx_Stage1_E0;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_0;
+        } else {
+            mmu_idx = ARMMMUIdx_Stage1_E0;
+        }
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = ARMMMUIdx_E10_1;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_2;
+        } else {
+            mmu_idx = ARMMMUIdx_E10_1;
+        }
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = ARMMMUIdx_E10_0;
+        if (regime_e20) {
+            mmu_idx = ARMMMUIdx_E20_0;
+        } else {
+            mmu_idx = ARMMMUIdx_E10_0;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


