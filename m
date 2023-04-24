Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E406EC8B6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:23:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsPR-00074K-9P; Mon, 24 Apr 2023 05:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPO-000729-5m
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:54 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPM-0004jv-6y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so10495885e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328170; x=1684920170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKJ6jFTTTSxD6Aty0rAW8PYU4/632z+CMGqhH5MMkms=;
 b=ilz9bhQ38wsEoy4GCgG1j4/fd5ahzhxGLrPR6jUiKYXcQQwOHcJ8a4/XTQB8z1NrR6
 j9+iRpmE5VtK9XGKoSOw+BVQyj8PzKoWv3w3WgrL1ycJa8I4NALvne6lxTiBgOeMCe//
 4fcaUvkTcIjtdS3S+miFTu7FxmnYE72h49qbPLLkhiPD2xIuYlauX4F06k7cuyBcOQI3
 wtmc8Cw/c2Au5W4QD7mByU5mSGyXUkXJmcnh+4EoVdh/cSQaTX54RGdaXAAGY7aRGWgX
 yQgbmhwY0t58mWMd01PsOXIWZWZzCG9YvNX8a31wYu0rQXMhz2PZs/B9aJUDwKE63Oyt
 zM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328170; x=1684920170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKJ6jFTTTSxD6Aty0rAW8PYU4/632z+CMGqhH5MMkms=;
 b=NTr2ZYf5+4intUytiEMI/X9TEf7SmREwEXSq3orVMLogSeGOTAbIkn6n18NZB4ml0P
 a/Vq0JGv+IUD0C1TD299Q8ZDGBDWrzgab/pYY+nuiIDR5ieMcfIQ5IttjLZlZoBrdwD1
 PfQ6KZxyIVttC6ImZmJt8bB8ESSvbHNtKTgbmdcYwJuzV8Z2LlI5DZyGFB56PBN9y9CT
 dA7tGkeW5Z4UOsCv9qv9tvAlnpJicV45jPd6f98VcdyALFXa9YCpqhjMqx1SEKNgZln/
 KqjaobknRL4DlcLxAQXTEf3nL8dAnHWVSaoG6BvBDlTuy07XxVwz0xUrxguNhs1ay9hH
 7lgg==
X-Gm-Message-State: AAQBX9ewfEFaAxmBN9QMlLP7oonGQjjjSXwH9b+JFY4qCcdjPFaaZHFW
 LB6mztt2/0yQlXwVNLYnp+iyzg==
X-Google-Smtp-Source: AKy350Z6XQbPKms9s8usm6kT0sBbYRuNksPeXBCjDnFJQiXwsVtBJYotvlUtMEyMVlcJi50xQ7BByQ==
X-Received: by 2002:a7b:cc8f:0:b0:3f1:819d:d050 with SMTP id
 p15-20020a7bcc8f000000b003f1819dd050mr7046909wma.37.1682328170545; 
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hg7-20020a05600c538700b003f1940fe278sm8182665wmb.7.2023.04.24.02.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 954F61FFB8;
 Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Subject: [PATCH 01/18] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Mon, 24 Apr 2023 10:22:32 +0100
Message-Id: <20230424092249.58552-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Avocado version 101.0 has a fix to re-compute the checksum
of an asset file if the algorithm used in the *-CHECKSUM
file isn't the same as the one being passed to it by the
avocado user (i.e. the avocado_qemu python module).
In the earlier avocado versions this fix wasn't there due
to which if the checksum wouldn't match the earlier
checksum (calculated by a different algorithm), the avocado
code would start downloading a fresh image from the internet
URL thus making the test-cases take longer to execute.

Bump up the avocado-framework version to 101.0.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230417134321.3627231-2-alex.bennee@linaro.org>
Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>

---
v2
  - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
---
 tests/Makefile.include | 18 +++++++++++-------
 tests/requirements.txt |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..a4de0ad5a2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
+JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
+
 check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
-	$(call quiet-command, \
-            $(TESTS_PYTHON) -m avocado \
-            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
-			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
+	$(call quiet-command, 							\
+            $(TESTS_PYTHON) -m avocado 						\
+            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) 	\
+            $(if $(AVOCADO_TAGS),, 						\
+			--filter-by-tags-include-empty 				\
+			--filter-by-tags-include-empty-key) 			\
+		--max-parallel-tasks $(JOBS_OPTION:-j%=%) 			\
+            $(AVOCADO_CMDLINE_TAGS) 						\
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 			\
             "AVOCADO", "tests/avocado")
 
 check-acceptance-deprecated-warning:
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..a6f73da681 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,5 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+avocado-framework==101.0
 pycdlib==1.11.0
-- 
2.39.2


