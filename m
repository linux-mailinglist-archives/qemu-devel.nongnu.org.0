Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C45365C0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:10:51 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucY6-0001Fl-Lh
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8d-0003eq-3j
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8V-0003sJ-Ez
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so770845wrb.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2W6nFMdip0BFj68tLs4VAS7AjkWibVEYAvZdaf7+QA=;
 b=kE0u781OXhsYMDsPtbmwE/G/CLofhSqzZYIBEndaIExYTS4SfxUbOc7JEoxCzUfbzf
 IMUw3fhDDnHU0FJz9+NypQg8gWfbEEv0npKd4HFSCHA5FFpECbex1jD/kTtnVFGM8Xmm
 RAWfy6H8kI2coYvCleAnF3bZUMj9/qKWthtjvYINjeZapRju0+3tl8ca3veyZa8qaiLh
 e0jTZSoNgjHC3YUsYNThYTqRZzshrhZGv3hQCloaJh+qRYbjBaYJYOyEyG2M8lH0jsp2
 QCXT4xpoaBVnbr4lRTceBVoFIzeVAVI9mRDTY9CwScZyAYPsWvagjqEydTKmvan7HEVf
 oOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2W6nFMdip0BFj68tLs4VAS7AjkWibVEYAvZdaf7+QA=;
 b=tFjwpUOoI0bvC88wTOXSkmJTDk8hn6qIJkTvDV5NBk5ZnIF8NfrjlDlN1Zl9yVrdtU
 RiqOoXqcssBdPMyqzwzvuI5IOGWUdhJp/ZBaRBlMfIlASEQ7xqH6Uo5l6jE6TQiAlLQq
 apdNIwianqqzfd8UyqbOwW23mZeKsacWXbkK+BIHeWvPB+8Aew8mkMTIz+VQwRwUwnbP
 HeeeHcISAGdIKY7msLeWhar9J+TsWD/VMpb1igCUz9OtI+DbMwIHc5k/KdXc74yvxSdM
 R3Ya+rjWXUKJx7sRV+XvK/WpNLYqHCk7pVvlYDNV0iLXoiNniQ3zpjBDOHxQSdLiE7wy
 l0+Q==
X-Gm-Message-State: AOAM531F3YvpD7hW0vS0RhpS9BWe43K+M8eU/zl3aDSy38lFrl/mHnhL
 zUOkuN2lvOJn0xw7Yg2Nrvg0JQ==
X-Google-Smtp-Source: ABdhPJwKhsD6Ujg3bgEHSEzaB8lF4RIAyMxZ5KcHbNK0M0N+LDEXDr/jo/A/p4C5uI1kgmR56wfRvw==
X-Received: by 2002:a5d:4492:0:b0:20d:740:beb9 with SMTP id
 j18-20020a5d4492000000b0020d0740beb9mr35409740wrq.179.1653666262183; 
 Fri, 27 May 2022 08:44:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bc5da000000b00397473ae25esm2445281wmk.34.2022.05.27.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9DC71FFCE;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 22/33] configure: include more binutils in tests/tcg
 makefile
Date: Fri, 27 May 2022 16:35:52 +0100
Message-Id: <20220527153603.887929-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Firmware builds require paths to all the binutils; it is not enough to
use only cc, or even as/ld as in the case of tests/tcg/tricore.
Adjust the cross-compiler configurator to detect also ar, nm, objcopy,
ranlib and strip.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-12-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/configure b/configure
index c2b16c17b9..b8c21e096c 100755
--- a/configure
+++ b/configure
@@ -1875,11 +1875,21 @@ probe_target_compiler() {
   container_image=
   container_hosts=
   container_cross_cc=
+  container_cross_ar=
   container_cross_as=
   container_cross_ld=
+  container_cross_nm=
+  container_cross_objcopy=
+  container_cross_ranlib=
+  container_cross_strip=
   target_cc=
+  target_ar=
   target_as=
   target_ld=
+  target_nm=
+  target_objcopy=
+  target_ranlib=
+  target_strip=
 
   case $1 in
     aarch64) container_hosts="x86_64 aarch64" ;;
@@ -2018,8 +2028,13 @@ probe_target_compiler() {
         ;;
     esac
     : ${container_cross_cc:=${container_cross_prefix}gcc}
+    : ${container_cross_ar:=${container_cross_prefix}ar}
     : ${container_cross_as:=${container_cross_prefix}as}
     : ${container_cross_ld:=${container_cross_prefix}ld}
+    : ${container_cross_nm:=${container_cross_prefix}nm}
+    : ${container_cross_objcopy:=${container_cross_prefix}objcopy}
+    : ${container_cross_ranlib:=${container_cross_prefix}ranlib}
+    : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
   eval "target_cflags=\${cross_cc_cflags_$1}"
@@ -2030,12 +2045,26 @@ probe_target_compiler() {
   else
     compute_target_variable $1 target_cc gcc
   fi
+  target_ccas=$target_cc
+  compute_target_variable $1 target_ar ar
   compute_target_variable $1 target_as as
   compute_target_variable $1 target_ld ld
+  compute_target_variable $1 target_nm nm
+  compute_target_variable $1 target_objcopy objcopy
+  compute_target_variable $1 target_ranlib ranlib
+  compute_target_variable $1 target_strip strip
   if test "$1" = $cpu; then
     : ${target_cc:=$cc}
+    : ${target_ccas:=$ccas}
     : ${target_as:=$as}
     : ${target_ld:=$ld}
+    : ${target_ar:=$ar}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+    : ${target_nm:=$nm}
+    : ${target_objcopy:=$objcopy}
+    : ${target_ranlib:=$ranlib}
+    : ${target_strip:=$strip}
   fi
   if test -n "$target_cc"; then
     case $1 in
@@ -2051,6 +2080,10 @@ probe_target_compiler() {
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
+    echo "CCAS=$target_ccas"
+  fi
+  if test -n "$target_ar"; then
+    echo "AR=$target_ar"
   fi
   if test -n "$target_as"; then
     echo "AS=$target_as"
@@ -2058,14 +2091,32 @@ write_target_makefile() {
   if test -n "$target_ld"; then
     echo "LD=$target_ld"
   fi
+  if test -n "$target_nm"; then
+    echo "NM=$target_nm"
+  fi
+  if test -n "$target_objcopy"; then
+    echo "OBJCOPY=$target_objcopy"
+  fi
+  if test -n "$target_ranlib"; then
+    echo "RANLIB=$target_ranlib"
+  fi
+  if test -n "$target_strip"; then
+    echo "STRIP=$target_strip"
+  fi
 }
 
 write_container_target_makefile() {
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
+  echo "AR=\$(DOCKER_SCRIPT) cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
   echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
   echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  echo "NM=\$(DOCKER_SCRIPT) cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+  echo "OBJCOPY=\$(DOCKER_SCRIPT) cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+  echo "RANLIB=\$(DOCKER_SCRIPT) cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+  echo "STRIP=\$(DOCKER_SCRIPT) cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
 
-- 
2.30.2


