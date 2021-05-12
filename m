Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1837EF6A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:15:26 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy4b-0004r7-7b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2N-0001Lq-S2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2I-0005wG-4r
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hN/ACArPvCLCIfhfso6p1RXDquBlSskT1XswdHrCsL4=;
 b=HRqCfvFIfiZWW/W6O5s6Bf8ag4w/jo93ENo/+qTGOWexrk19KWE/8B7ZSsruFzCI8Nkg8u
 jOMJK2h01pcoVOGqVW9YgJtmQqMVwJH4gkP71CGBvsiTM778shSbB2udeidLg4j3knFCdk
 kgBnN4oXa43Qx3IYpmEDyPlwlneQSD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-dmBe2WWZNTyzu9tOLWpZgw-1; Wed, 12 May 2021 19:12:59 -0400
X-MC-Unique: dmBe2WWZNTyzu9tOLWpZgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113FA64157;
 Wed, 12 May 2021 23:12:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7015D736;
 Wed, 12 May 2021 23:12:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/25] python: create qemu packages
Date: Wed, 12 May 2021 19:12:18 -0400
Message-Id: <20210512231241.2816122-3-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move python/qemu/*.py to python/qemu/[machine, qmp]/*.py and update import
directives across the tree.

This is done to create a PEP420 namespace package, in which we may
create subpackages. To do this, the namespace directory ("qemu") should
not have any modules in it. Those files will go into new 'machine' and 'qmp'
subpackages instead.

Implement machine/__init__.py making the top-level classes and functions
from its various modules available directly inside the package. Change
qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
library classes are available directly from "qemu.qmp" instead of
"qemu.qmp.qmp".

Signed-off-by: John Snow <jsnow@redhat.com>


---

Note for reviewers: in the next patch, I add a utils sub-package and
move qemu/machine/accel.py to qemu/utils/accel.py. If we like it that
way, we can squash it in here if we want, or just leave it as its own
follow-up patch, I am just leaving it as something that will be easy to
un-do or change for now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/{qemu => }/.isort.cfg                |  0
 python/qemu/__init__.py                     | 11 ------
 python/qemu/{ => machine}/.flake8           |  0
 python/qemu/machine/__init__.py             | 41 +++++++++++++++++++++
 python/qemu/{ => machine}/accel.py          |  0
 python/qemu/{ => machine}/console_socket.py |  0
 python/qemu/{ => machine}/machine.py        | 16 +++++---
 python/qemu/{ => machine}/pylintrc          |  0
 python/qemu/{ => machine}/qtest.py          |  3 +-
 python/qemu/{qmp.py => qmp/__init__.py}     | 12 +++++-
 tests/acceptance/avocado_qemu/__init__.py   |  4 +-
 tests/acceptance/virtio-gpu.py              |  2 +-
 tests/qemu-iotests/300                      |  4 +-
 tests/qemu-iotests/iotests.py               |  2 +-
 tests/vm/aarch64vm.py                       |  2 +-
 tests/vm/basevm.py                          |  3 +-
 16 files changed, 73 insertions(+), 27 deletions(-)
 rename python/{qemu => }/.isort.cfg (100%)
 delete mode 100644 python/qemu/__init__.py
 rename python/qemu/{ => machine}/.flake8 (100%)
 create mode 100644 python/qemu/machine/__init__.py
 rename python/qemu/{ => machine}/accel.py (100%)
 rename python/qemu/{ => machine}/console_socket.py (100%)
 rename python/qemu/{ => machine}/machine.py (98%)
 rename python/qemu/{ => machine}/pylintrc (100%)
 rename python/qemu/{ => machine}/qtest.py (99%)
 rename python/qemu/{qmp.py => qmp/__init__.py} (96%)

diff --git a/python/qemu/.isort.cfg b/python/.isort.cfg
similarity index 100%
rename from python/qemu/.isort.cfg
rename to python/.isort.cfg
diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
deleted file mode 100644
index 4ca06c34a41..00000000000
--- a/python/qemu/__init__.py
+++ /dev/null
@@ -1,11 +0,0 @@
-# QEMU library
-#
-# Copyright (C) 2015-2016 Red Hat Inc.
-# Copyright (C) 2012 IBM Corp.
-#
-# Authors:
-#  Fam Zheng <famz@redhat.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
-#
diff --git a/python/qemu/.flake8 b/python/qemu/machine/.flake8
similarity index 100%
rename from python/qemu/.flake8
rename to python/qemu/machine/.flake8
diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
new file mode 100644
index 00000000000..0ac6c1e36e3
--- /dev/null
+++ b/python/qemu/machine/__init__.py
@@ -0,0 +1,41 @@
+"""
+QEMU development and testing library.
+
+This library provides a few high-level classes for driving QEMU from a
+test suite, not intended for production use.
+
+- QEMUMachine: Configure and Boot a QEMU VM
+ - QEMUQtestMachine: VM class, with a qtest socket.
+
+- QEMUQtestProtocol: Connect to, send/receive qtest messages.
+
+- list_accel: List available accelerators
+- kvm_available: Probe for KVM support
+- tcg_available: Probe for TCG support
+"""
+
+# Copyright (C) 2020-2021 John Snow for Red Hat Inc.
+# Copyright (C) 2015-2016 Red Hat Inc.
+# Copyright (C) 2012 IBM Corp.
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#  Fam Zheng <fam@euphon.net>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+from .accel import kvm_available, list_accel, tcg_available
+from .machine import QEMUMachine
+from .qtest import QEMUQtestMachine, QEMUQtestProtocol
+
+
+__all__ = (
+    'list_accel',
+    'kvm_available',
+    'tcg_available',
+    'QEMUMachine',
+    'QEMUQtestProtocol',
+    'QEMUQtestMachine',
+)
diff --git a/python/qemu/accel.py b/python/qemu/machine/accel.py
similarity index 100%
rename from python/qemu/accel.py
rename to python/qemu/machine/accel.py
diff --git a/python/qemu/console_socket.py b/python/qemu/machine/console_socket.py
similarity index 100%
rename from python/qemu/console_socket.py
rename to python/qemu/machine/console_socket.py
diff --git a/python/qemu/machine.py b/python/qemu/machine/machine.py
similarity index 98%
rename from python/qemu/machine.py
rename to python/qemu/machine/machine.py
index 0df5b2f386f..dea343afeba 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine/machine.py
@@ -38,8 +38,14 @@
     Type,
 )
 
-from . import console_socket, qmp
-from .qmp import QMPMessage, QMPReturnValue, SocketAddrT
+from qemu.qmp import (
+    QEMUMonitorProtocol,
+    QMPMessage,
+    QMPReturnValue,
+    SocketAddrT,
+)
+
+from . import console_socket
 
 
 LOG = logging.getLogger(__name__)
@@ -139,7 +145,7 @@ def __init__(self,
         self._events: List[QMPMessage] = []
         self._iolog: Optional[str] = None
         self._qmp_set = True   # Enable QMP monitor by default.
-        self._qmp_connection: Optional[qmp.QEMUMonitorProtocol] = None
+        self._qmp_connection: Optional[QEMUMonitorProtocol] = None
         self._qemu_full_args: Tuple[str, ...] = ()
         self._temp_dir: Optional[str] = None
         self._launched = False
@@ -316,7 +322,7 @@ def _pre_launch(self) -> None:
             if self._remove_monitor_sockfile:
                 assert isinstance(self._monitor_address, str)
                 self._remove_files.append(self._monitor_address)
-            self._qmp_connection = qmp.QEMUMonitorProtocol(
+            self._qmp_connection = QEMUMonitorProtocol(
                 self._monitor_address,
                 server=True,
                 nickname=self._name
@@ -543,7 +549,7 @@ def set_qmp_monitor(self, enabled: bool = True) -> None:
         self._qmp_set = enabled
 
     @property
-    def _qmp(self) -> qmp.QEMUMonitorProtocol:
+    def _qmp(self) -> QEMUMonitorProtocol:
         if self._qmp_connection is None:
             raise QEMUMachineError("Attempt to access QMP with no connection")
         return self._qmp_connection
diff --git a/python/qemu/pylintrc b/python/qemu/machine/pylintrc
similarity index 100%
rename from python/qemu/pylintrc
rename to python/qemu/machine/pylintrc
diff --git a/python/qemu/qtest.py b/python/qemu/machine/qtest.py
similarity index 99%
rename from python/qemu/qtest.py
rename to python/qemu/machine/qtest.py
index 39a0cf62fe9..53926e434a7 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,8 +26,9 @@
     TextIO,
 )
 
+from qemu.qmp import SocketAddrT
+
 from .machine import QEMUMachine
-from .qmp import SocketAddrT
 
 
 class QEMUQtestProtocol:
diff --git a/python/qemu/qmp.py b/python/qemu/qmp/__init__.py
similarity index 96%
rename from python/qemu/qmp.py
rename to python/qemu/qmp/__init__.py
index 2cd4d43036c..9606248a3d2 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp/__init__.py
@@ -1,4 +1,14 @@
-""" QEMU Monitor Protocol Python class """
+"""
+QEMU Monitor Protocol (QMP) development library & tooling.
+
+This package provides a fairly low-level class for communicating to QMP
+protocol servers, as implemented by QEMU, the QEMU Guest Agent, and the
+QEMU Storage Daemon. This library is not intended for production use.
+
+`QEMUMonitorProtocol` is the primary class of interest, and all errors
+raised derive from `QMPError`.
+"""
+
 # Copyright (C) 2009, 2010 Red Hat Inc.
 #
 # Authors:
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 83b1741ec85..ff7bf81f1a9 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -40,9 +40,9 @@
 
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
-from qemu.accel import kvm_available
-from qemu.accel import tcg_available
 from qemu.machine import QEMUMachine
+from qemu.machine import kvm_available
+from qemu.machine import tcg_available
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab18cddbb73..0685e30bcae 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -10,7 +10,7 @@
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import is_readable_executable_file
 
-from qemu.accel import kvm_available
+from qemu.machine import kvm_available
 
 import os
 import socket
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index b475a92c478..fe94de84edd 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -28,7 +28,7 @@ import iotests
 
 # Import qemu after iotests.py has amended sys.path
 # pylint: disable=wrong-import-order
-import qemu
+from qemu.machine import machine
 
 BlockBitmapMapping = List[Dict[str, object]]
 
@@ -466,7 +466,7 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
         # the failed migration
         try:
             self.vm_b.shutdown()
-        except qemu.machine.AbnormalShutdown:
+        except machine.AbnormalShutdown:
             pass
 
     def test_aliased_bitmap_name_too_long(self) -> None:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 12e876fa67d..c144cb13e00 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -39,7 +39,7 @@
 
 # pylint: disable=import-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu import qtest
+from qemu.machine import qtest
 from qemu.qmp import QMPMessage
 
 # Use this logger for logging messages directly from the iotests module
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index d70ab843b6b..39ff99b0859 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -14,7 +14,7 @@
 import sys
 import subprocess
 import basevm
-from qemu.accel import kvm_available
+from qemu.machine import kvm_available
 
 # This is the config needed for current version of QEMU.
 # This works for both kvm and tcg.
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 00f1d5ca8da..12d08cf2b1b 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -19,8 +19,7 @@
 import time
 import datetime
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.accel import kvm_available
-from qemu.machine import QEMUMachine
+from qemu.machine import kvm_available, QEMUMachine
 import subprocess
 import hashlib
 import argparse
-- 
2.30.2


