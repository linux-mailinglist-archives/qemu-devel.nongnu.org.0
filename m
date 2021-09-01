Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3433FDE76
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:19:23 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLS1K-00067O-Lg
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyY-0002ji-N4
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyV-0002x4-Gf
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izxbkLzhrkypD4EK6Jt6uqPpHUs2Xv2G8Vl0pZllRvs=;
 b=hqUCKXFSmH0SCIYSisE0w/nWDhFTGTxnIzOZnO32AWHiqXl3/ZZIXcHpe/KslTmJuPqsuY
 ucJ/gciPhV4SAvKNYM4GZ4wi+F/fRmvFKqY11ba21Zsd0IQTMR5aNQC1RLCGCVlKbplLB0
 54TPtJR3wxxbO02/iHJXIyry5JdsZf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-lmrtdt1sOKWlTU-kSadP6A-1; Wed, 01 Sep 2021 11:16:24 -0400
X-MC-Unique: lmrtdt1sOKWlTU-kSadP6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4DA87D541;
 Wed,  1 Sep 2021 15:16:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7415B826;
 Wed,  1 Sep 2021 15:16:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/56] python: qemu: add timer parameter for qmp.accept socket
Date: Wed,  1 Sep 2021 17:15:24 +0200
Message-Id: <20210901151619.689075-2-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Also add a new _qmp_timer field to the QEMUMachine class.

Let's change the default socket timeout to None, so that if
a subclass needs to add a timer, it can be done by modifying
this private field.

At the same time, restore the timer to be 15 seconds in iotests.py, to
give an upper bound to the QMP monitor test command execution.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210809090114.64834-2-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 7 +++++--
 python/qemu/machine/qtest.py   | 5 +++--
 tests/qemu-iotests/iotests.py  | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6..14c4d17eca 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -97,7 +97,8 @@ def __init__(self,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
                  console_log: Optional[str] = None,
-                 log_dir: Optional[str] = None):
+                 log_dir: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         '''
         Initialize a QEMUMachine
 
@@ -112,6 +113,7 @@ def __init__(self,
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
         @param log_dir: where to create and keep log files
+        @param qmp_timer: (optional) default QMP socket timeout
         @note: Qemu process is not started until launch() is used.
         '''
         # pylint: disable=too-many-arguments
@@ -121,6 +123,7 @@ def __init__(self,
         self._binary = binary
         self._args = list(args)
         self._wrapper = wrapper
+        self._qmp_timer = qmp_timer
 
         self._name = name or "qemu-%d" % os.getpid()
         self._base_temp_dir = base_temp_dir
@@ -343,7 +346,7 @@ def _pre_launch(self) -> None:
 
     def _post_launch(self) -> None:
         if self._qmp_connection:
-            self._qmp.accept()
+            self._qmp.accept(self._qmp_timer)
 
     def _post_shutdown(self) -> None:
         """
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index d6d9c6a34a..592be263e0 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -115,7 +115,8 @@ def __init__(self,
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
-                 sock_dir: Optional[str] = None):
+                 sock_dir: Optional[str] = None,
+                 qmp_timer: Optional[float] = None):
         # pylint: disable=too-many-arguments
 
         if name is None:
@@ -124,7 +125,7 @@ def __init__(self,
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


