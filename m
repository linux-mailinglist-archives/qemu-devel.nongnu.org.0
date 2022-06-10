Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B1546FA8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:32:35 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznBC-00089X-1O
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn55-0000hm-SV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn52-0005UJ-Im
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62eiebJ4CRcXipkHxKOY6aVMeIBXkh9jFMURuOSkro4=;
 b=aVlq+Pd/Mwi0Y/Vsy3xPi1EYBN200j+P00F2bDQRI3XUzGq9bEfoPmYJfkDbieWIs3b/pm
 TLRpyRGPPPFNAKUVoLybbucDQDceaN4xWXHmk/k0U6/BcA52rVqe5Rgy6aYkU8mhm6EJN8
 Duzud3U/LUabbsRt1yQRd5laxjuRSYI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-iHV5NKanN-STDPj1bYMNDA-1; Fri, 10 Jun 2022 18:26:11 -0400
X-MC-Unique: iHV5NKanN-STDPj1bYMNDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8730A3815D22;
 Fri, 10 Jun 2022 22:26:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D3040D296B;
 Fri, 10 Jun 2022 22:26:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v2 6/7] iotests: use tests/venv for running tests
Date: Fri, 10 Jun 2022 18:26:04 -0400
Message-Id: <20220610222605.2259132-7-jsnow@redhat.com>
In-Reply-To: <20220610222605.2259132-1-jsnow@redhat.com>
References: <20220610222605.2259132-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Essentially, the changes to testenv.py here mimic the changes that occur when
you "source venv/bin/activate.fish" or similar.

(1) update iotest's internal notion of which python binary to use,
(2) export the VIRTUAL_ENV variable,
(3) front-load the venv/bin directory to PATH.

If the venv directory isn't found, raise a friendly exception that tries
to give the human operator a friendly clue as to what's gone wrong. The
subsequent commit attempts to address this shortcoming by teaching
iotests how to invoke the venv bootstrapper in this circumstance
instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b123..29404ac94be 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -65,8 +65,9 @@ class TestEnv(ContextManager['TestEnv']):
     # lot of them. Silence pylint:
     # pylint: disable=too-many-instance-attributes
 
-    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
-                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+    env_variables = ['PYTHONPATH', 'VIRTUAL_ENV', 'PYTHON', 'PATH',
+                     'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
+                     'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
                      'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
@@ -102,18 +103,29 @@ def get_env(self) -> Dict[str, str]:
 
     def init_directories(self) -> None:
         """Init directory variables:
+             VIRTUAL_ENV
+             PATH
              PYTHONPATH
              TEST_DIR
              SOCK_DIR
              SAMPLE_IMG_DIR
         """
+        venv_path = Path(self.build_root, 'tests/venv/')
+        if not venv_path.exists():
+            raise FileNotFoundError(
+                f"Virtual environment \"{venv_path!s}\" isn't found."
+                " (Maybe you need to run 'make check-venv'"
+                " from the build dir?)"
+            )
+        self.virtual_env: str = str(venv_path)
 
-        # Path where qemu goodies live in this source tree.
-        qemu_srctree_path = Path(__file__, '../../../python').resolve()
+        self.path = os.pathsep.join((
+            str(venv_path / 'bin'),
+            os.environ['PATH'],
+        ))
 
         self.pythonpath = os.pathsep.join(filter(None, (
             self.source_iotests,
-            str(qemu_srctree_path),
             os.getenv('PYTHONPATH'),
         )))
 
@@ -138,7 +150,7 @@ def init_binaries(self) -> None:
              PYTHON (for bash tests)
              QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
         """
-        self.python = sys.executable
+        self.python: str = os.path.join(self.virtual_env, 'bin', 'python3')
 
         def root(*names: str) -> str:
             return os.path.join(self.build_root, *names)
@@ -300,6 +312,7 @@ def print_env(self, prefix: str = '') -> None:
 {prefix}GDB_OPTIONS   -- {GDB_OPTIONS}
 {prefix}VALGRIND_QEMU -- {VALGRIND_QEMU}
 {prefix}PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+{prefix}VIRTUAL_ENV   -- {VIRTUAL_ENV}
 {prefix}"""
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.34.3


