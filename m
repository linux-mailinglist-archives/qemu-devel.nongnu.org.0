Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DE32F107
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:21:11 +0100 (CET)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE8U-0003lh-RL
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp3-0003c4-57
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:05 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:43366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp0-00012l-1Z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQBs9qsVMZTlQkmVmn+vW/hy18QmAy2icTy6HMQKaUY=; b=F7dWRiboXHfcP/tlOvvhiFsfHr
 aGV5IXldIXqGqygb49EGueuUdBQGPK5iSV53BP9Y1jT/+i1MnhhQUt2RhAKA89sxkC8Y+uicweWf3
 +7TQp/lGL4vd5ACTt0U98sEATFopnGko3typhqKe9QLKlc+FctTSjn1FHpi9yq5ufoHs=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/15] tests/tcg: Add docker_as and docker_ld cmds
Date: Fri,  5 Mar 2021 18:00:31 +0100
Message-Id: <20210305170045.869437-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601040, da=102572721,
 mc=529, sc=4, hc=525, sp=0, fso=30601040, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least for the TriCore target no easily available c compiler exists.
Thus we need to rely on "as" and "ld". This allows us to run them
through the docker image as well as with locally installed tools.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
v2 -> v3:
    - emit CROSS_LD_GUEST/CROSS_AS_GUEST

 tests/tcg/Makefile.qemu | 15 +++++++++++++++
 tests/tcg/configure.sh  | 20 ++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index a56564660c..fefb50903d 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -22,6 +22,8 @@ quiet-@ = $(if $(V),,@)
 quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
 CROSS_CC_GUEST:=
+CROSS_AS_GUEST:=
+CROSS_LD_GUEST:=
 DOCKER_IMAGE:=
 
 -include tests/tcg/config-$(TARGET).mak
@@ -42,6 +44,7 @@ cross-build-guest-tests:
 	$(call quiet-command, \
 	   (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	    $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC="$(CROSS_CC_GUEST)" \
+			AS="$(CROSS_AS_GUEST) LD="$(CROSS_LD_GUEST)" \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=$(CROSS_CC_GUEST_STATIC) \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
@@ -59,11 +62,23 @@ DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc \
 		-i qemu/$(DOCKER_IMAGE) \
 		-s $(SRC_PATH) -- "
 
+DOCKER_AS_CMD="$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_AS_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- "
+
+DOCKER_LD_CMD="$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_LD_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- "
+
+
 .PHONY: docker-build-guest-tests
 docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
 	$(call quiet-command, \
 	  (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	   $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC=$(DOCKER_COMPILE_CMD) \
+			AS=$(DOCKER_AS_CMD) LD=$(DOCKER_LD_CMD) \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=y \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 36b8a73a54..4da8c3fa12 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -72,6 +72,12 @@ fi
 : ${cross_cc_x86_64="x86_64-pc-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
+# cross as defaults, can be overridden with --cross-as-ARCH
+: ${cross_as_tricore="tricore-as"}
+
+# cross ld defaults, can be overridden with --cross-ld-ARCH
+: ${cross_as_tricore="tricore-ld"}
+
 for target in $target_list; do
   arch=${target%%-*}
   case $arch in
@@ -228,6 +234,18 @@ for target in $target_list; do
     fi
     echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
 
+    eval "target_as=\${cross_as_$i}"
+    if has $target_as; then
+      echo "CROSS_AS_GUEST=$target_as" >> $config_target_mak
+      continue
+    fi
+
+    eval "target_ld=\${cross_ld_$i}"
+    if has $target_ld; then
+      echo "CROSS_LD_GUEST=$target_ld" >> $config_target_mak
+      continue
+    fi
+
     # Test for compiler features for optional tests. We only do this
     # for cross compilers because ensuring the docker containers based
     # compilers is a requirememt for adding a new test that needs a
@@ -261,5 +279,7 @@ for target in $target_list; do
   if test $got_cross_cc = no && test "$container" != no && test -n "$container_image"; then
     echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
     echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
+    echo "DOCKER_CROSS_AS_GUEST=$container_cross_as" >> $config_target_mak
+    echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> $config_target_mak
   fi
 done
-- 
2.30.1


