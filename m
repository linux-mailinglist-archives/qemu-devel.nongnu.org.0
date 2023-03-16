Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1B6BCD62
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclJK-0005pd-7h; Thu, 16 Mar 2023 06:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclJH-0005kp-6U
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:58:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclJE-0003vW-J3
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:58:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso2887942wmb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678964291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg1jZON4duZyKMHBrOX8HJjuZRqYcy7K1Mi69iN6ey8=;
 b=qgwKpFjMB6nDA380I9G5u5OhhkIF4tU2dV/MCsOoTVubrZV50UCsD0n8aoWS18AOr+
 xuNz2Y4GFKcuovDhvK37Ft2TYphZIHZQ6l2m0qaiRBK1Jl8XD6jXMcMhIXvlWrn1budr
 pkY1+yspqWW1+N+naQ5bEVff96dJVUor2kPfiKGNoRwipnwjtS2Z/1jB3Orgtn2ZBakG
 XyaipPV42dh1rMzONcgOCloq+YiSVg75Ew/ucRSw4XS4ByW5jVx5L0dXrisjAvB7qbd3
 oU6+1IZTSmMojyEPepQiIEViuyLH3P+FvaHLo2Hu4f+vSi2krmQoZiWl14lgsRfMjLFb
 yWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678964291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg1jZON4duZyKMHBrOX8HJjuZRqYcy7K1Mi69iN6ey8=;
 b=0jRtwuq92vnazFPvLmwmjOa2tLQM2CmeO8OVOWjQ3iAhMunTC5BF5mhUCNYZunWthp
 ZIHN24eghpHH4aTBgI7wj4QcyTsRnfSodggVDmPHqPwaoAvezATzdHMVsh9n+uLZsfNw
 wd/6ljDmcx0DhDevotdzMXmdlJMTDRxMQq/zgne9RxeQnH3uE+qMAXpvZeugOt5AD9Lk
 1PiA7Cw+Za5kjIx2Jz3RsUdxWIORREOTOYvqz/zUkFoFkCd2dKXsUsr3P0/6/Nv44B20
 v7bFtm3ko25BvdjVpAIghgAlVS0Bm8VQf8ngSw77u7WRD6M9Iff7ljHjUNUADSCSD2/g
 cLVQ==
X-Gm-Message-State: AO0yUKWVOLm4qQxMobja0dbB6/N9awbu+ubv3XN40/dySRb6Osjex/y6
 lkveBQqbX9FOm7PCQ4fSUB6zVeWpil7Nu7cdbao=
X-Google-Smtp-Source: AK7set+BSbsLKddBMSh74c4tYoZuLsulJylwdeyuM2ImejETw5f9X5/j1k/xS4xo8YmeALjVYqpLRw==
X-Received: by 2002:a05:600c:1d1c:b0:3ed:3038:b9b5 with SMTP id
 l28-20020a05600c1d1c00b003ed3038b9b5mr6260364wms.4.1678964290673; 
 Thu, 16 Mar 2023 03:58:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm4996764wmo.28.2023.03.16.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 03:58:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
Date: Thu, 16 Mar 2023 10:58:08 +0000
Message-Id: <20230316105808.1414003-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The markup for the Arm CPU feature documentation is incorrect,
and results in the HTML not rendering correctly -- the first
line of each description is rendered in boldface as if it
were part of the option name.

Reformat to match the styling used in cpu-models-x86.rst.inc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 00c444042ff..2b1a28422fb 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -177,39 +177,32 @@ are named with the prefix "kvm-".  KVM VCPU features may be probed,
 enabled, and disabled in the same way as other CPU features.  Below is
 the list of KVM VCPU features and their descriptions.
 
-  kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
-                           means that by default the virtual time
-                           adjustment is enabled (vtime is not *not*
-                           adjusted).
+``kvm-no-adjvtime``
+  By default kvm-no-adjvtime is disabled.  This means that by default
+  the virtual time adjustment is enabled (vtime is not *not* adjusted).
 
-                           When virtual time adjustment is enabled each
-                           time the VM transitions back to running state
-                           the VCPU's virtual counter is updated to ensure
-                           stopped time is not counted.  This avoids time
-                           jumps surprising guest OSes and applications,
-                           as long as they use the virtual counter for
-                           timekeeping.  However it has the side effect of
-                           the virtual and physical counters diverging.
-                           All timekeeping based on the virtual counter
-                           will appear to lag behind any timekeeping that
-                           does not subtract VM stopped time.  The guest
-                           may resynchronize its virtual counter with
-                           other time sources as needed.
+  When virtual time adjustment is enabled each time the VM transitions
+  back to running state the VCPU's virtual counter is updated to
+  ensure stopped time is not counted.  This avoids time jumps
+  surprising guest OSes and applications, as long as they use the
+  virtual counter for timekeeping.  However it has the side effect of
+  the virtual and physical counters diverging.  All timekeeping based
+  on the virtual counter will appear to lag behind any timekeeping
+  that does not subtract VM stopped time.  The guest may resynchronize
+  its virtual counter with other time sources as needed.
 
-                           Enable kvm-no-adjvtime to disable virtual time
-                           adjustment, also restoring the legacy (pre-5.0)
-                           behavior.
+  Enable kvm-no-adjvtime to disable virtual time adjustment, also
+  restoring the legacy (pre-5.0) behavior.
 
-  kvm-steal-time           Since v5.2, kvm-steal-time is enabled by
-                           default when KVM is enabled, the feature is
-                           supported, and the guest is 64-bit.
+``kvm-steal-time``
+  Since v5.2, kvm-steal-time is enabled by default when KVM is
+  enabled, the feature is supported, and the guest is 64-bit.
 
-                           When kvm-steal-time is enabled a 64-bit guest
-                           can account for time its CPUs were not running
-                           due to the host not scheduling the corresponding
-                           VCPU threads.  The accounting statistics may
-                           influence the guest scheduler behavior and/or be
-                           exposed to the guest userspace.
+  When kvm-steal-time is enabled a 64-bit guest can account for time
+  its CPUs were not running due to the host not scheduling the
+  corresponding VCPU threads.  The accounting statistics may influence
+  the guest scheduler behavior and/or be exposed to the guest
+  userspace.
 
 TCG VCPU Features
 =================
@@ -217,16 +210,15 @@ TCG VCPU Features
 TCG VCPU features are CPU features that are specific to TCG.
 Below is the list of TCG VCPU features and their descriptions.
 
-  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
-                           *impdef* (Implementation Defined) algorithm
-                           is enabled or the *architected* QARMA algorithm
-                           is enabled.  By default the impdef algorithm
-                           is disabled, and QARMA is enabled.
+``pauth-impdef``
+  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
+  Defined) algorithm is enabled or the *architected* QARMA algorithm
+  is enabled.  By default the impdef algorithm is disabled, and QARMA
+  is enabled.
 
-                           The architected QARMA algorithm has good
-                           cryptographic properties, but can be quite slow
-                           to emulate.  The impdef algorithm used by QEMU
-                           is non-cryptographic but significantly faster.
+  The architected QARMA algorithm has good ryptographic properties,
+  but can be quite slow to emulate.  The impdef algorithm used by QEMU
+  is non-cryptographic but significantly faster.
 
 SVE CPU Properties
 ==================
-- 
2.34.1


