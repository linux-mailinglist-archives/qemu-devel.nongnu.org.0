Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A776720BA7C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 22:46:03 +0200 (CEST)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jovEY-0003V5-Kg
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 16:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAQ-0006dX-J8
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:41:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53094
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAO-0005oj-38
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593204103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ebpl/s2od5p2nkJdsUmlCGv8AXKiXwIj/vwcNQbJWCY=;
 b=HiNNA90BS1gnjfAaE1bj2Odarh42XofxZAUwSOfP961HCN5MXXVTRYOneLt2+DnCrImgW4
 O0Vzdt+KFmXMUBrYhpQ8LpyHw/13pAX+MlVfqtGJHaVsjuqdnWSJ/FOqpYivNYwzsUKBOj
 ojdbsETRq0DRe8NiLMdiNAlVV6fluU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-pcwcTblwMNuiAQVqm6OCcQ-1; Fri, 26 Jun 2020 16:41:39 -0400
X-MC-Unique: pcwcTblwMNuiAQVqm6OCcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C932C107ACCA;
 Fri, 26 Jun 2020 20:41:38 +0000 (UTC)
Received: from probe.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF4E219C58;
 Fri, 26 Jun 2020 20:41:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/16] python/qmp.py: re-absorb MonitorResponseError
Date: Fri, 26 Jun 2020 16:41:20 -0400
Message-Id: <20200626204133.14500-4-jsnow@redhat.com>
In-Reply-To: <20200626204133.14500-1-jsnow@redhat.com>
References: <20200626204133.14500-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I initially split this out, I considered this more of a machine
error than a QMP protocol error, but I think that's misguided.

Move this back to qmp.py and name it QMPResponseError. Convert
qmp.command() to use this exception type.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/machine.py        | 15 +--------------
 python/qemu/qmp.py            | 17 +++++++++++++++--
 scripts/render_block_graph.py |  7 +++++--
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 8c9050af5d..a5a579095b 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -49,19 +49,6 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
     """
 
 
-class MonitorResponseError(qmp.QMPError):
-    """
-    Represents erroneous QMP monitor reply
-    """
-    def __init__(self, reply):
-        try:
-            desc = reply["error"]["desc"]
-        except KeyError:
-            desc = reply
-        super().__init__(desc)
-        self.reply = reply
-
-
 class QEMUMachine:
     """
     A QEMU VM
@@ -477,7 +464,7 @@ def command(self, cmd, conv_keys=True, **args):
         if reply is None:
             raise qmp.QMPError("Monitor is closed")
         if "error" in reply:
-            raise MonitorResponseError(reply)
+            raise qmp.QMPResponseError(reply)
         return reply["return"]
 
     def get_qmp_event(self, wait=False):
diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 8388c7b603..aa8a666b8a 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -61,6 +61,19 @@ class QMPTimeoutError(QMPError):
     """
 
 
+class QMPResponseError(QMPError):
+    """
+    Represents erroneous QMP monitor reply
+    """
+    def __init__(self, reply: QMPMessage):
+        try:
+            desc = reply['error']['desc']
+        except KeyError:
+            desc = reply
+        super().__init__(desc)
+        self.reply = reply
+
+
 class QEMUMonitorProtocol:
     """
     Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and then
@@ -251,8 +264,8 @@ def command(self, cmd, **kwds):
         Build and send a QMP command to the monitor, report errors if any
         """
         ret = self.cmd(cmd, kwds)
-        if "error" in ret:
-            raise Exception(ret['error']['desc'])
+        if 'error' in ret:
+            raise QMPResponseError(ret)
         return ret['return']
 
     def pull_event(self, wait=False):
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index 409b4321f2..da6acf050d 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -25,7 +25,10 @@
 from graphviz import Digraph
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.machine import MonitorResponseError
+from qemu.qmp import (
+    QEMUMonitorProtocol,
+    QMPResponseError,
+)
 
 
 def perm(arr):
@@ -102,7 +105,7 @@ def command(self, cmd):
         reply = json.loads(subprocess.check_output(ar))
 
         if 'error' in reply:
-            raise MonitorResponseError(reply)
+            raise QMPResponseError(reply)
 
         return reply['return']
 
-- 
2.21.3


