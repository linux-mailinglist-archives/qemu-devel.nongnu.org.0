Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A7F534DF6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:22:20 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBZJ-0000AP-RO
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKi-0007oq-Um
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKg-0003LZ-Vq
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsBD/TtWA9TENON+NIB8vN8zw4Jh4ObFyQIpvFEd9bo=;
 b=JyUZNfz51W6q83HdXsA4FZt7jEq2yN3tXO2mSsCzoKR8mDuemNA3yuMBqKAxTpaYQY9mqn
 2PCjrmFS0Gds0VvYsENI6Veucv1VJqxFRn8eYMkTSamWOPKvIe5Z2CPEZhgi+AbD73knP0
 oUEbwSNytJSQI6NuA5Z+9smqXVf0Lo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-9vRTYJibNTu2PVvq1ppg5g-1; Thu, 26 May 2022 07:07:07 -0400
X-MC-Unique: 9vRTYJibNTu2PVvq1ppg5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C81B13802B89;
 Thu, 26 May 2022 11:07:06 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9477482872;
 Thu, 26 May 2022 11:07:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] gitlab: introduce a common base job template
Date: Thu, 26 May 2022 07:07:01 -0400
Message-Id: <20220526110705.59952-2-berrange@redhat.com>
In-Reply-To: <20220526110705.59952-1-berrange@redhat.com>
References: <20220526110705.59952-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
---
 .gitlab-ci.d/base.yml         | 28 +++++++++++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml |  1 +
 docs/devel/ci-jobs.rst.inc    | 36 ++++++++++++++++++++++++++++++++++-
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 .gitlab-ci.d/base.yml

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
-- 
2.36.1


