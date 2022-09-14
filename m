Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DE35B8CC8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:22:42 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV9t-0000QW-U8
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUny-0006bE-3I
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnw-0002oe-AG
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e16so26442594wrx.7
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1H7BYOsMjX27yWey90pXEdizOhBIsoyHQ4lOXwgMOZo=;
 b=lqxovLHueUOkrLTmPhKjzEtDaY97Kz7z5xyMb9yy1hWILL8X844ObS1ZTRbD59A1yO
 ebNRY3MXdaLcGx/mZINEf+dXclke5UiRT4LhYimELouuaLAVWrCFCpPu2XnrNhghtk24
 EC4e/YZsRoMP/JSnGu1qWTAvYSG3YrMqmEV4zSw40DuAiM0gezSoPvlfIDKccsplr5Or
 PPzEf54AerIM3iYv54p9Sx8aSdEDhW0CNDGoaFK68v4acXCi6xSfl7cOCxIMyDnFhCqt
 Jm71XNF8qZCuBUDDC3X7xzVN5Hf74kxE2/zvWTe8u+P0tu7T+34q4oKLZw/E6g8T+ZFn
 LJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1H7BYOsMjX27yWey90pXEdizOhBIsoyHQ4lOXwgMOZo=;
 b=d/JL+7T2UhZWaB5OTz88VsJjXfITq3smRAPFGh3p3XZWKv6ClXsAwiJS4dX6hN9SpN
 ByJfdlfn798JuGl/Rb+YL7UUck6GHSSHwl11ObqI238s5ftzwEPgWaioAy+hkTYa50J0
 sXOrOcgnNObq24rV03cuyJZsuHodP/HEQuQQT28ZR2IFs/B2KD6OkTkkKjfeEzjYA4aE
 ++JY5Wneyzyx48deRtbjccRpOchpYiyPjxIZCdIK5Hrw20lyYt8wbTMvrBNnfQI4ECHm
 Gr8rLhsQI6Obv3VObI4DoeFTcvqoOjY2oDUW6sFjCSWOaf+fsCUKjEHhzMPe7R5aAkKy
 MfHQ==
X-Gm-Message-State: ACgBeo3IDSLAc8g6Mku6W5N4eTNoOFXGwfuoXTz7GSuWTLSnrU41svBj
 FiaMhO5U14no9ZihwFYtNnVZF6qZACPp7tm3
X-Google-Smtp-Source: AA6agR5sDFMbFCHpLC6MzzVHqGB9O8TlJroRxI6DmXF80DejfbUTU7KXF+O+u9Sah3VogRtl+4NQbg==
X-Received: by 2002:a5d:4dd1:0:b0:228:e3c3:67a with SMTP id
 f17-20020a5d4dd1000000b00228e3c3067amr21878894wru.411.1663171198789; 
 Wed, 14 Sep 2022 08:59:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a05600000c300b00228d6edade0sm13627274wrx.46.2022.09.14.08.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C111F1FFC8;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 16/30] tests/docker: remove amd64 qemu/debian10 dependency
Date: Wed, 14 Sep 2022 16:59:36 +0100
Message-Id: <20220914155950.804707-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed removing this dependency when we flattened the build.

Fixes 9e19fd7d4a (tests/docker: update debian-amd64 with lcitool)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-12-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 5c9398bbc9..c3375f89c5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -73,7 +73,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 ifeq ($(HOST_ARCH),x86_64)
-docker-image-debian-amd64: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
 else
 docker-image-debian-amd64-cross: docker-image-debian10
-- 
2.34.1


