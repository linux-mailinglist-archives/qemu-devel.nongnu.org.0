Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E984C505D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:09:27 +0100 (CET)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhqA-000475-7e
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:09:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhkL-0006xF-2y
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhk8-0005Ol-9Z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1B/ExmGCc3kNjbey2HtHUXNy2IapyW5A0JVDq6/Ncg=;
 b=ijd6ydhbyEzKGrU2nC9JFdm7ib3foluBkX8MDHeswyhgdqK57q0f3VEoqzrqa6ZRm9YmIC
 sotIkDy3NM+gj81wxLc1l32Xb5VofzywZ7ahFAAQ41UR0n4olffyg3JL3RB3QftwSg57dd
 j84veIKod22OHXKQwGel2b1qCpDfcxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-9IINanKgObSAFai1K7GrWg-1; Fri, 25 Feb 2022 16:03:08 -0500
X-MC-Unique: 9IINanKgObSAFai1K7GrWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0603D801AAD;
 Fri, 25 Feb 2022 21:03:05 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9592ED8A;
 Fri, 25 Feb 2022 21:02:55 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/9] Avocado GitLab CI jobs: don't reset TARGETS and simplify
 commands
Date: Fri, 25 Feb 2022 16:01:48 -0500
Message-Id: <20220225210156.2032055-2-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Avocado tests rely on the TARGETS variable, which is computed
based on the built targets.  The current set of commands on the
inherited scripts section will reset those, leaving TARGETS empty and
consequently the AVOCADO_CMDLINE_TAGS empty too.

This is causing the list of tests to have no filtering by tags, which
can be seen by the large number of CANCEL/SKIP statuses (because of
the lack of a matching qemu-system-$(ARCH) binary).

With this change, the TARGETS variable is properly computed, and so is
the AVOCADO_CMDLINE_TAGS.  This causes a reduction in the number of
tests attempted to be run on each job, and less noise on the test
results.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 3 +++
 .gitlab-ci.d/buildtest.yml          | 9 ---------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 2c7980a4f6..c038a0910f 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -64,6 +64,9 @@
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
       fi
     - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
+  script:
+    - cd build
+    - make check-avocado
   after_script:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aa70213fb..d0bed9c382 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -33,7 +33,6 @@ avocado-system-alpine:
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -66,7 +65,6 @@ avocado-system-ubuntu:
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
   extends: .native_build_job_template
@@ -98,7 +96,6 @@ avocado-system-debian:
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-avocado
 
 crash-test-debian:
   extends: .native_test_job_template
@@ -143,7 +140,6 @@ avocado-system-fedora:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 crash-test-fedora:
   extends: .native_test_job_template
@@ -189,7 +185,6 @@ avocado-system-centos:
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check-avocado
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -221,7 +216,6 @@ avocado-system-opensuse:
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-avocado
 
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
@@ -382,7 +376,6 @@ avocado-cfi-aarch64:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -424,7 +417,6 @@ avocado-cfi-ppc64-s390x:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -460,7 +452,6 @@ avocado-cfi-x86_64:
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-avocado
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.35.1


