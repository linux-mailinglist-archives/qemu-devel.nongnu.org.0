Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93E50681B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:54:42 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkZF-0001Bc-9N
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsp-0005XF-0I
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:52 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsh-0008Sf-6R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y20so11396832eju.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZeU+uRFfrIaPIx68hVfypfl28wkHg5KYL4ebgDRamw=;
 b=CpbquiaR/bCA/C/UYMXNPSJV/Osd6xeeaM2rLAf+kyxmkJtaT2f+j7+KgUYEXmFbh3
 /6jGNKmxBLynslwkhTHXFIOIBkxq+zc6DmnS7SU4lREt6cXfwh86T+9AEeBykGUnsXw8
 5kdF7e0gFGGMFA3b+M0WJRoEiXyMQqs/GExLrCuWWjd+3+Cja+KzQPEUsgca8NBfW1Aa
 Pko03wNN4V90ko4pAmrQi3QO2//9sHPEODlj7hdu85kLQCH/weVlgxTLe3SksEdSvkFQ
 TqkYpcUU3eUXv8PtHrpPKySEzU607ZDnPvg+pSeXijBYzqDzqehrmQWX6/FLebIUSwVc
 pr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZeU+uRFfrIaPIx68hVfypfl28wkHg5KYL4ebgDRamw=;
 b=gJPZWedzr6xdrbUx8hBSCI03r6AN+GoOWeiQ6rWPJJlHvU39z+paGt2+4354V9gRNV
 vcSd+bk1Q7KdhSJ31wKYe8ktXCeEAtIEltAY/MgXwkkylw9z2iFF8HShmkFlRISZFc5o
 3iNSY/JpZRQzEBK/QgWUBsumCHK854czLofp1xRU0dpNfPPX5vZuKUOoOReTBCJmHf/E
 lOwBVssH1EgfqwcVQMdajuPbUfRFzKIfNI/GDs161Q8SpWzZZYFTja4G+yI+5EOMUWDy
 3OWkChcqScaJQKTSR0njd0UoIfmRvgAe9JCwfei0nA4CAcT8JVPoTVZl2djVtH4BX4/o
 knJw==
X-Gm-Message-State: AOAM532oWOKJJLPHWytQWpLK2WK7cSLO1V7UCMYfWp0QsWl6GQBe9MEl
 +/3E3CxJybVibObgjPT3EwbHCvSUhM0zfg==
X-Google-Smtp-Source: ABdhPJwlq/atPP+ndxZ4NB66spfyT3xEBkeSdknLoRbVZPs9cDg3RBS/F660a58HWAZP/Veq4jbxmQ==
X-Received: by 2002:a17:906:6841:b0:6cf:9c02:8965 with SMTP id
 a1-20020a170906684100b006cf9c028965mr12462615ejs.440.1650359441483; 
 Tue, 19 Apr 2022 02:10:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm5397190ejm.200.2022.04.19.02.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E5921FFC3;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/25] tests/docker: do not duplicate rules for
 hexagon-cross
Date: Tue, 19 Apr 2022 10:10:06 +0100
Message-Id: <20220419091020.3008144-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

The commands for docker-image-debian-hexagon-cross are the same as those
in debian-toolchain-run, just with a nonstandard path to build-toolchain.sh.
Reuse the definition by renaming the debian-hexagon-cross.docker.d directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-9-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                 | 26 +++----------------
 .../build-toolchain.sh                        |  0
 2 files changed, 4 insertions(+), 22 deletions(-)
 rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 2a187cb5a2..eb100c294f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -121,28 +121,6 @@ docker-image-debian11: NOUSER=1
 # alpine has no adduser
 docker-image-alpine: NOUSER=1
 
-#
-# The build rule for hexagon-cross is special in so far for most of
-# the time we don't want to build it. While dockers caching does avoid
-# this most of the time sometimes we want to force the issue.
-#
-docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker
-	$(if $(NOCACHE), 								\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) build -t qemu/debian-hexagon-cross -f $< 	\
-			$(if $V,,--quiet) --no-cache 					\
-			--registry $(DOCKER_REGISTRY) --extra-files			\
-			$(DOCKER_FILES_DIR)/debian-hexagon-cross.docker.d/build-toolchain.sh, \
-			"BUILD", "debian-hexagon-cross"),				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
-				qemu/debian-hexagon-cross $(DOCKER_REGISTRY),		\
-			"FETCH", "debian-hexagon-cross")				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
-				qemu/debian-hexagon-cross --add-current-user,		\
-			"PREPARE", "debian-hexagon-cross"))
-
 debian-toolchain-run = \
 	$(if $(NOCACHE), 						\
 		$(call quiet-command,					\
@@ -162,6 +140,10 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
+docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker \
+	$(DOCKER_FILES_DIR)/debian-hexagon-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
similarity index 100%
rename from tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
rename to tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
-- 
2.30.2


