Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4C57EA62
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:42:31 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF2Ht-0002wv-8V
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2CJ-0006mm-5p; Fri, 22 Jul 2022 19:36:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2CH-0004fw-Cg; Fri, 22 Jul 2022 19:36:42 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MMjRPS007200;
 Fri, 22 Jul 2022 23:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Q/6mxlrKiyT7katCiArn1CvX1SDwfhhyRf6fi1Tkyqo=;
 b=KmYNJwC96TenJvJ4znC+a9/a35JB0f0lS/lqMlCvATd5DpisnUbVRisygYb3fAnreRRr
 nIHJ1NyCqhTRjXuLrsRBGLJ5xx76bVUbOyZ2eexZ0k+JebQTot8RpGRwhg+5jQa/YE65
 j+7D4Zr8kkW4ZGk++08d0LDbtKjavQubnUDUERbFDqxYGclKOgSUbq5oNl3ToV4RO2Pd
 Q35lVfkAezA/dhk1Z3aTUKn2YFZO8jMwspD6b5ElvoAmaD7b9dffGPJ1fbgYm2K1aiEF
 njxoukpINStM9XWGPnaTQW4OWpdUefG605DfnsfG0cx7+Lmv0kxnfkfOpVGAqC7zGkkE vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78w0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:38 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MNPrWQ015160;
 Fri, 22 Jul 2022 23:36:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78vyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MNZ7nn009891;
 Fri, 22 Jul 2022 23:36:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy90s6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26MNajAM26870252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 23:36:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AAE34C044;
 Fri, 22 Jul 2022 23:36:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDE584C040;
 Fri, 22 Jul 2022 23:36:31 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.90.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 23:36:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/2] qapi: Add exit-failure PanicAction
Date: Sat, 23 Jul 2022 01:36:13 +0200
Message-Id: <20220722233614.7254-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722233614.7254-1-iii@linux.ibm.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yU9Reqnlq407XnvnM5Ollya8FfPxTITr
X-Proofpoint-ORIG-GUID: 0Pt4vZrcjZrQ3tGNkUmpEYPjKLlQvzFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220094
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently QEMU exits with code 0 on both panic an shutdown. For tests
it is useful to return 1 on panic, so that it counts as a test
failure.

Introduce a new exit-failure PanicAction that makes main() return
EXIT_FAILURE. Tests can use -action panic=exit-failure option to
activate this behavior.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 include/sysemu/sysemu.h |  2 +-
 qapi/run-state.json     |  4 +++-
 qemu-options.hx         |  2 +-
 softmmu/main.c          |  6 ++++--
 softmmu/runstate.c      | 17 +++++++++++++----
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 812f66a31a..31aa45160b 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,7 +103,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 bool defaults_enabled(void);
 
 void qemu_init(int argc, char **argv, char **envp);
-void qemu_main_loop(void);
+int qemu_main_loop(void);
 void qemu_cleanup(void);
 
 extern QemuOptsList qemu_legacy_drive_opts;
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 6e2162d7b3..d42c370c4f 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -364,10 +364,12 @@
 #
 # @shutdown: Shutdown the VM and exit, according to the shutdown action
 #
+# @exit-failure: Shutdown the VM and exit with nonzero status
+#
 # Since: 6.0
 ##
 { 'enum': 'PanicAction',
-  'data': [ 'pause', 'shutdown', 'none' ] }
+  'data': [ 'pause', 'shutdown', 'exit-failure', 'none' ] }
 
 ##
 # @watchdog-set-action:
diff --git a/qemu-options.hx b/qemu-options.hx
index 79e00916a1..8e17c5064a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4239,7 +4239,7 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
     "                   action when guest reboots [default=reset]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
-    "-action panic=pause|shutdown|none\n"
+    "-action panic=pause|shutdown|exit-failure|none\n"
     "                   action when guest panics [default=shutdown]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
diff --git a/softmmu/main.c b/softmmu/main.c
index c00432ff09..1b675a8c03 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -32,11 +32,13 @@
 
 int qemu_main(int argc, char **argv, char **envp)
 {
+    int status;
+
     qemu_init(argc, argv, envp);
-    qemu_main_loop();
+    status = qemu_main_loop();
     qemu_cleanup();
 
-    return 0;
+    return status;
 }
 
 #ifndef CONFIG_COCOA
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 168e1b78a0..1e68680b9d 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -482,7 +482,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
                                         !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
-    } else if (panic_action == PANIC_ACTION_SHUTDOWN) {
+    } else if (panic_action == PANIC_ACTION_SHUTDOWN ||
+               panic_action == PANIC_ACTION_EXIT_FAILURE) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
@@ -662,7 +663,7 @@ void qemu_system_debug_request(void)
     qemu_notify_event();
 }
 
-static bool main_loop_should_exit(void)
+static bool main_loop_should_exit(int *status)
 {
     RunState r;
     ShutdownCause request;
@@ -680,6 +681,10 @@ static bool main_loop_should_exit(void)
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
             vm_stop(RUN_STATE_SHUTDOWN);
         } else {
+            if (request == SHUTDOWN_CAUSE_GUEST_PANIC &&
+                panic_action == PANIC_ACTION_EXIT_FAILURE) {
+                *status = EXIT_FAILURE;
+            }
             return true;
         }
     }
@@ -715,12 +720,14 @@ static bool main_loop_should_exit(void)
     return false;
 }
 
-void qemu_main_loop(void)
+int qemu_main_loop(void)
 {
+    int status = EXIT_SUCCESS;
 #ifdef CONFIG_PROFILER
     int64_t ti;
 #endif
-    while (!main_loop_should_exit()) {
+
+    while (!main_loop_should_exit(&status)) {
 #ifdef CONFIG_PROFILER
         ti = profile_getclock();
 #endif
@@ -729,6 +736,8 @@ void qemu_main_loop(void)
         dev_time += profile_getclock() - ti;
 #endif
     }
+
+    return status;
 }
 
 void qemu_add_exit_notifier(Notifier *notify)
-- 
2.35.3


