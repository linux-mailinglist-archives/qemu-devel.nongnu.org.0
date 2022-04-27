Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46551141E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:10:41 +0200 (CEST)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdh1-0001kK-UT
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njdY6-00065N-98; Wed, 27 Apr 2022 05:01:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1njdY3-00024i-Ec; Wed, 27 Apr 2022 05:01:25 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 746E72077F;
 Wed, 27 Apr 2022 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1651050080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vTuy2Q3HKMxmWp0VRYSAap4dqyjc1PqEPVf4LD5lV0g=;
 b=m/++t9BjlWk2HE9MwQCl3oYY4kSxAixJyTANJ2JCU3yxHNtT8TW4zS2i0Tg6XWzvkHcnQt
 zNT3YPkwokDwrs2I2iZ3PKe9fupQ8TE/P8omUCSu6N2fq986EVYAGMLpoZHMbr9GGumEl0
 Y/uH8D55jfuBnCPBALeak97xZCo3yf0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Disable cryptographic instructions when neon
 is disabled
Date: Wed, 27 Apr 2022 11:01:17 +0200
Message-Id: <20220427090117.6954-1-damien.hedde@greensocs.com>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of now, cryptographic instructions ISAR fields are never cleared so
we can end up with a cpu with cryptographic instructions but no
floating-point/neon instructions which is not a possible configuration
according to ARM specifications.

In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
+ no support
+ cortex-a57/a72: cryptographic extension is optional,
  floating-point/neon is not.
+ cortex-a53: crytographic extension is optional as well as
  floationg-point/neon. But cryptographic requires
  floating-point/neon support.

Therefore we can safely clear the ISAR fields when neon is disabled.

Note that other arm cpus seem to follow this. For example cortex-a55 is
like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v2: also clear SHA3 / SM3 / SM4 (Richard)
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..e46a766d77 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_NEON);
 
         t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         cpu->isar.id_aa64isar0 = t;
 
@@ -1601,6 +1607,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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


