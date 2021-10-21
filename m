Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8ED435A14
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:46:45 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPyV-0003RW-La
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZU-0005We-C5; Thu, 21 Oct 2021 00:20:54 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZQ-0008Bp-60; Thu, 21 Oct 2021 00:20:52 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p3fF0z4xdB; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=+pyKoynpeIaOLPZBWqOQ58TrLzhA4W0YFbH1vE9ROhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MaaYyHCaafcqdmmAwB44qQ5G3nT/hH8OHUibZ+8f61j73Ev55t1DgjsdIIMpshmFB
 rRr8xi5t2j7UAkXsxAo4kwwhWL347gHyFfd9htoN/fd94WqJzfmt/FDo/f/T1puHBA
 IKJ+nayKGdSAnz7s/8fXd9kVEuiQyzI5aCdNMdmg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/25] hw/ppc/spapr_softmmu: Reduce include list
Date: Thu, 21 Oct 2021 15:20:07 +1100
Message-Id: <20211021042027.345405-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Commit 962104f0448 ("hw/ppc: moved hcalls that depend on softmmu")
introduced a lot of unnecessary #include directives. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211006170801.178023-1-philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_softmmu.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index 6c6b86dd3c..f8924270ef 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -1,25 +1,10 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "qapi/error.h"
-#include "sysemu/hw_accel.h"
-#include "sysemu/runstate.h"
-#include "qemu/log.h"
-#include "qemu/main-loop.h"
-#include "qemu/module.h"
-#include "qemu/error-report.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
-#include "hw/ppc/spapr_cpu_core.h"
 #include "mmu-hash64.h"
-#include "cpu-models.h"
-#include "trace.h"
-#include "kvm_ppc.h"
-#include "hw/ppc/fdt.h"
-#include "hw/ppc/spapr_ovec.h"
 #include "mmu-book3s-v3.h"
-#include "hw/mem/memory-device.h"
 
 static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
 {
-- 
2.31.1


