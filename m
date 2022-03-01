Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B24C8889
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:51:54 +0100 (CET)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzAe-0007gH-Gv
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6G-00037B-GL
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:21 -0500
Received: from [2a00:1450:4864:20::42c] (port=42619
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6E-00073k-Pl
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d17so19490802wrc.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oo9DRbZoIDPeCuEDR0VO57zAdlBhs+L621CLCEIHwtk=;
 b=Zk/T2sOCmJeYjBQgaYl7QNnepvHwkPOjWTdH3D3/YYRZDZ/kIeMArU5gLLZkEM5l40
 WCmfbOrPZLEJ6AW/usb56+6C9nZPaQV9OtdQfFcuAf4696htt9wjMt0CazpVDF1biQln
 71GKaTfy74AwaBtGygDRTltKisThhjxXd0jexFRQXdpVlNbQWXDgNE0LkHiCrV52Em9F
 MjvnfadcximuS9zqDkeSlwRw4UPJVpzeRKU+Z9BESqC1CZ5ewXi4ASILswgfTQwJktdy
 eMvnkmRkeXAW0ih+9GBgJg7mRt0IFTvEecMmB1ajDGUENI4OCJa3sIux9+7MYFc7AsA1
 U7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oo9DRbZoIDPeCuEDR0VO57zAdlBhs+L621CLCEIHwtk=;
 b=xunLTl6VXwpYTsKTs1vxNogUgKgJY7fZdGNtNP5d0vRGVQ3476o1+dIeWNVV1ndGhF
 HQOgeQFqB6BKDcbBZK19S/wuQmA0gJJi981TtMbI/lXk6FYKIMCpE/rViVcG13t14j21
 Pr237+krWQ7MkhMkiZGcUacLnqmkq9T/GTxaEh8PByev+i/8ugI+rN93H/U+KCJZI076
 IsAxZwPwWlWu6XOp0HNPMZpTCudjdUVazLGWBj2N32ymFfgt/zTDGjX74zRJ8WBwUtRH
 pxozWQmdnIdXez4Emepa7tRxy6sYIf+rvx0tzoz6A57r/uPu66L84cc8HwKs2twdL2P5
 XbIw==
X-Gm-Message-State: AOAM532QJ5o2MyMJ9ldGY4Y4FfNCgYh6L3lC0VgstVPd5WYcN2RBjkzt
 jC2HlEiOGxcRHw2voZnB3odWTg==
X-Google-Smtp-Source: ABdhPJw70rkQ9myngPennnKMw6PjpsLzdUl4HcWV7Vbx34q6Agga/8sA4JvI7X61a0TmYRe16HW18w==
X-Received: by 2002:adf:d84e:0:b0:1ef:9517:c7da with SMTP id
 k14-20020adfd84e000000b001ef9517c7damr9546762wrl.588.1646128037123; 
 Tue, 01 Mar 2022 01:47:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm2350448wmq.17.2022.03.01.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 612AF1FFB8;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/18] tests/docker: restore TESTS/IMAGES filtering
Date: Tue,  1 Mar 2022 09:46:58 +0000
Message-Id: <20220301094715.550871-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken in the re-factor:

  e86c9a64f4 ("tests/docker/Makefile.include: add a generic docker-run target")

Rather than unwind the changes just apply the filters to the total set
of available images and tests. That way we don't inadvertently build
images only not to use them later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-2-alex.bennee@linaro.org>

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


