Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34635FDDC2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:56:50 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0Zl-0000Au-MB
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QW-0006BR-IY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QU-0006p5-KB
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bp11so3462432wrb.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+x+u7Fb5jzI3WRmzeCdba3QbogrqfQkpINfBNJ2MAvk=;
 b=c4+lghtVgwiuWHibttX5a2ib8DmjaS3MJcm33Bw5AaKThlYpwE7fN889e951Yrvx5z
 C+QRxRd9kUn6DeJxRrSHnpJBWZWvjMqJyPSCHJxPHuk3PF0oxGjT0t9GiAb3NQJ53v2I
 KO7PB4NdtPjAUUknJtj/7UrGuJbJGlfvfapVqcWcTyVmD2mAKRLwbLgSweW3um6x/FDP
 A9cv5DBuEhdpiOALbm6Js0fxhtqCB26H1ROPH2kNEc47OriwcbCtaRIxvF279JKx8+oL
 ZoAFigFBtMAs80ZGGfMsi68/6jjnIU+IW44e/iXNL6NrPuM8j5aszPB2oleGGm0/gCep
 Xt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+x+u7Fb5jzI3WRmzeCdba3QbogrqfQkpINfBNJ2MAvk=;
 b=uyNfmg6g7TlrvNA2IdQJLzqu9q7pf5VXukAC7Jyk+F+oE0wjtEUE+m/0RqH0DunVHj
 SaQiCdh1N4jensQWqvxOK4VPbrY74E8RvGjp04LB/uDWEvlILpUlX2vXbILZCWxFPF8d
 GYl3E3sx3UJCqLpXqwnwzKaFmFxYfrrdmq4nhadnr7A0G941zUkCLm2EAzLnHOTrzyi+
 EOhP4mOlFby9klzxECmPeGhla3gEY367nyB6HmjEmnz2CVcmvBApoyXaEXFwpAcrYiBP
 e+LQ95hKt9Kj1Mv/PM/BkfTBgkzNZMin+TAhEHfQaY64I+Zm23zRNwja9rqRNc9HKHFl
 Z+xg==
X-Gm-Message-State: ACrzQf2ZK9TbgsceCwzxvoZ1cvqPCgZ3KTmWqRARAE80cY3HCc/QHRRL
 1pvhAfsipxNsFV+Y6ZembpPSFg==
X-Google-Smtp-Source: AMsMyM6Pc63uq0c3fox7AMTBY/XbSA5BNUKajZ3Hwov4xa6XdjkvIn6pQgC8EJnH+AXm8g+NVwQ1Mw==
X-Received: by 2002:adf:eecc:0:b0:22e:3e6d:fb62 with SMTP id
 a12-20020adfeecc000000b0022e3e6dfb62mr432267wrp.302.1665676033213; 
 Thu, 13 Oct 2022 08:47:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adff852000000b0022cc6b8df5esm2323014wrq.7.2022.10.13.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91CEF1FFBF;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 7/7] tests/docker: use direct RUNC call in debian-toolchain
Date: Thu, 13 Oct 2022 16:47:05 +0100
Message-Id: <20221013154705.1846261-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't really need stuff from docker.py to do the build as we have
everything we need with a direct call. We do need to tweak the
dockerfiles so we can redo the UID/name mapping as the last step.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                 | 38 ++++++++++---------
 .../dockerfiles/debian-hexagon-cross.docker   |  5 +++
 .../dockerfiles/debian-toolchain.docker       |  5 +++
 3 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c87f14477a..c34b3d1340 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -7,6 +7,8 @@ SPACE := $(NULL) #
 COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
+USER = $(if $(NOUSER),,$(shell id -un))
+UID = $(if $(NOUSER),,$(shell id -u))
 
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 ifeq ($(HOST_ARCH),x86_64)
@@ -90,23 +92,25 @@ docker-image-debian-native: DOCKER_REGISTRY=
 # alpine has no adduser
 docker-image-alpine: NOUSER=1
 
-debian-toolchain-run = \
-	$(if $(NOCACHE), 						\
-		$(call quiet-command,					\
-			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
-			$(if $V,,--quiet) --no-cache 			\
-			--registry $(DOCKER_REGISTRY) --extra-files	\
-			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
-			"BUILD", $1),				        \
-		$(call quiet-command,					\
-			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)	\
-				qemu/$1 $(DOCKER_REGISTRY),		\
-			"FETCH", $1)					\
-		$(call quiet-command,					\
-			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 	\
-				qemu/$1 				\
-				$(if $(NOUSER),,--add-current-user) 	\
-			"PREPARE", $1))
+debian-toolchain-run = 					\
+	$(call quiet-command,           	        \
+		$(RUNC) pull                            \
+                $(if $V,,--quiet)                       \
+                $(DOCKER_REGISTRY)/qemu/$1,             \
+                "FETCH", $1);				\
+         $(call quiet-command,                          \
+                $(RUNC) build                           \
+		$(if $V,,--quiet)                       \
+		$(if $(NOCACHE),--no-cache)		\
+		$(if $(NOUSER),,			\
+			--build-arg USER=$(USER)	\
+			--build-arg UID=$(UID))		\
+		-t qemu/$1                              \
+                -f -                                    \
+                $(DOCKER_FILES_DIR)/$1.d                \
+                <  $<,                                  \
+                "BUILD", $1)
+
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
 docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker \
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 8d219bb81d..13fab3032a 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -48,3 +48,8 @@ RUN apt update && \
     apt build-dep -yy --arch-only qemu
 COPY --from=0 /usr/local /usr/local
 ENV PATH $PATH:/usr/local/bin/
+
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index d3d4d3344e..85e88f1ebb 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -35,3 +35,8 @@ RUN cd /root && ./build-toolchain.sh
 # then copying the built toolchain from stage 0.
 FROM docker.io/library/debian:bullseye-slim
 COPY --from=0 /usr/local /usr/local
+
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
-- 
2.34.1


