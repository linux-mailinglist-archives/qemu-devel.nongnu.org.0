Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCCF5365C2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:11:05 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucYK-0001hU-Jz
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8d-0003fV-Ao
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8W-0003u7-1U
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso4803258wma.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEwhsedMRUwqfo2UAggQd5Om0FzRR5RpVgk+ECH7B4s=;
 b=OKuhlwBaw1NdhN6KiAYwynI1BZDN88ZI1f506igAM3FA2bFXT8IxUnERPwtIkEiUdn
 KPGlMEsYMTkpd7fIlArxYPym/raYQxtBE/sISZHOzJV7sUkKvr8qfXxH/hr0UZKHcooz
 xS+zBIPzkotV0XmFRej+x+vNrLIAlNMtkImLl4IXXYeJGsrArxinnYFRG2WHetHMSPxL
 cA/u1Nsweufm01Xg5MAbIzaL/Ik+Df4mg1naszgOTwql7UbNs9kn63vT2vfU/7lFCbMv
 VqoX0/NYBD789NpfsouWu3V20qITlsAdcdBirwKMySPAXGDVZCRVVploIx/iVdy78QH1
 1NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEwhsedMRUwqfo2UAggQd5Om0FzRR5RpVgk+ECH7B4s=;
 b=x1NGj+7vtbTw39QkTiUUSseWXYcKjqRm34R+DAqSXdwGj4uB2As0sdRATpc5q0zz4v
 GJ3FgnrTW+SYga6NPNJPEUc+9UH9CS7BJ0vs3uE6zGDCKHPjl+uyWUZ6WpXV/pJpjXF6
 q6Y2j6VUk98YHvaEtqPWxo0BxcA0TtMr+W0Wq/h+5ppudiB+V1DNHy8DPrCfyL7KBTfU
 SQbp8JOpVXc77+HUtfM/FVQI1r/DC9aUYGD86yxvGH3bYonjzqsd8bWit5C7a0kqLTuz
 /I9kYscQCsQQa4qN71loDKIMRqAIg1AeksIzzLROXzUB1133JmbML7Yzd8oGDDEoVrv1
 /I+A==
X-Gm-Message-State: AOAM530Stg92X6VAeCQaAOTTsqVPkhxjF23v6Ds6CZEPLGwW0sF9Y4SW
 IIkoNkzyCHap980cHokdqUgskw==
X-Google-Smtp-Source: ABdhPJxJ+zOgLs9V6NrdPKTZycZKosh7VUu1acULRQMBrXNl3MZTIGv0rcTCtNoeNDyxiIUSiWfh2w==
X-Received: by 2002:a05:600c:1d8b:b0:397:4106:a6d4 with SMTP id
 p11-20020a05600c1d8b00b003974106a6d4mr7668381wms.25.1653666261172; 
 Fri, 27 May 2022 08:44:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a1ccc01000000b00397342e3830sm11394164wmb.0.2022.05.27.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C22081FFD7;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 32/33] gitlab: don't run CI jobs in forks by default
Date: Fri, 27 May 2022 16:36:02 +0100
Message-Id: <20220527153603.887929-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

To preserve CI shared runner credits we don't want to run
pipelines on every push.

This sets up the config so that pipelines are never created
for contributors by default. To override this the QEMU_CI
variable can be set to a non-zero value. If set to 1, the
pipeline will be created but all jobs will remain manually
started. The contributor can selectively run jobs that they
care about. If set to 2, the pipeline will be created and
all jobs will immediately start.

This behavior can be controlled using push variables

  git push -o ci.variable=QEMU_CI=1

To make this more convenient define an alias

   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"

Which lets you run

  git push-ci

to create the pipeline, or

  git push-ci-now

to create and run the pipeline

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-6-berrange@redhat.com>
[AJB: fix typo, replicate alias tips in ci.rst]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc | 38 ++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/base.yml      |  9 +++++++++
 2 files changed, 47 insertions(+)

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 0b4926e537..13d448b54d 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -28,6 +28,32 @@ For further information about how to set these variables, please refer to::
 
   https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
 
+Setting aliases in your git config
+----------------------------------
+
+You can use aliases to make it easier to push branches with different
+CI configurations. For example define an alias for triggering CI:
+
+.. code::
+
+   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
+   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
+
+Which lets you run:
+
+.. code::
+
+   git push-ci
+
+to create the pipeline, or:
+
+.. code::
+
+   git push-ci-now
+
+to create and run the pipeline
+
+  
 Variable naming and grouping
 ----------------------------
 
@@ -98,6 +124,18 @@ Contributor controlled runtime variables
 The following variables may be set by contributors to control
 job execution
 
+QEMU_CI
+~~~~~~~
+
+By default, no pipelines will be created on contributor forks
+in order to preserve CI credits
+
+Set this variable to 1 to create the pipelines, but leave all
+the jobs to be manually started from the UI
+
+Set this variable to 2 to create the pipelines and run all
+the jobs immediately, as was historicaly behaviour
+
 QEMU_CI_AVOCADO_TESTING
 ~~~~~~~~~~~~~~~~~~~~~~~
 By default, tests using the Avocado framework are not run automatically in
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 6a918abbda..62f2a850c3 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -28,6 +28,10 @@
     - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
       when: never
 
+    # Forks don't get pipelines unless QEMU_CI=1 or QEMU_CI=2 is set
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: never
+
     # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is set
     - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING != "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
       when: never
@@ -59,5 +63,10 @@
     # an earlier criteria
     #############################################################
 
+    # Forks pipeline jobs don't start automatically unless
+    # QEMU_CI=2 is set
+    - if: '$QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: manual
+
     # Jobs can run if any jobs they depend on were successfull
     - when: on_success
-- 
2.30.2


