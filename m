Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD111EEBFC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 22:28:27 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgwTS-0005Md-2s
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 16:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgwNz-0003zj-3L
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:22:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49926
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgwNx-0005Ug-Rv
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591302165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZl/vaoLFiELtwTjN3/2xmM+dnn6CVXPx8SRSXh/bks=;
 b=eU/EERKZFHz6/BGv3Mwxmeq9F72L7TzcZnpBxpOtce9BQKwRlGLwwgwcixSHmZMEJN3vmT
 k28P51HzWdSHvgq1QpoopIfh/2SRy6YYewZVi1yvjs9xLLhe/nZZn4Pn+vlkan0NfAxnVV
 PulnmV1/54iDl8HS8SjuspNnQ7D/Exc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-wYe5ZUjdMsi72rzAtx_F4Q-1; Thu, 04 Jun 2020 16:22:41 -0400
X-MC-Unique: wYe5ZUjdMsi72rzAtx_F4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDDDB19200C1;
 Thu,  4 Jun 2020 20:22:40 +0000 (UTC)
Received: from probe.redhat.com (ovpn-117-188.rdu2.redhat.com [10.10.117.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC3855D9D3;
 Thu,  4 Jun 2020 20:22:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/16] python/qmp.py: re-absorb MonitorResponseError
Date: Thu,  4 Jun 2020 16:22:23 -0400
Message-Id: <20200604202236.25039-4-jsnow@redhat.com>
In-Reply-To: <20200604202236.25039-1-jsnow@redhat.com>
References: <20200604202236.25039-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:08:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
---
 python/qemu/machine.py        | 15 +--------------
 python/qemu/qmp.py            | 17 +++++++++++++++--
 scripts/render_block_graph.py |  7 +++++--
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 99bcb499878..8ea027566e4 100644
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
@@ -469,7 +456,7 @@ def command(self, cmd, conv_keys=True, **args):
         if reply is None:
             raise qmp.QMPError("Monitor is closed")
         if "error" in reply:
-            raise MonitorResponseError(reply)
+            raise qmp.QMPResponseError(reply)
         return reply["return"]
 
     def get_qmp_event(self, wait=False):
diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 8388c7b6030..aa8a666b8ab 100644
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
index 409b4321f2e..da6acf050d1 100755
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


