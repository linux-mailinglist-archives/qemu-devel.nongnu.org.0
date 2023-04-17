Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E446E4A33
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP8z-0000y9-2y; Mon, 17 Apr 2023 09:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8k-0000tZ-Uh
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8i-0006NM-QO
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so781990f8f.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739006; x=1684331006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9n1yCkab3nqvFJeat8PsO+uayv0uqVeYCdXKnT6Q+k=;
 b=NCUZEv2FuMvvKC5FvkHpWFoWTBaQPxihC8LuWNODAiZo8bMc2MJ/5qjMTbvbu8hCxc
 sg8MMoChZP7bxT8NYaeyaygv1TXe8LOVZJnYW4980TrCpwTX+hRl5UTAe6fmMR5txKFq
 DBak+lzhSjNVizYcqdPTY18VhXMPdc4PwT+qY5YS6SI3sZGc8y3mdiWxGHuMjkhfrgJe
 rWQQIG8qFpqPGxV6bA3NBwqxmc3fuh/dhbiwc0enXxPCuTyiRjsxAZZPNhRWaAidCA2o
 +EXCquay3HEgs/oI9bP3IBetguAg1tw49A4s6mJGubAIclS2M92moQqoTqcF6HAmh89L
 mtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739006; x=1684331006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9n1yCkab3nqvFJeat8PsO+uayv0uqVeYCdXKnT6Q+k=;
 b=jXlJ38dBGWf5nJtl7XMfDWQlnlUklxtycy0MyzLAfScW69cPmDdbz+6DwILJugOucW
 7TEby0JfXyCoNzSFAJgDtaGpKDdIxfsjyr+M9nTJJ9LAJl4qhmom4IPv92qnYcw9aSo9
 8yZfQxKN1AI1bzBJ+ia0XexC/HsY64abNtGdrmk1qMyJ2FVAnL6RbTM5yTc5/srw3Efo
 QG7VmmYn+IR+QJKAp87KAxsP8jW2b6SsceauUn1OsPhwakKvSLpYt1Fpdf2IQOqOh3SK
 ENZtjrjo4SAj6pAMWUjTIvW51LJcmQTGhra4FDNw5f364af4A2G7Q7JmfE6uX7yuercA
 ugPg==
X-Gm-Message-State: AAQBX9fu1WUlgtHuxv/4uC2+EnysZe2cbnP+u0U1nXJQUY84SiG3uSoT
 q5AiAGQsFonaX5dWSTHl4WSpFQ==
X-Google-Smtp-Source: AKy350bzobH/fwC/F5hiP3NCoZuvZ+Q9l8g1L0cQQ+762WwJ8ccw4QS2br6+qOX9/YSTXiBiwr5Xag==
X-Received: by 2002:a5d:45c8:0:b0:2f6:620f:92ca with SMTP id
 b8-20020a5d45c8000000b002f6620f92camr5268382wrs.23.1681739006125; 
 Mon, 17 Apr 2023 06:43:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adfe544000000b002f6dafef040sm8820388wrm.12.2023.04.17.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8C411FFB8;
 Mon, 17 Apr 2023 14:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Subject: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Mon, 17 Apr 2023 14:43:16 +0100
Message-Id: <20230417134321.3627231-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


