Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33355EF718
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:03:18 +0200 (CEST)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odu8D-0003fg-I5
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3C-0000N8-7O
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods39-0002Nh-LF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id v28so1797831wrd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bFMnPZI39K0sB6qljzVqyj/PiofPOyUCvNvoHy9FtII=;
 b=H2Y/5hKOM+NSy48gfZkRDqv2/blKE764JkctH3C0hh30XbmeFWnFyd/d6rtAOuONOy
 tYBleGGc900bBPY5BqX1n+QWQDvuNnYpI0oCiHeXHBIUnHPJVOvWC9lQQhhZ16HY675Z
 l25qlJ4iFKnzp9pnWobUS0Pf26pRvF8IGMRSoovq0jni72Ja2u6uXHAmWUVhkjQNjPFd
 QwctNTCvU6P1SxilnXdnerjdb4KKrl0EpC1Wdo3eNNiPrTh7jlYXPtUJN7j7QLjfY3SY
 2uDWGPmqC+Z/0laQJxutbGHuq+MlUR38LZFkrRh9Tf32OqOwycj4GFShXCOi2te/ANlI
 O5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bFMnPZI39K0sB6qljzVqyj/PiofPOyUCvNvoHy9FtII=;
 b=ejV9HZIAObCs48bE2J0bDIVAgGrHm1FYmftax7V4IZCX16x+ImRPNJtnQMiYwZhY9l
 3cVX5lHtI4KFyvaCIVNfWR/Cn477TRS09unOUKXsfoomQ+5KSG2S53dMbLQtgeQrFONc
 mxD5cTSiyKXH8OIdjLwEXcehRy7nIz1zPMUGOEIw0y9yZ4O7Yiwy4MpmGQKTEKw6TN08
 kC1yHkqHl2asrr2nBHPrTBUpzdwp7tmrTagWkcOlsh6yE2b95G+d6XvyHvKfVLFG8ftA
 meqrXH0xncK6dpadMnpu3zj1ojtnTDjkefwvvlfz/SxQtS1zf3+s3iPlxNEDOOPG2uSQ
 XJsA==
X-Gm-Message-State: ACrzQf0wxc2nSBFHISnva6Ym95GjL+yzGl26FB5dbJik4ReGIpycUjaj
 H/M2H7pNGx2qqoR9Gl3Oh871a29P6t6H2w==
X-Google-Smtp-Source: AMsMyM44uf9qbEgVrPP1ZkciFWWUZEJcvRYE3prOpi3G59BpAEIG/x7X7FQZMKGSw6ZE9q6BSzAw3g==
X-Received: by 2002:adf:ed50:0:b0:22c:c749:8b81 with SMTP id
 u16-20020adfed50000000b0022cc7498b81mr1925896wro.644.1664452194283; 
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600c150400b003a5c999cd1asm4909352wmg.14.2022.09.29.04.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 359E51FFBB;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 25/51] configure: move tests/tcg/Makefile.prereqs to root
 build directory
Date: Thu, 29 Sep 2022 12:42:05 +0100
Message-Id: <20220929114231.583801-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It will not be specific to tests/tcg anymore, since it will be possible to
build firmware using container-based cross compilers too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure              | 15 +++++++--------
 Makefile               |  5 ++++-
 tests/Makefile.include |  3 ---
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index ceb1213292..cbeac99b2b 100755
--- a/configure
+++ b/configure
@@ -2185,6 +2185,7 @@ write_target_makefile() {
 }
 
 write_container_target_makefile() {
+  echo "$1: docker-image-$container_image" >> Makefile.prereqs
   echo "EXTRA_CFLAGS=$target_cflags"
   if test -n "$container_cross_cc"; then
     echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
@@ -2297,6 +2298,8 @@ for f in $LINKS ; do
     fi
 done
 
+echo "# Automatically generated by configure - do not modify" > Makefile.prereqs
+
 # Mac OS X ships with a broken assembler
 roms=
 if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
@@ -2524,10 +2527,7 @@ if test "$safe_stack" = "yes"; then
 fi
 
 # tests/tcg configuration
-(makefile=tests/tcg/Makefile.prereqs
-echo "# Automatically generated by configure - do not modify" > $makefile
-
-config_host_mak=tests/tcg/config-host.mak
+(config_host_mak=tests/tcg/config-host.mak
 mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
@@ -2565,8 +2565,7 @@ for target in $target_list; do
       write_target_makefile >> "$config_target_mak"
   elif test -n "$container_image"; then
       build_static=y
-      echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-      write_container_target_makefile >> "$config_target_mak"
+      write_container_target_makefile build-tcg-tests-$target >> "$config_target_mak"
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
@@ -2576,11 +2575,11 @@ for target in $target_list; do
       echo "TARGET=$target" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
-      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
 done
-echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile)
+echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak)
 
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
diff --git a/Makefile b/Makefile
index 0fcde48bec..357592ad39 100644
--- a/Makefile
+++ b/Makefile
@@ -42,6 +42,9 @@ configure: ;
 ifneq ($(wildcard config-host.mak),)
 include config-host.mak
 
+include Makefile.prereqs
+Makefile.prereqs: config-host.mak
+
 git-submodule-update:
 .git-submodule-status: git-submodule-update config-host.mak
 Makefile: .git-submodule-status
@@ -217,7 +220,7 @@ qemu-%.tar.bz2:
 
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak qemu-bundle
+	rm -f config-host.mak Makefile.prereqs qemu-bundle
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9ed67721e2..9422ddaece 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -36,9 +36,6 @@ export SRC_PATH
 
 SPEED = quick
 
--include tests/tcg/Makefile.prereqs
-tests/tcg/Makefile.prereqs: config-host.mak
-
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
-- 
2.34.1


