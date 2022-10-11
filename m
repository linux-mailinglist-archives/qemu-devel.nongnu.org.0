Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423245FBB75
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 21:42:36 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiL99-0002zn-0e
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKw3-0000b9-4a
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKw1-0005tW-Ab
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id n12so23100429wrp.10
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezs1Hyh0hWlLcWIDvOtpOQ/n9iXUQ7qwXkJ2IKy8wIM=;
 b=hhoxbrkFlVly7zWmrGDRvRUK/2ku/mF5vw9BgyleEqp+5LlpnzfPaaHQQZWWJ4tSaM
 5IV47R+vTDEOXPiV0IYKaHYxDseGCw5YzYcDLzuEGUrTBk8vo60aMCX78R/15JqqxPIF
 9/Pgi8e4nfsDyUhIRa5b4IhtJDuG4taz+VQs9cVfTn7wdpHU6od/bzSuts0sGXYgKJeo
 0iUWarTMzlINXdj0iEjXqgpwzv2DCgr3CJtnJ8qnqigAQ0RWZUNb0jMLtgGzDauWkSrZ
 YBU/LI66p4hY2ZQwW8Rv2ElGcRBejBVEzNwXIboCQlV56khntysubvNmzv406WZC82aq
 v8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezs1Hyh0hWlLcWIDvOtpOQ/n9iXUQ7qwXkJ2IKy8wIM=;
 b=xi0ApB6Fu+RbdMJUBLqpcnrRFDLVd2dRbU94yUSBGSdJjlqMxBqFzYT2JGTOtqVLQL
 6fKEnELMdmry3JwjlZPB+IbWoCKnXSHFiVGXqmxtd6tURGKTYmbQwGWE6AvX0FbBsyE+
 hmZAZzh0YCtVSPLF9Vd8i/rSUiGh8q8I7ku5Sg5kFEqe/6oUeh2rhFPrJClkQ/Q/rZsZ
 4ks9aibbbFP+KmjlX9e1Rm2uomvlojBw5FDxK9O7JBVJhlp1JAj+MRI8IQV529VStIgw
 GzgYUpEgEkBQ79eBQJjo0df3F7FbjbfSGXcFnFUMrqOpviOMChDtfuob9ZqURfzsCbby
 98yg==
X-Gm-Message-State: ACrzQf2Lb2egK8m4JvpiLpUGn/5bu97YnSZNSG2nGXw8LjA3gb3iRU5l
 Tvl2DWRxLIoG40sc3wt5mIxjRQ==
X-Google-Smtp-Source: AMsMyM5iwr1CUMP15LID/m1ZhKsTGp4INDWplrZTxeidp7LazxSRmBXFx2Aca5jhi3bxGJ7borObzQ==
X-Received: by 2002:a5d:6d86:0:b0:22e:4049:441f with SMTP id
 l6-20020a5d6d86000000b0022e4049441fmr16560361wrs.198.1665516539743; 
 Tue, 11 Oct 2022 12:28:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m11-20020adffa0b000000b00230b3a0f461sm4999284wrr.33.2022.10.11.12.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:28:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F0161FFB8;
 Tue, 11 Oct 2022 20:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 1/1] Revert "configure: build ROMs with container-based cross
 compilers"
Date: Tue, 11 Oct 2022 20:28:58 +0100
Message-Id: <20221011192858.956078-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011192858.956078-1-alex.bennee@linaro.org>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.

Unconditionally building all the bios for all arches was a little too
far too fast.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index baa69189f0..45ee6f4eb3 100755
--- a/configure
+++ b/configure
@@ -2121,7 +2121,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
-  test -n "$target_cc" || test -n "$container_image"
+  test -n "$target_cc"
 }
 
 write_target_makefile() {
@@ -2268,7 +2268,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "TOPSRC_DIR=$source_path" >> $config_mak
-    write_target_makefile pc-bios/optionrom/all >> $config_mak
+    write_target_makefile >> $config_mak
 fi
 
 if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
@@ -2276,31 +2276,25 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
-    write_target_makefile pc-bios/vof/all >> $config_mak
+    write_target_makefile >> $config_mak
 fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
 if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
-  got_cross_cc=no
-  if test -n "$target_cc"; then
-    write_c_skeleton
-    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
-    has_z900=$?
-    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
-      if [ $has_z900 != 0 ]; then
-        echo "WARNING: Your compiler does not support the z900!"
-        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
-      fi
-      got_cross_cc=yes
+  write_c_skeleton
+  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
+  has_z900=$?
+  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
+    if [ $has_z900 != 0 ]; then
+      echo "WARNING: Your compiler does not support the z900!"
+      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
     fi
-  fi
-  if test "$got_cross_cc" = yes || test -n "$container_image"; then
     roms="$roms pc-bios/s390-ccw"
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
+    write_target_makefile >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
     git_submodules="${git_submodules} roms/SLOF"
@@ -2488,7 +2482,7 @@ for target in $target_list; do
       ;;
   esac
 
-  if probe_target_compiler $target; then
+  if probe_target_compiler $target || test -n "$container_image"; then
       test -n "$container_image" && build_static=y
       mkdir -p "tests/tcg/$target"
       config_target_mak=tests/tcg/$target/config-target.mak
-- 
2.34.1


