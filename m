Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF8A6A5F71
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Qp-0000Ph-B8; Tue, 28 Feb 2023 14:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Ql-0000Oe-LO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Qh-0004fK-3Z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bx12so7735524wrb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+62htoyJBiemmn6ddrMZ4MlyjuyTr1hSFkUI1vjiwM=;
 b=uatG3MWnZRdbIrX0cqJ4BCnWZbXF7zlO2EB9P77CISfzckCtyQxVJWeKZPHsb4LW55
 zt/nt6XjlJ0MzBOkeUliw9LGUqgnX1bObW6RqnpHfA4oDMxNj4fzx8gGx8BlyWHC/EUa
 1hTN8fWROC7YIH76pLtmVN8w3O1SB2dlew97q9+kh3nDk5EFI6h4PU8a6X3nSx9waaqm
 icSfNv/zGndvE4zi7IzgDXffmJYpZjxaR6q0hp3qHGnKBEeVGhNKkfYHOMP0OX+YUzA/
 TvULyJhEXNcGXdnme9FvO+LadFQa3mMZDrDvjinv66qsZdt7opWL258IkLFdOWOmHjEq
 JLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+62htoyJBiemmn6ddrMZ4MlyjuyTr1hSFkUI1vjiwM=;
 b=SnHRdASskMwOHKk+2NuhluBAcO4q3IOrfgRpaKjxXVZct8WeMmy1DsM8UYLZHhs0Zf
 VAKGGJFdHzmLoS9PpAf+8eR9DqgUoVjw/o8LwlZ4Kwp1HJP/eOebhS9rrm9WjxJQSwdR
 pGF/gOtUlRMzBJNz8V7RdvmaYQYMapH8w6ooVPQ2b74qCHCqvAXNJXztPuh8O8KC+DCU
 1DzLioPiF157jcbvdN0JAaJrMVd5WpLYcWyHTaqKNb84g35Zktbfl0/dvSf5auaeda8x
 zWZYeq5LGEL4nU+j9PgvkTk7lRYosIxalWlYpXCIROGm3kd6e/UNxKdW+jBcugRlyguk
 p0Og==
X-Gm-Message-State: AO0yUKWIv5bWBGEKtR8HR1Kg4wlhOP/XfzChl0lLf4MRNnxB4dUmraXR
 En/FSagOf41R7SKpWdF7dHv7Yg==
X-Google-Smtp-Source: AK7set+im0RKSHNYkoqUxE9+usnLBEtPU+sYcCMRC0FxzHxLBaQwFLChQe+Fq6GsRbHXPPvzO2jybA==
X-Received: by 2002:a5d:6ac4:0:b0:2c7:1d70:561 with SMTP id
 u4-20020a5d6ac4000000b002c71d700561mr2816919wrw.45.1677611661633; 
 Tue, 28 Feb 2023 11:14:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c470700b003eb3933ef10sm11889776wmo.46.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E61A51FFBC;
 Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 20/24] tests/docker: use direct RUNC call to build
 containers
Date: Tue, 28 Feb 2023 19:06:49 +0000
Message-Id: <20230228190653.1602033-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 tests/docker/Makefile.include | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

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


