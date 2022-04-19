Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA95067E1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:41:04 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkM3-0003hs-Ab
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0005P2-KY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsV-0008Le-JM
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:33 -0400
Received: by mail-ej1-x634.google.com with SMTP id r13so31551274ejd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/5zRkzfFmPCo8B81OZbRdG+tbonsj7GW5zIpGTtEk8=;
 b=t2m+7ir80kc1V6lOUlM8h/HYoULpqkO5KRk+1QYy+YKxhZK2uJCco5EJ3dO/QOUK5Z
 GwTNVGBLKOOStZr97tmcTzyr8yVFUKroS8zH7cj4suYIeG2dG9S5x++KRQUFmTmDYDd8
 AnxiIZWguk5m2AazbVp7fXbcpXMrBq1q4OgGnPWLmN2FyMEgN6H6HrJLSkckC/Ywb8pw
 GcAfpDf+HtIKg562ECyczWWZ7X4D+ylbOaw3ehCzcx+vM/evfHDIp7BMN9jOZosmjCjQ
 qI/+f1AMqGVYRnrIr4oBmntJWz0Lf/jzSoP22ogECF2AqQ8qZQMj9QlQ5YdhZZeQ/keQ
 UaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/5zRkzfFmPCo8B81OZbRdG+tbonsj7GW5zIpGTtEk8=;
 b=e9ocbHp+pMOYBXpZuUeUvl2jscA5YsfJcFKbhjlKR66p3A/InFU1YbiV1E36Nkos+c
 SWcIuKIgOyyH6iQq8XXB2PZvPogZqOql8yZ5dqcwyx/XOMojkOuSTZjqlWdhHZfw73No
 h//kyMSScakdEg3pJxFmEmyDh8AsUDA++r059UEPqZS9SLnCOqzCzCnpg/DaPdS7wRzP
 yX12OoFykahQg1R0Pcir5yA9MJTeNjO5ImwLMKIRxXm50ExaJNfdqQnMDlA2zFDH3dCN
 SwoeGa9S7mli4DzIAlwC2lC4BX6NStYjosvE6TEkrxp7qCu3DGY7iA39W1Hz9N5n8vLs
 Dmsw==
X-Gm-Message-State: AOAM533DlLqwCr0HE46idRSRMU3/LoE7QcouUIEzELVA8ynB7nN9cQpf
 6iKDyOtPLUP/jhLU7hchgvQHjg==
X-Google-Smtp-Source: ABdhPJyKXhFLosLX/9APVnhHcYKobf+xlfhY6YGWuLjwRpiXoAfC1SUtMe6WLUaWmfJIeabkWNnUIQ==
X-Received: by 2002:a17:906:4546:b0:6e8:873a:22a8 with SMTP id
 s6-20020a170906454600b006e8873a22a8mr12693928ejq.711.1650359430240; 
 Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a170906849300b006e89efedf50sm5481609ejx.171.2022.04.19.02.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E1251FFC2;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/25] tests/docker: simplify docker-TEST@IMAGE targets
Date: Tue, 19 Apr 2022 10:10:05 +0100
Message-Id: <20220419091020.3008144-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

No need to go through the shell when we already have the test and images at
the point where the targets are declared.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-8-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

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


