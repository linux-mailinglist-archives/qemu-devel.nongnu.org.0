Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D15067C8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:36:20 +0200 (CEST)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkHT-0004oe-FP
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsd-0005SL-HP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:40 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0008Mw-8R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:39 -0400
Received: by mail-ej1-x635.google.com with SMTP id bv19so31558281ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1BXd5TXK4RryP0nBXexyWzTl+2FcYfIbCYuVsNwqQE=;
 b=Fhx7nYm+8AGda3ZZIBfz+4K2hFXAhMqr402/7Q9OQmmk6qDfxkUBQiEauufU9wTBSq
 nm0htcyV3Mybv05xR75gEcFQErZOh3h0HHOfbwNWCstlGcDFZ2npJ73kRoabkvYAOPvR
 BK80ToMVX4Nsek8XNdOXtWVdJ2d9hXx8o8czDrQqsDUzzC8r8KhNLLFYAQe603xb2jJq
 rfuv+95HBWrVL3dkKdDkdPVNJ9wdei8EIZVtGZ2M//kpTz5lnED3Pp5GyQaYxhwS7VTO
 DJinobz+BpuQxR02jRWgRHxYU55P5H9/OQBu81fH+BNDkFHKwbV+TfejA/a1nKhdF7uK
 aHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1BXd5TXK4RryP0nBXexyWzTl+2FcYfIbCYuVsNwqQE=;
 b=oH+eEUhTF5LRSAjF6X+4LO6QURir1q3VdtuwAxYBIKNZps/FRHrlzkKPhoopxSm01y
 ++BHL+pfBkXvoG5sz8ht8y/Z4Lf3uY+Y/Be4eqmr1ergMlrI/EjdiyJ3ZqfuiRlEJ76X
 yBE/msD6ONXqeCsq9zKBbVCDywMBx9+tv6yV7z5E5RO402gq3fRB75vI+RrhTyFyrUtR
 8cBVHHiS/gUiauhvaH3z2SNpzx02F671HlzHVS21AA/P7PA2Ucxz7vPjW3JdHVI3ftki
 QDoTjXFtMf3M/kx3CnldKagNWfeH1BTMoF9n3oDeTebzV+ZKk1+K0hGJ9/O2nK0q/qEq
 hAtw==
X-Gm-Message-State: AOAM530zglf1WCw/3MJlsfJb1ZPW4MEdwYxCRozuv1p02wDIBRPFufM5
 mPhEGcW4rk6CAz6A+QhdvdhYKQ==
X-Google-Smtp-Source: ABdhPJwkLWPHLlxL8EVTsbWWI4IOq75sSIT6IctH55+PAHw7MfjoY/mLf65iTqHoHCPpi1lIgcxGeQ==
X-Received: by 2002:a17:906:9754:b0:6da:7d72:1353 with SMTP id
 o20-20020a170906975400b006da7d721353mr12406389ejy.273.1650359432234; 
 Tue, 19 Apr 2022 02:10:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm247730ejc.74.2022.04.19.02.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E759B1FFBF;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/25] tests/docker: remove unnecessary default definitions
Date: Tue, 19 Apr 2022 10:10:02 +0100
Message-Id: <20220419091020.3008144-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

The definition of DOCKER_IMAGES and DOCKER_TESTS copes already with an
empty value of $(IMAGES) and $(TESTS), no need to force them to "%" if
undefined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-5-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c8d0ec3c66..751151d7e9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -8,11 +8,6 @@ COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
-# These variables can be set by the user to limit the set of docker
-# images and tests to a more restricted subset
-TESTS ?= %
-IMAGES ?= %
-
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.30.2


