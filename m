Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C833E247D75
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:25:17 +0200 (CEST)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tBU-0007lv-R6
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t63-00078q-Rd; Tue, 18 Aug 2020 00:19:39 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t61-0006Jc-FA; Tue, 18 Aug 2020 00:19:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNY6cwLz9sTX; Tue, 18 Aug 2020 14:19:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724365;
 bh=OAAGdUDZCZvz9NTw3kp186i3ZI0PgeQ2wFCzGQWfCqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GeacrFhJor8nkd1EM9huhrZVq91VQtrt69fHQmKe4nAzYgQ+v1LtVJWgNEoSVjRaf
 E40SEUgj5bdUn4r56Q0TSvCYaObcWhh58QXZoM1mVJ/XrteWTyzMr4mkSmPuZtIqRQ
 gFQiAiFzHaWSIPBWL7FQzHHxAEfGFmViEMIC9kTY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/40] target/ppc: Enable Power ISA 3.1
Date: Tue, 18 Aug 2020 14:18:45 +1000
Message-Id: <20200818041922.251708-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lijun Pan <ljp@linux.ibm.com>

This patch enables the Power ISA 3.1 in QEMU.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
Message-Id: <20200701234344.91843-3-ljp@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h                | 2 +-
 target/ppc/translate_init.inc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7bfee8211f..3c4e1b3475 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2201,7 +2201,7 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300)
+                        PPC2_ISA300 | PPC2_ISA310)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 7e66822b5d..5134123dd6 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -9201,7 +9201,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
-- 
2.26.2


