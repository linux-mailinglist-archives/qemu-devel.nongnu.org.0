Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0255B8D37
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:38:32 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVPD-0006dh-3M
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnz-0006ct-C8
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnx-0002p7-H7
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bq9so26452623wrb.4
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Kz7cAUufaTnZbTesKWGFYDQNhU7/ZM8fW5VV1gae+ts=;
 b=SeIErpG0KLQqEWuB1JnDDhKD+LnBtPvYeWmsn/XBKpkpOwy7sLEMH7rrcWuRaCcuWT
 YEeCdo1IcnOxHnavTJo75HZIWe29qVdcic3REe0gckGM6ucqgJOSchsrwvGkRbVLjSwC
 m86+ZqTbshGUYMTHntuuSokFxXb3x0x5cqdRDpkvY90seLnMPVbR867AMIIE3Zedp1jF
 F4+nX1FAyKjtuOxULz75TdgS+YBPTBEJ6pbog6RG7/TImCKomqrxPoq0X+dACJKHnaGR
 N36HzSXwJ0B1gr6UF78ZBEWf0pZSorg4Z0wbVS7P90sC7I73aMYeSe/c1fZsK7kWRNM7
 0J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Kz7cAUufaTnZbTesKWGFYDQNhU7/ZM8fW5VV1gae+ts=;
 b=oyYV2BmM0geV//eDXOucd9fYgX3UKOg/lCI7B/2wvzUDLzqbiBTNaWv4zQ/tAtqDTy
 4i+Bx3+pwONgr4QLatxptCDkco6S310da26LedRLecN90JA1fGayjdEuOibc1lSjESzE
 48qxYr3OwDJe9Sbt3EY+p4pmscnFDl5YFD/+uNcPAxw3mtdA7Mpweq3lW1O3qCiXsgLC
 KQgm++BbbUWT9keCuRQunPORqFEwad0YVkW6vyFlIvh7dPQWXG71bws7W39/oA8d0JOo
 1HWQMfdgrHVJkfvfj4dCBxwMIjVpdY+5SL4pd6Qb1fYdLtMYLDBsd0pMvteCrgiXVBWD
 2CqQ==
X-Gm-Message-State: ACgBeo2KDNdOFFb6m85RpDb+0KP6xOjNtwYjL4WFSWYc0LjKl7AqJi6V
 0K8moIy82mobFy9mV866QH4k0w==
X-Google-Smtp-Source: AA6agR4P72APSVLksXA4Au90Zt1NFJc705ZnqZKMkU0QsMyxvhyB8FKCHApAmJ66Qin2xNKGuYEa9A==
X-Received: by 2002:a5d:5888:0:b0:22a:72a1:5140 with SMTP id
 n8-20020a5d5888000000b0022a72a15140mr10695521wrf.408.1663171200076; 
 Wed, 14 Sep 2022 09:00:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm13850145wrq.12.2022.09.14.08.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5CBD1FFC7;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 15/30] tests/docker: remove tricore qemu/debian10 dependency
Date: Wed, 14 Sep 2022 16:59:35 +0100
Message-Id: <20220914155950.804707-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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

Fixes: 39ce923732 (gitlab: enable a very minimal build with the tricore container)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: 39ce923732 ("gitlab: enable a very minimal build with the tricore  container")
Message-Id: <20220826172128.353798-11-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml | 1 -
 tests/docker/Makefile.include    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 67bbf19a27..611c6c0b39 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -148,7 +148,6 @@ sparc64-debian-cross-container:
 tricore-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e034eca3af..5c9398bbc9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -132,7 +132,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
-- 
2.34.1


