Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28F4EEF2E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:21:36 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI9f-0007bs-3V
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:21:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI21-0003OP-81
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:41 -0400
Received: from [2a00:1450:4864:20::52e] (port=44961
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1z-0006c6-E3
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w25so3097910edi.11
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9heYVWRJb5rbQ6FDIVgV7EaicSbC8BI4muN6RzMYHic=;
 b=MhEB5pG+WatGCmDapk0N0J/2GqUYgUmahLVp2pAQS3wIFhwLO5zx4h9KcSbcawUr0j
 MJR2az0Mrnm/nww85k/sAmyUHMBIsMdB4/OqujhZGchowu0flRYAH44EMSMVcaZHZXvy
 1VGOmsP8QNOi2e52QQ8jrBly4bNr6kT/6hi2CMirW1WkFu0BK41tOI7M5e9cgZGli6/o
 QV0kIOc1S9DE6DMUBAMSvhYCZEG86dBGDz2eE5IzuhXP7bEoZZcNOdQtpsPbTsCE7Es8
 tdT1zdoKsAKk0joRNlnirnTtjKIjrAYKpcFAHMuTcOaMy85haXNG1V8zu+UXqHrBHgjI
 ax3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9heYVWRJb5rbQ6FDIVgV7EaicSbC8BI4muN6RzMYHic=;
 b=mtpg+K/wYhKhkqkrK+MDuZK+4mSADpMEfWm7AkRvNnTBZQKYyBei4z1CCztt9ISsRu
 Fg0MXJ35GrG7D6sZMbxrK50w7JDWZgAijhqgjkc8GLUWL61YmoVxFQ19sfQ/DQjue3X4
 bOZSEXEiLxvucVjjJI82quvnbDGWN/LIHmGvF0rYBr8kKD3kRwYVi1BgtcoggtXfYy5l
 vQitiJEsDr5wbeIG97LbjYoQg5DgqeVCzcq5tPK1NhaOvQzpteXmdoi0O8kbRDvnJAYg
 BHeWRuls4Ti9c3ul9KNDYBWznF9PvFdZSyw4uIDLwnpJpWnTaUMmTHJBI9bmjokEZnD7
 X6hw==
X-Gm-Message-State: AOAM531T+0mkVAobTthkwLqIOWRLrklwg6EUkF51q9kt0iQVbsvU+2oA
 zFc8zVW7ITiVG1vsKKBXTY3iihIhSpk=
X-Google-Smtp-Source: ABdhPJyBvPcXFfQ03KlfCnxL3p6XQQ1EafbE/e09i8QiNwndHBVLsc5WBzPQZUB+OlfBSOwiehlHBw==
X-Received: by 2002:a05:6402:13c7:b0:41c:870e:924b with SMTP id
 a7-20020a05640213c700b0041c870e924bmr879413edx.353.1648822418146; 
 Fri, 01 Apr 2022 07:13:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] tests/docker: inline variable definitions or move close
 to use
Date: Fri,  1 Apr 2022 16:13:14 +0200
Message-Id: <20220401141326.1244422-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Variables that are defined with ":=" are handled imperatively, so moving
them closer to the first use ensures that all the assignments prior to
the first use are taken into account.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



