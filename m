Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF22486F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyeL-0001IG-Sb
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:53:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHx-0006Wq-Gb
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHu-0008Me-TU
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48293 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHu-0008Jw-8c; Tue, 21 May 2019 02:30:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpl2Pg6z9sPb; Tue, 21 May 2019 16:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420175;
	bh=ohV9WV8ZSAR+x3akRFqW+oT6jNQt5nM2BD8xfGbgabw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMWxNY+dCmqS5OwiNqNCHZXwLW77xsrV9UHEm6HhT4/oiscJ4zI2ad8tcYRmns9pX
	LrswyGaV5dz0+a/2Hk4i/RuCQP4wtNWr+Su0a23vFUt373E1XuMGZbVnG9zm+qDdMs
	kyN9L/05iz/sbKVy3Apqy5rHdINu1YZCNvytWxeY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:29:14 +1000
Message-Id: <20190521062924.6930-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 28/38] spapr/xive: add state synchronization
 with KVM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, gkurz@kaod.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

This extends the KVM XIVE device backend with 'synchronize_state'
methods used to retrieve the state from KVM. The HW state of the
sources, the KVM device and the thread interrupt contexts are
collected for the monitor usage and also migration.

These get operations rely on their KVM counterpart in the host kernel
which acts as a proxy for OPAL, the host firmware. The set operations
will be added for migration support later.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190513084245.25755-5-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c        | 17 ++++---
 hw/intc/spapr_xive_kvm.c    | 90 +++++++++++++++++++++++++++++++++++++
 hw/intc/xive.c              | 10 +++++
 include/hw/ppc/spapr_xive.h |  8 ++++
 include/hw/ppc/xive.h       |  1 +
 5 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 03f92c3e65..e771db5fd0 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -40,13 +40,6 @@
=20
 #define SPAPR_XIVE_NVT_BASE 0x400
=20
-/*
- * The sPAPR machine has a unique XIVE IC device. Assign a fixed value
- * to the controller block id value. It can nevertheless be changed
- * for testing purpose.
- */
-#define SPAPR_XIVE_BLOCK_ID 0x0
-
 /*
  * sPAPR NVT and END indexing helpers
  */
@@ -157,6 +150,16 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Moni=
tor *mon)
     XiveSource *xsrc =3D &xive->source;
     int i;
=20
+    if (kvm_irqchip_in_kernel()) {
+        Error *local_err =3D NULL;
+
+        kvmppc_xive_synchronize_state(xive, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+    }
+
     monitor_printf(mon, "  LISN         PQ    EISN     CPU/PRIO EQ\n");
=20
     for (i =3D 0; i < xive->nr_irqs; i++) {
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 964bad0c23..8dd4f96e0b 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -60,6 +60,54 @@ static void kvm_cpu_enable(CPUState *cs)
 /*
  * XIVE Thread Interrupt Management context (KVM)
  */
+static void kvmppc_xive_cpu_get_state(XiveTCTX *tctx, Error **errp)
+{
+    uint64_t state[2] =3D { 0 };
+    int ret;
+
+    ret =3D kvm_get_one_reg(tctx->cs, KVM_REG_PPC_VP_STATE, state);
+    if (ret !=3D 0) {
+        error_setg_errno(errp, errno,
+                         "XIVE: could not capture KVM state of CPU %ld",
+                         kvm_arch_vcpu_id(tctx->cs));
+        return;
+    }
+
+    /* word0 and word1 of the OS ring. */
+    *((uint64_t *) &tctx->regs[TM_QW1_OS]) =3D state[0];
+}
+
+typedef struct {
+    XiveTCTX *tctx;
+    Error *err;
+} XiveCpuGetState;
+
+static void kvmppc_xive_cpu_do_synchronize_state(CPUState *cpu,
+                                                 run_on_cpu_data arg)
+{
+    XiveCpuGetState *s =3D arg.host_ptr;
+
+    kvmppc_xive_cpu_get_state(s->tctx, &s->err);
+}
+
+void kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, Error **errp)
+{
+    XiveCpuGetState s =3D {
+        .tctx =3D tctx,
+        .err =3D NULL,
+    };
+
+    /*
+     * Kick the vCPU to make sure they are available for the KVM ioctl.
+     */
+    run_on_cpu(tctx->cs, kvmppc_xive_cpu_do_synchronize_state,
+               RUN_ON_CPU_HOST_PTR(&s));
+
+    if (s.err) {
+        error_propagate(errp, s.err);
+        return;
+    }
+}
=20
 void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
 {
@@ -227,6 +275,19 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int sr=
cno, uint32_t offset,
     }
 }
=20
+static void kvmppc_xive_source_get_state(XiveSource *xsrc)
+{
+    int i;
+
+    for (i =3D 0; i < xsrc->nr_irqs; i++) {
+        /* Perform a load without side effect to retrieve the PQ bits */
+        uint8_t pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
+
+        /* and save PQ locally */
+        xive_source_esb_set(xsrc, i, pq);
+    }
+}
+
 void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
 {
     XiveSource *xsrc =3D opaque;
@@ -353,6 +414,35 @@ void kvmppc_xive_reset(SpaprXive *xive, Error **errp=
)
                       NULL, true, errp);
 }
=20
+static void kvmppc_xive_get_queues(SpaprXive *xive, Error **errp)
+{
+    Error *local_err =3D NULL;
+    int i;
+
+    for (i =3D 0; i < xive->nr_ends; i++) {
+        if (!xive_end_is_valid(&xive->endt[i])) {
+            continue;
+        }
+
+        kvmppc_xive_get_queue_config(xive, SPAPR_XIVE_BLOCK_ID, i,
+                                     &xive->endt[i], &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+}
+
+void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
+{
+    kvmppc_xive_source_get_state(&xive->source);
+
+    /* EAT: there is no extra state to query from KVM */
+
+    /* ENDT */
+    kvmppc_xive_get_queues(xive, errp);
+}
+
 static void *kvmppc_xive_mmap(SpaprXive *xive, int pgoff, size_t len,
                               Error **errp)
 {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 78047adb11..7f1c54a7b5 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -493,6 +493,16 @@ void xive_tctx_pic_print_info(XiveTCTX *tctx, Monito=
r *mon)
     int cpu_index =3D tctx->cs ? tctx->cs->cpu_index : -1;
     int i;
=20
+    if (kvm_irqchip_in_kernel()) {
+        Error *local_err =3D NULL;
+
+        kvmppc_xive_cpu_synchronize_state(tctx, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+    }
+
     monitor_printf(mon, "CPU[%04x]:   QW   NSR CPPR IPB LSMFB ACK# INC A=
GE PIPR"
                    "  W2\n", cpu_index);
=20
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 03685910e7..7e49badd8c 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -44,6 +44,13 @@ typedef struct SpaprXive {
     void          *tm_mmap;
 } SpaprXive;
=20
+/*
+ * The sPAPR machine has a unique XIVE IC device. Assign a fixed value
+ * to the controller block id value. It can nevertheless be changed
+ * for testing purpose.
+ */
+#define SPAPR_XIVE_BLOCK_ID 0x0
+
 bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi);
 bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn);
 void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
@@ -74,5 +81,6 @@ void kvmppc_xive_set_queue_config(SpaprXive *xive, uint=
8_t end_blk,
 void kvmppc_xive_get_queue_config(SpaprXive *xive, uint8_t end_blk,
                                  uint32_t end_idx, XiveEND *end,
                                  Error **errp);
+void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp);
=20
 #endif /* PPC_SPAPR_XIVE_H */
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index dd115da30e..78c919c4a5 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -435,5 +435,6 @@ void kvmppc_xive_source_reset_one(XiveSource *xsrc, i=
nt srcno, Error **errp);
 void kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp);
 void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val);
 void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp);
+void kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, Error **errp);
=20
 #endif /* PPC_XIVE_H */
--=20
2.21.0


