Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687C5A2D90
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:34:54 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdEL-0000U5-Cl
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1Z-0004Hu-Nn
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1X-0002LX-MO
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id bu22so2218722wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GFbSW9nX+Lz1wsVbDe5pJ3v6USbvySq3ddapeAh068c=;
 b=v/vME9OwlrWup7JIu75HPx8pUDY+ukDG44DrTuQlxNoIn6DA19pIZXWFtGLnyRA7Dl
 TR1yp6hsqlAo0YwpUUNmXxNv/KtvJ5LPePKaQjhrhhwfssqz0Fn3wNONvjZlwkyWQbKp
 n4sQBcf4FkBMYMu9UmgykifkWlZX/rDO2Ha+yzSqJD/wubajMWiPEQAe/FfI/fukPP1d
 yPQvP3bY0F7z2s4Jl0g8dEdof3e1MMV+fV7r9yK2EKp8jCe0Hpl6IfivDpvKaCC22iaW
 2j4QVfpeTizvOtfW6Z5mbUv/bhzlh7HemXoD0IHRbnFwrD6zXtoVM06tFNnxu00OoATU
 m5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GFbSW9nX+Lz1wsVbDe5pJ3v6USbvySq3ddapeAh068c=;
 b=eEop6IOuwaMgeu4tkSB1oZDKVeD6CmPrzeRqzruVqEzAOHtNjZDrbYw98Ya+ADXe1f
 gBaCh6G4f3R3oSX5JfjWTNwucBGRKdtIwHTZUNvpWJLQwf1ty0tq+WITWx295pkH3+jp
 MhQDGWgdRsPZ5msvQaVUzbVCtozYEEITu8FD9vYRGxSpiPuXnwIAghfI6MVJ3hPCTmsf
 52aa1/ty49RTrPWy3SXpzD2jS9VKPm+NZ6dfXkGtBLJYmNGuFH8/AHyuOh1svcn5gnQv
 xECS2XXaeFCHhNJMfLU+ZzZToliNMa2trfdmwQS5BPW1RboQ4qQlDUUZglBolp3NL4Se
 w+2Q==
X-Gm-Message-State: ACgBeo3mtxAm8HESDb1lW5wb5MPLjmnqbuqhWxV7HEzWQTQLf/3GlZwg
 w7uwG7idFCqSu23JylMNs8sfrw==
X-Google-Smtp-Source: AA6agR6DM7X0PPVdzzBkEMjpQAODLsr7aq+K00AHPcpo150qe5njPlOv5n0o4v6Wjp0+1EQwWsQpMA==
X-Received: by 2002:adf:f105:0:b0:225:2e4f:e14 with SMTP id
 r5-20020adff105000000b002252e4f0e14mr360959wro.444.1661534498423; 
 Fri, 26 Aug 2022 10:21:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003a6a3595edasm220967wmm.27.2022.08.26.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93A281FFC2;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 10/25] tests/docker: remove tricore qemu/debian10 dependency
Date: Fri, 26 Aug 2022 18:21:13 +0100
Message-Id: <20220826172128.353798-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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
2.30.2


