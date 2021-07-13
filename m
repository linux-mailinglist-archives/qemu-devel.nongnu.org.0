Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1534A3C787C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:03:20 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PYl-0001Uq-2C
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1m3PWu-00006r-La
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1m3PWs-00038c-CA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626210081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=79JTb//e4TzuVsMOXC2Mg8fRSx6HbK3RF3Ul4caMr/g=;
 b=cZLBystqjGTXWbFhxSehzIQG97tGN8JlH9qedjK9EI26D0nv24VsnPCnVb3ftbuQpzyefs
 xpnQ055iJzTr96qMAYFFNBcg6ttIilaYbC0vR6J4hWWSIUic1dJCzHMyhjBnVgUXb0ugbR
 TnkIfaOnb58O7p5fqTGPKMwyq+w8fR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-YZ2AwtFRMH2f9jyNOXOw8Q-1; Tue, 13 Jul 2021 17:01:19 -0400
X-MC-Unique: YZ2AwtFRMH2f9jyNOXOw8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FE0106B7D6;
 Tue, 13 Jul 2021 21:01:18 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-114-43.rdu2.redhat.com [10.10.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074C41002D71;
 Tue, 13 Jul 2021 21:01:12 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: f4bug@amsat.org, philmd@redhat.com, crosa@redhat.com,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com,
 wainersm@redhat.com
Subject: [PATCH v3] tests/acceptance: allow control over tags during
 check-acceptance
Date: Tue, 13 Jul 2021 18:01:11 -0300
Message-Id: <20210713210111.173349-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although it is possible to run a specific test using the avocado
command-line, a user may want to use a specific tag while running the
``make check-acceptance`` during the development or debugging.

This allows using the AVOCADO_TAGS environment variable where the user
takes total control of which tests should run based on the tags defined.

This also makes the check-acceptance command flexible to restrict tests
based on tags while running on CI.

e.g.:

AVOCADO_TAGS="foo bar baz" make check-acceptance

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 docs/devel/testing.rst | 14 ++++++++++++++
 tests/Makefile.include | 12 +++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4e42392810..a81b44cf18 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -760,6 +760,20 @@ in the current directory, tagged as "quick", run:
 
   avocado run -t quick .
 
+It is also possible to run tests based on tags using the
+``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
+variable:
+
+.. code::
+
+   AVOCADO_TAGS=quick make check-acceptance
+
+Note that tags separated with commas have an AND behavior, while tags
+separated by spaces have an OR behavior. For more information on Avocado
+tags, see:
+
+ https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
+
 The ``avocado_qemu.Test`` base test class
 -----------------------------------------
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index e4dcb17329..0ce331f9a9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -92,7 +92,12 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
-AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
+ifndef AVOCADO_TAGS
+	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
+						 $(filter %-softmmu,$(TARGETS)))
+else
+	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
+endif
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, \
@@ -128,8 +133,9 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
-            $(AVOCADO_TAGS) \
+            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
+			--filter-by-tags-include-empty-key) \
+            $(AVOCADO_CMDLINE_TAGS) \
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
 
-- 
2.31.1


