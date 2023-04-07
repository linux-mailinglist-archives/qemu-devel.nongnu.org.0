Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814066DAF37
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:04:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkncG-0007Fl-HN; Fri, 07 Apr 2023 11:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cconte@redhat.com>) id 1pknUW-00053v-7e
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 10:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cconte@redhat.com>) id 1pknUU-000468-Fc
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 10:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680879301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dzFO32mdrAR/VUPVh3EYrQGRuh0hQbS52iKIdgPQxfk=;
 b=GnHFak6dUr88SbZjpKLl4NZNTy1InueDGMAZCQnTHTNsQKINB0f3qFXR5ey8CdMl2ds0gy
 ic6Ggs52hbbZ4edhEGN4OIKJqXxLDUCDI9Pw/UVEIY+K2uXELPcmZYlniCx3Yp1KvL4aLj
 c1I2PXx8zQjFY5VEg4MIDYrd7imGQUM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-oQnr7m0LOkixPUqD8NhCjw-1; Fri, 07 Apr 2023 10:53:09 -0400
X-MC-Unique: oQnr7m0LOkixPUqD8NhCjw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o1-20020a05600c4fc100b003edecc610abso853309wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 07:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680879188; x=1683471188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzFO32mdrAR/VUPVh3EYrQGRuh0hQbS52iKIdgPQxfk=;
 b=LxSx0ZkYFfOY5VxHZFqWW7Qb/g9lnIQOnetsZDB4/uABCRU5aSqOuSSCMHqUfxtiAf
 itnsAX9Mk3FNvmwBbejlJQiQokQMgMe0vkLJf45To7bUCBjp2mWvDArITuWmq0U8NOfL
 bK7z8JHMIz0qPvkiyXOa0Eez09M/uuNLUyAmkH05wZmI5Qkqt2rglX6uxMvU+GbyeZ2k
 SdRDQM//3cZQaO2W8R0guybI3n+Rk53/2nsXKOm9DKdymrr/ysZxbPsdTkWqpxQKeRz4
 9zADvH+05ZSpJ/0Dis5gM1QTkB0ZOy++Y+D845zklk95/m84Ad9cZX81xl9XYSxPXntS
 0icg==
X-Gm-Message-State: AAQBX9f+6dMEVujnePAfsrSNjM3Zu9wW+EF1x0QOfz0M/rBXWN4+SmtI
 m/vYSL8B9KXcb7Z2RWx6s/g20TEAV9ZptGTek3zh61NmL8SkVF+EoWWYBZ9oF7Ers1vdSaW4/2F
 CJMBCQCw4CReJxAJgdKfC97vD8dDpztnbn0ey6w/cjmqvj8TJXhG9uWvBs+G3fYIu0waUL+i3
X-Received: by 2002:a7b:c018:0:b0:3f0:39ab:347c with SMTP id
 c24-20020a7bc018000000b003f039ab347cmr1455115wmb.23.1680879188349; 
 Fri, 07 Apr 2023 07:53:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsNfvI0BGt8eVATfUMTbJOZGwcpog9fWV4QDBnsqGsinx3vdtpzAOVMLkK0w1jneHzBMGwVg==
X-Received: by 2002:a7b:c018:0:b0:3f0:39ab:347c with SMTP id
 c24-20020a7bc018000000b003f039ab347cmr1455104wmb.23.1680879188039; 
 Fri, 07 Apr 2023 07:53:08 -0700 (PDT)
Received: from pinkpad.lan ([2001:b07:ad4:d988:168b:4301:918a:373e])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003ed2433aa4asm4812694wmb.41.2023.04.07.07.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 07:53:07 -0700 (PDT)
From: Camilla Conte <cconte@redhat.com>
To: qemu-devel@nongnu.org
Cc: Camilla Conte <cconte@redhat.com>
Subject: [PATCH 1/2] Add CI configuration for Kubernetes
Date: Fri,  7 Apr 2023 15:52:51 +0100
Message-Id: <20230407145252.32955-1-cconte@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cconte@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 11:02:57 -0400
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

Configure Gitlab CI to run on Kubernetes
according to the official documentation.
https://docs.gitlab.com/ee/ci/docker/using_docker_build.html#docker-in-docker-with-tls-enabled-in-kubernetes

These changes are needed because of the CI jobs
using Docker-in-Docker (dind).
As soon as Docker-in-Docker is replaced with Kaniko,
these changes can be reverted.

I documented what I did to set up the Kubernetes runner on the wiki:
https://wiki.qemu.org/Testing/CI/KubernetesRunners

Signed-off-by: Camilla Conte <cconte@redhat.com>
---
 .gitlab-ci.d/container-template.yml |  6 +++---
 .gitlab-ci.d/default.yml            |  3 +++
 .gitlab-ci.d/opensbi.yml            |  8 +++-----
 .gitlab-ci.d/qemu-project.yml       | 17 +++++++++++++++++
 4 files changed, 26 insertions(+), 8 deletions(-)
 create mode 100644 .gitlab-ci.d/default.yml

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 519b8a9482..f55a954741 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,14 +1,14 @@
 .container_job_template:
   extends: .base_job_template
-  image: docker:stable
+  image: docker:20.10.16
   stage: containers
   services:
-    - docker:dind
+    - docker:20.10.16-dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
     - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
     - apk add python3
-    - docker info
+    - until docker info; do sleep 1; done
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
diff --git a/.gitlab-ci.d/default.yml b/.gitlab-ci.d/default.yml
new file mode 100644
index 0000000000..292be8b91c
--- /dev/null
+++ b/.gitlab-ci.d/default.yml
@@ -0,0 +1,3 @@
+default:
+  tags:
+    - $RUNNER_TAG
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 9a651465d8..5b0b47b57b 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -42,17 +42,15 @@
 docker-opensbi:
   extends: .opensbi_job_rules
   stage: containers
-  image: docker:stable
+  image: docker:20.10.16
   services:
-    - docker:stable-dind
+    - docker:20.10.16-dind
   variables:
     GIT_DEPTH: 3
     IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
-    # We don't use TLS
-    DOCKER_HOST: tcp://docker:2375
-    DOCKER_TLS_CERTDIR: ""
   before_script:
     - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
+    - until docker info; do sleep 1; done
   script:
     - docker pull $IMAGE_TAG || true
     - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index a7ed447fe4..57b175f5c2 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -1,7 +1,24 @@
 # This file contains the set of jobs run by the QEMU project:
 # https://gitlab.com/qemu-project/qemu/-/pipelines
 
+variables:
+  RUNNER_TAG: ""
+
+workflow:
+  rules:
+    # Set additional variables when running on Kubernetes.
+    # https://wiki.qemu.org/Testing/CI/KubernetesRunners
+    - if: $RUNNER_TAG == "k8s"
+      variables:
+        DOCKER_HOST: tcp://docker:2376
+        DOCKER_TLS_CERTDIR: "/certs"
+        DOCKER_TLS_VERIFY: 1
+        DOCKER_CERT_PATH: "$DOCKER_TLS_CERTDIR/client"
+    # Run the pipeline in other cases.
+    - when: always
+
 include:
+  - local: '/.gitlab-ci.d/default.yml'
   - local: '/.gitlab-ci.d/base.yml'
   - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.39.2


