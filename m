Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C45EF748
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:14:59 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduJW-00022l-Fh
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCx-0007Qb-7n
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCr-0004LZ-P7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id c11so1800017wrp.11
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ni3h4Ensb2+EbCS1w58timGRfCJrzPXBUuLWwhQJKIE=;
 b=s9/366AjJ+S9BIXNEDOXYJ5QKu8bTZDN+WUCJ0wRsNxTWBWxvv939/T8zFEOMKsTIj
 3y7AR0VxpEtLbF3kDyGT5aReyB1uGMJUrU1OI9L6W+pd0LrqHTgMaJ4Evq6p6Uj7hsuz
 upVkZmURETau+TnQi8xZbGJIx/UTedMfPQd0rBJVHsxcPu4YFtJl7EIp1AwxfjN7CkKF
 0dILer0xyfrVPBGvYkRbMNzGJjhqcnE633O879FqzubR8faGj0wBy3rp/VJ83kwN9B/p
 xtn9uZNymFaqromV7alKol1FVNzTGzZjX16dQ7LUg3NIS00Z0pfiTPlXMfaB1ZNGprEP
 E1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ni3h4Ensb2+EbCS1w58timGRfCJrzPXBUuLWwhQJKIE=;
 b=tpL4oyqaD0bi5zbT0RidYJ0SSd94tveGn3hXUb9MRgb3fFHcnVlooLxJ5GpGSi+OOx
 FIJbJK31q25JY5omYWWdYzmeULUIS4OMiVut1IB2dVk5becEy5jDwY8j5NU98o6dS2J9
 0rcGQOJVCn5cBA7oK97RNoMHjB3n2W0r11sdZHcbqkWkNRc1cj9mrLgtXM89H92X8VeI
 z3rneOWlfWgHP17Z70ReHrchFml8l5yj00s6wDXjPcYazrpzPXAAzzbU0fs3gPbPiToe
 t4oN0QW1wS/7ZCqQedirnDRndbYOmWt7OJqAgOu6R6sAU/XpGqkuTCJH402AT5iMyYW0
 LYaw==
X-Gm-Message-State: ACrzQf0B99tsqUCrfwFRShZA/eaZR7chFDZX5zC8o53e5f2VcdOj4alm
 bf4vum4sSFxv8TRs5+OGX/qonA==
X-Google-Smtp-Source: AMsMyM6Sy1xDcmGOVpEceKfKs/dkhrd5tNjxL9Sww9TG/VS96HJsRz6LAFqRpOQf1P08aQXs9HFlUQ==
X-Received: by 2002:adf:d0cd:0:b0:22b:1ade:7980 with SMTP id
 z13-20020adfd0cd000000b0022b1ade7980mr1905872wrh.265.1664452792167; 
 Thu, 29 Sep 2022 04:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r9-20020adfda49000000b002258235bda3sm6731971wrl.61.2022.09.29.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CC721FFCE;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 26/51] configure: unify creation of cross-compilation
 Makefiles
Date: Thu, 29 Sep 2022 12:42:06 +0100
Message-Id: <20220929114231.583801-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Let write_target_makefile handle both host and container cross compilers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 94 +++++++++++++++++++++++++------------------------------
 1 file changed, 43 insertions(+), 51 deletions(-)

diff --git a/configure b/configure
index cbeac99b2b..8b495d4453 100755
--- a/configure
+++ b/configure
@@ -2157,51 +2157,49 @@ probe_target_compiler() {
 
 write_target_makefile() {
   echo "EXTRA_CFLAGS=$target_cflags"
-  if test -n "$target_cc"; then
-    echo "CC=$target_cc"
-    echo "CCAS=$target_ccas"
-  fi
-  if test -n "$target_ar"; then
-    echo "AR=$target_ar"
-  fi
-  if test -n "$target_as"; then
-    echo "AS=$target_as"
-  fi
-  if test -n "$target_ld"; then
-    echo "LD=$target_ld"
-  fi
-  if test -n "$target_nm"; then
-    echo "NM=$target_nm"
-  fi
-  if test -n "$target_objcopy"; then
-    echo "OBJCOPY=$target_objcopy"
-  fi
-  if test -n "$target_ranlib"; then
-    echo "RANLIB=$target_ranlib"
-  fi
-  if test -n "$target_strip"; then
-    echo "STRIP=$target_strip"
-  fi
-}
-
-write_container_target_makefile() {
-  echo "$1: docker-image-$container_image" >> Makefile.prereqs
-  echo "EXTRA_CFLAGS=$target_cflags"
-  if test -n "$container_cross_cc"; then
-    echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
-    echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+  if test -z "$target_cc" && test -z "$target_as"; then
+    test -z "$container_image" && error_exit "Internal error: could not find cross compiler for $1?"
+    echo "$1: docker-image-$container_image" >> Makefile.prereqs
+    if test -n "$container_cross_cc"; then
+      echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+      echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    fi
+    echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
+    echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+    echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+    echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+    echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+    echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+    echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
+  else
+    if test -n "$target_cc"; then
+      echo "CC=$target_cc"
+      echo "CCAS=$target_ccas"
+    fi
+    if test -n "$target_ar"; then
+      echo "AR=$target_ar"
+    fi
+    if test -n "$target_as"; then
+      echo "AS=$target_as"
+    fi
+    if test -n "$target_ld"; then
+      echo "LD=$target_ld"
+    fi
+    if test -n "$target_nm"; then
+      echo "NM=$target_nm"
+    fi
+    if test -n "$target_objcopy"; then
+      echo "OBJCOPY=$target_objcopy"
+    fi
+    if test -n "$target_ranlib"; then
+      echo "RANLIB=$target_ranlib"
+    fi
+    if test -n "$target_strip"; then
+      echo "STRIP=$target_strip"
+    fi
   fi
-  echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
-  echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
-  echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
-  echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
-  echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
-  echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
-  echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
-
-
 ##########################################
 # check for vfio_user_server
 
@@ -2560,15 +2558,9 @@ for target in $target_list; do
       ;;
   esac
 
-  probe_target_compiler $target
-  if test $got_cross_cc = yes; then
-      write_target_makefile >> "$config_target_mak"
-  elif test -n "$container_image"; then
-      build_static=y
-      write_container_target_makefile build-tcg-tests-$target >> "$config_target_mak"
-      got_cross_cc=yes
-  fi
-  if test $got_cross_cc = yes; then
+  if probe_target_compiler $target || test -n "$container_image"; then
+      test -n "$container_image" && build_static=y
+      write_target_makefile "build-tcg-tests-$target >> "$config_target_mak"
       mkdir -p "tests/tcg/$target"
       ln -sf "$source_path/tests/tcg/Makefile.target" "tests/tcg/$target/Makefile"
       ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.mak"
-- 
2.34.1


