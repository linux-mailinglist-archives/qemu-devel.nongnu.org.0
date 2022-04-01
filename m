Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFB4EEF13
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI4I-000611-AE
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:16:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1y-0003IS-Jr
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:38 -0400
Received: from [2a00:1450:4864:20::530] (port=43618
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1w-0006aO-SQ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id b24so3097359edu.10
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2G5nPqy3xxJ/zW/TF6DHhTbif27drx4USQ+Ko9z2go=;
 b=KJMU3YFHVnUMCBeXbEXIhLMYCwFuLTFhp2e/OSz/8ldAZzlWaHBrXTewiBpAaIabAh
 hEUJ1BzD5WW7p2iD9tlpAwxXD7pIcdt77Gy6MthsQq0bLPf/k3PL4LPFLR7IXZgK96T6
 C7VDf+FOePItWz60kTT2gzcnEFIiU8oB/Dnjfk0TTEzYTQvdrlY5BiwH+ERJsmmZMWhG
 3RivN/C9rtXtoU0jtkwhgTCoI19lGtHfhk9DzroUPpW41O3hBEAmfecdXjHAIP4+h3Du
 1/U0lLdoxQI05rn3jGk1NChXV3Ph1v8LnDRBZaWV5NeXCH2ISFvmVMYZmC9LWDf+Ydzx
 /lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i2G5nPqy3xxJ/zW/TF6DHhTbif27drx4USQ+Ko9z2go=;
 b=7rfNU8CkJ+Lh00cxwzP5YkbJH0k4Y2fsfB6EwmIjf3DoJHPjglAmkHGV/Jhyh+W062
 AMABEVvHuJWnp7rPlGJHvUYqF29JICcT1atw1Zc0uH9O8LBIkxUibszbHSOL0206QZuS
 FjiNZl75Cza6f3IW65MtbUA8CaWUrAvJ5kGT42G/3Erg6ZdJSgwYaFJFarktMvzabD0q
 ULxGtZ/T8Ay4vo9I4B3IUct39Yz318Rl0DvRTs3L4yutNV3OepeUuaGqil/pPCnvWPuk
 ehi17DmB3Txi027SZ6u9oxhGPdvhy5PrFcZm5lxo3ucQ4I+aw0gdU1Z+HiVp9s2RMo4p
 1HyA==
X-Gm-Message-State: AOAM532IQ7Aefz+oFMlQAB/K20INjpLACB7J5yKw4gYBbs0/rnrw6gDq
 FRozBdHodZYHQfd+IljmbL8C5KpfKmU=
X-Google-Smtp-Source: ABdhPJzi+lqi1PM5sObzFK1Eb91OBT4BL2Bw1ji+zgLBcTCp5Y1f6+w2HSVZ4y8cIbrWV/Y7qPTLcg==
X-Received: by 2002:aa7:d74d:0:b0:418:e883:b4e1 with SMTP id
 a13-20020aa7d74d000000b00418e883b4e1mr21082288eds.56.1648822415213; 
 Fri, 01 Apr 2022 07:13:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] tests/docker: remove test targets
Date: Fri,  1 Apr 2022 16:13:11 +0200
Message-Id: <20220401141326.1244422-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



