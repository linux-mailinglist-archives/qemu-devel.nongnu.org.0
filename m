Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C81B5359
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 06:18:43 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRTJy-00050X-KH
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 00:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTG7-0008Bx-RP
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTG6-0006W6-MR
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:14:43 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jRTG6-0006Un-4f
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:14:42 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4EBxh052927;
 Thu, 23 Apr 2020 04:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=DYJBqcwqmS/Bk1+a24yWbb0pqk7lYnPv60fECKfuUjc=;
 b=LCuRS6lGzOltVokEkCyC0Vfk6oHANFypIdIJbcDUGKm1vBZY5n69b2q5NqIfqtpfR4xs
 P4YOUXOxWn7FcFq8/6ShiSTPRQmBWp+fFLYzQeIS1NyNabtkPag7JpRF21SCjQQG0M/9
 lHUjW9CG6WHlic7YJk/iNnXp0d4QvKxsn2hFUi1+QTm3eDj420xnwkInNVuPvcBJvC8p
 VKCELONeOzMHvp/wDHa4Wrfz39eO1D1+k7Byg+11ltnllXzbdxqXxe5LXBGHLxPm9eoQ
 1g7WEwXrwyS8EhkpNdHGaTCJoBWrBntSJSWBDDP39X4onEkdxRbl4EF8BLc5ADUWgfG5 rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 30jhyc541t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:14:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4CZsh156861;
 Thu, 23 Apr 2020 04:14:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 30gbbjtwdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:14:33 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03N4EUUZ020650;
 Thu, 23 Apr 2020 04:14:31 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Apr 2020 21:14:29 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v6 06/36] monitor: destaticize HMP commands
Date: Wed, 22 Apr 2020 21:13:41 -0700
Message-Id: <3dc3603df5b83576c7ec65589f144d44419cee52.1587614626.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1587614626.git.elena.ufimtseva@oracle.com>
References: <cover.1587614626.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=1 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=1 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 00:14:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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

From: Jagannathan Raman <jag.raman@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands.hx            |  4 +-
 monitor/misc.c             | 76 +++++++++++++++++++-------------------
 monitor/monitor-internal.h | 38 +++++++++++++++++++
 3 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 7f0f3974ad..02cae25c24 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -11,7 +11,7 @@ HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
         .args_type  = "name:S?",
         .params     = "[cmd]",
         .help       = "show the help",
-        .cmd        = do_help_cmd,
+        .cmd        = hmp_do_help_cmd,
         .flags      = "p",
     },
 
@@ -555,7 +555,7 @@ ERST
         .args_type  = "fmt:/,val:l",
         .params     = "/fmt expr",
         .help       = "print expression value (use $reg for CPU register access)",
-        .cmd        = do_print,
+        .cmd        = hmp_do_print,
     },
 
 SRST
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c45fa490f..c0eee6f4ab 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -178,12 +178,12 @@ int hmp_compare_cmd(const char *name, const char *list)
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
@@ -227,7 +227,7 @@ static void hmp_trace_file(Monitor *mon, const QDict *qdict)
 }
 #endif
 
-static void hmp_info_help(Monitor *mon, const QDict *qdict)
+void hmp_info_help(Monitor *mon, const QDict *qdict)
 {
     help_cmd(mon, "info");
 }
@@ -315,7 +315,7 @@ int monitor_get_cpu_index(void)
     return cs ? cs->cpu_index : UNASSIGNED_CPU_INDEX;
 }
 
-static void hmp_info_registers(Monitor *mon, const QDict *qdict)
+void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
     CPUState *cs;
@@ -338,7 +338,7 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 }
 
 #ifdef CONFIG_TCG
-static void hmp_info_jit(Monitor *mon, const QDict *qdict)
+void hmp_info_jit(Monitor *mon, const QDict *qdict)
 {
     if (!tcg_enabled()) {
         error_report("JIT information is only available with accel=tcg");
@@ -349,13 +349,13 @@ static void hmp_info_jit(Monitor *mon, const QDict *qdict)
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
@@ -366,7 +366,7 @@ static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
     qsp_report(max, sort_by, coalesce);
 }
 
-static void hmp_info_history(Monitor *mon, const QDict *qdict)
+void hmp_info_history(Monitor *mon, const QDict *qdict)
 {
     MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
     int i;
@@ -386,7 +386,7 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
+void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
 {
     CPUState *cs = mon_get_cpu();
 
@@ -397,7 +397,7 @@ static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
     cpu_dump_statistics(cs, 0);
 }
 
-static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
+void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_try_str(qdict, "name");
     bool has_vcpu = qdict_haskey(qdict, "vcpu");
@@ -457,7 +457,7 @@ void qmp_client_migrate_info(const char *protocol, const char *hostname,
     error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "spice");
 }
 
-static void hmp_logfile(Monitor *mon, const QDict *qdict)
+void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
@@ -467,7 +467,7 @@ static void hmp_logfile(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_log(Monitor *mon, const QDict *qdict)
+void hmp_log(Monitor *mon, const QDict *qdict)
 {
     int mask;
     const char *items = qdict_get_str(qdict, "items");
@@ -484,7 +484,7 @@ static void hmp_log(Monitor *mon, const QDict *qdict)
     qemu_set_log(mask);
 }
 
-static void hmp_singlestep(Monitor *mon, const QDict *qdict)
+void hmp_singlestep(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     if (!option || !strcmp(option, "on")) {
@@ -496,7 +496,7 @@ static void hmp_singlestep(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
+void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_try_str(qdict, "device");
     if (!device)
@@ -512,7 +512,7 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
+void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
 {
     const char *action = qdict_get_str(qdict, "action");
     if (select_watchdog_action(action) == -1) {
@@ -654,7 +654,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     }
 }
 
-static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
+void hmp_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -664,7 +664,7 @@ static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
     memory_dump(mon, count, format, size, addr, 0);
 }
 
-static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
+void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -694,7 +694,7 @@ static void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, Error **errp)
     return qemu_map_ram_ptr(mrs.mr->ram_block, mrs.offset_within_region);
 }
 
-static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
+void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
 {
     hwaddr addr = qdict_get_int(qdict, "addr");
     Error *local_err = NULL;
@@ -714,7 +714,7 @@ static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
     memory_region_unref(mr);
 }
 
-static void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
+void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
 {
     target_ulong addr = qdict_get_int(qdict, "addr");
     MemTxAttrs attrs;
@@ -769,7 +769,7 @@ out:
     return ret;
 }
 
-static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
+void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
 {
     hwaddr addr = qdict_get_int(qdict, "addr");
     Error *local_err = NULL;
@@ -796,7 +796,7 @@ static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
 }
 #endif
 
-static void do_print(Monitor *mon, const QDict *qdict)
+void hmp_do_print(Monitor *mon, const QDict *qdict)
 {
     int format = qdict_get_int(qdict, "format");
     hwaddr val = qdict_get_int(qdict, "val");
@@ -822,7 +822,7 @@ static void do_print(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "\n");
 }
 
-static void hmp_sum(Monitor *mon, const QDict *qdict)
+void hmp_sum(Monitor *mon, const QDict *qdict)
 {
     uint32_t addr;
     uint16_t sum;
@@ -842,7 +842,7 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
 
 static int mouse_button_state;
 
-static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
+void hmp_mouse_move(Monitor *mon, const QDict *qdict)
 {
     int dx, dy, dz, button;
     const char *dx_str = qdict_get_str(qdict, "dx_str");
@@ -866,7 +866,7 @@ static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
     qemu_input_event_sync();
 }
 
-static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
+void hmp_mouse_button(Monitor *mon, const QDict *qdict)
 {
     static uint32_t bmap[INPUT_BUTTON__MAX] = {
         [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
@@ -883,7 +883,7 @@ static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
     mouse_button_state = button_state;
 }
 
-static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
+void hmp_ioport_read(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -917,7 +917,7 @@ static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
                    suffix, addr, size * 2, val);
 }
 
-static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
+void hmp_ioport_write(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -939,7 +939,7 @@ static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_boot_set(Monitor *mon, const QDict *qdict)
+void hmp_boot_set(Monitor *mon, const QDict *qdict)
 {
     Error *local_err = NULL;
     const char *bootdevice = qdict_get_str(qdict, "bootdevice");
@@ -952,7 +952,7 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
+void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 {
     bool flatview = qdict_get_try_bool(qdict, "flatview", false);
     bool dispatch_tree = qdict_get_try_bool(qdict, "dispatch_tree", false);
@@ -965,7 +965,7 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 
 int64_t dev_time;
 
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
+void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     static int64_t last_cpu_exec_time;
     int64_t cpu_exec_time;
@@ -982,7 +982,7 @@ static void hmp_info_profile(Monitor *mon, const QDict *qdict)
     dev_time = 0;
 }
 #else
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
+void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "Internal profiler not compiled\n");
 }
@@ -991,7 +991,7 @@ static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 /* Capture support */
 static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
 
-static void hmp_info_capture(Monitor *mon, const QDict *qdict)
+void hmp_info_capture(Monitor *mon, const QDict *qdict)
 {
     int i;
     CaptureState *s;
@@ -1002,7 +1002,7 @@ static void hmp_info_capture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
+void hmp_stopcapture(Monitor *mon, const QDict *qdict)
 {
     int i;
     int n = qdict_get_int(qdict, "n");
@@ -1018,7 +1018,7 @@ static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
+void hmp_wavcapture(Monitor *mon, const QDict *qdict)
 {
     const char *path = qdict_get_str(qdict, "path");
     int freq = qdict_get_try_int(qdict, "freq", 44100);
@@ -1071,7 +1071,7 @@ static void hmp_warn_acl(void)
     warn_acl = true;
 }
 
-static void hmp_acl_show(Monitor *mon, const QDict *qdict)
+void hmp_acl_show(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     QAuthZList *auth = find_auth(mon, aclname);
@@ -1098,7 +1098,7 @@ static void hmp_acl_show(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
+void hmp_acl_reset(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     QAuthZList *auth = find_auth(mon, aclname);
@@ -1115,7 +1115,7 @@ static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "acl: removed all rules\n");
 }
 
-static void hmp_acl_policy(Monitor *mon, const QDict *qdict)
+void hmp_acl_policy(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *policy = qdict_get_str(qdict, "policy");
@@ -1156,7 +1156,7 @@ static QAuthZListFormat hmp_acl_get_format(const char *match)
     }
 }
 
-static void hmp_acl_add(Monitor *mon, const QDict *qdict)
+void hmp_acl_add(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
@@ -1209,7 +1209,7 @@ static void hmp_acl_add(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_acl_remove(Monitor *mon, const QDict *qdict)
+void hmp_acl_remove(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 8f60ccc70a..bc8c9fa16b 100644
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
-- 
2.25.GIT


