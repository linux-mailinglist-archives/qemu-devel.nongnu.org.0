Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116421AEA9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:29:32 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlbH-0004cA-Hh
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUh-0007mK-4B
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUf-0008Fg-D4
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594358560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xy9s+1wdx+fQwdHHZY7/5KndW5zbjdDLC4YYERX1j7M=;
 b=IbviGaNeC4uIN8A9t9Gk7V6plrQR+UGOyzzdfdYBtnxtZ2AAYbjy9cJMHwPAApNs0sfHkd
 JUtMklDabAnRjNC+hRVnrZ7E9A62ZMt36RlhLzVjtOMPQ4dxmF6jKhrZ+hS5wL53Vaw8nl
 HHyi+uWgVR+fSm4H5v66EH46a6RlA7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-279Qz5BWPhC5Lm3wr7NrFw-1; Fri, 10 Jul 2020 01:22:36 -0400
X-MC-Unique: 279Qz5BWPhC5Lm3wr7NrFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FF91082;
 Fri, 10 Jul 2020 05:22:35 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E0379231;
 Fri, 10 Jul 2020 05:22:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/16] python/machine.py: use qmp.command
Date: Fri, 10 Jul 2020 01:22:15 -0400
Message-Id: <20200710052220.3306-12-jsnow@redhat.com>
In-Reply-To: <20200710052220.3306-1-jsnow@redhat.com>
References: <20200710052220.3306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 00:36:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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

machine.py and qmp.py both do the same thing here; refactor machine.py
to use qmp.py's functionality more directly.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/machine.py | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 48e70253fa..0df94c3211 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -26,6 +26,8 @@
 import socket
 import tempfile
 from typing import (
+    Any,
+    Dict,
     List,
     Optional,
     Type,
@@ -505,17 +507,23 @@ def set_qmp_monitor(self, enabled=True):
             self._qmp_set = False
             self._qmp = None
 
-    def qmp(self, cmd, conv_keys=True, **args):
-        """
-        Invoke a QMP command and return the response dict
-        """
+    @classmethod
+    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
         qmp_args = dict()
         for key, value in args.items():
-            if conv_keys:
+            if _conv_keys:
                 qmp_args[key.replace('_', '-')] = value
             else:
                 qmp_args[key] = value
+        return qmp_args
 
+    def qmp(self, cmd: str,
+            conv_keys: bool = True,
+            **args: Any) -> QMPMessage:
+        """
+        Invoke a QMP command and return the response dict
+        """
+        qmp_args = self._qmp_args(conv_keys, **args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd, conv_keys=True, **args):
@@ -524,12 +532,8 @@ def command(self, cmd, conv_keys=True, **args):
         On success return the response dict.
         On failure raise an exception.
         """
-        reply = self.qmp(cmd, conv_keys, **args)
-        if reply is None:
-            raise qmp.QMPError("Monitor is closed")
-        if "error" in reply:
-            raise qmp.QMPResponseError(reply)
-        return reply["return"]
+        qmp_args = self._qmp_args(conv_keys, **args)
+        return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait=False):
         """
-- 
2.21.3


