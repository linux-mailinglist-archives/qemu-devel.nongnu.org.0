Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5037EFC1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:24:48 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyDf-0005mA-E9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3N-0003Ub-D3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3K-0006dh-Oa
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FzIKURpsqZ3TSf4kY7UvPCyHHFgsH9EB61F9nGN/4Q=;
 b=fJVJG0VyjuDoCKa7vG91u5s2pjaXlIrh0ToIq3cLoNsEM0wXNkzR/7WIjIlGeh8k1QpViS
 n2PlcURYv8H46YgbT1xOnShkbryRZJXH729EKz5/ETkqz4Cqc24yEFws/Q9Zrsj+jI601k
 wMqgu3uZnpDVEh04bRAX5v/FROkd2FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-lV6O0CGnMQ2jAn5eDbAqsw-1; Wed, 12 May 2021 19:14:03 -0400
X-MC-Unique: lV6O0CGnMQ2jAn5eDbAqsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94C33107ACCD;
 Wed, 12 May 2021 23:14:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EDE5629DA;
 Wed, 12 May 2021 23:14:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/25] python: add tox support
Date: Wed, 12 May 2021 19:12:41 -0400
Message-Id: <20210512231241.2816122-26-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

This is intended to be a manually run, non-CI script.

Use tox to test the linters against all python versions from 3.6 to
3.9. This will only work if you actually have those versions installed
locally, but Fedora makes this easy:

> sudo dnf install python36 python37 python38 python39

Unlike the pipenv tests (make venv-check), this pulls "whichever"
versions of the python packages, so they are unpinned and may break as
time goes on. In the case that breakages are found, setup.cfg should be
amended accordingly to avoid the bad dependant versions, or the code
should be amended to work around the issue.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst |  2 ++
 python/.gitignore |  1 +
 python/Makefile   |  7 ++++++-
 python/setup.cfg  |  1 +
 python/tox.ini    | 13 +++++++++++++
 5 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 python/tox.ini

diff --git a/python/README.rst b/python/README.rst
index 3e09d20c23c..7360dee32be 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -49,3 +49,5 @@ Files in this directory
   this package; it is referenced by ``setup.cfg``.
 - ``setup.cfg`` houses setuptools package configuration.
 - ``setup.py`` is the setuptools installer used by pip; See above.
+- ``tox.ini`` houses configuration for tox, which runs tests against
+  several Python versions to test compatibility.
diff --git a/python/.gitignore b/python/.gitignore
index e27c99e009c..d92e3f4bcca 100644
--- a/python/.gitignore
+++ b/python/.gitignore
@@ -17,3 +17,4 @@ qemu.egg-info/
 
 # virtual environments (pipenv et al)
 .venv/
+.tox/
diff --git a/python/Makefile b/python/Makefile
index 184f59e5634..a01db823318 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -16,6 +16,8 @@ help:
 	@echo ""
 	@echo "make check:      run linters using the current environment."
 	@echo ""
+	@echo "make check-tox:  run linters using multiple python versions."
+	@echo ""
 	@echo "make clean:      remove build output."
 	@echo ""
 	@echo "make distclean:  remove venv files, qemu package forwarder, and"
@@ -35,8 +37,11 @@ develop:
 check:
 	@avocado --config avocado.cfg run tests/
 
+check-tox:
+	@tox
+
 clean:
 	rm -rf build/ dist/
 
 distclean: clean
-	rm -rf qemu.egg-info/ .venv/
+	rm -rf qemu.egg-info/ .venv/ .tox/
diff --git a/python/setup.cfg b/python/setup.cfg
index 364b68434ca..a7c5f636790 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -33,6 +33,7 @@ devel =
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
           .venv,
+          .tox,
 
 [mypy]
 strict = True
diff --git a/python/tox.ini b/python/tox.ini
new file mode 100644
index 00000000000..d8fe503b477
--- /dev/null
+++ b/python/tox.ini
@@ -0,0 +1,13 @@
+# tox (https://tox.readthedocs.io/) is a tool for running tests
+# in multiple virtualenvs. This configuration file will run the
+# test suite on all supported python versions. To use it, "pip install tox"
+# and then run "tox" from this directory.
+
+[tox]
+envlist = py36, py37, py38, py39
+
+[testenv]
+allowlist_externals = make
+deps = .[devel]
+commands =
+    make check
-- 
2.30.2


