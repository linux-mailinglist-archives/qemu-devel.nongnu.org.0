Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A526A6F32
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOCJ-0000GL-FC; Wed, 01 Mar 2023 10:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBk-0008BA-Co
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:16 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-0007dO-Tt
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e13so2076285wro.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN8jHOsJL7HsIRzzEInBqqC6JRvvYJxy3yPDQt3Nxvo=;
 b=Vu/qk0YsaFyQkQy7Mwk/CHc0/R05ALk3FwnlGEybhN1B/yeUKMVVUIOW1bYsEFc6IL
 de3V3foZo2+iCaJK+jms3qQsCew1UziReml81XvMFhXHx7TIzXEkV3NFdotUTU0j/GO9
 RY9YibqOzjNG2UpmKdux10zVmIlI+CkZ/3YmGCWVUIJDeVjIbLv1LW03j8iy2ZYJ31Y8
 iFnVsUWQ2WFf1D/MGzo9s1ztHIyNhSmgCbwXnrVJIUjrcwNjFq4lfU4EN9h1TxApZsJN
 HxhZ+JTHPAeT8/NPudPANk9iIlwScbMCSL8z5M6Y94dfrTZsUI2j0UmRvcrD9n6/TuOQ
 WOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EN8jHOsJL7HsIRzzEInBqqC6JRvvYJxy3yPDQt3Nxvo=;
 b=gYjobkawDaOep1oYzG9DXRvHnEhHYhr18mEtxkGIqiuio7FeT/+YlTnT7N9oCx8DVC
 jTbhPKmb7rx6RBlIFfBDLnjTPnf5z7YdPTl17JePswQWFv+OpISGyPwAhNg28xrEYL1F
 310KYNskv2iz3/ucDYARpitdtP69pysKIKR/WPdnjGtzHeWIAlhBo3EQdEXEqT9jHf/r
 U6wfYqbN+dmkf2qe2V1mj+gSje/URdy641qGn3PP/Hxx4nxqV708N9o5rLSRYXHiAPPf
 uhXDm+wcIJUGVQyQvw8u0j5sPF/Zaw8pQgggCbsq1oWUYcOTlwkSo8usP4Mjt8rwdQlO
 UR2A==
X-Gm-Message-State: AO0yUKW6z5kVerD8XRiIqkWdq/Xl3BZauK17/ScBUOwBevX8glOOAc1/
 wA1YGReY/GUd0853dtHoeXzHbjfFCHix9jc2
X-Google-Smtp-Source: AK7set9ZWzuCsHetRc3FSExOEcNZnrXwocPqBvQh79WRi0jMfekiN9RYD9YF3e6NdyTGHU+mnca4yw==
X-Received: by 2002:a05:6000:11c7:b0:2c3:eeeb:b2f7 with SMTP id
 i7-20020a05600011c700b002c3eeebb2f7mr4919068wrx.62.1677683772535; 
 Wed, 01 Mar 2023 07:16:12 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4cc2000000b002bfd524255esm12689441wrt.43.2023.03.01.07.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AB9D1FFC8;
 Wed,  1 Mar 2023 15:16:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 20/24] tests/docker: use direct RUNC call to build containers
Date: Wed,  1 Mar 2023 15:16:00 +0000
Message-Id: <20230301151604.1948813-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't really need stuff from docker.py to do the build as we have
everything we need with a direct call. We do rely on the dockerfiles
being able to tweak the UID/name mapping as the last step.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230228190653.1602033-21-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bfb0dcac21..680afff952 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -7,6 +7,8 @@ SPACE := $(NULL) #
 COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
+USER = $(if $(NOUSER),,$(shell id -un))
+UID = $(if $(NOUSER),,$(shell id -u))
 
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 ifeq ($(HOST_ARCH),x86_64)
@@ -14,6 +16,7 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
+RUNC ?= docker
 ENGINE ?= auto
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
@@ -35,15 +38,17 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
-	$(call quiet-command,\
-		$(DOCKER_SCRIPT) build -t qemu/$* -f $< \
-		$(if $V,,--quiet) \
-		$(if $(NOCACHE),--no-cache, \
-			$(if $(DOCKER_REGISTRY),--registry $(DOCKER_REGISTRY))) \
-		$(if $(NOUSER),,--add-current-user) \
-		$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
-		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
-		"BUILD","$*")
+	  $(call quiet-command,			\
+		$(RUNC) build				\
+		$(if $V,,--quiet)			\
+		$(if $(NOCACHE),--no-cache,		\
+			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
+		--build-arg BUILDKIT_INLINE_CACHE=1 	\
+		$(if $(NOUSER),,			\
+			--build-arg USER=$(USER)	\
+			--build-arg UID=$(UID))	\
+		-t qemu/$* - < $<, 			\
+		"BUILD", $1)
 
 # Special rule for debootstraped binfmt linux-user images
 docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
-- 
2.39.2


