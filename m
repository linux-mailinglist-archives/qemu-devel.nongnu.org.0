Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B212EC523
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:37:59 +0100 (CET)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFZ8-0008I2-CM
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFXs-0007K3-GH
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:36:40 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxFXo-0000QX-LK
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:36:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KZKFc052766;
 Wed, 6 Jan 2021 20:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=zS5ygFABrCH9JVYarhvVx7Y92OiP/0Tbjby37b13Jxc=;
 b=uXYJU9WLiATp1Mo5MpbU13qaFRK9DATzmYWJaUhnO0L23tbpD1HvN3Z6VPGxgBa/BeM+
 0czfYPSy8NbW7etb6Uwn2xTz7eSNxod+K5kqQ82scgAwgp1TCl3N1qez4/Te67Ok2um0
 BFL0NaMgj5r8Guw4JiUcm3YftjpAOoKzvfvQ8+oMe2s4cDPVShlK7lURJ986+xeLOXHF
 Q9Plq6VsV879L4/AUhLV+P+WTSqocaJcy/cgMNCAM3AgihArRJtVZbcildDe90Zdv9Du
 bWL21RXo9bV2plIBcQGJyuRFWJH4voG79DdK/OhOJeLR6iL8P3d73+Eoj0nO/DbOiq9X MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35wepm9rrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 20:36:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106KOpZK104661;
 Wed, 6 Jan 2021 20:34:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35v1faa2vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 20:34:32 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 106KYVx8024756;
 Wed, 6 Jan 2021 20:34:31 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 20:34:30 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] vl: pause option
Date: Wed,  6 Jan 2021 12:07:36 -0800
Message-Id: <1609963656-417889-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060117
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the -pause command-line parameter and the QEMU_PAUSE environment
variable to pause QEMU during process startup and allow a developer to
attach a debugger, or observe the process using tools such as strace.
Useful when QEMU has been launched with some other entity, such as libvirt.
QEMU_PAUSE is checked in a constructor at the highest priority, and can
be used to debug other constructors.  The -pause option is checked later,
during argument processing in main, but is useful if passing an environment
variable from a launcher to qemu is awkard.

Usage:
  qemu -pause, or QEMU_PAUSE=1
  After attaching a debugger, send SIGCONT to the qemu process to continue.

Example:

  $ QEMU_PAUSE=1 qemu-system-x86_64 ...
  QEMU pid 18371 is stopped.

                                 $ gdb -p 18371
                                 (gdb) break rcu_init
                                 (gdb) signal SIGCONT
                                 Breakpoint 1, rcu_init () at util/rcu.c:380

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 qemu-options.hx | 14 ++++++++++++++
 softmmu/vl.c    | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 708583b..212a270 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3668,6 +3668,20 @@ SRST
     option is experimental.
 ERST
 
+DEF("pause", 0, QEMU_OPTION_pause, \
+    "-pause          pause the qemu process in main. to continue, send SIGCONT.\n"
+    "                to pause earlier, before constructors are run, set the\n"
+    "                environment variable QEMU_PAUSE=1 before starting qemu.\n",
+    QEMU_ARCH_ALL)
+
+SRST
+``-pause``
+    Pause the qemu process in main.  This is useful for attaching a debugger
+    after QEMU has been launched by some other entity.  After attaching, send
+    SIGCONT to continue.  To pause earlier, before constructors are run, set
+    the environment variable QEMU_PAUSE=1 before starting qemu.
+ERST
+
 DEF("S", 0, QEMU_OPTION_S, \
     "-S              freeze CPU at startup (use 'c' to start execution)\n",
     QEMU_ARCH_ALL)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4eb9d1f..251465d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2829,6 +2829,35 @@ static void create_default_memdev(MachineState *ms, const char *path)
                             &error_fatal);
 }
 
+static void pause_me(void)
+{
+    int sig;
+    sigset_t set, oldset;
+
+    sigemptyset(&set);
+    sigaddset(&set, SIGCONT);
+    printf("QEMU pid %d is stopped.  Send SIGCONT to continue.\n", getpid());
+    sigprocmask(SIG_BLOCK, &set, &oldset);
+    sigwait(&set, &sig);
+    sigprocmask(SIG_SETMASK, &oldset, 0);
+}
+
+static __attribute__((constructor(101))) void maybe_pause(void)
+{
+    const char *pause = getenv("QEMU_PAUSE");
+
+    if (pause) {
+        if (!pause[0] || !strcmp(pause, "1")) {
+            pause_me();
+        } else if (strcmp(pause, "0")) {
+            fprintf(stderr, "error: QEMU_PAUSE bad value %s. Must be 1 or "
+                            "null to enable, 0 or unset to disable.\n",
+                            pause);
+            exit(1);
+        }
+    }
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     int i;
@@ -3191,6 +3220,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_gdb:
                 add_device_config(DEV_GDB, optarg);
                 break;
+            case QEMU_OPTION_pause:
+                pause_me();
+                break;
             case QEMU_OPTION_L:
                 if (is_help_option(optarg)) {
                     list_data_dirs = true;
-- 
1.8.3.1


