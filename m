Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31183896D2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:36:59 +0200 (CEST)
Received: from localhost ([::1]:36420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS02-00066J-P1
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLz-000768-HB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLx-0002LU-Jm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p7so11363100wru.10
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkwmtviyiS1025jDysTssnxv91G8aTCY8QRm8XNzOfc=;
 b=TPT4NgpcBQcS7jHPACWJgLg3Da9r/EqMXQGyuSpYDfdj9H4eftCX5r9lZqGtAhKGCu
 6hvTIroLvWGH9RyPOD4JEEkNWHgPNWP8yfg2dGhOQxG/QvjAKJ5424Ja6bXOVhpwo7CX
 ZtVwVSKu7IiDiFuvVGfsan+SnTbbwtWgyyfzR/ocW6PSsDd8LyE2rG2z78L0o+MHCPh1
 ENT080oWGS8EvU8oa08lxtWV4BY/PiNibMkRojWDgtr3icaze7FqKw1dWs0DnVAak/GF
 zV5oAl3sbk0kLaDZpFo0Hwu1AcNt/O+l6htp8EdsaYmWb4ilqElBPWfnuKA8KOzB/kwQ
 mCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qkwmtviyiS1025jDysTssnxv91G8aTCY8QRm8XNzOfc=;
 b=gLXzpl329MuYVMEuSssi/QSBSjIwPOZxUvx81O6ruZ0P80LfSWuocseSRG06gd6PhM
 2Lf3J92OgCwWRjqUd9u3Z69bbeuyAraCxDHRX1HCaNjiqrRrTb8QUY9Nm1iW3IEx8Uto
 82AH+MYllvrjgD5A/w3JnwtNwJdtqboI+WvrfGm8Lx/SSnFpFgy+jVQWhg7/Hg7l3bwZ
 35jI0C7HzmJstVH8SjEP6AgKZ+SXBG6xThdDIrNZkBtHK8aBlWgm7qa5c9WegwMj5DPS
 XaOEKibwaZwNQKrw4Vyjxc8faEP19v7aIRspIyZtucJhBuWnwvPIgp1v2nokYd/qQ93+
 Csrg==
X-Gm-Message-State: AOAM530ZtflsQLznPCmww2f6IxHGJNfW31b4i4cjCtHFzObvSS6++KjU
 06chSM/i25gaE1voPX3wHDraG/+sa98piA==
X-Google-Smtp-Source: ABdhPJyeuBeXIdxLUGVAJif38A58xaRuxqTxDF7vrF56MRLdkr5ZSvoYdj5RR+A2V14cayNeE8uSoQ==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr399790wrq.134.1621450531919; 
 Wed, 19 May 2021 11:55:31 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m20sm1772909wmi.5.2021.05.19.11.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] gitlab-ci: Extract DCO/style check jobs to
 static_checks.yml
Date: Wed, 19 May 2021 20:54:59 +0200
Message-Id: <20210519185504.2198573-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ef9b4804f32..bc7bad3d905 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/static_checks.yml'
 
 .native_build_job_template:
   stage: build
@@ -757,31 +758,6 @@ build-without-default-features:
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


