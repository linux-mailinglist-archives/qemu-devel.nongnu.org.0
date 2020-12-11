Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8442D6F3F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:29:32 +0100 (CET)
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kna3f-0003Ix-57
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqF-0005lu-1k; Thu, 10 Dec 2020 23:15:39 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56599 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqB-0000pj-SV; Thu, 10 Dec 2020 23:15:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrc3Lh0z9sWy; Fri, 11 Dec 2020 15:15:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660112;
 bh=IXziBW6A0+bXO+pr1Qs2Pbi1BTgRioKNIyBix/3OlWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A/T2deZtkOD2HJhO/Wf6rKaNyjrbyLCG/77ilx+Z4kJS11bN4+RdsG/VRBTHdHgUt
 zpEajKM1EFuIdyT5BGwcJ0zm8cuELlG2LSJDvrFPrSY4plnnsVIGrRFvtHh3+Kc31u
 aC2gkR7u+2exCvzgiK82GUDGX0UVPnNeM2VjU7GE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 16/30] xive: Add trace events
Date: Fri, 11 Dec 2020 15:14:53 +1100
Message-Id: <20201211041507.425378-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

I have been keeping those logging messages in an ugly form for
while. Make them clean !

Beware not to activate all of them, this is really verbose.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20201123163717.1368450-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c     | 33 +++++++++++++++++++++++++++++++++
 hw/intc/spapr_xive_kvm.c |  5 +++++
 hw/intc/trace-events     | 33 +++++++++++++++++++++++++++++++++
 hw/intc/xive.c           | 40 +++++++++++++++++++++++++++++++++++++---
 4 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 60e0d5769d..caedd312d7 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -24,6 +24,7 @@
 #include "hw/ppc/xive.h"
 #include "hw/ppc/xive_regs.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 
 /*
  * XIVE Virtualization Controller BAR and Thread Managment BAR that we
@@ -556,6 +557,8 @@ static int spapr_xive_claim_irq(SpaprInterruptController *intc, int lisn,
 
     assert(lisn < xive->nr_irqs);
 
+    trace_spapr_xive_claim_irq(lisn, lsi);
+
     if (xive_eas_is_valid(&xive->eat[lisn])) {
         error_setg(errp, "IRQ %d is not free", lisn);
         return -EBUSY;
@@ -581,6 +584,8 @@ static void spapr_xive_free_irq(SpaprInterruptController *intc, int lisn)
     SpaprXive *xive = SPAPR_XIVE(intc);
     assert(lisn < xive->nr_irqs);
 
+    trace_spapr_xive_free_irq(lisn);
+
     xive->eat[lisn].w &= cpu_to_be64(~EAS_VALID);
 }
 
@@ -647,6 +652,8 @@ static void spapr_xive_set_irq(SpaprInterruptController *intc, int irq, int val)
 {
     SpaprXive *xive = SPAPR_XIVE(intc);
 
+    trace_spapr_xive_set_irq(irq, val);
+
     if (spapr_xive_in_kernel(xive)) {
         kvmppc_xive_source_set_irq(&xive->source, irq, val);
     } else {
@@ -894,6 +901,8 @@ static target_ulong h_int_get_source_info(PowerPCCPU *cpu,
     target_ulong flags  = args[0];
     target_ulong lisn   = args[1];
 
+    trace_spapr_xive_get_source_info(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1009,6 +1018,8 @@ static target_ulong h_int_set_source_config(PowerPCCPU *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
 
+    trace_spapr_xive_set_source_config(flags, lisn, target, priority, eisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1114,6 +1125,8 @@ static target_ulong h_int_get_source_config(PowerPCCPU *cpu,
     uint8_t nvt_blk;
     uint32_t end_idx, nvt_idx;
 
+    trace_spapr_xive_get_source_config(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1188,6 +1201,8 @@ static target_ulong h_int_get_queue_info(PowerPCCPU *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
 
+    trace_spapr_xive_get_queue_info(flags, target, priority);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1275,6 +1290,8 @@ static target_ulong h_int_set_queue_config(PowerPCCPU *cpu,
     uint8_t end_blk, nvt_blk;
     uint32_t end_idx, nvt_idx;
 
+    trace_spapr_xive_set_queue_config(flags, target, priority, qpage, qsize);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1442,6 +1459,8 @@ static target_ulong h_int_get_queue_config(PowerPCCPU *cpu,
     uint8_t end_blk;
     uint32_t end_idx;
 
+    trace_spapr_xive_get_queue_config(flags, target, priority);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1535,6 +1554,10 @@ static target_ulong h_int_set_os_reporting_line(PowerPCCPU *cpu,
                                                 target_ulong opcode,
                                                 target_ulong *args)
 {
+    target_ulong flags   = args[0];
+
+    trace_spapr_xive_set_os_reporting_line(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1571,6 +1594,10 @@ static target_ulong h_int_get_os_reporting_line(PowerPCCPU *cpu,
                                                 target_ulong opcode,
                                                 target_ulong *args)
 {
+    target_ulong flags   = args[0];
+
+    trace_spapr_xive_get_os_reporting_line(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1623,6 +1650,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
     hwaddr mmio_addr;
     XiveSource *xsrc = &xive->source;
 
+    trace_spapr_xive_esb(flags, lisn, offset, data);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1692,6 +1721,8 @@ static target_ulong h_int_sync(PowerPCCPU *cpu,
     target_ulong flags = args[0];
     target_ulong lisn = args[1];
 
+    trace_spapr_xive_sync(flags, lisn);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
@@ -1757,6 +1788,8 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
     SpaprXive *xive = spapr->xive;
     target_ulong flags   = args[0];
 
+    trace_spapr_xive_reset(flags);
+
     if (!spapr_ovec_test(spapr->ov5_cas, OV5_XIVE_EXPLOIT)) {
         return H_FUNCTION;
     }
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index e8667ce5f6..acc8c3650c 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -20,6 +20,7 @@
 #include "hw/ppc/spapr_xive.h"
 #include "hw/ppc/xive.h"
 #include "kvm_ppc.h"
+#include "trace.h"
 
 #include <sys/ioctl.h>
 
@@ -163,6 +164,8 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
 
     vcpu_id = kvm_arch_vcpu_id(tctx->cs);
 
+    trace_kvm_xive_cpu_connect(vcpu_id);
+
     ret = kvm_vcpu_enable_cap(tctx->cs, KVM_CAP_PPC_IRQ_XIVE, 0, xive->fd,
                               vcpu_id, 0);
     if (ret < 0) {
@@ -308,6 +311,8 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
         return xive_esb_rw(xsrc, srcno, offset, data, 1);
     }
 
+    trace_kvm_xive_source_reset(srcno);
+
     /*
      * Special Load EOI handling for LSI sources. Q bit is never set
      * and the interrupt should be re-triggered if the level is still
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 22782b3f08..8ed397a0d5 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -203,3 +203,36 @@ heathrow_set_irq(int num, int level) "set_irq: num=0x%02x level=%d"
 # bcm2835_ic.c
 bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #%d level %d"
 bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
+
+# spapr_xive.c
+spapr_xive_claim_irq(uint32_t lisn, bool lsi) "lisn=0x%x lsi=%d"
+spapr_xive_free_irq(uint32_t lisn) "lisn=0x%x"
+spapr_xive_set_irq(uint32_t lisn, uint32_t val) "lisn=0x%x val=%d"
+spapr_xive_get_source_info(uint64_t flags, uint64_t lisn) "flags=0x%"PRIx64" lisn=0x%"PRIx64
+spapr_xive_set_source_config(uint64_t flags, uint64_t lisn, uint64_t target, uint64_t priority, uint64_t eisn) "flags=0x%"PRIx64" lisn=0x%"PRIx64" target=0x%"PRIx64" priority=0x%"PRIx64" eisn=0x%"PRIx64
+spapr_xive_get_source_config(uint64_t flags, uint64_t lisn) "flags=0x%"PRIx64" lisn=0x%"PRIx64
+spapr_xive_get_queue_info(uint64_t flags, uint64_t target, uint64_t priority) "flags=0x%"PRIx64" target=0x%"PRIx64" priority=0x%"PRIx64
+spapr_xive_set_queue_config(uint64_t flags, uint64_t target, uint64_t priority, uint64_t qpage, uint64_t qsize) "flags=0x%"PRIx64" target=0x%"PRIx64" priority=0x%"PRIx64" qpage=0x%"PRIx64" qsize=0x%"PRIx64
+spapr_xive_get_queue_config(uint64_t flags, uint64_t target, uint64_t priority) "flags=0x%"PRIx64" target=0x%"PRIx64" priority=0x%"PRIx64
+spapr_xive_set_os_reporting_line(uint64_t flags) "flags=0x%"PRIx64
+spapr_xive_get_os_reporting_line(uint64_t flags) "flags=0x%"PRIx64
+spapr_xive_esb(uint64_t flags, uint64_t lisn, uint64_t offset, uint64_t data) "flags=0x%"PRIx64" lisn=0x%"PRIx64" offset=0x%"PRIx64" data=0x%"PRIx64
+spapr_xive_sync(uint64_t flags, uint64_t lisn) "flags=0x%"PRIx64" lisn=0x%"PRIx64
+spapr_xive_reset(uint64_t flags) "flags=0x%"PRIx64
+
+# spapr_xive_kvm.c
+kvm_xive_cpu_connect(uint32_t id) "connect CPU%d to KVM device"
+kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
+
+# xive.c
+xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x ACK"
+xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x raise !"
+xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x new CPPR=0x%02x NSR=0x%02x"
+xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
+xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
+xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
+xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END 0x%02x/0x%04x data 0x%08x"
+xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
+xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
+xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
+xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 489e6256ef..fa8c3d8287 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "hw/ppc/xive.h"
 #include "hw/ppc/xive_regs.h"
+#include "trace.h"
 
 /*
  * XIVE Thread Interrupt Management context
@@ -93,6 +94,10 @@ static uint64_t xive_tctx_accept(XiveTCTX *tctx, uint8_t ring)
 
         /* Drop Exception bit */
         regs[TM_NSR] &= ~mask;
+
+        trace_xive_tctx_accept(tctx->cs->cpu_index, ring,
+                               regs[TM_IPB], regs[TM_PIPR],
+                               regs[TM_CPPR], regs[TM_NSR]);
     }
 
     return (nsr << 8) | regs[TM_CPPR];
@@ -113,12 +118,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
         default:
             g_assert_not_reached();
         }
+        trace_xive_tctx_notify(tctx->cs->cpu_index, ring,
+                               regs[TM_IPB], regs[TM_PIPR],
+                               regs[TM_CPPR], regs[TM_NSR]);
         qemu_irq_raise(xive_tctx_output(tctx, ring));
     }
 }
 
 static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
 {
+    uint8_t *regs = &tctx->regs[ring];
+
+    trace_xive_tctx_set_cppr(tctx->cs->cpu_index, ring,
+                             regs[TM_IPB], regs[TM_PIPR],
+                             cppr, regs[TM_NSR]);
+
     if (cppr > XIVE_PRIORITY_MAX) {
         cppr = 0xff;
     }
@@ -508,6 +522,8 @@ void xive_tctx_tm_write(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
 {
     const XiveTmOp *xto;
 
+    trace_xive_tctx_tm_write(offset, size, value);
+
     /*
      * TODO: check V bit in Q[0-3]W2
      */
@@ -545,6 +561,7 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
                            unsigned size)
 {
     const XiveTmOp *xto;
+    uint64_t ret;
 
     /*
      * TODO: check V bit in Q[0-3]W2
@@ -560,7 +577,8 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
                           "@%"HWADDR_PRIx"\n", offset);
             return -1;
         }
-        return xto->read_handler(xptr, tctx, offset, size);
+        ret = xto->read_handler(xptr, tctx, offset, size);
+        goto out;
     }
 
     /*
@@ -568,13 +586,17 @@ uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
      */
     xto = xive_tm_find_op(offset, size, false);
     if (xto) {
-        return xto->read_handler(xptr, tctx, offset, size);
+        ret = xto->read_handler(xptr, tctx, offset, size);
+        goto out;
     }
 
     /*
      * Finish with raw access to the register values
      */
-    return xive_tm_raw_read(tctx, offset, size);
+    ret = xive_tm_raw_read(tctx, offset, size);
+out:
+    trace_xive_tctx_tm_read(offset, size, ret);
+    return ret;
 }
 
 static char *xive_tctx_ring_print(uint8_t *ring)
@@ -1005,6 +1027,8 @@ static uint64_t xive_source_esb_read(void *opaque, hwaddr addr, unsigned size)
                       offset);
     }
 
+    trace_xive_source_esb_read(addr, srcno, ret);
+
     return ret;
 }
 
@@ -1030,6 +1054,8 @@ static void xive_source_esb_write(void *opaque, hwaddr addr,
     uint32_t srcno = addr >> xsrc->esb_shift;
     bool notify = false;
 
+    trace_xive_source_esb_write(addr, srcno, value);
+
     /* In a two pages ESB MMIO setting, trigger page only triggers */
     if (xive_source_is_trigger_page(xsrc, addr)) {
         notify = xive_source_esb_trigger(xsrc, srcno);
@@ -1507,6 +1533,7 @@ static bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
 
     /* handle CPU exception delivery */
     if (count) {
+        trace_xive_presenter_notify(nvt_blk, nvt_idx, match.ring);
         xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(priority));
     }
 
@@ -1558,6 +1585,7 @@ static void xive_router_end_notify(XiveRouter *xrtr, uint8_t end_blk,
     }
 
     if (!xive_end_is_valid(&end)) {
+        trace_xive_router_end_notify(end_blk, end_idx, end_data);
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
                       end_blk, end_idx);
         return;
@@ -1683,6 +1711,10 @@ do_escalation:
         }
     }
 
+    trace_xive_router_end_escalate(end_blk, end_idx,
+           (uint8_t) xive_get_field32(END_W4_ESC_END_BLOCK, end.w4),
+           (uint32_t) xive_get_field32(END_W4_ESC_END_INDEX, end.w4),
+           (uint32_t) xive_get_field32(END_W5_ESC_END_DATA,  end.w5));
     /*
      * The END trigger becomes an Escalation trigger
      */
@@ -1796,6 +1828,8 @@ static uint64_t xive_end_source_read(void *opaque, hwaddr addr, unsigned size)
     end_blk = xive_router_get_block_id(xsrc->xrtr);
     end_idx = addr >> (xsrc->esb_shift + 1);
 
+    trace_xive_end_source_read(end_blk, end_idx, addr);
+
     if (xive_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
                       end_idx);
-- 
2.29.2


