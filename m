Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11A680B39
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:47:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRfO-0006zW-0i; Mon, 30 Jan 2023 05:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMRey-0006yG-1R
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMRew-0001nh-Ky
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPypfQ4VM4lDu8MTFVa/HYXT3hVREerknkebOVnDhYk=;
 b=UL40bzn4N42iFfsrQLtbrCp/+wB+jbDSiZ6A6GvuXzOa2v9ljfvP4HJ9Lwd49LgH67OErL
 /TAgH45OfYlDcQZIN8iD9vNxrE3d6oTWXodTbEXpTjzXZaauHqtzVO/GCoEfbLASE4Kfyw
 qsJM2U03dw4yQVpwigWlAm4can//mJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-szQDv_K2OASa6b4iaCyxcA-1; Mon, 30 Jan 2023 05:44:58 -0500
X-MC-Unique: szQDv_K2OASa6b4iaCyxcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61C79800B30;
 Mon, 30 Jan 2023 10:44:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376C0492B01;
 Mon, 30 Jan 2023 10:44:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Date: Mon, 30 Jan 2023 11:44:46 +0100
Message-Id: <20230130104446.1286773-7-thuth@redhat.com>
In-Reply-To: <20230130104446.1286773-1-thuth@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
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
Move --with-coroutine=sigaltstack to the build-without-defaults job
and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml   | 14 ++------------
 .gitlab-ci.d/crossbuilds.yml |  2 +-
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 91c7467a66..1438797a1c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -533,19 +533,8 @@ build-tci:
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
+# (and an alternative coroutine implementation)
 build-without-defaults:
   extends: .native_build_job_template
   needs:
@@ -559,6 +548,7 @@ build-without-defaults:
       --disable-pie
       --disable-qom-cast-debug
       --disable-strip
+      --with-coroutine=sigaltstack
     TARGETS: avr-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
       sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
     MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-mips64
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 8dbbb8f881..027d2088da 100644
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


