Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3B16B218
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:22:00 +0100 (CET)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6LAt-0006cG-TE
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1j6Kmv-0008Dz-Fr
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1j6Kms-00041K-Hz
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:13 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1j6Kms-0003oz-7n
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:10 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKrs80164249;
 Mon, 24 Feb 2020 20:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=8H10FXJhajIDjcK+6FBBgZ/mlXMF4X+tNvJ1RJ7ZXbU=;
 b=Fq2d18Lk8moitLrA57DApmYBF260W37oj5RwSu1PLRK4hacaX807ynMVlbc6qbAwZYmQ
 ZB2xDg57WohI3K8yuF4/71UhNhffcRWhMJQGCH0/MzrEn+pI3uqRA/yiTzFMkA3H3db8
 fjjw/0M4rlEfnQt2P1bHDqQS1vhnGZCQ8ddMTqYhxDr9afh4q6JYeWeOf/sK5zT9NmUl
 KcEAntoj2/N9a5G/FNVbpsVF7OLjRdC0I3VFvwLhcxHpTHBd+iIOb1vrosBdFpiEpOnL
 CKjQF1KifEEuya8tD96Ai8fwUT6GQ/l+WLhwdbcAjnDMci5L1msDt4gYBDcggE12tjVd xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2ybvr4p97m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:56:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKurXs073518;
 Mon, 24 Feb 2020 20:56:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ybduv6dj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:56:52 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OKuqfj028737;
 Mon, 24 Feb 2020 20:56:52 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Feb 2020 12:56:52 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/50] multi-process/mon: enable QMP module support in the
 remote process
Date: Mon, 24 Feb 2020 15:55:27 -0500
Message-Id: <0de0baf0df7df660c67573d4d355543d00f23f07.1582576372.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=1
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240154
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=1 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240153
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build system changes to enable QMP module in the remote process

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 Makefile.objs              |  9 +++++
 Makefile.target            | 35 +++++++++++++++++--
 hmp-commands.hx            |  5 +--
 hw/core/Makefile.objs      |  1 +
 monitor/Makefile.objs      |  4 +++
 monitor/misc.c             | 84 +++++++++++++++++++++++++---------------------
 monitor/monitor-internal.h | 38 +++++++++++++++++++++
 qapi/Makefile.objs         |  2 ++
 qom/Makefile.objs          |  1 +
 ui/Makefile.objs           |  2 ++
 10 files changed, 139 insertions(+), 42 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 689a722..4b5db09 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -32,6 +32,7 @@ remote-pci-obj-$(CONFIG_MPQEMU) += migration/
 remote-pci-obj-$(CONFIG_MPQEMU) += remote/
 remote-pci-obj-$(CONFIG_MPQEMU) += accel/
 remote-pci-obj-$(CONFIG_MPQEMU) += util/
+remote-pci-obj-$(CONFIG_MPQEMU) += monitor/
 
 remote-pci-obj-$(CONFIG_MPQEMU) += cpus-common.o
 remote-pci-obj-$(CONFIG_MPQEMU) += dma-helpers.o
@@ -44,6 +45,9 @@ remote-pci-obj-$(CONFIG_MPQEMU) += iothread.o
 # remote-lsi-obj-y is code used to implement remote LSI device
 
 remote-lsi-obj-$(CONFIG_MPQEMU) += hw/
+remote-lsi-obj-$(CONFIG_MPQEMU) += ui/
+
+remote-lsi-obj-$(CONFIG_MPQEMU) += device-hotplug.o
 
 #######################################################################
 # crypto-obj-y is code used by both qemu system emulation and qemu-img
@@ -105,6 +109,11 @@ common-obj-y += qapi/
 
 endif # CONFIG_SOFTMMU
 
+remote-pci-obj-$(CONFIG_MPQEMU) += qapi/
+remote-pci-obj-$(CONFIG_MPQEMU) += blockdev-nbd.o
+remote-pci-obj-$(CONFIG_MPQEMU) += job-qmp.o
+remote-pci-obj-$(CONFIG_MPQEMU) += balloon.o
+
 #######################################################################
 # Target-independent parts used in system and user emulation
 common-obj-y += cpus-common.o
diff --git a/Makefile.target b/Makefile.target
index 035c23b..4ead5c3 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -142,13 +142,32 @@ remote-pci-tgt-obj-$(CONFIG_MPQEMU) += accel/stubs/hax-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += accel/stubs/whpx-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/vl-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/net-stub.o
-remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/monitor.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/replay.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/xen-mapcache.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/audio.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/monitor.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/migration.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/ui-stub.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/gdbstub.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/qapi-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/qapi-misc.o
 
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += remote/memory.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += arch_init.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += monitor/misc.o
+
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-introspect.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-block-core.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-block.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-misc.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-visit-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-visit-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-types-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-types-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-init-commands.o
 endif
 
 #########################################################
@@ -203,6 +222,10 @@ endif
 generated-files-y += hmp-commands.h hmp-commands-info.h
 generated-files-y += config-devices.h
 
+ifdef CONFIG_MPQEMU
+generated-files-y += hmp-scsi-commands.h hmp-scsi-commands-info.h
+endif
+
 endif # CONFIG_SOFTMMU
 
 dummy := $(call unnest-vars,,obj-y)
@@ -288,10 +311,18 @@ hmp-commands.h: $(SRC_PATH)/hmp-commands.hx $(SRC_PATH)/scripts/hxtool
 hmp-commands-info.h: $(SRC_PATH)/hmp-commands-info.hx $(SRC_PATH)/scripts/hxtool
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN","$(TARGET_DIR)$@")
 
+ifdef CONFIG_MPQEMU
+hmp-scsi-commands.h: $(SRC_PATH)/hmp-commands.hx $(SRC_PATH)/scripts/hxtool
+	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -tgt scsi < $< > $@)
+
+hmp-scsi-commands-info.h: $(SRC_PATH)/hmp-commands-info.hx $(SRC_PATH)/scripts/hxtool
+	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -tgt scsi < $< > $@)
+endif
+
 clean: clean-target
 	rm -f *.a *~ $(PROGS)
 	rm -f $(shell find . -name '*.[od]')
-	rm -f hmp-commands.h gdbstub-xml.c
+	rm -f hmp-commands.h gdbstub-xml.c hmp-scsi-commands.h hmp-scsi-commands-info.h
 	rm -f trace/generated-helpers.c trace/generated-helpers.c-timestamp
 ifdef CONFIG_TRACE_SYSTEMTAP
 	rm -f *.stp
diff --git a/hmp-commands.hx b/hmp-commands.hx
index ecc6169..a1932c4 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -14,7 +14,8 @@ ETEXI
         .args_type  = "name:S?",
         .params     = "[cmd]",
         .help       = "show the help",
-        .cmd        = do_help_cmd,
+        .cmd        = hmp_do_help_cmd,
+        .targets    = "scsi",
         .flags      = "p",
     },
 
@@ -618,7 +619,7 @@ ETEXI
         .args_type  = "fmt:/,val:l",
         .params     = "/fmt expr",
         .help       = "print expression value (use $reg for CPU register access)",
-        .cmd        = do_print,
+        .cmd        = hmp_do_print,
     },
 
 STEXI
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index e3e8084..251b77b 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -49,3 +49,4 @@ remote-pci-obj-$(CONFIG_MPQEMU) += numa.o
 remote-pci-obj-$(CONFIG_MPQEMU) += cpu.o
 remote-pci-obj-$(CONFIG_MPQEMU) += vmstate-if.o
 remote-pci-obj-$(CONFIG_MPQEMU) += resettable.o
+remote-pci-obj-$(CONFIG_MPQEMU) += machine-qmp-cmds.o
diff --git a/monitor/Makefile.objs b/monitor/Makefile.objs
index 9244d90..48d8017 100644
--- a/monitor/Makefile.objs
+++ b/monitor/Makefile.objs
@@ -2,3 +2,7 @@ obj-y += misc.o
 common-obj-y += monitor.o qmp.o hmp.o
 common-obj-y += qmp-cmds.o qmp-cmds-control.o
 common-obj-y += hmp-cmds.o
+
+remote-pci-obj-$(CONFIG_MPQEMU) += monitor.o qmp.o hmp.o
+remote-pci-obj-$(CONFIG_MPQEMU) += qmp-cmds.o qmp-cmds-control.o
+remote-pci-obj-$(CONFIG_MPQEMU) += hmp-cmds.o
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c41293..f1f09bf 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -177,12 +177,12 @@ int hmp_compare_cmd(const char *name, const char *list)
     return 0;
 }
 
-static void do_help_cmd(Monitor *mon, const QDict *qdict)
+void hmp_do_help_cmd(Monitor *mon, const QDict *qdict)
 {
     help_cmd(mon, qdict_get_try_str(qdict, "name"));
 }
 
-static void hmp_trace_event(Monitor *mon, const QDict *qdict)
+void hmp_trace_event(Monitor *mon, const QDict *qdict)
 {
     const char *tp_name = qdict_get_str(qdict, "name");
     bool new_state = qdict_get_bool(qdict, "option");
@@ -226,7 +226,7 @@ static void hmp_trace_file(Monitor *mon, const QDict *qdict)
 }
 #endif
 
-static void hmp_info_help(Monitor *mon, const QDict *qdict)
+void hmp_info_help(Monitor *mon, const QDict *qdict)
 {
     help_cmd(mon, "info");
 }
@@ -314,7 +314,7 @@ int monitor_get_cpu_index(void)
     return cs ? cs->cpu_index : UNASSIGNED_CPU_INDEX;
 }
 
-static void hmp_info_registers(Monitor *mon, const QDict *qdict)
+void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
     CPUState *cs;
@@ -337,7 +337,7 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 }
 
 #ifdef CONFIG_TCG
-static void hmp_info_jit(Monitor *mon, const QDict *qdict)
+void hmp_info_jit(Monitor *mon, const QDict *qdict)
 {
     if (!tcg_enabled()) {
         error_report("JIT information is only available with accel=tcg");
@@ -348,13 +348,13 @@ static void hmp_info_jit(Monitor *mon, const QDict *qdict)
     dump_drift_info();
 }
 
-static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
+void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 {
     dump_opcount_info();
 }
 #endif
 
-static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
+void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
 {
     int64_t max = qdict_get_try_int(qdict, "max", 10);
     bool mean = qdict_get_try_bool(qdict, "mean", false);
@@ -365,7 +365,7 @@ static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
     qsp_report(max, sort_by, coalesce);
 }
 
-static void hmp_info_history(Monitor *mon, const QDict *qdict)
+void hmp_info_history(Monitor *mon, const QDict *qdict)
 {
     MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
     int i;
@@ -385,7 +385,7 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
+void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
 {
     CPUState *cs = mon_get_cpu();
 
@@ -396,7 +396,7 @@ static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
     cpu_dump_statistics(cs, 0);
 }
 
-static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
+void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_try_str(qdict, "name");
     bool has_vcpu = qdict_haskey(qdict, "vcpu");
@@ -456,7 +456,7 @@ void qmp_client_migrate_info(const char *protocol, const char *hostname,
     error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "spice");
 }
 
-static void hmp_logfile(Monitor *mon, const QDict *qdict)
+void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
@@ -466,7 +466,7 @@ static void hmp_logfile(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_log(Monitor *mon, const QDict *qdict)
+void hmp_log(Monitor *mon, const QDict *qdict)
 {
     int mask;
     const char *items = qdict_get_str(qdict, "items");
@@ -483,7 +483,7 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
     qemu_set_log(mask);
 }
 
-static void hmp_singlestep(Monitor *mon, const QDict *qdict)
+void hmp_singlestep(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     if (!option || !strcmp(option, "on")) {
@@ -495,7 +495,7 @@ static void hmp_singlestep(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
+void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_try_str(qdict, "device");
     if (!device)
@@ -511,7 +511,7 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
+void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
 {
     const char *action = qdict_get_str(qdict, "action");
     if (select_watchdog_action(action) == -1) {
@@ -653,7 +653,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     }
 }
 
-static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
+void hmp_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -663,7 +663,7 @@ static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
     memory_dump(mon, count, format, size, addr, 0);
 }
 
-static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
+void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -693,7 +693,7 @@ static void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, Error **errp)
     return qemu_map_ram_ptr(mrs.mr->ram_block, mrs.offset_within_region);
 }
 
-static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
+void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
 {
     hwaddr addr = qdict_get_int(qdict, "addr");
     Error *local_err = NULL;
@@ -713,7 +713,7 @@ static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
     memory_region_unref(mr);
 }
 
-static void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
+void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
 {
     target_ulong addr = qdict_get_int(qdict, "addr");
     MemTxAttrs attrs;
@@ -768,7 +768,7 @@ out:
     return ret;
 }
 
-static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
+void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
 {
     hwaddr addr = qdict_get_int(qdict, "addr");
     Error *local_err = NULL;
@@ -795,7 +795,7 @@ static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
 }
 #endif
 
-static void do_print(Monitor *mon, const QDict *qdict)
+void hmp_do_print(Monitor *mon, const QDict *qdict)
 {
     int format = qdict_get_int(qdict, "format");
     hwaddr val = qdict_get_int(qdict, "val");
@@ -821,7 +821,7 @@ static void do_print(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "\n");
 }
 
-static void hmp_sum(Monitor *mon, const QDict *qdict)
+void hmp_sum(Monitor *mon, const QDict *qdict)
 {
     uint32_t addr;
     uint16_t sum;
@@ -841,7 +841,7 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
 
 static int mouse_button_state;
 
-static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
+void hmp_mouse_move(Monitor *mon, const QDict *qdict)
 {
     int dx, dy, dz, button;
     const char *dx_str = qdict_get_str(qdict, "dx_str");
@@ -865,7 +865,7 @@ static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
     qemu_input_event_sync();
 }
 
-static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
+void hmp_mouse_button(Monitor *mon, const QDict *qdict)
 {
     static uint32_t bmap[INPUT_BUTTON__MAX] = {
         [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
@@ -882,7 +882,7 @@ static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
     mouse_button_state = button_state;
 }
 
-static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
+void hmp_ioport_read(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -916,7 +916,7 @@ static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
                    suffix, addr, size * 2, val);
 }
 
-static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
+void hmp_ioport_write(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -938,7 +938,7 @@ static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_boot_set(Monitor *mon, const QDict *qdict)
+void hmp_boot_set(Monitor *mon, const QDict *qdict)
 {
     Error *local_err = NULL;
     const char *bootdevice = qdict_get_str(qdict, "bootdevice");
@@ -951,7 +951,7 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
+void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 {
     bool flatview = qdict_get_try_bool(qdict, "flatview", false);
     bool dispatch_tree = qdict_get_try_bool(qdict, "dispatch_tree", false);
@@ -964,7 +964,7 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 
 int64_t dev_time;
 
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
+void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     static int64_t last_cpu_exec_time;
     int64_t cpu_exec_time;
@@ -981,7 +981,7 @@ static void hmp_info_profile(Monitor *mon, const QDict *qdict)
     dev_time = 0;
 }
 #else
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
+void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "Internal profiler not compiled\n");
 }
@@ -990,7 +990,7 @@ static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 /* Capture support */
 static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
 
-static void hmp_info_capture(Monitor *mon, const QDict *qdict)
+void hmp_info_capture(Monitor *mon, const QDict *qdict)
 {
     int i;
     CaptureState *s;
@@ -1001,7 +1001,7 @@ static void hmp_info_capture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
+void hmp_stopcapture(Monitor *mon, const QDict *qdict)
 {
     int i;
     int n = qdict_get_int(qdict, "n");
@@ -1017,7 +1017,7 @@ static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
+void hmp_wavcapture(Monitor *mon, const QDict *qdict)
 {
     const char *path = qdict_get_str(qdict, "path");
     int freq = qdict_get_try_int(qdict, "freq", 44100);
@@ -1070,7 +1070,7 @@ static void hmp_warn_acl(void)
     warn_acl = true;
 }
 
-static void hmp_acl_show(Monitor *mon, const QDict *qdict)
+void hmp_acl_show(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     QAuthZList *auth = find_auth(mon, aclname);
@@ -1097,7 +1097,7 @@ static void hmp_acl_show(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
+void hmp_acl_reset(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     QAuthZList *auth = find_auth(mon, aclname);
@@ -1114,7 +1114,7 @@ static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "acl: removed all rules\n");
 }
 
-static void hmp_acl_policy(Monitor *mon, const QDict *qdict)
+void hmp_acl_policy(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *policy = qdict_get_str(qdict, "policy");
@@ -1155,7 +1155,7 @@ static QAuthZListFormat hmp_acl_get_format(const char *match)
     }
 }
 
-static void hmp_acl_add(Monitor *mon, const QDict *qdict)
+void hmp_acl_add(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
@@ -1208,7 +1208,7 @@ static void hmp_acl_add(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_acl_remove(Monitor *mon, const QDict *qdict)
+void hmp_acl_remove(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
@@ -1678,13 +1678,21 @@ int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
 
 /* Please update hmp-commands.hx when adding or changing commands */
 static HMPCommand hmp_info_cmds[] = {
+#if defined(SCSI_PROCESS)
+#include "hmp-scsi-commands-info.h"
+#else
 #include "hmp-commands-info.h"
+#endif
     { NULL, NULL, },
 };
 
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
+#if defined(SCSI_PROCESS)
+#include "hmp-scsi-commands.h"
+#else
 #include "hmp-commands.h"
+#endif
     { NULL, NULL, },
 };
 
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 3e6baba..26349cb 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -183,4 +183,42 @@ int hmp_compare_cmd(const char *name, const char *list);
 void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
                                  Error **errp);
 
+void hmp_do_help_cmd(Monitor *mon, const QDict *qdict);
+void hmp_trace_event(Monitor *mon, const QDict *qdict);
+void hmp_info_help(Monitor *mon, const QDict *qdict);
+void hmp_info_registers(Monitor *mon, const QDict *qdict);
+void hmp_info_jit(Monitor *mon, const QDict *qdict);
+void hmp_info_opcount(Monitor *mon, const QDict *qdict);
+void hmp_info_sync_profile(Monitor *mon, const QDict *qdict);
+void hmp_info_history(Monitor *mon, const QDict *qdict);
+void hmp_info_cpustats(Monitor *mon, const QDict *qdict);
+void hmp_info_trace_events(Monitor *mon, const QDict *qdict);
+void hmp_logfile(Monitor *mon, const QDict *qdict);
+void hmp_log(Monitor *mon, const QDict *qdict);
+void hmp_singlestep(Monitor *mon, const QDict *qdict);
+void hmp_gdbserver(Monitor *mon, const QDict *qdict);
+void hmp_watchdog_action(Monitor *mon, const QDict *qdict);
+void hmp_memory_dump(Monitor *mon, const QDict *qdict);
+void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict);
+void hmp_gpa2hva(Monitor *mon, const QDict *qdict);
+void hmp_gva2gpa(Monitor *mon, const QDict *qdict);
+void hmp_gpa2hpa(Monitor *mon, const QDict *qdict);
+void hmp_do_print(Monitor *mon, const QDict *qdict);
+void hmp_sum(Monitor *mon, const QDict *qdict);
+void hmp_mouse_move(Monitor *mon, const QDict *qdict);
+void hmp_mouse_button(Monitor *mon, const QDict *qdict);
+void hmp_ioport_read(Monitor *mon, const QDict *qdict);
+void hmp_ioport_write(Monitor *mon, const QDict *qdict);
+void hmp_boot_set(Monitor *mon, const QDict *qdict);
+void hmp_info_mtree(Monitor *mon, const QDict *qdict);
+void hmp_info_profile(Monitor *mon, const QDict *qdict);
+void hmp_info_capture(Monitor *mon, const QDict *qdict);
+void hmp_stopcapture(Monitor *mon, const QDict *qdict);
+void hmp_wavcapture(Monitor *mon, const QDict *qdict);
+void hmp_acl_show(Monitor *mon, const QDict *qdict);
+void hmp_acl_reset(Monitor *mon, const QDict *qdict);
+void hmp_acl_policy(Monitor *mon, const QDict *qdict);
+void hmp_acl_add(Monitor *mon, const QDict *qdict);
+void hmp_acl_remove(Monitor *mon, const QDict *qdict);
+
 #endif
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 20fcc37..a8a3925 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -31,3 +31,5 @@ obj-y += qapi-events.o
 obj-y += $(QAPI_TARGET_MODULES:%=qapi-commands-%.o)
 obj-y += qapi-commands.o
 obj-y += qapi-init-commands.o
+
+remote-pci-obj-$(CONFIG_MPQEMU) += $(QAPI_COMMON_MODULES:%=qapi-commands-%.o)
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
index 07e50e5..16603d7 100644
--- a/qom/Makefile.objs
+++ b/qom/Makefile.objs
@@ -5,3 +5,4 @@ common-obj-$(CONFIG_SOFTMMU) += qom-hmp-cmds.o qom-qmp-cmds.o
 
 remote-pci-obj-$(CONFIG_MPQEMU) += object.o qom-qobject.o container.o
 remote-pci-obj-$(CONFIG_MPQEMU) += object_interfaces.o
+remote-pci-obj-$(CONFIG_MPQEMU) += qom-qmp-cmds.o qom-hmp-cmds.o
diff --git a/ui/Makefile.objs b/ui/Makefile.objs
index e6da6ff..c3ac572 100644
--- a/ui/Makefile.objs
+++ b/ui/Makefile.objs
@@ -68,3 +68,5 @@ console-gl.o-libs += $(OPENGL_LIBS)
 egl-helpers.o-libs += $(OPENGL_LIBS)
 egl-context.o-libs += $(OPENGL_LIBS)
 egl-headless.o-libs += $(OPENGL_LIBS)
+
+remote-lsi-obj-$(CONFIG_MPQEMU) += vnc-stubs.o
-- 
1.8.3.1


