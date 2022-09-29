Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539A65EF6F0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:53:15 +0200 (CEST)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtyU-0003Fb-5N
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCx-0007Qx-RD
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCs-0004MK-NB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso3077856wmq.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7WPSIzCpU739utGIxIW8d/QKBIKYSf+S3FUKe5DP39M=;
 b=ICUUs6O0F4723C0e56t7Ti87SDrbHedabOP/kSuzG4i0ZkWT+PFqLnk6oReYZAI8+S
 bkcaeB06nEmP5RhU5Pf8htBKns4q0xEdZXjGW8KOvdJMUANQ+mlAiWe7pSCYLVCYT9UK
 oqIUx37iBlvPPrMjQX2eBYiDcQKh7o4k0WpKULQXaG3qoJhFleBpHjjejlMUqojCclIz
 jKyqDhOjJlT8d+b6yOhu/COHihQWGkbF9V7JMkefMFuk4+tghkyfYyriyXagiznc7So8
 8omD5BxDWJJ/iPqD1bXthDARPEKZlflXSw+KbDypsaA0Sqxkd0xkwwcDKvyi67pPBnKw
 jazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7WPSIzCpU739utGIxIW8d/QKBIKYSf+S3FUKe5DP39M=;
 b=ZcbkxTfpJln0IgapHQQYDVgq39kAga9NpDdZQlg+zWyj91OmcYdCP3uZdIG9JQZRbH
 boofyB7eK32MFqI/r8c+5kyd+z83RMWprLl7MYNaoqpn9R149s/+PU/KXqHC8w3wZwXz
 xq5rsEWeh+ibivfs0LuVKOHMcQFQTnYJOkj9fV4+Yjrm/hgoZOGLstGNtru0rcQsbmp8
 Q1zyTtrEmsLT4ukyAsWdyDZZPzpXz7K7EpiQH2nJZMun1O01/9NXMTmN8c4kcS4iH3iW
 VyCBeLzUW12KnfO10Wr11HdheG/nm1lUFw0Ug6nCP4zHz5Ne7PPnXOehYuY/H4+Zy8Wf
 SnHw==
X-Gm-Message-State: ACrzQf0SlRo+/vIy7r0kJg3iI1q01Cofzd+P5Erfdl9jjAHv6EnmrznK
 GvbZfh8HbfxltMdFDeg6HLrhNA==
X-Google-Smtp-Source: AMsMyM6aZ4blWrY3DnRejno23ki21f0syTc5Mwcyg6CqpGNt9x98DBr5yZkiveuSAwp+fmmv03OvOw==
X-Received: by 2002:a05:600c:2d05:b0:3b4:7788:9944 with SMTP id
 x5-20020a05600c2d0500b003b477889944mr10580826wmf.57.1664452793992; 
 Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w11-20020adfd4cb000000b0022cd27bc8c1sm1918290wrk.9.2022.09.29.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 001C61FFD3;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-ppc@nongnu.org (open list:New World (mac99))
Subject: [PATCH  v1 32/51] monitor: expose monitor_puts to rest of code
Date: Thu, 29 Sep 2022 12:42:12 +0100
Message-Id: <20220929114231.583801-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220921160801.1490125-2-alex.bennee@linaro.org>
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


