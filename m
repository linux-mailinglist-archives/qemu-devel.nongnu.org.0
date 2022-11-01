Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A7B6144CA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 07:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opl2s-00024w-2W; Tue, 01 Nov 2022 02:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opl2U-000222-Ua
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 02:46:24 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1opl2K-0001Ga-2Y
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 02:46:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 20so12671973pgc.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 23:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTr2buqxaYr8UkugLXntG6akq32XV/ilPeT9xCMuxpw=;
 b=ou7TABLPFWRKyvkYtQBzU2IDR2zykLaiXgLU6X2VH6iSvaSkm66748P3BWAE4fiL8I
 /sd3EfxLCSRjii+EYbDFPNwkArw7oJ6LaIVQwD8Lwnj8ik7m02bpniCIzGB0vqQi543q
 S10BXKlGTSwIAYgfkMS/7OrlpMTJeYo0QsZ3BQYkvtIDMc94b5CS1LHYidxaXC/UONh/
 v+7QpntrTzdAJJSEi8aJcxLGkdM4HIv5sqtzmnmjOvE4jnsZN7JIM/Vfdl3QGdHPVPyd
 nGbLZEFY6gmId2/+XRFRe0U+1SKFeTlWJBHgsqLL9CL3HX5FgN8tw+zsSqAG5macdXVi
 Sqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTr2buqxaYr8UkugLXntG6akq32XV/ilPeT9xCMuxpw=;
 b=qBd7F427crxPM2yZELItC3a9xo74Q3EaHQRobXOvI5kDZes2X5GzraWkXiBoyhm77j
 y/wGDpCZUdY97pZpbsNlJF5x0YA1zt20mJO6sQG5q1AF7S3UdpvVGSfXonh4B7Bgu3Fe
 P5MYAaOiUTaUiPEiHci92xPOAxE8rXH5CURGjeChuDaGi3mMEaZh+c0lSbO8dmZZpxHR
 9+xUOvlzG+ZcVzW2DyQgzbqkh57VBki+QwqVPK72qBjK9rhzttiWTzYMbSBI3qaKOfTW
 nJSqbQy96g/2NLmMVVmDVmCgQoA0DeJYmvqyGmSO5JNNGb49fXd2qTAcsm5bjYy10HVl
 NczA==
X-Gm-Message-State: ACrzQf2udJT+tJRLht2o7x8kmLvAD7C4sXd9ejNkBvK/5tPjvprtAm9b
 TFeEdplZ+MyF76YIdKLa1Zx3NfKaeWOF6Mlf
X-Google-Smtp-Source: AMsMyM7fBPpw7kzt+WTAC1UArV4mflVab1cTWwLhhTwqcqP+AwzshBPzpW3edRAVBsQujN9CvPtvtg==
X-Received: by 2002:a05:6a02:186:b0:439:49a3:479b with SMTP id
 bj6-20020a056a02018600b0043949a3479bmr16067493pgb.171.1667285169477; 
 Mon, 31 Oct 2022 23:46:09 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902654c00b00176acd80f69sm5500949pln.102.2022.10.31.23.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 23:46:08 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v3] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Date: Tue,  1 Nov 2022 15:42:53 +0900
Message-Id: <20221101064250.12444-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ake@igel.co.jp; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We need to check HCR_E2H and HCR_TGE to select the right MMU index for
the correct translation regime.

To check for EL2&0 translation regime:
- For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
- For S1E2* ops, check only HCR_E2H

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---

v3:
- Avoid recomputing arm_hcr_el2_eff() as recommended by Richard H.
- Use ':?' for more compact code as recommended by Richard H.

v2:
- Rebase with the latest upstream
- It turns out that we need to check both HCR_E2H and HCR_TGE for
  S1E0*, S1E1* and S12E* address translation as well according to the
  Architecture Manual.
- https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg06084.html

v1:
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html

 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b070a20f1a..c17962372d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3501,19 +3501,22 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
 
     switch (ri->opc2 & 6) {
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                mmu_idx = regime_e20 ?
+                          ARMMMUIdx_E20_2_PAN : ARMMMUIdx_Stage1_E1_PAN;
             } else {
-                mmu_idx = ARMMMUIdx_Stage1_E1;
+                mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            mmu_idx = hcr_el2 & HCR_E2H ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
@@ -3524,13 +3527,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = ARMMMUIdx_Stage1_E0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = ARMMMUIdx_E10_1;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_E10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = ARMMMUIdx_E10_0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_E10_0;
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


