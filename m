Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2849ED02
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:03:21 +0100 (CET)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBvM-0008U9-EM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBn2-0008KR-G0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:44 -0500
Received: from [2001:41c9:1:41f::167] (port=36844
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBn0-0004xA-Rj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:44 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmV-000BHM-Lc; Thu, 27 Jan 2022 20:54:15 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:54:02 +0000
Message-Id: <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This displays detailed information about the device registers and timers to aid
debugging problems with timers and interrupts.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hmp-commands-info.hx | 12 ++++++
 hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e90f20a107..4e714e79a2 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -879,3 +879,15 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name       = "via",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show guest 6522 VIA devices",
+    },
+
+SRST
+  ``info via``
+    Show guest 6522 VIA devices.
+ERST
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index aaae195d63..cfa6a9c44b 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -30,6 +30,8 @@
 #include "hw/misc/mos6522.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
+#include "qapi/type-helpers.h"
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
@@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     }
 }
 
+static int qmp_x_query_via_foreach(Object *obj, void *opaque)
+{
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_MOS6522)) {
+        MOS6522State *s = MOS6522(obj);
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        uint16_t t1counter = get_counter(s, &s->timers[0]);
+        uint16_t t2counter = get_counter(s, &s->timers[1]);
+
+        g_string_append_printf(buf, "%s:\n", object_get_typename(obj));
+
+        g_string_append_printf(buf, "  Registers:\n");
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[0], s->b);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[1], s->a);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[2], s->dirb);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[3], s->dira);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[4], t1counter & 0xff);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[5], t1counter >> 8);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[6],
+                               s->timers[0].latch & 0xff);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[7],
+                               s->timers[0].latch >> 8);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[8], t2counter & 0xff);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[9], t2counter >> 8);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[10], s->sr);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[11], s->acr);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[12], s->pcr);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[13], s->ifr);
+        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
+                               mos6522_reg_names[14], s->ier);
+
+        g_string_append_printf(buf, "  Timers:\n");
+        g_string_append_printf(buf, "    Using current time now(ns)=%"PRId64
+                                    "\n", now);
+        g_string_append_printf(buf, "    T1 freq(hz)=%"PRId64
+                               " mode=%s"
+                               " counter=0x%x"
+                               " latch=0x%x\n"
+                               "       load_time(ns)=%"PRId64
+                               " next_irq_time(ns)=%"PRId64 "\n",
+                               s->timers[0].frequency,
+                               ((s->acr & T1MODE) == T1MODE_CONT) ? "continuous"
+                                                                  : "one-shot",
+                               t1counter,
+                               s->timers[0].latch,
+                               s->timers[0].load_time,
+                               get_next_irq_time(s, &s->timers[0], now));
+        g_string_append_printf(buf, "    T2 freq(hz)=%"PRId64
+                               " mode=%s"
+                               " counter=0x%x"
+                               " latch=0x%x\n"
+                               "       load_time(ns)=%"PRId64
+                               " next_irq_time(ns)=%"PRId64 "\n",
+                               s->timers[1].frequency,
+                               "one-shot",
+                               t2counter,
+                               s->timers[1].latch,
+                               s->timers[1].load_time,
+                               get_next_irq_time(s, &s->timers[1], now));
+    }
+
+    return 0;
+}
+
+static HumanReadableText *qmp_x_query_via(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_via_foreach, buf);
+
+    return human_readable_text_from_str(buf);
+}
+
 static const MemoryRegionOps mos6522_ops = {
     .read = mos6522_read,
     .write = mos6522_write,
@@ -547,6 +638,7 @@ static const TypeInfo mos6522_type_info = {
 static void mos6522_register_types(void)
 {
     type_register_static(&mos6522_type_info);
+    monitor_register_hmp_info_hrt("via", qmp_x_query_via);
 }
 
 type_init(mos6522_register_types)
-- 
2.20.1


