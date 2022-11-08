Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD0620C20
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpL-0007Fp-Ky; Tue, 08 Nov 2022 04:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpB-0007DV-Up
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp8-0005oT-Dl
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id a14so19964286wru.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uXwU/1og6Y5YFCCkzlXH6mHIAZKAJashuR6BqLq8xE=;
 b=yH0ZvAcVvt1bGy2FGEbgsuF7dOcFsPLuKCi0FSL6ftwU7PAMVZA1ZJEW+uJ8I2wWEc
 sDYUz21gIlMHSR78txluz2Lowl7GCrNdu+KsK62nfXVWXtRZ48By27XYFB84t3rXaUyz
 G6Nylma9BCS/JJz6OY6+XQ1U6WpHJyjNuVgKE2teAXth8brWX7gGc4WbmkXrYk4jxEwz
 lC+kuvPctRx84mR63rN5IRDvOyjyczG9aHnNE/zrYJ74imLS2/aDZpU0PPZLuHrs3dfz
 63YA7I/zwysuC0NqmAu23F33wyCK/o9FCbAXLi+cIcvc7p/tcOF1Huh69YIvmDyRnEs1
 qI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uXwU/1og6Y5YFCCkzlXH6mHIAZKAJashuR6BqLq8xE=;
 b=pnpWHrfe0cukQwDAZrw4YZXzJqVf5w2peUBUzPAd+9yf7qhH2CZwtJUJwMiYaIMbKo
 H1xlaBWkpQmRnP7CqAroeICQqUZojyiYOBZTEb3sq5qM/xMtlbzc7fsA57Y/FoKyaej9
 O2NxGKDdnW31jyCBCyDuj6U/Cccs/qLJRx99bxcwuto/jYL0RK+bCWg7+boQiElPBRMA
 FNdYVZr4HMOAtDIJgMb3yytizq3B2M9PRSf0N1ECl3cbIxeOGLSGaU+aII6v+BYOk2zu
 aVYXdnGj+a9f012PEjaxIe8juVIqKQnNEZt6GHw25M1HBuofnW0GMQX1Ab7rCI1oXA3M
 neew==
X-Gm-Message-State: ACrzQf2OvCNXVPEq8e/a7TEwYxPMpTP7afxl2XdZf8RLOOflNb1yo34b
 +DDTWrSP3Q8ebIaRgAUMNW3Hxg==
X-Google-Smtp-Source: AMsMyM60TEM79xarMEhfq2Jxp76LP2dMWcYDyD+kaU36RhUby8NBbEIQPfy0sfcton6BsQ9s3wIjjw==
X-Received: by 2002:a05:6000:1052:b0:236:6e8e:8403 with SMTP id
 c18-20020a056000105200b002366e8e8403mr34588988wrx.178.1667899391778; 
 Tue, 08 Nov 2022 01:23:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003c6deb5c1edsm11032025wmb.45.2022.11.08.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85ED81FFBC;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 4/9] tests/docker: allow user to override check target
Date: Tue,  8 Nov 2022 09:23:03 +0000
Message-Id: <20221108092308.1717426-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

This is useful when trying to bisect a particular failing test behind
a docker run. For example:

  make docker-test-clang@fedora \
    TARGET_LIST=arm-softmmu \
    TEST_COMMAND="meson test qtest-arm/qos-test" \
    J=9 V=1

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
 - fix s/target /target./
 - CHECK_TARGET -> TEST_COMMAND
---
 tests/docker/Makefile.include | 2 ++
 tests/docker/common.rc        | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c87f14477a..fc7a3b7e71 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -184,6 +184,7 @@ docker:
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
+	@echo '    TEST_COMMAND="..."   Override the default `make check` target.'
 	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
 	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
@@ -230,6 +231,7 @@ docker-run: docker-qemu-src
 			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
 			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
 			-e EXTRA_CONFIGURE_OPTS="$(EXTRA_CONFIGURE_OPTS)" \
+			-e TEST_COMMAND="$(TEST_COMMAND)" 		\
 			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
 			-e SHOW_ENV=$(SHOW_ENV) 			\
 			$(if $(NOUSER),,				\
diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index e6f8cee0d6..9a33df2832 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -63,12 +63,12 @@ check_qemu()
 {
     # default to make check unless the caller specifies
     if [ $# = 0 ]; then
-        INVOCATION="check"
+        INVOCATION="${TEST_COMMAND:-make $MAKEFLAGS check}"
     else
-        INVOCATION="$@"
+        INVOCATION="make $MAKEFLAGS $@"
     fi
 
-    make $MAKEFLAGS $INVOCATION
+    $INVOCATION
 }
 
 test_fail()
-- 
2.34.1


