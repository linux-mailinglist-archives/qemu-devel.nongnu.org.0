Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F58C3713C9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:50:14 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW9V-0000L5-3Y
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4l-0003sS-BO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4j-0003U7-65
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yV7JXyljJqqL4uQC7gBZIedJt1wWaNNxCcwEZecXOMc=;
 b=RCgKYzbXVtbrossmOwLrbZY+NTBDChqpClAMw4p7yJX6tw7MUp0N2PLzSViOu09pPdH4MS
 4Pzok08blZLwOizUR7XK7dEsZkO/q80GWEn+3UX3Ho0j2QpSh5oguBYrQ4hzuG6a2SiXBI
 u9V9MmCrAwonIbLdZ3xWIXn4rdhDGlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-_qGs7KluMrOHpxMPjABCyQ-1; Mon, 03 May 2021 06:45:13 -0400
X-MC-Unique: _qGs7KluMrOHpxMPjABCyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0DA81020C21;
 Mon,  3 May 2021 10:45:12 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D94C5D9D0;
 Mon,  3 May 2021 10:45:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/10] gitlab-ci: Replace YAML anchors by extends
 (native_test_job)
Date: Mon,  3 May 2021 12:44:52 +0200
Message-Id: <20210503104456.1036472-7-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210418233448.1267991-4-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 442e78a0a7..f01a1dbd7c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,7 +37,7 @@ include:
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
-.native_test_job_template: &native_test_job_definition
+.native_test_job_template:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -95,7 +95,7 @@ build-system-alpine:
       - build
 
 check-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -104,7 +104,7 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -129,7 +129,7 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -138,7 +138,7 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -163,7 +163,7 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -172,7 +172,7 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -198,7 +198,7 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -207,7 +207,7 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -233,7 +233,7 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -242,7 +242,7 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -266,7 +266,7 @@ build-system-opensuse:
       - build
 
 check-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -275,7 +275,7 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -509,7 +509,7 @@ build-cfi-aarch64:
       - build
 
 check-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -518,7 +518,7 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -546,7 +546,7 @@ build-cfi-ppc64-s390x:
       - build
 
 check-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -555,7 +555,7 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -583,7 +583,7 @@ build-cfi-x86_64:
       - build
 
 check-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -592,7 +592,7 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -630,7 +630,7 @@ build-deprecated:
 # We split the check-tcg step as test failures are expected but we still
 # want to catch the build breaking.
 check-deprecated:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-deprecated
       artifacts: true
-- 
2.27.0


