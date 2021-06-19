Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B93AD925
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:48:53 +0200 (CEST)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXau-00086B-3a
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXQ8-0003wP-1p
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:44 -0400
Received: from rev.ng ([5.9.113.41]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1luXQ6-0003wH-8D
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u56MXUseRgglDibZve+MiNTBN5rgSqvhVS6Btv4nJMQ=; b=o6+00sy0VUgMtvNGVCy2FHdwFr
 c05EswPNSdfOhHJWl94rUHe7PkqnrphhzMxrfh0DYvFTu6OBAobSwBJToSBOrJfkvhf3uGWU0CKQM
 N8MbcmHUKztPK0vinJr+4ctTGdMBTQv9UCLfFYQ9pGpNivXzxNwIWGJxggGFduGIUbeo=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v5 14/14] gitlab-ci: do not use qemu-project Docker registry
Date: Sat, 19 Jun 2021 11:37:13 +0200
Message-Id: <20210619093713.1845446-15-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-1-ale.qemu@rev.ng>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

This commit is necessary in order to use container built by the current
run of the CI. If we don't do this, we use official containers which are
not affected by the additional dependencies we're introducing.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
---
 .gitlab-ci.d/container-cross.yml    | 2 +-
 .gitlab-ci.d/container-template.yml | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..eb134e927d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -63,7 +63,7 @@ hexagon-cross-container:
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 1baecd9460..c85ae377b8 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -5,7 +5,7 @@
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
     - apk add python3
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
@@ -14,7 +14,7 @@
     - echo "COMMON_TAG:$COMMON_TAG"
     - ./tests/docker/docker.py --engine docker build
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
+          -r $CI_REGISTRY_IMAGE
     - docker tag "qemu/$NAME" "$TAG"
     - docker push "$TAG"
   after_script:
-- 
2.31.1


