Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE2478344
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:40:53 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my3Ay-000133-TP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:40:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30Q-000165-7v
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30N-0000aD-QJ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+MdB3+SCJlevj77FIgiO2lv49iA6tq3iy3xvu7W11o=;
 b=a+yfpZHAjcMasbZmfmhd2oD7OfGEWYB00t8wrjq2smuPR+iNDPgPRdAgfT+r6xyZEykQAh
 cqDPY6Z+2h8KwYC1kklpKTIjpy+aS1AnzGaS/l5UNDAF2mciY97Y5Vq3dMUMkVf3QKRHq+
 RO6UQrbZjjXXBg2hBtX3e3Bhl4jLp+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-LCj0HmpPPIyzS_-ybASCrQ-1; Thu, 16 Dec 2021 21:29:50 -0500
X-MC-Unique: LCj0HmpPPIyzS_-ybASCrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F201808325;
 Fri, 17 Dec 2021 02:29:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFCCA22DEE;
 Fri, 17 Dec 2021 02:29:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/9] iotests/testenv: initialize an iotests venv
Date: Thu, 16 Dec 2021 21:29:37 -0500
Message-Id: <20211217022939.279559-8-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a venv automatically when running iotests and install the QEMU
namespace package to it, which will also pull in qemu.qmp from PyPI.

The venv created will always use the same python binary as the one used
to launch the check process. Assuming that care is taken to run 'check'
with the python executable specified by the QEMU configure script, this
venv will use that same python binary.

When re-running the script with a different python binary, the virtual
environment will be re-created to match.

Packages that need to be installed for successful runs of iotests are
specified in requirements.txt. The "magic" here is that we can specify
the in-tree repository for the 'qemu' package, whose own requirements
(in python/setup.cfg) specify the now out-of-tree 'qemu.qmp' package.

As a bonus, iotest 297 is now easier to run than before.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/requirements.txt |  3 ++
 tests/qemu-iotests/testenv.py       | 74 ++++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 7 deletions(-)
 create mode 100644 tests/qemu-iotests/requirements.txt

diff --git a/tests/qemu-iotests/requirements.txt b/tests/qemu-iotests/requirements.txt
new file mode 100644
index 0000000000..923e6b26a3
--- /dev/null
+++ b/tests/qemu-iotests/requirements.txt
@@ -0,0 +1,3 @@
+../../python
+mypy >= 0.770
+pylint >= 2.8.0
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index c33454fa68..f258aceac0 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -26,6 +26,7 @@
 import subprocess
 import glob
 from typing import List, Dict, Any, Optional, ContextManager
+import venv
 
 DEF_GDB_OPTIONS = 'localhost:12345'
 
@@ -65,8 +66,9 @@ class TestEnv(ContextManager['TestEnv']):
     # lot of them. Silence pylint:
     # pylint: disable=too-many-instance-attributes
 
-    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
-                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+    env_variables = ['PYTHONPATH', 'VIRTUAL_ENV', 'PYTHON',
+                     'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
+                     'OUTPUT_DIR', 'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
                      'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
@@ -98,8 +100,68 @@ def get_env(self) -> Dict[str, str]:
             if val is not None:
                 env[v] = val
 
+        env['PATH'] = os.pathsep.join((
+            os.path.join(self.virtual_env, 'bin'),
+            os.environ['PATH']
+        ))
         return env
 
+    @staticmethod
+    def _make_venv(venv_dir: Path) -> None:
+        reqfile = Path(__file__, '../requirements.txt').resolve()
+
+        print("Making an iotest venv:")
+        print(f"  python: {sys.executable}")
+        print(f"  venv_dir: {venv_dir!s}")
+        print(f"  requirements: {reqfile!s}")
+        print("")
+
+        # same codepath as 'python3 -m venv iovenv'
+        venv.create(
+            venv_dir,
+            clear=True,
+            symlinks=True,
+            with_pip=True,
+        )
+
+        # enter the venv
+        env = os.environ.copy()
+        env['VIRTUAL_ENV'] = str(venv_dir)
+        env['PATH'] = os.pathsep.join((
+            str(venv_dir.joinpath('bin')),
+            os.environ['PATH']
+        ))
+
+        # install the qemu packages to the venv.
+        subprocess.run(
+            ['pip3', 'install', '-r', str(reqfile)],
+            env=env,
+            check=True,
+        )
+
+    def init_venv(self) -> None:
+        venv_dir = Path('iovenv').resolve()
+        py3_bin = venv_dir.joinpath('bin', 'python3')
+
+        self.virtual_env = str(venv_dir)
+
+        if py3_bin.exists():
+            # resolve symlinks on both python executables
+            target = py3_bin.resolve()
+            system = Path(sys.executable).resolve()
+            if target == system:
+                # venv executable matches ours, so presumably nothing to do.
+                return
+
+        try:
+            self._make_venv(venv_dir)
+        except:
+            try:
+                shutil.rmtree(venv_dir)
+            except FileNotFoundError:
+                pass
+            raise
+
     def init_directories(self) -> None:
         """Init directory variables:
              PYTHONPATH
@@ -109,12 +171,8 @@ def init_directories(self) -> None:
              OUTPUT_DIR
         """
 
-        # Path where qemu goodies live in this source tree.
-        qemu_srctree_path = Path(__file__, '../../../python').resolve()
-
         self.pythonpath = os.pathsep.join(filter(None, (
             self.source_iotests,
-            str(qemu_srctree_path),
             os.getenv('PYTHONPATH'),
         )))
 
@@ -141,7 +199,7 @@ def init_binaries(self) -> None:
              PYTHON (for bash tests)
              QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
         """
-        self.python = sys.executable
+        self.python = os.path.join(self.virtual_env, 'bin', 'python3')
 
         def root(*names: str) -> str:
             return os.path.join(self.build_root, *names)
@@ -225,6 +283,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
+        self.init_venv()
         self.init_directories()
         self.init_binaries()
 
@@ -301,6 +360,7 @@ def print_env(self) -> None:
 GDB_OPTIONS   -- {GDB_OPTIONS}
 VALGRIND_QEMU -- {VALGRIND_QEMU}
 PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+VIRTUAL_ENV   -- {VIRTUAL_ENV}
 """
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.31.1


