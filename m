Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A33937FD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:31:20 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNb5-0005AY-FG
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNQB-0005Uz-Cn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNQ6-0000wg-9E
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRCyYETljKvt6FPVb1sv2T3S3cerBA1fznZQ5FwYjEk=;
 b=M66C272KDcmrzpCFmuFZ4o4UYAlVwdZWOgfW0AMM3stn04xPJEJhB2/thaDrLj1NnUbOIH
 boL0qBlOxkTLamr9w5DAlgG/T76yrtrGP6DGLU1DkofO+Qs8fmY9D8YlPlIwKcMX/jGpAj
 VIKoAbfqWzuULy4wuOJs0i23s0gn2cM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-kWPwhFKSNHa57OirU_Fbhg-1; Thu, 27 May 2021 17:19:53 -0400
X-MC-Unique: kWPwhFKSNHa57OirU_Fbhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9407D801B13;
 Thu, 27 May 2021 21:19:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF6B65D9C6;
 Thu, 27 May 2021 21:19:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 27/31] python: add avocado-framework and tests
Date: Thu, 27 May 2021 17:17:11 -0400
Message-Id: <20210527211715.394144-28-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try using avocado to manage our various tests; even though right now
they're only invoking shell scripts and not really running any
python-native code.

Create tests/, and add shell scripts which call out to mypy, flake8,
pylint and isort to enforce the standards in this directory.

Add avocado-framework to the setup.cfg development dependencies, and add
avocado.cfg to store some preferences for how we'd like the test output
to look.

Finally, add avocado-framework to the Pipfile environment and lock the
new dependencies. We are using avocado >= 87.0 here to take advantage of
some features that Cleber has helpfully added to make the test output
here *very* friendly and easy to read for developers that might chance
upon the output in Gitlab CI.

[Note: ALL of the dependencies get updated to the most modern versions
that exist at the time of this writing. No way around it that I have
seen. Not ideal, but so it goes.]

Provided you have the right development dependencies (mypy, flake8,
isort, pylint, and now avocado-framework) You should be able to run
"avocado --config avocado.cfg run tests/" from the python folder to run
all of these linters with the correct arguments.

(A forthcoming commit adds the much easier 'make check'.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/README.rst      |  2 ++
 python/Pipfile.lock    |  8 ++++++++
 python/avocado.cfg     | 10 ++++++++++
 python/setup.cfg       |  1 +
 python/tests/flake8.sh |  2 ++
 python/tests/isort.sh  |  2 ++
 python/tests/mypy.sh   |  2 ++
 python/tests/pylint.sh |  2 ++
 8 files changed, 29 insertions(+)
 create mode 100644 python/avocado.cfg
 create mode 100755 python/tests/flake8.sh
 create mode 100755 python/tests/isort.sh
 create mode 100755 python/tests/mypy.sh
 create mode 100755 python/tests/pylint.sh

diff --git a/python/README.rst b/python/README.rst
index 954870973d0..6bd2c6b3547 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -37,6 +37,8 @@ Files in this directory
 -----------------------
 
 - ``qemu/`` Python package source directory.
+- ``tests/`` Python package tests directory.
+- ``avocado.cfg`` Configuration for the Avocado test-runner.
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
   that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index a2cdc1c50ea..6e344f5fadf 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -30,6 +30,14 @@
             "markers": "python_version ~= '3.6'",
             "version": "==2.5.6"
         },
+        "avocado-framework": {
+            "hashes": [
+                "sha256:42aa7962df98d6b78d4efd9afa2177226dc630f3d83a2a7d5baf7a0a7da7fa1b",
+                "sha256:d96ae343abf890e1ef3b3a6af5ce49e35f6bded0715770c4acb325bca555c515"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==88.1"
+        },
         "flake8": {
             "hashes": [
                 "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
diff --git a/python/avocado.cfg b/python/avocado.cfg
new file mode 100644
index 00000000000..10dc6fb6054
--- /dev/null
+++ b/python/avocado.cfg
@@ -0,0 +1,10 @@
+[simpletests]
+# Don't show stdout/stderr in the test *summary*
+status.failure_fields = ['status']
+
+[job]
+# Don't show the full debug.log output; only select stdout/stderr.
+output.testlogs.logfiles = ['stdout', 'stderr']
+
+# Show full stdout/stderr only on tests that FAIL
+output.testlogs.statuses = ['FAIL']
diff --git a/python/setup.cfg b/python/setup.cfg
index 39dc135e601..fd325194901 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -25,6 +25,7 @@ packages =
 [options.extras_require]
 # Run `pipenv lock --dev` when changing these requirements.
 devel =
+    avocado-framework >= 87.0
     flake8 >= 3.6.0
     isort >= 5.1.2
     mypy >= 0.770
diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
new file mode 100755
index 00000000000..51e0788462b
--- /dev/null
+++ b/python/tests/flake8.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m flake8
diff --git a/python/tests/isort.sh b/python/tests/isort.sh
new file mode 100755
index 00000000000..4480405bfb0
--- /dev/null
+++ b/python/tests/isort.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m isort -c qemu/
diff --git a/python/tests/mypy.sh b/python/tests/mypy.sh
new file mode 100755
index 00000000000..5f980f563bb
--- /dev/null
+++ b/python/tests/mypy.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m mypy -p qemu
diff --git a/python/tests/pylint.sh b/python/tests/pylint.sh
new file mode 100755
index 00000000000..4b10b34db7c
--- /dev/null
+++ b/python/tests/pylint.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m pylint qemu/
-- 
2.31.1


