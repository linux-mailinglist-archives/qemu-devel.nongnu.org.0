Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314F37A0E3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:35:10 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMv7-0002Da-2x
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqV-00047Y-69
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqT-0008Iv-6C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n2so19098040wrm.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMLF+DiYB05VGczsv0EHFzokHqtb7UOcx/SnibJim1g=;
 b=d6okAlqbrVmawA1Y1tE6/sHsdh8ch4YpcEafWeOXftdL70tbkzgRarGND23SiHXIej
 Aq9f97SFLPJWe6mBSH6FfSFydJpuXOcBleSjrqIGnSynNUdxElz5NE3KP/hh76oUQObC
 YfNJsmX02k1lCEJsEJqp78YPvoTUCLqFNHNRCjoSalF8XuKf/TgYKcp5WKydcK8oTJSP
 zbale9YCDM08dQMgpi6aQy8Nw3noh4J07XU5DUfkZUy1whW//tzzZ6j3p+KLE68LaJwg
 FukPZ1wtFPOSOhK2Q0UvE/3PNAt/uOnSNWgoecy2w9B5+S3u3pDyAAAVksqvzc9n1cWG
 Osdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cMLF+DiYB05VGczsv0EHFzokHqtb7UOcx/SnibJim1g=;
 b=uGxjby1mmrj8pavRBaijjsWAFDeho486I5Kf9A+riLHGN9HwI5v9S/1rg9R9cUrpOg
 /vzu3YBIaP63tZr5swpBRnrf8tkU7DjqgfjdBP19CjO7NgXpR5dZKy8DqX+VLJV7FlAg
 bTyd9plPkDjBPqToKNhY1GiXt4nLZ09J/+2kV1gUA5C284XBq430QyumcTseHfBQYP4r
 s/ms7s6aCuips1en4Wz76ySM39T2ViG9PHDTsVTmMLY61wY0n8hBLvOI+DJSf1ct9X/7
 D8DOEu7GvVgERhpXn3oeCJsPIHkwZOy+p4WPj/p69sVAptwU5vz9+TeqvmkwYm8hI7ie
 kYyw==
X-Gm-Message-State: AOAM531HN/+q6ylgZTYU+JBaujuP6UDvd93Oa00XdJoEVTLwyahJZkAp
 AKl1TAg+QE4/q+lBOmomfaA7UVS0eN5OLg==
X-Google-Smtp-Source: ABdhPJzvtxYXjHxOcQ5ByOMI0THqw7/+CVyY6YcZcqjpuN06PPwyfOftvjPFK9zjCTdEeM+eA+FVSw==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr35828809wrj.75.1620718218539; 
 Tue, 11 May 2021 00:30:18 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b10sm30859762wrr.27.2021.05.11.00.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] gitlab-ci: Extract DCO/style check jobs to
 static_checks.yml
Date: Tue, 11 May 2021 09:29:47 +0200
Message-Id: <20210511072952.2813358-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the DCO / checkpatch jobs to a new file (static_checks.yml)
to be able to run them without having to run all the jobs included
in the default .gitlab-ci.yml, which are mainly useful for the
mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- renamed static_checks.yml (Wainer)
- removed moved jobs (Thomas)
---
 .gitlab-ci.d/static_checks.yml | 24 ++++++++++++++++++++++++
 .gitlab-ci.yml                 | 26 +-------------------------
 2 files changed, 25 insertions(+), 25 deletions(-)
 create mode 100644 .gitlab-ci.d/static_checks.yml

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
new file mode 100644
index 00000000000..f695627b7cd
--- /dev/null
+++ b/.gitlab-ci.d/static_checks.yml
@@ -0,0 +1,24 @@
+check-patch:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
+  script: .gitlab-ci.d/check-patch.py
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+  variables:
+    GIT_DEPTH: 1000
+  allow_failure: true
+
+check-dco:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
+  script: .gitlab-ci.d/check-dco.py
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+  variables:
+    GIT_DEPTH: 1000
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d474ffa030a..ab9edc78879 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/static_checks.yml'
 
 .native_build_job_template:
   stage: build
@@ -758,31 +759,6 @@ build-without-default-features:
         --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
     MAKE_CHECK_ARGS: check-unit
 
-check-patch:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
-  script: .gitlab-ci.d/check-patch.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
-  variables:
-    GIT_DEPTH: 1000
-  allow_failure: true
-
-check-dco:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
-  script: .gitlab-ci.d/check-dco.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
-  variables:
-    GIT_DEPTH: 1000
-
 build-libvhost-user:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
-- 
2.26.3


