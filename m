Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5222B1494
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:15:57 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPZ6-00019B-Gm
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1kdPXO-0000Fk-IV
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 22:14:10 -0500
Received: from [240e:678:8c0:5::c0a8:3a62] (port=32584
 helo=FZEX3.ruijie.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1kdPXJ-0000Lj-3h
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 22:14:08 -0500
Received: from centos.localdomain (172.20.101.108) by FZEX3.ruijie.com.cn
 (192.168.58.89) with Microsoft SMTP Server id 14.3.123.3; Fri, 13 Nov 2020
 11:13:52 +0800
From: lichun <lichun@ruijie.com.cn>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hmp: Update current monitor acts on the entire
 handle_hmp_command()
Date: Fri, 13 Nov 2020 19:13:40 +0800
Message-ID: <1605266020-51470-1-git-send-email-lichun@ruijie.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.101.108]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 240e:678:8c0:5::c0a8:3a62
 (failed)
Received-SPF: permerror client-ip=240e:678:8c0:5::c0a8:3a62;
 envelope-from=lichun@ruijie.com.cn; helo=FZEX3.ruijie.com.cn
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, lichun <lichun@ruijie.com.cn>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

monitor_parse_arguments() also need to known the current monitoar:
 (gdb) bt
 #0  0x0000555555ac6a6d in mon_get_cpu_sync (mon=0x0, synchronize=synchronize@entry=true) at ../monitor/misc.c:270
 #1  0x0000555555ac6b4a in mon_get_cpu () at ../monitor/misc.c:294
 #2  0x0000555555ac80fd in get_monitor_def (pval=pval@entry=0x7fffffffcc78, name=name@entry=0x7fffffffcc80 "pc") at ../monitor/misc.c:1669
 #3  0x000055555583fa8a in expr_unary (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:387
 #4  0x000055555583fb32 in expr_prod (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:421
 #5  0x000055555583fbcc in expr_logic (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:455
 #6  0x000055555583f82c in expr_sum (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:484
 #7  0x000055555583fc97 in get_expr (mon=mon@entry=0x5555568a75a0, pval=pval@entry=0x7fffffffce18, pp=pp@entry=0x7fffffffce08) at ../monitor/hmp.c:511
 #8  0x00005555558409b1 in monitor_parse_arguments (mon=mon@entry=0x5555568a75a0, cmd=0x555556561e40 <hmp_cmds+7040>, cmd=0x555556561e40 <hmp_cmds+7040>, endp=0x7fffffffd288) at ../monitor/hmp.c:876
 #9  0x0000555555841796 in handle_hmp_command (mon=mon@entry=0x5555568a75a0, cmdline=0x5555568b12b3 "$pc", cmdline@entry=0x5555568b12b0 "xp $pc") at ../monitor/hmp.c:1073
Therefore update current monitor as soon as possible to avoid
hmp/xp command failure.

Fixes: ff04108a0e36 ("hmp: Update current monitor only in handle_hmp_command()")
Signed-off-by: lichun <lichun@ruijie.com.cn>
---
 monitor/hmp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index c5cd9d3..ee5413e 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1072,52 +1072,52 @@ static void handle_hmp_command_co(void *opaque)
 }
 
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
 {
     QDict *qdict;
     const HMPCommand *cmd;
     const char *cmd_start = cmdline;
 
     trace_handle_hmp_command(mon, cmdline);
 
+    /* old_mon is non-NULL when called from qmp_human_monitor_command() */
+    Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
+
     cmd = monitor_parse_command(mon, cmdline, &cmdline, hmp_cmds);
     if (!cmd) {
         return;
     }
 
     qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
     if (!qdict) {
         while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
             cmdline--;
         }
         monitor_printf(&mon->common, "Try \"help %.*s\" for more information\n",
                        (int)(cmdline - cmd_start), cmd_start);
         return;
     }
 
     if (!cmd->coroutine) {
-        /* old_mon is non-NULL when called from qmp_human_monitor_command() */
-        Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
         cmd->cmd(&mon->common, qdict);
-        monitor_set_cur(qemu_coroutine_self(), old_mon);
     } else {
         HandleHmpCommandCo data = {
             .mon = &mon->common,
             .cmd = cmd,
             .qdict = qdict,
             .done = false,
         };
         Coroutine *co = qemu_coroutine_create(handle_hmp_command_co, &data);
-        monitor_set_cur(co, &mon->common);
         aio_co_enter(qemu_get_aio_context(), co);
         AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
     }
+    monitor_set_cur(qemu_coroutine_self(), old_mon);
 
     qobject_unref(qdict);
 }
 
 static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
 {
     const char *p, *pstart;
     char cmd[128];
     int len;
 
-- 
1.8.3.1


