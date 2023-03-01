Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AE6A6F26
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBt-0008Gb-D6; Wed, 01 Mar 2023 10:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBk-0008BG-Jx
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:16 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBi-0007dV-9u
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:16 -0500
Received: by mail-wr1-x431.google.com with SMTP id h11so1853461wrm.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlywfJTD3Rvj2Q10jhHFgc9EYa6EV7ps8ZtC4o22SlU=;
 b=BBTzH+v0EBuhyiKJvSWVJ/lZvSRyXBeg4W5GGfjoS4dClYAxG0AgLE8TGq9PBp1pv4
 QoZtcVRih6nvaCRdflvMisqz5zDcbfHrE59avARQeUCxEzSCh17zs/t5q++2vy2H2Mpm
 +Xo/N7LW7aOl98GDeGSe7OMZbOOaHG40Trir2Lab7W9wq+cnj9g9PafhkPfKuJlm6WVB
 6Y8L3ug/HoD9gOsXcHd3trGtv8JNjRdnCTrCfDfgCCwuG6SqXiAysnqxng73bptHE0W2
 G7ZYF9W9xaSC/9ABrWXdTK8LvQfDMAK0dDkKrewqSEmYOLhk6aHdu9R1DFqShGdCC0tZ
 v2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlywfJTD3Rvj2Q10jhHFgc9EYa6EV7ps8ZtC4o22SlU=;
 b=QO2BiRigv2Swn78TNqZVGrcHB0Dx0B6PE9abMI8tXlL22G4AbMMjb1xqh9uTvxipJ0
 4XsiyMEkNEVaML2hcAnqdUL7/R93rd/cZBiqYfXeclLPXbhRnxWPj32hfVuBUK5noIQD
 X3s4JlEwPyjAik/68AZODJFAvTnrlxSmeN4Xzmy1x/SShN8wKlh3A6PiBjizmqipcGtF
 wU/g0MUxmfOnuVbg7IHVuLQZVNMlcvjc3nlEzzf1WvOkH3AjX3MtCZGH5DNg+IVQ9KQ9
 BejDgyA3887ng+SwZdpy0UDkBiF4IZHgM3BLs1Iqy57gsmWl7onRNAsg7bVd/0zQ7nSM
 XVIg==
X-Gm-Message-State: AO0yUKW51zzLupWyiWT3ddWzUPODfTPNSdZ6PqH3H6a0PIKX7339zPEG
 iI2oIP8zvRrWDUUX8FUWPRPyCA==
X-Google-Smtp-Source: AK7set95qQ5l+l3VVO2TdPBNANfKT6Z6aIO21GPV6YUSGKh1zHoQkWMwFPHQ9CAyvZ5vvzwJtHnQPQ==
X-Received: by 2002:a5d:5111:0:b0:2c7:1755:30bb with SMTP id
 s17-20020a5d5111000000b002c7175530bbmr5229103wrt.10.1677683772869; 
 Wed, 01 Mar 2023 07:16:12 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003e1fee8baacsm20099468wmh.25.2023.03.01.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 450491FFC5;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 15/24] gitlab: Use plain docker in container-template.yml
Date: Wed,  1 Mar 2023 15:15:55 +0000
Message-Id: <20230301151604.1948813-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Our dockerfiles no longer reference layers from other qemu images so
we can now use 'docker build' on them.

Also reinstate the caching that was disabled due to bad interactions
with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
BUILDKIT in GitLab either"). We now believe those issues to be fixed.

The COMMON_TAG needed to be fixed for the caching to work. The
docker.py script was not using the variable, but constructing the
correct URL directly.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230227151110.31455-2-farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230228190653.1602033-16-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..519b8a9482 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -6,17 +6,16 @@
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
     - apk add python3
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
-    - docker tag "qemu/$NAME" "$TAG"
+    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
+      --build-arg BUILDKIT_INLINE_CACHE=1
+      -f "tests/docker/dockerfiles/$NAME.docker" "."
     - docker push "$TAG"
   after_script:
     - docker logout
-- 
2.39.2


