Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3926560736
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 19:18:53 +0200 (CEST)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6bL1-0003yJ-V6
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 13:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9c-0002Pg-F4
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6b9Y-0004gw-CN
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 13:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656522411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yha2KE1fVIGSV7g0IFfqXt7wsJuo7s2LCE9p4mB0U5M=;
 b=de5Xl4OHp9hpm/y5Cx+iVM3SD0Wt2JEsbkVLenRO/EMjG3zQGZKSdsERnUcmIlr8Tzqf4L
 b3fB1akgFHl0cF1YJ+u2dfs7c7m9bPrukQTghS+joXAl5bVRvdb7bNSNClv5uA3iubM1N/
 IRzU692O8Ln3bsmY6ty6OvFMz5uvsYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-Kzsxn3XFNNCoEJaYSPchYg-1; Wed, 29 Jun 2022 13:06:47 -0400
X-MC-Unique: Kzsxn3XFNNCoEJaYSPchYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0E56185A7B2;
 Wed, 29 Jun 2022 17:06:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBC92166B29;
 Wed, 29 Jun 2022 17:06:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] gitlab: honour QEMU_CI variable in edk2/opensbi jobs
Date: Wed, 29 Jun 2022 18:06:38 +0100
Message-Id: <20220629170638.520630-4-berrange@redhat.com>
In-Reply-To: <20220629170638.520630-1-berrange@redhat.com>
References: <20220629170638.520630-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

To preserve contributor CI credits we don't want jobs to run by default
unless the QEMU_CI variable is set. For most jobs we can achieve this
using the base template, but the edk2/opensbi jobs are a little special
as they have some complex conditions we can't easily model in the base
template.

We duplicate existing rules and put them under control of QEMU_CI
variable, such that QEMU_CI=1 creates manual jobs and QEMU_CI=2
immediately runs jobs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/edk2.yml    | 23 +++++++++++++++++++++++
 .gitlab-ci.d/opensbi.yml | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 905e02440f..970bdbd315 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,6 +1,29 @@
 # All jobs needing docker-edk2 must use the same rules it uses.
 .edk2_job_rules:
   rules:
+    # Forks don't get pipelines unless QEMU_CI=1 or QEMU_CI=2 is set
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: never
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if any of the files affecting the build are touched
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      changes:
+        - .gitlab-ci.d/edk2.yml
+        - .gitlab-ci.d/edk2/Dockerfile
+        - roms/edk2/*
+      when: manual
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if the branch/tag starts with 'edk2'
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_REF_NAME =~ /^edk2/'
+      when: manual
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if last commit msg contains 'EDK2' (case insensitive)
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_MESSAGE =~ /edk2/i'
+      when: on_success
+
     # Run if any files affecting the build output are touched
     - changes:
         - .gitlab-ci.d/edk2.yml
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 753a003f93..04ed5a3ea1 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,6 +1,29 @@
 # All jobs needing docker-opensbi must use the same rules it uses.
 .opensbi_job_rules:
   rules:
+    # Forks don't get pipelines unless QEMU_CI=1 or QEMU_CI=2 is set
+    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: never
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if any files affecting the build output are touched
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      changes:
+        - .gitlab-ci.d/opensbi.yml
+        - .gitlab-ci.d/opensbi/Dockerfile
+        - roms/opensbi/*
+      when: manual
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if the branch/tag starts with 'opensbi'
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_REF_NAME =~ /^opensbi/'
+      when: manual
+
+    # In forks, if QEMU_CI=1 is set, then create manual job
+    # if the last commit msg contains 'OpenSBI' (case insensitive)
+    - if: '$QEMU_CI == "1" && $CI_PROJECT_NAMESPACE != "qemu-project" && $CI_COMMIT_MESSAGE =~ /opensbi/i'
+      when: manual
+
     # Run if any files affecting the build output are touched
     - changes:
         - .gitlab-ci.d/opensbi.yml
-- 
2.36.1


