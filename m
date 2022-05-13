Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CD5258EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:17:11 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIzW-0006xs-Pp
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpE-0007Oa-Nw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpC-0007oE-Ci
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8uNAFWjMGftZ0M1OlBuJbAV4IpB/yDoRqa4iGIxhxQ=;
 b=PISIVD6daJVTkaB7nSOyXsurLkM6NlM52lOu4xESWWM/mD2fit6Ru7BhQsdp5XLtnYDo0d
 eVe/jJIWH+rSBN8JGDrd/bUYEZ+K9oKDzzgGqvh8fuoY+qUDSJvSdWX884uUJzZh380SpD
 jaUMJpHe3WH3f3IcoIWco/QyQDo0PqA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-wh66j9hyP6WAx2GbSheQVA-1; Thu, 12 May 2022 20:06:26 -0400
X-MC-Unique: wh66j9hyP6WAx2GbSheQVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D5F801E80;
 Fri, 13 May 2022 00:06:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2041715341CE;
 Fri, 13 May 2022 00:06:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 9/9] iotests: use tests/venv for running tests
Date: Thu, 12 May 2022 20:06:09 -0400
Message-Id: <20220513000609.197906-10-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Essentially, this:

(A) adjusts the python binary to be the one found in the venv (which is
a symlink to the python binary chosen at configure time)

(B) adds a new VIRTUAL_ENV export variable

(C) changes PATH to front-load the venv binary directory.

If the venv directory isn't found, raise a friendly exception that tries
to give the human operator a friendly clue as to what's gone wrong. In
the very near future, I'd like to teach iotests how to fix this problem
entirely of its own volition, but that's a trick for a little later.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0007da3f06c..fd3720ed7e7 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -65,8 +65,9 @@ class TestEnv(ContextManager['TestEnv']):
     # lot of them. Silence pylint:
     # pylint: disable=too-many-instance-attributes
 
-    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
-                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+    env_variables = ['PYTHONPATH', 'VIRTUAL_ENV', 'PYTHON',
+                     'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
+                     'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
                      'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
@@ -98,6 +99,10 @@ def get_env(self) -> Dict[str, str]:
             if val is not None:
                 env[v] = val
 
+        env['PATH'] = os.pathsep.join((
+            os.path.join(self.virtual_env, 'bin'),
+            os.environ['PATH']
+        ))
         return env
 
     def init_directories(self) -> None:
@@ -107,13 +112,17 @@ def init_directories(self) -> None:
              SOCK_DIR
              SAMPLE_IMG_DIR
         """
-
-        # Path where qemu goodies live in this source tree.
-        qemu_srctree_path = Path(__file__, '../../../python').resolve()
+        venv_path = Path(self.build_root, 'tests/venv/')
+        if not venv_path.exists():
+            raise FileNotFoundError(
+                f"Virtual environment \"{venv_path!s}\" isn't found."
+                " (Maybe you need to run 'make check-venv'"
+                " from the build dir?)"
+            )
+        self.virtual_env: str = str(venv_path)
 
         self.pythonpath = os.pathsep.join(filter(None, (
             self.source_iotests,
-            str(qemu_srctree_path),
             os.getenv('PYTHONPATH'),
         )))
 
@@ -138,7 +147,7 @@ def init_binaries(self) -> None:
              PYTHON (for bash tests)
              QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
         """
-        self.python = sys.executable
+        self.python: str = os.path.join(self.virtual_env, 'bin', 'python3')
 
         def root(*names: str) -> str:
             return os.path.join(self.build_root, *names)
@@ -300,6 +309,7 @@ def print_env(self, prefix: str = '') -> None:
 {prefix}GDB_OPTIONS   -- {GDB_OPTIONS}
 {prefix}VALGRIND_QEMU -- {VALGRIND_QEMU}
 {prefix}PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+{prefix}VIRTUAL_ENV   -- {VIRTUAL_ENV}
 {prefix}"""
 
         args = collections.defaultdict(str, self.get_env())
-- 
2.34.1


