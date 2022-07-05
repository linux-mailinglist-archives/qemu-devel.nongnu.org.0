Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A708B566862
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:43:20 +0200 (CEST)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g1X-0006DG-Og
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwu-0006J5-8U
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fws-0005ys-EA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wiqfLJl5ERY4Q4V6Q+fhauaRLFe3XwAz62VjZGVa7U=;
 b=fDoW3q3GJSCV27GLTqDhM2FTPpXP8KaXKrMx0QB3s2lUxcw4goQvIadqJKZR/wOWbOGsBC
 SVBqFJkXU3uK5jx6DrPYMEMWDXOIr3OuWW5GP8Fx6iP+Ow9iOTuitMn2FIh+3S2WxSb5Z2
 QbO04bZ2NDz/Jw+vVoUVNJebGX+M4Ko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-aPvr6R_zPnqloWLHEoVOvA-1; Tue, 05 Jul 2022 06:38:26 -0400
X-MC-Unique: aPvr6R_zPnqloWLHEoVOvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71C0F80174C;
 Tue,  5 Jul 2022 10:38:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB85492C3B;
 Tue,  5 Jul 2022 10:38:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 05/14] gitlab: honour QEMU_CI variable in edk2/opensbi jobs
Date: Tue,  5 Jul 2022 12:38:07 +0200
Message-Id: <20220705103816.608166-6-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

To preserve contributor CI credits we don't want jobs to run by default
unless the QEMU_CI variable is set. For most jobs we can achieve this
using the base template, but the edk2/opensbi jobs are a little special
as they have some complex conditions we can't easily model in the base
template.

We duplicate existing rules and put them under control of QEMU_CI
variable, such that QEMU_CI=1 creates manual jobs and QEMU_CI=2
immediately runs jobs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220629170638.520630-4-berrange@redhat.com>
[thuth: Fixed "on_success" <-> "manual" copy-n-paste bug]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/edk2.yml    | 23 +++++++++++++++++++++++
 .gitlab-ci.d/opensbi.yml | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 905e02440f..314e101745 100644
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
+      when: manual
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
2.31.1


