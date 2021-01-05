Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BC2EAFCE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:13:35 +0100 (CET)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoxi-0001Z8-G9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotY-0003vN-EC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotU-0003pv-Fc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:16 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtGkF031391;
 Tue, 5 Jan 2021 16:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=ROprsoQdagLR/MrpJ/ODnCeejJVCD2ZuhBnzLo1//ew=;
 b=qKz20ezfvFTzHkRGoxC06sMxh0CGwB+YDDZIf09p+zj9fumynjykJNwKb/1szfXkCdxV
 zKGfzr4RZHylL7/B4Y6aAT06mydat2411ZwSNNvYCND19z5vi7zOkdjTq38kZyX4bNsk
 m7K2nG2lxusYOGLUxg4RQmFzVFRvD9RaMIaiEJ9jQh3UyKHBCH2QLwKM5z5xxoav+5C/
 P+cjNMR9UZ2Cw+NH/jUUC9dBAldOFHJF+FBn/uaJuCjKfeg0kkuxQZ2Anxxfd87fmtQA
 s9S0396NL8RFaWJmt4yKDzxq3xO3uKHd+6XhdAqJ93ZP5UEj+jDlpP+cC7fqzZHzuaAG KA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35tgsksg3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuO8O029240;
 Tue, 5 Jan 2021 16:09:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35uxnsvb35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:08 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G960e020412;
 Tue, 5 Jan 2021 16:09:06 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:06 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 08/22] cpr: QMP interfaces
Date: Tue,  5 Jan 2021 07:41:56 -0800
Message-Id: <1609861330-129855-9-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
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
 monitor/qmp-cmds.c    | 31 +++++++++++++++++++++++
 qapi/Makefile.objs    |  3 ++-
 qapi/cpr.json         | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/qapi-schema.json |  1 +
 4 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 qapi/cpr.json

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 864cbfa..3778b04 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -35,9 +35,11 @@
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
@@ -161,6 +163,35 @@ void qmp_cont(Error **errp)
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
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 4673ab7..099b325 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -5,7 +5,8 @@ util-obj-y += opts-visitor.o qapi-clone-visitor.o
 util-obj-y += qmp-event.o
 util-obj-y += qapi-util.o
 
-QAPI_COMMON_MODULES = audio authz block-core block char common control crypto
+QAPI_COMMON_MODULES = audio authz block-core block char
+QAPI_COMMON_MODULES += common cpr control crypto
 QAPI_COMMON_MODULES += dump error introspect job machine migration misc
 QAPI_COMMON_MODULES += net pragma qdev qom rdma rocker run-state sockets tpm
 QAPI_COMMON_MODULES += trace transaction ui
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..588749f
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,68 @@
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
+# Since 5.3
+##
+{ 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
+
+
+##
+# @CprInfo:
+#
+# @modes: @CprMode list
+#
+# Since 5.3
+##
+{ 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
+
+##
+# @cprinfo:
+#
+# Returns: @CprInfo
+#
+# Since 5.3
+##
+{ 'command': 'cprinfo', 'returns': 'CprInfo' }
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
+# Since 5.3
+##
+{ 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
+
+##
+# @cprload:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cprsave command.
+#
+# @file: name of checkpoint file
+#
+# Since 5.3
+##
+{ 'command': 'cprload', 'data': { 'file': 'str' } }
+
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index f03ff91..0d47ab6 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -74,6 +74,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'control.json' }
-- 
1.8.3.1


