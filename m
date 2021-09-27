Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4A419BAD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:20:14 +0200 (CEST)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuIX-0004Gr-8b
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2a-0003qD-B9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2Y-0003Ye-IS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgeLl83LUv4CVvYnrCBYDZZxrjbLUE14bcfIj+YK0Kw=;
 b=M70oJL+A6ZofEZ7R3lHP0bskenxmv1RTY71Y3aSEs8HXS8q3dGkImu0YJ4GI0gnBVxX/Sb
 xiU8ClsrGqwhpfBabr4uw1789HQNAwTS1TPMJP0njEesBxqRU3u8tGLnEwT+15v8vXgaNQ
 fhThkCqyYJ0OkHEfaYdvyXsoy95IS4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-GaLBppAmOfm2ytR73cheqg-1; Mon, 27 Sep 2021 13:03:38 -0400
X-MC-Unique: GaLBppAmOfm2ytR73cheqg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so507859wmc.2
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgeLl83LUv4CVvYnrCBYDZZxrjbLUE14bcfIj+YK0Kw=;
 b=xABcoiMhZT1BcnrDlI6fFeKd+93TBv/nUjtJgdXf0ZsYowRaD1tbrMr+PdG17g346g
 Ja6oQsklFgbvOgj3q/VSgGpBLG3N/nhchAtjUOi5I3bDdk0dM42EQTtM6R76cm9qVO4L
 hnP6YZz06sLfHBi2N2L76FsQtqAuDgyMHqhiPvzyc1uv+3Vkiv1pu4XdU1JGI3Lq9SNi
 bjVLNUeBs0BJjVmXTidjDWXFA4VklNhrxAKHvlHv9zat5L1l2hcKdgNFlYwFR76yi2z9
 upAk9fGJb8exWV5Lafwi5mpbNb95Hh0TCO9n+rmhPweEbL7JPSMuS6A5voc3ADpy6aho
 yEdg==
X-Gm-Message-State: AOAM5334dXY/OB72w8dTDxb1JkX4quiFhbb/yd+OJzQW6RslNS7zawsR
 AAJhhu1JnDyOMVss2MeygyaZVYVVETaiNtj8hnwaiUWfM5KcWwOLCo0BjUvcEr7Vk6i73zjzcN4
 XU4rTN1axHpEMgf6bghGrAU00m1s0Qd/+2xZr4mOQDhmfMVyvzmcRMAYnTiWO3lRz
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr1090772wrb.274.1632762216640;
 Mon, 27 Sep 2021 10:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+OwjWfoekY1VQfr9O1kNEpxkhgyRUbg4RaZUUeavoYB3slCDNxHm7H0iyO9nKlFtWH5tXQA==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr1090734wrb.274.1632762216371;
 Mon, 27 Sep 2021 10:03:36 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u5sm18576902wrg.57.2021.09.27.10.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] tests/Makefile: add AVOCADO_TESTS option to make
 check-acceptance
Date: Mon, 27 Sep 2021 19:02:21 +0200
Message-Id: <20210927170227.2014482-16-philmd@redhat.com>
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Add the possibility of running all the tests from a single file, or
multiple files, running a single test within a file or multiple tests
within multiple files using `make check-acceptance` and the
AVOCADO_TESTS environment variable.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210923161141.232208-4-willianr@redhat.com>
---
 docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
 tests/Makefile.include |  5 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index c9f6b97f876..64c97447956 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -746,6 +746,33 @@ tags, see:
 
  https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
 
+To run a single test file, a couple of them, or a test within a file
+using the ``make check-acceptance`` command, set the ``AVOCADO_TESTS``
+environment variable with the test files or test names. To run all
+tests from a single file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS=$FILEPATH
+
+The same is valid to run tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS='$FILEPATH1 $FILEPATH2'
+
+To run a single test within a file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS=$FILEPATH:$TESTCLASS.$TESTNAME
+
+The same is valid to run single tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f6484e5b31d..e69c4fae53e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+ifndef AVOCADO_TESTS
+	AVOCADO_TESTS=tests/acceptance
+endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
@@ -136,7 +139,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/acceptance")
 
 # Consolidated targets
-- 
2.31.1


