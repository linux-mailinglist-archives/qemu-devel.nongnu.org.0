Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26004CE53A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:19:20 +0100 (CET)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVFf-0000zQ-Nq
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV88-0000Hg-U0
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:32 -0500
Received: from [2001:41c9:1:41f::167] (port=58960
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV87-00072k-H0
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:32 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7V-00082l-Sn; Sat, 05 Mar 2022 14:10:54 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 14:10:42 +0000
Message-Id: <20220305141044.31911-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 10/12] mac_via: make SCSI_DATA (DRQ) bit live rather than
 latched
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The VIA2 on the Q800 machine is not a separate chip as in older Macs but instead
is integrated into the on-board logic. From analysing the SCSI routines in the
MacOS toolbox ROM (and to a lesser extent NetBSD and Linux) the expectation seems
to be that the SCSI_DATA (DRQ) bit is live on the Q800 and not latched.

Fortunately we can use the recently introduced mos6522 last_irq_levels variable
which tracks the edge-triggered state to return the SCSI_DATA (DRQ) bit live to
the guest OS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 3f473c3fcf..d8b35e6ca6 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -906,9 +906,24 @@ static uint64_t mos6522_q800_via2_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA2State *s = MOS6522_Q800_VIA2(opaque);
     MOS6522State *ms = MOS6522(s);
+    uint64_t val;
 
     addr = (addr >> 9) & 0xf;
-    return mos6522_read(ms, addr, size);
+    val = mos6522_read(ms, addr, size);
+
+    switch (addr) {
+    case VIA_REG_IFR:
+        /*
+         * On a Q800 an emulated VIA2 is integrated into the onboard logic. The
+         * expectation of most OSs is that the DRQ bit is live, rather than
+         * latched as it would be on a real VIA so do the same here.
+         */
+        val &= ~VIA2_IRQ_SCSI_DATA;
+        val |= (ms->last_irq_levels & VIA2_IRQ_SCSI_DATA);
+        break;
+    }
+
+    return val;
 }
 
 static void mos6522_q800_via2_write(void *opaque, hwaddr addr, uint64_t val,
-- 
2.20.1


