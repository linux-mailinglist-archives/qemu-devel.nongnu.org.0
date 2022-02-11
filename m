Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E54B29B5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:08:43 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYTS-00032j-12
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOT-0007NK-Bn
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:36 -0500
Received: from [2a00:1450:4864:20::533] (port=38671
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOK-0005AS-NO
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:29 -0500
Received: by mail-ed1-x533.google.com with SMTP id g7so1173183edb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95VUsInsBJkWydqDjFNp5aZcy3HHZ58V16PSGr8vvHk=;
 b=SWCLT1Rl8lgIhNBXbIwPNtQQyLjdUsyR8/Jk/fFedZuER+FRi/LHW94eot9qVlRFFG
 BD/rgKChTBgeH4CSD+4jaMY2v3migqWMbYxTpqiGugzhevXtnpD04EgUDoSJCFTw9Cu6
 Bs4l8fPmYobg4Cucfe5dEpbH+ij9XlJCtbxnvgQ0X+fjvoNh4MtnU62Bkn4nO5txm7lq
 yy5NDzEPvODUQGmdBArG/UIkiOb4zZKE5cJ5ic4jw/1Y9NKaJ+oVVLVaDcnuaG5bWmzk
 uy2U+JQksJ/KOOy5r3hTq3gT/mMic+ua4xmMrOM/W+2GBCPeTuahEBoGCZ2+rXqurQU9
 eGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95VUsInsBJkWydqDjFNp5aZcy3HHZ58V16PSGr8vvHk=;
 b=IxCpEEqx6O9fUz3XnsnSggts6zbVg6XoQHf/FiMpDOtqNX27+G1FteirlbkFdOVHHv
 hRXtLxzUYqnJWmyRoOBtGcl3PJbcOGw37Sf6qiB6jL+hFOgSfdFNTUzzfMdreczR0gJ6
 53z7wHsTs/QTFAnXIMRX/W9vPAgrl13KLoHNoUWsDwWtM29wpQwnMuY+QTD6mqan84yR
 CPevNGA+3EFDUXzKlQLhFZ9vjq2rF8ZC+OifPGdDWLf5C3/lXumrS4NR4H5M06j9k7kZ
 mQSSZUa+V0/Km9uFJ2UyyTdcCzio4b3e6Ve3JG6AWHw+5fLEDZcKWFhjKAp9nL9rrm/n
 xk8w==
X-Gm-Message-State: AOAM533oflu9hdfU3RzGYdm2NzSi2R3HmXg3Z6R1xY2K+qh2uSPrM7ex
 fEdgBAS/lqxhLCIqXqXKR8McQg==
X-Google-Smtp-Source: ABdhPJyYiLlWUQEppovty2zEjiWr8m1wU8ckUKNxt5uHmkv1Fj5tb4AY7XoXZqjCJPcjNLiW2DgUVg==
X-Received: by 2002:a05:6402:4c2:: with SMTP id
 n2mr2555589edw.247.1644595391359; 
 Fri, 11 Feb 2022 08:03:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f16sm7703389eds.0.2022.02.11.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B25611FFB8;
 Fri, 11 Feb 2022 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/11] tests/docker: restore TESTS/IMAGES filtering
Date: Fri, 11 Feb 2022 16:02:59 +0000
Message-Id: <20220211160309.335014-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken in the re-factor:

  e86c9a64f4 ("tests/docker/Makefile.include: add a generic docker-run target")

Rather than unwind the changes just apply the filters to the total set
of available images and tests. That way we don't inadvertently build
images only not to use them later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Williamson <alex.williamson@redhat.com>
---
 tests/docker/Makefile.include | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..0ec59b2193 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -8,13 +8,19 @@ COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
+# These variables can be set by the user to limit the set of docker
+# images and tests to a more restricted subset
+TESTS ?= %
+IMAGES ?= %
+
 DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 # we don't directly build virtual images (they are used to build other images)
 DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
-DOCKER_IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+__IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
 DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
@@ -23,16 +29,14 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-DOCKER_TESTS := $(notdir $(shell \
-	find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+__TESTS := $(notdir $(shell \
+		find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
-TESTS ?= %
-IMAGES ?= %
-
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
 DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
 
@@ -274,8 +278,8 @@ endif
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
-	@echo '    IMAGES="a b c ..":   Filters which images to build or run.'
-	@echo '    TESTS="x y z .."     Filters which tests to run (for docker-test).'
+	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
+	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
 	@echo '                         (default is 1)'
 	@echo '    DEBUG=1              Stop and drop to shell in the created container'
-- 
2.30.2


