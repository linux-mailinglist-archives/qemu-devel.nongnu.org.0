Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D00A5A2DA2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:39:39 +0200 (CEST)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdIw-0006Tc-9p
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9y-0005iC-Tp
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9x-0003ir-6U
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso1202474wmr.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FdPExOp5O/LAXlPoH+zxAcHOediN1o3iNFX0c4pwq44=;
 b=KtlIWr50XfmRD9I83iHkte2I265dva7nMORMptjaPrvP2q/59eYtSEpzZ7wpkJsJF5
 5ky20piJV8cKK4DQP+Ekf/1SwOfpG/edncCJ6rqcJ1cGiTPmsRwj+LxgXfSCMxIDVVj9
 mFmK6I2OC8mHUF79CKvSmjXl5g0mA28txn/2PcBAzEu3uu5+Fxyk+KY+8GKWCF0EcKCx
 vqrwwflhWBxPFYe0tRMXwACstJR8NqxtJl3CVeSLNm7dcuhVIRI+LQgA8ngNifJN6cGI
 d7IEUA31FyoHnmSib5SCBeaYrNb7wJwH3Cch08XgCQ/W5ttni8gaFfU4kNj/qbikEJn8
 YUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FdPExOp5O/LAXlPoH+zxAcHOediN1o3iNFX0c4pwq44=;
 b=62uQ60h1nP5xoLe6j5xXIMDH5L+lYYbrXnYC6WoaDCMMyP3AmDemijg46a3xjKoibr
 d+LuhPZdvel8MQzAuqTuUT7I9Z9TznT7R6Xjvc2BsMcaKOYYnqntfrpoqiqAuDTMVi2E
 QmfXjKIHZvyANAfAfY1cF86hM70qeyRlQKdoCaK7BexJvLu7QZxK9JYqvHKmTPmuBgo0
 Tq6R7X8tQLQKGqT9xvbhJMvk+pPd2S/P3O41BHFwcsS+83FXlO8f5/JVUEGQNkg4Kgu6
 VZHeNmCoQrNihL0JTIH4atTHk91cjp/ZsHPd4aQeMqsBehgH/Xgz/AHKXULuXEZvj+KK
 +Fhg==
X-Gm-Message-State: ACgBeo1QmdgNY3hXH5zKyxK6hAKuOuLYhtEC0u6igd/Zf2Qh5hyLYZ6b
 /zXugmApD+yVHqhWDW/v7TmJTUDuxnK0BQ==
X-Google-Smtp-Source: AA6agR7h6rsgBLPqSuVKSXXLjnSWjl40Nh63IALHOPtqgtcz7oCMg5vOJPc7LlqWwfdZ6sHqUy0xvQ==
X-Received: by 2002:a05:600c:3d11:b0:3a5:cd9b:eb08 with SMTP id
 bh17-20020a05600c3d1100b003a5cd9beb08mr420535wmb.82.1661535019906; 
 Fri, 26 Aug 2022 10:30:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d4e87000000b0022587413219sm306697wru.16.2022.08.26.10.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A04451FFC3;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 11/25] tests/docker: remove amd64 qemu/debian10 dependency
Date: Fri, 26 Aug 2022 18:21:14 +0100
Message-Id: <20220826172128.353798-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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
2.30.2


