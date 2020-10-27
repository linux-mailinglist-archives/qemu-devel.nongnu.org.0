Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10629B1D9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:35:55 +0100 (CET)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQ4o-0005PY-OL
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnO-0001lI-2a; Tue, 27 Oct 2020 10:17:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48703 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnJ-0007Yr-TE; Tue, 27 Oct 2020 10:17:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CLDLb4DxVz9sfF; Wed, 28 Oct 2020 01:17:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1603808263;
 bh=TOdw5JH2Yz5af80pQkkTcNDiEbkuiIiC/9BWjLk3qOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A7ipTlfTzudn13/6pLBs38SPVwVnjTy6puHhwHrGvulQyYvkibMyOUS+MrCWnlvZR
 3RBG5/WgAz3zqLLPdiCORy6GpolItuOwi1rYaFK253FelyPatJgQGFCgCwiSdpa5+d
 wg2OgSfAz/LpNc2XeruIf0J+/TlhN3tZUAw051lQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/18] ppc/spapr: re-assert IRQs during event-scan if there are
 pending
Date: Wed, 28 Oct 2020 01:17:19 +1100
Message-Id: <20201027141735.728821-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027141735.728821-1-david@gibson.dropbear.id.au>
References: <20201027141735.728821-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If we hotplug a CPU during the first second of the kernel boot,
the IRQ can be sent to the kernel while the RTAS event handler
is not installed. The event is queued, but the kernel doesn't
collect it and ignores the new CPU.

As the code relies on edge-triggered IRQ, we can re-assert it
during the event-scan RTAS call if there are still pending
events (as it is already done in check-exception).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20201015210318.117386-1-lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_events.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 1069d0197b..1add53547e 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -1000,10 +1000,22 @@ static void event_scan(PowerPCCPU *cpu, SpaprMachineState *spapr,
                        target_ulong args,
                        uint32_t nret, target_ulong rets)
 {
+    int i;
     if (nargs != 4 || nret != 1) {
         rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
         return;
     }
+
+    for (i = 0; i < EVENT_CLASS_MAX; i++) {
+        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
+            const SpaprEventSource *source =
+                spapr_event_sources_get_source(spapr->event_sources, i);
+
+            g_assert(source->enabled);
+            qemu_irq_pulse(spapr_qirq(spapr, source->irq));
+        }
+    }
+
     rtas_st(rets, 0, RTAS_OUT_NO_ERRORS_FOUND);
 }
 
-- 
2.26.2


