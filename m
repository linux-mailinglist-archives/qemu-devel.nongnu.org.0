Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8221D31932E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:34:51 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHjm-0001ha-JZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCs-0004rb-0S
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCS-0005eE-MO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAZY/KRwuvZgnKaY0hTPuUzX0DT3BU++7uCZsd3QIGU=;
 b=Vg9WDrkTUGcKWB98o8VVUjJT08Ztgm9Q7BDOCO+OsxoEFsycLs0OkCpJujx86ZCQ6AUigr
 Yw5mTwtwdy2dcsG/0K+YIC0QN6UEioZvzSLw3EWh/vrRmgC3oOFXRR6LbUpoZ7CriKRn41
 PHoGBakr4AuHxHSPFjHXWoYSeLlTP9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-5hZS-b9FNVGk_qlQkRgOQA-1; Thu, 11 Feb 2021 14:00:08 -0500
X-MC-Unique: 5hZS-b9FNVGk_qlQkRgOQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF51869ECE;
 Thu, 11 Feb 2021 19:00:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2116F134;
 Thu, 11 Feb 2021 18:59:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/24] python: add pytest and tests
Date: Thu, 11 Feb 2021 13:58:52 -0500
Message-Id: <20210211185856.3975616-21-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try using pytest to manage our various tests; even though right now
they're only invoking binaries and not really running any python-native
code.

Create tests/, and add test_lint.py which calls out to mypy, flake8,
pylint and isort to enforce the standards in this directory.

Add pytest to the setup.cfg development dependencies; add a pytest
configuration section as well; run it in verbose mode.

Finally, add pytest to the Pipfile environment and lock the new
dependencies.

Provided you have the right development dependencies (mypy, flake8,
isort, pylint, and now pytest) You should be able to run "pytest" from
the python folder to run all of these linters with the correct
arguments.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock       | 57 ++++++++++++++++++++++++++++++++++++++-
 python/setup.cfg          |  5 ++++
 python/tests/test_lint.py | 28 +++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 python/tests/test_lint.py

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 85b3124a491..0fa1a14a9b2 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -30,6 +30,14 @@
             "markers": "python_version >= '3.5'",
             "version": "==2.4.2"
         },
+        "attrs": {
+            "hashes": [
+                "sha256:31b2eced602aa8423c2aea9c76a724617ed67cf9513173fd3a4f03e3a929c7e6",
+                "sha256:832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==20.3.0"
+        },
         "flake8": {
             "hashes": [
                 "sha256:749dbbd6bfd0cf1318af27bf97a14e28e5ff548ef8e5b1566ccfb25a11e7c839",
@@ -43,9 +51,16 @@
                 "sha256:ace61d5fc652dc280e7b6b4ff732a9c2d40db2c0f92bc6cb74e07b73d53a1771",
                 "sha256:fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
             ],
-            "markers": "python_version < '3.8'",
+            "markers": "python_version < '3.8' and python_version < '3.8'",
             "version": "==3.4.0"
         },
+        "iniconfig": {
+            "hashes": [
+                "sha256:011e24c64b7f47f6ebd835bb12a743f2fbe9a26d4cecaa7f53bc4f35ee9da8b3",
+                "sha256:bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
+            ],
+            "version": "==1.1.1"
+        },
         "isort": {
             "hashes": [
                 "sha256:c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e",
@@ -123,6 +138,30 @@
             ],
             "version": "==0.4.3"
         },
+        "packaging": {
+            "hashes": [
+                "sha256:5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5",
+                "sha256:67714da7f7bc052e064859c05c595155bd1ee9f69f76557e21f051443c20947a"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==20.9"
+        },
+        "pluggy": {
+            "hashes": [
+                "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
+                "sha256:966c145cd83c96502c3c3868f50408687b38434af77734af1e9ca461a4081d2d"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==0.13.1"
+        },
+        "py": {
+            "hashes": [
+                "sha256:21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3",
+                "sha256:3b80836aa6d1feeaa108e046da6423ab8f6ceda6468545ae8d02d9d58d18818a"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==1.10.0"
+        },
         "pycodestyle": {
             "hashes": [
                 "sha256:2295e7b2f6b5bd100585ebcb1f616591b652db8a741695b3d8f5d28bdc934367",
@@ -147,6 +186,22 @@
             "markers": "python_version >= '3.5'",
             "version": "==2.6.0"
         },
+        "pyparsing": {
+            "hashes": [
+                "sha256:c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1",
+                "sha256:ef9d7589ef3c200abe66653d3f1ab1033c3c419ae9b9bdb1240a85b024efc88b"
+            ],
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2'",
+            "version": "==2.4.7"
+        },
+        "pytest": {
+            "hashes": [
+                "sha256:9d1edf9e7d0b84d72ea3dbcdfd22b35fb543a5e8f2a60092dd578936bf63d7f9",
+                "sha256:b574b57423e818210672e07ca1fa90aaf194a4f63f3ab909a2c67ebb22913839"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==6.2.2"
+        },
         "qemu": {
             "editable": true,
             "path": "."
diff --git a/python/setup.cfg b/python/setup.cfg
index 11c361501e8..2c5943277d7 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -26,6 +26,7 @@ devel =
     isort >= 5.0.5
     mypy >= 0.770
     pylint >= 2.6.0
+    pytest >= 3.0.0
 
 
 [flake8]
@@ -73,3 +74,7 @@ include_trailing_comma=True
 line_length=72
 lines_after_imports=2
 multi_line_output=3
+
+[tool:pytest]
+addopts = -v
+console_output_style = count
diff --git a/python/tests/test_lint.py b/python/tests/test_lint.py
new file mode 100644
index 00000000000..38fefa01c66
--- /dev/null
+++ b/python/tests/test_lint.py
@@ -0,0 +1,28 @@
+import subprocess
+
+
+def _external_test(command_line: str) -> None:
+    args = command_line.split(' ')
+    try:
+        subprocess.run(args, check=True)
+    except subprocess.CalledProcessError as err:
+        # Re-contextualize to avoid pytest showing error context inside
+        # the subprocess module itself
+        raise Exception("'{:s}' returned {:d}".format(
+            ' '.join(args), err.returncode)) from None
+
+
+def test_isort() -> None:
+    _external_test('isort -c qemu')
+
+
+def test_flake8() -> None:
+    _external_test('flake8')
+
+
+def test_pylint() -> None:
+    _external_test('pylint qemu')
+
+
+def test_mypy() -> None:
+    _external_test('mypy -p qemu')
-- 
2.29.2


