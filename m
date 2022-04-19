Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82055067B4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:28:37 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk9z-0005EI-3b
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsd-0005Rz-7B
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0008PB-BD
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i27so31525759ejd.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uUtM/awZJzxHsahEaoqFNclAEXPyMd8cUhld2J+yOU=;
 b=m8b/+IxE4WR09H0X/2iY3fvSFgm/vJpYwI2OVDoHnCqYAl/VKpkJixFRXeLj7QUQt/
 LrhyVkRhBVV3bKZn80PNkOsXLs9has/sWgSaCtmdD+HeUTGMGOt/USacGrm3DuabEtVg
 LzdsnRdGsL+V91So3D8W53ts9guP3dNkrt5+IRDNTH/ieC6R+khiz4g7j98zzrh+QR6D
 jlv2uEJKmS2ca7z8TgBBJpRGSXJfrW4gB4wuEOkoiMZqCB1EAM2NYAosoh+9c1A8l8nL
 H5SUVrZLPZv+CCFXglWkRIJuwDT6NYrkN8+QPeZj4zNGi4nB3b3XSpQe2N0cqKDor23a
 NkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uUtM/awZJzxHsahEaoqFNclAEXPyMd8cUhld2J+yOU=;
 b=KWSrKVc1OfWYM0pAjQ47lBWfM4bhwDz0ldsZ79ypZnIhCQK4hpOc5THEM1H2CSpyMg
 oDLFkqbYLgUV0TZj1otg4eYgkZVbFZeiNIhkgUcon+gcp/lVrRTX0kqqLLEmUF3kn9r/
 nzE5T7jG6T+ZE2ZiAlqhqTi3NULH7NgHACK4JACjzGHC3Y+vVpoWlAO94OE61PpcZNVQ
 sAqqK7zo52MJlkUDvZ2Qb+jyQ03WspF5Szo1dQ4MEw2GhD9Tx0PLm9z3v/Bhelji0yPf
 DNC4+XSCTfMANOPReJQ4GSKThXkznPXQw0fIcuuCDHihxz9W3eK9J9GgIOGzTZ1tyoya
 mo7Q==
X-Gm-Message-State: AOAM532LxfosKhZVl3KQ5cM5umNYhSFJxRVnOSys/1MXUdjFgrGmbFVP
 tGVIlfL0wY7iPU4Owf/gaKPNGw==
X-Google-Smtp-Source: ABdhPJxjlZd80i1sNesWW03CfGe1MGdF/0uS+gYrB6aRNEX2l5pqkuVn+HUfCMXS7wv7wJIK8cZasA==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr12609361ejg.413.1650359434561; 
 Tue, 19 Apr 2022 02:10:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 fy11-20020a1709069f0b00b006e8b68c92d8sm5380284ejc.162.2022.04.19.02.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBAAD1FFBE;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/25] tests/docker: remove dead variable
Date: Tue, 19 Apr 2022 10:10:01 +0100
Message-Id: <20220419091020.3008144-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-4-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 06c40a9320..c8d0ec3c66 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -13,7 +13,6 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 TESTS ?= %
 IMAGES ?= %
 
-DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.30.2


