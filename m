Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2335FB34A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:21:57 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFCm-0003lR-BG
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWj-0004eO-E6
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWg-0004LH-II
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so7945395wmq.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UasiaWMFk+3cRGEOLzC0FA7Gpe5ajlIMpmUzmmfj7sM=;
 b=Fqii37gGrU88v3J8MJDIaQusWxyI0YgTw+ksh4EGtxsBTRVDkJBu3CmF2hVcux1qsu
 wG002qCYfmxIomKC+p5cBvHNtwG2DK7tVyNZQh8o/RuRZj6GOWC0VFt6RPUq6dmNWJXZ
 6MIEKcnPrCAWSaAoaNtL6GFSgj7TZHkMulLM4D7FsrlQMzL47YDVs4YSv2jNKxy5fyhN
 O+MKJgLsnfe6l4IFSyypNysgnQGQqw8VNjl4bejawbqJXCC4EaTECwF6PmExRssMyVAY
 dC22rfRqEVo9y5xuXClAVOa+6BRiovOJAk8TBsI7cbU2fjTP7wmiufNES+O9bmiHrED0
 CcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UasiaWMFk+3cRGEOLzC0FA7Gpe5ajlIMpmUzmmfj7sM=;
 b=rOl4zvswEb7mJpa0aQ82Yhebk3+yB2WgqoLoaudVDCBQTgEDkahT6d4y+yyBJyzymU
 kuLai8E6Dxjeqv7dE/qt8X9+V9qivS9VFtA8Y7avkFjiVtxoE6s5mhh/jliVdC1aMxxI
 gORlZWP2jhj5+NznB3BA9g9/gy73YqXELAn1AVhdUgZPYXg+tCM6ugRYrxsn9jIWYkSB
 9Hh8BcaVXSfG3lw1UjnyF1tOW4aFQM6Hvp4Rlh5SU7/jZYxC4mcz7x8CQV4kzwXCwIgj
 9ZL8b5+bAXNytOK29hXdGibj3NL0pH9szSuKbwUsRqH38g0vV4jLd8hz4WbcfoJFj8J9
 3bqg==
X-Gm-Message-State: ACrzQf2FIUrSGau0KBcZZx58Czoymz/7X98K5Iz0qio7wuFwq1VOmMj6
 f/41NH30p9OG8qkPLlBs74dRDQ==
X-Google-Smtp-Source: AMsMyM5T3LBtjUMJnJa/yukSmx/21We6kW3L9lu5MoWl6vf6Q3SrUVrd5RJihYx0xO6r40Lq+VDX2g==
X-Received: by 2002:a05:600c:19ce:b0:3b9:c36f:f9e2 with SMTP id
 u14-20020a05600c19ce00b003b9c36ff9e2mr16480985wmq.110.1665488060862; 
 Tue, 11 Oct 2022 04:34:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003a682354f63sm20250090wmq.11.2022.10.11.04.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C38121FFBB;
 Tue, 11 Oct 2022 12:34:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 3/4] Revert "configure: build ROMs with container-based
 cross compilers"
Date: Tue, 11 Oct 2022 12:34:16 +0100
Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011113417.794841-1-alex.bennee@linaro.org>
References: <20221011113417.794841-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
---
 configure | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

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


