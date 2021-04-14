Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4B35EF33
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:22:37 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWanE-0005S8-9h
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakf-0001zF-Nd
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakc-00050f-DL
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjRxy/bAOio8dKnD1KTL5hYISgvJMxOK3llzbZysLns=;
 b=Ig/5Z7VPSL5XfxIPkLVHB27C3/YkWvybNdyxbyN1Yl/cjGBewCvmMMv1GZ3fnzwxvt2Zhb
 rf3ZWL0QhX7m966ogbwMxxrpC11vPkhjk5MWwhHp+ckcHR24a7JeHul9Ox1QeTpnJDueMJ
 mjBFIfmJDunBtwPVoCavPmKWJn+KNZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-PqnmW1fBMr2jY8PWkxP7lA-1; Wed, 14 Apr 2021 04:19:49 -0400
X-MC-Unique: PqnmW1fBMr2jY8PWkxP7lA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465F3107ACCA;
 Wed, 14 Apr 2021 08:19:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 672045D9CA;
 Wed, 14 Apr 2021 08:19:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 5/5] gitlab-ci.d/crossbuilds.yml: Enable compilation with
 ccache
Date: Wed, 14 Apr 2021 10:19:07 +0200
Message-Id: <20210414081907.871437-6-thuth@redhat.com>
In-Reply-To: <20210414081907.871437-1-thuth@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ccache can speed up the compilation in some cases, so enable it for
our cross-compilation CI builds, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 017731a894..dee327a936 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,26 @@
+
+.ccache_cross_setup:
+  cache:
+    key: "$CI_JOB_NAME"
+    paths:
+      - ccache
+  before_script:
+    - mkdir -p ccache
+    - if command -v ccache ; then
+        export CCACHE_BASEDIR=${PWD} ;
+        export CCACHE_DIR=${PWD}/ccache ;
+        export CCACHE_MAXSIZE="1G" ;
+        if [ -e /usr/lib/ccache ]; then
+          export PATH=/usr/lib/ccache:$PATH ;
+        fi ;
+        if [ -e /usr/lib64/ccache ]; then
+          export PATH=/usr/lib64/ccache:$PATH ;
+        fi ;
+        ccache --zero-stats ;
+      fi
+
 .cross_system_build_job:
+  extends: .ccache_cross_setup
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -11,6 +33,7 @@
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - if command -v ccache ; then ccache --show-stats ; fi
 
 # Job to cross-build specific accelerators.
 #
@@ -18,6 +41,7 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $ACCEL_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  extends: .ccache_cross_setup
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
@@ -28,8 +52,10 @@
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build
+    - if command -v ccache ; then ccache --show-stats ; fi
 
 .cross_user_build_job:
+  extends: .ccache_cross_setup
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -39,6 +65,7 @@
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-system
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - if command -v ccache ; then ccache --show-stats ; fi
 
 cross-armel-system:
   extends: .cross_system_build_job
@@ -195,6 +222,7 @@ cross-win64-system:
         --target-list="cris-softmmu x86_64-softmmu microblaze-softmmu
           mipsel-softmmu mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
+    - if command -v ccache ; then ccache --show-stats ; fi
 
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
-- 
2.27.0


