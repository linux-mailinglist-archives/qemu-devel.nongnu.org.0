Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E296392205
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:26:44 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm134-0003DZ-Q1
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vp-0002y3-Iw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vo-0008RE-21
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j14so2546260wrq.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+qr5ghTZ8/md/Cpp+mmNlJo0+59nUM9neqzcD1eFCE=;
 b=QOWvW2OVBmvdqg4Vgtkt/3coigXLHJuCGx8fK/OHb979NvDDFwFJh3CKYr45Kq/hQa
 R95f9q89tSVPnXQDOH//21grUsc8aUnCn7ouESGYwx53OuG0LBm6t0nlzhKwP5qg3xQn
 74KpkvAb56zlZqYyxq0L1R2RcOgFOYOVFNF2VfWrp/0092/S8WjqF8Ag6qxcKX1koIhO
 j461DyBrKKPLZVI34J4o4XE8ZOHV8ABke1fT+DN2ia+scQrgLdA0S4KAOhbHGIulRaBB
 pzwDjj4Yn8IqHj7p3uux2FPRdJUCFP+pT0d/MgQUF/4LrKKO3nXUOyOJzJZgRgWMn2Ae
 YtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8+qr5ghTZ8/md/Cpp+mmNlJo0+59nUM9neqzcD1eFCE=;
 b=msnHSKrptcdzutXmuBdU9eJNYkwLPeO/GedIDeb7UpES7FejPE3YLz+ac6zUtMDye8
 V6zWfFDBbTIoqThjL/t1QBy4IhiJcHfzvtFNlWUF8APwUMZaw7wBr4gBR5zFfDfo41MA
 F0iteMmFGQg+IAKxk/FaOR24VxizF/30OGD5khDr0YneglrBEVB/srMJoxpUBgWHlMRs
 jLYvoHYE2WRIK+jH+Kfryi5yNrL898y5lTD62l2LNoDDY0i8oLKFMQwr1vD9tPq1W5mP
 KdsCmWnm7n6VJTOIDJBpr8W1Xn5RkEM9xapnfMX+HOmMRNqxVve4+xPjdrFgJXkAFkLa
 IKFg==
X-Gm-Message-State: AOAM5302EAuV3SWIpKkmuCVHMS+ie8pk5X3x+2T+awRb4hY38A1AFQ+D
 Oh9DMLjseuCU7pDLKrw2GaMiaZwcYmu4cA==
X-Google-Smtp-Source: ABdhPJyBOcpEC5kTbplKZXiIfw4atSe8Jbcdhg2nTmnZ5zEJPyrAcyOIakECSR3uy8Ea9TI8ArSM/Q==
X-Received: by 2002:adf:d231:: with SMTP id k17mr24718wrh.78.1622063950570;
 Wed, 26 May 2021 14:19:10 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s5sm154539wrw.95.2021.05.26.14.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] gitlab: Extract DCO/style check jobs to static_checks.yml
Date: Wed, 26 May 2021 23:18:25 +0200
Message-Id: <20210526211838.421716-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the DCO / checkpatch jobs to a new file (static_checks.yml)
to be able to run them without having to run all the jobs included
in the default .gitlab-ci.yml, which are mainly useful for the
mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-6-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
index d6e93369d6b..03ff9884c30 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/static_checks.yml'
 
 .native_build_job_template:
   stage: build
@@ -771,31 +772,6 @@ build-without-default-features:
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


