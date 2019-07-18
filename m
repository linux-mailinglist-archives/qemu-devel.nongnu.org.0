Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89406CE0C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 14:26:53 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho519-0000WG-D3
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1ho50L-0006E5-Qe
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ho50K-00023Z-8r
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:21 -0400
Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]:48599)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ho50K-00022W-3P
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:20 -0400
Received: from player778.ha.ovh.net (unknown [10.108.35.122])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 82A3721FF56
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:55:18 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 009B3801F403;
 Thu, 18 Jul 2019 11:55:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:54:11 +0200
Message-Id: <20190718115420.19919-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718115420.19919-1-clg@kaod.org>
References: <20190718115420.19919-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6784109892959505382
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.98.231
Subject: [Qemu-devel] [PATCH v2 08/17] ppc/xive: Improve 'info pic' support
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a better output of the XIVE END structures including the
escalation information and extend the PowerNV machine 'info pic'
command with a dump of the END EAS table used for escalations.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h      |  5 ----
 include/hw/ppc/xive_regs.h |  6 +++++
 hw/intc/pnv_xive.c         |  9 +++++++
 hw/intc/spapr_xive.c       |  1 -
 hw/intc/xive.c             | 48 +++++++++++++++++++++++++++++++++-----
 5 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 085e468ea69a..4851ff87e795 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -355,8 +355,6 @@ typedef struct XiveRouterClass {
     XiveTCTX *(*get_tctx)(XiveRouter *xrtr, CPUState *cs);
 } XiveRouterClass;
=20
-void xive_eas_pic_print_info(XiveEAS *eas, uint32_t lisn, Monitor *mon);
-
 int xive_router_get_eas(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_=
idx,
                         XiveEAS *eas);
 int xive_router_get_end(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_=
idx,
@@ -398,9 +396,6 @@ typedef struct XiveENDSource {
  */
 #define XIVE_PRIORITY_MAX  7
=20
-void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mo=
n);
-void xive_end_queue_pic_print_info(XiveEND *end, uint32_t width, Monitor=
 *mon);
-
 /*
  * XIVE Thread Interrupt Management Aera (TIMA)
  *
diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
index 69af326ebf2c..3fdf1a83b9b6 100644
--- a/include/hw/ppc/xive_regs.h
+++ b/include/hw/ppc/xive_regs.h
@@ -128,6 +128,8 @@ typedef struct XiveEAS {
 #define xive_eas_is_valid(eas)   (be64_to_cpu((eas)->w) & EAS_VALID)
 #define xive_eas_is_masked(eas)  (be64_to_cpu((eas)->w) & EAS_MASKED)
=20
+void xive_eas_pic_print_info(XiveEAS *eas, uint32_t lisn, Monitor *mon);
+
 static inline uint64_t xive_get_field64(uint64_t mask, uint64_t word)
 {
     return (be64_to_cpu(word) & mask) >> ctz64(mask);
@@ -218,6 +220,10 @@ static inline uint64_t xive_end_qaddr(XiveEND *end)
         be32_to_cpu(end->w3);
 }
=20
+void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mo=
n);
+void xive_end_queue_pic_print_info(XiveEND *end, uint32_t width, Monitor=
 *mon);
+void xive_end_eas_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor=
 *mon);
+
 /* Notification Virtual Target (NVT) */
 typedef struct XiveNVT {
         uint32_t        w0;
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 4dc92ef1e372..ff1226485983 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1593,6 +1593,15 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monito=
r *mon)
         }
         xive_end_pic_print_info(&end, i, mon);
     }
+
+    monitor_printf(mon, "XIVE[%x] END Escalation %08x .. %08x\n", blk, 0=
,
+                   nr_ends - 1);
+    for (i =3D 0; i < nr_ends; i++) {
+        if (xive_router_get_end(xrtr, blk, i, &end)) {
+            break;
+        }
+        xive_end_eas_pic_print_info(&end, i, mon);
+    }
 }
=20
 static void pnv_xive_reset(void *dev)
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 3ae311d9ff7f..ba012c7b0fdc 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -143,7 +143,6 @@ static void spapr_xive_end_pic_print_info(SpaprXive *=
xive, XiveEND *end,
                    priority, qindex, qentries, qaddr_base, qgen);
=20
     xive_end_queue_pic_print_info(end, 6, mon);
-    monitor_printf(mon, "]");
 }
=20
 void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 8ea97ac231a4..88f2e560db0f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1136,6 +1136,7 @@ void xive_end_queue_pic_print_info(XiveEND *end, ui=
nt32_t width, Monitor *mon)
                        be32_to_cpu(qdata));
         qindex =3D (qindex + 1) & (qentries - 1);
     }
+    monitor_printf(mon, "]");
 }
=20
 void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mo=
n)
@@ -1146,24 +1147,36 @@ void xive_end_pic_print_info(XiveEND *end, uint32=
_t end_idx, Monitor *mon)
     uint32_t qsize =3D xive_get_field32(END_W0_QSIZE, end->w0);
     uint32_t qentries =3D 1 << (qsize + 10);
=20
-    uint32_t nvt =3D xive_get_field32(END_W6_NVT_INDEX, end->w6);
+    uint32_t nvt_blk =3D xive_get_field32(END_W6_NVT_BLOCK, end->w6);
+    uint32_t nvt_idx =3D xive_get_field32(END_W6_NVT_INDEX, end->w6);
     uint8_t priority =3D xive_get_field32(END_W7_F0_PRIORITY, end->w7);
+    uint8_t pq;
=20
     if (!xive_end_is_valid(end)) {
         return;
     }
=20
-    monitor_printf(mon, "  %08x %c%c%c%c%c prio:%d nvt:%04x eq:@%08"PRIx=
64
-                   "% 6d/%5d ^%d", end_idx,
+    pq =3D xive_get_field32(END_W1_ESn, end->w1);
+
+    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c prio:%d nvt:%02x/%04=
x",
+                   end_idx,
+                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
+                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
                    xive_end_is_valid(end)    ? 'v' : '-',
                    xive_end_is_enqueue(end)  ? 'q' : '-',
                    xive_end_is_notify(end)   ? 'n' : '-',
                    xive_end_is_backlog(end)  ? 'b' : '-',
                    xive_end_is_escalate(end) ? 'e' : '-',
-                   priority, nvt, qaddr_base, qindex, qentries, qgen);
+                   xive_end_is_uncond_escalation(end)   ? 'u' : '-',
+                   xive_end_is_silent_escalation(end)   ? 's' : '-',
+                   priority, nvt_blk, nvt_idx);
=20
-    xive_end_queue_pic_print_info(end, 6, mon);
-    monitor_printf(mon, "]\n");
+    if (qaddr_base) {
+        monitor_printf(mon, " eq:@%08"PRIx64"% 6d/%5d ^%d",
+                       qaddr_base, qindex, qentries, qgen);
+        xive_end_queue_pic_print_info(end, 6, mon);
+    }
+    monitor_printf(mon, "\n");
 }
=20
 static void xive_end_enqueue(XiveEND *end, uint32_t data)
@@ -1191,6 +1204,29 @@ static void xive_end_enqueue(XiveEND *end, uint32_=
t data)
     end->w1 =3D xive_set_field32(END_W1_PAGE_OFF, end->w1, qindex);
 }
=20
+void xive_end_eas_pic_print_info(XiveEND *end, uint32_t end_idx,
+                                   Monitor *mon)
+{
+    XiveEAS *eas =3D (XiveEAS *) &end->w4;
+    uint8_t pq;
+
+    if (!xive_end_is_escalate(end)) {
+        return;
+    }
+
+    pq =3D xive_get_field32(END_W1_ESe, end->w1);
+
+    monitor_printf(mon, "  %08x %c%c %c%c end:%02x/%04x data:%08x\n",
+                   end_idx,
+                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
+                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
+                   xive_eas_is_valid(eas) ? 'V' : ' ',
+                   xive_eas_is_masked(eas) ? 'M' : ' ',
+                   (uint8_t)  xive_get_field64(EAS_END_BLOCK, eas->w),
+                   (uint32_t) xive_get_field64(EAS_END_INDEX, eas->w),
+                   (uint32_t) xive_get_field64(EAS_END_DATA, eas->w));
+}
+
 /*
  * XIVE Router (aka. Virtualization Controller or IVRE)
  */
--=20
2.21.0


