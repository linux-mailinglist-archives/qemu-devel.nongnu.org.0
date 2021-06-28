Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2B3B5E31
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:42:05 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqaS-0007R8-R2
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQt-0006mM-7M
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQn-00036z-AI
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624883524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bghjg58GX0rJDAuujFUtFRgJCOvD2fY4XUZEchNMw4w=;
 b=Uq88ncwJdnBubn5UvOjezCArLcZxZFhkoXIfrwF+O6ESzTNcDalbmXyf5XOSwYTOU5gDWf
 0FW+OShar1pHg1yk/Wk+/CWyuwx0kUSy41NJXvGVRl4gQgAKM5UTNc8oynsld4bwSpVxIq
 5FgUBfPq10XNS7KVOl/HBNQHoAoL+hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Wk0oXd13OlGbRDEhQF8z7A-1; Mon, 28 Jun 2021 08:32:01 -0400
X-MC-Unique: Wk0oXd13OlGbRDEhQF8z7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17530100C685;
 Mon, 28 Jun 2021 12:31:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-69.ams2.redhat.com
 [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9E0D19C46;
 Mon, 28 Jun 2021 12:31:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 01/16] python: qemu: add timer parameter for qmp.accept
 socket
Date: Mon, 28 Jun 2021 14:31:35 +0200
Message-Id: <20210628123150.56567-2-eesposit@redhat.com>
In-Reply-To: <20210628123150.56567-1-eesposit@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also add a new _qmp_timer field to the QEMUMachine class.

Let's change the default socket timeout to None, so that if
a subclass needs to add a timer, it can be done by modifying
this private field.

At the same time, restore the timer to be 15 seconds in iotests.py, to
give an upper bound to the QMP monitor test command execution.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 7 +++++--
 python/qemu/machine/qtest.py   | 5 +++--
 tests/qemu-iotests/iotests.py  | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index b62435528e..fdf2fc0e9c 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -95,7 +95,8 @@ def __init__(self,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
-                 console_log: Optional[str] = None):
+                 console_log: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         '''
         Initialize a QEMUMachine
 
@@ -109,6 +110,7 @@ def __init__(self,
         @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
+        @param qmp_timer: (optional) default QMP socket timeout
         @note: Qemu process is not started until launch() is used.
         '''
         # Direct user configuration
@@ -116,6 +118,7 @@ def __init__(self,
         self._binary = binary
         self._args = list(args)
         self._wrapper = wrapper
+        self._qmp_timer = qmp_timer
 
         self._name = name or "qemu-%d" % os.getpid()
         self._base_temp_dir = base_temp_dir
@@ -333,7 +336,7 @@ def _pre_launch(self) -> None:
 
     def _post_launch(self) -> None:
         if self._qmp_connection:
-            self._qmp.accept()
+            self._qmp.accept(self._qmp_timer)
 
     def _post_shutdown(self) -> None:
         """
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 93700684d1..33a86a9d69 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -115,14 +115,15 @@ def __init__(self,
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
-                 sock_dir: Optional[str] = None):
+                 sock_dir: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         if name is None:
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = base_temp_dir
         super().__init__(binary, args, name=name, base_temp_dir=base_temp_dir,
                          socket_scm_helper=socket_scm_helper,
-                         sock_dir=sock_dir)
+                         sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..6b0db4ce54 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -570,10 +570,11 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
+        timer = 15.0
         super().__init__(qemu_prog, qemu_opts, name=name,
                          base_temp_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
-                         sock_dir=sock_dir)
+                         sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
     def add_object(self, opts):
-- 
2.31.1


