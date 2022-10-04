Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC85F4454
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:38:43 +0200 (CEST)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi8A-0007bU-K3
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgN-0007NU-4X
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgI-00008H-TD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so1659367wrp.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1wbzyVsrNixDoUvL/VKPckTR8bYZ6U3Uq3uU6HTglTE=;
 b=opqKd8QrN8gqA3s+BpAQ5Vf8OEYhgdufMMlr/U3KZwZ87/CYLmx5dozvdF24YjauVO
 KoCWsagjKItrbpZrXEqessDrGGtKvr32Q4m5hXL6XQuRHbJ4s4UNE+jNHflx7TiREt8x
 1DBuxsHN5vggw5KmuQkGZb0fGCrOqhZfwG9LR0QuIY91KIT/QhKkpURqiTbuZOlnW4nc
 2JcT4Wqvl6Gey6GF0h2IVAoVDslp2xevgMcLn/k4zEgQ410mp+aIeAabSVKSdgRLiJM/
 vyIjCmK3kYDRNpiYFb3swBkGlS8tZkiRN9dPs9mPnYYUuKQ5DyYnAyXYDnHqkjz8PCEd
 HpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1wbzyVsrNixDoUvL/VKPckTR8bYZ6U3Uq3uU6HTglTE=;
 b=yX7ACRdivicPWxyu2lnW2+LcuEUMWKKRCsvzuq0Ksgh5EMe/tuKTstQ+EzwH33qgtv
 3YzJLqnnP3tvz9024arIDlymCS271igL+nUoKQf9XHAh9fYaWBl7mA9Z1J+/GfESZzxf
 Ep0eioCf0FqrQnLMrnXeGq06shiueFQI8JD4mm0YrLIjA6RCBLWxarg0BNMInMSXQ1uK
 n9urrNPO5japmqTqyFwS+ouUiKHs6N7/AyVha88p+CvC5ei9EPicWu7DDqFptps88iUQ
 X7Wdr+43shmXrugpFchpunruwROekUd26F7WjyTg5kbz8Vu5lL0MIo33CjRk9mp8xbbM
 Zgkw==
X-Gm-Message-State: ACrzQf14ZLLenA3NoswgQQlGR0q5uz0WQfrG07H78XJ0kBZjPnP/1vPq
 /IYavmf/paaZr3WT2rbDMWa3Ew==
X-Google-Smtp-Source: AMsMyM6ITF6H4CqU3fhnhlFVT9A6N3Z+MoMnjxb9VrurpNlH1i1/GngswVBICX7fEPozc2OrSLw3ww==
X-Received: by 2002:a5d:64c7:0:b0:22e:43a6:2801 with SMTP id
 f7-20020a5d64c7000000b0022e43a62801mr5056523wri.612.1664888992304; 
 Tue, 04 Oct 2022 06:09:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfe890000000b0022e035a4e93sm11819128wrm.87.2022.10.04.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55B371FFCF;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 26/54] configure: unify creation of cross-compilation Makefiles
Date: Tue,  4 Oct 2022 14:01:10 +0100
Message-Id: <20221004130138.2299307-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Message-Id: <20220929114231.583801-27-alex.bennee@linaro.org>

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


