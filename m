Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD15EF630
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:14:27 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtMv-0002b4-3G
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwF-0004ch-QV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwE-0001GL-2A
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x15so1259278wrv.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KtKYefRpdBrq386zGzvYj2i6PNAoiGDyuMR12lnFx6w=;
 b=rqrAGRWwh798cQ4UG9G57MXEytMZg00x2Lmlz2ITSanRZ8BSCzlhmFrjdPTHwVqO87
 nJO1lOwcDFv0kzZ0x3RhXKEeotpkNmBZQsifaNZF1YVg4TwsJNioiqNDDyDvaD7pKHss
 2IiFJFSbO5slV0aAgsZsqfyLQ3rCkdZT9TdDrRlTMa8BtPnNouxDUGjYspLuZ3ea5A16
 MreKPo/EKnHlj1/58HLdpdtR/ZWNjMDwbdM9r2iywgrmgDET58Vw9ZqQuMgSqjfjiysN
 u10iWM5IEZv9bJDtg07uYrGTaoj+n4Uh+2JxilJIYyrO79ypl59rf7ptetfUM+BeTJhK
 d7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KtKYefRpdBrq386zGzvYj2i6PNAoiGDyuMR12lnFx6w=;
 b=eqHI5U+8zkt9eNFmRv8uEymUFU8cGfml3nuIo0rJsOGxA2OAAyplalURDoq8Gp7KKg
 f0MJWlfMG+nQZYxLx/FOyBQynGTD8oBwl+jYVOQEv/8TDOPsSY2N9QqATK3YtK2RWvP6
 h2KEW7RboK5oIu6XdVo445XL5TxBPaiZcsSYpB4ZG3Inl/sNmNnGS1chuIRSKWT//Vxw
 ZW8JOfOZt8nkwkcLEx8mDWaNE2v8DRgc/YO6xM7U0sUOgZPlty3xYi8la4WpoFt1nzrE
 wnzH6ZXVMtuXNLno4mTed369ovt6gfh4DxoSa6gfIC20avc6hiFwOaoBD9NuU70PP3B4
 lFHg==
X-Gm-Message-State: ACrzQf0AGRmJsqJKrhDvsHNW1BXuw3b2Nz/yXRqHeAHfaHQNytJ64mCJ
 vFDb70UadWRiYgag5jLj7I85ww==
X-Google-Smtp-Source: AMsMyM4UyH2dUGlqIA94/lu5B90/eWJlPudlSwZXZ/B64sSYmYGXKs6AUBKAwlEZlZFHCLOE1G4PYA==
X-Received: by 2002:adf:d84e:0:b0:22c:ce81:7c26 with SMTP id
 k14-20020adfd84e000000b0022cce817c26mr1840729wrl.463.1664451764786; 
 Thu, 29 Sep 2022 04:42:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b4ac05a8a4sm5509180wmo.27.2022.09.29.04.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F61F1FFD0;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 28/51] configure: build ROMs with container-based cross
 compilers
Date: Thu, 29 Sep 2022 12:42:08 +0100
Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

s390-ccw remains a bit more complex, because the -march=z900 test is done
only for the native cross compiler.  Otherwise, all that is needed is
to pass the (now mandatory) target argument to write_target_makefile.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index c175650eb9..a54e17aca9 100755
--- a/configure
+++ b/configure
@@ -2152,7 +2152,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
-  test -n "$target_cc"
+  test -n "$target_cc" || test -n "$container_image"
 }
 
 write_target_makefile() {
@@ -2307,7 +2307,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "TOPSRC_DIR=$source_path" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/optionrom/all >> $config_mak
 fi
 
 if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
@@ -2315,25 +2315,31 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/vof/all >> $config_mak
 fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
 if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
-  write_c_skeleton
-  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
-  has_z900=$?
-  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
-    if [ $has_z900 != 0 ]; then
-      echo "WARNING: Your compiler does not support the z900!"
-      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+  got_cross_cc=no
+  if test -n "$target_cc"; then
+    write_c_skeleton
+    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
+    has_z900=$?
+    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
+      if [ $has_z900 != 0 ]; then
+        echo "WARNING: Your compiler does not support the z900!"
+        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+      fi
+      got_cross_cc=yes
     fi
+  fi
+  if test "$got_cross_cc" = yes || test -n "$container_image"; then
     roms="$roms pc-bios/s390-ccw"
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
     git_submodules="${git_submodules} roms/SLOF"
@@ -2554,7 +2560,7 @@ for target in $target_list; do
       ;;
   esac
 
-  if probe_target_compiler $target || test -n "$container_image"; then
+  if probe_target_compiler $target; then
       test -n "$container_image" && build_static=y
       mkdir -p "tests/tcg/$target"
       config_target_mak=tests/tcg/$target/config-target.mak
-- 
2.34.1


