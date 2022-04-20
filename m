Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560C508FCF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:51:58 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFQj-0004yE-AG
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl2-00025i-Hx
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:53 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl0-0001aC-QR
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id 11so3415222edw.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4kMxiI/J7ThiKm7jqj2osEwODI2N9C6yrJmYiRL+kdA=;
 b=srVJS0e3zG2UQMPzILJFlD1BjnPHnhIiOP9KOp8QdyOKibI+jB1N6ZbjzYDcAdxY1v
 yhVQAIaxw5avk2TAvPpdMb0MmaBgKOH7bDRpPiY2bhVO3308hqSv7VNiuTodPg7+J9A+
 //6dvLH6vzLtNp1qGltyAC6NBqobXz8dA4OOWCy501uppWJvjl5SyXL+YA1z2PUjKR1i
 rA5RBkvs+pe01CLAIiV8HcA+XrO0I4J2lrJATVyOIrHuFe/AKExSGKnFvyZt8gcw/0VC
 KIGR69MQhxD4TUWBGQo9B2vW1cquB6Xw7sfaBmB+BWY+c+KfMclYQMt7xLIqi7trMTW5
 ZmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4kMxiI/J7ThiKm7jqj2osEwODI2N9C6yrJmYiRL+kdA=;
 b=3WMu8JWAvD7iKqZMj6dUjqd2ht71mSZF9j1qz+QDnElKvKZo/6fGt/V9iirD4d7vVJ
 X4tOn3jyOD+Hvt3t+/7IQqLcgot5jsXX15kjudvyBhKuzncwrDQ3CuV0aYHGxAJx7YiD
 qKh9yc9f3k0PSj5TSqgz+fGSvEnIC5AqtqB5iTRZoG5GRTq8AlKjkeN71tj0dmVr6arN
 c1ylANUIbTz3+XZCaq+E/YlmZZ4Mds7zeO0sMRvkaIcPBaEGL0zMr5krSNXZIuNvNgQV
 JikAgeFvGwFnY1UxX1wwxpn+4qPOhc4IOjuCI27TxuGwHRGRk3eeWBDy9ev1DSYT86n3
 6lIA==
X-Gm-Message-State: AOAM530ZqXXdmingIxMlVYmHfVAE7pm87tydvbDZrYjFROZ1e1bzIpKR
 w983QCKfuReoEBMxs7VFuv+UGA==
X-Google-Smtp-Source: ABdhPJx0F4B5oFzYbQSF3BcbOZW/TaINvc4Q5z9ZAQ4KS76GsZY/KS2VxhQnIcXyYGsehIZj97jkzQ==
X-Received: by 2002:aa7:c04e:0:b0:400:4daf:bab1 with SMTP id
 k14-20020aa7c04e000000b004004dafbab1mr24281929edo.101.1650478129414; 
 Wed, 20 Apr 2022 11:08:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a1709063a8100b006efaf54d9c1sm3643228ejd.81.2022.04.20.11.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAE821FFC0;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 08/25] tests/docker: inline variable definitions or move close
 to use
Date: Wed, 20 Apr 2022 19:08:15 +0100
Message-Id: <20220420180832.3812543-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Variables that are defined with ":=" are handled imperatively, so moving
them closer to the first use ensures that all the assignments prior to
the first use are taken into account.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-6-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-9-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 751151d7e9..9b4d1cf837 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -9,26 +9,12 @@ COMMA := ,
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
-# we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11
-# we don't directly build virtual images (they are used to build other images)
-DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain
-__IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
-DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
-DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
-# Use a global constant ccache directory to speed up repetitive builds
-DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
 ifeq ($(HOST_ARCH),x86_64)
 DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-__TESTS := $(notdir $(shell \
-		find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
-DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
-
 ENGINE := auto
-
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
@@ -47,8 +33,6 @@ $(DOCKER_SRC_COPY):
 
 docker-qemu-src: $(DOCKER_SRC_COPY)
 
-docker-image: ${DOCKER_TARGETS}
-
 # General rule for building docker images. If we are a sub-make
 # invoked with SKIP_DOCKER_BUILD we still check the image is up to date
 # though
@@ -96,6 +80,8 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 endif
 
 # Enforce dependencies for composite images
+# we don't run tests on intermediate images (used as base by another image)
+DOCKER_PARTIAL_IMAGES := debian10 debian11
 ifeq ($(HOST_ARCH),x86_64)
 docker-image-debian-amd64: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
@@ -205,6 +191,15 @@ DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
+# images that are only used to build other images
+DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain
+
+__IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
+DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
+
+__TESTS := $(notdir $(shell find $(SRC_PATH)/tests/docker/ -name 'test-*' -type f))
+DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
+
 # Expand all the pre-requistes for each docker image and test combination
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
@@ -263,6 +258,9 @@ docker:
 
 docker-help: docker
 
+# Use a global constant ccache directory to speed up repetitive builds
+DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
+
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
 # docker-test-foo@bar) which will do additional verification.
@@ -308,5 +306,7 @@ docker-run-%: IMAGE = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/
 docker-run-%:
 	@$(MAKE) docker-run TEST=$(CMD) IMAGE=qemu/$(IMAGE)
 
+docker-image: ${DOCKER_IMAGES:%=docker-image-%}
+
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
-- 
2.30.2


