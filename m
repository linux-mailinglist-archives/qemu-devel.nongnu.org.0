Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EAC393B93
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:48:50 +0200 (CEST)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSYL-00010v-8A
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLg-0007Q6-UX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLd-0001Q6-JX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Cid2oV60HVOAdxzZjB4E/hQeFnf1Jt3PSSl9wW/Qb0=;
 b=GjREPZCzItcEgIWFQmdmvWxbEyYXroC5lvq71JBHyQWcq9Mkv2Ed69wAKcBZP44W9IA9xe
 cFd42YBbjLG/cnIZL/GUzZLjlOPve5BjElQKJ3F4ZQhrOg1+KzSvLbCstYN/WCEgEb/nGB
 NzbD9Gou6let71qfuZPtvLpkhw247AY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-hs_I7jCZPtCDmfDm_LHm1w-1; Thu, 27 May 2021 22:35:38 -0400
X-MC-Unique: hs_I7jCZPtCDmfDm_LHm1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 890DC107ACCA;
 Fri, 28 May 2021 02:35:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6BC19D9B;
 Fri, 28 May 2021 02:35:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/44] python: add tox support
Date: Thu, 27 May 2021 22:32:19 -0400
Message-Id: <20210528023220.417057-44-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is intended to be a manually run, non-CI script.

Use tox to test the linters against all python versions from 3.6 to
3.10. This will only work if you actually have those versions installed
locally, but Fedora makes this easy:

> sudo dnf install python3.6 python3.7 python3.8 python3.9 python3.10

Unlike the pipenv tests (make venv-check), this pulls "whichever"
versions of the python packages, so they are unpinned and may break as
time goes on. In the case that breakages are found, setup.cfg should be
amended accordingly to avoid the bad dependant versions, or the code
should be amended to work around the issue.

With confidence that the tests pass on 3.6 through 3.10 inclusive, add
the appropriate classifiers to setup.cfg to indicate which versions we
claim to support.

Tox 3.18.0 or above is required to use the 'allowlist_externals' option.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-31-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore |  1 +
 python/Makefile   |  7 ++++++-
 python/setup.cfg  | 23 ++++++++++++++++++++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/python/.gitignore b/python/.gitignore
index 4ed144ceac3..272ed223a84 100644
--- a/python/.gitignore
+++ b/python/.gitignore
@@ -13,3 +13,4 @@ qemu.egg-info/
 
 # virtual environments (pipenv et al)
 .venv/
+.tox/
diff --git a/python/Makefile b/python/Makefile
index a9da1689558..b5621b0d540 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -16,6 +16,8 @@ help:
 	@echo ""
 	@echo "make check:      run linters using the current environment."
 	@echo ""
+	@echo "make check-tox:  run linters using multiple python versions."
+	@echo ""
 	@echo "make clean:      remove package build output."
 	@echo ""
 	@echo "make distclean:  remove venv files, qemu package forwarder,"
@@ -36,8 +38,11 @@ develop:
 check:
 	@avocado --config avocado.cfg run tests/
 
+check-tox:
+	@tox
+
 clean:
 	python3 setup.py clean --all
 
 distclean: clean
-	rm -rf qemu.egg-info/ .venv/ dist/
+	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
diff --git a/python/setup.cfg b/python/setup.cfg
index fd325194901..0fcdec6f322 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -14,6 +14,11 @@ classifiers =
     Natural Language :: English
     Operating System :: OS Independent
     Programming Language :: Python :: 3 :: Only
+    Programming Language :: Python :: 3.6
+    Programming Language :: Python :: 3.7
+    Programming Language :: Python :: 3.8
+    Programming Language :: Python :: 3.9
+    Programming Language :: Python :: 3.10
 
 [options]
 python_requires = >= 3.6
@@ -30,12 +35,13 @@ devel =
     isort >= 5.1.2
     mypy >= 0.770
     pylint >= 2.8.0
-
+    tox >= 3.18.0
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
           .venv,
+          .tox,
 
 [mypy]
 strict = True
@@ -79,3 +85,18 @@ include_trailing_comma=True
 line_length=72
 lines_after_imports=2
 multi_line_output=3
+
+# tox (https://tox.readthedocs.io/) is a tool for running tests in
+# multiple virtualenvs. This configuration file will run the test suite
+# on all supported python versions. To use it, "pip install tox" and
+# then run "tox" from this directory. You will need all of these versions
+# of python available on your system to run this test.
+
+[tox:tox]
+envlist = py36, py37, py38, py39, py310
+
+[testenv]
+allowlist_externals = make
+deps = .[devel]
+commands =
+    make check
-- 
2.31.1


