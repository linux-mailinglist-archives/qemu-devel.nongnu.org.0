Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BBD3BDDCA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:08:46 +0200 (CEST)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qR2-0001CU-V8
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1m0qPM-0000Sa-ND
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1m0qPK-0003WB-Ab
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625598417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YyhG+M8nVcpsAVybwnL3VozwfpwR/4r5MJhaBcsug+8=;
 b=REZ6qh6M7wWW9aTxBxj2knmZ2Dea1hgCzYCRllQxJGN0TAUyrvNWF3nRq9J5fzYQRPCgkT
 oalV4fKK/uZkRSZWmhoNUJmDzTAcNe+YxXWdYy2Qsnc3BqpEbxWmJXC9gCB8l2sXPMZ4uQ
 5fu8gmcccREoO3ALxnYn5DqyaXTgePw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-EL3LjK8MNwGpKXjPDt21PA-1; Tue, 06 Jul 2021 15:06:56 -0400
X-MC-Unique: EL3LjK8MNwGpKXjPDt21PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F85980414B;
 Tue,  6 Jul 2021 19:06:55 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-114-66.rdu2.redhat.com [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9285D703;
 Tue,  6 Jul 2021 19:06:48 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: alex.bennee@linaro.org, f4bug@amsat.org, crosa@redhat.com,
 thuth@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com
Subject: [PATCH] tests/acceptance: allow control over tags during
 check-acceptance
Date: Tue,  6 Jul 2021 16:06:46 -0300
Message-Id: <20210706190646.209440-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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

This allows using the TAGS environment variable where the user takes
total control of which tests should run based on the tags defined.

This also makes the check-acceptance command flexible to restrict tests
based on tags while running on CI.

e.g.:

TAGS="foo bar baz" make check-acceptance

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst |  7 +++++++
 tests/Makefile.include | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4e42392810..6e03c3449b 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -760,6 +760,13 @@ in the current directory, tagged as "quick", run:
 
   avocado run -t quick .
 
+It is also possible to run tests based on tags using the
+``make check-acceptance`` command and the ``TAGS`` environment variable:
+
+.. code::
+
+   TAGS=quick make check-acceptance
+
 The ``avocado_qemu.Test`` base test class
 -----------------------------------------
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8f220e15d1..5869ab8a04 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -92,7 +92,11 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
-AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
+ifndef TAGS
+	AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
+else
+	AVOCADO_TAGS=$(addprefix -t , $(TAGS))
+endif
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, \
@@ -125,10 +129,12 @@ get-vm-image-fedora-31-%: check-venv
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
 check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+	@echo "AVOCADO_TAGS $(AVOCADO_TAGS)"
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
+            $(if $(TAGS),, --filter-by-tags-include-empty \
+			--filter-by-tags-include-empty-key) \
             $(AVOCADO_TAGS) \
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
-- 
2.31.1


