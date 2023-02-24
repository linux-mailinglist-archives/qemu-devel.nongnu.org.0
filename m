Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F96A2136
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVP-0005EV-K6; Fri, 24 Feb 2023 13:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVH-00058n-FL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:10 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVC-0004ug-L4
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:07 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so2801928wms.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bChR6NeE4/G3GIsj80HSMKzwjWOp8TUdcvSDXl1e9qI=;
 b=PqYMWldIf2cMM4eZWJobja1KPJiTYKwjVrj3geFCKTbiZPJWgGAmcLXmkgEnTwCYaQ
 jHe9DoGQoaS33d85kdF7PoGxY1accPbvnBH/2imu8Ps/wTk0SObs45KjS6SCYUdzuhLh
 zlVVPfY2YOc4d1iCs+XRtiGC2amQAYubquae7iTa7fDV48hZNn0j6oH8gJ9+J3e/+s5Y
 JNUgTCo7Q4F+MJ/ausppOL1FViqYp7MVXqWyha15hI0xY6scTOzUs1L2hswhDOxm6g9j
 Posxk0TJYWO0CstqUE+357a/9DWJYUayUha63ADdaIZOkDAsE3v69f5bRqaOkvfRibJi
 nncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bChR6NeE4/G3GIsj80HSMKzwjWOp8TUdcvSDXl1e9qI=;
 b=gSrqzjCiK7RxQ9nXoSkHEV5Xhw46T+kMkt7+gbJlDHUIXW4Cq33z0ONrS7ylxEQJJy
 aiNuYxkQGY0LEhUYw8/LAv4pbZOCEj5hEGKPNANvdcXRPUGw22NfaeePHeobx3DLBerC
 q7x2G9nzzrGjbYOxDjDrUJJLwkGlkzRzauPdVXXemTQoIFj15SdW0T70wqnTqUvNpLpa
 u+2QDUmQkKl++ws86X82BqK35UkWN7ns9KMeNMgjUoG+Ewsfi35BdS7+vS6rzlq3LAQW
 TFYfIAp3ClWOqDLKf6J8nNjtpy/n8U4STBpFuZaPnm8vBZZsRK/MsqJTFx9uopD3eahw
 foQA==
X-Gm-Message-State: AO0yUKWUxOq4PHsTMCEhU0WXH+PvSwW9kNs8At/YyKzi2m8JN5HOtkWy
 +L6MFHxfOcQqm7veCVQL8TcWGg==
X-Google-Smtp-Source: AK7set/plIEc6I3stCAhPEqIgszxUrULhvelPbhas9puuZzyQHKmH0lBSFR2DmNsow4QnIYE2vaI8Q==
X-Received: by 2002:a05:600c:3d9b:b0:3ea:f6c4:5f28 with SMTP id
 bi27-20020a05600c3d9b00b003eaf6c45f28mr3058786wmb.36.1677262140596; 
 Fri, 24 Feb 2023 10:09:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003daf672a616sm3580020wma.22.2023.02.24.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BD5D1FFB7;
 Fri, 24 Feb 2023 18:08:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 5/7] tests/docker: use direct RUNC call to build containers
Date: Fri, 24 Feb 2023 18:08:55 +0000
Message-Id: <20230224180857.1050220-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bfb0dcac21..9e73ff5cf3 100644
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
 
@@ -35,15 +38,16 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 
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
+		$(if $(NOUSER),,			\
+			--build-arg USER=$(USER)	\
+			--build-arg UID=$(UID))	\
+		-t qemu/$* - < $<, 			\
+		"BUILD", $1)
 
 # Special rule for debootstraped binfmt linux-user images
 docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
-- 
2.39.1


