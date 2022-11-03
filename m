Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E17618A7D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhgT-0002yq-3k; Thu, 03 Nov 2022 17:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhgR-0002ye-7V
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhgP-0006Gc-B7
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667510608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GW9x8TZz8CQU7w9l8EonZpopeP/duV3lqyBxGUAHGPo=;
 b=iYWsRiRrglfz/KC0FlQLJ5p0s8xq6JSYBvv1q8YhSXra8HdcTjH7WCq0ErbV3QRacmpifY
 DcmulkGcNQS0E9rpqOwQrmz7eiR0rsDVHMsxGJWjIXc8NkJzEoc0Qw6qNEEFHBEQvteq+7
 0qK3Oijdw9/6ut7tAf2zl8OiPUTsW+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-LfTlnjYwPrqfELXXcVhPIQ-1; Thu, 03 Nov 2022 17:23:24 -0400
X-MC-Unique: LfTlnjYwPrqfELXXcVhPIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78F771C05159;
 Thu,  3 Nov 2022 21:23:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D582D4EA52;
 Thu,  3 Nov 2022 21:23:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] gitlab-ci: split clang-user to avoid timeout
Date: Thu,  3 Nov 2022 17:23:21 -0400
Message-Id: <20221103212321.387738-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GitLab CI times out when the clang-user job takes over 1 hour. Split it
into parts that check various architectures.

An alternative is to have one job per architecture but that clutters the
pipeline view and maybe there is some sharing when multiple targets are
built at once.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 11 +++++++++++
 .gitlab-ci.d/buildtest.yml          | 18 +++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..38b055e139 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -81,3 +81,14 @@
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
   variables:
     QEMU_JOB_AVOCADO: 1
+
+.clang-user-template:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+      --extra-cflags=-fsanitize=undefined
+      --extra-cflags=-fno-sanitize-recover=undefined
+    MAKE_CHECK_ARGS: check-unit check-tcg
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 6c05c46397..116fce4e8f 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -323,16 +323,16 @@ clang-system:
       ppc-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-qtest check-tcg
 
-clang-user:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
+# clang-user takes too long so split it into parts
+clang-user-part1:
+  extends: .clang-user-template
   variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
-      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
-      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
-    MAKE_CHECK_ARGS: check-unit check-tcg
+    TARGETS: aarch64-linux-user,alpha-linux-user,armeb-linux-user,arm-linux-user,cris-linux-user,hexagon-linux-user,hppa-linux-user,loongarch64-linux-user,microblaze-linux-user,mips64el-linux-user,mips64-linux-user,mipsel-linux-user,mips-linux-user,mipsn32-linux-user
+
+clang-user-part2:
+  extends: .clang-user-template
+  variables:
+    TARGETS: nios2-linux-user,or1k-linux-user,ppc64le-linux-user,ppc64-linux-user,ppc-linux-user,riscv32-linux-user,riscv64-linux-user,s390x-linux-user,sh4eb-linux-user,sh4-linux-user,sparc32plus-linux-user,sparc64-linux-user,sparc-linux-user,x86_64-linux-user,xtensa-linux-user
 
 # Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
 # On gitlab runners, default value sometimes end up calling 2 lds concurrently and
-- 
2.38.1


