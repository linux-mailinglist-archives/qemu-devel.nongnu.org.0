Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DB5F4580
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:30:28 +0200 (CEST)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiwE-0002fg-Oq
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhqX-0001Ny-Lz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq7-0001sS-L7
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n12so1703741wrp.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qMIvH//upoRJdnrFthamFbVxWHc0yjhMEDTF8ktkueE=;
 b=NdYQZmQBQc5jCvml1rIZwtLeWhr9XkDVNlItpyozwLxlxDdz6eEA/HtujIWORRB2bO
 jkfdKxZa7Bkkg2cVewokUkJnlvZ5DCyx6z7KmaCfLtBU0hrs8IBdYS4UYykv3qzQLq8N
 R4ih5TsnGQ70fSKEM6yrn534oQo3MTi+QzubugfIKJjZd0OwabQN0rm5aJDI2Hy3fwZD
 wCA5iA9yz2nIfFhYp/Da2lNqN2CPKhDpBN+udKoKrqYkJgRlRHUrzqGNz0Pbr1XK91Bo
 ynlgJ7nBb/k5MZPGmmAtLCAYkKerB2zjldjD7RPyVBHOfy0Cz9XTNWjtNQBWNjzp6jD7
 hvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qMIvH//upoRJdnrFthamFbVxWHc0yjhMEDTF8ktkueE=;
 b=YBNa7+ti5+ComzLWPQPJPJSCMiJWg4lqu6GogL6wMtLyT4JC0GEjE11yeazM0FGzWP
 SIAs4IwlXYxSSDNJy3PIrIE/R0Nh7CPhu8P2q22n4kawevtIxJ+ADLzwuAdZzEO/X4XZ
 i7vN/Hfa1sQ56iAHh01CFTpnsYM+gpeT+tJoecrlYZwuYRx3CI9Ey6M2rmCbY/+Hj5dg
 Kga6Z6/d1X/ERZ5eKtmyTO5gxgMFJTtE4hXLw/K8z+Y7oD3nGbYcbeTt9q606Ft3OAKs
 sjJqwJez8Nr0nWFwa1dPsQgUxoRDo/zhuvpzFYgIM7FuiEqBZd+Oj9RoUhmn16idIvba
 5nJg==
X-Gm-Message-State: ACrzQf3/stKcY3QL1tJifCY8Uf2X1uYWwWwlQGhnhvES2teazMiM3AOp
 7l+r8Yucjr/DTdm0z92VRBs3gV+VhDE+/w==
X-Google-Smtp-Source: AMsMyM7zk5ol+c65KdGzOQpbKxzxKioKJBee+zodqUf+oe+m1ZPaBLcwUPeFu6rvYjE5gIfv/A8LXg==
X-Received: by 2002:a5d:47cc:0:b0:22c:86fe:ad94 with SMTP id
 o12-20020a5d47cc000000b0022c86fead94mr16917848wrc.599.1664889600378; 
 Tue, 04 Oct 2022 06:20:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v3-20020adfebc3000000b0022cc5c03d07sm12005037wrn.53.2022.10.04.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 861991FFD0;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 28/54] configure: build ROMs with container-based cross
 compilers
Date: Tue,  4 Oct 2022 14:01:12 +0100
Message-Id: <20221004130138.2299307-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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
Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>

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


