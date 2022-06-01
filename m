Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BE53ACE5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:37:53 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTE8-0002dq-43
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrH-0002Gv-W7
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:16 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrG-0006b4-8T
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:15 -0400
Received: by mail-ed1-x52e.google.com with SMTP id c2so3292477edf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SggIrXO00sxHMAsPIste7YnBa0r2qAGuzdNu5DhkgtY=;
 b=pF7paceUQAvC16W+HqVltakNJbc7grhwTFF3+MLs/KBoauD0ttEGJ1/qbKSOwF22wE
 kGlAxu870u6OYLlSRmgbo9uDcHZA20j9RB3iExH7/KvdPG6zk0sD/7xsNopIExAXJBnm
 nqPks8yZvitp7vWs4pT7u3FM/MHPh9JcUb+nIxWe6SfD1OYe+avrBNh38V/ksOx6aMNC
 FWHIlQBncTiWTjaS+RrdfMfK6Ht/iI70jbYecX0qNRcnBbibBTt8PwpQAq23gN1Zhv1c
 ZpitU6PRkZP3KoPhM3I22WJiVRV+qA+2rbwIYG3Si1YVWlRQ+FnJoPpwGhOcGdKHkcNf
 cBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SggIrXO00sxHMAsPIste7YnBa0r2qAGuzdNu5DhkgtY=;
 b=leYT7BTmU37nUZzEFL9Pomah9MpXrwVRDwxSjOwWFnoYUiCaJPET62qJ8ZV9uVKbJm
 xLslviMVyjNcdTifxNvsse9gHpoeIBlfKy/Msl51Bil7uwY0RHfezmyZrUzQ0TbSXm3B
 QwXWJGFO4ImcWym1e7bLKPEx8J5dTmnOOhR0j9WYxaoGfQlqn7kVNPqKvbUtLYFWxgCp
 NZZR26p+n4EyehKl31TnnvDLjFmXUtxbMuCvGUQ34/Y3p6jUsxvJQSSfA56tN6NvEd/l
 3+lKkKOpdsF+/N7809bVkgXBtMpK6QJsS2Wk627igBOEOs6HAPjp5T9dFhYBa2FBtdym
 P48g==
X-Gm-Message-State: AOAM53309BMKEgY55Spvh3Y5P4N1I1icrlh3PAh1Jkm917KLYBSvVDpb
 J7DBiIUINx/SIQYd1RQ44Z+E9A==
X-Google-Smtp-Source: ABdhPJy+dlvZeTUhWIn3a/Emra4D5qgPOShGAehSYPJGTfwG4JKF9v0q2nx0EeTTBcP2Rx8IQhORzQ==
X-Received: by 2002:a05:6402:524a:b0:42d:fb80:f734 with SMTP id
 t10-20020a056402524a00b0042dfb80f734mr1072128edd.153.1654107252959; 
 Wed, 01 Jun 2022 11:14:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a170906524300b006fee16142b9sm954987ejm.110.2022.06.01.11.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA88B1FFCD;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/33] configure: include more binutils in tests/tcg makefile
Date: Wed,  1 Jun 2022 19:05:26 +0100
Message-Id: <20220601180537.2329566-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
Message-Id: <20220527153603.887929-23-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f55ae82a5d..ced8283b98 100755
--- a/configure
+++ b/configure
@@ -1880,11 +1880,21 @@ probe_target_compiler() {
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
@@ -2023,8 +2033,13 @@ probe_target_compiler() {
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
@@ -2035,12 +2050,26 @@ probe_target_compiler() {
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
@@ -2056,6 +2085,10 @@ probe_target_compiler() {
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
@@ -2063,14 +2096,32 @@ write_target_makefile() {
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


