Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3C43B4F8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:58:56 +0200 (CEST)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNuh-0007bE-TA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfNrI-0003pa-5c
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfNrF-00014b-UF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635260119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HydchOjaPM6cp7iyVMRMimgnp2tQrCLOoHuc2pcUzOQ=;
 b=AWM3eUEpumYxZkhE8bbV3+6ay3YxHHrXUPQUMtHI37z0O+1fuy6f9j6AzOwxgAGwnDDThb
 f2G5HYHjQOUZlnYAi0H7/bgHbfSMbnCAkIt0XjcANMxKZ84Z13v8gecXu7XN4Lzrqd8cGS
 UYVfP+pMzOH87CxzAsj6oFavNjJD1ZU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-nJ0YmWd8O-uMoUQbXT8vKQ-1; Tue, 26 Oct 2021 10:55:18 -0400
X-MC-Unique: nJ0YmWd8O-uMoUQbXT8vKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so1041035wmj.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HydchOjaPM6cp7iyVMRMimgnp2tQrCLOoHuc2pcUzOQ=;
 b=B72ijQjZ3F8yWZcWcj5hW+LAfkv2iM1S0RR2OjeZ7Y/yP9RS4yhADW/kQGQjwJxFOQ
 lZLsNY85Ab6s0pR4AlDbOnBmTGWzqufCbpShAg0YeB0pFqDvZo3tDy8zYiPH+72BPtWM
 LfDFzAJsrh9P0XB1deoNj93pLMicWoAGft3FPU2juHrLkIObHNoOVOr7nCyNwH6O4C38
 gxQJcBqQy/zD9Hr7bl+wwuPgo8nTID86V2IRcHc6pOMvd3ffpuvHcGIWxPe5z1xDpHNO
 I7gaseCFWAzZtvui627HPFg65nUKFGXw2ITSNMmPFsWvTkz5oSsXFCQ2e9R8YDwAaK4v
 ESnw==
X-Gm-Message-State: AOAM530czs3769hH3hz/I6TYiYxLgn5WEW6cxWmOHIi1nZnCREX/PwAM
 EqFdfzBXqgMN0JeHyc/rcAmRjKI6uB2eedhKdNL1saNqtmHX4LvSIePYXf2QptrudSfbzHPOddj
 i40q5kg2cyBtvAC5XI/VjgCFQbNrMva5DNfKvvMy0E6f5HEzkyNP7E5odPaGolv9I
X-Received: by 2002:a5d:5274:: with SMTP id l20mr5643588wrc.328.1635260116915; 
 Tue, 26 Oct 2021 07:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4TclYkT0qtiTo6bxjxD6df5LtmaJwld8Gnua3VCtZRWcXFHHVb9AKOSh5ZOMsY48aVEPT+A==
X-Received: by 2002:a5d:5274:: with SMTP id l20mr5643539wrc.328.1635260116571; 
 Tue, 26 Oct 2021 07:55:16 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p3sm18868712wrs.10.2021.10.26.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:55:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
Date: Tue, 26 Oct 2021 16:55:09 +0200
Message-Id: <20211026145509.1029274-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026145509.1029274-1-philmd@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
to be stable. QEMU repository workflow pushes merge candidates to
the /staging branch, and on success the same commit is pushed as
/master. If /staging fails, we do not want to push the built images
to the registry. Therefore limit the 'docker push' command to the
/master branch on the mainstream CI. The fork behavior is unchanged.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/container-template.yml | 11 ++++++++++-
 .gitlab-ci.d/edk2.yml               | 11 ++++++++++-
 .gitlab-ci.d/opensbi.yml            | 11 ++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 1baecd94606..0a736644b22 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -16,6 +16,15 @@
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
           -r $CI_REGISTRY/qemu-project/qemu
     - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
+    # On mainstream CI, we only want to push images on the master branch,
+    # so skip the other cases (tag or non-master branch).
+    - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+         test -n "$CI_COMMIT_TAG"
+              -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+      then
+        :;
+      else
+        docker push "$TAG";
+      fi
   after_script:
     - docker logout
diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 13d0f8b019f..e15f80f4874 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -33,7 +33,16 @@ docker-edk2:
  - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
                                         --tag $IMAGE_TAG .gitlab-ci.d/edk2
  - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+ # On mainstream CI, we only want to push images on the master branch,
+ # so skip the other cases (tag or non-master branch).
+ - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+      test -n "$CI_COMMIT_TAG"
+           -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+   then
+      :;
+   else
+      docker push "$IMAGE_TAG";
+   fi
 
 build-edk2:
  extends: .edk2_job_rules
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 5e0a2477c5d..a38ccbe5baa 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -34,7 +34,16 @@ docker-opensbi:
  - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
                                         --tag $IMAGE_TAG .gitlab-ci.d/opensbi
  - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+ # On mainstream CI, we only want to push images on the master branch,
+ # so skip the other cases (tag or non-master branch).
+ - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+      test -n "$CI_COMMIT_TAG"
+           -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+   then
+      :;
+   else
+      docker push "$IMAGE_TAG";
+   fi
 
 build-opensbi:
  extends: .opensbi_job_rules
-- 
2.31.1


