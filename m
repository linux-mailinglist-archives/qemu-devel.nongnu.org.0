Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC320BAA8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 22:52:25 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jovKi-0004y7-R9
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 16:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAq-0007Fz-6c
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:42:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56701
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAj-0005to-IE
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593204123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+wqnE/KuG6Jhv7usc8rSQ03bDjzTNR3cIV4s++VyzA=;
 b=Uc3q1w4/G1TtqSLnQOH7ho9sJUjAWAlFrdTikerYxo3xR3xEj9Mf/0O5cAsXwLRu6Z7yrd
 Y9qr5axyY5CqNd0Sz3skiUXQ07PLXIwzZNUgyaPKoWOCGBMp93lhsSziWkRachSx+dCka+
 nNqEyMh8nL49QMju3HoycfZIYkXEXco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-C4n4mccIOtCz-n5KQLtKDw-1; Fri, 26 Jun 2020 16:41:56 -0400
X-MC-Unique: C4n4mccIOtCz-n5KQLtKDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859F318585AA;
 Fri, 26 Jun 2020 20:41:55 +0000 (UTC)
Received: from probe.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3E1619C58;
 Fri, 26 Jun 2020 20:41:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/16] python/machine.py: use qmp.command
Date: Fri, 26 Jun 2020 16:41:28 -0400
Message-Id: <20200626204133.14500-12-jsnow@redhat.com>
In-Reply-To: <20200626204133.14500-1-jsnow@redhat.com>
References: <20200626204133.14500-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 15:42:27
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

machine.py and qmp.py both do the same thing here; refactor machine.py
to use qmp.py's functionality more directly.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/machine.py | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index f65bd18c1a..9bb5d26407 100644
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
@@ -463,17 +465,23 @@ def set_qmp_monitor(self, enabled=True):
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
@@ -482,12 +490,8 @@ def command(self, cmd, conv_keys=True, **args):
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


