Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF6584E52
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:43:52 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMX9-0001y3-2A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9x-0002VP-Oo
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9v-0005sB-Ux
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso3819306wma.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Did8YFLxDWVlc9GWzEzTmKN+csU0Qz/8Q4CxgKIKjyY=;
 b=gnQHMUCxSSL1DWQXEa44/S61aWJs9DDqjWREMnEgHtrdES7oSV5vqCxfea+RrHWSL6
 2BlzXf6dB88CHuUpsogY5wdLUhMhyrvOrLlo2yijH/pHWMgZerD9V9c6Bi9sqBYFkx+p
 Fcgdp/D+ufqLnuZ2pa6011cHeY2QFEftEZnYXB4yKDPwzjd95SaFjTq8VFE4147tyxot
 1r+cGksScT/pFhjNH+UrrKzc5CscZZdVi/L4AiKMn+cxDTdfIhm6RotDewrkEK9WKEg6
 g6hYh/NGwL8KM9xPalmN18XrF7lg7tH4l9jr2m93sD9Ep7QOUaZLqUJAsjYc6R0LFWk2
 AQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Did8YFLxDWVlc9GWzEzTmKN+csU0Qz/8Q4CxgKIKjyY=;
 b=XH3H6kU1nUy9nRuAAm+RNLAaP/GbIjW9EPWB+NHKSYlBhtyR/quhwDFz8tyzY9sLcr
 BgQCG+x57gfga2QmxOMYQC2EvTrk+Gsau0suZ9Wfr63lypzGBOgq38TX7+j7EWQW2FH0
 sZjOm6DqqJBHErEvSOUdRNGT4yji9iJ9g2HOivYoRTn0hypdVwV9hZOB71/X4uCdd8lE
 kl72yQoBONP/XzyZCAcKwZ4bDoH/mhfA44dZEfZyNWGkNoNXMhwSyjpDtnO7hUxdOi1Y
 sPBj56kbwLXNH5y87JB0AnmdR7A5/r6tx0DGTJu7zZ+xjoNmqOUuRFqC5a4nDFc+bY+c
 Le2w==
X-Gm-Message-State: AJIora+upCzf/4iOsxs+vuC3DnB69xuIuTBE2qTjNsR9kOYYfn4vc2Ke
 JUvoobFHUX/+jB6cf0qme6Xpbg==
X-Google-Smtp-Source: AGRyM1vJHmxHgLkdP0TVfl6yT5Q8MWpissVbnf0Xjd4tsq0FYH+u2UMQcnvjg9+hLjI9Poix5bhCKg==
X-Received: by 2002:a05:600c:893:b0:3a3:1d8:c7b9 with SMTP id
 l19-20020a05600c089300b003a301d8c7b9mr1775263wmp.156.1659086390345; 
 Fri, 29 Jul 2022 02:19:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b0021e084d9133sm3750627wrl.27.2022.07.29.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FCBA1FFBB;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/13] gitlab: drop 'containers-layer2' stage
Date: Fri, 29 Jul 2022 10:19:33 +0100
Message-Id: <20220729091943.2152410-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

Since we express dependencies via a 'needs' clause, we don't need to
split container builds into separate stages. GitLab happily lets jobs
depend on other jobs in the same stage and will run them when possible.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220722130431.2319019-4-berrange@redhat.com>
[AJB: fix typo]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220725140520.515340-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index b7963498a3..505b267542 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -1,20 +1,20 @@
 alpha-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
@@ -65,21 +65,21 @@ hexagon-cross-container:
 
 hppa-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
@@ -92,7 +92,7 @@ mips64el-debian-cross-container:
 
 mips-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
@@ -105,7 +105,7 @@ mipsel-debian-cross-container:
 
 powerpc-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-powerpc-test-cross
@@ -127,7 +127,7 @@ riscv64-debian-cross-container:
 # we can however build TCG tests using a non-sid base
 riscv64-debian-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
@@ -140,21 +140,21 @@ s390x-debian-cross-container:
 
 sh4-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
diff --git a/.gitlab-ci.d/stages.yml b/.gitlab-ci.d/stages.yml
index f50826018d..f92f57a27d 100644
--- a/.gitlab-ci.d/stages.yml
+++ b/.gitlab-ci.d/stages.yml
@@ -3,6 +3,5 @@
 #  - test (for test stages, using build artefacts from a build stage)
 stages:
   - containers
-  - containers-layer2
   - build
   - test
-- 
2.30.2


