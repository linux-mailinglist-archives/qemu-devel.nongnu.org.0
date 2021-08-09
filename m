Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006783E4203
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:05:26 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Dp-0001hm-1Z
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD19z-00019V-DG
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD19x-0001Qr-QA
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b47luR6Ro8bojhnwNM9vjlgcqcaasTOGXIfrpguKjiA=;
 b=MsR5QoeFjJqRxxi5fbb+HlisX1ixFOfR8UOt4ztOFRyeSccyOglaheH28A5Y1N0seU9i2+
 F/rxnhVBLYCgqKyiRKmbIetEpzQOdVCeYIocYVjp5LMOqZ+A0SF5+sKk5ZWXfBOXzsQArC
 DQjELMEt/cFgxi0TYCtR0waqHtI+Nuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-DNl9fuK4N8iM1W-1EP0vpA-1; Mon, 09 Aug 2021 05:01:21 -0400
X-MC-Unique: DNl9fuK4N8iM1W-1EP0vpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C285E180FCBB;
 Mon,  9 Aug 2021 09:01:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5664C1B4B8;
 Mon,  9 Aug 2021 09:01:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 01/16] python: qemu: add timer parameter for qmp.accept
 socket
Date: Mon,  9 Aug 2021 11:00:59 +0200
Message-Id: <20210809090114.64834-2-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


