Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93634508FBA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:47:54 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFMn-0007UG-Ld
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEky-00024A-DS
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:50 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkw-0001Zf-T9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:48 -0400
Received: by mail-ed1-x530.google.com with SMTP id t25so3347243edt.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xtk7gIVkGZCQg1kwV2ABaygwIQfaHWrzcnW4atzxfQs=;
 b=aqkcLitS12OADJSRxZp1BFdFOhntUzKp3MLgNeMW611rfIkrpsIIgmEL28PJtecXPq
 SBMJODUVBk/qI8CA+AUKkXwJCskNBB9g5afbOw4Av/LkBFuJzYJ7RwGRiTa/RjsTG8hq
 t7MYIfhethDOOkdYgAS0MYHUaC41Oho5IeYi2zxEWTHw0q6/qCfHhEOJXXVuSriNTq54
 tqcy+lYZRDDwTTNfmt5a2ay7kjqBCrrOtky5T+31Ki+6a+0hIRP0Q5c2qFiJkjxJA+rr
 UB6j5/bd6v1Px6mVTVIXtaAaytT+A+Ld+E2FW/yJF/JbOza+WwAj0qC5xvl2Qpy7I6vc
 qgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xtk7gIVkGZCQg1kwV2ABaygwIQfaHWrzcnW4atzxfQs=;
 b=YxYFbRVtyig8iNYksd7miwfdCw7olC5ayoG8aDNzZsDRbm2pXDdAm0qzybqDSdAH03
 /xqfLU0eppQcbFGXsYYDnxQhwg+X3JNVWOc4/uSR3oKM7yH3Ge4SXzfB/0HFxxijEq94
 41sVE6ytQFZj/xwwylYReLaaSzzVuQ43NPBzqCMWrSzs2k0PBARizJZOL12wV92vlAVG
 zxouGZyeuom4TyWTn5feYAL6VobQ7h/RuS1Zeh6eL5feppAPlW5IuVyK+Mnrls6kVMwf
 kLpYQeu7BenD+/p0j1RxOFZFttGEp6mzR34BwmI/41LgEfcjkp0+3yMKYEGePedb+Hys
 vCxw==
X-Gm-Message-State: AOAM530ceqFQI+ZxEhWD1nkyuQrFRjiXEqL0b5zJOKQ4d+RIbcO29ptW
 D6MplWJE6yL4uMyToyj0oA4TAw==
X-Google-Smtp-Source: ABdhPJwI0TmuRq19206LMLXgRbssm+OOP8ozLfPiYsOxpg1vkOiDDRNulZCPb3pOsa0EHgC5zM5zng==
X-Received: by 2002:a05:6402:1d4b:b0:416:13bf:4fc5 with SMTP id
 dz11-20020a0564021d4b00b0041613bf4fc5mr20872031edb.115.1650478125565; 
 Wed, 20 Apr 2022 11:08:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a1709062bcf00b006ee82143cfbsm6223556ejg.51.2022.04.20.11.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 181221FFC2;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 10/25] tests/docker: simplify docker-TEST@IMAGE targets
Date: Wed, 20 Apr 2022 19:08:17 +0100
Message-Id: <20220420180832.3812543-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

No need to go through the shell when we already have the test and images at
the point where the targets are declared.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-8-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-11-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 3b5ebd5567..2a187cb5a2 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -204,7 +204,7 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
-		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
+		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=$i) \
 	) \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval docker-all-tests: docker-$t@$i) \
@@ -263,7 +263,7 @@ DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
-# docker-test-foo@bar) which will do additional verification.
+# docker-test-foo@bar) which will also ensure the image is up to date.
 #
 # For example: make docker-run TEST="test-quick" IMAGE="debian:arm64" EXECUTABLE=./aarch64-linux-user/qemu-aarch64
 #
@@ -298,14 +298,6 @@ docker-run: docker-qemu-src
 	$(call quiet-command, rm -r $(DOCKER_SRC_COPY), \
 		"  CLEANUP $(DOCKER_SRC_COPY)")
 
-# Run targets:
-#
-# Of the form docker-TEST-FOO@IMAGE-BAR which will then be expanded into a call to "make docker-run"
-docker-run-%: CMD = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\1/')
-docker-run-%: IMAGE = $(shell echo '$@' | sed -e 's/docker-run-\([^@]*\)@\(.*\)/\2/')
-docker-run-%:
-	@$(MAKE) docker-run TEST=$(CMD) IMAGE=qemu/$(IMAGE)
-
 docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
-- 
2.30.2


