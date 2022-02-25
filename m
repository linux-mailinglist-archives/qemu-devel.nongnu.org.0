Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004844C4CDB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:49:34 +0100 (CET)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeij-0001ft-Hx
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:49:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-00044I-MZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:53 -0500
Received: from [2a00:1450:4864:20::631] (port=41919
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGm-0002O4-H9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:53 -0500
Received: by mail-ej1-x631.google.com with SMTP id a8so12149689ejc.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eyq1RnOytaQPpyyRqATZ3JPobYbhQdtwSJ1ZuN+nJzk=;
 b=wVB7UuJGzmCFKqFPsFyfVUJ77fB0uBRgbDgD8WJpSkLhf78zEEmj/SD7xhyNMlUSlE
 m1HPUKUSmMrsc3HtkhDW4Jsnq0foQeIoG2Y0tdharkPNjniqVJwvNKO4ZQ5VAVyRqzqX
 P8x7BA86ndyF2Q6CTegSK+sm1M78XO4mYJnADdpcsEUqLVVR5H9Btt1p8UGjVnr+j78s
 WCdgmYOGGRjStbjDLLOqxzJx5/urFsvVUReIro38QIfGsFyF8MP/QWe13eSc7uL51Le6
 xU/6/mCCjR1aOKvcsbmOxySYYypubtjVJLLVnQWt/NuCzYwH/VrpmDOzsiB0T386qMPl
 Q4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyq1RnOytaQPpyyRqATZ3JPobYbhQdtwSJ1ZuN+nJzk=;
 b=ohtI7HTNHznjzAek0uoi4awqFlAj032+pfuoneFUaMzUytsOyzRDrAVOGxVwvONc9h
 pZU/VzXn6rTFmIJpEu/xM0nqBPKcSv8SEPla9Fejb9jeN+oSKDfQlEtJ6npEdjlCeS5f
 /MwMkyZSKq14Mpu2s82TUs2/lsUnNOGTjSsiYI1tMFuxliH29Gadus2mfptclxDWxZ4M
 dM7atv3sv5ox7j3sT/SAE+JIEwPnQ3PwWJpkNn2NufzsVdJl7noVjj1ZyUfqXB5IdUa8
 N3Ni4tZVDPJf+qz2PHrr+KzEy8bYQeEjVtUU+2UOyX5t1IReu68xD5Qamg9nOpAl0c7I
 qtgQ==
X-Gm-Message-State: AOAM530Beved7nVdyzVcUXeE9gbu7YesLzp2G+xPnQBNqIPu/RXjW5FE
 BVJg0ZnLZXAv7hdWQrFBJjUi6A==
X-Google-Smtp-Source: ABdhPJxoN9j66r1pRC4YUBnG0bTZKTO0EjCXA8ejEd5JWm/ZorswnOsGX7gZ+/FiQZqqCmqi8qa1zg==
X-Received: by 2002:a17:906:4116:b0:6cd:1980:5ad0 with SMTP id
 j22-20020a170906411600b006cd19805ad0mr7344807ejk.595.1645809639221; 
 Fri, 25 Feb 2022 09:20:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a1709063f8e00b006ae0a666c02sm1234540ejj.96.2022.02.25.09.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFF731FFC1;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 09/18] gitlab: add a new aarch32 custom runner definition
Date: Fri, 25 Feb 2022 17:20:12 +0000
Message-Id: <20220225172021.3493923-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although running on aarch64 hardware we can still target 32bit builds
with a cross compiler and run the resulting binaries.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-9-alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc                    |  7 ++++++
 .../custom-runners/ubuntu-20.40-aarch32.yml   | 23 +++++++++++++++++++
 scripts/ci/setup/gitlab-runner.yml            |  4 ++++
 3 files changed, 34 insertions(+)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index db3f571d5f..92e25872aa 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -44,6 +44,13 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
+AARCH32_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an armhf host or an arch64 host that can run
+aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
+variable to enable the tests that require this kind of host. The
+runner should be tagged with "aarch32".
+
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
new file mode 100644
index 0000000000..9c589bc4cf
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
@@ -0,0 +1,23 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch32-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch32
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH32_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --cross-prefix=arm-linux-gnueabihf-
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 19bfd68f7e..33128be85d 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -84,6 +84,10 @@
 
     - name: Register secondary gitlab-runner
       command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
 
     - name: Install the secondary gitlab-runner service using its own functionality
       command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
-- 
2.30.2


