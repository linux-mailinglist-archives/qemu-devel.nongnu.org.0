Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCA37BAF0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:40:32 +0200 (CEST)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmI3-0002D1-Vd
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8X-0000bH-Pz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8N-0000aD-Cz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d11so23064162wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k04YBeQVw1SV/5Xi/ZAFYyy3Jt24dK+QTEr9uqlEOFU=;
 b=bhERa/jn8Vq/kr2DB9xcfczWpUVJotIuK6C2IMsdhQ5hrWgQt11iSjoPGiA23yuWoY
 7XhkGCuxTJj1ORtSUfZvd9ybMMXLlt9SnNvd9i8JexrFXru2hvkY+HukCv/tYUI/tppl
 GLuGziv0hgsvdickfjMgT4SAePlmxaG4g7uTtiRr7Nb9BJ4pZVE+XJKBhJOiR9hpMe6d
 QvBgEiyYv9qLmd7suuRqJ4kg+3GdGzxbXtBwhRv6Vf0VmELCA3nZ6IXtt7HCSdKGdiIh
 g5Uo8e1lFe+LAjfOO0mAY3knT/6A145hnP5nC4ZvrUbbaGzuoTy4IIXfLsQ2HiWlXyIK
 gNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k04YBeQVw1SV/5Xi/ZAFYyy3Jt24dK+QTEr9uqlEOFU=;
 b=SwA3K0idSY2AQn1Aj/OVZFHQTfobPgV/2lxNGznJFg+HwB5Vm5RgM8q/xJxP5UmqNR
 ZKO/5R0GMjxFfqGq6/xlSUVXrj55zbTt8nzklQjhiSamQmqF4C3w6MXv7khFVtNeWi7o
 XWbUx/foVQHT8jJk5a5OvZKg6B92EmF+D1QBs9hzCMGiyuctfUebeN0Q5MgPYo7ylVf3
 XbnnQOPIZVksE3CW70CLrPuivlKkaC9489TwVN1/AO+GZqzKOiISu49RWZb96BaGGevb
 gfHvyVjdOaHDWMOYBX7TdQbgRE2asJwN0NYrIGIAwNJI1nx3ms28kGLIaqOgEYHNybZL
 H6ug==
X-Gm-Message-State: AOAM5303TTHUpmRbKIjQ6wnYmZrlF1o0yHwhdD0E7vzkwxj8Rn1VUanI
 hGdPuwDL3cakZqkm49+MDoLc0A==
X-Google-Smtp-Source: ABdhPJy9VKosVIN9JnNUlZpTLNKNyMHjgTjsPcBTwUkVdMn63c/iqQO+o3455ThlIc+d9fggfryXXQ==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr45625396wrt.14.1620815429320; 
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm6558416wmq.45.2021.05.12.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 358081FFB7;
 Wed, 12 May 2021 11:20:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 30/31] tests/tcg: don't allow clang as a cross compiler
Date: Wed, 12 May 2021 11:20:50 +0100
Message-Id: <20210512102051.12134-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are two problems.

The first is clang generates a preamble (that is always executed) to
stack xmm registers. This causes a ILLOP on the x86_64 softmmu tests
as SSE isn't enabled.

The second is the inline assembler in test-i386.c breaks clangs
compiler and I don't know how to fix it. Even with Theodore's patch
series (D5741445-7EFD-4AF1-8DB2-E4AFA93CBB1A@icloud.com) I still get
compiler failures.

For now lets just skip clang and allow it to fall back to the
containers which we know have compilers which work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 6627318adf..ed6492ce59 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -82,6 +82,9 @@ for target in $target_list; do
   container_cross_as=
   container_cross_ld=
 
+  # suppress clang
+  supress_clang=
+
   case $target in
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
@@ -119,6 +122,7 @@ for target in $target_list; do
       container_hosts=x86_64
       container_image=fedora-i386-cross
       container_cross_cc=gcc
+      supress_clang=yes
       ;;
     m68k-*)
       container_hosts=x86_64
@@ -186,6 +190,7 @@ for target in $target_list; do
       container_hosts="aarch64 ppc64el x86_64"
       container_image=debian-amd64-cross
       container_cross_cc=x86_64-linux-gnu-gcc
+      supress_clang=yes
       ;;
     xtensa*-softmmu)
       container_hosts=x86_64
@@ -200,6 +205,7 @@ for target in $target_list; do
 
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
+  echo "target=$target" >> $config_target_mak
   case $target in
     *-linux-user | *-bsd-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
@@ -219,21 +225,26 @@ for target in $target_list; do
   if eval test "x\${cross_cc_$arch}" != xyes; then
       eval "target_compiler=\${cross_cc_$arch}"
 
-      if has $target_compiler; then
-          write_c_skeleton
-          if ! do_compiler "$target_compiler" $target_compiler_cflags \
-                 -o $TMPE $TMPC -static ; then
-              # For host systems we might get away with building without -static
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                     -o $TMPE $TMPC ; then
+      if has "$target_compiler"; then
+          if test "$supress_clang" = yes &&
+                  $target_compiler --version | grep -qi "clang"; then
+              got_cross_cc=no
+          else
+              write_c_skeleton
+              if ! do_compiler "$target_compiler" $target_compiler_cflags \
+                   -o $TMPE $TMPC -static ; then
+                  # For host systems we might get away with building without -static
+                  if do_compiler "$target_compiler" $target_compiler_cflags \
+                                 -o $TMPE $TMPC ; then
+                      got_cross_cc=yes
+                      echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+                      echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+                  fi
+              else
                   got_cross_cc=yes
                   echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
                   echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
               fi
-          else
-              got_cross_cc=yes
-              echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-              echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
           fi
       fi
   fi
-- 
2.20.1


