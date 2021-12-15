Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79356476458
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:12:08 +0100 (CET)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbZF-0004GG-W8
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVa-0002Mm-LH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVX-0006Wd-LQ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QqEykcf5R7WqKIajTVv15J/QOBDgnpjVdT4Ag8JfWw=;
 b=SaSjg1HawkfdIaIJsz+Uyx8NUQxQJub0pFpi/4CVmQ8y1FCIs68yTGblTw94CuzwVXz55m
 yzsjvP9FuvPFXVBSHZYOwW5yBMCD3OH2SomD5GCjnSMAduwodyMqEmQ36ALSF1Q5AmzCE1
 h9eNunDn6J/GwVNJmHoXuU1VJ6mjKZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-acXw4jNqO6q00ZB4JQv2uQ-1; Wed, 15 Dec 2021 16:08:12 -0500
X-MC-Unique: acXw4jNqO6q00ZB4JQv2uQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A2F510151E0;
 Wed, 15 Dec 2021 21:08:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A99235F4E1;
 Wed, 15 Dec 2021 21:07:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 01/24] Fork qemu.qmp from qemu.git
Date: Wed, 15 Dec 2021 16:06:11 -0500
Message-Id: <20211215210634.3779791-2-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split python/ from qemu.git, using these commands:

> git subtree split -P python/ -b python-split-v2
> mkdir ~/src/tmp
> cd ~/src/tmp
> git clone --no-local --branch python-split-v2 --single-branch ~/src/qemu
> cd qemu
> git filter-repo --path qemu/machine/           \
                  --path qemu/utils/             \
                  --path tests/iotests-mypy.sh   \
                  --path tests/iotests-pylint.sh \
                  --invert-paths

This commit performs some minimum cleanup to reflect the deletion of the
other subpackages. It is not intended to be exhaustive, and further
edits are made in forthcoming commits.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitignore |  2 +-
 Makefile   | 16 ++++++++--------
 setup.cfg  | 24 +-----------------------
 setup.py   |  2 +-
 4 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/.gitignore b/.gitignore
index 904f324..b071f02 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,7 +5,7 @@
 # python packaging
 build/
 dist/
-qemu.egg-info/
+qemu.qmp.egg-info/
 
 # editor config
 .idea/
diff --git a/Makefile b/Makefile
index 3334311..a2d2f2c 100644
--- a/Makefile
+++ b/Makefile
@@ -30,7 +30,7 @@ help:
 	@echo ""
 	@echo "make develop:"
 	@echo "    Install deps needed for for 'make check',"
-	@echo "    and install the qemu package in editable mode."
+	@echo "    and install the qemu.qmp package in editable mode."
 	@echo "    (Can be used in or outside of a venv.)"
 	@echo ""
 	@echo "make pipenv"
@@ -43,7 +43,7 @@ help:
 	@echo "    Remove package build output."
 	@echo ""
 	@echo "make distclean:"
-	@echo "    remove pipenv/venv files, qemu package forwarder,"
+	@echo "    remove pipenv/venv files, qemu.qmp package forwarder,"
 	@echo "    built distribution files, and everything from 'make clean'."
 	@echo ""
 	@echo -e "Have a nice day ^_^\n"
@@ -64,11 +64,11 @@ dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
 $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
 	@echo "VENV $(QEMU_VENV_DIR)"
 	@python3 -m venv $(QEMU_VENV_DIR)
-	@(							\
-		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
-		. $(QEMU_VENV_DIR)/bin/activate;		\
-		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
-		make develop 1>/dev/null;			\
+	@(								\
+		echo "ACTIVATE $(QEMU_VENV_DIR)";			\
+		. $(QEMU_VENV_DIR)/bin/activate;			\
+		echo "INSTALL qemu.qmp[devel] $(QEMU_VENV_DIR)";	\
+		make develop 1>/dev/null;				\
 	)
 	@touch $(QEMU_VENV_DIR)
 
@@ -106,6 +106,6 @@ clean:
 
 .PHONY: distclean
 distclean: clean
-	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
+	rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
 	rm -f .coverage .coverage.*
 	rm -rf htmlcov/
diff --git a/setup.cfg b/setup.cfg
index 911ae02..9999bca 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -1,5 +1,5 @@
 [metadata]
-name = qemu
+name = qemu.qmp
 version = file:VERSION
 maintainer = QEMU Developer Team
 maintainer_email = qemu-devel@nongnu.org
@@ -25,8 +25,6 @@ classifiers =
 python_requires = >= 3.6
 packages =
     qemu.qmp
-    qemu.machine
-    qemu.utils
 
 [options.package_data]
 * = py.typed
@@ -38,7 +36,6 @@ packages =
 devel =
     avocado-framework >= 90.0
     flake8 >= 3.6.0
-    fusepy >= 2.0.4
     isort >= 5.1.2
     mypy >= 0.770
     pylint >= 2.8.0
@@ -47,10 +44,6 @@ devel =
     urwid-readline >= 0.13
     Pygments >= 2.9.0
 
-# Provides qom-fuse functionality
-fuse =
-    fusepy >= 2.0.4
-
 # AQMP TUI dependencies
 tui =
     urwid >= 2.1.2
@@ -59,13 +52,6 @@ tui =
 
 [options.entry_points]
 console_scripts =
-    qom = qemu.utils.qom:main
-    qom-set = qemu.utils.qom:QOMSet.entry_point
-    qom-get = qemu.utils.qom:QOMGet.entry_point
-    qom-list = qemu.utils.qom:QOMList.entry_point
-    qom-tree = qemu.utils.qom:QOMTree.entry_point
-    qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
-    qemu-ga-client = qemu.utils.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
     aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
 
@@ -79,19 +65,12 @@ python_version = 3.6
 warn_unused_configs = True
 namespace_packages = True
 
-[mypy-qemu.utils.qom_fuse]
-# fusepy has no type stubs:
-allow_subclassing_any = True
-
 [mypy-qemu.qmp.aqmp_tui]
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
 # The following missing import directives are because these libraries do not
 # provide type stubs. Allow them on an as-needed basis for mypy.
-[mypy-fuse]
-ignore_missing_imports = True
-
 [mypy-urwid]
 ignore_missing_imports = True
 
@@ -160,7 +139,6 @@ skip_missing_interpreters = true
 allowlist_externals = make
 deps =
     .[devel]
-    .[fuse]  # Workaround to trigger tox venv rebuild
     .[tui]   # Workaround to trigger tox venv rebuild
 commands =
     make check
diff --git a/setup.py b/setup.py
index 2014f81..cb9b9b6 100755
--- a/setup.py
+++ b/setup.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 """
-QEMU tooling installer script
+QEMU QMP library installer script
 Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
 """
 
-- 
2.31.1


