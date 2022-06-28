Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF455E515
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:52:31 +0200 (CEST)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Bdm-00036r-P5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6BbJ-0001DV-Gd
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6BbF-00078D-Ay
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656424192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKr15rhBWWTXIMixtzUVs/TQGOHpDegIlCXWx5otV7M=;
 b=Z8XdIizUtSJZT76F4NoyXHhx8xl1h8EY+VCmiUFVy/DPXCQKuvrpvoMrmMlE8qoF8eAvrF
 HjfF25XMRZiHRMwCzvP5iIG5Anj/4KgX4ojshQWVNQrj5MUmdcRr16yvoAgPXmAt6edQo6
 1hcDYrfRT/WQL5rNjmQr+1vQDWeC8ts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-dqn1VH3TMB2Ft8pFet_ptA-1; Tue, 28 Jun 2022 09:49:49 -0400
X-MC-Unique: dqn1VH3TMB2Ft8pFet_ptA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1413384F800;
 Tue, 28 Jun 2022 13:49:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A754141510C;
 Tue, 28 Jun 2022 13:49:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/2] python/qemu/machine: replace subprocess.Popen with asyncio
Date: Tue, 28 Jun 2022 17:49:38 +0400
Message-Id: <20220628134939.680174-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220628134939.680174-1-marcandre.lureau@redhat.com>
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following patch is going to wait for both subprocess and accept
tasks concurrently. Switch to using asyncio for subprocess handling.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 python/qemu/machine/machine.py | 47 ++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b2d..55c45f4b1205 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -17,6 +17,7 @@
 # Based on qmp.py.
 #
 
+import asyncio
 import errno
 from itertools import chain
 import locale
@@ -30,6 +31,7 @@
 from types import TracebackType
 from typing import (
     Any,
+    Awaitable,
     BinaryIO,
     Dict,
     List,
@@ -180,7 +182,7 @@ def __init__(self,
         # Runstate
         self._qemu_log_path: Optional[str] = None
         self._qemu_log_file: Optional[BinaryIO] = None
-        self._popen: Optional['subprocess.Popen[bytes]'] = None
+        self._subproc: Optional['asyncio.subprocess.Process'] = None
         self._events: List[QMPMessage] = []
         self._iolog: Optional[str] = None
         self._qmp_set = True   # Enable QMP monitor by default.
@@ -198,6 +200,7 @@ def __init__(self,
         self._remove_files: List[str] = []
         self._user_killed = False
         self._quit_issued = False
+        self._aloop = asyncio.get_event_loop()
 
     def __enter__(self: _T) -> _T:
         return self
@@ -269,19 +272,19 @@ def _remove_if_exists(path: str) -> None:
 
     def is_running(self) -> bool:
         """Returns true if the VM is running."""
-        return self._popen is not None and self._popen.poll() is None
+        return self._subproc is not None and self._subproc.returncode is None
 
     @property
-    def _subp(self) -> 'subprocess.Popen[bytes]':
-        if self._popen is None:
+    def _subp(self) -> 'asyncio.subprocess.Process':
+        if self._subproc is None:
             raise QEMUMachineError('Subprocess pipe not present')
-        return self._popen
+        return self._subproc
 
     def exitcode(self) -> Optional[int]:
         """Returns the exit code if possible, or None."""
-        if self._popen is None:
+        if self._subproc is None:
             return None
-        return self._popen.poll()
+        return self._subproc.returncode
 
     def get_pid(self) -> Optional[int]:
         """Returns the PID of the running process, or None."""
@@ -443,6 +446,13 @@ def launch(self) -> None:
             # that exception. However, we still want to clean up.
             raise
 
+    def _sync(
+            self, future: Awaitable[_T], timeout: Optional[float] = None
+    ) -> _T:
+        return self._aloop.run_until_complete(
+            asyncio.wait_for(future, timeout=timeout)
+        )
+
     def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
@@ -452,12 +462,13 @@ def _launch(self) -> None:
 
         # Cleaning up of this subprocess is guaranteed by _do_shutdown.
         # pylint: disable=consider-using-with
-        self._popen = subprocess.Popen(self._qemu_full_args,
-                                       stdin=subprocess.DEVNULL,
-                                       stdout=self._qemu_log_file,
-                                       stderr=subprocess.STDOUT,
-                                       shell=False,
-                                       close_fds=False)
+        self._subproc = self._sync(
+            asyncio.create_subprocess_exec(*self._qemu_full_args,
+                                           stdin=asyncio.subprocess.DEVNULL,
+                                           stdout=self._qemu_log_file,
+                                           stderr=asyncio.subprocess.STDOUT,
+                                           close_fds=False)
+        )
         self._launched = True
         self._post_launch()
 
@@ -508,8 +519,10 @@ def _hard_shutdown(self) -> None:
             waiting for the QEMU process to terminate.
         """
         self._early_cleanup()
-        self._subp.kill()
-        self._subp.wait(timeout=60)
+        self._sync(
+            self._subp.kill(),
+            asyncio.wait_for(self._subp.wait(), timeout=60)
+        )
 
     def _soft_shutdown(self, timeout: Optional[int]) -> None:
         """
@@ -536,7 +549,9 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
                 self._close_qmp_connection()
 
         # May raise subprocess.TimeoutExpired
-        self._subp.wait(timeout=timeout)
+        self._sync(
+            asyncio.wait_for(self._subp.wait(), timeout=timeout)
+        )
 
     def _do_shutdown(self, timeout: Optional[int]) -> None:
         """
-- 
2.37.0.rc0


