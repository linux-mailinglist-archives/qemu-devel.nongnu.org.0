Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877484E9901
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:09:43 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq3y-00026L-Ka
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:09:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxH-0001hN-RS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxE-0004jJ-S3
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbK8QjUPrfgHm0QyhWEuE6z/4sOVhMhCHwZYmGGLiAM=;
 b=fJv9McQwbpmFLBixQJrmHYgSvuPeH0juXxjommmhgG63zxbhzSb/miBVmcEQ9dU54bOH60
 2mopT+saYG1ZbnX7KqXXPcEUScwxb24YEJvRHqonsnkNbriiI4/iz2E6EI1RCm2xHLOPqL
 pBoCrGpPFI7OoO/ELKbpWANESGi8/9k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-n7UcMP5VNeq53QqjAg3IzQ-1; Mon, 28 Mar 2022 10:02:42 -0400
X-MC-Unique: n7UcMP5VNeq53QqjAg3IzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBB8A3C01C1E;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A2A1121320;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] tests/tcg: add compiler test variables when using
 containers
Date: Mon, 28 Mar 2022 10:02:33 -0400
Message-Id: <20220328140240.40798-9-pbonzini@redhat.com>
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

Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
This makes the TCG test makefiles oblivious of whether the compiler is
invoked through a container or not.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
 tests/tcg/aarch64/Makefile.target         | 10 +++++-----
 tests/tcg/configure.sh                    | 16 ++++++++++++++++
 tests/tcg/i386/Makefile.target            |  2 +-
 tests/tcg/ppc64/Makefile.target           |  4 ++--
 tests/tcg/ppc64le/Makefile.target         |  4 ++--
 6 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a7286ac295..f6fcd4829e 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -64,7 +64,7 @@ run-memory-replay: memory-replay run-memory-record
 
 EXTRA_RUNS+=run-memory-replay
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 pauth-3: CFLAGS += -march=armv8.3-a
 else
 pauth-3:
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index f7121cb4d8..6ad0ad49f9 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -18,7 +18,7 @@ run-fcvt: fcvt
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
 # Pauth Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
 run-pauth-%: QEMU_OPTS += -cpu max
@@ -27,7 +27,7 @@ endif
 
 # BTI Tests
 # bti-1 tests the elf notes, so we require special compiler support.
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
+ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1
 bti-1: CFLAGS += -mbranch-protection=standard
 bti-1: LDFLAGS += -nostdlib
@@ -36,12 +36,12 @@ endif
 AARCH64_TESTS += bti-2
 
 # MTE Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
+ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
+ifneq ($(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
 sysregs: CFLAGS+=-march=armv8.1-a+sve
@@ -88,7 +88,7 @@ EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE2),)
+ifneq ($(CROSS_CC_HAS_SVE2),)
 AARCH64_TESTS += test-826
 test-826: CFLAGS+=-march=armv8.1-a+sve2
 endif
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 84f928f7f8..0162b2f6c4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -350,5 +350,21 @@ for target in $target_list; do
               fi
           fi
       done
+      case $target in
+          aarch64-*)
+              echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              ;;
+          ppc*)
+              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              ;;
+          i386-linux-user)
+              echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              ;;
+      esac
   fi
 done
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index e1c0310be6..bd73c96d0d 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -30,7 +30,7 @@ hello-i386: LDFLAGS+=-nostdlib
 # test-386 includes a couple of additional objects that need to be
 # linked together, we also need a no-pie capable compiler due to the
 # non-pic calls into 16-bit mode
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_I386_NOPIE),)
+ifneq ($(CROSS_CC_HAS_I386_NOPIE),)
 test-i386: CFLAGS += -fno-pie
 
 test-i386: test-i386.c test-i386-code16.S test-i386-vm86.S test-i386.h test-i386-shift.h test-i386-muldiv.h
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 8197c288a7..babd209573 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -5,14 +5,14 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += mtfsf
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 9624bb1e9c..5b0eb5e870 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -4,12 +4,12 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64LE_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
-- 
2.31.1



