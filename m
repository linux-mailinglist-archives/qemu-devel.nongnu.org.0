Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D32570DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:05:57 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB2TU-0005OH-R1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pr-0000hL-17
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pn-00023B-MB
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657580524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62eiebJ4CRcXipkHxKOY6aVMeIBXkh9jFMURuOSkro4=;
 b=ZCPQSIpkurk2sqtZkLGICFXV2T2Kf6KX4BpMbI8+WepS5uJtlYc0JYsEy9PqWxVBdj3AfG
 +jQaPc1ruf+F9gd2TzvzBHouOVUJ3zRwZyOP5J6WJLjvEItORXez2854N/Mmxjjq2C/B8x
 fih71RWAL9dB4ZWH9ikzarg48ChQiBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-Gu9El7cbNWWaaJF3JEaEzg-1; Mon, 11 Jul 2022 19:02:01 -0400
X-MC-Unique: Gu9El7cbNWWaaJF3JEaEzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C022F802D2C;
 Mon, 11 Jul 2022 23:02:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 299AD2166B26;
 Mon, 11 Jul 2022 23:02:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v3 6/7] iotests: use tests/venv for running tests
Date: Mon, 11 Jul 2022 19:01:54 -0400
Message-Id: <20220711230155.953788-7-jsnow@redhat.com>
In-Reply-To: <20220711230155.953788-1-jsnow@redhat.com>
References: <20220711230155.953788-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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


