Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E961863C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqe3s-00086I-GI; Thu, 03 Nov 2022 13:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe3O-00082L-Lw
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe3J-00041E-S5
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKTQpgfAI+5wQiG02pSTx2JoGN02tkjKcgJNB1oQWAc=;
 b=MWDdXdl9l2SIsXrIlKFwm1ZrNW9qFXRZwYBf5BIaDNEXrOn1sdVGqaH0MX9sTz9sN1k9l7
 hP8S4tb1UJxmlKVJmP+d1rR5FJtTTE4uyNz+TY4lgIPUYQ/DHDb8s1i4+Mmbro/9QaZZ4Q
 RKHhlGzzPkBXPifpuuT/BombziA5YeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-vAvnBrtnOFOLXVCflbN_xA-1; Thu, 03 Nov 2022 13:30:47 -0400
X-MC-Unique: vAvnBrtnOFOLXVCflbN_xA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B797811E67;
 Thu,  3 Nov 2022 17:30:46 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6F5492B06;
 Thu,  3 Nov 2022 17:30:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] gitlab: show configure/make args before running
Date: Thu,  3 Nov 2022 13:30:44 -0400
Message-Id: <20221103173044.3969425-3-berrange@redhat.com>
In-Reply-To: <20221103173044.3969425-1-berrange@redhat.com>
References: <20221103173044.3969425-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

When debugging failed jobs it is helpful to see the
full configure/make args used, without having to search
the gitlab config file to figure it out.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml  |  4 ++++
 .gitlab-ci.d/crossbuild-template.yml | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..0af980c71d 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -13,8 +13,10 @@
     - cd build
     - if test -n "$TARGETS";
       then
+        echo "../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list=\"$TARGETS\"" ;
         ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
+        echo "../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS" ;
         ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
@@ -24,6 +26,7 @@
     - make -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
       then
+        echo "make -j\"$JOBS\" $MAKE_CHECK_ARGS" ;
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
@@ -37,6 +40,7 @@
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
+    - echo "make NINJA=\":\" $MAKE_CHECK_ARGS"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
 .native_test_job_template:
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 6d709628f1..d217dcaae0 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -6,11 +6,17 @@
   script:
     - mkdir build
     - cd build
+    - echo "../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-user --target-list-exclude=\"arm-softmmu cris-softmmu
+          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
+          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
+          sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS\""
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
           sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
+    - echo "make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
@@ -31,8 +37,11 @@
   script:
     - mkdir build
     - cd build
+    - echo "../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS"
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
+    - echo "make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
@@ -42,9 +51,15 @@
   script:
     - mkdir build
     - cd build
+    - echo "../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-system --target-list-exclude=\"aarch64_be-linux-user
+          alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
+          nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
+          xtensa-linux-user $CROSS_SKIP_TARGETS\""
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-system --target-list-exclude="aarch64_be-linux-user
           alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
           xtensa-linux-user $CROSS_SKIP_TARGETS"
+    - echo "make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-- 
2.37.2


