Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB517508FE1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:58:22 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFWv-0002CY-Sr
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkw-00022f-JW
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEku-0001ZM-01
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id g18so5145756ejc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHVcEqZqyjQvacLZ3vhhnnOl+0cK7mefEyT4PUfHUTA=;
 b=SOoLvA2fUDKfpdQ4Lcdan9y1pmvM0p/cjt0MdbWtmKL4290aSBIVABhey/yM2MFlkp
 xiM+Fy2PAy41Qx3ks5ihOrg6Gs03QBWf2iKb2AcvkA/mnR6QsL5ckpeJHbzaTFl3Fu2w
 yAAAk4d61YdeA7qIaV/HLjxNqMGg6JYlcpkf/LtCQca6j7mSwikZMntcGial9Xwsk9XI
 ruPtDixoQuzDho2TmTPX/PFU4TV0YQasbJec0RdE94vhpAtYCsjRBvjf+xJCNAlU1Lug
 BnAx2IVCoPHRstDfNtjyxrKkV/0enwC7xLap02wY/+zjg8mstIpUdMMb1cF1lARGIbpM
 FsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHVcEqZqyjQvacLZ3vhhnnOl+0cK7mefEyT4PUfHUTA=;
 b=HAn2HzARjmiZkSMGTzoBd6TxIzfnsMV5Ua2kBPlsZCYlswsIAEwWrcQuv//KYQ8mC6
 Kzusts0kGfzbW/68G17qDZthQt6wxkuwh63RRcVMYv59t7v79tALouY7kvsz/5/7vZbw
 DQZxRTmpfi5wKcl7XbqcfaLIprVBI0pIlTJWXiLq1FVtxwPaqJB9gnxa18ETsm9tmmJx
 HEIuVEUBT40zAuDs4+B5Kmx+JEWWpN0HSwHaS+HdxTWYteqGFY2rkDgqMDbWXwGjV2M/
 C8NDubjOrsngKybO5uG3eezPLwUIUpe3u3dQDov6/gp2yVwTKHPMONxl7WTxsqEjLYMk
 +HSg==
X-Gm-Message-State: AOAM530fnKk3rlVgwC1+ZA0nIp5L5ZyURRLzvq7auzQHiy+cXxwOmJ2Q
 KRYSsL/ByJ2nXR7tX7/zKk+R2Q==
X-Google-Smtp-Source: ABdhPJxZp+7xSZ49WnVZn3zBZpLl3gg1VNa26vl4R41zIPRKaw3vkIQXcV0BLNOmkdS0tUqZfobuZg==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr18971508ejc.769.1650478122629; 
 Wed, 20 Apr 2022 11:08:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b006efc26c7b1dsm2897044ejb.195.2022.04.20.11.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC06F1FFBD;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 05/25] tests/docker: remove test targets
Date: Wed, 20 Apr 2022 19:08:12 +0100
Message-Id: <20220420180832.3812543-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-3-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-6-alex.bennee@linaro.org>

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


