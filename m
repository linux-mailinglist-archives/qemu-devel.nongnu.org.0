Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A95365A9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:06:59 +0200 (CEST)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucUL-0004Uj-VG
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8T-0003Hs-54
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8Q-0003tP-Tn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so2390118wmq.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G8GBt5IlQVSVKXeBv2hLy/mbgJLnCe5MD+PYqSSVW+Y=;
 b=BSTe69nzuuDKhU/k6NUTw2Q/Px3Pf20Q8BoaXOSKEU3tCUffcrYMMapsccc8/MGdZO
 8Fea9ev2HdPlOxzaQjpjB/gl3SKsPnghzfvOa85Y1XnricNwXTg9ciuVb1PkD7JcpShM
 60GU9S+gayr+w5p8SRR6kOsa6Qs0d50onSoqS2hHu/z7vdCYTnOb3lln2ZdcMn+5XtF3
 f3IrMLA0TJayQoKNBHwPIbcJx7SXXVlvVU5qvVWJKOysnyu9tjKqsktsSpSawM+Mxiti
 xi4fnMuB2/L1Vi9xBYV61mhqCdAoti1LXfj9KMbZytsL99kzJ8K7G1OaoJbCxaCvPNkh
 slNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8GBt5IlQVSVKXeBv2hLy/mbgJLnCe5MD+PYqSSVW+Y=;
 b=qcDLqvLPM/yJHrmq7lL8rIR3ijtnInt8Hj3LgHXlsxhAsABVkmZ+RVkPt4uTNlDWFa
 gj7S7u6dTHl+sqsyOFD6cJ3OAbGb/tASEnvjPWuO/SaML5O2M4qSrcWK0gl7l0bsphUH
 Gu6biT2PNCReVjqlt9NndJjNFWuQKHu3O8Y/qXxriWmcZNkf2HsJy+pVJvo2EEg/KbPw
 peVVT11h1OLY3Z8HSQknXJE+QmpHbe7vvRWUqRJZ3TMn5PXBM4HnooLrv4IXgVABcwrK
 pTCJWBYnG3QOCtzQXmpgd4qKXi3mHXaWa0I2x8DV/DetGozcShj73g4rq3LeBJwGgwK/
 g0gw==
X-Gm-Message-State: AOAM532wvtauAVAhjlLST1KJ5kZx9heXLeUdLI5XJAvY5w0a+WLU+uqt
 7Ofs5B9aR3DK6vY9/3eNUJ7V85xZpYxZlA==
X-Google-Smtp-Source: ABdhPJzNR4IolvqI1Ih3T9nDVudNCmIggccHGImDQpGXflakxerayGHpGMXEa72HqwEqzlGrDaobsw==
X-Received: by 2002:a05:600c:502a:b0:397:44d1:d5b6 with SMTP id
 n42-20020a05600c502a00b0039744d1d5b6mr7584049wmr.57.1653666257518; 
 Fri, 27 May 2022 08:44:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b003942a244ebesm2544037wmh.3.2022.05.27.08.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F4201FFD4;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 28/33] gitlab: introduce a common base job template
Date: Fri, 27 May 2022 16:35:58 +0100
Message-Id: <20220527153603.887929-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Currently job rules are spread across the various templates
and jobs, making it hard to understand exactly what runs in
what scenario. This leads to inconsistency in the rules and
increased maint burden.

The intent is that we introduce a common '.base_job_template'
which will have a general purpose 'rules:' block. No other
template or job should define 'rules:', but instead they must
rely on the inherited rules. To allow behaviour to be tweaked,
rules will be influenced by a number of variables with the
naming scheme 'QEMU_JOB_nnnn'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc    | 36 ++++++++++++++++++++++++++++++++++-
 .gitlab-ci.d/base.yml         | 28 +++++++++++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml |  1 +
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 .gitlab-ci.d/base.yml

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 92e25872aa..eb6a9e6122 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -28,7 +28,35 @@ For further information about how to set these variables, please refer to::
 
   https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
 
-Here is a list of the most used variables:
+Variable naming and grouping
+----------------------------
+
+The variables used by QEMU's CI configuration are grouped together
+in a handful of namespaces
+
+ * QEMU_JOB_nnnn - variables to be defined in individual jobs
+   or templates, to influence the shared rules defined in the
+   .base_job_template.
+
+ * QEMU_CI_nnn - variables to be set by contributors in their
+   repository CI settings, or as git push variables, to influence
+   which jobs get run in a pipeline
+
+ * nnn - other misc variables not falling into the above
+   categories, or using different names for historical reasons
+   and not yet converted.
+
+Maintainer controlled job variables
+-----------------------------------
+
+The following variables may be set when defining a job in the
+CI configuration file.
+
+Contributor controlled runtime variables
+----------------------------------------
+
+The following variables may be set by contributors to control
+job execution
 
 QEMU_CI_AVOCADO_TESTING
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -38,6 +66,12 @@ these artifacts are not already cached, downloading them make the jobs
 reach the timeout limit). Set this variable to have the tests using the
 Avocado framework run automatically.
 
+Other misc variables
+--------------------
+
+These variables are primarily to control execution of jobs on
+private runners
+
 AARCH64_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an aarch64 host that can be used as a gitlab-CI
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
new file mode 100644
index 0000000000..10eb6ab8bc
--- /dev/null
+++ b/.gitlab-ci.d/base.yml
@@ -0,0 +1,28 @@
+
+# The order of rules defined here is critically important.
+# They are evaluated in order and first match wins.
+#
+# Thus we group them into a number of stages, ordered from
+# most restrictive to least restrictive
+#
+.base_job_template:
+  rules:
+    #############################################################
+    # Stage 1: exclude scenarios where we definitely don't
+    # want jobs to run
+    #############################################################
+
+
+    #############################################################
+    # Stage 2: fine tune execution of jobs in specific scenarios
+    # where the catch all logic is inapprorpaite
+    #############################################################
+
+
+    #############################################################
+    # Stage 3: catch all logic applying to any job not matching
+    # an earlier criteria
+    #############################################################
+
+    # Jobs can run if any jobs they depend on were successfull
+    - when: on_success
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 871262fe0e..691d9bf5dc 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -2,6 +2,7 @@
 # https://gitlab.com/qemu-project/qemu/-/pipelines
 
 include:
+  - local: '/.gitlab-ci.d/base.yml'
   - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.30.2


