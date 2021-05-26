Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119339223F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:44:03 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Jq-0008N0-1E
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wd-0003rC-Go
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wb-0000Od-Jt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:20:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id z17so2542718wrq.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIEqgB+giR/wnzQzzV/rr/ZCGepg7sgkPVrarMz2gUg=;
 b=EXzMd1pq1WIAyvn0ZmVv3B4AxMN6JuXJ8yYFOM4OI9tuI8ka2XmF1hWWqlm+XET4O8
 nj19KmNtG7fKNuBy4wUUVJjfBJRpYvulX9KKbgMdpn4DOMnN6X6B8JZHh4zxZ5jiELcb
 lvaUe0oCnAoQ1ENRVTGZCSbRjajo+TtKC6WXM3DzVf8fsEFHSzcV/EMKNvbz5M+D/SYc
 Zz/a2s5gfselVltBbPeuFhX943cvc/V0p5pbKdiYX+IAevuv/VQKvErHcZcOMe6ooJwl
 n1JVeXjVvH2rNN95WrAP41hS8a5Kalb9UQv2DgadCfioAiiE94EVOsWCmtparfz73gZm
 OaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lIEqgB+giR/wnzQzzV/rr/ZCGepg7sgkPVrarMz2gUg=;
 b=NW632lZyyZDkQEPeYdS6XVGFvPnzBjR3ckHecRnFNlGxgUgxUXyeWIvdwmbOJCijIm
 gCmS1mCzTCUpW7hYAbizjvL4S/J6PlcOAUrFVGCFWFpZGFGplHQPW5rIcHarc0PXiagM
 v9P9sQPg56FfF6VOnjMMHIVy66RUk0yPqgVmYpWb08SNvtBCmQlD7TxUH8UyuiU/gFU8
 +BOuTax9rdLX9ZjMWTzSzPkMKC7UxaedEi39olC9npDQPJ12yNoYAkocMrCIXpMlx3s3
 AqqSsB890EVssgp+vvA6tP0NgbGtD1pxqnM2xqtCthOMhVzQhQ7l2XgEZXuMlJLoOjQ7
 JLsg==
X-Gm-Message-State: AOAM532ZLyW24GUZTYxpcu9VJYuciOe9u4N8ZTCt48KQkP/1wpsWrZCQ
 pLUiQX2wwMvGWhVWLkxPVIBhxEl9TjHncg==
X-Google-Smtp-Source: ABdhPJwiulO7kTeSeiAURaIgMIQdYDfyXLDkWfRtuBXKUnachGCEfx9OmfzKf8X/v8d1u/njU3Zklw==
X-Received: by 2002:a05:6000:108f:: with SMTP id y15mr403wrw.115.1622063998863; 
 Wed, 26 May 2021 14:19:58 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id t5sm8190099wmi.32.2021.05.26.14.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] gitlab: Run Avocado tests manually (except mainstream CI)
Date: Wed, 26 May 2021 23:18:35 +0200
Message-Id: <20210526211838.421716-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210525082556.4011380-9-f4bug@amsat.org>
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
index 7e4ffab4d11..6dc5385e697 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,5 +11,29 @@
 # configuration path", on your GitLab CI namespace:
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


