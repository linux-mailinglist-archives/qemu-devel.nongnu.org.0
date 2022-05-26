Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47454534E17
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:29:01 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBfo-0006cB-Ct
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKk-0007pV-Ed
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKi-0003Lw-QG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6P3TOnwGTv8ggo6E9OqOCanLAJZzK8SrWfUEHmbEOc=;
 b=GMr8XeujRST5XKJyIC2syZ0JyRba9Dc5x6dkgu7mI0l3ClT7RSdwqB//UHbzqejr3VwSwp
 Elz1f84A1/6IaYGJlLOdzLRf5x7O1/2NoHHy+PEi+FVueGSP9fahCywfXDJenbroLiW0Aw
 ux7asvO4EhMu9qKTeLHiP/NrOSZ50Yo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-NMikiaHlMcG2Pa5mOw7DRw-1; Thu, 26 May 2022 07:07:08 -0400
X-MC-Unique: NMikiaHlMcG2Pa5mOw7DRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72CD801228;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9404382872;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 5/5] gitlab: don't run CI jobs in forks by default
Date: Thu, 26 May 2022 07:07:05 -0400
Message-Id: <20220526110705.59952-6-berrange@redhat.com>
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

To preserve CI shared runner credits we don't want to run
pipelines on every push.

This sets up the config to that pipelines are never created
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
---
 .gitlab-ci.d/base.yml      |  9 +++++++++
 docs/devel/ci-jobs.rst.inc | 12 ++++++++++++
 2 files changed, 21 insertions(+)

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
diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 0b4926e537..e36c8cc68d 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -98,6 +98,18 @@ Contributor controlled runtime variables
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
-- 
2.36.1


