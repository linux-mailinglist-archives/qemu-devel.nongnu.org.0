Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA462376556
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:40:45 +0200 (CEST)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezme-0000wn-TH
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbS-0000dG-TZ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:10 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbK-0001Rv-Hn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:10 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDr2L148738;
 Fri, 7 May 2021 12:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=zeYY6QQF2/OIwjuNLMYlqEZVUbtqwO/F/LY+8WehK1g=;
 b=V1W4nKL96c21CGZFISLTXaXF+ex4k4pzp8MFQ2yvKEhOGv9ajb73r3qbNHUr2qS5XQ3m
 woIfr2qw1iHbeBKj0/mWWfoxs0ajosNMg9vqhlBe6BbKs/rnix+oYrhWb2EoDQQahLq3
 GxFQWP9xQ00xl/avdDD+CVnOfSz2fHf6IffZvZ+MS/ypfP3pTf9q09t1I26h4PJFKrny
 QISAoXeH4Y/HUVHM7orMljo/QCGn/jqnyVP4GaZfJHGYwmoJOcvEbbpV7pK72hNtEZyi
 QAppUIUsxcBkq/ABPpDaSFLbnd9as8wAJLFwJF7nfzStaDihBjFSbdJlQ0/ruCKGq+yB 7A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 38csrd9ewc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFY9U068921;
 Fri, 7 May 2021 12:28:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38csrev2gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CPnbe097968;
 Fri, 7 May 2021 12:28:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 38csrev2g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:58 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CSuR8011657;
 Fri, 7 May 2021 12:28:56 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:56 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 08/22] cpr: QMP interfaces
Date: Fri,  7 May 2021 05:25:06 -0700
Message-Id: <1620390320-301716-9-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: bV23kd7SYzmBaJ8pfXlsA7HNW4Y05GNI
X-Proofpoint-GUID: bV23kd7SYzmBaJ8pfXlsA7HNW4Y05GNI
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cprsave calls cprsave().  Syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
  { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }

cprload calls cprload().  Syntax:
  { 'command': 'cprload', 'data': { 'file': 'str' } }

cprinfo returns a list of supported modes.  Syntax:
  { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
  { 'command': 'cprinfo', 'returns': 'CprInfo' }

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 monitor/qmp-cmds.c    | 31 +++++++++++++++++++++
 qapi/cpr.json         | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/meson.build      |  1 +
 qapi/qapi-schema.json |  1 +
 4 files changed, 109 insertions(+)
 create mode 100644 qapi/cpr.json

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6..1128604 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -37,9 +37,11 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "migration/cpr.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -153,6 +155,35 @@ void qmp_cont(Error **errp)
     }
 }
 
+CprInfo *qmp_cprinfo(Error **errp)
+{
+    CprInfo *cprinfo;
+    CprModeList *mode, *mode_list = NULL;
+    CprMode i;
+
+    cprinfo = g_malloc0(sizeof(*cprinfo));
+
+    for (i = 0; i < CPR_MODE__MAX; i++) {
+        mode = g_malloc0(sizeof(*mode));
+        mode->value = i;
+        mode->next = mode_list;
+        mode_list = mode;
+    }
+
+    cprinfo->modes = mode_list;
+    return cprinfo;
+}
+
+void qmp_cprsave(const char *file, CprMode mode, Error **errp)
+{
+    cprsave(file, mode, errp);
+}
+
+void qmp_cprload(const char *file, Error **errp)
+{
+    cprload(file, errp);
+}
+
 void qmp_system_wakeup(Error **errp)
 {
     if (!qemu_wakeup_suspend_enabled()) {
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..2d80cca
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,76 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
+#
+# @restart: checkpoint can be cprload'ed after restarting qemu.
+#
+# Since: 6.0
+##
+{ 'enum': 'CprMode',
+  'data': [ 'reboot', 'restart' ] }
+
+
+##
+# @CprInfo:
+#
+# @modes: @CprMode list
+#
+# Since: 6.0
+##
+{ 'struct': 'CprInfo',
+  'data': { 'modes': [ 'CprMode' ] } }
+
+##
+# @cprinfo:
+#
+# Returns the modes supported by @cprsave.
+#
+# Returns: @CprInfo
+#
+# Since: 6.0
+#
+##
+{ 'command': 'cprinfo',
+  'returns': 'CprInfo' }
+
+##
+# @cprsave:
+#
+# Create a checkpoint of the virtual machine device state in @file.
+# Guest RAM and guest block device blocks are not saved.
+#
+# @file: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 6.0
+##
+{ 'command': 'cprsave',
+  'data': { 'file': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cprload:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cprsave command.
+#
+# @file: name of checkpoint file
+#
+# Since: 6.0
+##
+{ 'command': 'cprload',
+  'data': { 'file': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ce..7e7c48a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -26,6 +26,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
-- 
1.8.3.1


