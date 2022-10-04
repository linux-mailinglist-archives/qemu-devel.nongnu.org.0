Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FBA5F44F4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:59:19 +0200 (CEST)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiS6-0004za-9h
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgO-0007R8-Rj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgM-00008r-PC
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so7505386wmq.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MHbtMQn7BeHpxgqkJsPIt0RHY+yOQsgTrV/U36wTO+Y=;
 b=eozIfIsGkCNh6j6UaEkv9JCMk/NczefQ8wMwHXF9M6gh+KNsEEeuL2CAGZys7M4ju7
 /5bse6/gXvVdskyHoe3KQHe6dpfB4yBBD6jIuFmeQJJ4ewgJNbJDe7RilvC58Hu7KTRA
 /fRwxWot77VedAPHF6HErioKUhdaGAunpdQMoRPzVq0G/0OhpnA7NpVH75a2rGVFuQF5
 HPrvwmFKRHTeLU/OtyCewjRt8Clt3sHqBptvox8GZveFTSkgF7OYZnMxH6ZOmh18kC3D
 5e6QMk+u63ive5LSgXtORIYryq6zZCAjrB5/MdW0SdZwa7qi9jandTbtf47Lg+qyYrqu
 0zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MHbtMQn7BeHpxgqkJsPIt0RHY+yOQsgTrV/U36wTO+Y=;
 b=it6XA+aUNBG5t7JXRSSNkYHpIGM1BVrZ22ENKmPYFUOPHl/06F8qwx/9IhBjcrXH2G
 T4xEQy0OY66SY5o5+e96HfzKn0BnkjuR+XXPUO22g6jxkfHfTEJV/koaXUK4obADxk7D
 ZhRze2SaEHRdPDUxBVlV7zar9AgMV6TIbYRCeGbYlGDv1YHyadt1mS8SBe8uX5NK8Gmj
 y9bNbF1fTzEW45x7j68nv8uGJsHyiA3/pM7pjpro+D9pYejZjjqwTQiAkBrMFmaLXV9u
 Kq7n0w7rE32/RzJeLA4y6DapIGPbSlMHRiQ/t9dDOq3/liqRFXvPT9HgCKqmisiPrRtU
 sodQ==
X-Gm-Message-State: ACrzQf3QyQP2RbW3aPVbxluiZQfEk5lMrFyz/eYSGpDon9vQS/pYgEMr
 EG0B9gujdSCUrSiq5pU3IXuXFw==
X-Google-Smtp-Source: AMsMyM616Z1O7gcY6WasEGn+NlbZ0mOtyItXth+csDqut9ZK1EL3xMvBh5en2MWHybJ3hhU73a3vkw==
X-Received: by 2002:a05:600c:3781:b0:3b4:63c8:554b with SMTP id
 o1-20020a05600c378100b003b463c8554bmr10071190wmr.25.1664888996890; 
 Tue, 04 Oct 2022 06:09:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b003b7b36dcb8dsm10931602wmr.31.2022.10.04.06.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C7D21FFCE;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 25/54] configure: move tests/tcg/Makefile.prereqs to root build
 directory
Date: Tue,  4 Oct 2022 14:01:09 +0100
Message-Id: <20221004130138.2299307-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Message-Id: <20220929114231.583801-26-alex.bennee@linaro.org>

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


