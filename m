Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FCE5E9384
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:55:40 +0200 (CEST)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocS6d-0000ys-B9
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRzZ-0002YK-Ih
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:48:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRzX-0001FE-Uq
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLNk4fhMeQpFG+J5nKFN3DS77fn3aanljfTSgAMGm/w=; b=YxWAUf3W+NdhCIzNAuNtmJaDbp
 mKA9FBj3xgyQuwCF4FFxrVbIJzH6yl+lPrUMLA65yxi8sF9m5I1rpBlob7/kYKA6V4iv2FtgdmCc1
 SCAxwiCC62sDQeVtwxvkjWNgH6gmuToQ3mkG12TzusBq2yZx8IP0wTnYEpS3l0t/JrXBZIIEeeWvz
 LTM8bVQquVUupAO/yPt1QoPqwpI9KuIkLZQ1QU92BdV821iQwCwpMS9oD+5TrpNCDAIe2cQUfn4hz
 dT+HhZXd65WSxWOrO4NuFrV4ifBDp71fhBJ8aZBVPaovC3Pdf1Q+I0xaKMfKLjZ+q14FudjLfeCmu
 pSTYwl+4acQLQnX3J2vJ4PfDGuOADmPYU9Z0ozTjWr6hgdNKfCK6FvA2ZLItlZ3pfmxeQPj9HKb+z
 F8BvunxVz0QlEnX2mstth3YHVgf77O4rMQm8u0tfRjT6RmM38/4qYHIQHM9jjg+Zfto3LCgD6t6XU
 ogwq1BXVADLsRbHBu1Zks8edykqF7i+STIG/TvkF/VOpbpe7Wolcp4Fgrutbgfm+/W8/aaw3lVy8C
 ZVfVbabxep2MkUneIeqefzK4wO3yOnYPed00fJGufK8YVu70/K1j5ZA9C4aiD1Mtcqs3Pgj7Solbx
 kbLpy+Aaeyw5JNQ82GhzMyt5Uky8etj/ndiGaWqWM=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRxm-0008Ik-O9; Sun, 25 Sep 2022 14:46:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sun, 25 Sep 2022 14:48:03 +0100
Message-Id: <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
References: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/2] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There are already 32 feature bits in use, so change the size of the m68k
CPU features to uint64_t (along with the associated m68k_feature()
functions) to allow up to 64 feature bits to be used.

At the same time make use of the BIT_ULL() macro when reading/writing
the CPU feature bits to improve readability, and also update m68k_feature()
to return a bool rather than an int.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.c | 4 ++--
 target/m68k/cpu.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f681be3a2a..8d23c72056 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
-    env->features |= (1u << feature);
+    env->features |= BIT_ULL(feature);
 }
 
 static void m68k_unset_feature(CPUM68KState *env, int feature)
 {
-    env->features &= (-1u - (1u << feature));
+    env->features &= ~BIT_ULL(feature);
 }
 
 static void m68k_cpu_reset(DeviceState *dev)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 67b6c12c28..f5c6e95cb4 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -154,7 +154,7 @@ typedef struct CPUArchState {
     struct {} end_reset_fields;
 
     /* Fields from here on are preserved across CPU reset. */
-    uint32_t features;
+    uint64_t features;
 } CPUM68KState;
 
 /*
@@ -539,9 +539,9 @@ enum m68k_features {
     M68K_FEATURE_TRAPCC,
 };
 
-static inline int m68k_feature(CPUM68KState *env, int feature)
+static inline bool m68k_feature(CPUM68KState *env, int feature)
 {
-    return (env->features & (1u << feature)) != 0;
+    return (env->features & BIT_ULL(feature)) != 0;
 }
 
 void m68k_cpu_list(void);
-- 
2.30.2


