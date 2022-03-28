Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C304E993A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:19:40 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqDb-0005GI-9f
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:19:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxO-0001vD-VK
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxH-0004kF-7m
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHu35xixtOXF2QZwH4fi0BxlwmUduhoXGGqYHt4rBM0=;
 b=GtAW/i8YeB+YTCHhNGDiBUOAnfW0NJoUoy9+fTmSkygCFFWTCCF1W3MQ6O+G8OBk8gGJaU
 7rOo3iAWQoqiwMkMt455R+kETdphuL8v9N44a4bPMnH4x79xoP0UmMP0f0DcCyBZD53B9e
 C8tfcuvUoLQWKK84CueheDVaXMODGeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-dWSsC3FGMZOUG2B7TNV5Lg-1; Mon, 28 Mar 2022 10:02:42 -0400
X-MC-Unique: dWSsC3FGMZOUG2B7TNV5Lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EAAC100BABE;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35AAC1121321;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] tests/tcg: prepare Makefile.prereqs at configure time
Date: Mon, 28 Mar 2022 10:02:36 -0400
Message-Id: <20220328140240.40798-12-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List the dependencies of the build-tcg-tests-* and run-tcg-tests-*
targets in a Makefile fragment, without going through Makefile.prereqs's
"parsing" of config-*.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include     |  9 ++++++---
 tests/tcg/Makefile.prereqs | 18 ------------------
 tests/tcg/configure.sh     | 11 +++++++++--
 3 files changed, 15 insertions(+), 23 deletions(-)
 delete mode 100644 tests/tcg/Makefile.prereqs

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 05c534ea56..b5d0d6bc98 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -39,14 +39,17 @@ SPEED = quick
 # Build up our target list from the filtered list of ninja targets
 TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
+-include tests/tcg/Makefile.prereqs
+config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
+tests/tcg/Makefile.prereqs: config-host.mak
+
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
 RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
 
-# Probe for the Docker Builds needed for each build
-$(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
-	$(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
+$(foreach TARGET,$(TARGETS), \
+        $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
 $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
diff --git a/tests/tcg/Makefile.prereqs b/tests/tcg/Makefile.prereqs
deleted file mode 100644
index 9a29604a83..0000000000
--- a/tests/tcg/Makefile.prereqs
+++ /dev/null
@@ -1,18 +0,0 @@
-# -*- Mode: makefile -*-
-#
-# TCG Compiler Probe
-#
-# This Makefile fragment is included multiple times in the main make
-# script to probe for available compilers. This is used to build up a
-# selection of required docker targets before we invoke a sub-make for
-# each target.
-
-DOCKER_IMAGE:=
-
--include $(BUILD_DIR)/tests/tcg/config-$(PROBE_TARGET).mak
-
-ifneq ($(DOCKER_IMAGE),)
-build-tcg-tests-$(PROBE_TARGET): docker-image-$(DOCKER_IMAGE)
-endif
-$(BUILD_DIR)/tests/tcg/config_$(PROBE_TARGET).mak: config-host.mak
-config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index a17db8ce64..991b905354 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -80,6 +80,8 @@ fi
 : ${cross_as_tricore="tricore-as"}
 : ${cross_ld_tricore="tricore-ld"}
 
+makefile=tests/tcg/Makefile.prereqs
+: > $makefile
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -226,14 +228,17 @@ for target in $target_list; do
   echo "target=$target" >> $config_target_mak
   case $target in
     *-softmmu)
-      echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
+      qemu="qemu-system-$arch"
       ;;
     *)
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
+      qemu="qemu-$arch"
       ;;
   esac
 
+  echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
+  echo "QEMU=$PWD/$qemu" >> $config_target_mak
   echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
 
   got_cross_cc=no
@@ -329,6 +334,7 @@ for target in $target_list; do
           test -n "$container_image"; then
       for host in $container_hosts; do
           if test "$host" = "$cpu"; then
+              echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
               echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
               echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> \
                    $config_target_mak
@@ -340,6 +346,7 @@ for target in $target_list; do
                   echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
                       $config_target_mak
               fi
+              break
           fi
       done
       case $target in
-- 
2.31.1



