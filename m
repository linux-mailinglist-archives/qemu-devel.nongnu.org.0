Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52D3725A6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:01:42 +0200 (CEST)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo7p-0002z4-Ns
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzw-0005DQ-Rj; Tue, 04 May 2021 01:53:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzs-0004fX-R4; Tue, 04 May 2021 01:53:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK1YrWz9sWH; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=O5zitTu+nloRXDlrgGA5ooBE2GZ6ePUNtmsAOMIModU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jS+Y1XgtrUo/X4LKu+GcN0TgNn3KEXeWvz981JCyJDnYCXOAy7FdJP2I5J3dfkB/g
 nwuW/2wg/XpicofvtV8MzYDnaCnJv7AWGT+GVic34OgRrMSeV2QZcPSzvJL2Ir+KnU
 Hz61gcwsf/uw3yKujxeD40U1z6NYq5zRoQPk7gR4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/46] hw/ppc/pnv_core: Update hflags after setting msr
Date: Tue,  4 May 2021 15:52:34 +1000
Message-Id: <20210504055312.306823-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-15-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index bd2bf2e044..8c2a15a0fb 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -29,6 +29,7 @@
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
+#include "helper_regs.h"
 
 static const char *pnv_core_cpu_typename(PnvCore *pc)
 {
@@ -55,8 +56,8 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
     env->gpr[3] = PNV_FDT_ADDR;
     env->nip = 0x10;
     env->msr |= MSR_HVB; /* Hypervisor mode */
-
     env->spr[SPR_HRMOR] = pc->hrmor;
+    hreg_compute_hflags(env);
 
     pcc->intc_reset(pc->chip, cpu);
 }
-- 
2.31.1


