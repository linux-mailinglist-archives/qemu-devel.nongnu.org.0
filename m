Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3850FDA8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:52:39 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKgI-0005rs-Tp
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njKX6-0002GZ-BF; Tue, 26 Apr 2022 08:43:10 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njKX4-00062J-DH; Tue, 26 Apr 2022 08:43:07 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 725ED2076B;
 Tue, 26 Apr 2022 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650976981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RWHtsDu+LE670syEAcFAHX7KCWw0niSW9QAOQGqfOwo=;
 b=c3Z8POyByBGITkrTFYZCoMhbE567YLoYG0Tw3FaiNvjz42LdDEFV8FY/hDt79R4gJDTMVn
 TGdqVr9EbDkhLmOPzyzmT/aNagTKeC44AP/mbxAsZenJkgIByIv/4GzSAanskwmkI/9+Oh
 aZE771O7KEJkNrnkvie1Oyv12ScoVoc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Disable cryptographic instructions when neon is
 disabled
Date: Tue, 26 Apr 2022 14:42:59 +0200
Message-Id: <20220426124259.44087-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of now, cryptographic instructions ISAR fields are never cleared so
we can end up with a cpu with cryptographic instructions but no
floating-point/neon instructions which is impossible according to ARM
specifications.

In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
+ no support
+ cortex-a57/a72: cryptographic extension is optional,
  floating-point/neon is not.
+ cortex-a53: crytographic extension is optional as well as
  floationg-point/neon. But cryptographic requires
  floating-point/neon support.

Therefore we can safely clear the ISAR fields when neon is disabled.

Note that other arm cpus seem to follow this. For example cortex-a55 is
like cortex-a53 and cortex-a76 is like cortex-57/72.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Note: if we wanted to provide such configuration, we could have a
has_crypto property/feature to represent this.
---
 target/arm/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..e789d18851 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_NEON);
 
         t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         cpu->isar.id_aa64isar0 = t;
 
@@ -1601,6 +1604,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_aa64pfr0 = t;
 
         u = cpu->isar.id_isar5;
+        u = FIELD_DP32(u, ID_ISAR5, AES, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA1, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA2, 0);
         u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
         u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
         cpu->isar.id_isar5 = u;
-- 
2.35.1


