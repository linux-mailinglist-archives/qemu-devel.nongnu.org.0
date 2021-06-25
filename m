Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5993B4708
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:54:43 +0200 (CEST)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwoAE-0000t8-Uv
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo2A-00011k-Bj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo28-0007eJ-HA
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CT7xTsLD4E82BqA9SUG2cEu4XlCRWgWwOFMgmQGblkA=;
 b=LA+ATjUsALtiZF7hsGetPlV2geneB0AwKEUw5bDKCBwAZ6t+6bW3XTZJdCLtjM2G2CldyJ
 3N9//qAVyAPkOUtclLdl0dkTSwdLg12KtMEradtXbYJzu7yAxHfEfa168Y0+ZAIw9zucs7
 Fixv1q0VSn8uFIqhTOkF9BMz6MoVhHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-IqeANhpoM4mtF5hRNh3xtA-1; Fri, 25 Jun 2021 11:46:18 -0400
X-MC-Unique: IqeANhpoM4mtF5hRNh3xtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AEA4800D55;
 Fri, 25 Jun 2021 15:46:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CB1126E68;
 Fri, 25 Jun 2021 15:46:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] python: add 'make check-venv' invocation
Date: Fri, 25 Jun 2021 11:45:37 -0400
Message-Id: <20210625154540.783306-9-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-1-jsnow@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a *third* way to run the Python tests. Unlike the first two
(check-pipenv, check-tox), this version does not require any specific
interpreter version -- making it a lot easier to tell people to run it
as a quick smoketest prior to submission to GitLab CI.

Summary:

  Checked via GitLab CI:
    - check-pipenv: tests our oldest python & dependencies
    - check-tox: tests newest dependencies on all non-EOL python versions
  Executed only incidentally:
    - check-venv: tests newest dependencies on whichever python version

('make check' does not set up any environment at all, it just runs the
tests in your current environment. All four invocations perform the
exact same tests, just in different execution environments.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 5cb8378b81..76bb24e671 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,4 +1,6 @@
-.PHONY: help pipenv check-pipenv check clean distclean develop
+.PHONY: help pipenv venv check-venv check-pipenv check clean distclean develop
+
+QEMU_VENV_DIR=~/.cache/qemu-pyvenv
 
 help:
 	@echo "python packaging help:"
@@ -15,6 +17,11 @@ help:
 	@echo "    Requires: Python 3.6-3.10 and tox."
 	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
 	@echo ""
+	@echo "make check-venv:"
+	@echo "    Run tests in a venv against your default python3 version."
+	@echo "    These tests use the newest dependencies."
+	@echo "    Requires: Python 3.x"
+	@echo ""
 	@echo "make develop:    Install deps for 'make check', and"
 	@echo "                 the qemu libs in editable/development mode."
 	@echo ""
@@ -23,6 +30,9 @@ help:
 	@echo "make pipenv"
 	@echo "    Creates pipenv's virtual environment (.venv)"
 	@echo ""
+	@echo "make venv"
+	@echo "    Creates a simple venv for check-venv. ($(QEMU_VENV_DIR))"
+	@echo ""
 	@echo "make clean:      remove package build output."
 	@echo ""
 	@echo "make distclean:  remove venv files, qemu package forwarder,"
@@ -37,8 +47,27 @@ pipenv: .venv
 check-pipenv: pipenv
 	@pipenv run make check
 
+venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
+$(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
+	@echo "VENV $(QEMU_VENV_DIR)"
+	@python3 -m venv $(QEMU_VENV_DIR)
+	@(							\
+		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
+		. $(QEMU_VENV_DIR)/bin/activate;		\
+		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
+		make develop 1>/dev/null;			\
+	)
+	@touch $(QEMU_VENV_DIR)
+
+check-venv: venv
+	@(							\
+		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
+		. $(QEMU_VENV_DIR)/bin/activate;		\
+		make check;					\
+	)
+
 develop:
-	pip3 install -e .[devel]
+	pip3 install --disable-pip-version-check -e .[devel]
 
 check:
 	@avocado --config avocado.cfg run tests/
@@ -50,4 +79,4 @@ clean:
 	python3 setup.py clean --all
 
 distclean: clean
-	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
+	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
-- 
2.31.1


