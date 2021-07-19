Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A73CD47A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:14:10 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5S9x-0006u7-7G
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8R-0004t7-1H
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8P-0002XM-AB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626696752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcXRIqcqx3n6Xj+bZCbdakbmo8cBL3nuRssy7PoDnQM=;
 b=a0lgp+3T9mta32mGZYnRWH1Lye7cV62Vxo9vl9ob/r5ubkt2q5biP2HF8ZUi1Tm7bM2teo
 4s7PzMm7qo+RmOdlsZTgvW7XyVMOH+jbakadTOWgHqT8PRGiCpfPpkfxZWcmok3+7d11oc
 uLwyl/QhwMVimpgZmlGn9Mf7gH4zIaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-7Dn2AHIkO8-_4WBkOeT7Hg-1; Mon, 19 Jul 2021 08:12:29 -0400
X-MC-Unique: 7Dn2AHIkO8-_4WBkOeT7Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3549718414A0;
 Mon, 19 Jul 2021 12:12:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-193.ams2.redhat.com
 [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 534EA5DEFA;
 Mon, 19 Jul 2021 12:12:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] gitlab: prevent CI jobs running pushes to default branch
 or tags
Date: Mon, 19 Jul 2021 13:12:14 +0100
Message-Id: <20210719121215.2356409-2-berrange@redhat.com>
In-Reply-To: <20210719121215.2356409-1-berrange@redhat.com>
References: <20210719121215.2356409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When patch series are accepted they are first pushed to the 'staging'
branch, which triggers a CI pipeline. If-and-only-if the pipeline
succeeds, the code is then pushed to the default branch. The latter
step triggers a second pipeline that duplicates what was just validated
in the 'staging' branch. This wastes CI resources and can delay jobs
needed by a subsequently pushed 'staging' branch.

This is particularly evident with jobs delegated to Cirrus CI where
there is very limited concurrency of jobs. The duplicate jobs in
'master' often delay the next 'staging' jobs enough to cause 1 hour
timeout to be hit.

There is similar wasted CI resource when release tags are pushed to
the repo, since the branch associated with the release will have
already passed CI.

For user forks is is reasonable to skip CI on the default branch since
that's either usually unused or follows the main repo default branch.
Meanwhile tags in user forks are typically used to track postings of
specific patch series versions. It is expected that a contributor
will have tested before sending the patch series. Thus pipelines for
the default branch and tag pushes in forks are redundant too.

This patch makes use of the 'workflow:' configuration to setup rules
that apply to the entire pipeline. The rules allow pipelines to be
created ONLY in response to:

 - Push events to a non-default branch
 - Scheduled pipelines
 - REST API pipeline triggers
 - Web UI pipeline triggers

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/qemu-project.yml |  1 +
 .gitlab-ci.d/workflow.yml     | 56 +++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 .gitlab-ci.d/workflow.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index b3d79bc429..13202e31e9 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -2,6 +2,7 @@
 # https://gitlab.com/qemu-project/qemu/-/pipelines
 
 include:
+  - local: '/.gitlab-ci.d/workflow.yml'
   - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
diff --git a/.gitlab-ci.d/workflow.yml b/.gitlab-ci.d/workflow.yml
new file mode 100644
index 0000000000..5c877bae11
--- /dev/null
+++ b/.gitlab-ci.d/workflow.yml
@@ -0,0 +1,56 @@
+
+# This defines global scenarios for controlling execution of the
+# entire pipeline. The pipelines are set to run when
+#
+#  - Pushing to a non-default branch
+#  - Triggered via REST API
+#  - Triggered via Web UI
+#  - Regular scheduled run
+#
+workflow:
+  rules:
+    # For the main repo, prior to merging a patch series, CI is run
+    # on the "staging" branch. The result gates whether the series
+    # is then pushed to the default branch.
+    #
+    # For user forks, the default branch is typically unused or
+    # otherwise just tracks the main repo default branch in an
+    # adhoc manner. Work is typically done on feature branches
+    # instead.
+    #
+    # In neither case do we wish to run CI pipelines for the
+    # default branch
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+      when: never
+
+    # For the main repo, tags represent official releases.
+    # The branch associated with the release will have passed
+    # a CI pipeline already
+    #
+    # For user forks, tags are often added by tools like
+    # git-publish at the same time as pushing the branch.
+    #
+    # In neither case do we wish to run CI pipelines for tags
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_TAG'
+      when: never
+
+    # Run CI on any git pushes to remaining non-dfault branches
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_BRANCH'
+      when: always
+
+    # Run CI on any regular scheduled pipelines (ie nightly builds)
+    - if: '$CI_PIPELINE_SOURCE == "schedule"'
+      when: always
+
+    # Run CI if user invokes a pipeline using explicit REST API call
+    - if: '$CI_PIPELINE_SOURCE == "api"'
+      when: always
+
+    # Run CI if user invokes a pipeline using Web UI
+    - if: '$CI_PIPELINE_SOURCE == "web"'
+      when: always
+
+    # Don't run CI in any other scenario ($CI_PIPELINE_SOURCE values
+    # covering: external, chat, webide, merge_request_event,
+    # external_pull_request_event, parent_pipeline, trigger, or pipeline)
+    - when: never
-- 
2.31.1


