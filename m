Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22E3D786D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:26:38 +0200 (CEST)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O2X-0007ZO-R8
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0l-0004ok-MM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0i-0001kQ-7u
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47FZeHkD8NUYnjKnwioEIzHdD7XGBpqWb+6R03bKg1M=;
 b=AebDI7heBAtSmbkqb46IJ5DNyHusDdtfMes/ySGSbAw3JqqOdTAKvg85NH9ek/G/UAhpzw
 Qy8YH6YDPd8oHK+FLo/MgJnsmztPmXUsO3kAWmA+5oXJXQFsauN8q+IPrSW6illK6fU5xf
 zGL3Ur2qTh09ycfYhxnfZgFwZqmIjRQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-mFM1Hdz4O3Gy1nphnfro2A-1; Tue, 27 Jul 2021 10:24:40 -0400
X-MC-Unique: mFM1Hdz4O3Gy1nphnfro2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a05600c3b87b029024e59a633baso1438065wms.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47FZeHkD8NUYnjKnwioEIzHdD7XGBpqWb+6R03bKg1M=;
 b=HKvDIi7r9zCln7cELZcOjEjqsCw6T0A+LTUdG8Qb4mDn5Gl2SbrYLms2IK1/lFhqkB
 U225mEXRHUzQeKJR+0TLId0cQbGvZMAWrO0ViQ032Rj7OkcDXmvBRKL/53MsDTA0xRN4
 lQql1n0X5LD7l/r7rP/lkvA9EpqOyjLa2bzvkpPs5f6doCITYiUe/dB3VlkHEOGXxOBX
 GHhTDwAwVA2zV/cNMp5qzul/W//iyOzR6gb+zWJvVyomWyrE3aCsHU11fXo2RpQtFdQM
 BJir0EnmE7764KrdAJxS+6ZhXg6+Kw0Z/lBofGaPpSiqeR81TQ+B5VcSFJPt6kTizIGS
 frsA==
X-Gm-Message-State: AOAM5333w8MFtIbikoEsUClC7P+OpQU3s3WbvUHZvcm50ng81V+9f++w
 MvBYB1xQHaOBp3DOpokhYwSzogC68rE7vLiKvrCV7ZywrKGWUmx4cH0SKXGtfjUikC9/UeTiCq1
 GcKuxUuU0pbjH2JbOjCG/4APKxH+f7Slabcv/sP+ED6XlxKuUJd1o1L+427fAK8+V
X-Received: by 2002:adf:ee51:: with SMTP id w17mr10237962wro.279.1627395878653; 
 Tue, 27 Jul 2021 07:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0etw1KJDfvRkll1Nev1pclIpUWWclE9r/qOfi4Hfvcl0Qum9T1ntwMSzplpfzmOMhasOmjQ==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr10237934wro.279.1627395878411; 
 Tue, 27 Jul 2021 07:24:38 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id m7sm2745669wmq.20.2021.07.27.07.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 07:24:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v5 1/4] docs: Document GitLab custom CI/CD variables
Date: Tue, 27 Jul 2021 16:24:28 +0200
Message-Id: <20210727142431.1672530-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727142431.1672530-1-philmd@redhat.com>
References: <20210727142431.1672530-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
("gitlab: Run Avocado tests manually (except mainstream CI)"), but
forgot to document it properly. Do it now.

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml    | 19 ++-----------------
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index b3bf3ef615b..205572510c6 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,6 +8,46 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
+Custom CI/CD variables
+======================
+
+QEMU CI pipelines can be tuned by setting some CI environment variables.
+
+Set variable globally in the user's CI namespace
+------------------------------------------------
+
+Variables can be set globally in the user's CI namespace setting.
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project
+
+Set variable manually when pushing a branch or tag to the user's repository
+---------------------------------------------------------------------------
+
+Variables can be set manually when pushing a branch or tag, using
+git-push command line arguments.
+
+Example setting the QEMU_CI_EXAMPLE_VAR variable:
+
+.. code::
+
+   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+
+Here is a list of the most used variables:
+
+QEMU_CI_AVOCADO_TESTING
+~~~~~~~~~~~~~~~~~~~~~~~
+By default, tests using the Avocado framework are not run automatically in
+the pipelines (because multiple artifacts have to be downloaded, and if
+these artifacts are not already cached, downloading them make the jobs
+reach the timeout limit). Set this variable to have the tests using the
+Avocado framework run automatically.
+
 Jobs on Custom Runners
 ======================
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6dc5385e697..9762dda2ee3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,24 +16,9 @@
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
 #
-# These variables can be set globally in the user's CI namespace
-# setting:
-# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
-# or set manually each time a branch/tag is pushed, as a git-push
-# command line argument:
-# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
+# for more information.
 #
-# Example setting the QEMU_CI_EXAMPLE_VAR variable:
-#
-#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-#
-# ----------------------------------------------------------------------
-#
-# List of environment variables that can be use to modify the set
-# of jobs selected:
-#
-# - QEMU_CI_AVOCADO_TESTING
-#   If set, tests using the Avocado framework will be run
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.31.1


