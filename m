Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4225F44F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:58:46 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiRa-00031t-2W
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq5-0001JB-3a
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq2-0001qh-5x
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a3so9023416wrt.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aKeHgRFwv3oSjMfFr7eWFeJbuWz2pkBpX1773QJGL+I=;
 b=XRV8QPNwZuFpcGAnIOFZ93pT4wd6nfGzbsdc5Z28wSsWyQrL3tE9wz2gZjpG1k4Tv2
 g8YN6lQHSJIAKyZp/fQVww8oc80YX4xbVfiJMvUk+Jlt+BdjBk+WCboOOYsCpqH4P1VT
 z662dYmdBdy2mK95XgbzQTx/JPvxfUfYeKlaj7z4SLbO4KuD1u/U1/DtRekvc0cjRQRt
 RAJGkT0Rellmbfeh0azpRKBb0BpMNef/Wf2/0wTD78/FHSuQot9ISceYJ2P29nlqUiOB
 A0dOoMjPLTTdT/dEFUmdKjBNpTBqhra8lpf3JDeP7KlrxoDfZbW7EZaKnbtz6dYKvD51
 rO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aKeHgRFwv3oSjMfFr7eWFeJbuWz2pkBpX1773QJGL+I=;
 b=6kjvfV7ayhfH+OagQno5XF/LC/51rZ7cUX7FKzuGFvJsmWIR4kShCKFJ1chq8PpBEi
 9szaoQOkKeMeqtEyfaOq+70Lq4JRNWGPuBJieFoV8127/03lkPh5vjaelZMfX06QjYF8
 eH6ZVz6GzqLzCGTXOF+jyWXkHPQYgAJo0/Q/ZfEPkHos7NROLVvKxE//EYbzwabt6pMM
 1n0Riav147W7gJiamCTOLld36uX3hx8EByIsX1TcMoHgXV64r81UD7p95+5rRWHf0MGq
 2ig0x3igHWw6w0NohRmKzIISGwe+maKoxA3dasBerb8OB8zBny7oR7NKXuwGmO3tBZOj
 T9Mg==
X-Gm-Message-State: ACrzQf1sShK7AKW42ErgfF5PTrL3/1+jq7ZGwHkHRcxuKgum0Yj1Go1a
 O3E3wk2mlTLEDtAYrS7u+kUD9A==
X-Google-Smtp-Source: AMsMyM7tJ6wc93+6FaOukFhQ3EFlebQIUTMrmD7YiWuLuCqbwlEOFaNDnd/GRPqiQMVts8mAzDVYzg==
X-Received: by 2002:a5d:62d2:0:b0:22e:4a7:1ab6 with SMTP id
 o18-20020a5d62d2000000b0022e04a71ab6mr11684750wrv.334.1664889594626; 
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003b4931eb435sm21382589wmq.26.2022.10.04.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07D661FFD4;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-ppc@nongnu.org (open list:New World (mac99))
Subject: [PULL 32/54] monitor: expose monitor_puts to rest of code
Date: Tue,  4 Oct 2022 14:01:16 +0100
Message-Id: <20221004130138.2299307-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-Id: <20220929114231.583801-33-alex.bennee@linaro.org>

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


