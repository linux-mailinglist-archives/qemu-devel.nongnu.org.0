Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7C68E1C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUN8-00070F-6U; Tue, 07 Feb 2023 15:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMz-0006tA-ML
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMy-0007Pa-5d
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN05zVDJNJMtDptc53Q13nH0w/8XTAaAxOSjR0C7ouw=;
 b=feb/zoLdkTKbVewxN6tsdiM9DJL+mpBCglIhFt5/t0APpsMDZ5HFEtHWfGd12D37HzUBSu
 uETNC4MtDhetrHs6x/hV4WrFHjbelSblWE34h+Xp80OTZwX9C4E3RGNsEuTmgmR7Jb1qe6
 73jO6wuFq2IBfO21BCtQA7h3qMxO9xk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-krP6op9XNJ-lTNTQCOu-AQ-1; Tue, 07 Feb 2023 15:15:02 -0500
X-MC-Unique: krP6op9XNJ-lTNTQCOu-AQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C024029A9CAE;
 Tue,  7 Feb 2023 20:15:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409F7492B21;
 Tue,  7 Feb 2023 20:15:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/5] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Date: Tue,  7 Feb 2023 21:14:45 +0100
Message-Id: <20230207201447.566661-4-thuth@redhat.com>
In-Reply-To: <20230207201447.566661-1-thuth@redhat.com>
References: <20230207201447.566661-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We can get rid of the build-coroutine-sigaltstack job by moving
the configure flags that should be tested here to other jobs:
Move --with-coroutine=sigaltstack to the build-system-debian job
(where the coroutines should get some more test coverage with
"make check-block", too) and --enable-trace-backends=ftrace to
the cross-s390x-kvm-only job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml   | 13 +------------
 .gitlab-ci.d/crossbuilds.yml |  2 +-
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8fff961b44..8697c61072 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -74,6 +74,7 @@ build-system-debian:
     job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
+    CONFIGURE_ARGS: --with-coroutine=sigaltstack
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -534,18 +535,6 @@ build-tci:
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
     - make check-tcg
 
-# Alternate coroutines implementations are only really of interest to KVM users
-# However we can't test against KVM on Gitlab-CI so we can only run unit tests
-build-coroutine-sigaltstack:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
-                    --enable-trace-backends=ftrace
-    MAKE_CHECK_ARGS: check-unit
-
 # Check our reduced build configurations
 build-without-defaults:
   extends: .native_build_job_template
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 74d6259b90..57637c5127 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -159,7 +159,7 @@ cross-s390x-kvm-only:
     job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
-    EXTRA_CONFIGURE_OPTS: --disable-tcg
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --enable-trace-backends=ftrace
 
 cross-mips64el-kvm-only:
   extends: .cross_accel_build_job
-- 
2.31.1


