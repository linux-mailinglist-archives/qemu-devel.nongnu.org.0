Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F73F9524
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:31:32 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWKp-00030u-F3
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0000wy-RB; Fri, 27 Aug 2021 03:10:03 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW01-0007Qo-DD; Fri, 27 Aug 2021 03:10:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ2xZ4z9sWq; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=8mwz5z7tk9HCPotzC+zmTYS1fIj7cHyjW0MkzsT2L1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KA+LBSthkqTSYzqdwoQb22PqWoVHdsgxN5sJoX/5EeR+Tpu7r/ix6yYQmHL5uGpJc
 HgiONq5ttrmeB1gNW1DPzTNegwUmSGicA5XpRkQxu/RZODAhrUY3FWJAIPW7M7Q7O7
 OvsF3yZyzhLX+kuw1Bolzs16s1s4jM7/7AzzJVcQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/18] ppc: Add a POWER10 DD2 CPU
Date: Fri, 27 Aug 2021 17:09:35 +1000
Message-Id: <20210827070946.219970-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit. DD1 doesn't have
HAIL but since it does not break the modeling and that we don't plan
to support DD1, modify the LPCR mask of all the POWER10 family.

Setting the HAIL bit is a requirement to support the scv instruction
on PowerNV POWER10 platforms since glibc-2.33.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-2-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu-models.c | 4 +++-
 target/ppc/cpu-models.h | 1 +
 target/ppc/cpu_init.c   | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 87e4228614..4baa111713 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -776,6 +776,8 @@
                 "POWER9 v2.0")
     POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POWER10,
                 "POWER10 v1.0")
+    POWERPC_DEF("power10_v2.0",  CPU_POWERPC_POWER10_DD20,           POWER10,
+                "POWER10 v2.0")
 #endif /* defined (TARGET_PPC64) */
 
 /***************************************************************************/
@@ -952,7 +954,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "power8", "power8_v2.0" },
     { "power8nvl", "power8nvl_v1.0" },
     { "power9", "power9_v2.0" },
-    { "power10", "power10_v1.0" },
+    { "power10", "power10_v2.0" },
 #endif
 
     /* Generic PowerPCs */
diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index fc5e21728d..0952592759 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -375,6 +375,7 @@ enum {
     CPU_POWERPC_POWER9_DD20        = 0x004E1200,
     CPU_POWERPC_POWER10_BASE       = 0x00800000,
     CPU_POWERPC_POWER10_DD1        = 0x00800100,
+    CPU_POWERPC_POWER10_DD20       = 0x00800200,
     CPU_POWERPC_970_v22            = 0x00390202,
     CPU_POWERPC_970FX_v10          = 0x00391100,
     CPU_POWERPC_970FX_v20          = 0x003C0200,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 319a272d4c..ad7abc6041 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8269,6 +8269,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                              LPCR_DEE | LPCR_OEE))
         | LPCR_MER | LPCR_GTSE | LPCR_TC |
         LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
+    /* DD2 adds an extra HAIL bit */
+    pcc->lpcr_mask |= LPCR_HAIL;
+
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-- 
2.31.1


