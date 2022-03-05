Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04B4CE586
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 16:18:43 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQWB8-0001AK-DW
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 10:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW3M-0001Ws-2D
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:10:41 -0500
Received: from [2001:41c9:1:41f::167] (port=59136
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW3K-0006vQ-2S
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:10:39 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW2e-0008Q9-Kh; Sat, 05 Mar 2022 15:10:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 15:09:53 +0000
Message-Id: <20220305150957.5053-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305150957.5053-1-mark.cave-ayland@ilande.co.uk>
References: <20220305150957.5053-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v4 08/12] mos6522: add "info via" HMP command for debugging
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

This displays detailed information about the device registers and timers to aid
debugging problems with timers and interrupts.

Currently the QAPI generators for HumanReadableText don't work correctly if
used in qapi/target-misc.json when a non-specified target is built, so for
now manually add a hmp_info_via() wrapper until direct support for per-device
HMP/QMP commands is implemented.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hmp-commands-info.hx         |  15 +++++
 hw/misc/mos6522.c            | 103 +++++++++++++++++++++++++++++++++++
 include/hw/misc/mos6522.h    |   2 +
 include/monitor/hmp-target.h |   1 +
 4 files changed, 121 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e90f20a107..adfa085a9b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -879,3 +879,18 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+#if defined(TARGET_M68K) || defined(TARGET_PPC)
+    {
+        .name         = "via",
+        .args_type    = "",
+        .params       = "",
+        .help         = "show guest mos6522 VIA devices",
+        .cmd          = hmp_info_via,
+    },
+#endif
+
+SRST
+  ``info via``
+    Show guest mos6522 VIA devices.
+ERST
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 9c8d4ca6ad..2c20decca1 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -30,6 +30,9 @@
 #include "hw/misc/mos6522.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
+#include "qapi/type-helpers.h"
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
@@ -415,6 +418,106 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
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
+void hmp_info_via(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_via(&err);
+
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+    monitor_printf(mon, "%s", info->human_readable_text);
+}
+
 static const MemoryRegionOps mos6522_ops = {
     .read = mos6522_read,
     .write = mos6522_write,
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index bbaec4ede2..193a3dc870 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -157,4 +157,6 @@ extern const VMStateDescription vmstate_mos6522;
 uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size);
 void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size);
 
+void hmp_info_via(Monitor *mon, const QDict *qdict);
+
 #endif /* MOS6522_H */
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index ffdc15a34b..1891a19b21 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -50,5 +50,6 @@ void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_sgx(Monitor *mon, const QDict *qdict);
+void hmp_info_via(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
-- 
2.20.1


