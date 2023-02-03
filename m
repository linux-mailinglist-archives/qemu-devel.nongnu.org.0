Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5386892A3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriD-0008WK-H1; Fri, 03 Feb 2023 03:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhs-0008LZ-1v
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007U6-6c
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/A7Hez9cWBg1VbFxSDDTDtDjQd3zcDe5tmGL9iqnOo=;
 b=Fdulrpg4K7kky772VopBU5t7GC8DlBieBWhmWDdi+I6l/s1kz6UvYgDj1sip4pDAOgC3DR
 DV0/kwbj3Kyg0nijUTVDQ7yJY5zA0hwhjmXdta3ceiBPbqiICv1m/8ZWXBzm4LLuf7Hbjp
 jZjS54B4gO+OngQYrMt/Z+p7tzmb5Ak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-O-KBiOpEN6WA0dGOty1mtw-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: O-KBiOpEN6WA0dGOty1mtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6483C1016E;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E132F140EBF6;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 06E9E21E6885; Fri,  3 Feb 2023 09:45:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 32/35] monitor: Move remaining HMP commands from misc.c to
 hmp-cmds.c
Date: Fri,  3 Feb 2023 09:45:46 +0100
Message-Id: <20230203084549.2622302-33-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This requires giving them external linkage.  Rename do_help_cmd() to
hmp_help(), and do_print() to hmp_print().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-30-armbru@redhat.com>
---
 include/monitor/hmp.h |  13 +++
 monitor/hmp-cmds.c    | 219 +++++++++++++++++++++++++++++++++++++++++-
 monitor/misc.c        | 218 -----------------------------------------
 hmp-commands.hx       |   4 +-
 4 files changed, 233 insertions(+), 221 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 941da9fde6..2220f14fc9 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -165,5 +165,18 @@ void hmp_wavcapture(Monitor *mon, const QDict *qdict);
 void hmp_trace_event(Monitor *mon, const QDict *qdict);
 void hmp_trace_file(Monitor *mon, const QDict *qdict);
 void hmp_info_trace_events(Monitor *mon, const QDict *qdict);
+void hmp_help(Monitor *mon, const QDict *qdict);
+void hmp_info_help(Monitor *mon, const QDict *qdict);
+void hmp_info_sync_profile(Monitor *mon, const QDict *qdict);
+void hmp_info_history(Monitor *mon, const QDict *qdict);
+void hmp_logfile(Monitor *mon, const QDict *qdict);
+void hmp_log(Monitor *mon, const QDict *qdict);
+void hmp_gdbserver(Monitor *mon, const QDict *qdict);
+void hmp_print(Monitor *mon, const QDict *qdict);
+void hmp_sum(Monitor *mon, const QDict *qdict);
+void hmp_ioport_read(Monitor *mon, const QDict *qdict);
+void hmp_ioport_write(Monitor *mon, const QDict *qdict);
+void hmp_boot_set(Monitor *mon, const QDict *qdict);
+void hmp_info_mtree(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8a3d56bcde..34bd8c67d7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -14,9 +14,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/address-spaces.h"
+#include "exec/gdbstub.h"
+#include "exec/ioport.h"
 #include "monitor/hmp.h"
 #include "qemu/help_option.h"
-#include "monitor/monitor.h"
+#include "monitor/monitor-internal.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
@@ -24,6 +27,8 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
 #include "hw/intc/intc.h"
+#include "qemu/log.h"
+#include "sysemu/sysemu.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err)
 {
@@ -224,3 +229,215 @@ void hmp_info_iothreads(Monitor *mon, const QDict *qdict)
 
     qapi_free_IOThreadInfoList(info_list);
 }
+
+void hmp_help(Monitor *mon, const QDict *qdict)
+{
+    hmp_help_cmd(mon, qdict_get_try_str(qdict, "name"));
+}
+
+void hmp_info_help(Monitor *mon, const QDict *qdict)
+{
+    hmp_help_cmd(mon, "info");
+}
+
+void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
+{
+    int64_t max = qdict_get_try_int(qdict, "max", 10);
+    bool mean = qdict_get_try_bool(qdict, "mean", false);
+    bool coalesce = !qdict_get_try_bool(qdict, "no_coalesce", false);
+    enum QSPSortBy sort_by;
+
+    sort_by = mean ? QSP_SORT_BY_AVG_WAIT_TIME : QSP_SORT_BY_TOTAL_WAIT_TIME;
+    qsp_report(max, sort_by, coalesce);
+}
+
+void hmp_info_history(Monitor *mon, const QDict *qdict)
+{
+    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
+    int i;
+    const char *str;
+
+    if (!hmp_mon->rs) {
+        return;
+    }
+    i = 0;
+    for(;;) {
+        str = readline_get_history(hmp_mon->rs, i);
+        if (!str) {
+            break;
+        }
+        monitor_printf(mon, "%d: '%s'\n", i, str);
+        i++;
+    }
+}
+
+void hmp_logfile(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    if (!qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err)) {
+        error_report_err(err);
+    }
+}
+
+void hmp_log(Monitor *mon, const QDict *qdict)
+{
+    int mask;
+    const char *items = qdict_get_str(qdict, "items");
+    Error *err = NULL;
+
+    if (!strcmp(items, "none")) {
+        mask = 0;
+    } else {
+        mask = qemu_str_to_log_mask(items);
+        if (!mask) {
+            hmp_help_cmd(mon, "log");
+            return;
+        }
+    }
+
+    if (!qemu_set_log(mask, &err)) {
+        error_report_err(err);
+    }
+}
+
+void hmp_gdbserver(Monitor *mon, const QDict *qdict)
+{
+    const char *device = qdict_get_try_str(qdict, "device");
+    if (!device) {
+        device = "tcp::" DEFAULT_GDBSTUB_PORT;
+    }
+
+    if (gdbserver_start(device) < 0) {
+        monitor_printf(mon, "Could not open gdbserver on device '%s'\n",
+                       device);
+    } else if (strcmp(device, "none") == 0) {
+        monitor_printf(mon, "Disabled gdbserver\n");
+    } else {
+        monitor_printf(mon, "Waiting for gdb connection on device '%s'\n",
+                       device);
+    }
+}
+
+void hmp_print(Monitor *mon, const QDict *qdict)
+{
+    int format = qdict_get_int(qdict, "format");
+    hwaddr val = qdict_get_int(qdict, "val");
+
+    switch(format) {
+    case 'o':
+        monitor_printf(mon, "%#" HWADDR_PRIo, val);
+        break;
+    case 'x':
+        monitor_printf(mon, "%#" HWADDR_PRIx, val);
+        break;
+    case 'u':
+        monitor_printf(mon, "%" HWADDR_PRIu, val);
+        break;
+    default:
+    case 'd':
+        monitor_printf(mon, "%" HWADDR_PRId, val);
+        break;
+    case 'c':
+        monitor_printc(mon, val);
+        break;
+    }
+    monitor_printf(mon, "\n");
+}
+
+void hmp_sum(Monitor *mon, const QDict *qdict)
+{
+    uint32_t addr;
+    uint16_t sum;
+    uint32_t start = qdict_get_int(qdict, "start");
+    uint32_t size = qdict_get_int(qdict, "size");
+
+    sum = 0;
+    for(addr = start; addr < (start + size); addr++) {
+        uint8_t val = address_space_ldub(&address_space_memory, addr,
+                                         MEMTXATTRS_UNSPECIFIED, NULL);
+        /* BSD sum algorithm ('sum' Unix command) */
+        sum = (sum >> 1) | (sum << 15);
+        sum += val;
+    }
+    monitor_printf(mon, "%05d\n", sum);
+}
+
+void hmp_ioport_read(Monitor *mon, const QDict *qdict)
+{
+    int size = qdict_get_int(qdict, "size");
+    int addr = qdict_get_int(qdict, "addr");
+    int has_index = qdict_haskey(qdict, "index");
+    uint32_t val;
+    int suffix;
+
+    if (has_index) {
+        int index = qdict_get_int(qdict, "index");
+        cpu_outb(addr & IOPORTS_MASK, index & 0xff);
+        addr++;
+    }
+    addr &= 0xffff;
+
+    switch(size) {
+    default:
+    case 1:
+        val = cpu_inb(addr);
+        suffix = 'b';
+        break;
+    case 2:
+        val = cpu_inw(addr);
+        suffix = 'w';
+        break;
+    case 4:
+        val = cpu_inl(addr);
+        suffix = 'l';
+        break;
+    }
+    monitor_printf(mon, "port%c[0x%04x] = 0x%0*x\n",
+                   suffix, addr, size * 2, val);
+}
+
+void hmp_ioport_write(Monitor *mon, const QDict *qdict)
+{
+    int size = qdict_get_int(qdict, "size");
+    int addr = qdict_get_int(qdict, "addr");
+    int val = qdict_get_int(qdict, "val");
+
+    addr &= IOPORTS_MASK;
+
+    switch (size) {
+    default:
+    case 1:
+        cpu_outb(addr, val);
+        break;
+    case 2:
+        cpu_outw(addr, val);
+        break;
+    case 4:
+        cpu_outl(addr, val);
+        break;
+    }
+}
+
+void hmp_boot_set(Monitor *mon, const QDict *qdict)
+{
+    Error *local_err = NULL;
+    const char *bootdevice = qdict_get_str(qdict, "bootdevice");
+
+    qemu_boot_set(bootdevice, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    } else {
+        monitor_printf(mon, "boot device list now set to %s\n", bootdevice);
+    }
+}
+
+void hmp_info_mtree(Monitor *mon, const QDict *qdict)
+{
+    bool flatview = qdict_get_try_bool(qdict, "flatview", false);
+    bool dispatch_tree = qdict_get_try_bool(qdict, "dispatch_tree", false);
+    bool owner = qdict_get_try_bool(qdict, "owner", false);
+    bool disabled = qdict_get_try_bool(qdict, "disabled", false);
+
+    mtree_info(flatview, dispatch_tree, owner, disabled);
+}
diff --git a/monitor/misc.c b/monitor/misc.c
index 6764d4f49f..52a7d7686e 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -25,17 +25,11 @@
 #include "qemu/osdep.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
-#include "exec/gdbstub.h"
 #include "net/slirp.h"
-#include "qemu/log.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/device_tree.h"
-#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
-#include "exec/address-spaces.h"
-#include "exec/ioport.h"
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
@@ -105,16 +99,6 @@ int hmp_compare_cmd(const char *name, const char *list)
     return 0;
 }
 
-static void do_help_cmd(Monitor *mon, const QDict *qdict)
-{
-    hmp_help_cmd(mon, qdict_get_try_str(qdict, "name"));
-}
-
-static void hmp_info_help(Monitor *mon, const QDict *qdict)
-{
-    hmp_help_cmd(mon, "info");
-}
-
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -135,208 +119,6 @@ static void monitor_init_qmp_commands(void)
                          QCO_ALLOW_PRECONFIG, 0);
 }
 
-static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
-{
-    int64_t max = qdict_get_try_int(qdict, "max", 10);
-    bool mean = qdict_get_try_bool(qdict, "mean", false);
-    bool coalesce = !qdict_get_try_bool(qdict, "no_coalesce", false);
-    enum QSPSortBy sort_by;
-
-    sort_by = mean ? QSP_SORT_BY_AVG_WAIT_TIME : QSP_SORT_BY_TOTAL_WAIT_TIME;
-    qsp_report(max, sort_by, coalesce);
-}
-
-static void hmp_info_history(Monitor *mon, const QDict *qdict)
-{
-    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
-    int i;
-    const char *str;
-
-    if (!hmp_mon->rs) {
-        return;
-    }
-    i = 0;
-    for(;;) {
-        str = readline_get_history(hmp_mon->rs, i);
-        if (!str) {
-            break;
-        }
-        monitor_printf(mon, "%d: '%s'\n", i, str);
-        i++;
-    }
-}
-
-static void hmp_logfile(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    if (!qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err)) {
-        error_report_err(err);
-    }
-}
-
-static void hmp_log(Monitor *mon, const QDict *qdict)
-{
-    int mask;
-    const char *items = qdict_get_str(qdict, "items");
-    Error *err = NULL;
-
-    if (!strcmp(items, "none")) {
-        mask = 0;
-    } else {
-        mask = qemu_str_to_log_mask(items);
-        if (!mask) {
-            hmp_help_cmd(mon, "log");
-            return;
-        }
-    }
-
-    if (!qemu_set_log(mask, &err)) {
-        error_report_err(err);
-    }
-}
-
-static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
-{
-    const char *device = qdict_get_try_str(qdict, "device");
-    if (!device) {
-        device = "tcp::" DEFAULT_GDBSTUB_PORT;
-    }
-
-    if (gdbserver_start(device) < 0) {
-        monitor_printf(mon, "Could not open gdbserver on device '%s'\n",
-                       device);
-    } else if (strcmp(device, "none") == 0) {
-        monitor_printf(mon, "Disabled gdbserver\n");
-    } else {
-        monitor_printf(mon, "Waiting for gdb connection on device '%s'\n",
-                       device);
-    }
-}
-
-static void do_print(Monitor *mon, const QDict *qdict)
-{
-    int format = qdict_get_int(qdict, "format");
-    hwaddr val = qdict_get_int(qdict, "val");
-
-    switch(format) {
-    case 'o':
-        monitor_printf(mon, "%#" HWADDR_PRIo, val);
-        break;
-    case 'x':
-        monitor_printf(mon, "%#" HWADDR_PRIx, val);
-        break;
-    case 'u':
-        monitor_printf(mon, "%" HWADDR_PRIu, val);
-        break;
-    default:
-    case 'd':
-        monitor_printf(mon, "%" HWADDR_PRId, val);
-        break;
-    case 'c':
-        monitor_printc(mon, val);
-        break;
-    }
-    monitor_printf(mon, "\n");
-}
-
-static void hmp_sum(Monitor *mon, const QDict *qdict)
-{
-    uint32_t addr;
-    uint16_t sum;
-    uint32_t start = qdict_get_int(qdict, "start");
-    uint32_t size = qdict_get_int(qdict, "size");
-
-    sum = 0;
-    for(addr = start; addr < (start + size); addr++) {
-        uint8_t val = address_space_ldub(&address_space_memory, addr,
-                                         MEMTXATTRS_UNSPECIFIED, NULL);
-        /* BSD sum algorithm ('sum' Unix command) */
-        sum = (sum >> 1) | (sum << 15);
-        sum += val;
-    }
-    monitor_printf(mon, "%05d\n", sum);
-}
-
-static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
-{
-    int size = qdict_get_int(qdict, "size");
-    int addr = qdict_get_int(qdict, "addr");
-    int has_index = qdict_haskey(qdict, "index");
-    uint32_t val;
-    int suffix;
-
-    if (has_index) {
-        int index = qdict_get_int(qdict, "index");
-        cpu_outb(addr & IOPORTS_MASK, index & 0xff);
-        addr++;
-    }
-    addr &= 0xffff;
-
-    switch(size) {
-    default:
-    case 1:
-        val = cpu_inb(addr);
-        suffix = 'b';
-        break;
-    case 2:
-        val = cpu_inw(addr);
-        suffix = 'w';
-        break;
-    case 4:
-        val = cpu_inl(addr);
-        suffix = 'l';
-        break;
-    }
-    monitor_printf(mon, "port%c[0x%04x] = 0x%0*x\n",
-                   suffix, addr, size * 2, val);
-}
-
-static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
-{
-    int size = qdict_get_int(qdict, "size");
-    int addr = qdict_get_int(qdict, "addr");
-    int val = qdict_get_int(qdict, "val");
-
-    addr &= IOPORTS_MASK;
-
-    switch (size) {
-    default:
-    case 1:
-        cpu_outb(addr, val);
-        break;
-    case 2:
-        cpu_outw(addr, val);
-        break;
-    case 4:
-        cpu_outl(addr, val);
-        break;
-    }
-}
-
-static void hmp_boot_set(Monitor *mon, const QDict *qdict)
-{
-    Error *local_err = NULL;
-    const char *bootdevice = qdict_get_str(qdict, "bootdevice");
-
-    qemu_boot_set(bootdevice, &local_err);
-    if (local_err) {
-        error_report_err(local_err);
-    } else {
-        monitor_printf(mon, "boot device list now set to %s\n", bootdevice);
-    }
-}
-
-static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
-{
-    bool flatview = qdict_get_try_bool(qdict, "flatview", false);
-    bool dispatch_tree = qdict_get_try_bool(qdict, "dispatch_tree", false);
-    bool owner = qdict_get_try_bool(qdict, "owner", false);
-    bool disabled = qdict_get_try_bool(qdict, "disabled", false);
-
-    mtree_info(flatview, dispatch_tree, owner, disabled);
-}
-
 /* Please update hmp-commands.hx when adding or changing commands */
 static HMPCommand hmp_info_cmds[] = {
 #include "hmp-commands-info.h"
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 673e39a697..fbb5daf09b 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -11,7 +11,7 @@ HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
         .args_type  = "name:S?",
         .params     = "[cmd]",
         .help       = "show the help",
-        .cmd        = do_help_cmd,
+        .cmd        = hmp_help,
         .flags      = "p",
     },
 
@@ -563,7 +563,7 @@ ERST
         .args_type  = "fmt:/,val:l",
         .params     = "/fmt expr",
         .help       = "print expression value (use $reg for CPU register access)",
-        .cmd        = do_print,
+        .cmd        = hmp_print,
     },
 
 SRST
-- 
2.39.0


