Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9B5C03DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:15:57 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2OC-0007qA-Op
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gf-0003CN-4M
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gc-0000bz-Td
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h130-20020a1c2188000000b003b4cadadce7so8115336wmh.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kZCyr3Lyk7RSQMb91zeKViaNh3D4Z14FgGZeAQDXqfA=;
 b=nFovbVLeQ0CpUgz3+0ZZmlctw68fEUENHUHoV2c7/XVCS9EX2Y2mnkoYN650CgtPuM
 3aeYxDlaBZFEMkRfdRerP7avReFugQ1mE9J5+xhimBAEJvFRH6na6gGVSqhSoq5sdl11
 L1/tVid2jDEuhiMGq3Gj1l6vqitPxOEcJCOiJE1zG4u3e2SdU5GnHYH+sV6+rRmXQ9f1
 Tj04x0fTHhS8foMhDri8ioEkQHh6L0CQfM1RpatGX9plCKDEc5jrdDMc1Rt7LwpfbxB4
 l/XpXCW0//k6/Q0PavPmZRbLaoFbtcfGKXPgvYhORYMm62JQ5MqX/RMzxePgrNXiRAvu
 8Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kZCyr3Lyk7RSQMb91zeKViaNh3D4Z14FgGZeAQDXqfA=;
 b=XLwZpqus2aRfJDRzTRO/Ahj6g1yNk3fYZaKnL6LXvPV5QivAKNWARNdFXUIFAw3GQX
 5gOnzXVbft0Gnoxz9kXAq5ik22xTadLZK70Tx99yj50mZM4p24JWdXF2n+Y+rNgJhx9W
 0khWP6lDaNWHt3PV0vG8stuyi1zHm3sCNGtG6nZC3syj20BS+rN9BBA7Mimjj3X/CZk4
 Dya+v37g7hQY4kRa24k7MCQjRZUjdWnxiKQr1ANAkti2bC8M2Hq++19DGn+s4CjtbV9b
 sVB54n70Y1dypAfKIx09pzIfxpjRghkyFKMJEunuCDrPN05kXMYLizLN4WEGVoA2GKoB
 pzIQ==
X-Gm-Message-State: ACrzQf0WOV8uptzqv4ZDvfFe7b6RvNCeO2qZsVx6C3+v7E/HpduoeBLp
 uGOSAeyA+8U1wTqcRMk1C2c7YA==
X-Google-Smtp-Source: AMsMyM4vzZ+SfF47/uFBVqJdWUEiBqsQ3CeiMdgq92cF7ku4aW6ZWioVNtxWWwl7F2ZXJLk/jhHUyA==
X-Received: by 2002:a7b:c8d5:0:b0:3b4:76bc:5dae with SMTP id
 f21-20020a7bc8d5000000b003b476bc5daemr6514563wml.122.1663776483266; 
 Wed, 21 Sep 2022 09:08:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003a5f3f5883dsm3367007wmo.17.2022.09.21.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 421BA1FFB8;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-ppc@nongnu.org (open list:New World (mac99))
Subject: [PATCH  v1 01/10] monitor: expose monitor_puts to rest of code
Date: Wed, 21 Sep 2022 17:07:52 +0100
Message-Id: <20220921160801.1490125-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This helps us construct strings elsewhere before echoing to the
monitor. It avoids having to jump through hoops like:

  monitor_printf(mon, "%s", s->str);

It will be useful in following patches but for now convert all
existing plain "%s" printfs to use the _puts api.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - s/monitor_printf(mon, "%s"/monitor_puts(mon, /
---
 docs/devel/writing-monitor-commands.rst |  2 +-
 include/monitor/monitor.h               |  1 +
 monitor/monitor-internal.h              |  1 -
 block/monitor/block-hmp-cmds.c          | 10 +++++-----
 hw/misc/mos6522.c                       |  2 +-
 monitor/hmp-cmds.c                      |  8 ++++----
 monitor/hmp.c                           |  2 +-
 target/i386/helper.c                    |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 4aa2bb904d..2fefedcd98 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -716,7 +716,7 @@ message. Here's the implementation of the "info roms" HMP command::
      if (hmp_handle_error(mon, err)) {
          return;
      }
-     monitor_printf(mon, "%s", info->human_readable_text);
+     monitor_puts(mon, info->human_readable_text);
  }
 
 Also, you have to add the function's prototype to the hmp.h file.
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index a4b40e8391..737e750670 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -31,6 +31,7 @@ void monitor_resume(Monitor *mon);
 int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp);
 int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp);
 
+int monitor_puts(Monitor *mon, const char *str);
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
     G_GNUC_PRINTF(2, 0);
 int monitor_printf(Monitor *mon, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index caa2e90ef2..a2cdbbf646 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -174,7 +174,6 @@ extern int mon_refcount;
 
 extern HMPCommand hmp_cmds[];
 
-int monitor_puts(Monitor *mon, const char *str);
 void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
                        bool use_io_thread);
 void monitor_data_destroy(Monitor *mon);
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index bfb3c043a0..939a520d17 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -638,16 +638,16 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
     assert(!info || !info->has_inserted || info->inserted == inserted);
 
     if (info && *info->device) {
-        monitor_printf(mon, "%s", info->device);
+        monitor_puts(mon, info->device);
         if (inserted && inserted->has_node_name) {
             monitor_printf(mon, " (%s)", inserted->node_name);
         }
     } else {
         assert(info || inserted);
-        monitor_printf(mon, "%s",
-                       inserted && inserted->has_node_name ? inserted->node_name
-                       : info && info->has_qdev ? info->qdev
-                       : "<anonymous>");
+        monitor_puts(mon,
+                     inserted && inserted->has_node_name ? inserted->node_name
+                     : info && info->has_qdev ? info->qdev
+                     : "<anonymous>");
     }
 
     if (inserted) {
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index f9e646350e..fe38c44426 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -595,7 +595,7 @@ void hmp_info_via(Monitor *mon, const QDict *qdict)
     if (hmp_handle_error(mon, err)) {
         return;
     }
-    monitor_printf(mon, "%s", info->human_readable_text);
+    monitor_puts(mon, info->human_readable_text);
 }
 
 static const MemoryRegionOps mos6522_ops = {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f91dd..f90eea8d01 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -730,7 +730,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
     monitor_printf(mon, "    ");
 
     if (dev->class_info->has_desc) {
-        monitor_printf(mon, "%s", dev->class_info->desc);
+        monitor_puts(mon, dev->class_info->desc);
     } else {
         monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
     }
@@ -2258,12 +2258,12 @@ static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
     if (unit && value->base == 10 &&
         value->exponent >= -18 && value->exponent <= 18 &&
         value->exponent % 3 == 0) {
-        monitor_printf(mon, "%s", si_prefix(value->exponent));
+        monitor_puts(mon, si_prefix(value->exponent));
     } else if (unit && value->base == 2 &&
                value->exponent >= 0 && value->exponent <= 60 &&
                value->exponent % 10 == 0) {
 
-        monitor_printf(mon, "%s", iec_binary_prefix(value->exponent));
+        monitor_puts(mon, iec_binary_prefix(value->exponent));
     } else if (value->exponent) {
         /* Use exponential notation and write the unit's English name */
         monitor_printf(mon, "* %d^%d%s",
@@ -2273,7 +2273,7 @@ static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
     }
 
     if (value->has_unit) {
-        monitor_printf(mon, "%s", unit ? unit : StatsUnit_str(value->unit));
+        monitor_puts(mon, unit ? unit : StatsUnit_str(value->unit));
     }
 
     /* Print bucket size for linear histograms */
diff --git a/monitor/hmp.c b/monitor/hmp.c
index a3375d0341..43fd69f984 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1094,7 +1094,7 @@ static void hmp_info_human_readable_text(Monitor *mon,
         return;
     }
 
-    monitor_printf(mon, "%s", info->human_readable_text);
+    monitor_puts(mon, info->human_readable_text);
 }
 
 static void handle_hmp_command_exec(Monitor *mon,
diff --git a/target/i386/helper.c b/target/i386/helper.c
index fa409e9c44..b954ccda50 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -415,7 +415,7 @@ static void do_inject_x86_mce(CPUState *cs, run_on_cpu_data data)
         if (need_reset) {
             emit_guest_memory_failure(MEMORY_FAILURE_ACTION_RESET, ar,
                                       recursive);
-            monitor_printf(params->mon, "%s", msg);
+            monitor_puts(params->mon, msg);
             qemu_log_mask(CPU_LOG_RESET, "%s\n", msg);
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             return;
-- 
2.34.1


