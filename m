Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707A4E98F6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:06:24 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq0l-0004Wa-JB
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:06:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxI-0001ho-Lj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxF-0004jc-OK
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIGEz1XtW7jJvlKsjKshiDWt+ra+BYFIt4ndLyYfF+g=;
 b=OSXVX/eXa0KACfmh35FXvFnvS4Hl+aW/aSUAU1NzPvR88Q7xfq6q+6F7f38eUE8CbUnNI2
 h2jRD3ShvGhYxQWDd26m1ElEBnhoCCgz75vctTuLTsULfoJ74hZlhBBZ5uF4KQvrWB6tDA
 WcrsRop/S4BChawiEJJbUgOkaEs1A5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-hCazmr3IM0KKQ7lAmbhdIg-1; Mon, 28 Mar 2022 10:02:41 -0400
X-MC-Unique: hCazmr3IM0KKQ7lAmbhdIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C6B7899ED0;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 548FA1121318;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/15] tests/docker: inline variable definitions or move close
 to use
Date: Mon, 28 Mar 2022 10:02:30 -0400
Message-Id: <20220328140240.40798-6-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Variables that are defined with ":=" are handled imperatively, so moving
them closer to the first use ensures that all the assignments prior to
the first use are taken into account.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 80bb188620..f4bbba47a5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -9,26 +9,12 @@ COMMA := ,
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
-# we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11
-# we don't directly build virtual images (they are used to build other images)
-DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
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
+DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
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
2.31.1



