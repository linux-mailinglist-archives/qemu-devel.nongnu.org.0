Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D095738FCD7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:31:34 +0200 (CEST)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSTN-0006AK-J4
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOf-0005S8-H1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOd-0007XY-MN
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id j14so29435574wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2CJbYRcvA0zHIHyOmLh9A6596xrw0+LlcvUj1ggyOA=;
 b=KcGcgbRQs4OjA0JPgeu2XFG4QgW0fvjreT/wTVr0sV+0kvr7qsMEZ+mfyYsTjt0Bps
 sQyUTZ9/Wf854H/z0vErUzEjX22NaK8VaHS0gNnYawfyf8oSYdc2dRC7+eqrjv8SEcOv
 ACWCrJ9b3M/apgpewwwfLukmqnrM478SCSVW5PiBcZZIxAZCNZy919T+YyCZIyZgHhuy
 WH112WtZtNaDny/Y7EnYGL4m37QVXUv8izsEcRDizGKb1zYe9PtLQYysgBud5kWMdZtR
 usqPwn/q1iu/YDn96GqBBxi16ppOlnG9HXa3+63odFWCNa14ss4DM2Yw6AqD1XhD+J0o
 +ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X2CJbYRcvA0zHIHyOmLh9A6596xrw0+LlcvUj1ggyOA=;
 b=i5KSH1YkGU4rEwhXLIAKIjjxO/tqbpSJo17pkq9i8J5gOzSpt5+plbiWZ3gJTshFEN
 I59QlIJho/WqPtF+qK3A2PsTrWON6HK+lCjKnSmHGdyFFNaJnxk1JwdGFNI8qTgRxSzc
 mypICasREnR2z+Dc0Fr8112LV/XnEf3D419mhkiQ/cbbBG8br2sIB7kTJVl4Vqmo/6EK
 LSAlf1frGMp265Y+3q1a5WiwsdOYqE8Z4muGGBkLbjPU51Mvq//iB6WamgEqg5zRXaXH
 rAsVTnaYxtKdDVOq1cmhVIBIqCvvLfwNgOOklqSveXE5NCUEc/rpr5kiPE4tnSwNiFiw
 99dA==
X-Gm-Message-State: AOAM531j8ow0Uu9GbOxySDFtNkQTG0c2P1yIXI1OTNWpX0kNrxVLh0ve
 WplhJEQp02BaO565ov54glgylk5YHg3CyA==
X-Google-Smtp-Source: ABdhPJz/jn2B/fQwfHop8vJzTK/M0Zy4w2iCYtsNVVhHGpBgZdV94I+IOg9Qrpey4xpsnyvs+yaGjg==
X-Received: by 2002:adf:d1c6:: with SMTP id b6mr26711875wrd.110.1621931198038; 
 Tue, 25 May 2021 01:26:38 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s83sm10240037wms.16.2021.05.25.01.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] gitlab-ci: Run Avocado tests manually (except mainstream
 CI)
Date: Tue, 25 May 2021 10:25:55 +0200
Message-Id: <20210525082556.4011380-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to a design problem and misunderstanding between the Avocado
framework and QEMU, Avocado is fetching many asset artifacts it
shouldn't be fetching, exhausting the jobs CI timeout.

Since Avocado artifacts are cached, this is not an issue with old
forks, which already have populated the cache and do not need to
download new artifacts to run the tests.

However this is very confusing to new contributors who start to
fork the project and keep having failing CI pipelines.

As a temporary kludge, add the QEMU_CI_AVOCADO_TESTING variable
to allow old forks to keep running the Avocado tests, while still
allowing new forks to use the mainstream set of CI tests.

Keep the tests enabled by default on the mainstream namespace
which is old enough to have a populated cache, hoping we will
keep this cache long enough until the Avocado/QEMU design issue
is fixed.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since it is not clear which project should be modified, there is
no issue filled to track the progress on fixing this problem.
---
 .gitlab-ci.d/buildtest-template.yml | 12 ++++++++++++
 .gitlab-ci.yml                      | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 180bf1aee7e..8e6321c2a38 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -67,3 +67,15 @@
   after_script:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
+  rules:
+    # Only run these jobs if running on the mainstream namespace,
+    # or if the user set the QEMU_CI_AVOCADO_TESTING variable (either
+    # in its namespace setting or via git-push option, see documentation
+    # in /.gitlab-ci.yml of this repository).
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: always
+    - if: '$QEMU_CI_AVOCADO_TESTING'
+      when: always
+    # Otherwise, set to manual (the jobs are created but not run).
+    - when: manual
+      allow_failure: true
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8c843e5f20e..830c5b7af97 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,5 +12,29 @@
 # location of your custom .gitlab-ci.yml:
 # https://docs.gitlab.com/ee/ci/pipelines/settings.html#custom-cicd-configuration-path
 #
+# ----------------------------------------------------------------------
+#
+# QEMU CI jobs are based on templates. Some templates provide
+# user-configurable options, modifiable via configuration variables.
+#
+# These variables can be set globally in the user's CI namespace
+# setting:
+# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
+# or set manually each time a branch/tag is pushed, as a git-push
+# command line argument:
+# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+#
+# Example setting the QEMU_CI_EXAMPLE_VAR variable:
+#
+#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
+#
+# ----------------------------------------------------------------------
+#
+# List of environment variables that can be use to modify the set
+# of jobs selected:
+#
+# - QEMU_CI_AVOCADO_TESTING
+#   If set, tests using the Avocado framework will be run
+
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


