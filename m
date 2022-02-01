Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387854A55D6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 05:13:15 +0100 (CET)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEkXZ-0005Gk-SF
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 23:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEkW8-00034G-GW
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEkW5-0005F5-Qc
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643688701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FROeyE3NwALmph4ioXzx29cZd6xNV369hUsiPbguUFw=;
 b=VTEZovboURflSQcSETMm+PyIf9pE958ZgnnIYbft2gsmh8P6mY5HtSD9PTbG3EFZ+58sld
 zhcjERwRDv/ai5N2Pxd49hMOYFFoblvzaXmpqLXyH6RaDgCHstludwEQf9e0jOQSZ1Io25
 DSC5GMUae8BVESfE1IytrGBzN5D0/AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-tONOgMxXMxCYuFZFq41poA-1; Mon, 31 Jan 2022 23:11:40 -0500
X-MC-Unique: tONOgMxXMxCYuFZFq41poA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9AA31006AA3;
 Tue,  1 Feb 2022 04:11:38 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD2685E480;
 Tue,  1 Feb 2022 04:11:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] python/machine: raise VMLaunchFailure exception from
 launch()
Date: Mon, 31 Jan 2022 23:11:32 -0500
Message-Id: <20220201041134.1237016-3-jsnow@redhat.com>
In-Reply-To: <20220201041134.1237016-1-jsnow@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to pack in some extra information about the failure,
which guarantees that if the caller did not *intentionally* cause a
failure (by capturing this Exception), some pretty good clues will be
printed at the bottom of the traceback information.

This will help make failures in the event of a non-negative return code
more obvious when they go unhandled; the current behavior in
_post_shutdown() is to print a warning message only in the event of
signal-based terminations (for negative return codes).

(Note: In Python, catching BaseException instead of Exception catches a
broader array of Exception events, including SystemExit and
KeyboardInterrupt. We do not want to "wrap" such exceptions as a
VMLaunchFailure, because that will 'downgrade' the exception from a
BaseException to a regular Exception. We do, however, want to perform
cleanup in either case, so catch on the broadest scope and
wrap-and-re-raise only in the more targeted scope.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py            | 45 ++++++++++++++++++++---
 tests/qemu-iotests/tests/mirror-top-perms |  3 +-
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 67ab06ca2b..a5972fab4d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -74,6 +74,35 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
     """
 
 
+class VMLaunchFailure(QEMUMachineError):
+    """
+    Exception raised when a VM launch was attempted, but failed.
+    """
+    def __init__(self, exitcode: Optional[int],
+                 command: str, output: Optional[str]):
+        super().__init__(exitcode, command, output)
+        self.exitcode = exitcode
+        self.command = command
+        self.output = output
+
+    def __str__(self) -> str:
+        ret = ''
+        if self.__cause__ is not None:
+            name = type(self.__cause__).__name__
+            reason = str(self.__cause__)
+            if reason:
+                ret += f"{name}: {reason}"
+            else:
+                ret += f"{name}"
+        ret += '\n'
+
+        if self.exitcode is not None:
+            ret += f"\tExit code: {self.exitcode}\n"
+        ret += f"\tCommand: {self.command}\n"
+        ret += f"\tOutput: {self.output}\n"
+        return ret
+
+
 class AbnormalShutdown(QEMUMachineError):
     """
     Exception raised when a graceful shutdown was requested, but not performed.
@@ -397,7 +426,7 @@ def launch(self) -> None:
 
         try:
             self._launch()
-        except:
+        except BaseException as exc:
             # We may have launched the process but it may
             # have exited before we could connect via QMP.
             # Assume the VM didn't launch or is exiting.
@@ -408,11 +437,15 @@ def launch(self) -> None:
             else:
                 self._post_shutdown()
 
-            LOG.debug('Error launching VM')
-            if self._qemu_full_args:
-                LOG.debug('Command: %r', ' '.join(self._qemu_full_args))
-            if self._iolog:
-                LOG.debug('Output: %r', self._iolog)
+            if isinstance(exc, Exception):
+                raise VMLaunchFailure(
+                    exitcode=self.exitcode(),
+                    command=' '.join(self._qemu_full_args),
+                    output=self._iolog
+                ) from exc
+
+            # Don't wrap 'BaseException'; doing so would downgrade
+            # that exception. However, we still want to clean up.
             raise
 
     def _launch(self) -> None:
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 0a51a613f3..b5849978c4 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -21,7 +21,6 @@
 
 import os
 
-from qemu.aqmp import ConnectError
 from qemu.machine import machine
 from qemu.qmp import QMPConnectError
 
@@ -107,7 +106,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-        except (QMPConnectError, ConnectError):
+        except (QMPConnectError, machine.VMLaunchFailure):
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


