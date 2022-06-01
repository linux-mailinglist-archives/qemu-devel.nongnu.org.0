Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC453ACD8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:33:59 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTAM-0006GA-Jz
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrA-0001uo-Px
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:08 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr9-0006Xa-0B
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:08 -0400
Received: by mail-ej1-x62e.google.com with SMTP id jx22so5361624ejb.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zB9PzY9absq/vVv3/mkPW7xF9ulwG7GOEfvmbfDqI38=;
 b=k4fsHiHrSYRCBTIkgXdosAyWSnJFEPlLSWpg+V1W0/GiaOZoKsT9YkFFbHSGtKsrDt
 oI2mnyhBGhKax08lDZR+IwQTX4fnMMeCcGc7NSDlnCkQsNv5J/oJoMqn0kSoOFOxcY2t
 wzr5b6mst0UC4P6tiUexEZI9zSBQly2T/9LHKdnoiyceYSGApC0aTy34KdkU4XDLEdZU
 tCZEYdyzd0rvXkL7ZXCtQeAS8a+xOwIzuuKkWVT4P5BfQ+lX+QzDcWDdToJzW456TaRV
 S8S9IPin/cf9Mi4Yz6y1e3LPHq8YWLN2zDXnPCk1gfR0QXn3UvH5CBUMQR3cmnLi5A4G
 h7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zB9PzY9absq/vVv3/mkPW7xF9ulwG7GOEfvmbfDqI38=;
 b=4yiNevuahLmNJJO7GtrhtQx7fGMHvLYkTTDglsgCoKqwGXBHg2D1Y8lis/gVmM/e7n
 JGaJCPwgwFrxBXBn+UD+bROPFZm21xtLIqXVqThY4T0BfNNo1pqpdFA/pOsg6nnURHw5
 azepfsIFM1ihhi/Vn5QSPu/4/p1in8EMuzx5N8sD9B5lpVxbkhJZOxW86ngGC/th1lD2
 aFfabS///1J75ownYBbWCZ4Lk13basCbcM8GeiurhyObKfpnF9r7+5gKeug2HikxBfbH
 RcfzlUJMMcgCsn+0ssYhTpD//wnSBeKPdi7UCjVwClHu86IDEYtoZkIu7PWw9pz/EbgW
 F23Q==
X-Gm-Message-State: AOAM530Lb9xudYzZ4GnnlRzxO97a3agqT7L7Rgdfq2LKl49K7/mWBmt1
 isT8YjhnRRVVF/tV/cSGlvhtJQ==
X-Google-Smtp-Source: ABdhPJzK2Nyf/G038px3PDDsJ/bg48RR+nEhxVPfaE8e5YOv4mxE+j+EJkJPSF16CWuUXqpGwF8VzQ==
X-Received: by 2002:a17:906:b816:b0:708:2e56:97d7 with SMTP id
 dv22-20020a170906b81600b007082e5697d7mr712344ejb.502.1654107246246; 
 Wed, 01 Jun 2022 11:14:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a1709063ec900b006fec63e564bsm990358ejj.30.2022.06.01.11.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C32881FFD7;
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
Subject: [PULL 32/33] gitlab: don't run CI jobs in forks by default
Date: Wed,  1 Jun 2022 19:05:36 +0100
Message-Id: <20220601180537.2329566-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-33-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 0b4926e537..9118a61a17 100644
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
index 4f091d5aad..f334f3ded7 100644
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


