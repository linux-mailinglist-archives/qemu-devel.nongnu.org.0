Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D523C1F15
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:49:34 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jOH-00075E-Da
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuD-0002MI-IN; Fri, 09 Jul 2021 01:18:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46017 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iu7-00024i-R0; Fri, 09 Jul 2021 01:18:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf4L33z9t6S; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=3U0sBL2BFTOAco2yKBEHlINhjEAC4B8ZVgzjvIoshYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PkTLkfb4MrNPed/XEmu914VPMTp9IlaMu3Z0sWfKcfh88E6Ea08mjluM2Yok1EXFf
 /u/YSOjOkcaEk20SfSboWbxXmElcO6+BSnb8q6Baq9512xh8MxlB3WoE5jK9PxDnFo
 NJMrejS5YCOhSrOBRNdqG8R/JAjpH50qh9QBIQd0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 26/33] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D
 cache flush bits
Date: Fri,  9 Jul 2021 15:17:21 +1000
Message-Id: <20210709051728.170203-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

There are several new L1D cache flush bits added to the hcall which reflect
hardware security features for speculative cache access issues.

These behaviours are now being specified as negative in order to simplify
patched kernel compatibility with older firmware (a new problem found in
existing systems would automatically be vulnerable).

[dwg: Technically this changes behaviour for existing machine types.
 After discussion with Nick, we've determined this is safe, because
 the worst that will happen if a guest gets the wrong information due
 to a migration is that it will perform some unnecessary workarounds,
 but will remain correct and secure (well, as secure as it was going
 to be anyway).  In addition the change only affects cap-cfpc=safe
 which is not enabled by default, and in fact is not possible to set
 on any current hardware (though it's expected it will be possible on
 POWER10)]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210615044107.1481608-1-npiggin@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c   | 2 ++
 include/hw/ppc/spapr.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 03fc191599..80ae8eaadd 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1318,6 +1318,8 @@ static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
         behaviour |= H_CPU_BEHAV_L1D_FLUSH_PR;
         break;
     case SPAPR_CAP_FIXED:
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
+        behaviour |= H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
         break;
     default: /* broken */
         assert(safe_cache == SPAPR_CAP_BROKEN);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 1e63f33e9a..a25e69fe4c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -400,10 +400,13 @@ struct SpaprMachineState {
 #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
 #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
 #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
+
 #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
 #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
 #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
 #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
+#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
 
 /* Each control block has to be on a 4K boundary */
 #define H_CB_ALIGNMENT     4096
-- 
2.31.1


