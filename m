Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F03937F0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:27:41 +0200 (CEST)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNXY-0005qt-M5
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNOa-0002xE-Bn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNOW-000057-4H
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpPLwUduOPBU/MDJ39RcDLoxJY5nYaTvJH5KCIXC+XI=;
 b=RofcGFOt7HGvtyGhVME6g3E8Q0ck9LefILRztyBzk1IiJK4JYkGSEJGWR0iUNrxw7WxaIS
 PNpY1GTDoHU15KAawsYn6gdTaAn9DZcyTBFHYkkTMsTHg0refchbqQJc+mmUCT9hFPMpAo
 3K+D9ZhOW7L4FFgn2qNH3AioKbOwOOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-sFH4yYD0PqaE7VKGrRyEdw-1; Thu, 27 May 2021 17:18:15 -0400
X-MC-Unique: sFH4yYD0PqaE7VKGrRyEdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F661883520;
 Thu, 27 May 2021 21:18:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D3B45D9C6;
 Thu, 27 May 2021 21:18:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/31] python: create qemu packages
Date: Thu, 27 May 2021 17:16:53 -0400
Message-Id: <20210527211715.394144-10-jsnow@redhat.com>
In-Reply-To: <20210527211715.394144-1-jsnow@redhat.com>
References: <20210527211715.394144-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move python/qemu/*.py to python/qemu/[machine, qmp, utils]/*.py and
update import directives across the tree.

This is done to create a PEP420 namespace package, in which we may
create subpackages. To do this, the namespace directory ("qemu") should
not have any modules in it. Those files will go into new 'machine',
'qmp' and 'utils' subpackages instead.

Implement machine/__init__.py making the top-level classes and functions
from its various modules available directly inside the package. Change
qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
library classes are available directly from "qemu.qmp" instead of
"qemu.qmp.qmp".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/{qemu => }/.isort.cfg                |  0
 python/qemu/__init__.py                     | 11 -------
 python/qemu/{ => machine}/.flake8           |  0
 python/qemu/machine/__init__.py             | 33 +++++++++++++++++++++
 python/qemu/{ => machine}/console_socket.py |  0
 python/qemu/{ => machine}/machine.py        | 16 ++++++----
 python/qemu/{ => machine}/pylintrc          |  0
 python/qemu/{ => machine}/qtest.py          |  3 +-
 python/qemu/{qmp.py => qmp/__init__.py}     | 12 +++++++-
 python/qemu/{utils.py => utils/__init__.py} | 18 +++++++++--
 python/qemu/{ => utils}/accel.py            |  0
 tests/acceptance/avocado_qemu/__init__.py   |  9 +++---
 tests/acceptance/virtio-gpu.py              |  2 +-
 tests/qemu-iotests/300                      |  4 +--
 tests/qemu-iotests/iotests.py               |  2 +-
 tests/vm/aarch64vm.py                       |  2 +-
 tests/vm/basevm.py                          |  3 +-
 17 files changed, 83 insertions(+), 32 deletions(-)
 rename python/{qemu => }/.isort.cfg (100%)
 delete mode 100644 python/qemu/__init__.py
 rename python/qemu/{ => machine}/.flake8 (100%)
 create mode 100644 python/qemu/machine/__init__.py
 rename python/qemu/{ => machine}/console_socket.py (100%)
 rename python/qemu/{ => machine}/machine.py (98%)
 rename python/qemu/{ => machine}/pylintrc (100%)
 rename python/qemu/{ => machine}/qtest.py (99%)
 rename python/qemu/{qmp.py => qmp/__init__.py} (96%)
 rename python/qemu/{utils.py => utils/__init__.py} (66%)
 rename python/qemu/{ => utils}/accel.py (100%)

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
index 00000000000..98302ea31e7
--- /dev/null
+++ b/python/qemu/machine/__init__.py
@@ -0,0 +1,33 @@
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
+from .machine import QEMUMachine
+from .qtest import QEMUQtestMachine, QEMUQtestProtocol
+
+
+__all__ = (
+    'QEMUMachine',
+    'QEMUQtestProtocol',
+    'QEMUQtestMachine',
+)
diff --git a/python/qemu/console_socket.py b/python/qemu/machine/console_socket.py
similarity index 100%
rename from python/qemu/console_socket.py
rename to python/qemu/machine/console_socket.py
diff --git a/python/qemu/machine.py b/python/qemu/machine/machine.py
similarity index 98%
rename from python/qemu/machine.py
rename to python/qemu/machine/machine.py
index a8837b36e47..d33b02d2ce6 100644
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
@@ -314,7 +320,7 @@ def _pre_launch(self) -> None:
             if self._remove_monitor_sockfile:
                 assert isinstance(self._monitor_address, str)
                 self._remove_files.append(self._monitor_address)
-            self._qmp_connection = qmp.QEMUMonitorProtocol(
+            self._qmp_connection = QEMUMonitorProtocol(
                 self._monitor_address,
                 server=True,
                 nickname=self._name
@@ -541,7 +547,7 @@ def set_qmp_monitor(self, enabled: bool = True) -> None:
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
index 78b97d13cf0..e893ca3697a 100644
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
diff --git a/python/qemu/utils.py b/python/qemu/utils/__init__.py
similarity index 66%
rename from python/qemu/utils.py
rename to python/qemu/utils/__init__.py
index 5ed789275ee..7f1a5138c4b 100644
--- a/python/qemu/utils.py
+++ b/python/qemu/utils/__init__.py
@@ -1,13 +1,14 @@
 """
-QEMU utility library
+QEMU development and testing utilities
 
-This offers miscellaneous utility functions, which may not be easily
-distinguishable or numerous to be in their own module.
+This package provides a small handful of utilities for performing
+various tasks not directly related to the launching of a VM.
 """
 
 # Copyright (C) 2021 Red Hat Inc.
 #
 # Authors:
+#  John Snow <jsnow@redhat.com>
 #  Cleber Rosa <crosa@redhat.com>
 #
 # This work is licensed under the terms of the GNU GPL, version 2.  See
@@ -17,6 +18,17 @@
 import re
 from typing import Optional
 
+# pylint: disable=import-error
+from .accel import kvm_available, list_accel, tcg_available
+
+
+__all__ = (
+    'get_info_usernet_hostfwd_port',
+    'kvm_available',
+    'list_accel',
+    'tcg_available',
+)
+
 
 def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
     """
diff --git a/python/qemu/accel.py b/python/qemu/utils/accel.py
similarity index 100%
rename from python/qemu/accel.py
rename to python/qemu/utils/accel.py
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1062a851b97..93c4b9851f4 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -41,11 +41,12 @@
 
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
-from qemu.accel import kvm_available
-from qemu.accel import tcg_available
 from qemu.machine import QEMUMachine
-from qemu.utils import get_info_usernet_hostfwd_port
-
+from qemu.utils import (
+    get_info_usernet_hostfwd_port,
+    kvm_available,
+    tcg_available,
+)
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab18cddbb73..e7979343e93 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -10,7 +10,7 @@
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import is_readable_executable_file
 
-from qemu.accel import kvm_available
+from qemu.utils import kvm_available
 
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
index 92681907ed9..89663dac06d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -38,7 +38,7 @@
 
 # pylint: disable=import-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu import qtest
+from qemu.machine import qtest
 from qemu.qmp import QMPMessage
 
 # Use this logger for logging messages directly from the iotests module
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index d70ab843b6b..b00cce07eb8 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -14,7 +14,7 @@
 import sys
 import subprocess
 import basevm
-from qemu.accel import kvm_available
+from qemu.utils import kvm_available
 
 # This is the config needed for current version of QEMU.
 # This works for both kvm and tcg.
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 75ce07df364..6f4f0fc95e3 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -19,9 +19,8 @@
 import time
 import datetime
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.accel import kvm_available
 from qemu.machine import QEMUMachine
-from qemu.utils import get_info_usernet_hostfwd_port
+from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
 import subprocess
 import hashlib
 import argparse
-- 
2.31.1


