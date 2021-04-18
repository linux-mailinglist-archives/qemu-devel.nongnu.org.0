Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44774363892
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:45:39 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH6g-0001A4-An
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwv-0000xA-RC
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwu-0003ER-Cw
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k26so15673130wrc.8
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NQxwbCz8CKvqbwDBKHnsWT3vklC845mX0CEiVetIvQ=;
 b=f2K4ccK610ZFmrSt7dO9/ivOhKFjrx0C6J1Yvu/GwTAcZ/aOwPbVaw/u+eNWcmrpmr
 GUUZCjBSKCMjTTmZOocJKltFO7eoNwgoTOdY1yy92cOtHrZu6+CKaP4eVnNq9vGd2jrq
 do9njY+OkG/2etpPbFiY9mh13PZkGWBdNzjjPsk1ppyedywzDVnIL+LgtDyUPAxXbKGq
 Aesw0MfFagcruilfuyC+bep4eIbJECg4ed5pkRWKlxxwmKP/aDMm/dQdwVJr6X/ojLQN
 HpeNzHDzjsvvPcZ1stgR4AH4FazkLp2RGlfDcgjnwaKIt4auos5rT9fN2+ywF/iICzH/
 qRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+NQxwbCz8CKvqbwDBKHnsWT3vklC845mX0CEiVetIvQ=;
 b=N6+aIxsA+WXBoeAsGZQyOEz2MoTrewKAMP+o3EFeRp8iP6dhZSm8bqfyZufipul6NE
 imcjk6I8aNYcYz3ulvwFM0eTXA+HRksAjSErcKhfYkvMPGqGus+f7Lvt9RxRHivn2lHV
 UWmNiZYiW4LVZd+YETv3Zl/vpFxZf36FWa6FAletzDWFseukXLWNTOXXPecEStrNVU1O
 bHXVY5DwagC5mDnK3w5jMg42Wt86WxMxwN1kyGEWrywQl+SuR5Y7QFRXbYdsD9F7m+XD
 8GRhpMDLow8SEMrKBRpGnDndyiuC5f9GR3JYEvXR8i5fkyqMr4V5aDPNtwNd4ofceEXF
 rAMg==
X-Gm-Message-State: AOAM530d8eB6dv7IsoVKcPyCQlwk+5wa+BAnTGChymqWIcZMlmLFb7sA
 6X8WVBl/utityAQBDM5oAPnBtf/iqPpNNA==
X-Google-Smtp-Source: ABdhPJxAx6PdGko7beXAGNOUr45+OaxjYJPme6eWkszJuOXBB91xo3Z0BqaBkYPbWjwusaGsjYjtqA==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr11553130wrr.70.1618788930926; 
 Sun, 18 Apr 2021 16:35:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k22sm19762514wrh.5.2021.04.18.16.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] gitlab-ci: Extract DCO/style check jobs to checks.yml
Date: Mon, 19 Apr 2021 01:34:41 +0200
Message-Id: <20210418233448.1267991-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the DCO / checkpatch jobs to a new file (checks.yml)
to be able to run them without having to run all the jobs
included in the default .gitlab-ci.yml, which are mainly useful
for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/checks.yml | 24 ++++++++++++++++++++++++
 .gitlab-ci.yml          |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 .gitlab-ci.d/checks.yml

diff --git a/.gitlab-ci.d/checks.yml b/.gitlab-ci.d/checks.yml
new file mode 100644
index 00000000000..f695627b7cd
--- /dev/null
+++ b/.gitlab-ci.d/checks.yml
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
index bf4862a78de..ba35b3917e7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/checks.yml'
 
 .native_build_job_template:
   stage: build
-- 
2.26.3


