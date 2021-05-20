Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F94389F46
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:57:32 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdYh-00009a-Nv
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdV0-00030A-IO
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdUy-0006Dg-7R
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D66ZJ9doAOBqpZuX0Fp0PUUAIy5q4B7C5LkjWRve3AU=;
 b=hLu9+qQMdVMdLy7yARdS70ejy3CrHBpyGZ8NmIGUdS38+gCSD9v3RHETd6v72g39r1mNmH
 ktASNALVdIHH2zvmLzhSjVys+V5G9DAyZF/AGYpcgQSZM61SPTBSlH7Av6KbYFu1K2yn2/
 6y3E6lqPzMzbAsTF0HnJVCyrm1Ral3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-silLzt_zMAS5rV0hScrv5w-1; Thu, 20 May 2021 03:53:37 -0400
X-MC-Unique: silLzt_zMAS5rV0hScrv5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 998258064A7;
 Thu, 20 May 2021 07:53:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7D447863D;
 Thu, 20 May 2021 07:52:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 01/15] python: qemu: add timer parameter for qmp.accept
 socket
Date: Thu, 20 May 2021 09:52:22 +0200
Message-Id: <20210520075236.44723-2-eesposit@redhat.com>
In-Reply-To: <20210520075236.44723-1-eesposit@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alsp add a new _qmp_timer field to the QEMUMachine class.

Let's change the default socket timeout to None, so that if
a subclass needs to add a timer, it can be done by modifying
this private field.

At the same time, restore the timer to be 15 seconds in iotests.py, to
give an upper bound to qemu-iotests execution.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py        | 7 +++++--
 python/qemu/qtest.py          | 5 +++--
 tests/qemu-iotests/iotests.py | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..df32de4377 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -89,7 +89,8 @@ def __init__(self,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
-                 console_log: Optional[str] = None):
+                 console_log: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         '''
         Initialize a QEMUMachine
 
@@ -103,6 +104,7 @@ def __init__(self,
         @param sock_dir: where to create socket (overrides test_dir for sock)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
+        @param qmp_timer: (optional) default QMP socket timeout
         @note: Qemu process is not started until launch() is used.
         '''
         # Direct user configuration
@@ -110,6 +112,7 @@ def __init__(self,
         self._binary = binary
         self._args = list(args)
         self._wrapper = wrapper
+        self._qmp_timer = qmp_timer
 
         self._name = name or "qemu-%d" % os.getpid()
         self._test_dir = test_dir
@@ -323,7 +326,7 @@ def _pre_launch(self) -> None:
 
     def _post_launch(self) -> None:
         if self._qmp_connection:
-            self._qmp.accept()
+            self._qmp.accept(self._qmp_timer)
 
     def _post_shutdown(self) -> None:
         """
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 39a0cf62fe..afea210d9d 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -114,14 +114,15 @@ def __init__(self,
                  name: Optional[str] = None,
                  test_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
-                 sock_dir: Optional[str] = None):
+                 sock_dir: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         if name is None:
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = test_dir
         super().__init__(binary, args, name=name, test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
-                         sock_dir=sock_dir)
+                         sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ec3c69daf1..5d78de0f0b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -571,10 +571,11 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
+        timer = 15.0
         super().__init__(qemu_prog, qemu_opts, name=name,
                          test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
-                         sock_dir=sock_dir)
+                         sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
     def add_object(self, opts):
-- 
2.30.2


