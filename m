Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B164506785
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:14:45 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjwa-0000WD-K5
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsd-0005S0-76
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0008MK-6R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:38 -0400
Received: by mail-ej1-x636.google.com with SMTP id l7so31581551ejn.2
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/w4cxTJkCDMZlBFrEpupwHPY+eFheBz2dUBNsjbLHs=;
 b=QrsqmKuwZqb/yEbfdNBi2pcOJfWwf4svQbi1YuRMXl8o58Mb/B5ygJk8hPzhT+TzKO
 HmZUM+MZw/QvGSPGjUHB2v9nvdo2bYA6w231Hh/jgGnmW5VRSATWhXHFjT+YwI+X69pb
 BT0JKE3tlr69W0Yi++/ln9VMS+ABV5Xqw3JvY8oAVpAUSYUoQXzAsWvT7bQnkq8aBRBg
 ghXsgiGl804jtthQ4fWo9nsmxHSZlc1JyE37htvsb+hOjeCRxb3TTjxQWXSCho6RpqvS
 xweejflbMCUtkFmDFdmvAlYUFJDCOdmQN9/P6zlNiuAyVkZgsG3cKOFHv2n5U8qGY6WG
 P6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/w4cxTJkCDMZlBFrEpupwHPY+eFheBz2dUBNsjbLHs=;
 b=BaIi8lH5/rMIed97fed86KIPFlvT8J6NlYChOjZjl7xrNFpdI3GJqH7YE9EMatI9j5
 UkyCZTHRYq6WgZwOKW0086QUav0ydNoxvZEMOLX8zZrHpENHNNZ8hbd5DSzrHqrjjnWl
 lxjBzC0+XsKq8t1fjL4lkKU/DaT+SXYxINv6VE6i+82VEuSc7DQsDkMbrdQYoBtnAE+Y
 wZQrBeZ2a1lLqWzPz7YYreZY52Mi9BGkRIEtiLMGjsAdBKUS2Q4tMCIEY9Tfni1cJyqY
 oyKb1YaDfdpYl+HuJYCoA0EyUBV/S21qItOhFhqcqjV5sMzdRnolHwGfFgupGuV3cMEz
 31cA==
X-Gm-Message-State: AOAM532X6vQCRHCFuta6Wn9ahzzsvP8oWiqQTZKaNf7nPnYxKYy5RZTJ
 fvk/9CG06wmKMLbw1WiZSFaRlZP962EXCg==
X-Google-Smtp-Source: ABdhPJztccnGdX0/h8bK+zoMd3Qi7QxjLEmU+fXiGg88xqco8zDpDs6g8atLhbTgMcv+ebGXkuRsbg==
X-Received: by 2002:a17:906:408c:b0:6e8:d649:5e41 with SMTP id
 u12-20020a170906408c00b006e8d6495e41mr12808009ejj.519.1650359431300; 
 Tue, 19 Apr 2022 02:10:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm5444656ejb.194.2022.04.19.02.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4F9F1FFBD;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/25] tests/docker: remove test targets
Date: Tue, 19 Apr 2022 10:10:00 +0100
Message-Id: <20220419091020.3008144-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-3-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include         | 20 +-------------------
 tests/docker/dockerfiles/empty.docker |  8 --------
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/empty.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a6a5a20949..06c40a9320 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -18,7 +18,7 @@ DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 # we don't directly build virtual images (they are used to build other images)
-DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain empty
+DOCKER_VIRTUAL_IMAGES := debian-bootstrap debian-toolchain
 __IMAGES := $(sort $(filter-out $(DOCKER_VIRTUAL_IMAGES), $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_IMAGES := $(if $(IMAGES), $(filter $(IMAGES), $(__IMAGES)), $(__IMAGES))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
@@ -99,24 +99,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
-# These are test targets
-USER_TCG_TARGETS=$(patsubst %-linux-user,qemu-%,$(filter %-linux-user,$(TARGET_DIRS)))
-EXEC_COPY_TESTS=$(patsubst %,docker-exec-copy-test-%, $(USER_TCG_TARGETS))
-
-$(EXEC_COPY_TESTS): docker-exec-copy-test-%: $(DOCKER_FILES_DIR)/empty.docker
-	$(call quiet-command,							\
-		$(DOCKER_SCRIPT) build -t qemu/exec-copy-test-$* -f $< 		\
-			$(if $V,,--quiet) --no-cache 				\
-			--include-executable=$*					\
-			--skip-binfmt,						\
-			"TEST","copy $* to container")
-	$(call quiet-command,							\
-		$(DOCKER_SCRIPT) run qemu/exec-copy-test-$* 			\
-			/$* -version > tests/docker-exec-copy-test-$*.out,	\
-			"TEST","check $* works in container")
-
-docker-exec-copy-test: $(EXEC_COPY_TESTS)
-
 endif
 
 # Enforce dependencies for composite images
diff --git a/tests/docker/dockerfiles/empty.docker b/tests/docker/dockerfiles/empty.docker
deleted file mode 100644
index 9ba980f1a8..0000000000
--- a/tests/docker/dockerfiles/empty.docker
+++ /dev/null
@@ -1,8 +0,0 @@
-#
-# Empty Dockerfile
-#
-
-FROM scratch
-
-# Add everything from the context into the container
-ADD . /
-- 
2.30.2


