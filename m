Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B251506796
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:20:28 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk27-0005dP-C9
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0005Oy-JF
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsV-0008Kr-FT
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:33 -0400
Received: by mail-ej1-x629.google.com with SMTP id k23so31538959ejd.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ajn+CRphVUO0J46IG2p7xbfi5mcbxrS2eQ7d7RjFd6c=;
 b=rT3YpmSNH7k8+worrdmsCcTNKnK3fsY33IWE+zdxeO7906wsz8ReJlxVk9NVt+L6FY
 7dWoSLO8sSU0SJ1eaAfQmcHecWlz5T9Yqvyebbktx5A1cLGzWwFuQfHfCjXMK3bbDsBE
 lMTMmUMKjNkI0ekKjmL95yQXWC/7uGV+jgd20psKsMyOiYUUvqDMhqBRbSLBhVREOcEc
 +SSKWtixSKyQaaHKBxWJRHhHLc/RTQTCKZVv25nyX+avBvrOsoVsx+tdZLF1tYxXkcCZ
 CNHqXuk4fiHoOdckzRA4PtAtoZfURIrCF5tHVZMX0aOK/j8LjFRluQIrUG7xVF3a9Mnf
 NM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ajn+CRphVUO0J46IG2p7xbfi5mcbxrS2eQ7d7RjFd6c=;
 b=BnkkzGSQ5noASs1pV8Tda+4/z7jB+S/IU1cJwypBjSgC5rADKOea1EvuW4jWXPyPsJ
 mMxJ01EcVWbQHj/HwPp2/k/f2NOwNqua0q0jywtfayhZ2YRc7LwLonawASW/8UkOYVns
 fXZj1l7VcSFr1kD6WFOKn6m2OTWDGrzrPhKC2Y9XdAJwpz2HBuVrRb/Dyf8AwR/Q/ROh
 /ui3zkylSHOS8/RzdSQIXdbuQEO4bo7cOD/X5+wpr81koVg4X5a6KUPTXNTcszBXZGBh
 Y1ReOIcH2fkiVziuyeRzyzngLsqgrCK3hynos9/0hRbN6G5NOOLKZPagz4ThnU3wU6+u
 miRw==
X-Gm-Message-State: AOAM530NMAT/jDlOLKY3G1WaH0/xuOYIvEr3UtO1uu1AThKXJ49E85tE
 ybQggGMYtzoUZ14+nfRCsdrsRQ==
X-Google-Smtp-Source: ABdhPJzk/t0WUNPGnnlBUngb2ygXL66G/kRbXWYd7e1rxnxGZkDdWnQ4N8Zfre/DBZbZqjYFZMey0A==
X-Received: by 2002:a17:907:7b83:b0:6e8:c2c8:1f14 with SMTP id
 ne3-20020a1709077b8300b006e8c2c81f14mr12358644ejc.356.1650359429032; 
 Tue, 19 Apr 2022 02:10:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a50eb8d000000b0041f112a63c4sm8249385edr.52.2022.04.19.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B62231FFBC;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/25] tests/docker: remove dead code for linux-user
 containers
Date: Tue, 19 Apr 2022 10:09:59 +0100
Message-Id: <20220419091020.3008144-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

debian-powerpc-user-cross was the only linux-user powered cross builder
and it was removed in commit 80394ccf21 ("tests/docker: remove
debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
around it since it is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-2-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e495b163a0..a6a5a20949 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -229,12 +229,6 @@ DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-# Rules for building linux-user powered images
-#
-# These are slower than using native cross compiler setups but can
-# work around issues with poorly working multi-arch systems and broken
-# packages.
-
 # Expand all the pre-requistes for each docker image and test combination
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
@@ -266,11 +260,6 @@ docker:
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
-ifneq ($(DOCKER_USER_IMAGES),)
-	@echo
-	@echo 'Available linux-user images (docker-binfmt-image-debian-%):'
-	@echo '    $(DOCKER_USER_IMAGES)'
-endif
 	@echo
 	@echo 'Available tests:'
 	@echo '    $(DOCKER_TESTS)'
-- 
2.30.2


