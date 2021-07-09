Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487ED3C21D4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:51:08 +0200 (CEST)
Received: from localhost ([::1]:44588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1nA3-0003Wg-4a
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m1n8y-0002LQ-DO
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:50:00 -0400
Received: from dedi548.your-server.de ([85.10.215.148]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m1n8v-0007Fs-Oy
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:49:59 -0400
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by dedi548.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m1n8r-0000v0-2V
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:49:53 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m1n8q-000765-WE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:49:53 +0200
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id AA0672A1610
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 11:49:52 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uRxtq7iVSnMl for <qemu-devel@nongnu.org>;
 Fri,  9 Jul 2021 11:49:52 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 57A542A165B
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 11:49:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eGX1fTAgOm1E for <qemu-devel@nongnu.org>;
 Fri,  9 Jul 2021 11:49:52 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 37F712A1610
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 11:49:52 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
Date: Fri,  9 Jul 2021 11:49:48 +0200
Message-Id: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldinet.de
X-Virus-Scanned: Clear (ClamAV 0.103.2/26225/Thu Jul  8 13:06:32 2021)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the GICv3 specification register GICD_ISPENDR0 is Banked for=
 each
connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is the =
case
since GIC_NCPU =3D=3D 8.

For SPI, make the interrupt pending on all CPUs and not just the processo=
r
targets of the interrupt.

This behaviour is at least present on the i.MX7D which uses an Cortex-A7M=
PCore.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/intc/arm_gic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a994b1f024..8e377bac59 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1294,12 +1294,14 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
=20
         for (i =3D 0; i < 8; i++) {
             if (value & (1 << i)) {
+                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
+
                 if (s->security_extn && !attrs.secure &&
                     !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ =
*/
                 }
=20
-                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
+                GIC_DIST_SET_PENDING(irq + i, cm);
             }
         }
     } else if (offset < 0x300) {
@@ -1317,11 +1319,10 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
-            /* ??? This currently clears the pending bit for all CPUs, e=
ven
-               for per-CPU interrupts.  It's unclear whether this is the
-               corect behavior.  */
             if (value & (1 << i)) {
-                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
+                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
+
+                GIC_DIST_CLEAR_PENDING(irq + i, cm);
             }
         }
     } else if (offset < 0x380) {
--=20
2.26.2


