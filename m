Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3F419C5B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:26:24 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuOV-0004Ay-SK
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2Q-0003ir-B2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2N-0003R0-Rs
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhGqr1t891o054kB4FzWFV92AJKwIKbsNyCWXLesBJE=;
 b=QNcJB0zdUKRFG5QWRD74IQ7zdcsFeHQO04Ncd/KY3QtHkHe4l09/GV+mwz+OG8AcFgX+ay
 PWQs3LAootVMJLF1crfaNZHeED6GZkMY4hcZty1IE2YJ5D6yEMmwaODkWr63PgebnDQw3X
 I5yWwfSqJeesyhxSpfTjwhYBmCeIlpU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-uYHX3wC7PxKfz8d3t6Ck_g-1; Mon, 27 Sep 2021 13:03:29 -0400
X-MC-Unique: uYHX3wC7PxKfz8d3t6Ck_g-1
Received: by mail-wr1-f69.google.com with SMTP id
 j15-20020a5d564f000000b00160698bf7e9so1027101wrw.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mhGqr1t891o054kB4FzWFV92AJKwIKbsNyCWXLesBJE=;
 b=aQSFSxRnTequaZ6bNcMUQotMzo4261GMtttK9PHO1t6Lu7PuWbkpKkM7CgWYvpO+VJ
 C/tbeWcYyoh8ln7bmfGdRhUVHo+H9a1PABf5aEBEY3MFsGiEoGYWY97Bc+t24KujcjWS
 MM+6kpnDkVMXffMBWk/W9LqnMeAsqwD3E8Yd3uZKDkNlt66EiBE5UswsFbkvLYTJCuyD
 6NxunE4J5Exe7/ilgSGhhBHXRQWLVn6OLogyqP/jFB0L/H5qSHSKd91iiQ9HRTB2IT8P
 fbAgu+4cz/GHwkkYUdsfc2Tu0MUOPKLBoOgLTyNN5LjCz25aFHtaGcpaeravIa3nXPPB
 OK1Q==
X-Gm-Message-State: AOAM533aqjLJZgJc9xinCm9gPrUc9H9sn4L7NcrZWmMqHCvmVFhQu88o
 3uCtethqbWTKDCfeUQ37StVUnpwBkgj4Bs21PF3P6tZ40IRWyojIzwRNhVtLBnJ+EdiQPtOKthA
 UXrMh8qFSut5Bw875gersvvpiiJKFNoenBHhFUd7Jt2sPeFmnZbr9utgd9peQQnBF
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr167828wmh.20.1632762207824; 
 Mon, 27 Sep 2021 10:03:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMKOcHVjY+iVeK3uGqwijgreU4pdJL73gNLtYP84ICYAfan9yV6aQ+ag2TNcNbV2qulXUcOg==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr167786wmh.20.1632762207511; 
 Mon, 27 Sep 2021 10:03:27 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n26sm50478wmi.43.2021.09.27.10.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] tests/Makefile: allow control over tags during
 check-acceptance
Date: Mon, 27 Sep 2021 19:02:19 +0200
Message-Id: <20210927170227.2014482-14-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210923161141.232208-2-willianr@redhat.com>
---
 docs/devel/testing.rst | 14 ++++++++++++++
 tests/Makefile.include | 12 +++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d3..d1841e35d57 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -732,6 +732,20 @@ available.  On Debian and Ubuntu based systems, depending on the
 specific version, they may be on packages named ``python3-venv`` and
 ``python3-pip``.
 
+It is also possible to run tests based on tags using the
+``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
+variable:
+
+.. code::
+
+   make check-acceptance AVOCADO_TAGS=quick
+
+Note that tags separated with commas have an AND behavior, while tags
+separated by spaces have an OR behavior. For more information on Avocado
+tags, see:
+
+ https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10b..f6484e5b31d 100644
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


