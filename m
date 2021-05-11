Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1337A0DE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:33:31 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMtW-0006Nn-JI
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqC-00043N-6c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMq9-00084j-5S
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l2so19029427wrm.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5Sxu4ctDafvDSNcFbyYbFbbcAFEWQpn+j7ohAb2sA4=;
 b=T5/gT1u1zbZYfqXgAxbthqe2XBSC9jqM9dyo6tulbTvdWSShXWdB/pSiMduNQDwnId
 6CzQpoAfrZVSYx1hId4z8j3fMculbh00M6I6x1eQMDBAAhLJbSZ3tUB8GLWmYGg3F3WA
 ccl8FyO5i5nkNDXL0AQJ20sQEAaH5iSLL9fGDR8IGxBVDH6yMD3u+TGe2w3CqKbU9pk9
 2FQXBNr03v2Wj0i5n4pRCv1qtmR3TJvpS1M10ETvPLFd1VlldDBGpzjjaS9BePm6J2oY
 9aXdQQ14UDF8QGx9ywdgnzlEcgYkqY8GC8cNkzJx37BEvjZCVlBNLWtjDh4JQj84e7hI
 mV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j5Sxu4ctDafvDSNcFbyYbFbbcAFEWQpn+j7ohAb2sA4=;
 b=ScowMPeChD+O87yvzm8COwt7MvvX91EMq5vTYJnO3stcyriTTP0eQpklOAWSSZwXll
 fffzCQhLvCyZHydX3G/psMyEOBl6ZSNNhUaBVu25NVlmkRVYbfFZ1EQIaEUU/ls2/QvN
 k63Vs7fFCNb3cho8NLom8NgOlgc7DVz1LVqHSn6pue0rDI5oDg7ZCGMWMxZ6ha801EZk
 2Z9kMSmGPas9bhaypz4AEvtiS1RZOnXsRMEHDG0Sp4pys7AHqrL+klG1x25WreX+Pwhg
 PWpI3U1SVEr5IrrBhEQyOoh7BpKqgJX4FPxxpOWk4jQadH3WWCILUTtC/LRksOhOVnLb
 9xPg==
X-Gm-Message-State: AOAM5325j0tcT7mvY1/QaXZEZ04JndPwa/1c9q+Q7VghdATapLDvtG6o
 z63Iqw3lkK2QVtOneVEyFGo1Lg2FKhXueA==
X-Google-Smtp-Source: ABdhPJxnsig6bHEiUDTiKDQznPdOnRjToCkyylWOgMa+F6cMdH5eeOCTOeGhk5CE/6mXbImkcJ0VVQ==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr1599563wrq.177.1620718199386; 
 Tue, 11 May 2021 00:29:59 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g129sm2807281wmg.27.2021.05.11.00.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:29:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
Date: Tue, 11 May 2021 09:29:43 +0200
Message-Id: <20210511072952.2813358-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 66b3d8602ca..1d8ecc281b4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,8 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_template: &acceptance_definition
+.acceptance_test_job_template:
+  extends: .native_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -108,14 +109,13 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -142,14 +142,13 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-debian:
   extends: .native_build_job_template
@@ -176,14 +175,13 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -211,14 +209,13 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-centos:
   extends: .native_build_job_template
@@ -246,14 +243,13 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -279,14 +275,13 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 
 build-disabled:
@@ -522,14 +517,13 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -559,14 +553,13 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -596,14 +589,13 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.26.3


