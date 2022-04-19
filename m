Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFE5067FA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:45:08 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkPz-0000iG-7Z
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsf-0005U1-CA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsb-0008Qb-VV
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:40 -0400
Received: by mail-ej1-x633.google.com with SMTP id bv19so31558612ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOTdPMfiJ0IUi0HgJCXW9YZN9R1b3B+6g06XKM9Ro7Q=;
 b=Mo7oAKE8umEWDHyflv0F0C3+dAiGTUIvOAXQfPNpHdmh/J8up7BVHsnoy9DtQa2gf9
 qxHt71bjHAjeVLuvyGNf/aeM9xr17JrzlgQUPBPb22tMywZw1f4JkXQ3cQRKagQOiLOb
 MhpZnEk+K3PGXYkQu5XdrUVyDQfQeVUk+lR9JyMChMHWNnsshRBUvr7Ijb9BBE/vkME6
 M0FoJkbwQgYInZRtrlkMYtc5/eJQEb6twpT0WJqCvan5wdqbdL2I7t7jlmhur1Tc4PxN
 Bmaz7XAfCn2Z8CjNRD/Oe3c4q+pC3hK1OX0ckDuXcQhkk7znkb2nu4sM6991ulF7c8yv
 fpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOTdPMfiJ0IUi0HgJCXW9YZN9R1b3B+6g06XKM9Ro7Q=;
 b=uv4TOneaFOVWeltCLbXG0q9ajWztnusHGk/Y78e1ThWpQlS0gtP4nCrJiVRPx0E81G
 4olQo7yNDvj4lA45MMB82EWlxao7zlbN8WvIuWH+c0H1Rk4lksWrvH/lpgdiNvT50sDN
 BpTXeL8DmMQEsiZuD9uYcA+oi52d+CJYZuGWVvMzfPIbTdI1aSKDffzbHGDHRXO2MAOx
 2O9GlNAEIS5p/y9VnaVHAbYiEB8MOfS5MruBp6ODXxQkGF75m/MlqJQovAUb09A9jQ6w
 3lNQbrjHPJxVyijy6lD4biX7DZBbkeZdjex8OHo4GezP2Ugl8ai7FFXTSsMWdpuppBGX
 kfiQ==
X-Gm-Message-State: AOAM533VDGKYBnUn+iMdty7nTQdjZyymLtJZTupH7RbZo8Y0NGn83Rtc
 aGSESlv2U75AlnaVbAn7fGgdJg==
X-Google-Smtp-Source: ABdhPJzom3M46BcoSWmJ2Xmqo1894sADqqzUybwZaffkQqLP3p2WH751mAC/eu6/Uk1SOjnng8rhIA==
X-Received: by 2002:a17:907:6d28:b0:6ef:7798:72fe with SMTP id
 sa40-20020a1709076d2800b006ef779872femr11845658ejc.311.1650359436586; 
 Tue, 19 Apr 2022 02:10:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b006e8325fe130sm5382510ejb.31.2022.04.19.02.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A08F1FFC0;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/25] tests/docker: inline variable definitions or move
 close to use
Date: Tue, 19 Apr 2022 10:10:03 +0100
Message-Id: <20220419091020.3008144-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Variables that are defined with ":=" are handled imperatively, so moving
them closer to the first use ensures that all the assignments prior to
the first use are taken into account.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-6-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

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


