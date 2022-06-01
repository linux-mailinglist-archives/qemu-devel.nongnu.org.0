Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AD53ACC1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:26:39 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwT3G-0005zM-0V
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr7-0001k9-5n
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr4-0006Yw-4U
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id h19so3338607edj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZI6PLSlRMEqMQdx3EhC/9GDtUUl7MXmj9n2SWhz5Ng=;
 b=E8vuohhhmAy7a2UNMUOrrfeqyyYV/Jg84aEk/WjGE+ZbcbK1oWGJ4I0xVWlnbV5oI1
 1eiAItuSUR6LCf1IaWjUPzcMY0K/rgzCqyXJdxs5fe6fiDg1JrHiE5g3Twb6FKrhlRWp
 UvmU4GGErrhfTgNrgnVvKRdqtYhN4+d9mgT8widtsHYZw2n8iRzn8MJ+1PH3vF+EZUBA
 /sJX5AMgKNfAyIVjC+5mnyNvLxDXdplcE+e91zFpiEsd2Kff85qCDITB5Me2VSiKlrHP
 LmRnLvbdatJTn/OSQzEqwTSh9ImjFZR6FxRbfi9RU44gOXplkQtHKUCdJjJCfqj3La+U
 j9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZI6PLSlRMEqMQdx3EhC/9GDtUUl7MXmj9n2SWhz5Ng=;
 b=x9a5cR/iymXJSqOSF5XvWUAzRLm0dxPRpWWF9ZAM3iVCU5LvJ6lDdween126vp9Sqc
 v00BeVnu1oY3Or5sP44YWlv1Q4GAMMTEUW6B8/5Dn4+ip1UbZV228kv+gWJHMVNYTNsV
 FHwvgdCkH4Keubl1vqJokdhCNo79T5Em0S2AHkk7+njKwNLvvuwqqfcy535p8KSBkuPf
 OXf8CJKXNGjdxXuZfWunHmZq25Gs7DNLY/GXpTga4HrKbnytpd0P0bRbThvhNuViMg2e
 A7KWJOgv0jGEtn0/IzKBVMPp2bUQPw4kh3BTIjNX1sb9e5LqZUswXaSMuoxWsX2NLHFh
 0HFw==
X-Gm-Message-State: AOAM531wGXMw8eXFkvfN+swfvgB/LAJXBv+8h12Smesf7Vzoel0mP4+i
 39N7dcF4JK35vXF6/IQO/LL8cg==
X-Google-Smtp-Source: ABdhPJxObpFNydechU+JRZmJXMUcCAEyUXEUS5mdqa/Nx/Ud0+msxmrpwxol1cWWSBBnChsLatB4Mg==
X-Received: by 2002:a50:9b11:0:b0:42a:c1b2:b2ca with SMTP id
 o17-20020a509b11000000b0042ac1b2b2camr1027447edi.313.1654107240650; 
 Wed, 01 Jun 2022 11:14:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170906368800b006f4c557b7d2sm957712ejc.203.2022.06.01.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:13:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 621D71FFD3;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 28/33] gitlab: introduce a common base job template
Date: Wed,  1 Jun 2022 19:05:32 +0100
Message-Id: <20220601180537.2329566-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-29-alex.bennee@linaro.org>

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


