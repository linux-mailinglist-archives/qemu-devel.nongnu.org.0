Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB80341193
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 01:46:00 +0100 (CET)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN3H4-0008M8-LJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 20:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN3EJ-0007a4-F9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 20:43:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN3EH-0000A2-9O
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 20:43:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e9so7385900wrw.10
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 17:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zH9kaQjzJp5vdS3KDxE+3MxnvzsnBKZ9oFGHTD7znmQ=;
 b=SpkeDY7OxWn/zO7HKu8Apc3hFOmWbXsuGryy0ndEDLFtgNDcS4RBkCEHFolgt9lZ0O
 0DNQt5iyTjF4ILDQTJJDZnO+v5KdYMKFM3y0vzh3FUlizoAxwdywvb/sfy4VhdVqTHXP
 3/zqnxRKxXLvL7iiwaqAPTuDTu6100gLGCXc9EC5LH9N3aSgRBb2qcK7HPqm8D+mHNm7
 51L6nSA5a82jmmG3Ki9NKu2eDGm79j9bHHC+cSbTBBUZ788CLgdljnPHXYu6aHx+wKG6
 qHTdRPH0MkP75/F6rRJgKn3CbrKBAtsAemgaPcP7ucFWtU1eNlGCeXZWoFTx93xzTXv0
 vwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zH9kaQjzJp5vdS3KDxE+3MxnvzsnBKZ9oFGHTD7znmQ=;
 b=dJmKo3dzSxYx4HKWEqTm/3xQk7qorHG9kuuZzeRqMPHdZfisKUUls4C0l+MM+sPsPc
 uRH0X+dK01r8V0kYsI3RHFaRrEPptO9w0M02FAZjK1y3jIRx3nXa/daj0DFV9HJLLHXc
 gaN9P/6IoCTXYNm05lfXDo7VsurSRfLWghidi8fMOHdkEPymFrr8TYfMmaurvgJ7/jrD
 6r6ACkoxTNX44Qincv6vXm1UjyI3XGEBYL4L5QFP9URBLZIA7HycuEpF+OGGAGjQJXrN
 QEoUd7Cj2hRplqfsv01ngOkP0i41x5qCrkum9cyfNrL9ZT8g+bFtKSs9mRGucedEomk0
 Zb9A==
X-Gm-Message-State: AOAM531qj02ZMiXmDPJ2OZGIGtkaGbbofn2N+mkvQdYD0k8xiN6og5dZ
 qZ2DmiC/PzRQwIAh5bxO7LLdNf5cMuP/2Q==
X-Google-Smtp-Source: ABdhPJyBwBjsE58vAlX9hWiBIqA8QJroqBRtDK3j0BGaUxpTazd3Sn1xophF/d7Ur6z5zCHmwJTKLw==
X-Received: by 2002:adf:c641:: with SMTP id u1mr1759558wrg.332.1616114583080; 
 Thu, 18 Mar 2021 17:43:03 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e18sm5384089wru.73.2021.03.18.17.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 17:43:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Restrict jobs using Docker to runners having
 'docker' tag
Date: Fri, 19 Mar 2021 01:43:00 +0100
Message-Id: <20210319004300.3800583-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a job is based on a Docker image [1], or is using a Docker
service, it requires a runner with Docker installed.

Gitlab shared runners provide the 'docker' tag when they have it
installed.

Are Gitlab shared runners are limited resources, we'd like to
add more runners to QEMU repositories hosted on Gitlab. If a
runner doesn't provide Docker, our jobs requiring it will fail.

Use the standard 'docker' tag to mark the jobs requiring Docker
on the runner.

[1] https://docs.gitlab.com/ee/ci/yaml/#image
[2] https://docs.gitlab.com/ee/ci/yaml/#services

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
If someone is interested in testing or filling the documentation
gap, what I ran is:

$ sudo usermod -aG docker,kvm gitlab-runner
$ sudo gitlab-runner --log-format text --log-level debug \
    register \
 --non-interactive \
 --url https://gitlab.com --registration-token MYTOKEN --description myrunner \
 --tag-list 'docker,linux,x86_64,kvm' --run-untagged --limit 2 \
 --executor docker --docker-image docker:dind --docker-cpus 4 \
 --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
 --docker-dns 8.8.8.8

--docker-volumes is for docker:dind else it was not working
This comes from this 3 year old thread:
https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1986

We can not use the 'docker:dind' tag for a runner having docker:dind
and /var/run/docker.sock volume because this is not a tag used by
the shared runners, so we can't use them anymore.
---
 .gitlab-ci.d/containers.yml  | 2 ++
 .gitlab-ci.d/crossbuilds.yml | 4 ++++
 .gitlab-ci.d/edk2.yml        | 4 ++++
 .gitlab-ci.d/opensbi.yml     | 4 ++++
 .gitlab-ci.yml               | 4 ++++
 5 files changed, 18 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..8e2a6a99889 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,4 +1,6 @@
 .container_job_template: &container_job_definition
+  tags:
+  - docker
   image: docker:stable
   stage: containers
   services:
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d5098c986b8..e59fbfdc73f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,6 @@
 .cross_system_build_job:
+  tags:
+  - docker
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -18,6 +20,8 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $ACCEL_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  tags:
+  - docker
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index ba7280605c4..afbd8e4d915 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -5,6 +5,8 @@ docker-edk2:
    - .gitlab-ci.d/edk2.yml
    - .gitlab-ci.d/edk2/Dockerfile
    when: always
+ tags:
+ - docker
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,6 +26,8 @@ docker-edk2:
  - docker push $IMAGE_TAG
 
 build-edk2:
+ tags:
+ - docker
  stage: build
  needs: ['docker-edk2']
  rules: # Only run this job when ...
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d9089..a4a93222c2d 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -5,6 +5,8 @@ docker-opensbi:
    - .gitlab-ci.d/opensbi.yml
    - .gitlab-ci.d/opensbi/Dockerfile
    when: always
+ tags:
+ - docker
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,6 +26,8 @@ docker-opensbi:
  - docker push $IMAGE_TAG
 
 build-opensbi:
+ tags:
+ - docker
  stage: build
  needs: ['docker-opensbi']
  rules: # Only run this job when ...
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f65cb11c4d3..d4511cf7dea 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,6 +14,8 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
 .native_build_job_template: &native_build_job_definition
+  tags:
+  - docker
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -38,6 +40,8 @@ include:
       fi
 
 .native_test_job_template: &native_test_job_definition
+  tags:
+  - docker
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
-- 
2.26.2


